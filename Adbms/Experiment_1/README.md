# Experiment 1: Implementation of DDL, DML, and DCL Commands in PostgreSQL

---

## Aim of the Program
To design and implement a sample database system using DDL, DML, and DCL commands, including database creation, data manipulation, schema modification, and role-based access control to ensure data integrity and secure, read-only access for authorized users.

---

## Objective
To gain practical experience in implementing Data Definition Language (DDL), Data Manipulation Language (DML), and Data Control Language (DCL) operations in a real database environment, including the use of role-based privileges to secure data.

---

## Input / Output Analysis

### Input

```sql
-- Course table
CREATE TABLE course (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(50) NOT NULL
);

-- Student table
CREATE TABLE student (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(50) NOT NULL,
    email VARCHAR(50) UNIQUE,
    age INT CHECK (age >= 18)
);

-- Enrollment table
CREATE TABLE enrollment (
    enroll_id INT PRIMARY KEY,
    student_id INT,
    course_id INT,
    CONSTRAINT fk_student
        FOREIGN KEY (student_id)
        REFERENCES student(student_id),
    CONSTRAINT fk_course
        FOREIGN KEY (course_id)
        REFERENCES course(course_id)
);

-- Data insertion
INSERT INTO course VALUES (1, 'Artificial Intelligence');
INSERT INTO course VALUES (2, 'Data Science');

INSERT INTO student (student_id, student_name, age)
VALUES (101, 'Ajay', 22);

INSERT INTO student (student_id, student_name, age)
VALUES (102, 'Ravi', 23);

INSERT INTO enrollment VALUES (1, 101, 1);
INSERT INTO enrollment VALUES (2, 102, 2);

-- Data update
UPDATE student
SET age = 23
WHERE student_id = 101;

-- Data delete
DELETE FROM enrollment
WHERE enroll_id = 2;

-- New role creation
CREATE ROLE report_user LOGIN PASSWORD 'report123';

-- Grant privileges
GRANT SELECT ON course TO report_user;
GRANT SELECT ON student TO report_user;
GRANT SELECT ON enrollment TO report_user;

-- Alter table (add phone number)
ALTER TABLE student
ADD COLUMN phone_no VARCHAR(15);

-- Revoke privileges
REVOKE ALL ON course FROM report_user;
REVOKE ALL ON student FROM report_user;
REVOKE ALL ON enrollment FROM report_user;

-- Drop table
DROP TABLE enrollment;
```
OUTPUT:
Access granted to new role:

<img width="350" height="101" alt="image" src="https://github.com/user-attachments/assets/87036a4c-f3db-4595-b075-0a6b57cd8abf" />





 

Table Accesed by new role:

<img width="320" height="135" alt="image" src="https://github.com/user-attachments/assets/e62c938f-bc02-4937-a3f1-3273242f8937" />







Access revoked:

<img width="350" height="75" alt="image" src="https://github.com/user-attachments/assets/5b9d8862-dfb6-484c-bc34-5779ac6feb5e" />







Accessing after permission revoked:

<img width="380" height="130" alt="image" src="https://github.com/user-attachments/assets/75d191fd-2693-4452-bf4b-b1db55ff2695" />





## Learning Outcome

- Learned to create and manage tables using DDL commands in PostgreSQL

- Understood the use of constraints to maintain data integrity

- Performed INSERT, UPDATE, and DELETE operations using DML commands

- Implemented role-based access control using DCL commands

- Provided secure read-only access by granting only SELECT privilege
