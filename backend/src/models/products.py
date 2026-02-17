from pydantic import BaseModel
from fastapi import FastAPI

App = FastAPI()

class Products:
    name: str;
    price: float;
    