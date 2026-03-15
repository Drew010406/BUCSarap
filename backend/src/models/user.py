# This stores the actual entities inside the db
import uuid
from sqlalchemy import Column, String, UUID
#Database for the users
# This is only a draft and will be changed later 
from db.Base import Base

class User(Base):   
    __tablename__ = 'users'

    id = Column(UUID(as_uuid=True), primary_key=True, default=uuid.uuid4)
    username = Column(String, unique=True)
    password = Column(String)

    