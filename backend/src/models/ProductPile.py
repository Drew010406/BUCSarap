from db.Base import Base
from sqlalchemy import Column, Integer, ForeignKey

class ProductPile(Base):
    __tablename__ = "product_pile"
    product_pile_id = Column(Integer, primary_key=True, autoincrement=True)
    product_id = Column(Integer, ForeignKey("product.product_id"), nullable=False)
    stall_id = Column(Integer, ForeignKey("stall.stall_id"), nullable=False)
    product_quantity = Column(Integer, nullable=False)
