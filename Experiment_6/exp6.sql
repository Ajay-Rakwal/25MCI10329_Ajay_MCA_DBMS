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