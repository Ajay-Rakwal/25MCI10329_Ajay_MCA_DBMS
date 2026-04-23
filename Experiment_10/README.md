# Experiment- 10

## Aim of the program:
To understand and apply transaction control in PostgreSQL using BEGIN, COMMIT, ROLLBACK and SAVEPOINT to maintain data integrity during database operations.

---

## Software Requirements
- Operating System: Windows / Linux
- Database Management System: MySQL / Oracle / PostgreSQL
- SQL Interface: MySQL Workbench /Web Based / pgAdmin

---

## Objective
Apply transaction control commands for safe and reliable database updates.

---

## Procedure of the Practical
- Open PostgreSQL (pgAdmin) and connect to the required database.
- Create the Payroll table with constraints such as primary key and salary check condition (> 0).
- Insert sample records into the Payroll table for testing transaction operations.
- Start a transaction using BEGIN and perform update operations, including an invalid update.
- Use ROLLBACK to undo all changes made in the transaction.
- Verify the table data using a SELECT query to confirm rollback execution.
- Start a new transaction using BEGIN and perform multiple update operations.
- Create a SAVEPOINT to mark a specific state within the transaction.
- Perform further updates, including an invalid operation.
- Use ROLLBACK TO SAVEPOINT to undo changes after the savepoint.
- Use COMMIT to permanently save valid changes in the database.
- Verify final changes using a SELECT query.

---

## Practical / Experiment Steps

```sql
-- CREATE TABLE
CREATE TABLE payroll(
emp_id int primary key,
emp_name varchar(50),
salary decimal(10,2) check(salary>0)
);

-- INSERT RECORDS
Insert into payroll values
(1,'Ajay',30000),
(2,'Purnima',40000),
(3,'Neeraj',50000);

-- START TRANSACTION
begin;

-- INVALID UPDATE (NEGATIVE SALARY)
update payroll
set salary=-1000
where emp_id=3;

-- VALID UPDATE
update payroll
set salary=1000
where emp_id=3;

-- ROLLBACK ALL CHANGES
rollback;

-- DISPLAY DATA
select * from payroll;

-- START NEW TRANSACTION
begin;

-- UPDATE SALARY EMPLOYEE 1
update payroll
set salary=salary+5000
where emp_id=1;

-- CREATE SAVEPOINT
savepoint sp1;

-- UPDATE SALARY EMPLOYEE 2
update payroll
set salary=salary+7000
where emp_id=2;

-- INVALID UPDATE
update payroll
set salary=-1000
where emp_id=3;

-- ROLLBACK TO SAVEPOINT
rollback to sp1;

-- COMMIT CHANGES
commit;
```

---

## I/O Analysis (Input / Output)

### Input
- Table creation query with constraints
- Sample data insertion commands
- Transaction control statements (BEGIN, COMMIT, ROLLBACK, SAVEPOINT)
- UPDATE queries including valid and invalid operations
- SELECT query to verify results

### Output
- Payroll table created successfully
- Records inserted correctly
- Invalid update (negative salary) rejected due to constraint
- ROLLBACK restored original data after first transaction
- SAVEPOINT created and partial rollback executed successfully
- Valid updates committed and reflected in final table data
- Data integrity maintained throughout transaction operations

---

## OUTPUT:

### Table Created:
<!-- picture here -->
<img width="250" height="122" alt="image" src="https://github.com/user-attachments/assets/7d82c0bc-6b8b-4e9a-850a-724dba88a55a" />






### INSERT VALUES:
<!-- picture here -->
<img width="223" height="95" alt="image" src="https://github.com/user-attachments/assets/cc432105-ec21-4351-b061-bd60f7161ccc" />







### UPDATE:
<!-- picture here -->
<img width="290" height="79" alt="image" src="https://github.com/user-attachments/assets/4fb5c03e-4096-4285-8309-c0d5d759f215" />





### SAVEPOINT:
<!-- picture here -->
<img width="290" height="278" alt="image" src="https://github.com/user-attachments/assets/c2956ee7-8286-4eb8-837b-207df0b1e44b" />







### ROLLBACK :
<!-- picture here -->
<img width="263" height="90" alt="image" src="https://github.com/user-attachments/assets/8ee310d6-63da-40ce-b16f-87b4348abb21" />


---

## Learning Outcome:
- Understand the concept of transaction control in PostgreSQL.
- Learn how to use BEGIN, COMMIT, and ROLLBACK to manage database transactions.
- Gain practical experience with SAVEPOINT for partial rollback operations.
- Understand how transaction control helps maintain data integrity and consistency.
- Develop the ability to handle errors and recover from invalid operations in database systems.

---
