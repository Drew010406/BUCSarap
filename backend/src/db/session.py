from sqlalchemy import create_engine
from sqlalchemy.engine import URL
from sqlalchemy import Connection
import os
from dotenv import load_dotenv

load_dotenv()
db_user = os.getenv("USER_NAME") or "root"
db_pass = os.getenv("DB_PASSWORD") or None
db_port = int(os.getenv("DB_PORT") or 3306)
db_name = os.getenv("DATABASE") or "bucsarap"

# Connection config
url = URL.create(
    drivername="mysql+pymysql",
    username=db_user,
    password=db_pass if db_pass else None,
    host="localhost",
    database=db_name,
    port=db_port
)

engine = create_engine(
    url,
    pool_pre_ping=True,
    pool_recycle=3600
)

def get_db() -> Connection:
    with engine.connect() as connection:
        yield connection
