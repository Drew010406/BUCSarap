from typing import Annotated, List
from fastapi import APIRouter, Depends, HTTPException
from sqlalchemy import text, Connection
from backend.src.db.session import get_db
from backend.src.schema.product import ProductResponse, StallResponse, OrderResponse

route = APIRouter()


#Gets all products from a stall with details
@route.get("/{stall_id}", response_model=List[ProductResponse])
async def get_stall_products(stall_id: int, db: Annotated[Connection, Depends(get_db)]):
    
    query = text("""
                 
        SELECT p.product_id, p.product_name, p.product_price, p.product_status, p.photo_path, pp.product_quantity, pc.category_id, pc.category_name
        FROM stall s
        
        JOIN product_category pc ON pc.stall_id = s.stall_id
        JOIN product p ON p.category_id = pc.category_id
        JOIN product_pile pp ON pp.product_id = p.product_id AND pp.stall_id = s.stall_id
        WHERE s.stall_id = :stall_id AND p.product_status = 1 AND pp.product_quantity > 0
    """)
    
    results = db.execute(query, {"stall_id": stall_id}).mappings().fetchall()
    return results

#Gets all the products from a category based off of the id
@route.get("/category/{category_id}", response_model= List[ProductResponse])
async def get_products_by_category(category_id : int, db : Annotated[Connection, Depends(get_db)]):
    
    #just matches the category id (unique ang kada category id so no need na yung stall id)
    query = text("""
                 
                SELECT product_id, product_name, product_price, product_status, category_id
                FROM product
                WHERE category_id = :category_id
                """)
    
    results = db.execute(query, {"category_id" : category_id}).mappings().fetchall()
    return results