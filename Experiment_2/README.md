# Experiment 1: SQL SELECT Queries using Filtering, Sorting, Grouping, and Aggregation

---

## Aim of the Program
To implement and analyze SQL SELECT queries using filtering, sorting, grouping, and aggregation concepts in PostgreSQL for efficient data retrieval and analytical reporting.

---

## Software Requirements
-	Operating System: Windows / Linux
-	Database Management System: MySQL / Oracle / PostgreSQL
-	SQL Interface: MySQL Workbench /Web Based / pgAdmin
  
---

## Objective
- To study and implement SQL SELECT queries using PostgreSQL  
- To retrieve required data by applying appropriate filtering conditions  
- To organize query results using sorting in ascending and descending order  
- To analyze data by grouping records and applying aggregate functions  
- To apply conditions on grouped data using the HAVING clause and understand the difference between row-level and group-level filtering  

---

## Procedure of the Practical
i. Start the PostgreSQL server.  
ii. Open the PostgreSQL client tool such as pgAdmin or psql.  
iii. Create a new database for the experiment using the SQL command:  
   `CREATE DATABASE practical_db;`  
iv. Connect to the created database.  
v. Create a table to store customer order details with attributes such as customer name, product, quantity, price, and order date.  
vi. Insert sufficient sample records into the table to allow meaningful data analysis.  
vii. Execute SQL SELECT queries with WHERE clause to filter records based on given conditions.  
viii. Execute ORDER BY queries to sort the results in ascending and descending order and using multiple columns.  
ix. Execute GROUP BY queries along with aggregate functions to summarize data.  
x. Verify the output after executing each query.  
xi. Save the work and take screenshots of the executed queries and outputs for record submission.  

---

## Practical / Experiment Steps

### Input

```sql
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

--Step 5 
SELECT product, SUM(quantity*price) AS total_sales
FROM orders
GROUP BY product
HAVING SUM(quantity*price) > 75000;

-- Step 6 Products with total sales greater than 75000
SELECT product, SUM(quantity * price) AS total_sales
FROM orders
WHERE order_date >= '2025-01-01'
GROUP BY product
HAVING SUM(quantity * price) > 75000; 

```
---

## I/O Analysis (Input / Output)
# Input
-	Orders table creation query
-	Sample records inserted into the Orders table using INSERT commands
-	SELECT queries to display orders with high prices
-	ORDER BY queries to sort records in ascending and descending order
-	GROUP BY queries to calculate total sales per product
-	HAVING clause queries to filter products based on total sales

# Output
-	Orders table created successfully
-	Records inserted and stored correctly in the table
-	High-priced orders displayed accurately based on the given condition
-	Records sorted correctly by price and product
-	Total sales calculated correctly for each product
-	Products with total sales greater than the specified value displayed successfully

OUTPUT:

Table Created:

<img width="250" height="122" alt="image" src="https://github.com/user-attachments/assets/c3028b8e-d06b-4cd8-93c4-fa30d111ea61" />






Insert sample records:

<img width="250" height="90" alt="image" src="https://github.com/user-attachments/assets/f729f43d-dc21-4fd7-9f7a-5ae807d78d22" />





Display high priced orders

<img width="320" height="120" alt="image" src="https://github.com/user-attachments/assets/9931d68a-d126-4dc7-b21b-e6a6d9275fd4" />







Sort by price (ascending)

<img width="320" height="185" alt="image" src="https://github.com/user-attachments/assets/60c04171-4ef1-4095-8793-db70a151178c" />









Sort by price (descending) 

<img width="360" height="205" alt="image" src="https://github.com/user-attachments/assets/d1e18f4e-f3af-4bcb-860f-d9cfbf7fa5a1" />











Sort by product, then price

<img width="332" height="200" alt="image" src="https://github.com/user-attachments/assets/8f85a4bf-1442-4ca8-afb6-c2bd35a656c8" />











Total sales per product


<img width="303" height="165" alt="image" src="https://github.com/user-attachments/assets/d2b21102-765d-4dad-a5ac-3c1d8f536c66" />









Products with total sales greater than 75000

<img width="295" height="160" alt="image" src="https://github.com/user-attachments/assets/4b91dfee-d4c6-4cde-8a72-94690bf14c15" />






Implementing Step 6 by applying WHERE and HAVING 

<img width="295" height="160" alt="image" src="https://github.com/user-attachments/assets/4b91dfee-d4c6-4cde-8a72-94690bf14c15" />







## Learning Outcome:
- Understood the use of SQL SELECT queries in PostgreSQL
-	Learned how to filter records using the WHERE clause
-	Gained knowledge of sorting data using ORDER BY
-	Understood grouping of data using the GROUP BY clause
-	Learned to apply aggregate functions for data analysis
- Gained practical experience in executing and analyzing SQL queries.
