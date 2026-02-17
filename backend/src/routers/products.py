from fastapi import APIRouter

route = APIRouter()

@route.get("/products/", tags = ["products"])
async def read_products():
    return[{}]

