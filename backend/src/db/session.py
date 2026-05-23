from sqlalchemy import create_engine
from sqlalchemy.engine import URL
from sqlalchemy import Connection
import os
from dotenv import load_dotenv

load_dotenv()
db_pass = os.getenv("DB_PASSWORD")

# Connection config
url = URL.create(
    drivername="mysql+pymysql",
    username="test",
    password=db_pass,
    host="localhost",
    database="bucsarap",
    port=3306
)

engine = create_engine(
    url,
    pool_pre_ping=True,
    pool_recycle=3600
)

def get_db() -> Connection:
    with engine.connect() as connection:
        yield connection
