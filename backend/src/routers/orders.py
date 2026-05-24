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
)

route = APIRouter()


@route.post(
	"/checkout",
	response_model=CheckoutResponse,
	status_code=201,
	responses={
		400: {"description": "Bad Request - invalid items or stall is closed"},
		404: {"description": "Stall or product not found"},
		500: {"description": "Could not place order"}
	},
)
async def checkout(payload: CheckoutRequest, db: Annotated[Connection, Depends(get_db)]):
	stall_row = db.execute(
		text("SELECT stall_id, stall_status FROM stall WHERE stall_id = :sid"),
		{"sid": payload.stall_id},
	).mappings().fetchone()
	
	if not stall_row:
		raise HTTPException(status_code=404, detail="Stall not found")
	
	if not stall_row["stall_status"]:
		raise HTTPException(status_code=400, detail="Stall is currently closed")
	
	product_ids = [item.product_id for item in payload.items]
	
	# Di tinatanggap ang list ng sql driver
	product_rows = db.execute(
		text("""
            SELECT p.product_id, p.product_name, p.product_price, p.product_status
            FROM product p
            JOIN product_category pc ON pc.category_id = p.category_id
            WHERE p.product_id IN :pids
              AND pc.stall_id = :sid
              AND p.product_status = 1
        """),
		{"pids": tuple(product_ids), "sid": payload.stall_id},
	).mappings().fetchall()
	
	found_products = {row["product_id"]: row for row in product_rows}
	
	for item in payload.items:
		if item.product_id not in found_products:
			raise HTTPException(
				status_code=400,
				detail=f"Product ID {item.product_id} is unavailable or does not belong to this stall",
			)
	
	# Use the current order count per stall
	count_row = db.execute(
		text("SELECT COUNT(*) AS total FROM orders WHERE stall_id = :sid"),
		{"sid": payload.stall_id},
	).mappings().fetchone()
	
	next_seq = (count_row["total"] or 0) + 1
	order_number = f"STL{payload.stall_id}-{next_seq:04d}"
	
	try:
		result = db.execute(
			text("""
                INSERT INTO orders (stall_id, order_number, order_status, customer_name)
                VALUES (:stall_id, :order_number, 'Pending', :customer_name)
            """),
			{
				"stall_id": payload.stall_id,
				"order_number": order_number,
				"customer_name": payload.customer_name,
			},
		)
		
		order_id = result.lastrowid
		
		for item in payload.items:
			product = found_products[item.product_id]
			db.execute(
				text("""
                    INSERT INTO order_line (order_id, product_id, quantity_ordered, unit_price_at_order)
                    VALUES (:order_id, :product_id, :qty, :price)
                """),
				{
					"order_id": order_id,
					"product_id": item.product_id,
					"qty": item.quantity,
					# This prevents affecting the order when price ay biglang bumago
					"price": float(product["product_price"]),
				},
			)
		
		db.commit()
	
	except HTTPException:
		raise
	except Exception as e:
		db.rollback()
		raise HTTPException(status_code=500, detail=f"Could not place order: {str(e)}") from e
	
	return CheckoutResponse(
		order_id=order_id,
		order_number=order_number,
		order_status="Pending",
		message="Order placed successfully! Please wait for your number to be called.",
	)


@route.get(
	"/queue/{stall_id}",
	response_model=List[OrderResponse],
	responses={
		404: {"description": "Stall not found"},
	},
)
async def get_queue(stall_id: int, db: Annotated[Connection, Depends(get_db)]):
	stall_exists = db.execute(
		text("SELECT stall_id FROM stall WHERE stall_id = :sid"),
		{"sid": stall_id},
	).mappings().fetchone()
	
	if not stall_exists:
		raise HTTPException(status_code=404, detail="Stall not found")
	
	rows = db.execute(
		text("""
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
            INNER JOIN order_line ol ON ol.order_id = o.order_id
            INNER JOIN product p    ON p.product_id = ol.product_id

            WHERE o.stall_id = :sid
            AND o.order_status IN ('Pending', 'Preparing')

            ORDER BY o.order_time ASC, ol.order_line_id ASC
        """),
		{"sid": stall_id},
	).mappings().fetchall()
	
	orders: dict[int, OrderResponse] = {}
	for row in rows:
		oid = row["order_id"]
		if oid not in orders:
			orders[oid] = OrderResponse(
				order_id=oid,
				order_number=row["order_number"],
				order_status=row["order_status"],
				order_time=row["order_time"],
				customer_name=row["customer_name"],
				items=[],
			)
		orders[oid].items.append(
			OrderLineResponse(
				order_line_id=row["order_line_id"],
				product_id=row["product_id"],
				product_name=row["product_name"],
				quantity_ordered=row["quantity_ordered"],
				unit_price_at_order=row["unit_price_at_order"],
			)
		)
	
	return list(orders.values())


@route.patch(
	"/{order_id}/status",
	responses={
		400: {"description": "Invalid status value"},
		404: {"description": "Order not found"},
		500: {"description": "Could not update order"}
	},
)
async def update_order_status(
	order_id: int,
	payload: OrderStatusUpdate,
	db: Annotated[Connection, Depends(get_db)],
):
	if payload.order_status not in VALID_STATUSES:
		raise HTTPException(
			status_code=400,
			detail=f"Invalid status. Must be one of: {', '.join(sorted(VALID_STATUSES))}",
		)
	
	order_row = db.execute(
		text("SELECT order_id, order_status FROM orders WHERE order_id = :oid"),
		{"oid": order_id},
	).mappings().fetchone()
	
	if not order_row:
		raise HTTPException(status_code=404, detail="Order not found")
	
	try:
		db.execute(
			text("UPDATE orders SET order_status = :status WHERE order_id = :oid"),
			{"status": payload.order_status, "oid": order_id},
		)
		db.commit()
	
	except Exception as e:
		db.rollback()
		raise HTTPException(status_code=500, detail=f"Could not update order: {str(e)}") from e
	
	return {
		"order_id": order_id,
		"order_status": payload.order_status,
		"message": f"Order {order_id} updated to '{payload.order_status}'",
	}