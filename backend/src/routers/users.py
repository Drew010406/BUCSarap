from fastapi import APIRouter

route = APIRouter()

# Peter Bañares part mo na to 
@route.get("/users/", tags=["/users/"]) 
async def read_users():
    return [{}]