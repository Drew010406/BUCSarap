from typing import Annotated, List
from fastapi import APIRouter, Depends, HTTPException
from sqlalchemy import text, Connection
from backend.src.db.session import get_db
from backend.src.schema.history import HistoryItem, RevenueResponse

route = APIRouter()

@route.get("/{stall_id}", response_model=List[HistoryItem])
#gets all the completed orders of a stall. no filters pa dito, yung compilation lang ng lahat ng ordered items 
async def get_stall_history(stall_id: int, db: Annotated[Connection, Depends(get_db)]):
    
    query = text("""
        SELECT s.stall_name, s.stall_id, o.order_id, o.order_time, p.product_name, ol.unit_price_at_order AS item_total
        FROM order_line ol
        JOIN orders o ON o.order_id = ol.order_id
        JOIN product p ON ol.product_id = p.product_id
        JOIN stall s ON s.stall_id = o.stall_id
        WHERE s.stall_id = :stall_id AND o.order_status = "completed"
        ORDER BY o.order_time DESC, o.order_id
    """)
    
    try:
        results = db.execute(query, {"stall_id": stall_id}).mappings().fetchall()
        
        if not results:
            raise HTTPException(status_code=404, detail="No order history found for this stall")
        
        return results
    except HTTPException:
        raise
    except Exception as error:
        raise HTTPException(status_code=500, detail=f"Database error: {str(error)}")
    
@route.get("/revenue/{stall_id}", response_model=RevenueResponse)
#this returns the stall revenue. basically, it sums up all the unit_price_at_order
async def get_stall_revenue(stall_id: int, db: Annotated[Connection, Depends(get_db)]):
    """Get total revenue for a stall from completed orders"""
    query = text("""
        SELECT s.stall_name, s.stall_id, SUM(ol.unit_price_at_order) AS stall_revenue
        FROM order_line ol
        JOIN orders o ON o.order_id = ol.order_id
        JOIN product p ON ol.product_id = p.product_id
        JOIN stall s ON s.stall_id = o.stall_id
        WHERE s.stall_id = :stall_id AND o.order_status = "Completed"
    """)
    
    try:
        result = db.execute(query, {"stall_id": stall_id}).mappings().fetchone()
        
        if not result:
            raise HTTPException(status_code=404, detail="No revenue data found for this stall")
        
        return result
    except HTTPException:
        raise
    except Exception as error:
        raise HTTPException(status_code=500, detail=f"Database error: {str(error)}")
    
    