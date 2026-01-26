--course table
CREATE TABLE course (
    course_id INT PRIMARY KEY NOT NULL UNIQUE,
    course_name VARCHAR(50)
);


--student table 
CREATE TABLE Student (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(50) NOT NULL,
    email VARCHAR(50) UNIQUE,
    age INT CHECK (age >= 18)
);

-- enrollment table
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


-- data insertion
INSERT INTO course VALUES (1, 'Artificial Intelligence');
INSERT INTO course VALUES (2, 'Data Science');
INSERT INTO student VALUES (101, 'Ajay', 22);
INSERT INTO student VALUES (102, 'Ravi', 23);
INSERT INTO enrollment VALUES (1, 101, 1);
INSERT INTO enrollment VALUES (2, 102, 2);

--data update
UPDATE student
SET age = 23
WHERE student_id = 101;

--data delete 
DELETE FROM enrollment
WHERE enroll_id = 2;

-- new role created 
CREATE ROLE report_user LOGIN PASSWORD 'report123';

-- grant 
GRANT SELECT ON course TO report_user;
GRANT SELECT ON student TO report_user;
GRANT SELECT ON enrollment TO report_user;
--add phone number
ALTER TABLE student
ADD COLUMN phone_no VARCHAR(15);

-- revovke
REVOKE ALL ON course FROM report_user;
REVOKE ALL ON student FROM report_user;
REVOKE ALL ON enrollment FROM report_user;

--table drop
DROP TABLE enrollment;
