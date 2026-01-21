-- Create table
CREATE TABLE orders (
    cust_name VARCHAR(50),
    product VARCHAR(50),
    quantity INT,
    price INT,
    order_date DATE
);

-- Insert sample records
INSERT INTO orders VALUES
('Ajay', 'Laptop', 1, 60000, '2025-01-10'),
('Jatin', 'Mobile', 2, 25000, '2025-01-12'),
('Harkirat', 'Laptop', 1, 70000, '2025-01-15'),
('Purnima', 'Tablet', 3, 15000, '2025-01-18'),
('Rohit', 'Mobile', 1, 30000, '2025-01-20'),
('Neha', 'Tablet', 2, 14000, '2025-01-22');


-- Display high priced orders
SELECT * FROM orders
WHERE price > 30000;


-- Sort by price (ascending)
SELECT cust_name, product, price
FROM orders
ORDER BY price ASC;


-- Sort by price (descending)
SELECT cust_name, product, price
FROM orders
ORDER BY price DESC;


-- Sort by product, then price
SELECT cust_name, product, price
FROM orders
ORDER BY product ASC, price DESC;


-- Total sales per product
SELECT product, SUM(quantity * price) AS total_sales
FROM orders
GROUP BY product;


-- Products with total sales greater than 50000
SELECT product, SUM(quantity * price) AS total_sales
FROM orders
GROUP BY product
HAVING SUM(quantity * price) > 75000;



