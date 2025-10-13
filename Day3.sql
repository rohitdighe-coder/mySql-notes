/* 
=====================================================
🧮 DAY 3 — OPERATORS & EXPRESSIONS
Goal: Use comparison & logical operators to filter and validate data
=====================================================
*/
Goal: Use comparison & logical operators. =, >, <, !=, >=, <=
IS NULL, IS NOT NULL
 Combine conditions with AND, OR

------------------------------------------------------------------------------------------------------------------------------------------

= : equal to
<> or != : not equal to
> : greater than
< : less than
>= : greater than or equal to
<= : less than or equal to

------------------------------------------------------------------------------------------------
Start with first is  equal to operator (=)
Example:
SELECT * FROM employees
WHERE salary = 65000;   
✅ Explanation:
Retrieves all columns and rows from the employees table where the salary is equal to 65000

----------------------------------------------------------------------------------------------
Using greater than operator (>)
syntax:
SELECT * FROM table_name
WHERE column_name > value;
Example:
SELECT * FROM employees
WHERE salary > 50000;
✅ Explanation:
Retrieves all columns and rows from the employees table where the salary is greater than 50000
----------------------------------------------------------------------------------------------
Using less than operator (<)
syntax:
SELECT * FROM table_name
WHERE column_name < value;
Example:
SELECT * FROM employees
WHERE salary < 50000;
✅ Explanation:
Retrieves all columns and rows from the employees table where the salary is less than 50000
----------------------------------------------------------------------------------------------
Using greater than or equal to operator (>=)
syntax:
SELECT * FROM table_name
WHERE column_name >= value;
Example:
SELECT * FROM employees
WHERE salary >= 55000;
✅ Explanation:
Retrieves all columns and rows from the employees table where the salary is greater than or equal to 50000
--------------------------------------------------------------------------------------------------------------------
Using less than or equal to operator (<=)
syntax:
SELECT * FROM table_name
WHERE column_name <= value; 
Example:
SELECT * FROM employees
WHERE salary <= 55000;
✅ Explanation:
Retrieves all columns and rows from the employees table where the salary is less than or equal to 55000

------------------------------------------------------------------------------------------------------------------------------------------

IS NULL, IS NOT NULL

The IS NULL operator is used to test for empty values (NULL values) in a database table.
The IS NOT NULL operator is used to test for non-empty values (NOT NULL values) in a database table.
syntax:
SELECT * FROM table_name
WHERE column_name IS NULL;

SELECT * FROM table_name
WHERE column_name IS NOT NULL;      
Example:
SELECT * FROM employees
WHERE department IS NULL;
✅ Explanation:
Retrieves all columns and rows from the employees table where the department is NULL (i.e., has no value).
Example:
SELECT * FROM employees
WHERE department IS NOT NULL;
✅ Explanation:
Retrieves all columns and rows from the employees table where the department is NOT NULL (i.e., has a value).
------------------------------------------------------------------------------------------------------------------------------------------
 Combine conditions with AND, OR
The AND and OR operators are used to combine multiple conditions in a WHERE clause.
The AND operator requires all conditions to be true for a row to be included in the result set
The OR operator requires at least one condition to be true for a row to be included in the result set.
The NOT operator is used to negate a condition in a WHERE clause.
syntax:
SELECT * FROM table_name
WHERE condition1 AND condition2 AND ...;
SELECT * FROM table_name
WHERE condition1 OR condition2 OR ...;
SELECT * FROM table_name
WHERE NOT condition;
Example:
SELECT * FROM employees
WHERE department = 'Dev' AND salary > 60000;
✅ Explanation:
Retrieves all columns and rows from the employees table where the department is 'Dev' and the
salary is greater than 60000.
Example:
SELECT * FROM employees
WHERE department = 'Dev' OR salary > 60000;
✅ Explanation:
Retrieves all columns and rows from the employees table where the department is 'Dev' or the
salary is greater than 60000.
Example:
SELECT * FROM employees
WHERE NOT department = 'Dev'; 
✅ Explanation:
Retrieves all columns and rows from the employees table where the department is not 'Dev'.
------------------------------------------------------------------------------------------------------------------------------------------
