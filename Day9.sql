/*********************************************************************************************
🧮 DAY 9 — SQL JOINS (Part 1: INNER JOIN & LEFT JOIN)

🎯 Goal:
Understand how JOINS combine data from multiple tables and 
learn the difference between INNER JOIN and LEFT JOIN.

📘 Topics Covered:
1. Concept of JOINS
2. INNER JOIN – Only matching rows
3. LEFT JOIN – All from left, match from right
4. Practical + Tester Use Cases
5. Interview Q&A

************************************************************************************************

 
# Joins #

Combining two or more records of different tables from the same database into one comprensive structure.

* A join clause is used to combines rowa from two or more tables.

Why use Join = 

Data into multiple tables 
enables more effiecient storage
easier manipulation and greater scalability.
Data reduancy - reduce duplicates.
When related information is stored in different tables,
JOINs help you retrieve that data together in one query.

Types of join = 

1) Inner Joins 
2) Left Joins 
3) RIGHT JOIN
4) FULL OUTER JOIN
5) CROSS JOIN
6) SELF JOIN

-----------------------------------------------------------------------------------------------
SETUP EXAMPLE OF JOINS :=

Table 1: departments
CREATE TABLE departments (
  dept_id INT PRIMARY KEY,
  dept_name VARCHAR(50)
);

INSERT INTO departments VALUES
(101, 'QA'),
(102, 'Development'),
(103, 'Support');

----------------------------------------------------------------------------------------------
Table 2: employees
CREATE TABLE employees (
  emp_id INT PRIMARY KEY,
  emp_name VARCHAR(50),
  dept_id INT,
  salary INT
);

INSERT INTO employees VALUES
(1, 'Rohit', 101, 60000),
(2, 'Sneha', 101, 50000),
(3, 'Amit', 102, 75000),
(4, 'Riya', 104, 80000);
-------------------------------------------------------------------------------------------------


✅ Data in both tables:

departments

dept_id	                  dept_name
101                        	QA
102                     	Development
103	                        Support

employees

emp_id	emp_name	 dept_id	  salary
1	      Rohit      101 	      60000
2	      Sneha	     101	      50000
3	      Amit	     102	      75000
4	      Riya	     104	      80000


--------------------------------------------------------------------
INNER JOIN -

The most common join operation used in application is an inner join.
INNER JOIN returns only the rows that have matching values in both tables.
Result - only matching rows from both tables are included in the result. 

Syntax :

Select column-name(s)
from table1 
INNER JOIN table2
ON Table.column-name = table2.column_name;


🧱 Example:

SELECT e.emp_id, e.emp_name, d.dept_name, e.salary
FROM employees e
INNER JOIN departments d
ON e.dept_id = d.dept_id;


✅ Output:

emp_id	emp_name	dept_name	salary
1     	Rohit        	QA	    60000
2	    Sneha	        QA	    50000
3	    Amit       	Development	75000

💡 Riya is missing because her dept_id = 104 doesn’t exist in departments.


employees e → left table (Employee info)
departments d → right table (Department info)
e.dept_id = d.dept_id → matching condition
Only matching dept_ids are returned.

INNER JOIN  ne fakt tya employees dakhvylya jya  valid department  madhe ahet .
---------------------------------------------------------------------------------------

Practical Tip for Testers

Use INNER JOIN to:
Verify data consistency between two related tables.
Check if every record in a child table (employees) has a valid parent record (departments).

Example Test Query:

SELECT e.emp_name
FROM employees e
LEFT JOIN departments d
ON e.dept_id = d.dept_id
WHERE d.dept_id IS NULL;


✅ This finds employees without a valid department (data mismatch).


-----------------------------------------------------------------------------------------------


LEFT JOIN :

Return all records from the left table and the matched records from the right table.
The result is 0 record from the right side, if there is no match. 
------------------------------------------------------------------------------------------------
LEFT JOIN returns all rows from the left table,
and matching rows from the right table.
If no match is found → right-side columns show NULL.
------------------------------------------------------------------------------------------------


Syntax : 

select column _name 
from table1 
left join table2 
ON table.column_name = table2.column_name;

🧱 Example:
SELECT e.emp_name, e.dept_id, d.dept_name
FROM employees e
LEFT JOIN departments d
ON e.dept_id = d.dept_id;


✅ Output:

emp_name	  dept_id	     dept_name
Rohit	        101	          QA
Sneha	        101           QA
Amit	       102	          Development
Riya	       104         	NULL

💡 Riya disate karan LEFT JOIN left table madhale sagle  rows thevto — pan tich  dept_name NULL ahe karan ticha department astivat nahi.

-----------------------------------------------------------------------------------------------------------------------------------------------------

How to Use LEFT JOIN in Testing

Use case:
Find invalid or orphan data.

SELECT e.emp_name
FROM employees e
LEFT JOIN departments d
ON e.dept_id = d.dept_id
WHERE d.dept_id IS NULL;


✅ Output:

emp_name
Riya 

ही query अशा employees दाखवते ज्यांचा department अस्तित्वात नाही — म्हणजे data चुकीचा आहे.

----------------------------------------------------------------------------------------------

6️⃣ INNER vs LEFT JOIN (Comparison Table)
Feature	               INNER JOIN	                      LEFT JOIN
Returns         	Only matching rows      	   All rows from left + matches from right
Non-matching              rows	                      Ignored	NULL on right
Typical use      	Data validation	                     Missing data check
Example	      Employees with valid departments	   Employees without departments

--------------------------------------------------------------------------------------

🧠 7️⃣ Interview Questions (Part 1)
❓ Question	💬 Answer
What is an INNER JOIN?
Returns rows where both tables have matching values.

---------------------------------------------------------------------------

What is a LEFT JOIN?	
Returns all rows from the left table and matching rows from the right.
---------------------------------------------------------------------------
Difference between INNER and LEFT JOIN?	
INNER shows only matches; LEFT keeps all left records.
-------------------------------------------------------------------------
What if data doesn’t match in LEFT JOIN?
The right table columns show NULL.
------------------------------------------------------------------------
Which JOIN is used to find missing relationships?
LEFT JOIN with WHERE right_table.col IS NULL.
----------------------------------------------------------------------------

Can you join more than two tables?	
Yes, using multiple JOIN clauses.

-------------------------------------------------------------------------------