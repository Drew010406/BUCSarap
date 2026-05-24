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


-- ORDERS
INSERT INTO orders (stall_id, order_number, order_status, customer_name, processing_time) VALUES
-- Burger Boss Orders
(1, 'ORD-001', 'Completed', 'Juan Santos', 15),
(1, 'ORD-002', 'Completed', 'Maria Garcia', 12),
(1, 'ORD-003', 'Ready', 'Carlos Reyes', 10),
(1, 'ORD-004', 'In Progress', 'Ana Lopez', NULL),
(1, 'ORD-005', 'Pending', 'Peter Wong', NULL),

-- Rice King Orders
(2, 'ORD-006', 'Completed', 'Sophie Chen', 18),
(2, 'ORD-007', 'Completed', 'Marco Rossi', 20),
(2, 'ORD-008', 'Ready', 'Lisa Tan', 14),

-- Pasta Hub Orders
(3, 'ORD-009', 'Completed', 'Roberto Trevino', 25),
(3, 'ORD-010', 'In Progress', 'Francesca Villa', NULL),

-- MilkTea Manila Orders
(4, 'ORD-011', 'Completed', 'Amara Khan', 8),
(4, 'ORD-012', 'Completed', 'Zainab Ahmed', 9),
(4, 'ORD-013', 'Ready', 'Yuki Tanaka', 7),

-- Takoyaki World Orders
(5, 'ORD-014', 'Completed', 'Hiroshi Yamamoto', 10),
(5, 'ORD-015', 'In Progress', 'Sakura Nakamura', NULL),

-- Sisig Sentral Orders
(6, 'ORD-016', 'Completed', 'Ramon Cruz', 12),
(6, 'ORD-017', 'Ready', 'Gloria Santos', 11),

-- Ramen House Orders
(7, 'ORD-018', 'Completed', 'Kenji Sato', 22),
(7, 'ORD-019', 'Pending', 'Yuki Suzuki', NULL),

-- BBQ Corner Orders
(8, 'ORD-020', 'Completed', 'Miguel Torres', 18),
(8, 'ORD-021', 'Completed', 'Rosa Martinez', 16),

-- Sweet Bite Orders
(9, 'ORD-022', 'Completed', 'Emma Wilson', 5),
(9, 'ORD-023', 'Ready', 'Sophia Brown', 6),

-- Healthy Bowl Orders
(10, 'ORD-024', 'In Progress', 'Alexandra Green', NULL),
(10, 'ORD-025', 'Pending', 'Diana Lee', NULL);


-- ORDER LINE ITEMS
INSERT INTO order_line (order_id, product_id, quantity_ordered, unit_price_at_order) VALUES
-- Order 1: Burger Boss (Juan) - 2x Classic Burger + 1x Large Fries
(1, 1, 2, 120.00),
(1, 3, 1, 80.00),

-- Order 2: Burger Boss (Maria) - 1x Cheese Burger + 2x Large Fries
(2, 2, 1, 145.00),
(2, 3, 2, 80.00),

-- Order 3: Burger Boss (Carlos) - 3x Classic Burger
(3, 1, 3, 120.00),

-- Order 4: Burger Boss (Ana) - 2x Cheese Burger
(4, 2, 2, 145.00),

-- Order 5: Burger Boss (Peter) - 1x Classic Burger + 1x Cheese Burger + 1x Large Fries
(5, 1, 1, 120.00),
(5, 2, 1, 145.00),
(5, 3, 1, 80.00),

-- Order 6: Rice King (Sophie) - 1x Chicken Teriyaki + 1x Beef Pepper Rice
(6, 4, 1, 150.00),
(6, 5, 1, 170.00),

-- Order 7: Rice King (Marco) - 2x Chicken Teriyaki
(7, 4, 2, 150.00),

-- Order 8: Rice King (Lisa) - 1x Beef Pepper Rice
(8, 5, 1, 170.00),

-- Order 9: Pasta Hub (Roberto) - 1x Carbonara + 2x Spaghetti Bolognese
(9, 6, 1, 180.00),
(9, 7, 2, 160.00),

-- Order 10: Pasta Hub (Francesca) - 2x Carbonara
(10, 6, 2, 180.00),

-- Order 11: MilkTea Manila (Amara) - 3x Wintermelon Milk Tea
(11, 8, 3, 110.00),

-- Order 12: MilkTea Manila (Zainab) - 2x Okinawa Milk Tea + 1x Wintermelon Milk Tea
(12, 9, 2, 120.00),
(12, 8, 1, 110.00),

-- Order 13: MilkTea Manila (Yuki) - 1x Okinawa Milk Tea
(13, 9, 1, 120.00),

-- Order 14: Takoyaki World (Hiroshi) - 2x Octobits Takoyaki + 1x Cheese Takoyaki
(14, 10, 2, 95.00),
(14, 11, 1, 105.00),

-- Order 15: Takoyaki World (Sakura) - 1x Octobits Takoyaki
(15, 10, 1, 95.00),

-- Order 16: Sisig Sentral (Ramon) - 1x Pork Sisig + 1x Bangus Sisig
(16, 12, 1, 140.00),
(16, 13, 1, 150.00),

-- Order 17: Sisig Sentral (Gloria) - 2x Pork Sisig
(17, 12, 2, 140.00),

-- Order 18: Ramen House (Kenji) - 1x Tonkotsu Ramen
(18, 14, 1, 250.00),

-- Order 19: Ramen House (Yuki) - 1x Spicy Miso Ramen + 1x Tonkotsu Ramen
(19, 15, 1, 260.00),
(19, 14, 1, 250.00),

-- Order 20: BBQ Corner (Miguel) - 2x Pork BBQ Meal
(20, 16, 2, 130.00),

-- Order 21: BBQ Corner (Rosa) - 1x Chicken BBQ Meal + 1x Pork BBQ Meal
(21, 17, 1, 140.00),
(21, 16, 1, 130.00),

-- Order 22: Sweet Bite (Emma) - 1x Chocolate Cake Slice
(22, 18, 1, 90.00),

-- Order 23: Sweet Bite (Sophia) - 2x Blueberry Cheesecake
(23, 19, 2, 110.00),

-- Order 24: Healthy Bowl (Alexandra) - 1x Chicken Salad Bowl + 1x Tofu Rice Bowl
(24, 20, 1, 160.00),
(24, 21, 1, 145.00),

-- Order 25: Healthy Bowl (Diana) - 2x Chicken Salad Bowl
(25, 20, 2, 160.00);