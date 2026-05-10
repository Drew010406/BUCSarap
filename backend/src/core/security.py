import datetime
import bcrypt
import jwt
import os
from dotenv import load_dotenv

load_dotenv()

ALGORITHM = "HS256"
ACCESS_TOKEN_EXPIRE_MINUTES = 30 
REFRESH_TOKEN_EXPIRE_DAYS = 60 * 24 * 7 
JWT_SECRET_KEY = os.environ.get('JWT_SECRET_KEY', 'default_secret_key') 
JWT_REFRESH_SECRET_KEY = os.environ.get('JWT_REFRESH_TOKEN', 'default_refresh_key') 

def hash_password(password: str) -> str:
    pwd_bytes = password.encode('utf-8')
    salt = bcrypt.gensalt()
    hashed_password = bcrypt.hashpw(pwd_bytes, salt)
    return hashed_password.decode('utf-8')

def verify_hash(password: str, hashed_pass: str) -> bool:
    try:
        return bcrypt.checkpw(
            password.encode('utf-8'), 
            hashed_pass.encode('utf-8')
        )
    except ValueError:
        return False

def create_access_token(data: dict) -> str:
    to_encode = data.copy()
    expiration_date = datetime.datetime.now(datetime.timezone.utc) + datetime.timedelta(minutes=ACCESS_TOKEN_EXPIRE_MINUTES)
    to_encode |= {"exp": expiration_date, "type": "access"}
    return jwt.encode(to_encode, JWT_SECRET_KEY, algorithm=ALGORITHM)

def create_refresh_token(data: dict) -> str:
    to_encode = data.copy()
    expiration_date = datetime.datetime.now(datetime.timezone.utc) + datetime.timedelta(minutes=REFRESH_TOKEN_EXPIRE_DAYS)
    to_encode |= {"exp": expiration_date, "type": "refresh"}
    return jwt.encode(to_encode, JWT_REFRESH_SECRET_KEY, algorithm=ALGORITHM)
    
def verify_token(token: str) -> dict | None:
    try:
        return jwt.decode(token, JWT_SECRET_KEY, algorithms=[ALGORITHM])
    except jwt.PyJWTError:
        return None