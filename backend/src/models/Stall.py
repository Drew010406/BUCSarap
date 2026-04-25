from db.Base import Base
from sqlalchemy import Column, Integer, String, Boolean, Time, ForeignKey

class Stall(Base):
    __tablename__ = "stall"
    stall_id = Column(Integer, primary_key=True, autoincrement=True)
    owner_id = Column(Integer, ForeignKey("owner.owner_id"), nullable=False)
    stall_name = Column(String(100), nullable=False)
    opening_time = Column(Time, nullable=False)
    closing_time = Column(Time, nullable=False)
    operating_days = Column(String(55), nullable=False)
    stall_status = Column(Boolean, default=False)
