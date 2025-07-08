# Library System Management using SQL

# Project Overview
This project demonstrates the implementation of a Library Management System using SQL. It includes creating and managing tables, performing CRUD operations, and executing advanced SQL queries. The goal is to showcase skills in database design, manipulation, and querying.

![Library logo](https://github.com/arkatava-saha/EDA_PROJECT/blob/main/Library%20logo.jpeg)

# Objectives

1. Set up the Library Management System Database: Create and populate the database with tables for branches, employees, members, books, issued status, and return status.
2. CRUD Operations: Perform Create, Read, Update, and Delete operations on the data.
3. CTAS (Create Table As Select): Utilize CTAS to create new tables based on query results.



# 1. Create a New Book Record -- "978-1-60129-456-2', 'To Kill a Mockingbird', 'Classic', 6.00, 'yes', 'Harper Lee', 'J.B. Lippincott & Co.')"
 
```
INSERT INTO Books (isbn, book_title, category, rental_price, status, author, publisher)
VALUES
('978-1-60129-456-2', 'To Kill a Mockingbird', 'Classic', 6.00, 'yes', 'Harper Lee', 'J.B. Lippincott & Co.');
```

 # 2. Update an Existing Member's Address

```
UPDATE Members 
SET member_address = '180 Main St'
WHERE member_id = 'C101';
```

 # 3. Delete a Record from the Issued Status Table
 
```
DELETE FROM issued_status
WHERE issued_id = 'IS121';
```

 # 4. Retrieve All Books Issued by a Specific Employee
 
```
SELECT * FROM issued_status 
WHERE issued_emp_id = 'E101';
```

 # 5. List Members Who Have Issued More Than One Book
 
```
SELECT issued_emp_id, COUNT(issued_id) AS total_book_issued 
FROM issued_status 
GROUP BY issued_emp_id 
HAVING COUNT(issued_id) > 1;
```

 # 6. Create Summary Table Using CTAS: Book Issue Count

```
CREATE TABLE book_cnt AS SELECT b.isbn, b.book_title,
COUNT(ist.issued_id) AS no_issued 
FROM Books AS b 
JOIN
issued_status AS ist 
ON ist.issued_book_isbn = b.isbn 
GROUP BY 1, 2;
```

 # 7. Retrieve All Books in the 'Classic' Category
 
```
SELECT * FROM Books 
WHERE category = 'Classic';
```

 # 8. Find Total Rental Income by Category
 
```
SELECT b.category, SUM(b.rental_price),
COUNT(*) AS total_books 
FROM Books AS b 
JOIN 
issued_status AS ist 
ON ist.issued_book_isbn = b.isbn 
GROUP BY 1;
```

 # 9. List Members Who Registered in the Last 180 Days
 
```
SELECT * FROM Members
WHERE reg_date >= current_date - INTERVAL '180 days';
```

 # 10. List Employees with Their Branch Manager’s Name and Branch Details
 
```
SELECT e1.*, b.manager_id, e2.emp_name AS manager 
FROM Employees AS e1 
JOIN 
Branch AS b 
ON b.branch_id = e1.branch_id
JOIN
Employees AS e2 
ON b.manager_id = e2.emp_id;
```

 # 11. Create a Table of Books with Rental Price Greater Than 7
 
```
CREATE TABLE 
Books_price_greater_than_7 
AS
SELECT * FROM Books 
WHERE rental_price > 7;
```

 # 12. Retrieve the List of Books Not Yet Returned
 
```
SELECT DISTINCT ist.issued_book_name
FROM issued_status AS ist
LEFT JOIN
return_status AS rs
ON rs.issued_id = ist.issued_id 
WHERE rs.return_id IS NULL;
```


# Conclusion

This project demonstrates the application of SQL skills in creating and managing a library management system. It includes database setup, data manipulation, and advanced querying, providing a solid foundation for data management and analysis.

LinkedIN - www.linkedin.com/in/arkatava-saha-11b66a1b7
Email - arkatavasaha@gmail.com

