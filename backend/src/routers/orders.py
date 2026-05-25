from typing import Annotated, List
from fastapi import APIRouter, Depends, HTTPException
from sqlalchemy import text, Connection

from backend.src.db.session import get_db
from backend.src.schema.order import (
    CheckoutRequest,
    CheckoutResponse,
    OrderResponse,
    OrderLineResponse,
    OrderStatusUpdate,
    VALID_STATUSES,
    OrderLineRequest,
    OrderLineCreateResponse,
)

route = APIRouter()

# Key: order_id, Value: list of added items
added_items = {}

@route.post(
    "/checkout",
    response_model=CheckoutResponse,
    status_code=201,
    responses={
        400: {"description": "Bad Request - stall is closed"},
        404: {"description": "Stall not found"},
        500: {"description": "Could not place order"}
    },
)

async def checkout(payload: CheckoutRequest, db: Annotated[Connection, Depends(get_db)]):
    
    query = text("""

        SELECT stall_id, stall_status 
        FROM stall WHERE stall_id = :s_id
        """)
    
    try: 
        stall_row = db.execute(query ,{"s_id": payload.stall_id}).mappings().fetchone()

    except Exception as error:
        
        raise HTTPException(status_code=404, detail="Stall not found")

    if not stall_row["stall_status"]:
        
        raise HTTPException(status_code=400, detail="Stall is currently closed")

    query = text("""
                 
        SELECT COUNT(*) AS total
        FROM orders
        WHERE stall_id = :s_id       
        """)

    count_row = db.execute(query, {"s_id": payload.stall_id}).mappings().fetchone()

    next_seq = (count_row["total"] or 0) + 1
    order_number = f"STL{payload.stall_id}-{next_seq:04d}"

    insert_query = text("""
                        
        INSERT INTO orders (stall_id, order_number, order_status, customer_name)
        VALUES (:stall_id, :order_number, 'Pending', :customer_name)
        """)
    
    try:
        result = db.execute(insert_query,    
                {
                "stall_id": payload.stall_id,
                "order_number": order_number,
                "customer_name": payload.customer_name,
                })

        order_id = result.lastrowid
        db.commit()

    except Exception as error:
        
        db.rollback()
        raise HTTPException(status_code=500, detail=f"Could not place order: {str(error)}") from error

    return CheckoutResponse(
        
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
            "product_name": product_row["product_name"],
            "quantity_ordered": item.quantity,
            "unit_price_at_order": float(product_row["product_price"]),
        })
    
    return {
        "order_id": order_id,
        "items_added": len(added_items[order_id]),
        "items": added_items[order_id],
        "message": f"Successfully validated items. Total items for this order: {len(added_items[order_id])}."
    }


@route.get(
	"/queue/{stall_id}",
	response_model=List[OrderResponse],
	responses={
		404: {"description": "Stall not found"},
	},
)
async def get_queue(stall_id: int, db: Annotated[Connection, Depends(get_db)]):
    
    query = text("""
        SELECT stall_id 
        FROM stall 
        WHERE stall_id = :s_id
        """)
    stall_exists = db.execute(query, {"s_id": stall_id}).mappings().fetchone()

    if not stall_exists:
        raise HTTPException(status_code=404, detail="Stall not found")

    get_rows_query = text("""
                    
        SELECT
            o.order_id,
            o.order_number,
            o.order_status,
            o.order_time,
            o.customer_name,
            ol.order_line_id,
            ol.product_id,
            p.product_name,
            ol.quantity_ordered,
            ol.unit_price_at_order
            
        FROM orders o
        JOIN order_line ol ON ol.order_id = o.order_id
        JOIN product p    ON p.product_id = ol.product_id

        WHERE o.stall_id = :s_id
        AND o.order_status IN ('Pending', 'Preparing')

        ORDER BY o.order_time ASC, ol.order_line_id ASC
        """)

    rows = db.execute(get_rows_query, {"s_id": stall_id},).mappings().fetchall()

    orders: dict[int, OrderResponse] = {}
    
    for row in rows:
        
        o_id = row["order_id"]
        
        if o_id not in orders:
            
            orders[o_id] = OrderResponse(
                order_id=o_id,
                order_number=row["order_number"],
                order_status=row["order_status"],
                order_time=row["order_time"],
                customer_name=row["customer_name"],
                items=[],
            )
            
        orders[o_id].items.append(
        
            OrderLineResponse(
                order_line_id=row["order_line_id"],
                product_id=row["product_id"],
                product_name=row["product_name"],
                quantity_ordered=row["quantity_ordered"],
                unit_price_at_order=row["unit_price_at_order"],
            )
        )

    return list(orders.values())

@route.post(
    "/{order_id}/submit",
    responses={
        400: {"description": "Bad Request - invalid order state or no items"},
        404: {"description": "Order not found"},
        500: {"description": "Could not submit order"}
    },
)
async def submit_order(order_id: int, payload: dict, db: Annotated[Connection, Depends(get_db)]):

    # Verify order exists and is in pending state
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

    # Verify items array exists and is not empty
    items = payload.get("items", [])
    
    if not items or len(items) == 0:
        raise HTTPException(
            status_code=400,
            detail="Please add at least one item.",
        )

    # Insert all items into order_line table
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

    # Clear the global items array for this order after successful submit
    if order_id in added_items:
        del added_items[order_id]

    return {
        "order_id": order_id,
        "order_status": "Pending",
        "items_submitted": len(items),
        "message": f"Order {order_id} submitted successfully!"
    }

@route.patch(
	"/{order_id}/status",
	responses={
		400: {"description": "Invalid status value"},
		404: {"description": "Order not found"},
		500: {"description": "Could not update order"}
	},
)
async def update_order_status(order_id: int, payload: OrderStatusUpdate,db: Annotated[Connection, Depends(get_db)]):

    if payload.order_status not in VALID_STATUSES:

        raise HTTPException(
            status_code=400,
            detail=f"Invalid status. Must be one of: {', '.join(sorted(VALID_STATUSES))}",
        )

    verification_query = text("""

        SELECT order_id, order_status 
        FROM orders 
        WHERE order_id = :o_id
        """)
    order_row = db.execute(verification_query, {"o_id": order_id}).mappings().fetchone()

    if not order_row:
        raise HTTPException(status_code=404, detail="Order not found")

    update_query = text("""
        
        UPDATE orders 
        SET order_status = :status 
        WHERE order_id = :o_id
        """)
    try:
        db.execute(update_query, {"status": payload.order_status, "o_id": order_id})
        db.commit()

    except Exception as error:
        db.rollback()
        raise HTTPException(status_code=500, detail=f"Could not update order: {str(error)}") from error

    return {
        "order_id": order_id,
        "order_status": payload.order_status,
        "message": f"Order {order_id} updated to '{payload.order_status}'",
    }
