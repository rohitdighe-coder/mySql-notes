 SQL - Day 1: Introduction & Setup

Database = A Database is a collection of organized and related data.
           Database store information an organized manner in the form of a table.

 Query for Database
1) showing database = Show database
2) creating database= Create Database < Database name >;

why creating database  = bcoz used for storing ,maintaining and accesing data.
database create a lot of tables to store data.
------------------------------------------------------------------------------------------------------------------------------------------------
RDBMS = Relational Database Management System.

Relational database
.It organizes data into tables rows and colums.The tables are related to each other.

Tables- A structured list of data made up of rows and columns.A true heart of SQL. holds all the data. for example,employee table,student table etc.
Row- A single record in a table.  for example, one employee or one student.All tables are made up of one or more rows.
Column- A single field in a table. All values in a column are of the same data type.All tables are made up of one or more columns.
for example, employee name, employee id, employee address etc.
-----------------------------------------------------------------------------------------------------------------------------------------------
SQl - Structured Query Language
.SQL is a standard language for accessing and manipulating databases.
.SQL is used to communicate with a database.
.SQL can be used to perform tasks such as update data on a database, or retrieve data from a database.
.SQL is a standard language for relational database management systems.
.Most of the database systems like MySQL, MS SQL Server, Oracle, Postgres,
    and MS Access use SQL as their standard database language.
.Most of the database systems are using SQL, but each database system has its own additional proprietary extensions that are usually only used in their system.
.SQL syntax is similar to the English language, which makes it easy to learn and use.
.SQL is case insensitive.
.SQL statements are used to perform tasks such as update data on a database, or retrieve data from a database.
.SQL is an ANSI (American National Standards Institute) standard, but there are many different versions of the SQL language.
.Most of the database systems are using SQL, but each database system has its own additional proprietary extensions that are usually only used in their system.

SQL (Structured Query Language) is the language used to talk to databases.
You use it to:
Store data (INSERT)
Retrieve data (SELECT)
Update data (UPDATE)
Delete data (DELETE)

-------------------------------------------------------------------------------------------------------------------------------------------
 Create Your First Database & Table
CREATE TABLE employees (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  name TEXT NOT NULL,
  department TEXT,
  salary REAL
);

✅ Explanation:

id → unique ID (auto-incremented)
name → employee’s name
department → department name
salary → salary value (float)

 Insert Data into Table
INSERT INTO employees (name, department, salary)
VALUES
('Rohit', 'QA', 55000),
('Neha', 'Dev', 65000),
('Vijay', 'Support', 48000);

✅ Explanation:
Each record = one employee’s data.

Retrieve Data
SELECT * FROM employees;
✅ Shows all columns and rows from the employees table.
---------------------------------------------------------------------------------------------------------
#Practice Problems
1) Create a database named company_db.
crate database company_db;
2) Create a table named departments with the following columns:
   - dept_id (integer, primary key, auto-increment)
   - dept_name (text, not null)
   - location (text)    
create table departments(
   dept_id integer primary key autoincrement,
   dept_name text not null,
   location text
);
3) Insert the following data into the departments table:
   - (1, 'HR', 'New York')
   - (2, 'Engineering', 'San Francisco')
   - (3, 'Marketing', 'Chicago')
insert into departments(dept_name,location)
values
('HR','New York'),
('Engineering','San Francisco'),
('Marketing','Chicago');    
4) Retrieve all columns and rows from the departments table.
select * from departments;
---------------------------------------------------------------------------------------------------------

