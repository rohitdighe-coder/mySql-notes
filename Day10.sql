/*********************************************************************************************
🧮 DAY 10 — SQL JOINS (Part 2: RIGHT, FULL, CROSS, SELF)

🎯 Goal:
Learn advanced SQL JOINs — RIGHT JOIN, FULL OUTER JOIN, CROSS JOIN, and SELF JOIN
with examples, outputs, tester use cases, and interview questions.

📘 Topics Covered:
1. RIGHT JOIN
2. FULL OUTER JOIN
3. CROSS JOIN
4. SELF JOIN
5. Real Tester Use Cases + Interview Prep

*********************************************************************************************/

-- RIGHT JOIN examples and test cases (MySQL)

A RIGHT JOIN returns all rows from the right table and the matching rows from the left table.
If there’s no match, NULLs are shown for the left table columns.


-- Setup sample tables
DROP TABLE IF EXISTS departments;
DROP TABLE IF EXISTS employees;

CREATE TABLE departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50)
);

CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    dept_id INT
);

INSERT INTO departments VALUES
    (1, 'HR'),
    (2, 'Engineering'),
    (3, 'Sales'),
    (4, 'Legal');   -- department with no employees

INSERT INTO employees VALUES
    (10, 'Alice', 2),
    (11, 'Bob',   2),
    (12, 'Carol', 1),
    (13, 'Dave',  NULL); -- employee without department

----------------------------------------------------------------
-- 1) Basic RIGHT JOIN: return all departments and matching employees
----------------------------------------------------------------
SELECT
    d.dept_id,
    d.dept_name,
    e.emp_id,
    e.emp_name
FROM employees e
RIGHT JOIN departments d
    ON e.dept_id = d.dept_id
ORDER BY d.dept_id, e.emp_id;

-- Expected rows:
-- dept_id | dept_name  | emp_id | emp_name
-- 1       | HR         | 12     | Carol
-- 2       | Engineering| 10     | Alice
-- 2       | Engineering| 11     | Bob
-- 3       | Sales      | NULL   | NULL
-- 4       | Legal      | NULL   | NULL

----------------------------------------------------------------
-- 2) Find departments with NO employees (using RIGHT JOIN)
----------------------------------------------------------------
SELECT d.dept_id, d.dept_name
FROM employees e
RIGHT JOIN departments d
    ON e.dept_id = d.dept_id
WHERE e.emp_id IS NULL;

-- Expected rows:
-- dept_id | dept_name
-- 3       | Sales
-- 4       | Legal

----------------------------------------------------------------
-- 3) RIGHT JOIN with additional filter on right table
--    (shows how WHERE interacts with NULLs from LEFT side)
----------------------------------------------------------------
-- All Engineering department rows (including no-match)
SELECT d.dept_id, d.dept_name, e.emp_name
FROM employees e
RIGHT JOIN departments d
    ON e.dept_id = d.dept_id
WHERE d.dept_name = 'Engineering';

-- Expected:
-- dept_id | dept_name   | emp_name
-- 2       | Engineering | Alice
-- 2       | Engineering | Bob

----------------------------------------------------------------
-- 4) RIGHT JOIN with aggregation: count employees per department
----------------------------------------------------------------
SELECT d.dept_id, d.dept_name, COUNT(e.emp_id) AS employee_count
FROM employees e
RIGHT JOIN departments d
    ON e.dept_id = d.dept_id
GROUP BY d.dept_id, d.dept_name
ORDER BY d.dept_id;

-- Expected:
-- dept_id | dept_name   | employee_count
-- 1       | HR          | 1
-- 2       | Engineering | 2
-- 3       | Sales       | 0
-- 4       | Legal       | 0

----------------------------------------------------------------
-- 5) RIGHT JOIN vs LEFT JOIN equivalence:
--    You can rewrite RIGHT JOIN by swapping table order and using LEFT JOIN.
----------------------------------------------------------------
-- Equivalent of the first query using LEFT JOIN:
SELECT d2.dept_id, d2.dept_name, e2.emp_id, e2.emp_name
FROM departments d2
LEFT JOIN employees e2 ON e2.dept_id = d2.dept_id
ORDER BY d2.dept_id, e2.emp_id;

----------------------------------------------------------------


🧩 Setup Reference Tables

Before testing, we’ll use this standard setup 👇


CREATE TABLE departments (
  dept_id INT PRIMARY KEY,
  dept_name VARCHAR(50)
);

CREATE TABLE employees (
  emp_id INT PRIMARY KEY,
  emp_name VARCHAR(50),
  dept_id INT
);

INSERT INTO departments VALUES
(1, 'QA'),
(2, 'Development'),
(3, 'Support');

INSERT INTO employees VALUES
(101, 'Rohit', 1),
(102, 'Sneha', 2),
(103, 'Amit', 2);


✅ Initial Data:

departments

dept_id	     dept_name
1	             QA
2         	Development
3          	Support

employees

emp_id      	emp_name	dept_id
101	             Rohit	       1
102	             Sneha	       2
103              Amit	       2

-----------------------------------------------------------------------------------------------
-- Tester use-cases:
-- 1) Add an employee with dept_id = 5 (non-existent department) and confirm it
--    appears only in employees side (no department info) when doing RIGHT JOIN.
 
 Objective:

To check if RIGHT JOIN correctly shows departments even if some employees belong to invalid (non-existing) departments.

🔹 Step 1: Add invalid department employee
INSERT INTO employees VALUES (104, 'Riya', 5);


✅ Now Employees:

emp_id	emp_name	dept_id
101	Rohit	1
102	Sneha	2
103	Amit	2
104	Riya	5


🔹 Step 2: Perform RIGHT JOIN
SELECT e.emp_name, e.dept_id, d.dept_name
FROM employees e
RIGHT JOIN departments d
ON e.dept_id = d.dept_id;


✅ Output:

emp_name	dept_id	dept_name
Rohit	1	QA
Sneha	2	Development
Amit	2	Development
NULL	NULL	Support


🔹 Step 3: Check with LEFT JOIN (to confirm Riya’s record)
SELECT e.emp_name, e.dept_id, d.dept_name
FROM employees e
LEFT JOIN departments d
ON e.dept_id = d.dept_id;


✅ Output:

emp_name	dept_id	  dept_name
Rohit	       1	    QA
Sneha	       2	  Development
Amit	       2	  Development
Riya	       5	  NULL


💡 Tester Observation:
JOIN Type     	Shows Riya?	   Shows Support?
RIGHT JOIN	       ❌ No	        ✅ Yes
LEFT JOIN        ✅ Yes       	❌ No

मराठीत:

RIGHT JOIN ने departments वर फोकस केला — म्हणून Support दिसतो पण Riya नाही.

LEFT JOIN ने employees वर फोकस केला — म्हणून Riya दिसते पण तिचा department NULL आहे.

-- 2) Delete department 2 and observe RIGHT JOIN returns remaining departments only.

🧠 Objective:

To confirm RIGHT JOIN updates correctly when a department is deleted.

🔹 Step 1: Delete Department 2
DELETE FROM departments WHERE dept_id = 2;


✅ Now Departments:

dept_id	  dept_name
1     	     QA
3	       Support


🔹 Step 2: RIGHT JOIN again
SELECT e.emp_name, e.dept_id, d.dept_name
FROM employees e
RIGHT JOIN departments d
ON e.dept_id = d.dept_id;


✅ Output:

emp_name     	dept_id   	dept_name
Rohit           	1	       QA
NULL	           NULL   	Support


💡 Tester Observation:

Employees from deleted department (dept_id=2) are gone from the result.
RIGHT JOIN still shows existing departments, even if they have no employees.

मराठीत:
Department 2 delete केल्यानंतर RIGHT JOIN मध्ये “Development” गायब झालं —
कारण ते department आता अस्तित्वात नाही.



-- 3) Replace RIGHT JOIN with LEFT JOIN by swapping tables and compare results.
🧠 Objective:

To verify that swapping LEFT ↔ RIGHT tables gives the same result (reversed perspective).

🔹 Step 1: Use RIGHT JOIN
SELECT e.emp_name, d.dept_name
FROM employees e
RIGHT JOIN departments d
ON e.dept_id = d.dept_id;

🔹 Step 2: Use LEFT JOIN (swap table order)
SELECT e.emp_name, d.dept_name
FROM departments d
LEFT JOIN employees e
ON e.dept_id = d.dept_id;


✅ Both outputs are identical.

emp_name	dept_name
Rohit	      QA
NULL	    Support

💡 Tester Observation:

✅ RIGHT JOIN and LEFT JOIN are mirror images of each other.
👉 RIGHT JOIN A=B ≈ LEFT JOIN B=A

मराठीत:
RIGHT JOIN आणि LEFT JOIN दोन्ही सारखे काम करतात —
फक्त कोणता table “main” आहे ते उलटं होतं.

🧾 Summary

Test Case	Action	Expected Result	Tester Verification
1️⃣ Invalid Dept Employee	Add emp with dept_id=5	Appears only in LEFT JOIN	Confirm NULL dept_name
2️⃣ Delete Department	Remove dept_id=2	RIGHT JOIN skips deleted dept	Only existing depts shown
3️⃣ Swap Tables	RIGHT ↔ LEFT	Same result set	Compare outputs


🧠 Interview Tip

❓ “What is the difference between LEFT JOIN and RIGHT JOIN?”

✅ Answer:
LEFT JOIN returns all rows from the left table and matched rows from right.
RIGHT JOIN does the opposite.
They are mirror images of each other and interchangeable by swapping table order.


------------------------------------------------------------------------------------

----------------------------------------------------------------
-- 1️⃣ What does RIGHT JOIN return when a matching row does not exist on the left?

✅ Answer:
It returns all rows from the right table, and for unmatched rows,
the columns from the left table appear as NULL.

Example:
If an employee record doesn’t exist for a department,
that department still appears, but employee fields are NULL.

2️⃣ How do you find rows in the right table with no matches on the left?

✅ Answer:
Use WHERE left_table.column IS NULL after a RIGHT JOIN.

Example:

SELECT d.dept_name
FROM employees e
RIGHT JOIN departments d
ON e.dept_id = d.dept_id
WHERE e.emp_id IS NULL;


This returns departments that have no employees.

3️⃣ How can a RIGHT JOIN be rewritten as a LEFT JOIN?

✅ Answer:
By swapping the order of the tables.
A RIGHT JOIN of A and B is the same as a LEFT JOIN of B and A.

Example:

-- Using RIGHT JOIN
SELECT e.emp_name, d.dept_name
FROM employees e
RIGHT JOIN departments d ON e.dept_id = d.dept_id;

-- Equivalent LEFT JOIN
SELECT e.emp_name, d.dept_name
FROM departments d
LEFT JOIN employees e ON e.dept_id = d.dept_id;

4️⃣ When might you prefer RIGHT JOIN over LEFT JOIN (or vice versa)?

✅ Answer:

Use LEFT JOIN when your main focus is on the left table’s data (e.g., all employees).
Use RIGHT JOIN when your main focus is on the right table’s data (e.g., all departments).

💡 They’re functionally equivalent — it’s mainly about readability and logical perspective.

🧾 Summary Table
#	Question	Short Answer
1️⃣	What does RIGHT JOIN return if no match on left?
	Right table rows + NULLs for left
2️⃣	Find rows in right table with no match?	
WHERE left.col IS NULL
3️⃣	Rewrite RIGHT as LEFT?	
Swap table positions
4️⃣	When to prefer RIGHT JOIN?	
When right table is main focus
-----------------------------------------------------------------------------------------------------------------

FULL JOIN (FULL OUTER JOIN)

* my sql nOT Support  FULL JOIN 

A FULL OUTER JOIN returns all records from both tables —
matched rows are merged, unmatched rows show NULL on the side where no match exists.

🧱 2️⃣ Syntax
SELECT columns
FROM table1
FULL OUTER JOIN table2
ON table1.common_column = table2.common_column;

🧩 3️⃣ Example Tables
🧱 Table 1 — employees
emp_id	emp_name	dept_id
1	Rohit	101
2	Sneha	101
3	Amit	102
4	Riya	104

🧱 Table 2 — departments
dept_id	dept_name
101    	QA
102	  Development
103	   Support

🔹 4️⃣ Example — FULL JOIN
SELECT e.emp_name, e.dept_id, d.dept_name
FROM employees e
FULL OUTER JOIN departments d
ON e.dept_id = d.dept_id;


✅ Output:

emp_name	dept_id    	dept_name
Rohit       	101     	QA
Sneha       	101      	QA
Amit	        102   	Development
Riya	        104	    NULL
NULL	        103	    Support


🧠 Explanation:-

Riya → Appears with NULL department because dept_id = 104 doesn’t exist in departments.
Support → Appears with NULL employee because no one works in dept_id = 103.
All valid matches (QA, Development) are joined normally.

मराठीत:

दोन्ही tables मधलं पूर्ण data दाखवलं गेलं.
जे match झाले ते एकत्र आले, बाकीचं NULL ने भरलं गेलं.

🧩 5️⃣ FULL JOIN = LEFT JOIN + RIGHT JOIN

You can simulate FULL JOIN by combining LEFT and RIGHT JOIN using UNION (especially in MySQL).

SELECT e.emp_name, e.dept_id, d.dept_name
FROM employees e
LEFT JOIN departments d ON e.dept_id = d.dept_id
UNION
SELECT e.emp_name, e.dept_id, d.dept_name
FROM employees e
RIGHT JOIN departments d ON e.dept_id = d.dept_id;


💡 UNION automatically removes duplicates, giving same output as FULL JOIN.

🧩 6️⃣ Practical Testing Scenarios
Scenario                            	Description	                           Example
Data Comparison  	       Compare two systems’ tables to find mismatches   	Compare staging vs production
Orphan Data Detection	    Identify records missing on one side	           Find employees without department or vice versa
Data Migration Validation	Ensure all data transferred correctly	          Match old & new table by ID
Report Reconciliation	  Validate total counts or names from two sources	  user list in two environments


🧱 Example — Find mismatched records
SELECT e.emp_name, e.dept_id, d.dept_name
FROM employees e
FULL OUTER JOIN departments d
ON e.dept_id = d.dept_id
WHERE e.dept_id IS NULL OR d.dept_id IS NULL;


✅ Output:

emp_name	dept_id    	dept_name
Riya	     104	      NULL
NULL	     103	     Support

💡 This shows non-matching data —
→ Riya has an invalid dept_id,
→ Support has no employees.

मराठीत:
ही query “कुठली data missing आहे” हे शोधते —
जे match नाही झाले तेच दाखवते.

🧩 7️⃣ When to Use FULL JOIN (in Testing)

✅ When you want complete visibility of both tables.
✅ When validating data synchronization between two systems.
✅ When checking both missing and mismatched records.
✅ When comparing old vs new database after migration.



🧠 8️⃣ Interview Questions (Short)
❓ Question	💬 Short Answer
What is a FULL JOIN?	
Combines results of LEFT and RIGHT JOIN — returns all records from both tables.
What happens when no match is found?
	Columns from the non-matching table appear as NULL.
Is FULL JOIN supported in MySQL?
	No, but can be simulated using UNION of LEFT and RIGHT JOIN.
Difference between FULL JOIN and INNER JOIN?
	INNER returns only matches; FULL returns all rows (matches + non-matches).
Use case of FULL JOIN?	
Data reconciliation, mismatch detection, migration validation.
What happens if both tables have duplicates?
	FULL JOIN will merge matches but return all unique non-matching rows.


🧾 9️⃣ Summary Table
JOIN Type	   Description               	Example Use
LEFT JOIN 	All left + matching right	Find missing right data
RIGHT JOIN	All right + matching left	Find missing left data
FULL JOIN	All rows from both sides	Find mismatched or orphan data

--------------------------------------------------------------------------------------------------------------
CROSS JOIN 

CROSS JOIN म्हणजे दोन्ही tables मधले सर्व rows एकमेकांशी combine करणं.
यामध्ये कोणतीही condition नसते — प्रत्येक row एका table मधून दुसऱ्या table मधल्या प्रत्येक row शी जोडली जाते.


A CROSS JOIN returns the Cartesian product of two tables —
that is, every row from the first table is paired with every row from the second table.

🧱 2️⃣ Syntax
SELECT *
FROM table1
CROSS JOIN table2;


✅ No ON condition is used in CROSS JOIN.

🧩 3️⃣ Example Tables
🧱 Table 1 — employees
emp_id	emp_name
1	    Rohit
2	Sneha
3	Amit
🧱 Table 2 — departments
dept_id	dept_name
101	QA
102	Development
🔹 4️⃣ Example — CROSS JOIN
SELECT e.emp_name, d.dept_name
FROM employees e
CROSS JOIN departments d;


✅ Output (3 × 2 = 6 rows):

emp_name	dept_name
Rohit	QA
Rohit	Development
Sneha	QA
Sneha	Development
Amit	QA
Amit	Development


🧠 Explanation

Each employee is combined with every department.

There is no filtering condition, so it shows all possible pairings.

मराठीत:
प्रत्येक employee ला प्रत्येक department शी जोडून एक नवीन combination तयार होतं.
त्यामुळे result मध्ये “सर्व शक्य combinations” मिळतात.

🔹 5️⃣ CROSS JOIN = No ON condition

If you write a normal JOIN without an ON condition — it behaves like a CROSS JOIN 👇

SELECT e.emp_name, d.dept_name
FROM employees e, departments d;


✅ Same output (6 rows)

💡 Old-style syntax — not recommended, but works the same.



🔹 6️⃣ Practical Example for Testers
🧩 Example 1 — Generate Environment × Test Case combinations
Table: environments
env_id	env_name
1	QA
2	Staging
3	Production


Table: testcases
tc_id	test_name
1     	Login
2    	Signup

SELECT e.env_name, t.test_name
FROM environments e
CROSS JOIN testcases t;


✅ Output (3 × 2 = 6 combinations):

env_name	test_name
QA	         Login
QA	        Signup
Staging	     Login
Staging	    Signup
Production	Login
Production	Signup

मराठीत:
ही query प्रत्येक environment मध्ये प्रत्येक test case चालवण्यासाठी combinations तयार करते.
Testing automation साठी अतिशय उपयोगी!

🧩 Example 2 — Product × Color combination
product	color
Shirt	Red
Shirt	Blue
Pants	Red
Pants	Blue

💡 Perfect for generating test input data for all permutations.

🧩 7️⃣ Real Testing Use Cases

Scenario	                           Example	                                     Purpose
Generate all environment/test    case combinationCROSS JOIN	          To automate test coverage matrix
Data permutation testing	         CROSS JOIN	                               Verify all possible input sets
Report generation	           Combine metrics like “team × month”	    To summarize every combination
Missing data check           	Compare expected vs actual pairs     	Validate completeness of datasets


🧠 8️⃣ Caution
Issue	Description
❗ Very large output	If one table has 100 rows and another has 1000 → Result = 100,000 rows
❗ No condition	Make sure you really want all combinations
✅ Use LIMIT	To test safely: SELECT ... CROSS JOIN ... LIMIT 10;



🧩 9️⃣ Interview Questions (Short & Smart)
❓ Question	💬 Short Answer
What is a CROSS JOIN?
	It returns all possible combinations of rows from both tables.
Does CROSS JOIN use an ON condition?
	No. It joins every row of one table with every row of another.
What is another name for CROSS JOIN?
	Cartesian Product.
How is CROSS JOIN different from INNER JOIN?
	INNER JOIN needs a condition; CROSS JOIN doesn’t.
When to use CROSS JOIN?	
To generate combinations (like environment × test case).


-----------------------------------------------------------------------------------------------------

SELF JOIN — Joining a Table with Itself
🎯 Goal:

Understand how to join a table to itself using different aliases —
to compare or relate rows within the same table.

🧩 1️⃣ What is a SELF JOIN?

मराठीत:
SELF JOIN म्हणजे एखाद्या table ला स्वतःशीच जोडणं.
जेव्हा एकाच table मध्ये parent-child किंवा manager-employee सारखं relationship असतं, तेव्हा आपण SELF JOIN वापरतो.

In English:
A SELF JOIN is a regular join where the same table is joined with itself
to compare rows in that table (like matching a manager to their employees).

🧱 2️⃣ Syntax
SELECT a.column_name, b.column_name
FROM table_name a
JOIN table_name b
ON a.common_column = b.related_column;


✅ You must use aliases (like a and b) to differentiate the same table.

🧩 3️⃣ Example Table — employees
emp_id	emp_name	manager_id
1	Rohit	NULL
2	Sneha	1
3	Amit	1
4	Riya	2
5	Vikas	2
🔹 4️⃣ Example — SELF JOIN to Find Manager-Employee Relationship
SELECT 
  e.emp_name AS Employee,
  m.emp_name AS Manager
FROM employees e
LEFT JOIN employees m
ON e.manager_id = m.emp_id;


✅ Output:

Employee	Manager
Rohit	    NULL
Sneha	   Rohit
Amit	  Rohit
Riya	 Sneha
Vikas	 Sneha

🧠 Explanation

We use the same table twice:
e → represents the employee side
m → represents the manager side

The ON condition matches each employee’s manager_id with another employee’s emp_id.

मराठीत:
employees table दोनदा वापरली —
एक “employee” म्हणून (e) आणि एक “manager” म्हणून (m).
प्रत्येक employee चा manager manager_id ने match केला.

🧩 5️⃣ Find Employees Without Managers (Top-Level)
SELECT e.emp_name
FROM employees e
LEFT JOIN employees m
ON e.manager_id = m.emp_id
WHERE e.manager_id IS NULL;


✅ Output:

emp_name
Rohit

💡 Rohit is the top-level employee (no manager).

🧩 6️⃣ Find Managers Who Manage Someone
SELECT DISTINCT m.emp_name AS Manager
FROM employees e
INNER JOIN employees m
ON e.manager_id = m.emp_id;


✅ Output:

Manager
Rohit
Sneha

मराठीत:
ही query अशा employees दाखवते जे इतरांना manage करतात — म्हणजे managers आहेत.

🧩 7️⃣ Example 2 — Find Duplicate Records Using SELF JOIN

Table: products

id	name	price
1	Mobile	500
2	Laptop	800
3	Mobile	500


SELECT a.id, a.name, a.price
FROM products a
JOIN products b
ON a.name = b.name AND a.price = b.price
WHERE a.id <> b.id;


✅ Output:

id	name	price
1	Mobile	500
3	Mobile	500

💡 This shows duplicate entries (same name and price but different IDs).

मराठीत:
SELF JOIN वापरून duplicate data शोधता येतो.

🧩 8️⃣ Real Testing Use Cases
Use Case                	Query Purpose              	    Example
Validate hierarchy	     Check manager-employee mapping	 Employee–Manager table
Find missing parent	      Detect orphan records      	e.g., manager_id doesn’t exist
Detect duplicates	      Match rows with same values	Product or User data
Compare records in same table	Identify version or value changes	Compare old vs new entry
Audit data consistency	Ensure manager exists before assigning	HR or workflow databases

🧩 Example — Find Invalid Manager IDs
SELECT e.emp_name, e.manager_id
FROM employees e
LEFT JOIN employees m
ON e.manager_id = m.emp_id
WHERE m.emp_id IS NULL AND e.manager_id IS NOT NULL;


✅ Output:

emp_name	manager_id
(Any employee whose manager_id doesn’t exist)	

मराठीत:
ही query अशा employees दाखवते ज्यांचा manager table मध्ये अस्तित्वात नाही — म्हणजे invalid relationship.

🧠 9️⃣ Interview Questions (Short + Smart)
❓ Question	💬 Short Answer
What is a SELF JOIN?
	A join where a table is joined with itself.
Why use aliases in SELF JOIN?
	To differentiate between two instances of the same table.
Common use of SELF JOIN?
	To find relationships (like employee → manager).
Can you use LEFT JOIN in SELF JOIN?	
Yes, to include employees with no managers.
How to find top-level employees?	
Use WHERE manager_id IS NULL.
Can SELF JOIN detect duplicates?
	Yes, by joining on same columns but different IDs.
Is SELF JOIN different from normal JOIN?
	No, it’s a normal JOIN used on the same table.


🧾 10️⃣ Summary
Join Type	              Description	                                              Example Use
SELF JOIN	       Table joined with itself	                                       Manager–Employee, Duplicates
LEFT SELF JOIN	        Show all rows, including those with NULL relationships  	Show top-level managers
INNER SELF JOIN	   Show only matching relationships     	                        Show valid pairs only
