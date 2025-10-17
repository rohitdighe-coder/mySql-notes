/*********************************************************************************************
🧮 DAY 5 — CONSTRAINTS & KEYS

🎯 Goal:
Learn about data integrity and how constraints ensure valid and consistent data.

📘 Topics Covered:
1. PRIMARY KEY
2. FOREIGN KEY
3. UNIQUE
4. NOT NULL
5. DEFAULT

💡 Importance in Testing:
Used to prevent invalid or duplicate test data during database validation.

*********************************************************************************************/
Datatypes in SQL

Datatypes define the type of data that can be stored in a column of a database table. Different DBMSs may have slightly different datatypes, but here are some common ones:

1) numeric types
   - INT (A whole number) (3,4,5,6,7,8,9)
   - FLOAT (A floating-point number) (3.14, 2.71)
   - DECIMAL (A fixed-point number) (10.00, 100.50)
   - NUMERIC (Similar to DECIMAL) (10.00, 100.50)
   - BIGINT (A large whole number) (10000000000)
   - SMALLINT (A small whole number) (1, 2, 3)
   - TINYINT (An very small whole number) (0, 1)
   - MEDIUMINT (A medium whole number) (100000)
   - DOUBLE (A double-precision floating-point number) (3.14, 2.71)
   - BIT (A bit value) (0, 1)


2) string types
   - CHAR (A fixed-length string) ('A', 'B', 'C')
   - VARCHAR (A variable-length string) ('Hello', 'World')
   - TEXT (A large text string) ('Lorem ipsum dolor sit amet')
    - BLOB (A binary large object) (Binary data)
    - ENUM (A string object with a predefined set of values) ('Small', 'Medium', 'Large')
    -Binary (A binary string) (Binary data)
    -longtext (A very large text string) ('Lorem ipsum dolor sit amet, consectetur adipiscing elit...')
    -mediumtext (A medium-sized text string) ('Lorem ipsum dolor sit amet, consectetur


3) date and time types
   - DATE (A date value) ('2023-01-01')
   - TIME (A time value) ('12:00:00')
   - DATETIME (A date and time value) ('2023-01-01 12:00:00')
    - TIMESTAMP (A timestamp value) ('2023-01-01 12:00:00')
    - YEAR (A year value) ('2023')

4) boolean type
   - BOOLEAN (A boolean value) (TRUE, FALSE)
   - BIT (A bit value) (0, 1)

5) spatial types (used for geographic data)
   - POINT (A point in 2D space) (POINT(1, 1))
   - LINESTRING (A line in 2D space) (LINESTRING(0 0, 1 1, 2 2))
    - POLYGON (A polygon in 2D space) (POLYGON((0 0, 1 1, 1 0, 0 0)))
    - GEOMETRY (A geometric object) (GEOMETRYCOLLECTION(POINT(1 1), LINESTRING(0 0, 1 1)))
    - MULTIPOINT (A collection of points) (MULTIPOINT(1 1, 2 2, 3 3))
    - MULTILINESTRING (A collection of lines) (MULTILINESTRING((0 0, 1 1), (2 2, 3 3)))
    - MULTIPOLYGON (A collection of polygons) (MULTIPOLYGON(((0
    0, 1 1, 1 0, 0 0)), ((2 2, 3 3, 3 2, 2 2))))
----------------------------------------------------------------------------------------------------------------------


----------------------------------------------------------------------------------------------------------------------
Sql Constraints
Constraints are used to limit the type of data that can be stored in a table. This ensures the accuracy and reliability of the data in the database.
--Constraints can be applied to a single column or to an entire table.
--Contraints can be added when the table is created or after the table is created using the ALTER TABLE statement.

 Here are some common SQL constraints:
1) Primary key
2) not null
3) check
4) default
5) unique
6) foreign key
7) identity
8) auto_increment
9) composite key
----------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------

--- PRIMARY KEY --- ( unique and not null - uniquely identifies each record in a table)
-A primary key is unique values.
-each table can have only one primary key.
-A primary key column cannot have null values.
-each table should have a primary key.

Why is it important?

Enforces data integrity (no duplicate records).
Helps testers ensure test-data uniqueness (avoid duplicated test entries).
Used by DB engine for indexing (faster queries on PK).
------------------------------------------------------------------------------------------------------------------

two ways to create a primary key:
1) when creating a table - inline Primary Key Declaration
CREATE TABLE table_name (
    column1 datatype PRIMARY KEY,
    column2 datatype,
    column3 datatype,
   ....
);


example:
CREATE TABLE employees (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100)
);

Here, PRIMARY KEY is declared inline (right after the column name).
It means the column id itself is automatically set as a primary key.
You can use this only when there’s one column as a primary key.

✅ Result:

id becomes the unique identifier.
It cant have duplicate or NULL values.
you cant define multiple inline PKs in one table.

2) after creating a table -table-level Primary Key Declaration
syntax:
CREATE TABLE table_name (
    column1 datatype,
    column2 datatype,
    column3 datatype,
   ....
   PRIMARY KEY (column_name)
);

example:
CREATE TABLE unique_cat2 (
  cat_id INT,
  name VARCHAR(100) NOT NULL,
  age INT NOT NULL,
  PRIMARY KEY (cat_id)
);
Here, PRIMARY KEY is declared at the table level (after all columns are defined).
It means the column cat_id is set as a primary key
-------------------------------------------------------------------------------

Example 3 — Composite Key (Only Possible in 2nd Style)
composite key is a primary key made up of multiple columns.
syntax:
PRIMARY KEY (column1, column2, ...)
example:

CREATE TABLE cat_adoption (
  cat_id INT,
  adoption_date DATE,
  adopter_name VARCHAR(50),
  PRIMARY KEY (cat_id, adoption_date)
);


✅ Here, both columns together form a composite primary key.
This is only possible with the table-level syntax.
----------------------------------------------------------------------------------------------------------------------
Common mistakes & how to avoid them-
Forgetting NOT NULL: Primary key is NOT NULL by definition — do not try to insert NULL.
Inserting duplicates: Check for existing PK values before inserts (or use INSERT ... WHERE NOT EXISTS pattern).
Relying on implicit order: Don’t rely on row order — use PK to identify rows.
Altering PK without checking FKs: If other tables reference this PK, you must handle or drop foreign keys first.

----------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------
Quick interview questions on PRIMARY KEY (with short answers)

Q: What is a primary key?
A: A column (or set of columns) that uniquely identifies each row; unique + not null.

Q: Can a table have more than one primary key?
A: No — only one primary key constraint per table, but it can be composite.

Q: Difference between PRIMARY KEY and UNIQUE?
A: Both enforce uniqueness, but PRIMARY KEY implies NOT NULL and there can be only one PK; UNIQUE allows NULL (depending on DB) and you can have multiple UNIQUE constraints.

Q: Can primary keys be changed?
A: Yes, via ALTER TABLE, but you must ensure no FK dependencies and no duplicates.

Q: Why use composite primary key?
A: When a single column can't uniquely identify a row; combination of columns does.

----------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------

--- FOREIGN KEY --- (ensures referential integrity between tables)
-A foreign key is a column (or set of columns) in one table that refers to the primary key in another table.
-It establishes a link between the data in two tables.
-A foreign key can have duplicate values.
-A foreign key column can have null values (unless specified otherwise).
-It helps maintain data integrity by ensuring that the value in the foreign key column matches a value in the referenced primary key column.
-It prevents actions that would destroy links between tables (like deleting a record that is referenced by a foreign key in another table).
-It can also be used to enforce cascading actions (like deleting or updating related records automatically).

Why is it important?
Maintains referential integrity (no orphaned records).
Helps testers ensure valid relationships (avoid invalid references).
Used by DB engine for joins (optimize queries involving related tables).
 
 Q- which table has the foreign key?
A- the table that contains the foreign key is called the child table (or referencing table), and the table that contains the primary key is called the parent table (or referenced table).

Q- which keys used to maintain the refrential integrity?
A- foreign keys are used to maintain referential integrity between tables.


2️⃣ Real-Life Example

Think of:
A Departments table (each department has a unique ID)
An Employees table (each employee belongs to one department)

So:
Department → Parent
Employee → Child
------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------
Step-by-step SQL Example:
Step 1️⃣: Create parent table — departments
CREATE TABLE departments (
  dept_id INT PRIMARY KEY,
  dept_name VARCHAR(50) NOT NULL
);

Step 2️⃣: Create child table — employees
CREATE TABLE employees (
  emp_id INT PRIMARY KEY,
  emp_name VARCHAR(50) NOT NULL,
  dept_id INT,
  FOREIGN KEY (dept_id) REFERENCES departments(dept_id)
);


✅ Explanation:

departments.dept_id is the Primary Key
employees.dept_id is the Foreign Key
You can insert employees only if their department exists in departments


--------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------

Step 3️⃣: Insert Valid Data
-- Insert into parent first
INSERT INTO departments VALUES (101, 'QA'), (102, 'Development');

-- Now insert employees linked to existing departments
INSERT INTO employees VALUES
(1, 'Rohit', 101),
(2, 'Sneha', 102);


✅ Works fine because department IDs exist in the parent table.
--------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------
⚠️ Step 4️⃣: Try to Insert Invalid Data (Will Fail)
INSERT INTO employees VALUES (3, 'Amit', 999);


❌ Error:
FOREIGN KEY constraint failed
Because there is no department with dept_id = 999.
-------------------------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------------------
🧠 3️⃣ Why is FOREIGN KEY Important?

Ensures data integrity across related tables.
Prevents invalid or orphan records.
Keeps referential data clean (Employee must always belong to a valid Department).
-------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------
🧩 4️⃣ Two Ways to Define a Foreign Key
✅ Way 1: Inline (within column definition)
CREATE TABLE employees_inline (
  emp_id INT PRIMARY KEY,
  emp_name VARCHAR(50),
  dept_id INT REFERENCES departments(dept_id)
);

✅ Way 2: Table-Level (more readable & flexible)
CREATE TABLE employees_table_level (
  emp_id INT PRIMARY KEY,
  emp_name VARCHAR(50),
  dept_id INT,
  CONSTRAINT fk_dept FOREIGN KEY (dept_id) REFERENCES departments(dept_id)
);
💡 Preferred in industry because you can name the constraint (like fk_dept)
-------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------
🧠 5️⃣ Deleting & Updating Related Records (Cascading)

Sometimes we want automatic changes in the child table when parent changes.

Example:
CREATE TABLE employees_cascade (
  emp_id INT PRIMARY KEY,
  emp_name VARCHAR(50),
  dept_id INT,
  FOREIGN KEY (dept_id)
  REFERENCES departments(dept_id)
  ON DELETE CASCADE
  ON UPDATE CASCADE
);


✅ Meaning:

ON DELETE CASCADE → if a department is deleted, its employees are also deleted.
ON UPDATE CASCADE → if dept_id in parent changes, it updates automatically in child.

⚙️ Example of Cascade
-- Delete department 101
DELETE FROM departments WHERE dept_id = 101;

✅ Automatically removes all employees belonging to dept 101.
----------------------------------------------------------------------------------------------------------------------
🧩 6️⃣ Adding Foreign Key Later Using ALTER TABLE
ALTER TABLE employees
ADD CONSTRAINT fk_deptid
FOREIGN KEY (dept_id) REFERENCES departments(dept_id);


⚠️ Note: You can only add FK if existing values in the child column already exist in the parent table.
----------------------------------------------------------------------------------------------------------------
💡 7️⃣ Test Use Case
Scenario                            	Query	                                                  Purpose
Ensure referential integrity	   SELECT * FROM employees WHERE dept_id
                                 NOT IN (SELECT dept_id FROM departments);	          Detect invalid department links

Clean-up test data safely	    DELETE FROM departments WHERE dept_id=101;
                           (will delete related employees if ON DELETE CASCADE)   	 Avoid orphan test data
                           
Validate data migration  	Verify that all child rows have valid parent references	 Prevent test failures due to 
                                                                                     missing parent data
-----------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------- 
🧠 8️⃣ Interview Questions on FOREIGN KEY
❓ Question	💬 Answer
What is a Foreign Key?
	A column in one table that refers to the Primary Key in another table.

Can a table have multiple foreign keys?	
Yes, if it references multiple parent tables.

Difference between Primary Key and Foreign Key?	
PK uniquely identifies a record in its own table; FK enforces link between two tables.

What happens if you delete a parent row?
	If cascade is defined, related child rows are deleted; otherwise, it gives an error.

Can a Foreign Key be NULL?
	Yes, if not defined as NOT NULL — means “no relationship.”

Can Foreign Key reference a Unique key instead of Primary?	
Yes, as long as the referenced column has a UNIQUE constraint.
-----------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------

🧮 9️⃣ Real-World Example (For Testing)
-- Parent table: TestSuite
CREATE TABLE TestSuite (
  suite_id INT PRIMARY KEY,
  suite_name VARCHAR(50)
);

-- Child table: TestCases
CREATE TABLE TestCases (
  case_id INT PRIMARY KEY,
  case_name VARCHAR(50),
  suite_id INT,
  FOREIGN KEY (suite_id) REFERENCES TestSuite(suite_id)
);


💡 Use case:

Each test case must belong to a valid test suite.
You cannot insert a test case with a non-existent suite_id.
Testers validate the relationship before execution.
----------------------------------------------------------------------------------------------------------------------


-------------------------------------------------------------------------------------------------------------------------------------------------------

3) UNIQUE Constraint --- (ensures all values in a column are different)

Ensures data integrity across related tables.
The unique constraint uniquely identifies each record in a  database table.
--The unique constraint enforces the uniqueness of the values in a set of columns.
The unique  and primary KEY Constraints BOTH 
enforce uniqueness of the values in a set of columns.
--However, there are some differences between the two:
- A table can have only one primary key, but it can have multiple unique constraints.
- A primary key column cannot have null values, but a unique column can have null values (depending on the DBMS).
--

--UNIQUE CONSTRAINT ----
A UNIQUE constraint ensures that all values in a column (or combination of columns) are different — no duplicates allowed.

✅ You can have multiple UNIQUE constraints in one table.
✅ Unlike PRIMARY KEY, a UNIQUE column can accept NULL (but only one NULL, depending on DBMS).

Main Difference vs Primary Key
Feature	                               PRIMARY KEY	         UNIQUE
Ensures uniqueness                      	✅ Yes	             ✅ Yes
Allows NULL values	                     ❌ No	             ✅ Yes (one or more
                                                               depending on DBMS)
Number per table	                         1	                  Multiple
Automatically NOT NULL	                  Yes	                 No
Index created	                      Clustered (by default)   	Non-clustered

-----------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------

2️⃣ Example 1 — Single Column UNIQUE

CREATE TABLE users (
  user_id INT PRIMARY KEY,
  email VARCHAR(100) UNIQUE,
  username VARCHAR(50)
);


✅ Explanation:
user_id → uniquely identifies each user
email → must be unique (no two users can have the same email)

-------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------
Insert Data
INSERT INTO users VALUES (1, 'rohit@gmail.com', 'rohit_d');
INSERT INTO users VALUES (2, 'sneha@gmail.com', 'sneha_21');


✅ Works fine.

Now, try to insert a duplicate email 👇
INSERT INTO users VALUES (3, 'rohit@gmail.com', 'amit_45');


❌ Error:
UNIQUE constraint failed: users.email

- This error occurs because the email 'rohit@gmail.com' is already in use by another user.
- UNIQUE constraints are checked before any insert or update operation.
------------------------------------------------------------------------------------------


🧱 3️⃣ Example 2 — Table-Level UNIQUE Constraint

You can define UNIQUE at the table level (after columns).

CREATE TABLE employees (
  emp_id INT PRIMARY KEY,
  emp_name VARCHAR(50),
  phone_number VARCHAR(15),
  CONSTRAINT uq_phone UNIQUE (phone_number)
);


✅ Effect:
No two employees can have the same phone number.

------------------------------------------------------------------------------------------------

🧱 4️⃣ Example 3 — Composite UNIQUE Constraint

Sometimes you want a combination of two columns to be unique.

CREATE TABLE attendance (
  emp_id INT,
  date DATE,
  status VARCHAR(10),
  UNIQUE (emp_id, date)
);


✅ This means:

A single employee (emp_id) cannot have two records for the same date.

But two different employees can have the same date (which is fine).

-----------------------------------------------------------------------------------------------

🧱 5️⃣ Example 4 — Add UNIQUE to Existing Table
ALTER TABLE users
ADD CONSTRAINT uq_username UNIQUE (username);


✅ Adds a new uniqueness rule on the username column.


--------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------

🧱 6️⃣ Example 5 — Drop UNIQUE Constraint

If you want to remove it later:

ALTER TABLE users
DROP CONSTRAINT uq_username;  -- SQL Server / PostgreSQL
-- or
ALTER TABLE users DROP INDEX uq_username; -- MySQL

---------------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------------

⚙️ 7️⃣ How UNIQUE Works Internally

When you add a UNIQUE constraint, the database creates an index on that column automatically.
This index ensures that no two rows can have the same value.
When you try to insert a duplicate value, SQL immediately throws an error.

---------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------

💡 8️⃣ Tester Use Cases
Use Case	                                       Example Query	                                        Purpose
Validate no duplicate test data	   SELECT email, COUNT(*) FROM users GROUP 
                                    BY email HAVING COUNT(*) > 1; 	                                  Detect duplicate entries
                                                                                                             

Check uniqueness before insert	  SELECT * FROM users WHERE email='rohit@gmail.com';	                Prevent duplicate automation test data

Add constraint after production 
deployment                       	ALTER TABLE users ADD CONSTRAINT uq_email UNIQUE (email);	       Enforce unique rule post go-live
---------------------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------
🧠 9️⃣ Common Interview Questions on UNIQUE
❓ Question	 💬 Answer
What is the UNIQUE constraint used for?
	To ensure all values in a column or set of columns are unique.

Can a table have multiple UNIQUE constraints?
	Yes.

Can a column with UNIQUE constraint have NULL values?
	Yes (depends on DBMS, usually one NULL).

What is the difference between UNIQUE and PRIMARY KEY?	
Both ensure uniqueness; PK also enforces NOT NULL and is only one per table.

Can UNIQUE be applied to multiple columns together?	
Yes — using a composite UNIQUE constraint.

How to add UNIQUE to an existing column?	
ALTER TABLE table_name ADD CONSTRAINT constraint_name UNIQUE (column);

Can you drop a UNIQUE constraint?
	Yes, using ALTER TABLE DROP CONSTRAINT or DROP INDEX.

-----------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------

🧮 10️⃣ Real-World Example for Testing
Table: test_users
CREATE TABLE test_users (
  user_id INT PRIMARY KEY,
  email VARCHAR(100) UNIQUE,
  phone_number VARCHAR(15) UNIQUE,
  created_at DATE DEFAULT CURRENT_DATE
);

Insert Valid Data
INSERT INTO test_users (user_id, email, phone_number)
VALUES (1, 'rohit@test.com', '9876543210');

Insert Duplicate Email — ❌ Error

INSERT INTO test_users (user_id, email, phone_number)
VALUES (2, 'rohit@test.com', '9123456789');


Error: UNIQUE constraint failed: test_users.email
✅ Tester use: Helps ensure every test-user record has a unique identifier (email/phone) — no duplicate accounts.

-----------------------------------------------------------------------------------------------------------------------------

1️⃣ What is NOT NULL?

A NOT NULL constraint ensures that a column must always have a value —
it cannot contain NULL (missing or empty) values.

- This is important for fields that require mandatory information, such as user IDs or email addresses.
- NOT NULL constraints help maintain data integrity by ensuring essential data is always present.
- They prevent accidental data loss or corruption.
-

💡 NULL ≠ 0
💡 NULL ≠ empty string ('')
💡 NULL = “no value stored”
--------------------------------------------------------------------------------------------------------

2️⃣ Why Use NOT NULL?

Because you don’t want incomplete or missing data in critical columns.

Example:
Every employee must have a name
Every user must have an email
Every order must have a date
If those fields were NULL, data would be incomplete or invalid.


------------------------------------------------------------------------------------------------------------


3️⃣ Example — Create Table with NOT NULL
CREATE TABLE employees (
  emp_id INT PRIMARY KEY,
  emp_name VARCHAR(50) NOT NULL,
  department VARCHAR(50) NOT NULL,
  salary INT
);


✅ Explanation:

emp_id — Primary Key (automatically NOT NULL)
emp_name and department — must always have values
salary — can be NULL (optional)

🧩 Insert Valid Data
INSERT INTO employees VALUES (1, 'Rohit', 'QA', 60000);


✅ Works fine
⚠️ Insert Invalid Data (NULL in NOT NULL Column)
INSERT INTO employees VALUES (2, NULL, 'Dev', 70000);

❌ Error:
NOT NULL constraint failed: employees.emp_name
✅ This ensures data completeness.


------------------------------------------------------------------------------

4️⃣ Example — Add NOT NULL Later

You can add a NOT NULL constraint after creating the table.

ALTER TABLE employees
ALTER COLUMN salary SET NOT NULL;   -- PostgreSQL / SQL Server

-- MySQL syntax:
ALTER TABLE employees
MODIFY COLUMN salary INT NOT NULL;


⚠️ Important:
If the column already has NULL values, SQL will throw an error.
You must update those values first.

✅ Example:
UPDATE employees SET salary = 0 WHERE salary IS NULL;
ALTER TABLE employees MODIFY COLUMN salary INT NOT NULL;


-------------------------------------------------------------------------------------

5️⃣ Drop NOT NULL Constraint
ALTER TABLE employees
ALTER COLUMN salary DROP NOT NULL;   -- PostgreSQL / SQL Server

-- MySQL
ALTER TABLE employees
MODIFY COLUMN salary INT NULL;


✅ Now, the salary column can accept NULL values again.

---------------------------------------------------------------------------------


6️⃣ Tester Use Cases
Scenario                	Query	                                 Purpose
Data validation    	SELECT * FROM 
                   WHERE emp_name IS NULL;	        Check if critical fields
                                                             are missing
Schema validation 	SHOW CREATE TABLE
                        employees;	                   Verify NOT NULL constraints
                                                             exist

Prevent missing     Define NOT NULL on key            Avoid automation errors
 test data                columns                        due to NULL data
              
                       	
Data cleanup	     UPDATE employees
                 SET department='Unknown' WHERE      	Fill missing values before 
                  department IS NULL;                   applying constraint

-------------------------------------------------------------------------------------------

7️⃣ Example — Default + NOT NULL Together

Very common in real databases 👇

CREATE TABLE orders (
  order_id INT PRIMARY KEY,
  order_date DATE NOT NULL DEFAULT CURRENT_DATE,
  customer_name VARCHAR(50) NOT NULL,
  total_amount DECIMAL(10,2) DEFAULT 0.00
);


✅ Meaning:

order_date — must have a value, if not given → takes today’s date.
customer_name — must be provided manually.
total_amount — optional, defaults to 0.

------------------------------------------------------------------------------------------

9️⃣ Real-World Example (Testing Scenario)
Example: Tester validating data integrity for user_accounts
CREATE TABLE user_accounts (
  user_id INT PRIMARY KEY,
  username VARCHAR(50) NOT NULL,
  email VARCHAR(100) UNIQUE NOT NULL,
  password VARCHAR(100) NOT NULL
);


✅ Ensures:

No blank username, email, or password
No duplicate emails

Test data always consistent for automation
If a tester inserts incomplete data like:

INSERT INTO user_accounts (user_id, username, email, password)
VALUES (1, NULL, 'rohit@test.com', 'pass123');


❌ Error: NOT NULL constraint failed: user_accounts.username
💡 Prevents invalid data before test execution.

----------------------------------------------------------------------------

Common Interview Questions on NOT NULL
❓ Question	💬 Answer

What is the use of NOT NULL?	
To ensure a column always contains a value.

Can a column have both NOT NULL and UNIQUE?	
Yes, often used together for important columns (like email).

Is a Primary Key automatically NOT NULL?
	Yes.

Difference between NULL and empty string (‘’)?
	NULL = no value; empty string = value of length 0.

How do you check which columns are NOT NULL in a table?	
By viewing table schema: DESCRIBE table_name; or SHOW CREATE TABLE table_name;

Can we add NOT NULL to an existing column?	
Yes, but only if no NULL values exist in it.

What happens if you insert NULL into NOT NULL column?
The insert/update fails with constraint error.

------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------

DEFAULT CONSTRAINTS 

1️⃣ What is DEFAULT Constraint?

The DEFAULT constraint provides a predefined value for 
a column when no value is specified during an INSERT.

💡In short:
If you don’t insert any value, SQL automatically inserts the default one.
---------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------

🧩 2️⃣ Why Use DEFAULT?

To prevent NULL values without forcing the user to enter data.
To make data consistent even when input is missing.
Very useful in test data setup — when testers want dummy data to auto-fill.

--------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------



🧱 3️⃣ Basic Example
CREATE TABLE employees (
  emp_id INT PRIMARY KEY,
  emp_name VARCHAR(50) NOT NULL,
  department VARCHAR(50) DEFAULT 'General',
  salary INT DEFAULT 30000
);


✅ Explanation:

department defaults to 'General' if not provided.
salary defaults to 30000.

🧩 Insert with Default Values
INSERT INTO employees (emp_id, emp_name) VALUES (1, 'Rohit');


✅ Resulting Row:
emp_id	            emp_name	          department    	salary
1	                   Rohit            	General      	30000


🧩 Insert with All Values
INSERT INTO employees (emp_id, emp_name, department, salary)
VALUES (2, 'Sneha', 'QA', 50000);


✅ Resulting Table:

emp_id	        emp_name	     department    	salary
1	                Rohit       	General	      30000
2	                Sneha      	QA          	50000

---------------------------------------------------------------------------------------


4️⃣ DEFAULT with Date/Time Columns
CREATE TABLE orders (
  order_id INT PRIMARY KEY,
  order_date DATE DEFAULT CURRENT_DATE,
  status VARCHAR(20) DEFAULT 'Pending'
);


✅ Example:

INSERT INTO orders (order_id) VALUES (101);


Output:

order_id                 	order_date	         status
101	                     2025-10-17	         Pending

💡 CURRENT_DATE automatically inserts today’s date.

-----------------------------------------------------------------------------------------


5️⃣ Adding DEFAULT Later

If you already have a table, you can still add a default value using ALTER TABLE.

ALTER TABLE employees
ALTER COLUMN department SET DEFAULT 'Unassigned';  -- PostgreSQL / SQL Server

-- MySQL syntax:
ALTER TABLE employees
ALTER department SET DEFAULT 'Unassigned';

-----------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------

🧱 6️⃣ Dropping a DEFAULT Constraint
ALTER TABLE employees
ALTER COLUMN department DROP DEFAULT;  -- PostgreSQL / SQL Server

-- MySQL syntax:
ALTER TABLE employees ALTER department DROP DEFAULT;
✅ Now, if you skip a value for department, it will become NULL (if NULL allowed).


---------------------------------------------------------------------------------------

7️⃣ How DEFAULT Helps Testers
Scenario                            	Example        	          Purpose
Pre-fill test data            	DEFAULT 'Pending' on      Automatically sets initial state 
                                     status column          for automation
                                 	
Prevent null entries	            DEFAULT 0 for numeric     Avoids NULL errors during test
                                     fields                    runs
                                     	
Timestamping test records     DEFAULT CURRENT_TIMESTAMP   	Auto-logs insert time

Simplify insert scripts	      Skip columns with defaults	   Save time during data setup
----------------------------------------------------------------------------------------------

8️⃣ Example — DEFAULT + NOT NULL Together


CREATE TABLE students (
  id INT PRIMARY KEY,
  name VARCHAR(50) NOT NULL,
  grade CHAR(1) NOT NULL DEFAULT 'A'
);


✅ Meaning:

grade cannot be NULL
If not provided, default value 'A' is inserted automatically

🧩 Insert Example
INSERT INTO students (id, name) VALUES (1, 'Amit');


✅ Result:

id	name	grade
1	Amit	A
--------------------------------------------------------------------------------------

9️⃣ Interview Questions on DEFAULT
❓ Question	💬 Answer
What is a DEFAULT constraint?	
It assigns a default value to a column when no value is provided.

Can a table have multiple default constraints?
	Yes, one per column.

Can you combine DEFAULT with NOT NULL?	
Yes, very common.

Can DEFAULT insert dynamic values?	
Yes, like CURRENT_DATE or CURRENT_TIMESTAMP.

Can you change a default value later?
	Yes, using ALTER TABLE ALTER COLUMN SET DEFAULT.

What happens if you provide a value manually?
	The provided value overrides the default.

Can a DEFAULT column still accept NULL?
	Yes, unless defined as NOT NULL.
-------------------------------------------------------------------------------------------



🧩 10️⃣ Real-World Example (Testing Scenario)

Example: Test Order Tracking System
CREATE TABLE test_orders (
  order_id INT PRIMARY KEY,
  product_name VARCHAR(50) NOT NULL,
  quantity INT DEFAULT 1,
  status VARCHAR(20) DEFAULT 'Pending',
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

Insert Test Data
INSERT INTO test_orders (order_id, product_name)
VALUES (101, 'Laptop');


✅ Output:

order_id 	product_name	quantity  	status	    created_at
101	      Laptop	      1	          Pending	   2025-10-17 10:25:00

💡 Perfect for testers — quick dummy record with minimum typing.

-------------------------------------------------------------------------------------------


What is CHECK?

The CHECK constraint is used to limit the values that can be inserted into a column.

💡 In short:

It checks a condition every time you INSERT or UPDATE data.
If the condition is false, SQL rejects the operation.

🧠 Why Use CHECK?

To validate input data automatically.
To ensure data follows business rules.
Helps testers validate that invalid data cannot be inserted.
----------------------------------------------------------------------------------------
🧱 Example 1 — Basic CHECK
CREATE TABLE employees (
  emp_id INT PRIMARY KEY,
  emp_name VARCHAR(50),
  salary INT CHECK (salary > 0)
);


✅ Meaning:

Every employee must have a salary greater than 0.

🧩 Insert Valid Data
INSERT INTO employees VALUES (1, 'Rohit', 50000);


✅ Works fine.

⚠️ Insert Invalid Data
INSERT INTO employees VALUES (2, 'Sneha', -10000);


❌ Error: CHECK constraint failed: salary > 0
💡 Database won’t allow invalid or negative salary — ensures data integrity.

---------------------------------------------------------------------------------------

🧱 Example 2 — Multiple CHECK Constraints
CREATE TABLE students (
  student_id INT PRIMARY KEY,
  name VARCHAR(50),
  age INT CHECK (age BETWEEN 5 AND 18),
  marks INT CHECK (marks >= 0 AND marks <= 100)
);


✅ Meaning:

Age must be between 5 and 18.
Marks must be between 0 and 100.

🧩 Insert Example
INSERT INTO students VALUES (1, 'Amit', 15, 92);   -- ✅ OK
INSERT INTO students VALUES (2, 'Riya', 22, 80);   -- ❌ Fails (age out of range)
------------------------------------------------------------------------------------------
🧱 Example 3 — Table-Level CHECK
CREATE TABLE products (
  product_id INT PRIMARY KEY,
  product_name VARCHAR(50),
  price DECIMAL(10,2),
  discount DECIMAL(5,2),
  CHECK (discount <= price * 0.5)
);


✅ Ensures discount never exceeds 50% of price.
--------------------------------------------------------------------------------------------
🧱 Example 4 — Add CHECK Later
ALTER TABLE employees
ADD CONSTRAINT chk_salary CHECK (salary > 0);

---------------------------------------------------------------------------------------------------

🧱 Example 5 — Drop CHECK
ALTER TABLE employees
DROP CONSTRAINT chk_salary;

-------------------------------------------------------------------------------------------
💡 Tester Use Case
Scenario                   	Query                     	         Purpose
Validate data ranges	      CHECK (marks <= 100)             	Prevent invalid test input
Enforce business rules	   CHECK (discount <= price*0.5)	      Protect from faulty test data
Automation data validatio 	Check constraint errors	            Identify invalid dataset 
                                                                before tests

-------------------------------------------------------------------------------------------
🧠 Interview Questions on CHECK
❓ Question	💬 Answer
What is a CHECK constraint?
	Ensures data inserted/updated meets a specific condition.

Can a table have multiple CHECK constraints?
	Yes.
What happens if data violates a CHECK condition?
	SQL rejects the operation with an error.

Can CHECK use multiple columns?
	Yes, you can compare columns (like price >= cost).

How to add or drop a CHECK constraint?
	ALTER TABLE ADD/DROP CONSTRAINT constraint_name.


--------------------------------------------------------------------------------------------------

---------------------------------------------------------------------------------------------------
What is IDENTITY / AUTO INCREMENT?

The IDENTITY property (SQL Server) or AUTO_INCREMENT (MySQL) or AUTOINCREMENT (SQLite)
is used to automatically generate unique numbers for a column — usually the Primary Key.

💡 It saves you from manually assigning IDs for every new record.


================================================================================================
================================================================================================

🧱 Example 1 — SQL Server / PostgreSQL Style
CREATE TABLE employees_identity (
  emp_id INT IDENTITY(1,1) PRIMARY KEY,
  emp_name VARCHAR(50),
  department VARCHAR(50)
);


✅ Explanation:

IDENTITY(1,1) → starts at 1, increments by 1

Each new record gets a new ID automatically

🧩 Insert Data
INSERT INTO employees_identity (emp_name, department) VALUES ('Rohit', 'QA');
INSERT INTO employees_identity (emp_name, department) VALUES ('Sneha', 'Dev');


✅ Output:

emp_id	emp_name	department
1	        Rohit	QA
2	         Sneha	Dev
-----------------------------------------------------------------------------------------
🧱 Example 2 — MySQL / SQLite Style
CREATE TABLE employees_auto (
  emp_id INTEGER PRIMARY KEY AUTOINCREMENT,
  emp_name TEXT,
  department TEXT
);


✅ Here, emp_id will increase automatically (1, 2, 3, …).

🧩 Insert Example
INSERT INTO employees_auto (emp_name, department)
VALUES ('Amit', 'Support'), ('Riya', 'HR');


✅ Output:

emp_id	emp_name	department
1	Amit	Support
2	Riya	HR
---------------------------------------------------------------------------------------
🧱 Example 3 — AUTO_INCREMENT in MySQL
CREATE TABLE employees_mysql (
  emp_id INT AUTO_INCREMENT PRIMARY KEY,
  emp_name VARCHAR(50),
  department VARCHAR(50)
);


✅ Works the same as IDENTITY or AUTOINCREMENT.

-----------------------------------------------------------------------------------------

💡 Tester Use Case
Scenario                    	Example	                Purpose
Test unique record generation	AUTO_INCREMENT column	Ensure each insert gets new ID
Validate sequential data	IDs increase correctly	Catch duplicate or reset issues
Reset test data	TRUNCATE TABLE employees;	Resets auto-increment counter
Data migration	Check IDENTITY behavior	Avoid duplicate IDs in copied data

---------------------------------------------------------------------------------------

--------------------------------------------------------------------------------------
🧠 Interview Questions on IDENTITY / AUTO_INCREMENT

❓ Question	💬 Answer
What is IDENTITY / AUTO_INCREMENT used for?	
To automatically generate unique numbers for a column.

What is the syntax for IDENTITY?	
IDENTITY(start, increment) (SQL Server)

Can we insert values manually into an identity column?	
Yes, using SET IDENTITY_INSERT ON (SQL Server).

How to reset auto-increment counter?
	ALTER TABLE table_name AUTO_INCREMENT = 1; (MySQL)

Can a table have multiple identity columns?
	No, only one identity column per table.

--------------------------------------------------------------------------------------------
🧮 3️⃣ Real-World Example — Combined
CREATE TABLE orders (
  order_id INT PRIMARY KEY AUTO_INCREMENT,
  customer_name VARCHAR(50) NOT NULL,
  amount DECIMAL(10,2) CHECK (amount > 0),
  status VARCHAR(20) DEFAULT 'Pending'
);


✅ Behavior:

order_id auto-generates sequentially
amount must be positive (CHECK)
status defaults to 'Pending'

Insert Example
INSERT INTO orders (customer_name, amount) VALUES ('Rohit', 2500.00);
INSERT INTO orders (customer_name, amount) VALUES ('Sneha', -100.00); -- ❌ CHECK fails


✅ Output Table:

order_id          	customer_name	amount	status
1                   	Rohit	         2500.00	Pending

------------------------------------------------------------------------------------------------

