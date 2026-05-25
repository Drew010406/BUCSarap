from pydantic import BaseModel, Field, ConfigDict
from decimal import Decimal
from typing import List
from datetime import datetime

class OrderLineItem(BaseModel):
    product_id: int
    quantity: int = Field(gt=0)

class CheckoutRequest(BaseModel):
    
    stall_id: int
    customer_name: str = Field(max_length=55)

class OrderLineRequest(BaseModel):
    
    product_id: int
    quantity: int = Field(gt=0)
    unit_price_ordered : float

    
class OrderLineResponse(BaseModel):
    
    order_line_id: int
    product_id: int
    product_name: str
    quantity_ordered: int
    unit_price_at_order: Decimal

    model_config = ConfigDict(from_attributes=True)

class OrderResponse(BaseModel):
    
    order_id: int
    order_number: str
    order_status: str
    order_time: datetime
    customer_name: str | None
    items: List[OrderLineResponse]

    model_config = ConfigDict(from_attributes=True)

class CheckoutResponse(BaseModel):
    order_id: int
    order_number: str
    order_status: str
    message: str


class OrderLineCreateResponse(BaseModel):
    order_line_id: int
    order_id: int
    product_id: int
    product_name: str
    quantity_ordered: int
    unit_price_at_order: Decimal
    message: str

# Order states for the queue
VALID_STATUSES = {"Pending", "Preparing", "Ready", "Completed", "Cancelled"}

class OrderStatusUpdate(BaseModel):
    order_status: str
