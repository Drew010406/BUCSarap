from typing import Annotated, List
from fastapi import APIRouter, Depends, HTTPException
from sqlalchemy import text, Connection
from backend.src.db.session import get_db
from backend.src.schema.product import ProductResponse, ProductInfo

route = APIRouter()

#Gets all the products from a category based off of the id
@route.get("/category/{category_id}", response_model= List[ProductResponse])
async def get_products_by_category(category_id : int, db : Annotated[Connection, Depends(get_db)]):
    
    #just matches the category id (unique ang kada category id so no need na yung stall id)
    query = text("""
        SELECT p.product_id,
            p.product_name,
            p.product_price,
            p.product_status,
            p.photo_path,
            
            s.stall_id,
            s.stall_name,
            
            pc.category_id,
            pc.category_name
        
        FROM stall s
        
        JOIN product_category pc ON pc.stall_id = s.stall_id
        JOIN product p ON p.category_id = pc.category_id
        WHERE pc.category_id = :category_id AND p.product_status = 1
    """)
    
    try:
        results = db.execute(query, {"category_id" : category_id}).mappings().fetchall()
        return results
    except Exception as error:
        raise HTTPException(status_code=500, detail=f"Database error: {str(error)}")

@route.get("/products/{product_id}", response_model= ProductInfo)
async def get_product_info(product_id : int, db : Annotated[Connection, Depends(get_db)]):
    
    query = text("""
        SELECT p.product_name, p.photo_path
        FROM product p
        WHERE p.product_id = :id
    """)
    
    try:
        results = db.execute(query, {"id" : product_id}).mappings().fetchone()
        return results
    
    except Exception as error:
        raise HTTPException(status_code=500, detail=f"Database error: {str(error)}")