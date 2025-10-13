🧮 Day 2 — SELECT & WHERE Clauses
For this used prevously created database & table.
 --------------------------------------------------------------------------------------------------------------------------------------------

1) select
most used commands in SQL
used to retrieve data from a database table.
syntax:
SELECT column1, column2, ...
FROM table_name;
* = all columns
Example:

SELECT * FROM employees;
✅ Explanation:
Retrieves all columns and rows from the employees table.

SELECT name, department FROM employees;
✅ Explanation:
Retrieves only the name and department columns from the employees table.

Retrieving individual columns
Example:
SELECT name FROM employees; 
✅ Explanation:
Retrieves only the name column from the employees table.
--------------------------------------------------------------------------------------------------------------------------------------------

2) WHERE Clause : working like a filter
used to filter records that meet a specific condition.
syntax:
SELECT column1, column2, ...
FROM table_name
WHERE condition;
note: WHERE Clause is not only used with SELECT statement but also with UPDATE, DELETE statements.
Example:
SELECT * FROM employees
WHERE department = 'Dev';   

✅ Explanation:
Retrieves all columns and rows from the employees table where the department is 'Dev'.

Operators in WHERE Clause:

= : equal to
<> or != : not equal to
> : greater than
< : less than
>= : greater than or equal to
<= : less than or equal to
BETWEEN : within a range
LIKE : pattern matching
IN : within a set of values
using and or not operators.
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
-----------------------------------------------------------------------------------------------------------------------

Using not equal to operator (<> or !=) 
 Difference between <> and !=  - They are functionally equivalent and can be used interchangeably in SQL to represent "not equal to" condition.
Example:
SELECT * FROM employees
WHERE salary <> 60000;
✅ Explanation:
Retrieves all columns and rows from the employees table where the salary is not equal to 60000
Example:
SELECT * FROM employees
WHERE salary != 60000;     
✅ Explanation:
Retrieves all columns and rows from the employees table where the salary is not equal to 60000
------------------------------------------------------------------------------------------------------------------------------------------
Using BETWEEN operator
BETWEEN operator is used to filter the result set within a certain range. The range is inclusive, meaning it includes the boundary values.
It can be used with numeric, text, or date data types.
syntax:
SELECT * FROM table_name
WHERE column_name BETWEEN value1 AND value2;
Example:
SELECT * FROM employees
WHERE salary BETWEEN 50000 AND 60000;   it includes 50000 and 60000 also. use  like >= and <= for that.
✅ Explanation:
Retrieves all columns and rows from the employees table where the salary is between 50000 and 60000, inclusive.
------------------------------------------------------------------------------------------------------------------------------------------
Using LIKE operator
LIKE operator is used in a WHERE clause to search for a specified pattern in a column.
Two wildcards are often used in conjunction with the LIKE operator: 
% : represents zero, one, or multiple characters
_ : represents a single character 
syntax:
SELECT * FROM table_name
WHERE column_name LIKE pattern; 
Example:
SELECT * FROM employees
WHERE name LIKE 'R%';
✅ Explanation:
Retrieves all columns and rows from the employees table where the name starts with 'R'. 
Example:
SELECT * FROM employees
WHERE name LIKE '%t';
✅ Explanation:
Retrieves all columns and rows from the employees table where the name ends with 't'.
Example:
SELECT * FROM employees
WHERE name LIKE '%e%';
✅ Explanation:
Retrieves all columns and rows from the employees table where the name contains 'e'.
Example:
SELECT * FROM employees
WHERE name LIKE '_o%';
✅ Explanation:
Retrieves all columns and rows from the employees table where the name has 'o' as the second character.
Example:
SELECT * FROM employees
WHERE name LIKE 'R____';
✅ Explanation:
Retrieves all columns and rows from the employees table where the name is exactly 5 characters long

------------------------------------------------------------------------------------------------------------------------------------------
Using IN operator
The IN Operator Checks if a column's value matches any value in a given list of values.
it's shorthand for multiple OR conditions.
syntax:
SELECT * FROM table_name
WHERE column_name IN (value1, value2, ...);
Example:
SELECT * FROM employees
WHERE department IN ('Dev', 'QA');      
✅ Explanation:
Retrieves all columns and rows from the employees table where the department is either 'Dev' or 'QA'.

------------------------------------------------------------------------------------------------------------------------------------------

Using AND, OR, NOT operators
AND operator: used to combine multiple conditions in a WHERE clause. All conditions must be true for
the row to be included in the result set.
syntax:
SELECT * FROM table_name
WHERE condition1 AND condition2 AND ...;    
Example:
SELECT * FROM employees
WHERE department = 'Dev' AND salary > 60000;
✅ Explanation:
Retrieves all columns and rows from the employees table where the department is 'Dev' and the salary is greater than 60000.
------------------------------------------------------------------------------------------------------------------------------------------

OR operator: used to combine multiple conditions in a WHERE clause. At least one condition must be true for
the row to be included in the result set.
syntax:
SELECT * FROM table_name
WHERE condition1 OR condition2 OR ...;
Example:
SELECT * FROM employees
WHERE department = 'Dev' OR salary > 60000;
✅ Explanation:
Retrieves all columns and rows from the employees table where the department is 'Dev' or the
salary is greater than 60000.
------------------------------------------------------------------------------------------------------------------------------------------
NOT operator: used to negate a condition in a WHERE clause. It returns true if the condition is false.
syntax:
SELECT * FROM table_name
WHERE NOT condition;
Example:
SELECT * FROM employees
WHERE NOT department = 'Dev';
✅ Explanation:
Retrieves all columns and rows from the employees table where the department is not 'Dev'.
---------------------------------------------------------------------------------------------------------------------------------------------




