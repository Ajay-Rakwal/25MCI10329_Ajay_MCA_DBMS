# Experiment- 7

---

# Aim of the program:

Implementation of joins in PostgreSQL (inner join ,left join,right join, self join and cross join)

---

# Software Requirements

- Operating System: Windows / Linux  
- Database Management System: MySQL / Oracle / PostgreSQL  
- SQL Interface: MySQL Workbench /Web Based / pgAdmin  

---

# Objective

Apply joins to a real-world database schema (e.g., Students, Courses, Enrollments, Departments)

---

# Procedure of the Practical

1. Open PostgreSQL (pgAdmin) and connect to the required database.  
2. Create necessary tables such as Students, Courses, Enrollments, and Departments, and insert sample records.  
3. Execute an INNER JOIN query to display students along with their enrolled courses.  
4. Use a LEFT JOIN to find students who are not enrolled in any course.  
5. Apply a RIGHT JOIN to display all courses, including those without enrolled students.  
6. Use SELF JOIN or multiple joins to display students along with their department information.  
7. Execute a CROSS JOIN to generate all possible combinations of students and courses and analyze the output.  

---

# Practical / Experiment Steps

```sql
--creating tables
CREATE TABLE departments (
 department_id SERIAL PRIMARY KEY,
 department_name VARCHAR(40)
);

CREATE TABLE students (
 student_id SERIAL PRIMARY KEY,
 name VARCHAR(40),
 department_id INT,
 FOREIGN KEY (department_id) REFERENCES departments(department_id)
);

CREATE TABLE courses (
 course_id SERIAL PRIMARY KEY,
 course_name VARCHAR(40)
);
```

```sql
CREATE TABLE enrollments (
 student_id INT,
 course_id INT,
 PRIMARY KEY (student_id, course_id),
 FOREIGN KEY (student_id) REFERENCES students(student_id),
 FOREIGN KEY (course_id) REFERENCES courses(course_id)
);
```

```sql
--inserting values into tables
INSERT INTO departments (department_name) VALUES
('Computer Science'),
('Mechanical'),
('Electrical');

INSERT INTO students (name, department_id) VALUES
('Ajay', 1),
('Jatin', 2),
('Purnima', 1),
('Yuvraj', 3),
('Daniel', NULL); 

INSERT INTO courses (course_name) VALUES
('DBMS'),
('OS'),
('Maths'),
('AI');

INSERT INTO enrollments (student_id, course_id) VALUES
(1, 1),
(1, 2),
(2, 3),
(3, 1);
```

```sql
--students with their enrolled courses (INNER JOIN)
SELECT 
 s.student_id,
 s.name,
 c.course_name
FROM students s
INNER JOIN enrollments e 
 ON s.student_id = e.student_id
INNER JOIN courses c 
 ON e.course_id = c.course_id;
```

```sql
--students not enrolled in any course (LEFT JOIN).
SELECT 
 s.student_id,
 s.name
FROM students s
LEFT JOIN enrollments e 
 ON s.student_id = e.student_id
WHERE e.student_id IS NULL;
```

```sql
-- all courses with or without enrolled students (RIGHT JOIN).
SELECT 
 c.course_name,
 s.name AS student_name
FROM enrollments e
RIGHT JOIN courses c 
 ON e.course_id = c.course_id
LEFT JOIN students s 
 ON e.student_id = s.student_id;
```

```sql
--students with department info using SELF JOIN or multiple joins.
SELECT 
 s1.name AS student1,
 s2.name AS student2
FROM students s1
JOIN students s2 
 ON s1.department_id = s2.department_id
WHERE s1.student_id <> s2.student_id;
```

```sql
--all possible student-course combinations (CROSS JOIN)
SELECT 
 s.name,
 c.course_name
FROM students s
CROSS JOIN courses c;
```

---

# I/O Analysis (Input / Output)

## Input

- Base table creation queries for departments, students, courses, and enrollments  
- Sample data insertion commands for all tables  
- INNER JOIN query to display students with their enrolled courses  
- LEFT JOIN query to find students not enrolled in any course  
- RIGHT JOIN query to display all courses with or without enrolled students  
- SELF JOIN query to find students belonging to the same department  
- CROSS JOIN query to generate all possible student-course combinations  

## Output

- Base tables created successfully with primary and foreign key constraints  
- Sample data inserted into all tables successfully  
- INNER JOIN displaying students along with their enrolled courses  
- LEFT JOIN identifying students with no course enrollments  
- RIGHT JOIN showing all courses including those without students  
- SELF JOIN displaying pairs of students from the same department  
- CROSS JOIN generating all possible combinations of students and courses  
- Effective demonstration of different JOIN operations for relational data retrieval  

---

## OUTPUT:

### Table Created:
<img width="220" height="90" alt="Screenshot 2026-03-31 115917" src="https://github.com/user-attachments/assets/c7487ee3-6169-48e4-89cb-af9e481d01d3" />


### students with their enrolled courses (INNER JOIN):
<img width="300" height="175" alt="image" src="https://github.com/user-attachments/assets/4be5fbce-2a15-4606-ab94-9ab6c7c0647b" />


### students not enrolled in any course (LEFT JOIN).
<img width="251" height="130" alt="image" src="https://github.com/user-attachments/assets/fc3cd79b-3f6c-41d3-8194-a942f8b5f53a" />


### students with department info using SELF JOIN or multiple joins.
<img width="275" height="123" alt="image" src="https://github.com/user-attachments/assets/3121f9d3-f0c8-4aed-892a-b32662900b0b" />


### all possible student-course combinations (CROSS JOIN)
<img width="219" height="350" alt="image" src="https://github.com/user-attachments/assets/c443a09e-9777-49ef-a9ab-4cbe9a1b13ec" />


---

# Learning Outcome:

- Understand the concept and purpose of different types of joins in SQL.  
- Learn how to apply INNER, LEFT, RIGHT, SELF, and CROSS JOINs in PostgreSQL.  
- Gain practical experience in retrieving related data from multiple tables.  
- Develop the ability to handle real-world relational database scenarios using joins.  
- Understand how joins help in data integration and query optimization in database systems.  
