CREATE TABLE products (
  product_id INT PRIMARY KEY IDENTITY(100, 1),
  product_name VARCHAR(50) NOT NULL,
  category_id INT FOREIGN KEY REFERENCES categories(category_id),
  price DECIMAL(10,2) NOT NULL
);

CREATE TABLE categories (
  category_id INT PRIMARY KEY IDENTITY(1, 1),
  category_name VARCHAR(50) NOT NULL
);

CREATE TABLE orders (
  order_id INT PRIMARY KEY IDENTITY(1000, 1),
  product_id INT FOREIGN KEY REFERENCES products(product_id),
  quantity INT NOT NULL,
  order_date DATE NOT NULL
);

-- populate the table
INSERT INTO categories (category_name)
VALUES ('Electronics'), 
	('Clothing'), 
	('Home Goods'), 
    ('Sports & Fitness'), 
    ('Books & Stationery'), 
    ('Toys & Games');
	
INSERT INTO products (product_name, category_id, price)
VALUES ('Laptop', 1, 799.99), 
('Smartphone', 1, 499.00), 
('T-Shirt', 2, 19.99), 
('Jeans', 2, 39.95), 
('Coffee Maker', 3, 49.99), 
('Microwave', 3, 79.95),
('Headphones', 1, 129.99), 
('Tablet', 1, 299.95), 
('Dress Shirt', 2, 29.99), 
('Sweatshirt', 2, 44.95),
('Running Shoes', 4, 79.99), 
('Yoga Mat', 4, 39.95), 
('Novel', 5, 14.99), 
('Pen Set', 5, 9.99), 
('Board Game', 6, 29.99), 
('Stuffed Animal', 6, 19.95);


INSERT INTO orders (product_id, quantity, order_date)
VALUES
  (100, 1, '2024-06-20'), (100, 2, '2024-05-15'), (100, 3, '2024-04-28'),
  (101, 1, '2024-06-25'), (101, 2, '2024-06-10'), (101, 1, '2024-05-05'),
  (102, 3, '2024-06-22'), (102, 1, '2024-04-20'), (102, 2, '2024-03-12'),
  (103, 2, '2024-06-18'), (103, 1, '2024-05-25'), (103, 4, '2024-04-15'),
  (104, 1, '2024-06-24'), (104, 2, '2024-06-01'), (104, 3, '2024-02-29'),
  (105, 5, '2024-06-21'), (105, 1, '2024-05-30'), (105, 2, '2024-01-01'),
  (106, 2, '2024-06-23'), (106, 4, '2024-06-05'), (106, 1, '2023-12-31'),
  (107, 1, '2024-06-20'), (107, 3, '2024-05-10'), (107, 2, '2023-11-20'),
  (108, 3, '2024-06-25'), (108, 2, '2024-06-08'), (108, 1, '2023-10-15'),
  (109, 1, '2024-06-22'), (109, 4, '2024-05-20'), (109, 5, '2023-09-01'),
  (110, 2, '2024-06-18'), (110, 1, '2024-05-27'), (110, 3, '2023-08-01'),
  (111, 4, '2024-06-24'), (111, 1, '2024-06-03'), (111, 2, '2023-07-15'),
  (112, 1, '2024-06-21'), (112, 5, '2024-05-31'), (112, 1, '2023-06-01'),
  (113, 3, '2024-06-23'), (113, 2, '2024-06-07'), (113, 4, '2023-05-05'),
  (114, 2, '2024-06-20'), (114, 1, '2024-05-12'), (114, 1, '2023-04-10'),
  (115, 1, '2024-06-2');



WITH a AS (SELECT p.product_name, p.category_id,
(SELECT SUM(quantity)*p.price FROM orders 
WHERE order_date BETWEEN DATEADD(month, -1, GETDATE()) AND GETDATE()
GROUP BY product_id HAVING product_id=p.product_id) AS amt
FROM products p) 
SELECT c.category_name, SUM(a.amt)
FROM categories c INNER JOIN a ON c.category_id=a.category_id
GROUP BY c.category_name


-- with only joins
SELECT c.category_name, SUM(o.quantity * p.price) AS total_revenue
FROM categories AS c
INNER JOIN products AS p ON c.category_id = p.category_id
INNER JOIN orders AS o ON p.product_id = o.product_id
WHERE o.order_date BETWEEN DATEADD(month, -1, GETDATE()) AND GETDATE()
GROUP BY c.category_name;

