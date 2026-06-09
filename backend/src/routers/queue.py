from datetime import datetime
from typing import Annotated, List
from fastapi import APIRouter, Depends, HTTPException, Request
from sqlalchemy import text, Connection
from backend.src.schema.history import HistoryItem

from backend.src.db.session import get_db
from backend.src.schema.order import (
	CreateOrderRequest,
	CreateOrderResponse,
	OrderLineRequest,
	QueueOrderResponse,
	QueueOrderLineResponse,
)
import asyncio
import json
from sse_starlette import EventSourceResponse

import firebase_admin
from firebase_admin import credentials, messaging

queue_route = APIRouter()

stall_streams: dict[int, asyncio.Queue] = {}


@queue_route.get("/{stall_id}/stream")
async def stream_generator(stall_id: int, request: Request):
	queue = asyncio.Queue()
	stall_streams[stall_id] = queue
	
	async def event_generator():
		try:
			while True:
				if await request.is_disconnected():
					break
				try:
					queue_data = await asyncio.wait_for(queue.get(), timeout=30)
					yield {"event": queue_data.get("event"), "data": json.dumps(queue_data.get("data"))}
				except asyncio.TimeoutError:
					yield {"event": "heartbeat", "data": "ping"}
		finally:
			stall_streams.pop(stall_id, None)
	
	return EventSourceResponse(event_generator())


@queue_route.get(
	"/pending/{stall_id}",
	response_model=List[HistoryItem],
	responses={
		404: {"description": "Stall not found"},
	},
)
async def get_pending_queue(stall_id: int, db: Annotated[Connection, Depends(get_db)]):
	return await get_queue_helper(stall_id, "Pending", db)


@queue_route.get(
	"/{stall_id}",
	response_model=List[HistoryItem],
	responses={
		404: {"description": "Stall not found"},
	},
)
async def get_preparing_queue(stall_id: int, db: Annotated[Connection, Depends(get_db)]):
	return await get_queue_helper(stall_id, "Preparing", db)


async def get_queue_helper(stall_id: int, query_type: str, db: Connection):
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
		rows = db.execute(get_rows_query,
		                  {"s_id": stall_id, "o_status": query_type}).mappings().fetchall()
	
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


"""Push notif shit (Firebase)--------------------------------"""
cred = credentials.Certificate("firebase-service-account.json")
firebase_admin.initialize_app(cred)

fcm_tokens: dict[int, str] = {}


@queue_route.post("/{order_id}/notif/save_fcm")
async def save_fcm(order_id: int, fcm_token: str):
	fcm_tokens[order_id] = fcm_token
	print(f"Order ID: {order_id} FCM TOKEN : {fcm_token}")
	return {"message": f"FCM token saved for Order ID: {order_id}"}


"Same approach sa SSE, bale after mag push ng event sa queue, notif naman isesend. tigcall ko to dun sa mga order status changing endpoints"


async def send_push_notifs(order_id: int, title: str, body: str):
	token = fcm_tokens.get(order_id)
	if not token:
		print(f"DEBUG: No token found for order {order_id}")
		return {"Message": f"Token of order: {order_id} doesn't exist."}
	
	message = messaging.Message(
		# This makes the OS show the notification popup
		notification=messaging.Notification(title=title, body=body),
		data={
			"title": title,
			"body": body,
			"order_id": str(order_id)
		},
		token=token,
		android=messaging.AndroidConfig(priority="high")
	)
	
	try:
		await asyncio.to_thread(messaging.send, message)
		print(f"DEBUG: Notification sent to order {order_id}")
	except Exception as error:
		return {"Message": f"Failed to send message: {error}"}


"""-----------------------------------------------------"""
