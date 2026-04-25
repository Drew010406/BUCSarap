from db.Base import Base
from sqlalchemy import Column, Integer, String, ForeignKey

class ProductCategory(Base):
    __tablename__ = "product_category"
    category_id = Column(Integer, primary_key=True, autoincrement=True)
    stall_id = Column(Integer, ForeignKey("stall.stall_id"), nullable=False)
    category_name = Column(String(100), nullable=False)
