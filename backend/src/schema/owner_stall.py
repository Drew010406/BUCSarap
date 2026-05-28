from pydantic import BaseModel
from typing import Optional, List
from decimal import Decimal
from datetime import datetime

class ProductUpdate(BaseModel):
    
    product_id : Optional[int] = None
    category_id : Optional[int] = None
    product_name: Optional[str] = None
    product_price: Optional[Decimal] = None
    product_status: Optional[bool] = None
    photo_path: Optional[str] = None
    
    class Config:
        from_attributes = True