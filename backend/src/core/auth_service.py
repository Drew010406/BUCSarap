# Docs here - https://fastapi.tiangolo.com/tutorial/security/oauth2-jwt/#install-pyjwt
# Useful Repo - https://github.com/Tenacity-Dev/fastapi-sqlalchemy2-alembic-postgresql/blob/main/user/services/user_service.py
# Tutor - https://www.youtube.com/watch?v=I11jbMOCY0c
# Best explanation - https://www.youtube.com/watch?v=7Q17ubqLfaM
# Reference - https://github.com/fastapi-practices/fastapi_best_architecture/blob/eb9399e1/backend/common/security/jwt.py#L104-L129

"""
Galing sa Autonode ko
"""
from datetime import datetime, timedelta, timezone, UTC
from typing import Annotated

import jwt

from backend.src.schema.token import AccessToken, RefreshToken
from backend.src.core.settings import settings


# Create JWT access token
def create_access_token(data: dict,) -> AccessToken:
	to_encode = data.copy()
	access_token_exp = datetime.now(timezone.utc) + timedelta(seconds=settings.access_token_expire_seconds)
	
	to_encode.update({'exp': access_token_exp})
	access_token = jwt.encode(to_encode, settings.access_secret_key, algorithm=settings.algo)
	return AccessToken(access_token=access_token, token_type='bearer',
	                   access_token_expire_time=access_token_exp)


# Create refresh token
def create_refresh_token(data: dict,) -> RefreshToken:
	to_encode = data.copy()
	refresh_token_exp = datetime.now(timezone.utc) + timedelta(seconds=settings.refresh_token_expire_seconds)
	to_encode.update({'exp': refresh_token_exp})
	refresh_token = jwt.encode(to_encode, settings.refresh_secret_key, algorithm=settings.algo)
	return RefreshToken(
		refresh_token=refresh_token,
		refresh_token_expire_time=refresh_token_exp
	)


# This is the one responsible for verifying if the access token is valid and returns the subj ( Since username satin then it returns it )
def verify_access_token(token: str) -> str | None:
	try:
		payload = jwt.decode(
			token,
			settings.access_secret_key,
			algorithms=[settings.algo],
			options={'require': ['exp', 'sub']},
		)
	except jwt.InvalidTokenError:
		return None
	else:
		return payload.get('sub')  # The userID sa case natin

def verify_refresh_token(token: str) -> str | None:
	try:
		payload = jwt.decode(
			token,
			settings.refresh_secret_key,
			algorithms=[settings.algo],
			options={'require': ['exp', 'sub']},
		)
	except jwt.ExpiredSignatureError: # If expired na token
		return None
	except jwt.InvalidTokenError:
		return None
	else:
		return payload.get('sub')  # The userID sa case natin