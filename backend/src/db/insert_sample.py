# insert_sample_data.py
from sqlalchemy import text
from session import engine

def insert_sample_data():
    with engine.begin() as conn:
        # 1. Insert owner
        conn.execute(
            text("""
                INSERT INTO owner (owner_username, hashed_password)
                VALUES ('abby_ynnas', 'hashed_password_123')
            """)
        )
        print("✅ Owner inserted")

        # 2. Insert stall
        conn.execute(
            text("""
                INSERT INTO stall (owner_id, stall_name, opening_time, closing_time, 
                                   operating_days, stall_status, photo_path)
                VALUES (1, 'Abby Ynnas', '10:00:00', '21:00:00', 
                        'Mon,Tue,Wed,Thu,Fri,Sat', true, '/stalls/abby_ynnas.jpg')
            """)
        )
        print("✅ Stall inserted")

        # 3. Insert products
        products = [
            (1, 'Hotdog', 'Grilled', 4.50, True, '/products/hotdog.jpg'),
            (1, 'Hamburger', 'Grilled', 5.75, True, '/products/hamburger.jpg'),
            (1, 'Banana', 'Fruit', 1.25, True, '/products/banana.jpg'),
            (1, 'Grilled Chicken', 'Poultry', 8.00, True, '/products/chicken.jpg'),
        ]
        for p in products:
            conn.execute(
                text("""
                    INSERT INTO product (stall_id, product_name, category_name, 
                                         product_price, product_status, photo_path)
                    VALUES (:sid, :pname, :cat, :price, :status, :photo)
                """),
                {"sid": p[0], "pname": p[1], "cat": p[2], "price": p[3], "status": p[4], "photo": p[5]}
            )
        print("✅ 4 products inserted")

        # 4. Insert first order (Pending, no processing time)
        conn.execute(
            text("""
                INSERT INTO orders (stall_id, order_number, order_status, order_time, 
                                    processing_time, customer_name)
                VALUES (1, 'ORD-1-1747123456', 'Pending', '2026-05-10 12:30:00', 
                        NULL, 'Mario')
            """)
        )
        print("✅ First order (order_id=1) inserted")

        # 5. Insert order lines for order_id = 1
        lines1 = [
            (1, 1, 2, 4.50),   # order_id=1, product_id=1 (Hotdog), quantity=2, price=4.50
            (1, 3, 1, 1.25),   # product_id=3 (Banana)
        ]
        for line in lines1:
            conn.execute(
                text("""
                    INSERT INTO order_line (order_id, product_id, quantity_ordered, unit_price_at_order)
                    VALUES (:oid, :pid, :qty, :price)
                """),
                {"oid": line[0], "pid": line[1], "qty": line[2], "price": line[3]}
            )
        print("✅ Order lines for first order inserted")

        # 6. Insert second order (Completed, with processing time)
        conn.execute(
            text("""
                INSERT INTO orders (stall_id, order_number, order_status, order_time, 
                                    processing_time, customer_name)
                VALUES (1, 'ORD-1-1747123999', 'Completed', '2026-05-10 13:15:00', 
                        15, 'Anna')
            """)
        )
        print("✅ Second order (order_id=2) inserted")

        # 7. Insert order lines for order_id = 2
        lines2 = [
            (2, 2, 1, 5.75),   # order_id=2, product_id=2 (Hamburger), quantity=1
            (2, 4, 2, 8.00),   # product_id=4 (Grilled Chicken), quantity=2
        ]
        for line in lines2:
            conn.execute(
                text("""
                    INSERT INTO order_line (order_id, product_id, quantity_ordered, unit_price_at_order)
                    VALUES (:oid, :pid, :qty, :price)
                """),
                {"oid": line[0], "pid": line[1], "qty": line[2], "price": line[3]}
            )
        print("✅ Order lines for second order inserted")

        print("\n🎉 All sample data inserted successfully!")

if __name__ == "__main__":
    insert_sample_data()