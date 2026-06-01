from datetime import datetime, timedelta
from typing import Optional

from pydantic import BaseModel

class AccessToken(BaseModel):
	access_token: str
	token_type: str
	access_token_expire_time: datetime

class RefreshToken(BaseModel):
	refresh_token: str
	refresh_token_expire_time: datetime

class TokenPairRequest(BaseModel):
	refresh_token: str
	access_token: Optional[str] = None

class NewToken(BaseModel):
	access_token: str
	refresh_token: str
	token_type: str

class TokenData(BaseModel):
	username: str | None = None
