from typing import Annotated, List
from fastapi import APIRouter, Depends, HTTPException
from sqlalchemy import text, Connection
from backend.src.db.session import get_db
from backend.src.schema.history import HistoryItem, RevenueResponse, RevenueComparison

route = APIRouter()

@route.get("/{stall_id}", response_model=List[HistoryItem])

async def get_stall_history(stall_id: int, db: Annotated[Connection, Depends(get_db)]):
    
    query = text("""
                 
        SELECT order_id, customer_name, order_number
        FROM orders
        WHERE stall_id = :s_id AND order_status = "Completed"
        ORDER BY order_id
    """)
    
    try:
        results = db.execute(query, {"s_id": stall_id}).mappings().fetchall()
        
        if not results:
            raise HTTPException(status_code=204, detail="No order history found for this stall")
        
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
            raise HTTPException(status_code=204, detail="No revenue data found for this stall")
        
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
                raise HTTPException(status_code=204, detail="No revenue data found for this stall")
        
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
                raise HTTPException(status_code=204, detail="No revenue data found for this stall")
        
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
                raise HTTPException(status_code=204, detail="No revenue data found for this stall")
        
            return result

        except HTTPException:
            raise

        except Exception as error:
            raise HTTPException(status_code=500, detail=f"Database error: {str(error)}")

@route.delete("stall/{stall_id}/delete_order/{order_id}")
async def delete_order(stall_id : int, order_id: int, db: Annotated[Connection, Depends(get_db)]):
    
    delete_order_line_query = text("""
           
        DELETE
        FROM order_line
        WHERE order_id = :o_id                            
        """)
    
    delete_order_query =  text("""
           
        DELETE 
        FROM orders
        WHERE order_id = :o_id                            
        """)
    
    check_query =  text("""
           
        SELECT *
        FROM orders
        WHERE order_id = :o_id                            
        """)
    
    try: 
        results = db.execute(delete_order_line_query, {"o_id": order_id})
        db.commit()
        
        results = db.execute(delete_order_query, {"o_id": order_id})
        db.commit()
        
        check = db.execute(check_query, {"o_id": order_id}).mappings().fetchone()
        if not check:
            return {"message": f"Successfully deleted order number {order_id} from transaction history."}
        
    except Exception as error:
        db.rollback()
        raise HTTPException(status_code=500, detail=f"Error: {str(error)}")
        
@route.get("/{stall_id}/one_day_comparison", response_model=RevenueComparison)
async def one_day_comparison(stall_id: int, owner_id: int, db: Annotated[Connection, Depends(get_db)]):
    
    query = text("""
                 
        SELECT
            SUM(CASE WHEN DATE(o.order_time) = CURRENT_DATE() 
            THEN ol.quantity_ordered * ol.unit_price_at_order 
            ELSE 0 END) AS revenue_today,
            
            SUM(CASE WHEN DATE(o.order_time) = CURRENT_DATE() - INTERVAL 1 DAY 
            THEN ol.quantity_ordered * ol.unit_price_at_order 
            ELSE 0 END) AS revenue_yesterday
    
        FROM orders o

        JOIN stall s ON s.stall_id = o.stall_id
        JOIN order_line ol ON ol.order_id = o.order_id

        WHERE DATE(o.order_time) >= CURRENT_DATE() - INTERVAL 1 DAY AND s.stall_id = :s_id AND o.order_status = "Completed"
        """)
    
    try:
        result = db.execute(query, {"s_id": stall_id}).mappings().first()
        
        if result is None:
            
            revenue_today = 0
            revenue_yesterday = 0
            
        else:
            revenue_today = result["revenue_today"] or 0
            revenue_yesterday = result["revenue_yesterday"] or 0
        
        return await comparison_helper_function(stall_id, revenue_today, revenue_yesterday)

    except HTTPException:
        raise
    except Exception as error:
        raise HTTPException(status_code=500, detail=f"Error: {str(error)}")        
    
    
@route.get("/{stall_id}/weekly_comparison", response_model=RevenueComparison)
async def weekly_comparison(stall_id: int, owner_id: int, db: Annotated[Connection, Depends(get_db)]):
    
    query = text("""
                 
        SELECT
            SUM(CASE WHEN WEEK(o.order_time, 1) = WEEK(CURRENT_DATE(), 1) AND YEAR(CURRENT_DATE()) = YEAR(o.order_time) 
            THEN ol.quantity_ordered * ol.unit_price_at_order 
            ELSE 0 END) AS revenue_this_week,
            
            SUM(CASE WHEN WEEK(o.order_time, 1) = WEEK(CURRENT_DATE() -  INTERVAL 1 WEEK, 1) AND YEAR(CURRENT_DATE()) = YEAR(o.order_time)
            THEN ol.quantity_ordered * ol.unit_price_at_order 
            ELSE 0 END) AS revenue_last_week
    
        FROM orders o

        JOIN stall s ON s.stall_id = o.stall_id
        JOIN order_line ol ON ol.order_id = o.order_id

        WHERE DATE(o.order_time) >= CURRENT_DATE() - INTERVAL 1 WEEK AND s.stall_id = :s_id AND o.order_status = "Completed"
        """)
    
    try:
        result = db.execute(query, {"s_id": stall_id}).mappings().first()
        
        if result is None:

            revenue_this_week = 0
            revenue_last_week = 0
            
        else:

            revenue_this_week = result["revenue_this_week"] or 0
            revenue_last_week = result["revenue_last_week"] or 0
        
        return await comparison_helper_function(stall_id, revenue_this_week, revenue_last_week)

    except HTTPException:
        raise
    except Exception as error:
        raise HTTPException(status_code=500, detail=f"Error: {str(error)}")        
    
    
@route.get("/{stall_id}/monthly_comparison", response_model=RevenueComparison)
async def monthly_comparison(stall_id: int, owner_id: int, db: Annotated[Connection, Depends(get_db)]):
    
    query = text("""
                 
        SELECT
            SUM(CASE WHEN MONTH(o.order_time) = MONTH(CURRENT_DATE()) AND YEAR(CURRENT_DATE()) = YEAR(o.order_time) 
            THEN ol.quantity_ordered * ol.unit_price_at_order 
            ELSE 0 END) AS revenue_this_month,
            
            SUM(CASE WHEN MONTH(o.order_time) = MONTH(CURRENT_DATE() -  INTERVAL 1 MONTH) AND YEAR(CURRENT_DATE()) = YEAR(o.order_time)
            THEN ol.quantity_ordered * ol.unit_price_at_order 
            ELSE 0 END) AS revenue_last_month
    
        FROM orders o

        JOIN stall s ON s.stall_id = o.stall_id
        JOIN order_line ol ON ol.order_id = o.order_id

        WHERE DATE(o.order_time) >= CURRENT_DATE() - INTERVAL 2 MONTH AND s.stall_id = :s_id AND o.order_status = "Completed"
        """)
    
    try:
        result = db.execute(query, {"s_id": stall_id}).mappings().first()
        
        if result is None:

            revenue_this_month = 0
            revenue_last_month = 0
            
        else:
            revenue_this_month = result["revenue_this_month"] or 0
            revenue_last_month = result["revenue_last_month"] or 0
        
        return await comparison_helper_function(stall_id, revenue_this_month, revenue_last_month)

    except HTTPException:
        raise
    except Exception as error:
        raise HTTPException(status_code=500, detail=f"Error: {str(error)}")        
    
    
async def comparison_helper_function(stall_id: int, current_rev: float, prev_rev: float):
        
    revenue_difference = current_rev - prev_rev
    
    if prev_rev > 0:
        percentage_change = ((current_rev - prev_rev) / prev_rev) * 100
        
    else:
        percentage_change = 0 if current_rev == 0 else 100
        
    return RevenueComparison(
        
        stall_id = stall_id,
        current_revenue = current_rev,
        previous_revenue = prev_rev,
        revenue_difference = revenue_difference,
        percentage_change = round(percentage_change, 2)
    )