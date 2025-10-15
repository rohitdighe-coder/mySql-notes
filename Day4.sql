/* 
==================================================================================================
🧮 DAY 4 — Day 4 — INSERT, UPDATE, DELETE, ALTER (Extended Practice & Use Cases)
Goal: Use INSERT, UPDATE, DELETE, ALTER statements to manage and modify data and table structures
==================================================================================================
*/

-- 1. INSERT: Add a new employee to the Employees table
Syntax:
-- INSERT INTO table_name (column1, column2, column3, ...)
-- VALUES (value1, value2, value3, ...);
-- Example:
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Position VARCHAR(100),
    Salary DECIMAL(10, 2),
    HireDate DATE
);
INSERT INTO Employees (FirstName, LastName, Position, Salary, HireDate)
VALUES ('John', 'Doe', 'Software Engineer', 80000, '2023-01-15');
-- Verify the insertion
SELECT * FROM Employees WHERE FirstName = 'John' AND LastName = 'Doe';
what is the output of the above select statement?
-- Output:
-- EmployeeID | FirstName | LastName | Position          | Salary  | HireDate
-- ------------------------------------------------------------------------------
-- 1          | John      | Doe      | Software Engineer | 80000.00 | 2023-01-15
the above exmaple is single row insert, now do a multi row insert
INSERT INTO Employees (FirstName, LastName, Position, Salary, HireDate)
VALUES
    ('Jane', 'Smith', 'Product Manager', 90000, '2023-02-01'),
    ('Alice', 'Johnson', 'UX Designer', 70000, '2023-03-10'),
    ('Bob', 'Brown', 'Data Analyst', 60000, '2023-04-20');  
-- Verify the multi-row insertion
SELECT * FROM Employees;
-- Output:  
-- EmployeeID | FirstName | LastName | Position          | Salary  | HireDate
-- ------------------------------------------------------------------------------
-- 1          | John      | Doe      | Software Engineer | 80000.00 | 2023-01-15
-- 2          | Jane      | Smith    | Product Manager   | 90000.00 | 2023-02-01
-- 3          | Alice     | Johnson  | UX Designer       | 70000.00 | 2023-03-10
-- 4          | Bob       | Brown    | Data Analyst      | 60000.00 | 2023-04-20  

--------------------------------------------------------------------------------------
Tester Use Case:
-- 2. INSERT: Add dummy data for testing purposes
-- Testers often need to insert dummy data to validate scripts and queries.
-- Example: Inserting multiple dummy employees
INSERT INTO Employees (FirstName, LastName, Position, Salary, HireDate)
VALUES
    ('Test', 'User1', 'Intern', 30000, '2023-05-01'),
    ('Test', 'User2', 'Intern', 30000, '2023-05-01'),
    ('Test', 'User3', 'Intern', 30000, '2023-05-01');
-- Verify the dummy data insertion
SELECT * FROM Employees WHERE FirstName = 'Test';
-- Output:
-- EmployeeID | FirstName | LastName | Position | Salary  | HireDate
-- ------------------------------------------------------------------------------
-- 5          | Test      | User1    | Intern   | 30000.00 | 2023-05-01 
-- 6          | Test      | User2    | Intern   | 30000.00 | 2023-05-01
-- 7          | Test      | User3    | Intern   | 30000.00 | 2023-05-01
-- Note:    
Before automation testing, testers often insert dummy data for testing validation scripts.

🗣️ Interview Questions — INSERT
Question	                                                            Answer
What is the purpose of the INSERT command?           	    It is used to add new records into a table.
Can we insert multiple rows at once?            	       Yes, using a single INSERT statement with multiple VALUES.
What happens if you insert fewer values than columns?    	The remaining columns get NULL values (if allowed).

--ANY MORE INTERVIEW QUESTIONS SUGGESTIONS?
Is it necessary to mention column names in INSERT?
No, but it's a good practice to avoid errors if the table structure changes.

What is the difference between INSERT and INSERT IGNORE?
INSERT IGNORE skips rows that would cause duplicate key errors.

What is the difference between INSERT and REPLACE?
REPLACE deletes existing rows with the same primary key before inserting new ones.

What is the difference between INSERT and INSERT ... SELECT?
INSERT ... SELECT copies data from one table to another, while INSERT adds new rows.

What are some common errors when using INSERT?
Common errors include mismatched data types, missing required fields, and constraint violations.

What is the maximum number of rows you can insert in a single INSERT statement?
The maximum number varies by database system, but it's often limited by the maximum packet size or memory.

How do you handle inserting data with special characters?
Special characters should be escaped or parameterized to prevent SQL injection.

What is the difference between INSERT and BULK INSERT?
BULK INSERT is used to import large amounts of data from a file into a table, while INSERT is used to add individual rows.

What is the difference between INSERT and UPSERT?
UPSERT (INSERT ... ON CONFLICT) inserts a new row or updates an existing row if a conflict occurs.

What is the difference between INSERT and MERGE?
MERGE combines INSERT, UPDATE, and DELETE operations based on a condition, while INSERT only adds
new rows.

Can we insert multiple rows in a single query?
Yes, using comma-separated VALUES lists: INSERT INTO table VALUES (1,'A'), (2,'B');

How can you insert data into a table from another table?
Using INSERT INTO table2 SELECT * FROM table1 WHERE condition;

What happens if you try to insert a duplicate value into a column with a UNIQUE constraint?	
The query fails and throws a constraint violation error.

 What happens if you try to insert NULL into a NOT NULL column?	
It will throw an error saying the column cannot contain NULL values.

Can you insert data into a table without specifying all columns?	
Yes, but only if the missing columns have default values or allow NULLs.

How do you insert a record with the current date and time?	
INSERT INTO orders (id, order_date) VALUES (1, CURRENT_TIMESTAMP);

What is the difference between INSERT INTO ... VALUES and INSERT INTO ... SELECT?
VALUES adds static data, while SELECT inserts dynamically fetched data from another table or query.


How can you insert data only if it doesn’t already exist?
Use a WHERE NOT EXISTS clause:
INSERT INTO employees (id,name) SELECT 5,'Rohit' WHERE NOT EXISTS (SELECT * FROM employees WHERE id=5);

How do you handle auto-increment (IDENTITY) columns during insert?
You can skip them — SQL auto-generates the value. Example: INSERT INTO employees (name, salary) VALUES ('Amit', 50000);

What if the table has a DEFAULT value for a column?	
If you don’t specify that column in INSERT, SQL automatically inserts the default value.

How to insert data into only specific columns?	
Example: INSERT INTO employees (name, department) VALUES ('Sneha', 'QA'); — other columns get default or NULL values.

Tricky & Scenario-Based Questions

 What will happen if you run an INSERT statement without specifying column names but change the table structure later?
	It can break future inserts because column order may change. Best practice — always mention column names.

 How do you insert data with a single column value repeated across multiple rows?	
INSERT INTO table (column1, column2) VALUES (1, 'A'), (1, 'B'), (1, 'C');
 How can you copy only specific columns from one table to another?	
INSERT INTO table2 (col1, col2) SELECT col1, col2 FROM table1;

What is a constraint violation during INSERT?	
When you try to insert data that breaks rules like PRIMARY KEY, UNIQUE, or FOREIGN KEY.

 How to insert NULL values explicitly?	
INSERT INTO employees (id, name, department, salary) VALUES (5, 'Ravi', NULL, NULL);


Testing & Real-Use Questions


 As a tester, when will you use INSERT?	
 While preparing test data before running automation or SQL validation.

 How do you insert bulk test data efficiently?	
 Using a script or stored procedure with multiple INSERTs or LOAD DATA (MySQL) / COPY (PostgreSQL).

 How do you verify if an INSERT worked correctly?	
 Use SELECT query to validate or check the row count before and after.

 How do you insert data from a CSV file?	
 In MySQL: LOAD DATA INFILE 'file.csv' INTO TABLE employees FIELDS TERMINATED BY ',';

 Can INSERT be rolled back?	
 Yes, if it’s inside a transaction and not yet committed. Example: ROLLBACK; undoes the INSERT.

 ------------------------------------------------------------------------------------------------------------
 Bonus Practical Question (Asked in MNCs)

Q: You have two tables Employee(id, name, salary) and Salary_History(id, amount, date).
Write a query to insert employee salary data into Salary_History from Employee.

Question (as interviewer asked):

You have two tables:
Employee → (id, name, salary)
Salary_History → (id, amount, date)

Write an SQL query to insert data from Employee into Salary_History.

🧱 1️⃣ Let’s Create Both Tables
CREATE TABLE Employee (
    id INT,
    name VARCHAR(50),
    salary INT
);

CREATE TABLE Salary_History (
    id INT,
    amount INT,
    date DATE
);

🧱 2️⃣ Insert Some Data in Employee Table
INSERT INTO Employee (id, name, salary)
VALUES
(1, 'Rohit', 55000),
(2, 'Sneha', 60000),
(3, 'Amit', 45000);


Now, our Employee table looks like this 👇

id	name	salary
1	Rohit	55000
2	Sneha	60000
3	Amit	45000
🧱 3️⃣ Goal

We want to copy this salary data into the Salary_History table.

✅ 4️⃣ Query to Insert from One Table into Another
INSERT INTO Salary_History (id, amount, date)
SELECT id, salary, CURRENT_DATE
FROM Employee;

🧾 What Happens Internally

SQL will take data from Employee table
For each record, it will insert it into Salary_History
The column mapping will be like this 👇
From Employee	→	To Salary_History
id	→	id
salary	→	amount
current date	→	date

🧮 5️⃣ Final Salary_History Table Result
id	amount	date
1	55000	2025-10-13
2	60000	2025-10-13
3	45000	2025-10-13

✅ All data copied from Employee → Salary_History
✅ Added today’s date using CURRENT_DATE


-----------------------------------------------------------------------------------------
 UPDATE: 
 The UPDATE statement is used to modify existing records in a table.
Syntax:
UPDATE table_name
SET column1 = value1, column2 = value2
WHERE condition;

⚠️ Important:
If you forget WHERE, it updates all rows in the table!

Example 1 — Basic Update

Let’s use the same table we created earlier 

CREATE TABLE Employee (
    id INT,
    name VARCHAR(50),
    department VARCHAR(50),
    salary INT
);

INSERT INTO Employee (id, name, department, salary)
VALUES
(1, 'Rohit', 'QA', 55000),
(2, 'Sneha', 'Dev', 65000),
(3, 'Amit', 'Support', 45000);

-- Update Amit's salary
UPDATE Employee
SET salary = 48000
WHERE name = 'Amit';

-- Verify the update
SELECT * FROM Employee WHERE name = 'Amit';
-- Output:
-- id | name | department | salary      
-- --------------------------------------------------
-- 3  | Amit | Support    | 48000   
--------------------------------------------------------
Example 2 — Update Multiple Columns
-- Update Rohit's department and salary
UPDATE Employee
SET department = 'Dev', salary = 58000
WHERE name = 'Rohit';
-- Verify the update
SELECT * FROM Employee WHERE name = 'Rohit';
-- Output:
-- id | name  | department | salary
-- --------------------------------------------------
-- 1  | Rohit | Dev        | 58000  
--------------------------------------------------------


Example 3 — Update Multiple Rows
-- Give a 10% raise to all employees in the Dev department
UPDATE Employee
SET salary = salary * 1.10
WHERE department = 'Dev';
-- Verify the update
SELECT * FROM Employee WHERE department = 'Dev';
-- Output:
-- id | name  | department | salary 
-- --------------------------------------------------
-- 1  | Rohit | Dev        | 63800
-- 2  | Sneha | Dev        | 71500
--------------------------------------------------------
Example 4 — Update Without WHERE (Be Careful!)
-- Update all employees to have a salary of 50000
UPDATE Employee
SET salary = 50000;
-- Verify the update
SELECT * FROM Employee;
-- Output:
-- id | name  | department | salary
-- --------------------------------------------------
-- 1  | Rohit | Dev        | 50000
-- 2  | Sneha | Dev        | 50000
-- 3  | Amit  | Support    | 50000
--------------------------------------------------------
-- To revert back, let's reset the salaries
UPDATE Employee
    SET salary = CASE 
    WHEN name = 'Rohit' THEN 58000
    WHEN name = 'Sneha' THEN 65000
    WHEN name = 'Amit' THEN 48000
END;
-- Verify the reset
SELECT * FROM Employee;
-- Output:
-- id | name  | department | salary
-- --------------------------------------------------

-- 1  | Rohit | Dev        | 58000
-- 2  | Sneha | Dev        | 65000     
-- 3  | Amit  | Support    | 48000
--------------------------------------------------------
--------------------------------------------------------------------------------------
Use Case: Correcting Data Entry Errors
-- Suppose Amit was mistakenly assigned to the Support department instead of QA.
-- Update Amit's department to QA
UPDATE Employee
SET department = 'QA'
WHERE name = 'Amit';
-- Verify the update
SELECT * FROM Employee WHERE name = 'Amit';
-- Output:
-- id | name  | department | salary
-- --------------------------------------------------
-- 3  | Amit  | QA         | 48000
--------------------------------------------------------
--------------------------------------------------------------------------------------
Use Case: Bulk Salary Adjustment
-- The company decides to give a 5% raise to all employees in the QA department.
UPDATE Employee
SET salary = salary * 1.05
WHERE department = 'QA';
-- Verify the update
SELECT * FROM Employee WHERE department = 'QA';
-- Output:
-- id | name  | department | salary
-- --------------------------------------------------
-- 1  | Rohit | Dev        | 58000
-- 3  | Amit  | QA         | 50400
--------------------------------------------------------
--------------------------------------------------------------------------------------
Use Case: Updating Multiple Columns Based on Conditions
-- Sneha is promoted to Senior Developer and gets a raise to 75000
UPDATE Employee
SET position = 'Senior Developer', salary = 75000
WHERE name = 'Sneha';
-- Verify the update
SELECT * FROM Employee WHERE name = 'Sneha';
-- Output:
-- id | name  | department | position          | salary
-- --------------------------------------------------
-- 2  | Sneha | Dev        | Senior Developer  | 75000
--------------------------------------------------------
--------------------------------------------------------------------------------------
Use Case: Data Normalization
-- The company decides to standardize department names to uppercase.
UPDATE Employee
SET department = UPPER(department);
-- Verify the update
SELECT * FROM Employee;
-- Output:
-- id | name  | department | position          | salary
-- --------------------------------------------------
-- 1  | Rohit | DEV        | NULL              | 58000
-- 2  | Sneha | DEV        | Senior Developer  | 75000
-- 3  | Amit  | QA         | NULL              | 50400
--------------------------------------------------------        
--------------------------------------------------------------------------------------
Use Case: Correcting Data Based on External Information
-- After a review, it was found that Rohit's salary should be 60000 instead of
-- 58000.
UPDATE Employee
SET salary = 60000
WHERE name = 'Rohit';
-- Verify the update
SELECT * FROM Employee WHERE name = 'Rohit';
-- Output:
-- id | name  | department | position | salary
-- --------------------------------------------------
-- 1  | Rohit | DEV        | NULL     | 60000   
--------------------------------------------------------
--------------------------------------------------------------------------------------
Use Case: Updating Records Based on Another Table
-- Suppose we have a table called Salary_Adjustments that contains salary adjustments for employees.
CREATE TABLE Salary_Adjustments (
    name VARCHAR(50),
    adjustment DECIMAL(5, 2) -- percentage adjustment
);
INSERT INTO Salary_Adjustments (name, adjustment)
VALUES 
('Rohit', 10.00), -- 10% raise
('Amit', -5.00);  -- 5% cut
-- Update Employee salaries based on Salary_Adjustments
UPDATE Employee e
JOIN Salary_Adjustments sa ON e.name = sa.name
SET e.salary = e.salary * (1 + sa.adjustment / 100);
-- Verify the update
SELECT * FROM Employee;
-- Output:
-- id | name  | department | position          | salary
-- --------------------------------------------------
-- 1  | Rohit | DEV        | NULL              | 66000   -- 10% raise
-- 2  | Sneha | DEV        | Senior Developer  | 75000   -- no change
-- 3  | Amit  | QA         | NULL              | 47880   -- 5% cut
--------------------------------------------------------
--------------------------------------------------------------------------------------
Interview Questions on UPDATE
❓ Question	💬 Answer
What does the UPDATE statement do?
	It modifies existing records in a table.

What happens if you don’t include WHERE?
	All rows will be updated.

Can you update multiple columns at once?	
Yes, separate them with commas.

 Can you use subqueries in UPDATE?	
Yes, to update data using values from another table.

 Can UPDATE be rolled back?	
Yes, if it’s inside a transaction and not committed.

How to increase salary by 10% for all employees?
	UPDATE Employee SET salary = salary * 1.10;

 How do you check how many rows were updated?
Most DBMS return a message like “3 rows affected.”

    What is the difference between SET and WHERE in UPDATE?
SET specifies new values; WHERE filters which rows to update.

Can you update a table based on another table’s data?
Yes, using JOIN or subqueries in the UPDATE statement.

 How can you update using another table’s data?	
UPDATE t1 SET col = (SELECT ...) FROM t2 WHERE condition;

Can we update primary key values?	
Yes, but not recommended — it may break foreign key relations.

What is difference between UPDATE and MERGE?	
UPDATE changes existing rows only; MERGE can insert or update based on matching conditions.

What are some common errors when using UPDATE?    
Common errors include missing WHERE clause, data type mismatches, and constraint violations.

What is a constraint violation during UPDATE?	
When you try to update data that breaks rules like PRIMARY KEY, UNIQUE, or FOREIGN KEY.

What is the difference between UPDATE and REPLACE?
REPLACE deletes existing rows with the same primary key before inserting new ones, while UPDATE modifies existing rows.

--ANY MORE INTERVIEW QUESTIONS SUGGESTIONS?
How do you handle NULL values in an UPDATE statement?
Use IS NULL or IS NOT NULL in the WHERE clause to filter rows with NULL values.

How do you update a record with the current date and time?
UPDATE table_name SET column_name = CURRENT_TIMESTAMP WHERE condition;

---------------------------------------------------------------------------------------

DELETE:
The DELETE statement is used to remove existing records from a table.
DELETE is used to remove records (rows) from a table.
👉 It does not delete the table structure — only the data inside it.

Syntax:
DELETE FROM table_name
WHERE condition;
⚠️ Important:
If you forget WHERE, it deletes all rows in the table!

Example 1 — Basic Delete single record
CREATE TABLE Employee (
    id INT,
    name VARCHAR(50),
    department VARCHAR(50),
    salary INT
);

INSERT INTO Employee (id, name, department, salary)
VALUES
(1, 'Rohit', 'QA', 60000),
(2, 'Sneha', 'Dev', 65000),
(3, 'Amit', 'Support', 45000);

-- Delete Amit's record
DELETE FROM Employee
WHERE name = 'Amit';
-- Verify the deletion
SELECT * FROM Employee;
-- Output:
-- id | name  | department | salary
-- --------------------------------------------------
-- 1  | Rohit | QA         | 60000
-- 2  | Sneha | Dev        | 65000
--------------------------------------------------------
Example 2 — Delete Multiple Records

-- Delete all employees in the Dev department
DELETE FROM Employee
WHERE department = 'Dev';

-- Verify the deletion
SELECT * FROM Employee;
-- Output:
-- id | name  | department | salary
-- --------------------------------------------------
-- 1  | Rohit | QA         | 60000
--------------------------------------------------------
Example 3 — Delete Without WHERE (Be Careful!)
-- Delete all records from the Employee table
DELETE FROM Employee;
-- Verify the deletion
SELECT * FROM Employee;
-- Output: (No rows returned)
--------------------------------------------------------
-- To revert back, let's re-insert the records
INSERT INTO Employee (id, name, department, salary)
VALUES
(1, 'Rohit', 'QA', 60000),
(2, 'Sneha', 'Dev', 65000),
(3, 'Amit', 'Support', 45000);
-- Verify the re-insertion
SELECT * FROM Employee;
-- Output:
-- id | name  | department | salary
-- --------------------------------------------------
-- 1  | Rohit | QA         | 60000
-- 2  | Sneha | Dev        | 65000
-- 3  | Amit  | Support    | 45000
--------------------------------------------------------
--------------------------------------------------------------------------------------
Use Case: Removing a Specific Record
-- Suppose Amit has left the company and we need to remove his record.
DELETE FROM Employee
WHERE name = 'Amit';
-- Verify the deletion
SELECT * FROM Employee;
-- Output:
-- id | name  | department | salary
-- --------------------------------------------------
-- 1  | Rohit | QA         | 60000
-- 2  | Sneha | Dev        | 65000
--------------------------------------------------------
--------------------------------------------------------------------------------------
Use Case: Bulk Deletion Based on Condition
-- The company decides to remove all employees in the Support department.
DELETE FROM Employee
WHERE department = 'Support';
-- Verify the deletion
SELECT * FROM Employee;
-- Output:
-- id | name  | department | salary
-- --------------------------------------------------
-- 1  | Rohit | QA         | 60000
-- 2  | Sneha | Dev        | 65000
--------------------------------------------------------
--------------------------------------------------------------------------------------
Use Case: Deleting Records Based on Salary
-- Remove all employees with a salary less than 50000
DELETE FROM Employee
WHERE salary < 50000;
-- Verify the deletion
SELECT * FROM Employee;
-- Output:
-- id | name  | department | salary
-- --------------------------------------------------
-- 1  | Rohit | QA         | 60000
-- 2  | Sneha | Dev        | 65000
--------------------------------------------------------
--------------------------------------------------------------------------------------
Use Case: Deleting All Records (Truncate Alternative)
-- Delete all records from the Employee table
DELETE FROM Employee;
-- Verify the deletion
SELECT * FROM Employee;
-- Output: (No rows returned)
--------------------------------------------------------
Example 5 — Delete Using a Join (Advanced)

Some databases (like MySQL) support deleting from one table using another:

DELETE E
FROM Employee E
JOIN Department D ON E.department = D.dept_name
WHERE D.dept_name = 'Dev';


✅ Deletes employees who belong to ‘Dev’ department.
-- Verify the deletion
SELECT * FROM Employee;
-- Output:
-- id | name  | department | salary

-- --------------------------------------------------
-- 1  | Rohit | QA         | 60000
--------------------------------------------------------
--------------------------------------------------------------------------------------

Interview Questions on DELETE
❓ Question	💬 Answe
What does the DELETE statement do?
    It removes existing records from a table.

What happens if you don’t include WHERE?
    All rows will be deleted.

Can you delete multiple records at once?
    Yes, using a condition that matches multiple rows.

Can DELETE be rolled back?
    Yes, if it’s inside a transaction and not committed

How do you delete all records from a table?
    You can use the DELETE statement without a WHERE clause, but it's safer to use TRUNCATE TABLE for performance reasons.

What is the difference between DELETE and TRUNCATE?
DELETE removes rows one at a time and can be rolled back; TRUNCATE removes all rows
immediately and cannot be rolled back.

Can you delete records based on another table’s data?
    Yes, using JOIN or subqueries in the DELETE statement.

What is the difference between DELETE and DROP?
	DELETE removes data, DROP removes the entire table structure.

7. Can you delete data using a subquery?

	Yes, using WHERE column IN (SELECT ...).

8. How do you delete duplicate rows?
	Use a subquery with ROW_NUMBER() or DISTINCT logic (depends on DBMS).
9. Can you use DELETE with JOIN?
	Yes, in MySQL and SQL Server using table aliases.
10. Can DELETE affect triggers?
	Yes — any ON DELETE trigger will execute automatically.

11. What are some common errors when using DELETE?
Common errors include missing WHERE clause, foreign key constraint violations, and attempting to delete from a non-existent table.


-----------------------------------------------------------------------------------------
⚙️ Example: DELETE vs TRUNCATE vs DROP
Command	  Deletes Data?	     Can Use WHERE?	 Resets Identity? 	Rollback Possible?  	Deletes Table?
DELETE	       ✅ Yes	       ✅ Yes	         ❌ No	               ✅ Yes	        ❌ No
TRUNCATE	 ✅ Yes (all rows)	❌ No	      ✅ Yes	                ❌ No	          ❌ No
DROP	  ✅ Yes (entire table)	❌ No	      ✅ Yes	                   ❌ No	            ✅ Yes


-----------------------------------------------------------------------------------------

Real-World Example (Asked in MNCs)

You need to delete all employees whose salary is below the company average salary.

Solution:

DELETE FROM Employee
WHERE salary < (SELECT AVG(salary) FROM Employee);

✅ Deletes only employees earning below the average salary.
-- Verify the deletion
SELECT * FROM Employee;
-- Output:
-- id | name  | department | salary
-- --------------------------------------------------
-- 1  | Rohit | QA         | 60000
--------------------------------------------------------
-----------------------------------------------------------------------------------------

ALTER:

1️⃣ What is ALTER TABLE?

ALTER TABLE is used to modify the structure of an existing table —
without deleting or recreating it.

You can use it to:
Add a column
Delete a column
Rename a column
Change a column’s data type
Rename the entire table


2️⃣ Syntax
ALTER TABLE table_name
ADD column_name datatype; -- To add a column

ALTER TABLE table_name
DROP COLUMN column_name; -- To delete a column

ALTER TABLE table_name
RENAME COLUMN old_name TO new_name; -- To rename a column

ALTER TABLE table_name
MODIFY COLUMN column_name new_datatype; -- To change a column’s data type

ALTER TABLE old_table_name
RENAME TO new_table_name; -- To rename the entire table


CREATE TABLE Employee (
    id INT,
    name VARCHAR(50),
    department VARCHAR(50),
    salary INT
);
and perform all ALTER TABLE operations one by one with their expected output (table structure) after each command.

Step 1: Add a New Column
Goal: Add a column for experience (in years).

ALTER TABLE Employee
ADD COLUMN experience INT;
-- Verify the new column
DESCRIBE Employee;
-- Output:
-- Field      | Type         | Null | Key | Default | Extra
-- --------------------------------------------------
-- id         | INT          | YES  |     | NULL    |
-- name       | VARCHAR(50)  | YES  |     | NULL    |
-- department | VARCHAR(50)  | YES  |     | NULL    |
-- salary     | INT          | YES  |     | NULL    |
-- experience | INT          | YES  |     | NULL    |
--------------------------------------------------------

Step 3️⃣: Insert Some Sample Data
INSERT INTO Employee (id, name, department, salary, experience)
VALUES
(1, 'Rohit', 'QA', 60000, 3),
(2, 'Sneha', 'Dev', 70000, 2),
(3, 'Amit', 'Support', 50000, 4);
-- Verify the insertion
SELECT * FROM Employee;
-- Output:
-- id | name  | department | salary | experience
-- --------------------------------------------------
-- 1  | Rohit | QA         | 60000  | 3 
-- 2  | Sneha | Dev        | 70000  | 2
-- 3  | Amit  | Support    | 50000  | 4
--------------------------------------------------------
Step 4️⃣: Rename a Column 
Goal: Rename 'experience' to 'years_of_experience'.
ALTER TABLE Employee
RENAME COLUMN experience TO years_of_experience;
-- Verify the column rename
DESCRIBE Employee;
-- Output:
-- Field               | Type         | Null | Key | Default | Extra
-- --------------------------------------------------
-- id                  | INT          | YES  |     | NULL    |
-- name                | VARCHAR(50)  | YES  |     | NULL    |
-- department          | VARCHAR(50)  | YES  |     | NULL    |  
-- salary              | INT          | YES  |     | NULL    |
-- years_of_experience | INT          | YES  |     | NULL    |
--------------------------------------------------------
Step 5️⃣: Change a Column’s Data Type
Goal: Change 'salary' from INT to DECIMAL(10, 2) to allow
-- cents.
ALTER TABLE Employee
MODIFY COLUMN salary DECIMAL(10, 2);
-- Verify the data type change
DESCRIBE Employee;
-- Output:
-- Field               | Type          | Null | Key | Default | Extra
-- --------------------------------------------------
-- id                  | INT           | YES  |     | NULL    |
-- name                | VARCHAR(50)   | YES  |     | NULL    |
-- department          | VARCHAR(50)   | YES  |     | NULL    |
-- salary              | DECIMAL(10,2) | YES  |     | NULL    |
-- years_of_experience | INT           | YES  |     | NULL    |

--------------------------------------------------------
Step 6️⃣: Delete a Column
Goal: Remove the 'department' column.
ALTER TABLE Employee
DROP COLUMN department;
-- Verify the column deletion
DESCRIBE Employee;
-- Output:
-- Field               | Type          | Null | Key | Default | Extra
-- --------------------------------------------------
-- id                  | INT           | YES  |     | NULL    |
-- name                | VARCHAR(50)   | YES  |     | NULL    |
-- salary              | DECIMAL(10,2) | YES  |     | NULL    |
-- years_of_experience | INT           | YES  |     | NULL    |
--------------------------------------------------------
Step 7️⃣: Rename the Entire Table
Goal: Change table name from 'Employee' to 'Staff'.
ALTER TABLE Employee
RENAME TO Staff;
-- Verify the table rename
SHOW TABLES;
-- Output:
-- Tables_in_your_database
-- --------------------------------------------------
-- Staff
--------------------------------------------------------
-- Verify the structure of the renamed table
DESCRIBE Staff;
-- Output:  
-- Field               | Type          | Null | Key | Default | Extra
-- --------------------------------------------------
-- id                  | INT           | YES  |     | NULL    |
-- name                | VARCHAR(50)   | YES  |     | NULL    |
-- salary              | DECIMAL(10,2) | YES  |     | NULL    |
-- years_of_experience | INT           | YES  |     | NULL    |
--------------------------------------------------------
--------------------------------------------------------------------------------------
Summary of Commands
Action	                      Command
Create table	          CREATE TABLE Employee (...);
Add column	              ALTER TABLE Employee ADD COLUMN experience INT;
Drop column          	  ALTER TABLE Employee DROP COLUMN experience;
Rename column	          ALTER TABLE Employee RENAME COLUMN name TO emp_name;
Modify datatype	           ALTER TABLE Employee MODIFY COLUMN salary DECIMAL(10,2);
Rename table	           ALTER TABLE Employee RENAME TO Employee_Master;

--------------------------------------------------------------------------------------

Interview Questions on ALTER TABLE

Bonus (Scenario-Based Question)

 You need to change the column name dept to department and change its datatype to VARCHAR(100).

Answer:

ALTER TABLE Employee
RENAME COLUMN dept TO department;

ALTER TABLE Employee
ALTER COLUMN department TYPE VARCHAR(100);

✅ Two ALTER commands used in sequence.
why?
Because renaming a column and changing its datatype are two distinct operations that require separate commands in SQL.
--------------------------------------------------------------------------------------  

Real-World Example (Asked in MNCs)

You need to add a new column status (default 'Active') to the Employee table and rename the table to Employee_Master.

Solution:

ALTER TABLE Employee
ADD COLUMN status VARCHAR(20) DEFAULT 'Active';

ALTER TABLE Employee
RENAME TO Employee_Master;

-- Verify the changes
DESCRIBE Employee_Master;

-- Output:
-- Field      | Type         | Null | Key | Default | Extra
-- --------------------------------------------------
-- id         | INT          | YES  |     | NULL    |
-- name       | VARCHAR(50)  | YES  |     | NULL    |
-- salary     | DECIMAL(10,2)| YES  |     | NULL    |
-- years_of_experience | INT          | YES  |     | NULL    |
-- status     | VARCHAR(20)  | YES  |     | Active  |
--------------------------------------------------------
Explanation:
First, we add the new column status with a default value of 'Active'.
Then, we rename the table from Employee to Employee_Master.

✅ Adds a new column and renames the table.

--------------------------------------------------------------------------------------

❓ Question	💬 Answer
What is the purpose of ALTER TABLE?
    It modifies the structure of an existing table.

Can you add multiple columns in one ALTER statement?
    No, you need separate ALTER statements for each column addition.

How do you rename a column?
    Use ALTER TABLE table_name RENAME COLUMN old_name TO new_name;


How do you change a column’s data type?
    Use ALTER TABLE table_name MODIFY COLUMN column_name new_datatype; (syntax may vary by DBMS)

Can you drop multiple columns at once?
    No, you need separate ALTER statements for each column drop.

What happens to existing data when you change a column’s data type?
    It may be converted or truncated based on the new type; errors can occur if incompatible.

Is it possible to rename a table?
    Yes, using ALTER TABLE old_name RENAME TO new_name;

What is the difference between ALTER and UPDATE?
ALTER changes table structure; UPDATE modifies data within the table.

Can ALTER be rolled back?
    No, structural changes are usually immediate and cannot be rolled back. 

What are some common errors when using ALTER TABLE?
Common errors include syntax mistakes, trying to drop non-existent columns, and data type conversion issues.

What is the difference between ALTER and MODIFY?    
ALTER changes table structure; MODIFY changes column attributes like datatype or size.

What is the difference between ALTER and DROP?
ALTER modifies an existing table; DROP removes a table entirely.

What is the difference between ALTER and TRUNCATE?
ALTER changes table structure; TRUNCATE removes all rows from a table but keeps the structure.


What precautions should you take before using ALTER TABLE?
Always back up your data and ensure no active transactions are running on the table.
------------------------------------------------------------------------------------------

--ANY MORE INTERVIEW QUESTIONS SUGGESTIONS?


Can you add constraints using ALTER TABLE?
Yes, using ALTER TABLE table_name ADD CONSTRAINT ...

How do you add a primary key to an existing table?
Use ALTER TABLE table_name ADD PRIMARY KEY (column_name);

How do you remove a primary key from a table?
Use ALTER TABLE table_name DROP PRIMARY KEY;

How do you add a foreign key constraint?
Use ALTER TABLE table_name ADD CONSTRAINT fk_name FOREIGN KEY (column_name) REFERENCES other_table
(column_name);

How do you drop a foreign key constraint?
Use ALTER TABLE table_name DROP FOREIGN KEY fk_name;

Can you change a column to NOT NULL using ALTER TABLE?
Yes, using ALTER TABLE table_name MODIFY COLUMN column_name datatype NOT NULL;

Can you change a column to allow NULLs?
Yes, using ALTER TABLE table_name MODIFY COLUMN column_name datatype NULL;

What is the difference between ALTER TABLE and CREATE TABLE?
CREATE TABLE creates a new table; ALTER TABLE modifies an existing one.

What is the difference between ALTER TABLE and RENAME?
ALTER TABLE changes table structure; RENAME changes the table name.

What is the difference between ALTER TABLE and ADD COLUMN?
ALTER TABLE modifies table structure; ADD COLUMN is a specific operation within ALTER TABLE to add a new column.

What is the difference between ALTER TABLE and DROP COLUMN?
ALTER TABLE modifies table structure; DROP COLUMN is a specific operation within ALTER TABLE to remove a column.

What is the difference between ALTER TABLE and MODIFY COLUMN?
ALTER TABLE modifies table structure; MODIFY COLUMN is a specific operation within ALTER TABLE to change a column
attributes like datatype or size.

What is the difference between ALTER TABLE and CHANGE COLUMN?
ALTER TABLE modifies table structure; CHANGE COLUMN is a specific operation within ALTER TABLE to rename a column   
and change its datatype (syntax may vary by DBMS).


--------------------------------------------------------------------------------------------
