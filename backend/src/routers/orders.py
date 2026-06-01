from datetime import datetime
from typing import Annotated, List
from fastapi import APIRouter, Depends, HTTPException, Request
from sqlalchemy import text, Connection
from backend.src.schema.history import HistoryItem

from backend.src.db.session import get_db
from backend.src.schema.order import (
    CreateOrderRequest,
    CreateOrderResponse,
    OrderStatusUpdate,
    VALID_STATUSES,
    OrderLineRequest,
    QueueOrderResponse,
    QueueOrderLineResponse,
)
import asyncio
import json
from sse_starlette import EventSourceResponse


route = APIRouter()

added_items = {}

"""Queue shit----------------------------------------------------"""
stall_streams: dict[int, asyncio.Queue] = {}

@route.get("/queue/{stall_id}/stream")
async def stream_generator(stall_id : int, request : Request):
    
    queue = asyncio.Queue()
    stall_streams[stall_id] = queue
    
    async def event_generator():
        
        try:
            while True:

                if await request.is_disconnected():
                    break
                
                try:
                    
                    queue_data = await asyncio.wait_for(queue.get(), timeout=30)
                    
                    yield {"event": queue_data.get("event"), "data" : json.dumps(queue_data.get("data"))}
                    
                except asyncio.TimeoutError():
                    
                    yield {"event": "heartbeat", "data" : "ping"}

        finally:
            
            stall_streams.pop(stall_id, None)
            
    return EventSourceResponse(event_generator())
         
@route.get(
	"/preparing_queue/{stall_id}",
	response_model=List[HistoryItem],
	responses={
		404: {"description": "Stall not found"},
	},
)
async def get_pending_queue(stall_id: int, db: Annotated[Connection, Depends(get_db)]):
    
    return await get_queue_helper(stall_id, "Pending", db)

@route.get(
	"/queue/{stall_id}",
	response_model=List[HistoryItem],
	responses={
		404: {"description": "Stall not found"},
	},
)
async def get_preparing_queue(stall_id: int, db: Annotated[Connection, Depends(get_db)]):

    return await get_queue_helper(stall_id, "Preparing", db)

async def get_queue_helper(stall_id: int, query_type: str,db: Connection):
    
    query = text("""
        SELECT stall_id 
        FROM stall 
        WHERE stall_id = :s_id
        """)
    stall_exists = db.execute(query, {"s_id": stall_id}).mappings().fetchone()

    if not stall_exists:
        raise HTTPException(status_code=404, detail="Stall not found")
    
    get_rows_query = text("""
                    
        SELECT order_id, order_number, customer_name
        FROM orders

        WHERE stall_id = :s_id AND order_status = :o_status
        ORDER BY order_time ASC
        """)

    try:
        rows = db.execute(get_rows_query, {"s_id": stall_id, "o_status": query_type}).mappings().fetchall()

        if not rows:
            raise HTTPException(status_code=204, detail=f"Currently no orders.")

    except Exception as error:
        raise HTTPException(status_code=500, detail=f"Error: {str(error)}") 

    return [
        HistoryItem(
            order_id=row["order_id"],
            order_number=row["order_number"],
            customer_name=row["customer_name"]
        )
        for row in rows
    ]
    
"--------------------------------------------------------------"            
            
@route.post(
    "/create_order",
    response_model=CreateOrderResponse,
    status_code=201,
    responses={
        400: {"description": "Bad Request - stall is closed"},
        404: {"description": "Stall not found"},
        500: {"description": "Could not place order"}
    },
)
async def Create_Order(payload: CreateOrderRequest, db: Annotated[Connection, Depends(get_db)]):
    
    verification_query = text("""

        SELECT stall_id, stall_status 
        FROM stall WHERE stall_id = :s_id
        """)
    
    try: 
        stall_row = db.execute(verification_query ,{"s_id": payload.stall_id}).mappings().fetchone()

    except Exception as error:
        
        raise HTTPException(status_code=404, detail="Stall not found")

    if not stall_row["stall_status"]:
        
        raise HTTPException(status_code=400, detail="Stall is currently closed")

    order_number = f"STL{str(payload.stall_id)}-{datetime.now().strftime('%H.%S.%M')}"
    
    insert_query = text("""
                        
        INSERT INTO orders (stall_id, order_number,order_status, customer_name)
        VALUES (:stall_id, :o_number,'Pending', :customer_name)
        """)
    
    try:
        result = db.execute(insert_query,    
                {
                "stall_id": payload.stall_id,
                "o_number": order_number,
                "customer_name": payload.customer_name,
                })

        order_id = result.lastrowid
        db.commit()
        
        
        updated_queue = await get_queue_helper(payload.stall_id, "Pending", db)
        if payload.stall_id in stall_streams:
            await stall_streams[payload.stall_id].put({
                
                "event" : "Order Added in Pending Queue",
                "queue" : updated_queue
            })
        
    except Exception as error:
        
        db.rollback()
        raise HTTPException(status_code=500, detail=f"Could not place order: {str(error)}") from error

    return CreateOrderResponse(
        
        order_id=order_id,
        order_number=order_number,
        order_status="Pending",
        message="Order placed successfully! Please add items to your order.",
    )

@route.post(
    "/{order_id}/items",
    response_model=dict,
    status_code=201,
    responses={
        400: {"description": "Bad Request - invalid product or order already submitted"},
        404: {"description": "Order or product not found"},
        500: {"description": "Could not add items to order"}
    },
)
async def add_items_to_order(
    order_id: int,
    payload: List[OrderLineRequest],
    db: Annotated[Connection, Depends(get_db)],
):
    # Verify order exists and is in pending state
    query = text("""
                              
        SELECT order_id, stall_id, order_status
        FROM orders WHERE order_id = :o_id
        """)
    
    try: 
        order_row = db.execute(query, {"o_id": order_id}).mappings().fetchone()

    except Exception:
        
        raise HTTPException(status_code=404, detail="Order not found")

    if not order_row:
        raise HTTPException(status_code=404, detail="Order not found")

    # Check if order can still accept items (must be in Pending state)
    if order_row["order_status"] != "Pending":
        raise HTTPException(
            status_code=400,
            detail=f"Cannot add items to order with status '{order_row['order_status']}'. Order must be in 'Pending' state.",
        )

    stall_id = order_row["stall_id"]
    
    # Initialize global items list for this order if it doesn't exist
    if order_id not in added_items:
        added_items[order_id] = []

    # Process each item in the list
    for item in payload:
        
        # Verify product exists and belongs to this stall
        query = text("""
                     
            SELECT p.product_id, p.product_name, p.product_price, p.product_status
            FROM product p
            JOIN product_category pc ON pc.category_id = p.category_id
            WHERE p.product_id = :p_id
            AND pc.stall_id = :s_id
            AND p.product_status = 1  
            """)
        
        try:
            product_row = db.execute(query, {"p_id": item.product_id, "s_id": stall_id}).mappings().fetchone()

        except Exception:
            raise HTTPException(
                status_code=404,
                detail=f"Product {item.product_id} not found or is unavailable for this stall",
            )

        if not product_row:
            raise HTTPException(
                status_code=404,
                detail=f"Product {item.product_id} not found or is unavailable for this stall",
            )
        
        # Append to global items array - accumulates across multiple add_items calls
        added_items[order_id].append({
            
            "product_id": item.product_id,
            "product_name": item.product_name,
            "quantity_ordered": item.quantity_ordered,
            "unit_price_at_order": item.unit_price_order,
        })
    
    return {
        
        "order_id": order_id,
        "items_added": len(added_items[order_id]),
        "items": added_items[order_id],
        "message": f"Successfully validated items. Total items for this order: {len(added_items[order_id])}."
    }

@route.post(
    "/{order_id}/submit",
    responses={
        400: {"description": "Bad Request - invalid order state or no items"},
        404: {"description": "Order not found"},
        500: {"description": "Could not submit order"}
    },
)
async def submit_order(order_id: int, payload: dict, db: Annotated[Connection, Depends(get_db)]):

    query = text("""
                 
        SELECT order_id, order_status, stall_id
        FROM orders 
        WHERE order_id = :o_id
        """)
    
    try:
        order_row = db.execute(query, {"o_id": order_id}).mappings().fetchone()

    except Exception:
        raise HTTPException(status_code=404, detail="Order not found")

    if not order_row:
        raise HTTPException(status_code=404, detail="Order not found")

    if order_row["order_status"] != "Pending":

        raise HTTPException(
            status_code=400,
            detail=f"Cannot submit order with status '{order_row['order_status']}'. Order must be in 'Pending' state.",
        )

    items = payload.get("items", [])
    
    if not items or len(items) == 0:
        raise HTTPException(
            status_code=400,
            detail="Please add at least one item.",
        )

    try:
        
        for item in items:

            insert_query = text("""

                INSERT INTO order_line (order_id, product_id, quantity_ordered, unit_price_at_order)
                VALUES (:order_id, :product_id, :qty, :price)
            """)
            
            db.execute(insert_query, 
                {
                "order_id": order_id,
                "product_id": item["product_id"],
                "qty": item["quantity_ordered"],
                "price": item["unit_price_at_order"],
            })
            
            db.commit()
        
    except Exception as error:
        db.rollback()
        raise HTTPException(status_code=500, detail=f"Could not submit order: {str(error)}") from error

    if order_id in added_items:
        del added_items[order_id]

    return {
        "order_id": order_id,
        "order_status": "Pending",
        "items_submitted": len(items),
        "message": f"Order {order_id} submitted successfully!"
    }

@route.get("/orders/{order_id}", response_model=QueueOrderResponse)
async def get_order_details(order_id: int, stall_id: int, db: Annotated[Connection, Depends(get_db)]):
    
    query = text("""
                 
        SELECT o.customer_name, o.order_number, o.order_status, DATE_FORMAT(o.order_time, '%M %d, %Y : %h:%i:%s %p') AS order_date, 
        o.stall_id,
        p.product_name,
        ol.quantity_ordered,
        ol.unit_price_at_order

        FROM orders o
        JOIN order_line ol ON ol.order_id = o.order_id
        JOIN product p ON p.product_id = ol.product_id
        WHERE o.order_id = :o_id
        """)
    
    try:
        results = db.execute(query, {"o_id": order_id}).mappings().fetchall()
        
        if not results:
            raise HTTPException(status_code=404, detail="Order not found.")
        
        # Optional stall verification
        if stall_id and results[0]["stall_id"] != stall_id:
            raise HTTPException(status_code=403, detail="Order does not belong to this stall")
        
        order_details = QueueOrderResponse(
            
            customer_name=results[0]["customer_name"],
            order_number=results[0]["order_number"],
            order_status=results[0]["order_status"],
            order_date=results[0]["order_date"],
            total_cost=sum(row["unit_price_at_order"] * row["quantity_ordered"] for row in results),
            
            items=[
                QueueOrderLineResponse(
                    product_name=row["product_name"],
                    quantity_ordered=row["quantity_ordered"]
                )
                for row in results
            ]
        )
        
        return order_details
    
    except HTTPException:
        raise
    except Exception as error:
        raise HTTPException(status_code=500, detail=f"Database error: {str(error)}")

@route.patch("accept_order/{order_id}")
async def accept_orders(order_id: int, stall_id: int, db: Annotated[Connection, Depends(get_db)]):
    
    update_query = text("""
           
        UPDATE orders
        SET order_status = 'Preparing'
        WHERE order_id = :o_id AND stall_id = :s_id
        """)
    
    get_order_number = text("""
               
        SELECT order_number
        FROM orders             
        WHERE order_id = :o_id
        """)
    
    try: 
        results = db.execute(update_query, {"o_id": order_id, "s_id": stall_id})
        db.commit()
        
        updated_queue = await get_queue_helper(stall_id, "Preparing", db)
        
        if stall_id in stall_streams:
            await stall_streams[stall_id].put({
                
                "event" : "Order added in Preparing Queue",
                "queue" : updated_queue
            })
        
        results = db.execute(get_order_number, {"o_id":order_id}).mappings().fetchone()        
        order_number = results["order_number"]
        
        return {"message": "Successfully accepted order, please wait while your order is being prepared!\nYour order nunmber: {order_number}", "order_number": order_number}
    
    except Exception as error:
        db.rollback()
        raise HTTPException(status_code=500, detail=f"Error: {str(error)}")

@route.delete("/orders/{order_id}")
async def decline_order(order_id: int, stall_id: int, db: Annotated[Connection, Depends(get_db)]):
    
    verification_query = text("""

        SELECT *
        FROM orders 
        WHERE order_id = :o_id AND stall_id = :s_id AND order_status = 'Pending'                 
        """)
    
    results = db.execute(verification_query, {"o_id": order_id, "s_id": stall_id}).mappings().fetchone()

    if not results:
        raise HTTPException(status_code=404, detail="Order not found or Order is no longer in Pending phase.")

    # First delete order line items, then delete the order
    delete_line_items_query = text("""
        DELETE FROM order_line 
        WHERE order_id = :o_id        
    """)
    
    delete_order_query = text("""
        DELETE FROM orders 
        WHERE order_id = :o_id        
    """)
    
    try:

        db.execute(delete_line_items_query, {"o_id": order_id})
        db.execute(delete_order_query, {"o_id": order_id})
        db.commit()
        
        updated_queue = await get_queue_helper(stall_id, "Pending", db)

        if stall_id in stall_streams:
            await stall_streams[stall_id].put({
                
                "event" : "Order removed from Pending Queue",
                "queue" : updated_queue
            })
        
        return {"message": f"Successfully declined order number: {order_id}"}
        
    except Exception as error:
        db.rollback()
        raise HTTPException(status_code=500, detail=f"Error: {str(error)}")
    
@route.patch("complete_order/{order_id}")
async def complete_order(order_id: int, stall_id: int, db: Annotated[Connection, Depends(get_db)]):
    
    update_query = text("""
           
        UPDATE orders
        SET order_status = 'Completed'
        WHERE order_id = :o_id AND stall_id = :s_id
        """)
    
    get_order_number = text("""
               
        SELECT order_number
        FROM orders             
        WHERE order_id = :o_id
        """)
    
    try: 
        results = db.execute(update_query, {"o_id": order_id, "s_id": stall_id})
        db.commit()
        
        results = db.execute(get_order_number, {"o_id":order_id}).mappings().fetchone()        
        order_number = results["order_number"]
        
        updated_queue = await get_queue_helper(stall_id, "Preparing", db)

        if stall_id in stall_streams:
            await stall_streams[stall_id].put({

                "event": "Order removed from Preparing Queue",
                "queue" : updated_queue
            })

        return {"message": "Successfully completed order, please come to the cashier to claim!\nYour order nunmber: {order_number}", "order_number": order_number}
    
    except Exception as error:
        db.rollback()
        raise HTTPException(status_code=500, detail=f"Error: {str(error)}")
    