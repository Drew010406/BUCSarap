from pydantic import BaseModel, ConfigDict
from datetime import datetime
from typing import List

class HistoryItem(BaseModel):
    
    stall_name: str
    stall_id: int
    order_id: int
    order_time: datetime
    product_name: str
    item_total: float 

class OrderHistory(BaseModel):
    
    order_id: int
    order_time: datetime
    stall_name: str
    stall_id: int
    items: List[HistoryItem]
    order_total: float = None 

class HistoryResponse(BaseModel):
    
    stall_id: int
    stall_name: str
    orders: List[OrderHistory]
    total_orders: int = None
    total_revenue: float = None
    
    model_config = ConfigDict(from_attributes=True)
    
class RevenueResponse(BaseModel):
    """Stall revenue summary"""
    stall_name: str
    stall_id: int
    stall_revenue: float
    
    model_config = ConfigDict(from_attributes=True)
    