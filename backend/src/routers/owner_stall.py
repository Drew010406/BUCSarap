from typing import Annotated, List
from fastapi import APIRouter, Depends, HTTPException
from sqlalchemy import text, Connection

from backend.src.db.session import get_db
from backend.src.schema.owner_stall import *
from backend.src.schema.stalls import CategoryInfo
from backend.src.schema.product import ProductResponse, CreateProduct
from backend.src.schema.owner_stall import ProductUpdate

route = APIRouter()

"""Wait nalang ako ng update mo para sa flow ng screen sa owner side"""
@route.get("/owners/{owner_id}/stalls/{stall_id}/categories", response_model=List[CategoryInfo])
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
@route.patch("accept_order/{order_id}")
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
    
@route.patch("/{owner_id}/products/{product_id}")
async def update_product(product_id: int, owner_id: int, product_update: ProductUpdate, db: Annotated[Connection, Depends(get_db)]):
    
    verification_query = text("""
                              
            SELECT p.product_name, s.owner_id
            FROM stall s
            JOIN product_category pc ON pc.stall_id = s.stall_id
            JOIN product p ON p.category_id = pc.category_id
            WHERE p.product_id = :p_id AND s.owner_id = :o_id
        """)
    
    results = db.execute(verification_query, {"p_id": product_id, "o_id": owner_id}).mappings().fetchone()
    
    if not results:
        raise HTTPException(status_code=404, detail=f"Product with ID: {product_id} of Owner ID: {owner_id} was not found.")

    update_data = product_update.model_dump(exclude_unset=True)
    
    if not update_data:
        raise HTTPException(status_code=400, detail="No fields to update.")
    
    update_fields = []
    params = {"product_id": product_id}
    
    for field,value in update_data.items():
        update_fields.append(f"{field} = :{field}")
        params[field] = value
        
    update_query = text(f"""
           
        UPDATE product
        SET {','.join(update_fields)}
        WHERE product_id = :product_id             
        """)    
    
    try:
        
        db.execute(update_query, params)
        db.commit()
    
        check_query = text("""
                           
            SELECT * 
            FROM product
            WHERE product_id = :product_id
            """)
        
        updated_product = db.execute(check_query, {"product_id": product_id}).mappings().fetchone()
        return updated_product
    
    except Exception as error:
        
        db.rollback()
        raise HTTPException(status_code= 500, detail=f"Database error: {str(error)}")    

@route.patch("/{owner_id}/products/{product_id}/toggle-status")
async def toggle_product_status(product_id: int, owner_id:int, db: Annotated[Connection, Depends(get_db)]):
    
    verification_query = text("""
                              
            SELECT p.product_name, p.product_status, s.owner_id
            FROM stall s
            JOIN product_category pc ON pc.stall_id = s.stall_id
            JOIN product p ON p.category_id = pc.category_id
            WHERE p.product_id = :p_id AND s.owner_id = :o_id
        """)
    
    results = db.execute(verification_query, {"p_id": product_id, "o_id": owner_id}).mappings().fetchone()
    
    if not results:
        raise HTTPException(status_code=404, detail=f"Product with ID: {product_id} of Owner ID: {owner_id} was not found.")

    product_status = results["product_status"]
    
    toggled_status = not product_status
    
    update_query = text("""
                        
        UPDATE product
        SET product_status = :p_status
        WHERE product_id = :p_id
        """)
    
    try:
        
        db.execute(update_query, {"p_status": toggled_status, "p_id": product_id})
        db.commit()
        
        check_query = text("""
                           
            SELECT * 
            FROM product
            WHERE product_id = :product_id
            """)
        
        updated_product = db.execute(check_query, {"product_id": product_id}).mappings().fetchone()
        return updated_product

    except Exception as error:
        
        db.rollback()
        raise HTTPException(status_code= 500, detail=f"Database error: {str(error)}")    

@route.delete("/orders/{order_id}")
async def decline_order(order_id: int, stall_id: int, db: Annotated[Connection, Depends(get_db)]):
    
    verification_query = text("""

        SELECT *
        FROM orders 
        WHERE order_id = :o_id AND stall_id = :s_id AND order_status = 'Pending'                 
        """)
    
    results = db.execute(verification_query, {"o_id": order_id, "s_id": stall_id}).mappings().fetchone()

    if not results:
        raise HTTPException(status_code=404, detail="Order not found or Order is no longer in Pending phase.")

    # First delete order line items, then delete the order
    delete_line_items_query = text("""
        DELETE FROM order_line 
        WHERE order_id = :o_id        
    """)
    
    delete_order_query = text("""
        DELETE FROM orders 
        WHERE order_id = :o_id        
    """)
    
    try:

        db.execute(delete_line_items_query, {"o_id": order_id})
        db.execute(delete_order_query, {"o_id": order_id})
        db.commit()
        
        return {"message": f"Successfully declined order number: {order_id}"}
        
    except Exception as error:
        db.rollback()
        raise HTTPException(status_code=500, detail=f"Error: {str(error)}")

@route.delete("/{owner_id}/products/{product_id}")
async def delete_product(owner_id: int, product_id: int, db: Annotated[Connection, Depends(get_db)]):
    
    verification_query = text("""
                              
            SELECT p.product_name, s.owner_id
            FROM stall s
            JOIN product_category pc ON pc.stall_id = s.stall_id
            JOIN product p ON p.category_id = pc.category_id
            WHERE p.product_id = :p_id AND s.owner_id = :o_id
        """)
    
    results = db.execute(verification_query, {"p_id": product_id, "o_id": owner_id}).mappings().fetchone()
    
    if not results:
        raise HTTPException(status_code=404, detail=f"Product with ID: {product_id} of Owner ID: {owner_id} was not found.")

    delete_query = text("""
                        
            DELETE p
            FROM product p 
            JOIN product_category pc ON pc.category_id = p.category_id
            JOIN stall s ON s.stall_id = pc.stall_id
            WHERE p.product_id = :p_id AND s.owner_id = :o_id                        
        """)
    
    try:
        
        results = db.execute(delete_query, {"p_id": product_id, "o_id": owner_id })
        db.commit()
        return {"message": f"Successfully deleted Product {product_id} OF Owner {owner_id}"}
    
    except Exception as error:
        
        db.rollback()
        raise HTTPException(status_code=500, detail= f"Error: {str(error)}")
    
@route.post("owners/{owner_id}/stalls/{stall_id}/categories/{category_id}/add_product")
async def add_product(owner_id: int, category_id: int, stall_id: int, product_data: CreateProduct, db: Annotated[Connection, Depends(get_db)]):
    
    verification_query = text("""
           
           SELECT *
           FROM stall s
           JOIN product_category pc ON pc.stall_id = s.stall_id
           WHERE s.stall_id = :s_id AND s.owner_id = :o_id AND pc.category_id = :c_id                
        """)
    
    results = db.execute(verification_query, {"s_id": stall_id, "o_id": owner_id, "c_id": category_id}).mappings().fetchone()
    
    if not results:
        raise HTTPException(status_code=404, detail=f"No results for Owner ID {owner_id}, Stall ID {stall_id} with Category ID {category_id}")
    
    
    existing_check_query = text("""
                            
        SELECT *
        FROM product
        WHERE product_name = :p_name                     
    """)
    
    results = db.execute(existing_check_query, {"p_name": product_data.product_name}).mappings().fetchall()

    if len(results) > 0:
        raise HTTPException(status_code=400, detail=f"Product '{product_data.product_name}' already exists.")

    insertion_query = text("""
           
        INSERT INTO product (category_id, product_name, product_price, product_status, photo_path)
        VALUES (:c_id, :p_name, :p_price, :p_status, :p_path)
        """)
    
    try:
        results = db.execute(insertion_query, {
                "c_id": category_id, 
                "p_name": product_data.product_name, 
                "p_price": product_data.product_price, 
                "p_status": product_data.product_status, 
                "p_path": product_data.photo_path           
                })
        
        db.commit()
        
        check_query = text("""
                       
            SELECT * 
            FROM product
            WHERE product_name = :p_name          
            """)
        
        results = db.execute(check_query, {"p_name": product_data.product_name}).mappings().fetchone()
        return results
        
    except Exception as error:
        db.rollback()
        raise HTTPException(status_code=500, detail=f"Error: {str(error)}")        
    
@route.patch("complete_order/{order_id}")
async def complete_order(order_id: int, stall_id: int, db: Annotated[Connection, Depends(get_db)]):
    
    update_query = text("""
           
        UPDATE orders
        SET order_status = 'Completed'
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
        
        return {"message": "Successfully completed order, please come to the cashier to claim!\nYour order nunmber: {order_number}", "order_number": order_number}
    
    except Exception as error:
        db.rollback()
        raise HTTPException(status_code=500, detail=f"Error: {str(error)}")