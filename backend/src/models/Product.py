from db.Base import Base
from sqlalchemy import Column, Integer, String, Numeric, Boolean, ForeignKey

class Product(Base):
    __tablename__ = "product"
    product_id = Column(Integer, primary_key=True)
    category_id = Column(Integer, ForeignKey("product_category.category_id"), nullable=False)
    product_name = Column(String(55), nullable=False)
    product_price = Column(Numeric(10,2), nullable=False)
    product_status = Column(Boolean, default=False)
