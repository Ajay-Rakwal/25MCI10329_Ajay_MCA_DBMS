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
