from pydantic import BaseModel, field_validator
from decimal import Decimal
from typing import Optional, List
from datetime import timedelta

class StallUpdate(BaseModel):
    
    stall_name: Optional[str]     
    opening_time: Optional[str]
    closing_time: Optional[str]
    operating_days: Optional[str]  
    stall_status : bool   
    photo_path: Optional[str]

class CategoryInfo(BaseModel):
    category_id: int
    category_name: str

class StallResponse(BaseModel):
    
    stall_id: int
    stall_name: str
    owner_id: int
    opening_time: str
    closing_time: str
    operating_days: str
    stall_status: bool
    photo_path: str
    
    @field_validator('opening_time', 'closing_time', mode='before')
    @classmethod
    def convert_time(cls, v):
        
        if isinstance(v, timedelta):
            
            total_seconds = int(v.total_seconds())
            hours = total_seconds // 3600
            minutes = (total_seconds % 3600) // 60
            seconds = total_seconds % 60
            return f"{hours:02d}:{minutes:02d}:{seconds:02d}"
        
        return v
    
    class Config:
        from_attributes = True

class StallCategories(BaseModel):
    
    stall_id: int
    stall_name : str
    categories: List[CategoryInfo]
    
    class Config:
        from_attributes = True
