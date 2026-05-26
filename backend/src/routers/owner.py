from typing import Annotated
from fastapi import APIRouter, Depends, HTTPException, Request, Response
from sqlalchemy import text, Connection

from backend.src.core.rate_limiter import rate_limit
from backend.src.db.session import get_db
from backend.src.schema.owner import UserCreate, UserLogin, UserResponse
from backend.src.core.security import create_access_token, create_refresh_token, hash_password, verify_hash, verify_token

route = APIRouter()

@route.post(
    "/register", 
    response_model=UserResponse,
    dependencies=[Depends(rate_limit)],
    responses={
        400: {"description": "Bad Request - Registration Failed"}
    }
)
async def create_user(make_user: UserCreate, db: Annotated[Connection, Depends(get_db)]):
    hashed_pwd = hash_password(make_user.password)

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

# helper function para sa login endpoint, galet na galet kase linter ko
def attach_auth_cookies(response: Response, owner_id: int):
    token_payload = {"sub": str(owner_id)}
    
    # Store the generated tokens in variables so we can return them
    access_token = create_access_token(token_payload)
    refresh_token = create_refresh_token(token_payload)
    
    response.set_cookie(
        key="access_token",
        value=f"Bearer {access_token}",
        httponly=True,
        secure=False, # gawin nalang true pag https na
        samesite="lax",
        max_age=15 * 60 
    )

    response.set_cookie(
        key="refresh_token",
        value=refresh_token,
        httponly=True,
        secure=False,
        path="/users/refresh",
        samesite="lax",
        max_age=7 * 24 * 60 * 60 
    )
    
    return access_token, refresh_token

@route.post(
    "/login", 
    dependencies=[Depends(rate_limit)],
    responses={
        401: {"description": "Unauthorized - Incorrect Credentials"}
    }
)
async def login_user(
    user_credentials: UserLogin, 
    response: Response, 
    db: Annotated[Connection, Depends(get_db)]
):
    login_query = text("""
        SELECT owner_id, hashed_password 
        FROM owner 
        WHERE owner_username = :username
    """)
    user = db.execute(login_query, {"username": user_credentials.username}).mappings().fetchone()

    if not user or not verify_hash(user_credentials.password, user["hashed_password"]):
        raise HTTPException(status_code=401, detail="Invalid credentials")

    access_token, refresh_token = attach_auth_cookies(response, user["owner_id"])
    
    return {
        "message": "Login successful",
        "access_token": access_token,
        "refresh_token": refresh_token,
        "token_type": "Bearer",
        "owner_id" : user["owner_id"]
    }

@route.post(
    "/refresh", 
    responses={
        401: {"description": "Unauthorized - Invalid or missing refresh token"}
    }
)
async def refresh_access_token(request: Request, response: Response):
    # Fallback para nakakasend ang client ng refresh token manually
    refresh_token = request.cookies.get("refresh_token") or request.headers.get("x-refresh-token")
    
    if not refresh_token:
        raise HTTPException(status_code=401, detail="Refresh token missing. Please log in again.")

    payload = verify_token(refresh_token)
    
    if not payload or payload.get("type") != "refresh":
        raise HTTPException(status_code=401, detail="Invalid or expired refresh token")

    owner_id = payload.get("sub")
    new_access_token = create_access_token({"sub": owner_id})

    response.set_cookie(
        key="access_token",
        value=f"Bearer {new_access_token}",
        httponly=True,
        secure=False,  # gawin niyo nalang true kapag naka https na
        samesite="lax",
        max_age=15 * 60 
    )

    return {
        "message": "Token refreshed successfully",
        "access_token": new_access_token,
        "token_type": "Bearer"
    }

@route.get(
    "/current_owner",
    response_model=UserResponse,
    responses={
        404: {"description": "Not Found - User does not exist"}
    }
)
async def get_user(owner_id: int, db: Annotated[Connection, Depends(get_db)]):
    # Modify nalang if kulang. Pag read lang naman toh data.
    # Pwede to copy sa ibang tables.
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