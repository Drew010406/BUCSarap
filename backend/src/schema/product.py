from pydantic import BaseModel
from decimal import Decimal
from typing import Optional

class ProductResponse(BaseModel):

    product_id : int
    product_name : str
    product_price : Decimal
    product_status : bool
    product_quantity: int
    photo_path : str
    
    stall_id : int
    stall_name : str
    
    category_id : int
    category_name : str
    