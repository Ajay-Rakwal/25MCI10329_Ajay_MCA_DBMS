# Experiment- 8

# Aim of the program:
To apply the concept of Stored Procedures in database operations in order to perform tasks like insertion, updating, deletion, and retrieval of data efficiently, securely, and in a reusable manner within the database system.

---

# Software Requirements
- Operating System: Windows / Linux  
- Database Management System: MySQL / Oracle / PostgreSQL  
- SQL Interface: MySQL Workbench /Web Based / pgAdmin  

---

# Objective
Apply stored procedure concepts for database operations

---

# Procedure of the Practical
- Open PostgreSQL (pgAdmin) and connect to the required database.  
- Create the Employee table with attributes such as empId, name, and salary.  
- Create a stored procedure to insert employee records into the table.  
- Create a stored procedure to update employee salary based on empId.  
- Create a stored procedure to delete employee records from the table.  
- Create a function to retrieve and display all employee records.  
- Execute the procedures (insert, update, delete) and call the function to verify results.  
- Observe the changes in the table after each operation.  

---

# Practical / Experiment Steps

```sql
CREATE TABLE Employee (
 empId INT PRIMARY KEY,
 name VARCHAR(50),
 salary INT
);
```

```sql
--- INSERT PROCEDURE
CREATE OR REPLACE PROCEDURE insert_employee(
 eid INT,
 ename VARCHAR,
 esalary INT )
LANGUAGE plpgsql
AS $$
BEGIN
 INSERT INTO Employee VALUES (eid, ename, esalary);
END;
$$;
```

```sql
--- UPDATE PROCEDURE
CREATE OR REPLACE PROCEDURE update_salary(
 eid INT,
 new_salary INT )
LANGUAGE plpgsql
AS $$
BEGIN
 UPDATE Employee
 SET salary = new_salary
 WHERE empId = eid;
END;
$$;
```

```sql
--- DELETE PROCEDURE
CREATE OR REPLACE PROCEDURE delete_employee(
 eid INT )
LANGUAGE plpgsql
AS $$
BEGIN
 DELETE FROM Employee
 WHERE empId = eid;
END;
$$;
```

```sql
--- RETRIVE DATA USING FUNCTION
CREATE OR REPLACE FUNCTION get_employees()
RETURNS TABLE(empId INT, name VARCHAR, salary INT)
LANGUAGE plpgsql
AS $$
BEGIN
 RETURN QUERY
 SELECT * FROM Employee;
END;
$$;
```

```sql
--- EXECUTION PART
CALL insert_employee(1, 'Ajay', 10000);
CALL update_salary(1, 60000);
CALL insert_employee(2, 'Jatin', 50000);
SELECT * FROM get_employees();
CALL delete_employee(1);
```

---

# I/O Analysis (Input / Output)

## Input
- Table creation query for Employee  
- Stored procedure definitions (INSERT, UPDATE, DELETE)  
- Function definition for data retrieval  
- Procedure calls for inserting, updating, and deleting records  
- SELECT query using the function  

## Output
- Employee table created successfully  
- Records inserted, updated, and deleted correctly using procedures  
- Employee data retrieved successfully using the function  
- Changes reflected accurately after each operation  
- Proper execution of procedural SQL logic in PostgreSQL  

---

# OUTPUT:

### Table Created:
<img width="253" height="120" alt="image" src="https://github.com/user-attachments/assets/b1c7f431-3df7-4732-a54f-b2b656387c67" />


### DELETE, UPDATE, INSERT PROCEDURE:
<img width="300" height="108" alt="image" src="https://github.com/user-attachments/assets/1ca45042-de90-414d-a0a3-a132d3b5b939" />


### RETRIVE DATA USING FUNCTION
<img width="251" height="126" alt="image" src="https://github.com/user-attachments/assets/1b1ae22d-fc10-42a7-8620-b42fd9ddf42e" />


---

### Insert Procedure
<img width="285" height="120" alt="image" src="https://github.com/user-attachments/assets/0a4c4186-1c7a-407c-ad87-60d734512245" />


### Update Procedure
<img width="250" height="120" alt="image" src="https://github.com/user-attachments/assets/df2ce7a2-501d-491b-a7f0-3aebb0cfd38e" />


### Final before Delete Procedure
<img width="250" height="150" alt="image" src="https://github.com/user-attachments/assets/fc0b4795-5e9a-4248-9287-3ad6e52e2f99" />


### Delete Procedure
<img width="260" height="145" alt="image" src="https://github.com/user-attachments/assets/04f312cf-86c8-40a3-ac86-069c26d1ddc4" />


---

# Learning Outcome:
- Understand the concept and use of stored procedures and functions in PostgreSQL.  
- Learn how to perform CRUD operations (Create, Read, Update, Delete) using procedural SQL.  
- Gain practical experience in writing PL/pgSQL blocks.  
- Understand how functions can be used to retrieve data efficiently.  
- Develop the ability to design modular and reusable database programs for real-world applications.  
