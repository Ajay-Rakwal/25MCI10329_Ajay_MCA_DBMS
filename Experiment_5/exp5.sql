--table creation
CREATE TABLE Employee (
    emp_id INT,
    emp_name VARCHAR(50),
    salary INT
);

--values insertion
INSERT INTO Employee VALUES (1,'Ajay',20000);
INSERT INTO Employee VALUES (2,'Jatin',15000);
INSERT INTO Employee VALUES (3,'Nidhi',25000);
INSERT INTO Employee VALUES (4,'yuvraj',0);


Select * From  Employee;


--Exception handling performed in multiple lines
DO $$
BEGIN 

    INSERT INTO Employee VALUES (5,'Anay',20000);

    IF FOUND THEN
        RAISE NOTICE 'ROW INSERT SUCCESSFULLY';
    END IF ;

    DELETE FROM Employee WHERE  emp_id =99;

    IF FOUND THEN
        RAISE NOTICE 'ROW DELETE SUCCESSFULLY';
    ELSE
        RAISE NOTICE 'emp_id NOT FOUND';
    END IF ;

END;
$$;

Select * From Employee;
-- STEP 1 Forward only cursor

DO $$
DECLARE 

    emp_cursor CURSOR FOR SELECT EMP_ID,SALARY FROM EMPLOYEE;

    V_EMP_ID Employee.EMP_ID%TYPE;
    V_SALARY EMPLOYEE.SALARY%TYPE;

BEGIN
    OPEN emp_cursor;

    FETCH emp_cursor INTO V_EMP_ID ,V_SALARY;

--STEP 2 Row-by-Row Manipulation Logic
    WHILE FOUND
    LOOP

        IF V_SALARY=0 THEN
            RAISE EXCEPTION 'Salary is zero. Increment not possible.';
        END IF;

        UPDATE EMPLOYEE
        SET SALARY=V_SALARY*1.10
        WHERE EMP_ID=V_EMP_ID;

        FETCH emp_cursor INTO V_EMP_ID ,V_SALARY;

    END LOOP;

    CLOSE emp_cursor;

--STEP 3 exception implemented
EXCEPTION 
    WHEN OTHERS THEN 
        RAISE NOTICE '%', SQLERRM;

END;
$$;
