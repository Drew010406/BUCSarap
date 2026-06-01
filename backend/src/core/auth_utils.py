from bcrypt import hashpw, gensalt, checkpw
from fastapi.security import OAuth2PasswordBearer

from backend.src.core.settings import settings

oauth2_scheme = OAuth2PasswordBearer(tokenUrl="/users/login")
def get_password_hash(password: str) -> str:
	return hashpw(password.encode(settings.encode_type), gensalt()).decode(settings.encode_type)

def verify_password(plain_password: str, hashed_password: str) -> bool:
	try:
		return checkpw(plain_password.encode(settings.encode_type), hashed_password.encode(settings.encode_type))
	except ValueError:
		return False