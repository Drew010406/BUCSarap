from typing import Annotated, List
from fastapi import APIRouter, Depends, HTTPException
from sqlalchemy import text, Connection

from backend.src.db.session import get_db
from backend.src.schema.owner_stall import *
from backend.src.schema.stalls import CategoryInfo
from backend.src.schema.product import ProductResponse

route = APIRouter()

"""Wait nalang ako ng update mo para sa flow ng screen sa owner side"""
@route.get("owners/{owner_id}/stalls/{stall_id}/categories", response_model=List[CategoryInfo])
async def get_owner_stall_categories(stall_id: int, owner_id: int, db: Annotated[Connection, Depends(get_db)]):

    verify_query = text("""
        SELECT stall_id
        FROM stall
        WHERE stall_id = :s_id AND owner_id = :o_id
    """)
    
    try:
        stall_exists = db.execute(verify_query, {"s_id": stall_id, "o_id": owner_id}).mappings().fetchone()
        
        if not stall_exists:
            raise HTTPException(status_code=404, detail="Stall not found")
        
        query = text("""
            SELECT 
                pc.category_id,
                pc.category_name
                
            FROM product_category pc
            JOIN stall s ON pc.stall_id = s.stall_id
            WHERE pc.stall_id = :s_id AND s.owner_id = :o_id  
        """)
        
        results = db.execute(query, {"s_id": stall_id, "o_id": owner_id}).mappings().fetchall()
        
        categories = [
            {
                "category_id": r["category_id"], 
                "category_name": r["category_name"]
            }
            for r in results
        ]
        
        return categories
    except HTTPException:
        raise
    except Exception as error:
        raise HTTPException(status_code=500, detail=f"Database error: {str(error)}")

"""same lang sa products route. babaguhin ko nalang depende sa update mo sa flow ng screen"""
@route.get("/category/{category_id}", response_model= List[ProductResponse])
async def get_owner_products_by_category(category_id : int, db : Annotated[Connection, Depends(get_db)]):
    
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
    
"""Accept order endpoint. pass in lang ang order id tapos return yung order number."""
@route.patch("/{order_id}")
async def accept_orders(order_id: int, stall_id: int, db: Annotated[Connection, Depends(get_db)]):
    
    update_query = text("""
           
        UPDATE orders
        SET order_status = 'Preparing'
        WHERE order_id = :o_id AND stall_id = :s_id
        """)
    
    get_order_number = text("""
               
        SELECT order_number
        FROM orders             
        WHERE order_id = :o_id
        """)
    
    try: 
        results = db.execute(update_query, {"o_id": order_id, "s_id": stall_id})
        db.commit()
        
        results = db.execute(get_order_number, {"o_id":order_id}).mappings().fetchone()        
        order_number = results["order_number"]
        
        return {"message": "Successfully accepted order, please wait while your order is being prepared!\nYour order nunmber: {order_number}", "order_number": order_number}
    
    except Exception as error:
        db.rollback()
        raise HTTPException(status_code=500, detail=f"Error: {str(error)}")