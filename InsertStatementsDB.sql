-- OWNERS
INSERT INTO owner (owner_username, hashed_password) VALUES
('burgerboss', 'hashed_pw1'),
('riceking', 'hashed_pw2'),
('pastahub', 'hashed_pw3'),
('milkteamanila', 'hashed_pw4'),
('takoyakiworld', 'hashed_pw5'),
('sisigsentral', 'hashed_pw6'),
('ramenhouse', 'hashed_pw7'),
('bbqcorner', 'hashed_pw8'),
('sweetbite', 'hashed_pw9'),
('healthybowl', 'hashed_pw10');


-- STALLS
INSERT INTO stall 
(owner_id, stall_name, opening_time, closing_time, operating_days, stall_status, photo_path)
VALUES
(1, 'Burger Boss', '09:00:00', '21:00:00', 'Mon-Sun', true, 'images/burgerboss.jpg'),
(2, 'Rice King', '08:00:00', '20:00:00', 'Mon-Sat', true, 'images/riceking.jpg'),
(3, 'Pasta Hub', '10:00:00', '22:00:00', 'Mon-Sun', true, 'images/pastahub.jpg'),
(4, 'MilkTea Manila', '10:00:00', '23:00:00', 'Mon-Sun', true, 'images/milktea.jpg'),
(5, 'Takoyaki World', '11:00:00', '22:00:00', 'Tue-Sun', true, 'images/takoyaki.jpg'),
(6, 'Sisig Sentral', '09:00:00', '21:00:00', 'Mon-Sun', true, 'images/sisig.jpg'),
(7, 'Ramen House', '10:00:00', '22:00:00', 'Mon-Sun', true, 'images/ramen.jpg'),
(8, 'BBQ Corner', '12:00:00', '23:00:00', 'Mon-Sun', true, 'images/bbq.jpg'),
(9, 'Sweet Bite', '08:00:00', '20:00:00', 'Mon-Sun', true, 'images/sweetbite.jpg'),
(10, 'Healthy Bowl', '07:00:00', '19:00:00', 'Mon-Fri', true, 'images/healthybowl.jpg');


-- PRODUCT CATEGORIES
INSERT INTO product_category (stall_id, category_name) VALUES
(1, 'Burgers'),
(1, 'Fries'),
(2, 'Rice Meals'),
(3, 'Pasta'),
(4, 'Milk Tea'),
(5, 'Takoyaki'),
(6, 'Sisig Meals'),
(7, 'Ramen'),
(8, 'BBQ Meals'),
(9, 'Desserts'),
(10, 'Healthy Meals');


-- PRODUCTS
INSERT INTO product
(product_id, category_id, product_name, product_price, product_status, photo_path)
VALUES

-- Burger Boss
(1, 1, 'Classic Burger', 120.00, true, 'products/classicburger.jpg'),
(2, 1, 'Cheese Burger', 145.00, true, 'products/cheeseburger.jpg'),
(3, 2, 'Large Fries', 80.00, true, 'products/fries.jpg'),

-- Rice King
(4, 3, 'Chicken Teriyaki', 150.00, true, 'products/teriyaki.jpg'),
(5, 3, 'Beef Pepper Rice', 170.00, true, 'products/beefpepper.jpg'),

-- Pasta Hub
(6, 4, 'Carbonara', 180.00, true, 'products/carbonara.jpg'),
(7, 4, 'Spaghetti Bolognese', 160.00, true, 'products/spaghetti.jpg'),

-- MilkTea Manila
(8, 5, 'Wintermelon Milk Tea', 110.00, true, 'products/wintermelon.jpg'),
(9, 5, 'Okinawa Milk Tea', 120.00, true, 'products/okinawa.jpg'),

-- Takoyaki World
(10, 6, 'Octobits Takoyaki', 95.00, true, 'products/octobits.jpg'),
(11, 6, 'Cheese Takoyaki', 105.00, true, 'products/cheesetako.jpg'),

-- Sisig Sentral
(12, 7, 'Pork Sisig', 140.00, true, 'products/porksisig.jpg'),
(13, 7, 'Bangus Sisig', 150.00, true, 'products/bangussisig.jpg'),

-- Ramen House
(14, 8, 'Tonkotsu Ramen', 250.00, true, 'products/tonkotsu.jpg'),
(15, 8, 'Spicy Miso Ramen', 260.00, true, 'products/misoramen.jpg'),

-- BBQ Corner
(16, 9, 'Pork BBQ Meal', 130.00, true, 'products/porkbbq.jpg'),
(17, 9, 'Chicken BBQ Meal', 140.00, true, 'products/chickenbbq.jpg'),

-- Sweet Bite
(18, 10, 'Chocolate Cake Slice', 90.00, true, 'products/chococake.jpg'),
(19, 10, 'Blueberry Cheesecake', 110.00, true, 'products/cheesecake.jpg'),

-- Healthy Bowl
(20, 11, 'Chicken Salad Bowl', 160.00, true, 'products/chickensalad.jpg'),
(21, 11, 'Tofu Rice Bowl', 145.00, true, 'products/tofubowl.jpg');


-- ORDERS (Only 5 orders - all with status NOT 'Pending')
INSERT INTO orders (stall_id, order_number, order_status, customer_name, processing_time) VALUES
(1, 'STL1-0001', 'Completed', 'Juan Santos', 15),
(2, 'STL2-0001', 'Ready', 'Maria Garcia', 12),
(3, 'STL3-0001', 'Preparing', 'Carlos Reyes', NULL),
(4, 'STL4-0001', 'Completed', 'Ana Lopez', 10),
(5, 'STL5-0001', 'Ready', 'Peter Wong', 8);


-- ORDER LINE ITEMS (Only for the 5 orders with status NOT 'Pending')
INSERT INTO order_line (order_id, product_id, quantity_ordered, unit_price_at_order) VALUES
-- Order 1: Burger Boss (Juan) - 2x Classic Burger + 1x Large Fries
(1, 1, 2, 120.00),
(1, 3, 1, 80.00),

-- Order 2: Rice King (Maria) - 1x Chicken Teriyaki + 1x Beef Pepper Rice
(2, 4, 1, 150.00),
(2, 5, 1, 170.00),

-- Order 3: Pasta Hub (Carlos) - 1x Carbonara + 2x Spaghetti Bolognese
(3, 6, 1, 180.00),
(3, 7, 2, 160.00),

-- Order 4: MilkTea Manila (Ana) - 3x Wintermelon Milk Tea
(4, 8, 3, 110.00),

-- Order 5: Takoyaki World (Peter) - 2x Octobits Takoyaki + 1x Cheese Takoyaki
(5, 10, 2, 95.00),
(5, 11, 1, 105.00);