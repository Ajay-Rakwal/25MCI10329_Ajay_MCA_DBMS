-- employee table (used in examples)
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
