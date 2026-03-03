# Experiment - 5

## Aim of the Program
To gain hands-on experience in creating and using cursors for row-by-row processing in a database, enabling sequential access and manipulation of query results for complex business logic.

---

## Software Requirements
- Operating System: Windows / Linux  
- Database Management System: MySQL / Oracle / PostgreSQL  
- SQL Interface: MySQL Workbench / Web Based / pgAdmin  

---

## Objective
- **Sequential Data Access:** To understand how to fetch rows one by one from a result set using cursor mechanisms.  
- **Row-Level Manipulation:** To perform specific operations or calculations on individual records that require conditional procedural logic.  
- **Resource Management:** To learn the lifecycle of a cursor: Declaring, Opening, Fetching, and Closing to manage system memory.  
- **Exception Handling:** To handle cursor-related errors and performance considerations during large-scale data iteration.  

---

## Procedure of the Practical

1. Open the database environment such as Oracle / MS SQL Server / PostgreSQL and connect to the desired database.  
2. Create a sample Employee table and insert records to simulate real-world row-wise data processing.  
3. Declare a simple forward-only cursor to fetch employee records sequentially and display them one by one.  
4. Open the cursor and use the FETCH operation to retrieve each row for processing.  
5. Implement row-by-row manipulation logic such as updating salaries based on specific conditions.  
6. Handle cursor execution flow by checking for end-of-data or empty result sets to avoid runtime errors.  
7. Properly close and deallocate the cursor after completing all iterations to release system resources.  
8. Execute the cursor-based blocks and observe sequential processing of records and updates performed.  
9. Verify the final results using SELECT queries and analyze how cursors enable procedural control over row-wise operations.  

---

## Practical / Experiment Steps

```sql
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

```

## I/O Analysis (Input / Output)

### Input

- Employee table creation queries  
- Sample data insertion commands  
- Cursor declaration and opening statements  
- FETCH operations for row-by-row processing  
- Conditional UPDATE logic inside cursor loop  
- CLOSE and DEALLOCATE cursor commands  

### Output

- Records fetched sequentially using cursor  
- Row-wise salary updates performed correctly  
- Cursor lifecycle executed (declare, open, fetch, close, deallocate)  
- Proper handling of empty or termination conditions  
- Updated records displayed accurately after cursor execution  

---

## OUTPUT

Table Created:



<img width="250" height="110" alt="image" src="https://github.com/user-attachments/assets/937151a0-1cb9-403c-af06-f812d931d6e6" />





Insert sample records:




<img width="260" height="160" alt="image" src="https://github.com/user-attachments/assets/5c7ccdcf-c80a-49c1-9be9-3bb92031c136" />








--insertion of new entry with the use of exception handling  



<img width="260" height="180" alt="image" src="https://github.com/user-attachments/assets/61f4d36d-72cf-4732-a50f-b941595c56d7" />











--Implementing cursor lifecycle and exception handling as salary of one entry = 0 


<img width="350" height="115" alt="image" src="https://github.com/user-attachments/assets/c7570393-fe6e-4134-892d-8fedabdc02b2" />






## Learning Outcome

- Understand the concept and need of cursors for row-by-row data processing in databases.  
- Learn the lifecycle of cursors including declare, open, fetch, close, and deallocate operations.  
- Gain practical knowledge of applying procedural logic to individual records using cursors.  
- Develop the ability to handle cursor-related exceptions and manage system resources efficiently.  
- Apply cursor-based logic to real-world enterprise scenarios such as payroll updates and data migration tasks.  
