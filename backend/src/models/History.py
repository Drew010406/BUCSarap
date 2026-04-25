from db.Base import Base
from sqlalchemy import Column, Integer, ForeignKey

class History(Base):
    __tablename__ = "history"
    owner_id = Column(Integer, ForeignKey("owner.owner_id"), primary_key=True)
    order_id = Column(Integer, ForeignKey("orders.order_id"), primary_key=True)
