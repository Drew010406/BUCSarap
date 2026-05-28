from typing import Annotated, List
from fastapi import APIRouter, Depends, HTTPException
from sqlalchemy import text, Connection
from backend.src.db.session import get_db
from backend.src.schema.stalls import StallUpdate, StallResponse, StallCategories

route = APIRouter()

@route.get("/", response_model=List[StallResponse])
#gets all stalls 
async def get_all_stalls(db: Annotated[Connection, Depends(get_db)]):
    
    query = text("""
        SELECT stall_id, owner_id, stall_name, opening_time, closing_time, operating_days, stall_status, photo_path
        FROM stall
    """)
    
    try:
        results = db.execute(query).mappings().fetchall()
        return results
    
    except Exception as error:
        raise HTTPException(status_code=500, detail=f"Database error: {str(error)}")


@route.get("/{stall_id}",response_model=StallResponse)
#gets info of a stall using the stall id 
async def get_stall(stall_id: int,owner_id: int, db: Annotated[Connection, Depends(get_db)]):
    

    query = text("""
        SELECT stall_id, owner_id, stall_name, opening_time, closing_time, operating_days, stall_status, photo_path
        FROM stall
        WHERE stall_id = :s_id AND owner_id = :o_id
    """)
    
    try:
        result = db.execute(query, {"s_id": stall_id, "o_id": owner_id}).mappings().fetchone()
        
        if not result:
            raise HTTPException(status_code=404, detail="Stall not found")
        
        return result
    except HTTPException:
        raise
    
    except Exception as error:
        raise HTTPException(status_code=500, detail=f"Database error: {str(error)}")


@route.get("/{stall_id}/with-categories", response_model=StallCategories)

async def get_stall_with_categories(stall_id: int, db: Annotated[Connection, Depends(get_db)]):

    #gets the stall info and categories
    query = text("""
        SELECT 
            s.stall_id,
            s.stall_name,
            pc.category_id,
            pc.category_name
            
        FROM stall s
        LEFT JOIN product_category pc ON s.stall_id = pc.stall_id
        WHERE s.stall_id = :id
    """)
    
    try:
        results = db.execute(query, {"id": stall_id}).mappings().fetchall()
        
        if not results:
            raise HTTPException(status_code=404, detail="Stall not found")
        
        # Build stall with categories and products
        stall_data = {
            
            "stall_id": results[0]["stall_id"],
            "stall_name" : results[0]["stall_name"],
            "categories": [
                {
                    "category_id": r["category_id"], 
                    "category_name": r["category_name"]}
                for r in results if r["category_id"]
            ]
        }
        
        return stall_data
    except HTTPException:
        raise
    except Exception as error:
        raise HTTPException(status_code=500, detail=f"Database error: {str(error)}")


@route.put("/{stall_id}",response_model=StallResponse)
async def update_stall(stall_id: int, stall_update: StallUpdate, db: Annotated[Connection, Depends(get_db)]):


    # Check if stall exists
    check_query = text("""
        SELECT stall_id 
        FROM stall 
        WHERE stall_id = :id
    """)
    
    existing_stall = db.execute(check_query, {"id": stall_id}).mappings().fetchone()
    
    if not existing_stall:
        raise HTTPException(status_code=404, detail="Stall not found")
    
    update_data = stall_update.model_dump(exclude_unset=True)
    
    if not update_data:
        raise HTTPException(status_code=400, detail="No fields to update")
    
    # Build dynamiDc update query
    update_fields = []
    params = {"id": stall_id}
    
    for field, value in update_data.items():
        update_fields.append(f"{field} = :{field}")
        params[field] = value
    
    update_query = text(f"""
        UPDATE stall
        SET {', '.join(update_fields)}
        WHERE stall_id = :id
    """)
    
    try:
        
        db.execute(update_query, params)
        db.commit()
        
        select_query = text("""
            SELECT stall_id, owner_id, stall_name, opening_time, closing_time, operating_days, stall_status, photo_path
            FROM stall
            WHERE stall_id = :id
        """)
        
        updated_stall = db.execute(select_query, {"id": stall_id}).mappings().fetchone()
        return updated_stall
    
    except Exception as error:
        
        db.rollback()
        raise HTTPException(status_code=400, detail=f"Database error: {str(error)}")
    
