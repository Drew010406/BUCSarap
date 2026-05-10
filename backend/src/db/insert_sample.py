import random
from datetime import datetime, timedelta
from sqlalchemy import text
from session import engine

def insert_large_sample_data():
    with engine.begin() as conn:
        owners = []
        for i in range(1, 11):
            username = f"owner_{i}"
            hashed_password = f"hashed_{username}_pwd"
            conn.execute(
                text("INSERT INTO owner (owner_username, hashed_password) VALUES (:un, :hp)"),
                {"un": username, "hp": hashed_password}
            )

            owner_id = conn.execute(text("SELECT LAST_INSERT_ID()")).scalar()
            owners.append(owner_id)
            print(f"Inserted owner {i}: {username} (id={owner_id})")

        stall_names = [
            "Maria's BBQ", "Joe's Burgers", "Thai Delight", "Sushi House", "Pasta Heaven",
            "Taco Fiesta", "Vegan Vibes", "Coffee Break", "Dessert Factory", "Seafood Shack"
        ]
        operating_days = ["Mon,Tue,Wed,Thu,Fri", "Mon,Tue,Wed,Thu,Fri,Sat", "Wed,Thu,Fri,Sat,Sun", "Daily", "Weekends"]
        stalls = []
        for idx, owner_id in enumerate(owners):
            stall_name = stall_names[idx % len(stall_names)] + f" #{idx+1}"
            opening = f"{random.randint(8,11)}:00:00"
            closing = f"{random.randint(18,23)}:00:00"
            op_days = random.choice(operating_days)
            status = random.choice([True, False])
            photo = f"/stalls/stall_{idx+1}.jpg"
            conn.execute(
                text("""
                    INSERT INTO stall (owner_id, stall_name, opening_time, closing_time,
                                       operating_days, stall_status, photo_path)
                    VALUES (:oid, :sname, :open, :close, :days, :status, :photo)
                """),
                {"oid": owner_id, "sname": stall_name, "open": opening, "close": closing,
                 "days": op_days, "status": status, "photo": photo}
            )
            stall_id = conn.execute(text("SELECT LAST_INSERT_ID()")).scalar()
            stalls.append(stall_id)
            print(f"Inserted stall '{stall_name}' (id={stall_id}) for owner {owner_id}")
        
        product_names = [
            "Hotdog", "Hamburger", "Cheeseburger", "French Fries", "Onion Rings",
            "Caesar Salad", "Pizza Slice", "Spaghetti", "Fried Chicken", "Fish & Chips",
            "Spring Rolls", "Pad Thai", "Sushi Roll", "Miso Soup", "Tacos",
            "Burrito", "Vegan Bowl", "Latte", "Cappuccino", "Cheesecake"
        ]
        categories = ["Grilled", "Fast Food", "Seafood", "Vegetarian", "Dessert", "Beverage", "Soup"]
        
        products = {} 
        for stall_id in stalls:
            num_products = random.randint(5, 10)
            prod_list = []
            for p in range(num_products):
                p_name = random.choice(product_names) + f" (S{stall_id})"
                category = random.choice(categories)
                price = round(random.uniform(1.5, 25.0), 2)
                status = random.choice([True, True, True, False])
                photo = f"/products/stall_{stall_id}_prod_{p+1}.jpg"
                conn.execute(
                    text("""
                        INSERT INTO product (stall_id, product_name, category_name,
                                             product_price, product_status, photo_path)
                        VALUES (:sid, :pname, :cat, :price, :status, :photo)
                    """),
                    {"sid": stall_id, "pname": p_name, "cat": category,
                     "price": price, "status": status, "photo": photo}
                )
                prod_id = conn.execute(text("SELECT LAST_INSERT_ID()")).scalar()
                prod_list.append(prod_id)
            products[stall_id] = prod_list
            print(f"Inserted {num_products} products for stall {stall_id}")
        
        start_date = datetime(2026, 4, 1)
        end_date = datetime(2026, 5, 10)
        days_range = (end_date - start_date).days
        
        order_counter = 0
        for stall_id in stalls:
            stall_products = products[stall_id]
            if not stall_products:
                continue
            for order_num in range(1, 31):  # 30 orders per stall
                # Random order_time within date range
                rand_days = random.randint(0, days_range)
                order_time = start_date + timedelta(days=rand_days, 
                                                    hours=random.randint(9,21),
                                                    minutes=random.randint(0,59))
                # Unique order_number
                order_number = f"ORD-{stall_id}-{order_num}-{int(order_time.timestamp())}"
                # Random status (mostly Pending or Completed)
                status = random.choices(["Pending", "Completed"], weights=[0.3, 0.7])[0]
                processing_time = None
                if status == "Completed":
                    # processing_time in minutes (5 to 45)
                    processing_time = random.randint(5, 45)
                # Customer name - random or None
                customer_name = random.choice([f"Customer_{random.randint(1,100)}", None])
                
                conn.execute(
                    text("""
                        INSERT INTO orders (stall_id, order_number, order_status, 
                                            order_time, processing_time, customer_name)
                        VALUES (:sid, :onum, :ostatus, :otime, :ptime, :cname)
                    """),
                    {"sid": stall_id, "onum": order_number, "ostatus": status,
                     "otime": order_time, "ptime": processing_time, "cname": customer_name}
                )
                order_id = conn.execute(text("SELECT LAST_INSERT_ID()")).scalar()
                
                # Insert 1 to 5 order lines for this order
                num_lines = random.randint(1, 5)
                for _ in range(num_lines):
                    product_id = random.choice(stall_products)
                    # Get current product price (but we store as unit_price_at_order)
                    price_row = conn.execute(
                        text("SELECT product_price FROM product WHERE product_id = :pid"),
                        {"pid": product_id}
                    ).fetchone()
                    unit_price = price_row[0]
                    quantity = random.randint(1, 4)
                    conn.execute(
                        text("""
                            INSERT INTO order_line (order_id, product_id, quantity_ordered, unit_price_at_order)
                            VALUES (:oid, :pid, :qty, :price)
                        """),
                        {"oid": order_id, "pid": product_id, "qty": quantity, "price": unit_price}
                    )
                order_counter += 1
                if order_counter % 50 == 0:
                    print(f"Inserted {order_counter} orders so far...")
        
        print(f"\n🎉 Completed! Inserted:")
        print(f"   - {len(owners)} owners")
        print(f"   - {len(stalls)} stalls")
        total_products = sum(len(plist) for plist in products.values())
        print(f"   - {total_products} products")
        print(f"   - {order_counter} orders with order lines")

if __name__ == "__main__":
    insert_large_sample_data()