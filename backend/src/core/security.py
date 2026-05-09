import datetime

import bcrypt
import jwt
import os

ALGORITHM = "HS256"
ACCESS_TOKEN_EXPIRE_MINUTES = 30  # 30 minutes
REFRESH_TOKEN_EXPIRE_DAYS = 60 * 24 * 7 # 7 days
JWT_SECRET_KEY = os.environ['JWT_SECRET_KEY'] 
JWT_REFRESH_SECRET_KEY = os.environ['JWT_REFRESH_TOKEN'] 

def hash_password(password: str) -> str:
    pwd_bytes = password.encode('utf-8')
    salt = bcrypt.gensalt()
    hashed_password = bcrypt.hashpw(pwd_bytes, salt)
    
    return hashed_password.decode('utf-8')

def verify_hash(password: str, hashed_pass: str) -> bool:
    # Convert both the login attempt and the database hash into bytes for comparison 
    password_byte_enc = password.encode('utf-8')
    hashed_pass_byte_enc = hashed_pass.encode('utf-8')
    
    return bcrypt.checkpw(password_byte_enc, hashed_pass_byte_enc)

def create_access_token(data:dict) -> str:
    to_encode = data.copy()
    expiration_date = datetime.utcnow() + datetime.timedelta(minutes=ACCESS_TOKEN_EXPIRE_MINUTES)
    to_encode |= {"expire": expiration_date, "type": "refresh"}
    return jwt.encode(to_encode, JWT_SECRET_KEY, algorithm=ALGORITHM)

def create_refresh_token(data:dict) -> str:
    to_encode = data.copy()
    expiration_date = datetime.utcnow() + datetime.timedelta(minutes=REFRESH_TOKEN_EXPIRE_DAYS)
    to_encode |= {"expire": expiration_date, "type": "refresh"}
    return jwt.encode(to_encode, JWT_REFRESH_SECRET_KEY, algorithm=ALGORITHM)
    
def verify_token(token: str) -> dict | None:
    try:
        return jwt.decode(token, JWT_SECRET_KEY, algorithms=[ALGORITHM])
    except jwt.PyJWTError:
        return None