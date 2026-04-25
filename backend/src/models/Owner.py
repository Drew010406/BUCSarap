from db.Base import Base
from sqlalchemy import Column, Integer, String

class Owner(Base):
    __tablename__ = "owner"
    owner_id = Column(Integer, primary_key=True, autoincrement=True)
    owner_username = Column(String(55), unique=True, nullable=False)
    hashed_password = Column(String(255), nullable=False)
