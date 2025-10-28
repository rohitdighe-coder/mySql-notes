/*********************************************************************************************
🧮 DAY 8 — ALIASES And CONCATENATION

🎯 Goal:
Learn how to rename tables and columns using Aliases, and 
combine multiple column values using CONCAT() or || operator.

📘 Topics Covered:
1. Column Aliases (AS)
2. Table Aliases
3. CONCAT() and CONCAT_WS() Functions
4. || Operator (String Concatenation)
5. Real Tester Use Cases + Interview Q&A

*********************************************************************************************/

What are alias:In SQL, an alias is a temporary name assigned to a table or column for the duration of a query. 
alias makes queries easier to read and write, especially when dealing with complex expressions or joining multiple table.

An alias is a temporary name given to a table or column in a SQL query.
It’s valid only during that query execution — not permanent.


-- Syntax for Column Alias
SELECT column_name AS alias_name
FROM table_name;

-- Syntax for Table Alias
SELECT column_name
FROM table_name AS alias_name;

-- Syntax for CONCAT() function
SELECT CONCAT(column1, column2) AS combined_column
FROM table_name;

-- Syntax for CONCAT_WS() function (with separator)
SELECT CONCAT_WS(' ', column1, column2) AS combined_column
FROM table_name;

-- Syntax for || operator (may depend on SQL dialect)
SELECT column1 || column2 AS combined_column
FROM table_name;


-- Example: Using column and table aliases, and concatenation

-- Suppose we have a table called employees with columns: first_name, last_name, department

SELECT 
    first_name AS fname,
    last_name AS lname,
    CONCAT(first_name, ' ', last_name) AS full_name,
    department AS dept
FROM employees AS e;

-- Example: Using CONCAT_WS to join names with a hyphen
SELECT 
    CONCAT_WS('-', first_name, last_name) AS name_hyphenated
FROM employees;

-- Example: Using || operator (works in PostgreSQL, SQLite, Oracle)
SELECT 
    first_name || ' ' || last_name AS full_name
FROM employees;

-------------------------------------------------------------------------------------------


Example 1 — Column Alias
SELECT emp_name AS Employee, salary AS Salary
FROM employees;


✅ Output:

Employee	Salary
Rohit	60000
Sneha	50000
Amit	75000

💡 Here, column names are renamed only for display.

मराठीत:
AS वापरून आपण column ला नवीन नाव दिलं —
emp_name → Employee, salary → Salary.



🧱 Example 2 — Table Alias
SELECT e.emp_name, e.salary, d.dept_name
FROM employees AS e
INNER JOIN departments AS d
ON e.dept_id = d.dept_id;


✅ Output:

emp_name	salary	dept_name
Rohit	60000	QA
Sneha	50000	QA
Amit	75000	Development

💡 Instead of writing full table names every time (employees.dept_id),
we just use e and d.

मराठीत:
टेबल aliases मुळे कोड छोटा आणि स्पष्ट होतो.
employees = e आणि departments = d.


🧱 Example 3 — Without AS keyword
SELECT emp_name Employee, salary Pay FROM employees;


✅ Works fine — AS is optional in most databases.

💡 Aliasing Rules
Rule	Description
Alias name valid only for that query	Temporary name
Use AS keyword (optional)	AS improves clarity
For multi-word alias	Use quotes → "Full Name"
Works for both columns and tables	employees e or salary AS Pay


🧱 Example 4 — Multi-word Alias
SELECT emp_name AS "Employee Name", salary AS "Monthly Salary"
FROM employees;


✅ Output:

Employee Name	Monthly Salary
Rohit	60000
Sneha	50000

💡 Always use double quotes for multi-word alias.

🧠 Tester Use Case: Aliases
Scenario	Example	Purpose
Make test result readable	AS "Average Salary"	Better readability
Reduce typing in joins	employees e	Clean query writing
Simplify complex subqueries	SELECT * FROM (...) AS summary	Easy reference in automation DB checks




🔹 2️⃣ CONCATENATION (Joining Columns/Text)

मराठीत:
Concatenation म्हणजे दोन किंवा अधिक columns एकत्र करून एक value बनवणं.

In English:
Concatenation means joining multiple strings or column values into one output.

🧱 Example 1 — Using CONCAT() Function
SELECT CONCAT(emp_name, ' works in ', department) AS Info
FROM employees;


✅ Output:

Info
Rohit works in QA
Sneha works in QA
Amit works in Dev

💡 Here we joined 2 column values + one string.


🧱 Example 2 — Using Multiple Columns
SELECT CONCAT(emp_name, ' - ', salary, ' INR') AS Employee_Info
FROM employees;


✅ Output:

Employee_Info
Rohit - 60000 INR
Sneha - 50000 INR


🧱 Example 3 — Using CONCAT_WS() (With Separator)

(MySQL specific function)
CONCAT_WS(separator, column1, column2, ...)

SELECT CONCAT_WS(' | ', emp_name, department, salary) AS Details
FROM employees;


✅ Output:

Details
Rohit
Sneha

=================================================================================
💡 Easily joins multiple values with a custom separator.

🧱 Example 4 — Using || Operator (in PostgreSQL / SQLite)
SELECT emp_name || ' works in ' || department AS Info
FROM employees;


✅ Works same as CONCAT()
---------------------------------------------------------------------------
⚙️ 3️⃣ Combine Aliases + Concatenation
SELECT 
e.emp_id AS ID,
CONCAT(e.emp_name, ' from ', d.dept_name) AS "Employee Details"
FROM employees e
INNER JOIN departments d
ON e.dept_id = d.dept_id;


✅ Output:

ID	         Employee   Details
1	           Rohit     from QA
2            	Sneha    from QA
3	          Amit     from Development

-------------------------------------------------------------------------------------------------

💡 4️⃣ Real Testing Scenarios

Scenario	                       Query	                 Purpose

Display user summary	      CONCAT(name, '-', city)   	 Combine values for verification\

Check report fields          	AS "Total Salary"	          Readable result for tester

Match DB values with 	     Concatenation in SELECT          Validate formatted output
API

Create full name	CONCAT(first_name, ' ', last_name)	      Generate combined field


-------------------------------------------------------------------------------------------------------------------



🧠 5️⃣ Interview Questions

What is an alias in SQL?
	A temporary name for a table or column used within a query.

Is the AS keyword mandatory?
	No, optional.

Why are aliases used?
	To simplify long queries or rename result headers.

What is CONCAT used for?	
    To join two or more strings/columns into one.

Difference between CONCAT() and CONCAT_WS()?
	CONCAT_WS() allows a separator.

How to join text and numbers?

	SQL automatically converts numbers to strings in CONCAT().

Can we use alias for expressions?
	Yes, like AVG(salary) AS average_salary.


-----------------------------------------------------------------------------------------------