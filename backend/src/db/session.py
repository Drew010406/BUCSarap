# This allows SQL and Py to interact with eachother
# This is a set up, ikaw na Sean maayos neto

from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker
from sqlalchemy.engine import URL

url = URL.create(
    drivername="mySQL",
    username="root", #Change later for security
    password="", 
    host="localhost",
    database="buCSarapDB", #I'm not sure sa DB name
    port=5432
)

engine = create_engine(url)
Session = sessionmaker(bind=engine)
session = Session


