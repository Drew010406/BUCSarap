from typing import Annotated
from fastapi import APIRouter, Depends, HTTPException, Request, Response, status
from fastapi.security import OAuth2PasswordBearer, OAuth2PasswordRequestForm
from sqlalchemy import text, Connection
from sqlalchemy import func, select
from backend.src.core.rate_limiter import rate_limit
from backend.src.core.settings import settings
from backend.src.db.session import get_db
from backend.src.schema.owner import UserCreate, UserLogin, UserResponse

from backend.src.schema.stalls import StallResponse
from backend.src.core.auth_utils import verify_password, oauth2_scheme, get_password_hash
from backend.src.core.auth_service import create_access_token, create_refresh_token, \
	verify_access_token, verify_refresh_token
from backend.src.schema.token import NewToken, TokenPairRequest

route = APIRouter()
"""
Taken from my autonode proj
"""

@route.post(
	"/register",
	response_model=UserResponse,
	dependencies=[Depends(rate_limit)],
	responses={
		400: {"description": "Bad Request - Registration Failed"}
	}
)
async def create_user(make_user: UserCreate, db: Annotated[Connection, Depends(get_db)]):
	hashed_pwd = get_password_hash(make_user.password)
	
	insert_query = text("""
        INSERT INTO owner (owner_username, hashed_password)
        VALUES (:username, :password)
    """)
	
	try:
		result = db.execute(insert_query, {
			"username": make_user.username,
			"password": hashed_pwd
		})
		
		db.commit()
		
		return UserResponse(
			owner_id=result.lastrowid,
			owner_username=make_user.username,
		)
	
	except Exception as e:
		db.rollback()
		raise HTTPException(
			status_code=400,
			detail="Registration failed. Username may already exist.",
		) from e

@route.post('/login', status_code=status.HTTP_200_OK, dependencies=[Depends(rate_limit)])
async def login(
	form_data: Annotated[OAuth2PasswordRequestForm, Depends()],
	db: Annotated[Connection, Depends(get_db)]
):
	login_query = text("""
        SELECT owner_id, hashed_password
        FROM owner
        WHERE owner_username = :username
    """)
	user = db.execute(login_query, {"username": form_data.username}).mappings().fetchone()
	
	if not user or not verify_password(form_data.password, user.hashed_password):
		raise HTTPException(
			status_code=status.HTTP_401_UNAUTHORIZED,
			detail="Incorrect username or password",
			headers={"WWW-Authenticate": "Bearer"},
		)
	
	access_token = create_access_token(
		data={'sub': str(user.owner_id)},
	)

	refresh_token = create_refresh_token(
		data={'sub': str(user.owner_id)},
	)
	
	return {
		'access_token': access_token.access_token,
		'refresh_token': refresh_token.refresh_token,
		'token_type': 'bearer',
		'expires_in': settings.access_token_expire_seconds,
		'owner_id': user.owner_id
	}


@route.post('/refresh_token', response_model=NewToken)
async def refresh_token(db: Annotated[Connection, Depends(get_db)],
                        request: TokenPairRequest) -> NewToken:
	refresh_token = verify_refresh_token(request.refresh_token)
	
	if refresh_token is None:
		raise HTTPException(
			status_code=status.HTTP_401_UNAUTHORIZED,
			detail="Invalid or expired token",
		)
	
	new_access_token = create_access_token(
		data={'sub': refresh_token, },
	)
	new_refresh_token = create_refresh_token(
		data={'sub': refresh_token, },
	)
	
	return NewToken(
		refresh_token=new_refresh_token.refresh_token,
		access_token=new_access_token.access_token,
		token_type='bearer'
	)

@route.get('/me', response_model=UserResponse)
async def get_current_user(
	token: Annotated[str, Depends(oauth2_scheme)],
	db: Annotated[Connection, Depends(get_db)]):
	user_id = verify_access_token(token)
	if user_id is None:
		raise HTTPException(
			status_code=status.HTTP_401_UNAUTHORIZED,
			detail="Invalid or expired token",
			headers={"WWW-Authenticate": "Bearer"}
		)
	
	try:
		user_id_int = int(user_id)
	except (TypeError, ValueError):
		raise HTTPException(
			status_code=status.HTTP_401_UNAUTHORIZED,
			detail="Invalid or expired token",
			headers={"WWW-Authenticate": "Bearer"}
		)
		
	login_query = text("""
        SELECT owner_id, owner_username
        FROM owner
        WHERE owner_id = :owner_id
    """)
	user = db.execute(login_query, {"owner_id": user_id_int}).mappings().fetchone()
	if not user:
		raise HTTPException(
			status_code=status.HTTP_401_UNAUTHORIZED,
			detail="User not found",
			headers={"WWW-Authenticate": "Bearer"}
		)
	return user

@route.get(
	"/current_owner",
	response_model=UserResponse,
	responses={
		404: {"description": "Not Found - User does not exist"}
	}
)
async def get_user(owner_id: int, db: Annotated[Connection, Depends(get_db)]):
	select_query = text("""
        SELECT owner_id, owner_username
        FROM owner
        WHERE owner_id = :id
    """)
	
	if (
		result := db.execute(select_query, {"id": owner_id})
			.mappings()
			.fetchone()
	):
		return UserResponse(**result)
	else:
		raise HTTPException(status_code=404, detail="User not found")


@route.get("/{owner_id}/stall", response_model=StallResponse)
async def get_owner_stall(owner_id: int, db: Annotated[Connection, Depends(get_db)]):
	verification_query = text("""
           SELECT owner_id
           FROM owner
           WHERE owner_id = :o_id
        """)
	
	results = db.execute(verification_query, {"o_id": owner_id}).mappings().fetchone()
	
	if not results:
		raise HTTPException(status_code=404, detail=f"User {str(owner_id)} was not found.")
	
	query = text("""
        SELECT *
        FROM stall
        WHERE owner_id = :o_id
        """)
	
	try:
		results = db.execute(query, {"o_id": owner_id}).mappings().fetchone()
		return results
	
	except Exception as error:
		raise HTTPException(status_code=500, detail=f"Error: {str(error)}")
