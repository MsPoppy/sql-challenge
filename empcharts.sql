--Create Tables
DROP TABLE IF EXISTS departments;
CREATE TABLE departments (
	dept_no VARCHAR (5) PRIMARY KEY,
 	dept_name VARCHAR (20)
);

DROP TABLE IF EXISTS titles
CREATE TABLE titles (
 	title_id VARCHAR (6) PRIMARY KEY NOT NULL,
	title VARCHAR (25)
);

DROP TABLE IF EXISTS employees;
CREATE TABLE employees (
 	emp_no INT PRIMARY KEY,
 	emp_title_id VARCHAR,
 	birth_date	DATE NOT NULL,
 	first_name VARCHAR NOT NULL,
 	last_name VARCHAR NOT NULL,
 	sex VARCHAR,
 	hire_date DATE NOT NULL	
);

DROP TABLE IF EXISTS salaries
CREATE TABLE salaries (
	emp_no INT NOT NULL,
 	salary INT NOT NULL
FOREIGN KEY(emp_no) REFERENCES employees(emp_no) ON DELETE CASCADE);

DROP TABLE IF EXISTS managers;
CREATE TABLE managers (
 	dept_no VARCHAR NOT NULL,
 	emp_no INT PRIMARY KEY NOT NULL
);

DROP TABLE IF EXISTS dept_employee;
CREATE TABLE dept_employee (
	emp_no INT NOT NULL,
	dept_no VARCHAR (5) NOT NULL
FOREIGN KEY(emp_no) REFERENCES employees(emp_no) ON DELETE CASCADE 
);

----View tables/Check data import
SELECT *
FROM employees

SELECT *
FROM departments
SELECT *
FROM dept_employee
SELECT *
FROM managers
SELECT *
FROM salaries
SELECT *
FROM titles
