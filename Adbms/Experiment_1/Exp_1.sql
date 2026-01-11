
-- CREATE TABLE Books

CREATE TABLE books (
    book_id INT PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    author VARCHAR(100) NOT NULL,
    available_copies INT CHECK (available_copies >= 0)
);

-- CREATE TABLE Members
CREATE TABLE members (
    member_id INT PRIMARY KEY,
    member_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE
);

-- CREATE TABLE Book Issue
CREATE TABLE book_issue (
    issue_id INT PRIMARY KEY,
    book_id INT REFERENCES books(book_id),
    member_id INT REFERENCES members(member_id),
    issue_date DATE,
    return_date DATE
);

-- INSERT SAMPLE DATA INTO BOOKS
INSERT INTO books VALUES
(1, 'DBMS Concepts', 'Silberschatz', 5),
(2, 'Operating System', 'Galvin', 3);

-- INSERT SAMPLE DATA INTO MEMBERS
INSERT INTO members VALUES
(101, 'Amit Kumar', 'amit@gmail.com'),
(102, 'Neha Sharma', 'neha@gmail.com');

-- INSERT SAMPLE DATA INTO BOOK ISSUE
INSERT INTO book_issue(issue_id,book_id,member_id,issue_date,
return_date)
VALUES
(1001, 1, 101, '2025-01-10', NULL);

-- QUERY TO VIEW DATA
SELECT * FROM books;
SELECT * FROM book_issue;

-- QUERY TO UPDATE AVAILABLE COPIES AFTER BOOK ISSUE
UPDATE books
SET available_copies = available_copies -1
WHERE book_id = 1;

-- QUERY TO GRANT ACCESS TO A USER
GRANT SELECT, UPDATE ON books TO LIBRARIAN;

-- QUERY TO REVOKE ACCESS FROM A USER
REVOKE UPDATE ON books FROM LIBRARIAN;

-- QUERY TO REMOVE OBSOLETE VALUES
DELETE FROM book_issue 
WHERE return_date IS NOT NULL AND return_date < '2025-01-01';