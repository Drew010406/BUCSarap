from db.Base import Base
from sqlalchemy import Column, Integer, String, DateTime, ForeignKey
from sqlalchemy.sql import func

class Order(Base):
    __tablename__ = "orders"
    order_id = Column(Integer, primary_key=True, autoincrement=True)
    product_pile_id = Column(Integer, ForeignKey("product_pile.product_pile_id"), nullable=False)
    stall_id = Column(Integer, ForeignKey("stall.stall_id"), nullable=False)
    order_number = Column(String(50), unique=True, nullable=False)
    order_status = Column(String(50))
    order_time = Column(DateTime, server_default=func.now())
    processing_time = Column(DateTime, nullable=True)
    customer_name = Column(String(55))
