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


CREATE TABLE enrollments (
    student_id INT,
    course_id INT,
    PRIMARY KEY (student_id, course_id),
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (course_id) REFERENCES courses(course_id)
);


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



--students not enrolled in any course (LEFT JOIN).
SELECT 
    s.student_id,
    s.name
FROM students s
LEFT JOIN enrollments e 
    ON s.student_id = e.student_id
WHERE e.student_id IS NULL;


-- all courses with or without enrolled students (RIGHT JOIN).
SELECT 
    c.course_name,
    s.name AS student_name
FROM enrollments e
RIGHT JOIN courses c 
    ON e.course_id = c.course_id
LEFT JOIN students s 
    ON e.student_id = s.student_id;


--students with department info using SELF JOIN or multiple joins.
SELECT 
    s1.name AS student1,
    s2.name AS student2
FROM students s1
JOIN students s2 
    ON s1.department_id = s2.department_id
WHERE s1.student_id <> s2.student_id;



--all possible student-course combinations (CROSS JOIN)
SELECT 
    s.name,
    c.course_name
FROM students s
CROSS JOIN courses c;