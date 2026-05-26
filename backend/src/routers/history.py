from typing import Annotated, List
from fastapi import APIRouter, Depends, HTTPException
from sqlalchemy import text, Connection
from backend.src.db.session import get_db
from backend.src.schema.history import HistoryItem, RevenueResponse

route = APIRouter()

@route.get("/{stall_id}", response_model=List[HistoryItem])

async def get_stall_history(stall_id: int, db: Annotated[Connection, Depends(get_db)]):
    
    query = text("""
                 
        SELECT order_id, customer_name, order_number
        FROM orders
        WHERE stall_id = 1 AND order_status = "Completed"
        ORDER BY order_id
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

    query = text("""

        SELECT s.stall_name, s.stall_id, SUM(ol.unit_price_at_order) AS stall_revenue

        FROM order_line ol

        JOIN orders o ON o.order_id = ol.order_id
        JOIN product p ON ol.product_id = p.product_id
        JOIN stall s ON s.stall_id = o.stall_id

        WHERE s.stall_id = :stall_id AND o.order_status = "Completed"
        GROUP BY s.stall_id, s.stall_name
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
    
@route.get("/revenue/{stall_id}/daily", response_model=RevenueResponse)
async def get_stall_revenue_daily(stall_id : int, db: Annotated[Connection, Depends(get_db)]):
    
        query = text("""

            SELECT s.stall_name, s.stall_id, SUM(ol.unit_price_at_order) AS stall_revenue

            FROM order_line ol

            JOIN orders o ON o.order_id = ol.order_id
            JOIN product p ON ol.product_id = p.product_id
            JOIN stall s ON s.stall_id = o.stall_id

            WHERE s.stall_id = :stall_id AND o.order_status = "Completed" AND DATE(o.order_time) = CURDATE()
            GROUP BY s.stall_id, s.stall_name
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
        
@route.get("/revenue/{stall_id}/weekly", response_model=RevenueResponse)
async def get_stall_revenue_weekly(stall_id : int, db: Annotated[Connection, Depends(get_db)]):
    
        query = text("""

            SELECT s.stall_name, s.stall_id, SUM(ol.unit_price_at_order) AS stall_revenue

            FROM order_line ol

            JOIN orders o ON o.order_id = ol.order_id
            JOIN product p ON ol.product_id = p.product_id
            JOIN stall s ON s.stall_id = o.stall_id

            WHERE s.stall_id = :stall_id AND o.order_status = "Completed" AND WEEK(o.order_time) = WEEK(NOW()) AND YEAR(o.order_time) = YEAR(NOW())
            GROUP BY s.stall_id, s.stall_name
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

@route.get("/revenue/{stall_id}/monthly", response_model=RevenueResponse)
async def get_stall_revenue_monthly(stall_id : int, db: Annotated[Connection, Depends(get_db)]):
    
        query = text("""

            SELECT s.stall_name, s.stall_id, SUM(ol.unit_price_at_order) AS stall_revenue

            FROM order_line ol

            JOIN orders o ON o.order_id = ol.order_id
            JOIN product p ON ol.product_id = p.product_id
            JOIN stall s ON s.stall_id = o.stall_id

            WHERE s.stall_id = :stall_id AND o.order_status = "Completed" AND MONTH(o.order_time) = MONTH(NOW()) AND YEAR(o.order_time) = YEAR(NOW())
            GROUP BY s.stall_id, s.stall_name
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
