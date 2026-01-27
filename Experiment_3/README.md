# Experiment – 03  
## Implementation of Conditional Logic using IF–ELSE and CASE Statements in PostgreSQL

---

## Aim of the Program
To implement conditional decision-making logic in PostgreSQL using IF–ELSE constructs and CASE expressions for classification, validation, and rule-based data processing.

---

## Software Requirements
- **Operating System:** Windows / Linux  
- **Database Management System:** MySQL / Oracle / PostgreSQL  
- **SQL Interface:** MySQL Workbench / Web Based / pgAdmin  

---

## Objective
- To understand conditional execution in SQL  
- To implement decision-making logic using CASE expressions  
- To simulate real-world rule validation scenarios  
- To classify data based on multiple conditions  
- To strengthen SQL logic skills required in interviews and backend systems  

---

## Procedure of the Practical
1. Start the PostgreSQL server  
2. Open pgAdmin or psql client  
3. Create a new database for the experiment  
4. Connect to the database  
5. Create required tables to store schema and violation details  
6. Insert sample records with varying violation counts  
7. Apply CASE expressions to classify data  
8. Use CASE logic inside UPDATE statements  
9. Implement IF–ELSE logic using PL/pgSQL blocks  
10. Execute queries and verify outputs  
11. Save results and capture screenshots for submission  

---

## Practical / Experiment Steps

### Create Table
```sql
-- Create table
CREATE TABLE schema_violations (
    schema_id INT PRIMARY KEY,
    schema_name VARCHAR(50),
    violation_count INT
);

-- Insert sample records
INSERT INTO schema_violations VALUES
(1, 'Finance_Schema', 0),
(2, 'HR_Schema', 2),
(3, 'Sales_Schema', 5),
(4, 'Audit_Schema', 9),
(5, 'Admin_Schema', 12);

-- Classifying Data Using CASE Expression
SELECT schema_name, violation_count,
CASE
    WHEN violation_count = 0 THEN 'No Violation'
    WHEN violation_count BETWEEN 1 AND 3 THEN 'Minor Violation'
    WHEN violation_count BETWEEN 4 AND 7 THEN 'Moderate Violation'
    ELSE 'Critical Violation'
END AS violation_status
FROM schema_violations;

-- Applying CASE Logic in UPDATE Statement
ALTER TABLE schema_violations ADD COLUMN approval_status VARCHAR(20);

UPDATE schema_violations
SET approval_status =
CASE
    WHEN violation_count = 0 THEN 'Approved'
    WHEN violation_count BETWEEN 1 AND 5 THEN 'Needs Review'
    ELSE 'Rejected'
END;

-- Implementing IF–ELSE Logic Using PL/pgSQL
DO $$
DECLARE
    v_count INT := 6;
BEGIN
    IF v_count = 0 THEN
        RAISE NOTICE 'No violations detected';
    ELSIF v_count <= 5 THEN
        RAISE NOTICE 'Minor violations found';
    ELSE
        RAISE NOTICE 'Critical violations found';
    END IF;
END $$;

-- Real-World Classification Scenario (Grading System)
CREATE TABLE student_marks (
    student_name VARCHAR(50),
    marks INT
);

INSERT INTO student_marks VALUES
('Ajay', 85),
('Neha', 72),
('Rohit', 61),
('Purnima', 48);

-- using CASE on Step 5
SELECT student_name, marks,
CASE
    WHEN marks >= 80 THEN 'A'
    WHEN marks >= 65 THEN 'B'
    WHEN marks >= 50 THEN 'C'
    ELSE 'Fail'
END AS grade
FROM student_marks;

-- Using CASE for Custom Sorting
SELECT schema_name, violation_count
FROM schema_violations
ORDER BY
CASE
    WHEN violation_count = 0 THEN 1
    WHEN violation_count BETWEEN 1 AND 3 THEN 2
    WHEN violation_count BETWEEN 4 AND 7 THEN 3
    ELSE 4
END;

```
## I/O Analysis (Input / Output)

### Input
- Table creation queries  
- Sample data insertion commands  
- CASE expression queries for classification  
- UPDATE queries using CASE logic  
- PL/pgSQL block using IF–ELSE  
- SELECT queries for grading and sorting  

### Output
- Tables created successfully  
- Records inserted correctly  
- Data classified based on violation severity  
- Approval status updated accurately  
- IF–ELSE logic executed with correct messages  
- Grades and sorted results displayed correctly  

---
## OUTPUTS
OUTPUT:

Table Created:

<img width="250" height="122" alt="image" src="https://github.com/user-attachments/assets/c3028b8e-d06b-4cd8-93c4-fa30d111ea61" />






Insert sample records:

<img width="250" height="90" alt="image" src="https://github.com/user-attachments/assets/bc1b7203-0d48-446b-b404-6e348c803fe0" />






Classifying Data Using CASE Expression

<img width="320" height="120" alt="image" src="https://github.com/user-attachments/assets/97c3a165-7844-4fc7-93d8-be582590e16b" />








Applying CASE Logic in UPDATE Statement

<img width="320" height="185" alt="image" src="https://github.com/user-attachments/assets/faf93af0-9ea4-4005-8436-6df2f5ab7f48" />










Implementing IF–ELSE Logic Using PL/pgSQL

<img width="360" height="205" alt="image" src="https://github.com/user-attachments/assets/6de33213-be4a-4ea5-a76f-d5d55ac6fe37" />












Real-World Classification Scenario (Grading System)

<img width="332" height="200" alt="image" src="https://github.com/user-attachments/assets/a87cc6ec-4973-4dc3-8a00-73eb61059806" />










using CASE on Step 5

<img width="295" height="160" alt="image" src="https://github.com/user-attachments/assets/e2b15897-abea-46d3-b634-f7780eb2581a" />







Using CASE for Custom Sorting

<img width="295" height="160" alt="image" src="https://github.com/user-attachments/assets/10fad6b4-b7d8-47f3-8bf3-8ff9acd8dddb" />








## Learning Outcome
- Understood conditional logic in PostgreSQL  
- Learned to use CASE expressions for classification  
- Implemented IF–ELSE logic using PL/pgSQL  
- Applied real-world decision-making rules in SQL  
- Gained practical experience in backend rule validation and interview-oriented SQL logic  
