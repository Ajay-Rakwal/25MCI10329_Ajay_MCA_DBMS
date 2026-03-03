# Experiment- 6

---

# Aim of the program:

Learn how to create, query, and manage views in SQL to simplify database queries and provide a layer of abstraction for end-users.

---

# Software Requirements

- Operating System: Windows / Linux  
- Database Management System: MySQL / Oracle / PostgreSQL  
- SQL Interface: MySQL Workbench /Web Based / pgAdmin  

---

# Objective

- Data Abstraction: To understand how to hide complex table joins and calculations behind a simple virtual table interface.  
- Enhanced Security: To learn how to restrict user access to sensitive columns by providing views instead of direct table access.  
- Query Simplification: To master the creation of views that pre-join multiple tables, making reporting easier for non-technical users.  
- View Management: To understand the syntax for creating, altering, and dropping views, as well as the naming conventions required for efficient data access.  

Branch: MCA (AI&ML) Semester: 2  
Student Name: Ajay Rakwal UID: 25MCI10329  
Subject Name: Technical Training Subject Code: 25CAP-652  
Section/Group: MAM-1(A) Date of Performance: 24-02-2026  

---

# Procedure of the Practical

1. Open the database environment (Oracle / MS SQL Server / PostgreSQL) and connect to the required database.  
2. Create base tables such as Employees and Departments, and insert sample records for testing.  
3. Create a Simple View to filter specific records (e.g., active employees) without exposing the full table structure.  
4. Execute SELECT queries on the simple view to verify that it retrieves filtered data correctly.  
5. Create a Join View by combining multiple tables (e.g., Employees and Departments) to simplify complex queries.  
6. Query the join view to confirm that data from multiple tables is displayed in a consolidated format.  
7. Create an Advanced View using aggregate functions (e.g., COUNT, AVG, SUM) and GROUP BY to generate department-level statistics.  
8. Test the summarization view to validate calculated outputs.  
9. Demonstrate view management operations such as ALTER VIEW and DROP VIEW.  
10. Verify access control by granting permissions on views instead of base tables (if applicable).  

---

# Practical / Experiment Steps

```sql
-- TABLE CREATION
CREATE TABLE departments (
 department_id INT PRIMARY KEY,
 department_name VARCHAR(100)
);

CREATE TABLE employees (
 id INT PRIMARY KEY,
 name VARCHAR(100),
 salary NUMERIC(10,2),
 status VARCHAR(20),
 department_id INT,
 FOREIGN KEY (department_id)
 REFERENCES departments(department_id)
);

-- INSERT SAMPLE DATA
INSERT INTO departments VALUES
(1, 'HR'),
(2, 'IT'),
(3, 'Finance');

INSERT INTO employees VALUES
(101, 'Ajay', 50000, 'Active', 2),
(102, 'Jatin', 45000, 'Inactive', 1),
(103, 'Nidhi', 60000, 'Active', 2),
(104, 'Anay', 40000, 'Active', 3);

-- Simple View
CREATE VIEW active_employees AS
SELECT id, name, department_id
FROM employees
WHERE status = 'Active';

-- Join View
CREATE VIEW employee_department_view AS
SELECT e.id, e.name, d.department_name
FROM employees e
JOIN departments d
ON e.department_id = d.department_id;

-- Summary View
CREATE VIEW department_summary AS
SELECT department_id,
 COUNT(*) AS total_employees,
 AVG(salary) AS average_salary
FROM employees
GROUP BY department_id;

SELECT * FROM active_employees;
SELECT * FROM employee_department_view;
SELECT * FROM department_summary;
```

---

# I/O Analysis (Input / Output)

## Input

- Base table creation queries  
- Sample data insertion commands  
- CREATE VIEW statements (simple and complex views)  
- SELECT queries on created views  
- Aggregate function and JOIN queries  
- ALTER VIEW and DROP VIEW commands  

## Output

- Base tables created successfully  
- Simple view displaying filtered employee data  
- Join view showing consolidated employee-department information  
- Summarization view displaying department-level statistics  
- Views modified and dropped successfully  
- Simplified and secure data access achieved through views  

---

# OUTPUT:

## Table Created:
<img width="253" height="115" alt="image" src="https://github.com/user-attachments/assets/3b71ac8f-3b50-4281-a45a-8f1c0fadee3e" />





## Insert sample records:
<img width="260" height="103" alt="image" src="https://github.com/user-attachments/assets/b1ee1b8e-9106-48ec-a919-6ac118a4a422" />





## --Views creation
<img width="233" height="100" alt="image" src="https://github.com/user-attachments/assets/07472d61-ce7d-46ea-a318-6a71b2154318" />





## -- Simple View
<img width="343" height="160" alt="image" src="https://github.com/user-attachments/assets/b5af620e-e3cb-4215-86aa-df09aa1dc278" />





## -- Join View
<img width="342" height="170" alt="image" src="https://github.com/user-attachments/assets/787971a7-271b-430f-b9b4-03f61c0cb757" />






## --Summary View
<img width="300" height="147" alt="image" src="https://github.com/user-attachments/assets/055222fa-7f46-4b8b-a567-0b0e0f08a2e8" />





---

# Learning Outcome:

- Understand the concept of views and their role in data abstraction.  
- Learn how to create simple and complex views using SQL syntax.  
- Gain practical experience in simplifying queries using join-based and aggregate views.  
- Understand how views enhance database security by restricting access to sensitive columns.  
- Develop the ability to design enterprise-level reporting views for real-world applications such as payroll and management systems.  
