/*********************************************************************************************
🧮 DAY 7 — GROUP BY And HAVING

🎯 Goal:
Understand how to group data (GROUP BY) and filter grouped results (HAVING) 
with real testing scenarios.

📘 Topics Covered:
1. GROUP BY – create logical groups
2. HAVING – filter aggregated results
3. WHERE vs HAVING – difference and combined use
4. Practical examples with COUNT, SUM, AVG
5. Real Tester Use Cases + Interview Prep

💡 Importance in Testing:
GROUP BY and HAVING are used to analyze test data summaries,
validate grouped data (like total salary per department),
and verify application report calculations.

*********************************************************************************************/


 GROUP BY -

 The GROUP BY statement groups rows that have the same values in specified columns.
 It’s used with aggregate functions like COUNT(), SUM(), AVG(), etc.


CREATE TABLE employees (
  emp_id INT PRIMARY KEY,
  emp_name VARCHAR(50),
  department VARCHAR(50),
  salary INT
);

INSERT INTO employees VALUES
(1, 'Rohit', 'QA', 60000),
(2, 'Sneha', 'QA', 50000),
(3, 'Amit', 'Dev', 75000),
(4, 'Riya', 'Dev', 80000),
(5, 'Vikas', 'Support', 40000);


----------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------

Data:
emp_id	emp_name	department	    salary
1	      Rohit	       QA	          60000
2	      Sneha	       QA	          50000
3	      Amit	       Dev	        75000
4	      Riya         Dev	        80000
5	      Vikas	      Support       40000



---------------------------------------------------------------------------------

2️⃣ Without GROUP BY (Normal Aggregate)

SELECT SUM(salary) AS total_salary FROM employees;


✅ Output:

total_salary
305000


---------------------------------------------------------------------------------------------------

3️⃣ With GROUP BY


SELECT department, SUM(salary) AS total_salary
FROM employees
GROUP BY department;


✅ Output:

department     	total_salary
QA             	110000
Dev	            155000
Support       	40000



SQL created groups by department and calculated total salary for each.

-----------------------------------------------------------------------------------------------------

4️⃣ Multiple Aggregates with GROUP BY

SELECT department,
       COUNT(*) AS total_employees,
       SUM(salary) AS total_salary,
       AVG(salary) AS avg_salary
FROM employees
GROUP BY department;


✅ Output:

department	total_employees	total_salary	avg_salary
QA	             2	          110000	    55000
Dev	             2	          155000	    77500
Support	         1	          40000     	40000


It shows total employees, total salary, and average salary per department.

------------------------------------------------------------------------------------------------------



HAVING --


HAVING works like WHERE, but it filters data after grouping.


Find departments where average salary > 50000

SELECT department, AVG(salary) AS avg_salary
FROM employees
GROUP BY department
HAVING AVG(salary) > 50000;


✅ Output:

department             avg_salary
QA	                   55000
Dev	                   77500

---------------------------------------------------------------------------------------------------
🔹6️⃣ WHERE vs HAVING
---------------------------------------------------------------------------------------------------
Feature                   	WHERE                    	HAVING
Filters before grouping    	✅	                        ❌
Filters after grouping     	❌	                        ✅
Can use aggregate functions	❌	                        ✅
Used with GROUP BY        	Sometimes	                  Always
Example	                    WHERE salary > 50000	      HAVING AVG(salary)>50000

----------------------------------------------------------------------------------------------------
🧩 Example using BOTH WHERE + HAVING
SELECT department, AVG(salary) AS avg_salary
FROM employees
WHERE salary > 40000
GROUP BY department
HAVING AVG(salary) > 50000;


✅ Explanation:

WHERE: filters rows first (salary > 40000)

GROUP BY: groups remaining rows by department

HAVING: filters grouped results (avg_salary > 50000)


--------------------------------------------------------------------------------------------------------
💡 Tester Use Cases
Scenario	                                             Query	               Purpose
Check count of test records per type	         GROUP BY type	             Validate record distribution

Validate average salary or total cost	         () + GROUP BY	             Compare system reports vs DB

Filter only groups meeting criteria	              HAVING	                  Example: only departments with >5 employees

Detect data imbalance                  GROUP BY region HAVING COUNT(*)=0	    Find missing data 

-----------------------------------------------------------------------------------------------------------------------------------


🧠 Interview Questions
❓ Question	                                💬 Answer
What does GROUP BY do?	                   Groups rows with same values for calculation.
Why do we use HAVING?	                     To filter aggregated/grouped results.
Can you use WHERE and HAVING together?	    Yes, WHERE filters rows, HAVING filters groups.
Difference between WHERE and HAVING?      	WHERE filters before grouping, HAVING after grouping.
Can HAVING be used without GROUP BY?    	  Yes, but it’s uncommon — used to filter aggregated results overall.
Example of GROUP BY with multiple columns?	 GROUP BY department, job_title

==================================================================================================================================
