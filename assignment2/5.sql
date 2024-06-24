-- create the tables

CREATE TABLE customers (
    customer_id INT PRIMARY KEY IDENTITY(1, 1),
    customer_name NVARCHAR(100) NOT NULL,
    customer_country NVARCHAR(100) NOT NULL
);

CREATE TABLE orders2 (
    order_id INT PRIMARY KEY IDENTITY(100, 1),
    customer_id INT NOT NULL,
    product_id INT NOT NULL,
    order_date DATE NOT NULL,
    order_quantity INT NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

CREATE TABLE products (
    product_id INT PRIMARY KEY IDENTITY(100, 1),
    product_name NVARCHAR(100) NOT NULL,
    product_price DECIMAL(10, 2) NOT NULL
);

-- populate the tables

INSERT INTO customers (customer_name, customer_country)
VALUES
    ('Alice Johnson', 'USA'),
    ('Bob Smith', 'USA'),
    ('Charlie Brown', 'USA'),
    ('David White', 'Canada'),
    ('Emma Green', 'Canada'),
    ('Fiona Black', 'Canada'),
    ('George Blue', 'UK'),
    ('Hannah Grey', 'UK'),
    ('Ian Yellow', 'UK'),
    ('Jack Red', 'Australia'),
    ('Karen Pink', 'Australia'),
    ('Liam Purple', 'Australia');


INSERT INTO products (product_name, product_price)
VALUES ('Laptop', 799.99), 
('Smartphone', 499.00), 
('T-Shirt', 19.99), 
('Jeans', 39.95), 
('Coffee Maker', 49.99), 
('Microwave', 79.95),
('Headphones', 129.99), 
('Tablet', 299.95), 
('Dress Shirt', 29.99), 
('Sweatshirt', 44.95),
('Running Shoes', 79.99), 
('Yoga Mat', 39.95), 
('Novel', 14.99), 
('Pen Set', 9.99), 
('Board Game', 29.99), 
('Stuffed Animal', 19.95);


INSERT INTO orders2 (customer_id, product_id, order_date, order_quantity)
VALUES
    (1, 101, '2024-06-01', 2),
    (2, 102, '2024-06-02', 1),
    (3, 103, '2024-06-03', 3),
    (4, 104, '2024-06-04', 1),
    (5, 105, '2024-06-05', 2),
    (6, 101, '2024-06-06', 1),
    (7, 102, '2024-06-07', 1),
    (8, 107, '2024-06-08', 2),
    (9, 114, '2024-06-09', 1),
    (10, 115, '2024-06-10', 1),
    (11, 101, '2024-06-11', 1),
    (12, 112, '2024-06-12', 2),
    (1, 113, '2024-06-13', 1),
    (2, 104, '2024-06-14', 3),
    (3, 108, '2024-06-15', 2),
    (4, 100, '2024-06-16', 1),
    (5, 112, '2024-06-17', 1),
    (6, 109, '2024-06-18', 1),
    (7, 104, '2024-06-19', 2),
    (8, 115, '2024-06-20', 1);


-- solution Query

SELECT c.customer_country, SUM(o.order_quantity*p.product_price) AS Total_revenue
FROM customers c
LEFT JOIN orders2 o ON c.customer_id=o.customer_id
INNER JOIN products p ON o.product_id=p.product_id
GROUP BY c.customer_country