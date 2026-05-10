CREATE TABLE owner (
  owner_id int PRIMARY KEY AUTO_INCREMENT,
  owner_username varchar(55) UNIQUE NOT NULL,
  hashed_password varchar(255) NOT NULL
);

CREATE TABLE stall (
  stall_id int PRIMARY KEY AUTO_INCREMENT,
  owner_id int NOT NULL,
  stall_name varchar(100) NOT NULL,
  opening_time time NOT NULL,
  closing_time time NOT NULL,
  operating_days varchar(55) NOT NULL,
  stall_status bool DEFAULT false,
  photo_path varchar(255) NOT NULL,
  FOREIGN KEY (owner_id) REFERENCES owner(owner_id)
);

CREATE TABLE product (
  product_id int PRIMARY KEY AUTO_INCREMENT,
  stall_id int NOT NULL,
  product_name varchar(55) NOT NULL,
  category_name varchar(100) NOT NULL,
  product_price decimal(10,2) NOT NULL,
  product_status bool DEFAULT false,
  photo_path varchar(255) NOT NULL,
  FOREIGN KEY (stall_id) REFERENCES stall(stall_id)
);

CREATE TABLE orders (
  order_id int PRIMARY KEY AUTO_INCREMENT,
  stall_id int NOT NULL,
  order_number varchar(50) UNIQUE NOT NULL,
  order_status varchar(50) DEFAULT "Pending",
  order_time timestamp DEFAULT CURRENT_TIMESTAMP,
  processing_time int,
  customer_name varchar(55),
  FOREIGN KEY (stall_id) REFERENCES stall(stall_id)
);

CREATE TABLE order_line (
  order_line_id int PRIMARY KEY AUTO_INCREMENT,
  order_id int NOT NULL,
  product_id int NOT NULL,
  quantity_ordered int NOT NULL,
  unit_price_at_order decimal(10,2) NOT NULL,
  FOREIGN KEY (order_id) REFERENCES orders(order_id),
  FOREIGN KEY (product_id) REFERENCES product(product_id)
);

/*
README:
Flow para sa order:
Pili product -> Store sa cart (local lang)
-> Checkout (confirm ng order tsaka lang maga generate order) -> Generate orders (table) -> Generate order_line (andito na yung order id)

Changes:
order_line table: unit_price_at_order (in case na magbago price ng product)

Diagram: https://dbdocs.io/seeeeaaaannnn/MysqlSaIM?view=relationships
*/