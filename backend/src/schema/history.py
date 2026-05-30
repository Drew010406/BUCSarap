from pydantic import BaseModel, ConfigDict
from datetime import datetime
from typing import List

class HistoryItem(BaseModel):
    
    customer_name: str | None
    order_id : int
    order_number : str

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

    stall_name: str
    stall_id: int
    stall_revenue: float
    
    model_config = ConfigDict(from_attributes=True)
    
class Daily_Revenue_Response(BaseModel):
    
    order_date : str
    revenue_for_the_day : float
    
class RevenueComparison(BaseModel):
    
    stall_id: int
    current_revenue: float
    previous_revenue: float
    revenue_difference: float
    percentage_change: float
    
    model_config = ConfigDict(from_attributes=True)