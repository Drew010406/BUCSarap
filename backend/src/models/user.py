from sqlalchemy import Column, String, Integer
#Database for the users
# This is only a draft and will be changed later 
from db.Base import Base

class User(Base):   
    __tableName__ = 'users'

    