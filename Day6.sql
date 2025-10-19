/*********************************************************************************************
🧮 DAY 6 — AGGREGATE FUNCTIONS

🎯 Goal:
Learn SQL Aggregate Functions (COUNT, SUM, AVG, MAX, MIN) with GROUP BY and HAVING 
to analyze, summarize, and validate data efficiently.

📘 Topics Covered:
1. COUNT()  – Count number of rows
2. SUM()    – Add up numeric column values
3. AVG()    – Calculate average values
4. MAX()    – Find highest value
5. MIN()    – Find lowest value

💡 Importance in Testing:
Used for validating totals, averages, counts, and consistency of database results 
against application or report outputs.

*********************************************************************************************


What Are Aggregate Functions?

Aggregate functions perform calculations on multiple rows of a column and return a single result.

👉 Example:

If you have 100 employees, you can calculate:

Total salary → SUM(salary)

Average salary → AVG(salary)

Highest salary → MAX(salary)

Lowest salary → MIN(salary)

Number of employees → COUNT(emp_id)
-------------------------------------------------------------------


Common Aggregate Functions in SQL
Function	Description	Example
COUNT()	Counts total rows or non-null values	COUNT(emp_id)
SUM()	Adds up all numeric values	SUM(salary)
AVG()	Calculates average value	AVG(salary)
MAX()	Finds the maximum value	MAX(salary)
MIN()	Finds the minimum value	MIN(salary)


------------------------------------------------------------------------
Let’s Start Practically — Create a Table

Example :-


 CREATE TABLE employees (
  emp_id INT PRIMARY KEY,
  emp_name VARCHAR(50),
  department VARCHAR(50),
  salary INT,
  experience INT
);

INSERT INTO employees VALUES
(1, 'Rohit', 'QA', 60000, 3),
(2, 'Sneha', 'QA', 50000, 2),
(3, 'Amit', 'Dev', 75000, 5),
(4, 'Riya', 'Dev', 80000, 6),
(5, 'Vikas', 'Support', 40000, 1);

---------------------------------------------------------------------


✅ Data:

emp_id	emp_name	department	salary	 experience
1	     Rohit      	QA	     60000	   3
2      	Sneha        	QA	     50000     2
3	    Amit	        Dev	     75000	   5
4	    Riya	        Dev	     80000     6
5	    Vikas	        Support	 40000	   1

-------------------------------------------------------------------------

-- 1) COUNT = Count the number of employees

SELECT COUNT(*) AS total_employees FROM employees;

✅ Output:

total_employees
5


Explanation:- Explanation:
Counts all rows in the table.

--------------------------------------------------------------


Count specific column (ignores NULLs)
SELECT COUNT(salary) AS salary_count FROM employees;


✅ Counts only rows where salary is NOT NULL.

--------------------------------------------------------------


-- Count the number of employees in each department

SELECT department, COUNT(*) AS num_employees
FROM employees
GROUP BY department;

Output:

department	total_employees
QA            	2
Dev	            2
Support      	1


Used by testers to verify number of records per category.

------------------------------------------------------------- 



2️⃣ SUM() — Total of numeric column


SELECT SUM(salary) AS total_salary FROM employees;


✅ Output:

total_salary
305000

-----------------------------------------------------------------
📘 Sum by department


SELECT department, SUM(salary) AS total_salary
FROM employees
GROUP BY department;


✅ Output:

department	total_salary
QA         	110000
Dev      	155000
Support 	40000

💡 Testers use this to check total salary expenditure per department.

----------------------------------------------------------------------------------------

3️⃣ AVG() — Average value

---------------------------------------------------------------------------------
Average salary by department

SELECT department, AVG(salary) AS avg_salary
FROM employees
GROUP BY department;


✅ Output:

department	avg_salary
QA	          55000
Dev	          77500
Support	      40000

💡 Useful for performance or salary validation testing.


----------------------------------------------------------------------------------

4️⃣ MAX() — Highest value
SELECT MAX(salary) AS highest_salary FROM employees;


✅ Output:

highest_salary
80000

-----------------------------------------------------------------------------------
-----------------------------------------------------------------------------------

📘 Highest salary by department
SELECT department, MAX(salary) AS highest_salary
FROM employees
GROUP BY department;


✅ Output:

department	highest_salary
QA	        60000
Dev	        80000
Support	    40000

------------------------------------------------------------------
🔹 5️⃣ MIN() — Lowest value
SELECT MIN(salary) AS lowest_salary FROM employees;


✅ Output:

lowest_salary
40000

------------------------------------------------------------
📘 Lowest salary by department
SELECT department, MIN(salary) AS lowest_salary
FROM employees
GROUP BY department;


✅ Output:

department	lowest_salary
QA	            50000
Dev         	7500
Support	        40000


🧠 6️⃣ Combining Multiple Aggregate Functions
SELECT 
  COUNT(*) AS total_employees,
  SUM(salary) AS total_salary,
  AVG(salary) AS avg_salary,
  MAX(salary) AS max_salary,
  MIN(salary) AS min_salary
FROM employees;


✅ Output:

total_employees	total_salary	avg_salary	max_salary	min_salary
5	              305000	      61000    	 80000	     40000

💡 One query, all summary stats!


--------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------

Interview Questions
❓ Question	💬 Answer
What are aggregate functions?
	Functions that perform calculations on a set of values and return one value.

Difference between COUNT(*) and COUNT(column)?
	COUNT(*) counts all rows; COUNT(column) skips NULLs.

Can we use aggregate functions with WHERE?
	No, use HAVING for filtering aggregated results.

Can we combine multiple aggregate functions in one query?	
Yes, like COUNT, SUM, AVG together.



=======================================================================================



