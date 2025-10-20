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

emp_id	emp_name	department	salary
1	      Rohit	       QA	     60000
2	      Sneha	       QA	     50000
3	      Amit	       Dev	     75000
4	      Riya         Dev	     80000
5	      Vikas	      Support    40000