# Aim of the Program

To understand and implement iterative control structures in PostgreSQL conceptually, including FOR loops, WHILE loops, and basic LOOP constructs, for repeated execution of database logic.
---
# Software Requirements

- Operating System: Windows / Linux
- Database Management System: MySQL / Oracle / PostgreSQL
- SQL Interface: MySQL Workbench / Web Based / pgAdmin
---
# Objective
- To understand why iteration is required in database programming
- To learn the purpose and behavior of FOR, WHILE, and LOOP constructs
- To understand how repeated data processing is handled in databases
- To relate loop concepts to real-world batch processing scenarios
- To strengthen conceptual knowledge of procedural SQL used in enterprise systems
---
# Procedure of the Practical

1. Open PostgreSQL using pgAdmin or a browser-based PostgreSQL interface and connect to the database.
2. Study the need for iterative control structures in database programming through the given theory and real-world use cases.
3. Write and execute a simple FOR loop to understand fixed-iteration execution.
4. Implement a FOR loop with query-based iteration to process records one row at a time.
5. Implement a WHILE loop to observe condition-controlled repeated execution.
6. Use a LOOP construct with an EXIT WHEN condition to understand flexible and custom termination logic.
7. Apply a FOR loop to simulate real-world batch processing such as salary increment for employee records.
8. Combine LOOP and IF conditions to perform decision-making during iteration.
9. Observe the execution flow and output messages to understand how iterative logic works in PostgreSQL.
---
# Practical / Experiment Steps
```sql
 --employee table (used in examples)
CREATE TABLE employee (
    emp_id INT,
    salary INT
);
INSERT INTO employee VALUES
(1, 30000),
(2, 35000),
(3, 40000);

-- Example 1: FOR Loop 
DO $$
BEGIN
    FOR i IN 1..5 LOOP
        RAISE NOTICE 'Iteration: %', i;
    END LOOP;
END $$;

-- Example 2: FOR Loop with Query 
DO $$
DECLARE
    rec RECORD;
BEGIN
    FOR rec IN SELECT emp_id FROM employee LOOP
        RAISE NOTICE 'Processing Employee ID: %', rec.emp_id;
    END LOOP;
END $$;

-- Example 3: WHILE Loop 
DO $$
DECLARE
    counter INT := 1;
BEGIN
    WHILE counter <= 5 LOOP
        RAISE NOTICE 'Counter value: %', counter;
        counter := counter + 1;
    END LOOP;
END $$;

-- Example 4: LOOP with EXIT WHEN
DO $$
DECLARE
    num INT := 1;
BEGIN
    LOOP
        RAISE NOTICE 'Number: %', num;
        num := num + 1;
        EXIT WHEN num > 5;
    END LOOP;
END $$;

-- Example 5: Salary Increment Using FOR Loop
DO $$
DECLARE
    rec RECORD;
BEGIN
    FOR rec IN SELECT emp_id FROM employee LOOP
        UPDATE employee
        SET salary = salary + 1000
        WHERE emp_id = rec.emp_id;
    END LOOP;
END $$;
SELECT * FROM employee

-- Example 6: Combining LOOP with IF Condition
DO $$
DECLARE
    rec RECORD;
BEGIN
    FOR rec IN SELECT emp_id, salary FROM employee LOOP
        IF rec.salary >= 40000 THEN
            RAISE NOTICE 'Employee % : High Salary', rec.emp_id;
        ELSE
            RAISE NOTICE 'Employee % : Normal Salary', rec.emp_id;
        END IF;
    END LOOP;
END $$;
```
---
# I/O Analysis (Input / Output)

## Input
- Table creation queries
- Sample data insertion commands
- Loop-based PL/pgSQL blocks (FOR, WHILE, and LOOP)
- IF–ELSE conditional logic inside loops
- UPDATE statements executed within loop constructs
- SELECT queries to display processed results

## Output
- Tables created successfully
- Records inserted and processed correctly
- Iterative execution performed as per loop logic
- Conditional classification applied correctly using IF–ELSE
- Data updated accurately during iteration
- Correct execution flow and messages displayed for each loop operation
---

# OUTPUT:
### Table Created:

<img width="253" height="115" alt="image" src="https://github.com/user-attachments/assets/4a4a2524-8bbe-4f16-b184-469676b0369e" />









### Insert sample records:
<img width="260" height="104" alt="image" src="https://github.com/user-attachments/assets/ddc10755-7c0e-4142-9236-0f415cbc445d" />










### Example 1: FOR Loop 

<img width="275" height="175" alt="image" src="https://github.com/user-attachments/assets/a9a01e1f-f94f-438a-9ca8-8eb1b265fe03" />









### Example 2: FOR Loop with Query 

<img width="283" height="150" alt="image" src="https://github.com/user-attachments/assets/08a9cae9-cf3f-47c4-b5bb-dd7bec1c28b4" />









### Example 3: WHILE Loop 

<img width="294" height="157" alt="image" src="https://github.com/user-attachments/assets/58cfb9d3-895d-486e-aea7-bc59065ba132" />









### Example 4: LOOP with EXIT WHEN

<img width="300" height="175" alt="image" src="https://github.com/user-attachments/assets/80bea402-c809-41b3-aa42-98201cc4230f" />













### Example 5: Salary Increment Using FOR Loop

<img width="220" height="141" alt="image" src="https://github.com/user-attachments/assets/d71f0b83-031d-4721-bdf0-cfa533b6ba79" />











### Example 6: Combining LOOP with IF Condition

<img width="260" height="154" alt="image" src="https://github.com/user-attachments/assets/274d4442-d62b-4dd5-9d06-2af03c0ac7bf" />






---
# Learning Outcome
- Understand the need for iteration in database programming and procedural SQL.
- Learn the working principles and use cases of FOR, WHILE, and LOOP constructs in PostgreSQL.
- Gain conceptual clarity on how repeated data processing is handled using PL/pgSQL.
- Relate loop-based database logic to real-world applications such as payroll, reporting, and batch jobs.
- Develop foundational knowledge required to write procedural and enterprise-level database programs.



