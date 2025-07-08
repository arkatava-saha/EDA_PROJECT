--Task 1. Create a New Book Record -- "978-1-60129-456-2', 'To Kill a Mockingbird', 'Classic', 6.00, 'yes', 'Harper Lee', 'J.B. Lippincott & Co.')"

INSERT INTO Books (isbn, book_title, category, rental_price, status, author, publisher)
VALUES (
'978-1-60129-456-2', 'To Kill a Mockingbird', 
'Classic', 6.00, 'yes', 'Harper Lee', 'J.B. Lippincott & Co.'
)

SELECT * FROM issued_status

--Task 2: Update an Existing Member's Address

UPDATE Members 
SET member_address = '180 Main St'
WHERE member_id = 'C101'

--Task 3: Delete a Record from the Issued Status Table -- Objective: Delete the record with issued_id = 'IS121' from the issued_status table.

DELETE FROM issued_status
WHERE issued_id = 'IS121'

-- Task 4: Retrieve All Books Issued by a Specific Employee -- Objective: Select all books issued by the employee with emp_id = 'E101'.

SELECT * FROM issued_status	
WHERE issued_emp_id = 'E101';


--Task 5: List Members Who Have Issued More Than One Book -- Objective: Use GROUP BY to find members who have issued more than one book.

SELECT issued_emp_id,
COUNT (issued_id) AS total_book_issued
FROM issued_status	
GROUP BY issued_emp_id
HAVING COUNT (issued_id) > 1
;

--CTAS
--Task 6: Create Summary Tables: Used CTAS to generate new tables based on query results - each book and total book_issued_cnt**

CREATE TABLE book_cnt
as
SELECT b.isbn, b.book_title,
COUNT(ist.issued_id) as no_issued 
FROM Books as b
JOIN
issued_status as ist
On ist.issued_book_isbn = b.isbn
GROUP BY 1,2

SELECT * FROM book_cnt


--Task 7. Retrieve All Books in a Specific Category:

SELECT * FROM Books
WHERE category = 'Classic'

--Task 8: Find Total Rental Income by Category:

SELECT b.category, 
	SUM(b.rental_price),
	COUNT(*)
FROM Books as b
JOIN
issued_status as ist
On ist.issued_book_isbn = b.isbn
GROUP BY 1

--List Members Who Registered in the Last 180 Days:

SELECT * FROM Members
WHERE reg_date >= current_date - INTERVAL '180 days';

--List Employees with Their Branch Manager's Name and their branch details:

SELECT e1.*,
	   b.manager_id,
	   e2.emp_name as manager
FROM Employees as e1
JOIN Branch as b 
ON b.branch_id = e1.branch_id
JOIN
Employees as e2
ON b.manager_id = e2.emp_id;

--Task 11. Create a Table of Books with Rental Price Above a Certain Threshold:

CREATE TABLE Books_price_greater_than_7
as
SELECT* FROM Books 
WHERE rental_price > 7
 
SELECT* FROM Books_price_greater_than_7

--Task 12: Retrieve the List of Books Not Yet Returned

SELECT DISTINCT ist.issued_book_name
FROM issued_status as ist
LEFT JOIN
return_status as rs
ON rs.issued_id = ist.issued_id
WHERE rs.return_id IS NULL;






















