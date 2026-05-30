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
        WHERE pc.category_id = :category_id
    """)
    
    try:
        results = db.execute(query, {"category_id" : category_id}).mappings().fetchall()
        return results
    except Exception as error:
        raise HTTPException(status_code=500, detail=f"Database error: {str(error)}")
    
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
    
@route.post("/owner/{owner_id}/stall/{stall_id}/product_category/add_category")
async def add_product_category(stall_id: int, owner_id: int, category_name: str, db: Annotated[Connection, Depends(get_db)]):
    
    verification_query = text("""
                              
           SELECT *
           FROM stall 
           WHERE owner_id = :o_id AND stall_id = :s_id                   
        """)
    
    result = db.execute(verification_query, {"o_id": owner_id, "s_id": stall_id}).mappings().fetchone()
    
    if not result:
        raise HTTPException(status_code=404, detail="Stall not found")
    
    duplicate_check_query = text("""
                                 
           SELECT * 
           FROM product_category
           WHERE stall_id = :s_id AND category_name = :c_name
        """)

    result = db.execute(duplicate_check_query, {"s_id": stall_id, "c_name": category_name}).mappings().fetchall()

    if len(result) > 0:
        
        raise HTTPException(status_code=400, detail=f"Category name '{category_name}' already exists for stall {stall_id}.")
    
    insert_query = text("""
            
           INSERT INTO product_category(stall_id, category_name)
           VALUES(:s_id, :c_name)           
        """)
    
    try:
        db.execute(insert_query, {"s_id": stall_id, "c_name": category_name})
        db.commit()
        
        check_query = text("""
               
               SELECT *
               FROM product_category
               WHERE stall_id = :s_id AND category_name = :c_name             
            """)
        
        result = db.execute(check_query, {"s_id": stall_id, "c_name": category_name}).mappings().fetchone()
        category_id = result["category_id"]
        
        return {"message": f"Successfully created category '{category_name}' with category id: {category_id} for stall {stall_id}."}
    
    except Exception as error:
        db.rollback()
        raise HTTPException(status_code=500, detail=f"Error: {str(error)}")

@route.patch("/owner/{owner_id}/stall/{stall_id}/product_category/{category_id}/rename_category")
async def rename_category(stall_id: int, category_id: int, owner_id: int, new_category_name: str, db: Annotated[Connection, Depends(get_db)]):
    
    verification_query = text("""
                              
           SELECT *
           FROM stall s
           JOIN product_category pc ON pc.stall_id = s.stall_id
           WHERE s.owner_id = :o_id AND s.stall_id = :s_id AND pc.category_id = :c_id
        """)
    
    result = db.execute(verification_query, {"o_id": owner_id, "s_id": stall_id, "c_id": category_id}).mappings().fetchone()
    
    if not result:
        raise HTTPException(status_code=404, detail="Could not find category with the stall and owner IDs provided")
    
    previous_category_name = result["category_name"]
    
    check_for_duplicate_query = text("""
                              
        SELECT *
        FROM product_category 
        WHERE stall_id = :s_id
        """)
    
    result = db.execute(check_for_duplicate_query, {"s_id": stall_id}).mappings().fetchall()
    
    categories = []

    for cat_name in result:
        categories.append(cat_name["category_name"])

    if new_category_name in categories:
        raise HTTPException(status_code=400, detail=f"Category name '{new_category_name}' already exists in categories")
    
    update_query = text("""
    
            UPDATE product_category
            SET category_name = :c_name  
            WHERE category_id = :c_id          
        """)
    
    try:
        
        db.execute(update_query, {"c_name": new_category_name, "c_id": category_id})
        db.commit()
        
        check_query = text("""
                           
            SELECT *
            FROM product_category
            WHERE category_id = :c_id AND category_name = :c_name            
            """)
            
        result = db.execute(check_query, {"c_name": new_category_name, "c_id": category_id}).mappings().fetchone()

        return {"Message": f"Successfully renamed '{previous_category_name}' to '{new_category_name}'."}
    
    except Exception as error:
        
        db.rollback()
        raise HTTPException(status_code=500, detail=f"Error: {str(error)}")