-- --Create Tables
-- -- DROP TABLE IF EXISTS departments;
-- CREATE TABLE departments (
-- 	dept_no VARCHAR (5) PRIMARY KEY,
-- 	dept_name VARCHAR (20)
-- );

-- -- DROP TABLE IF EXISTS titles
-- CREATE TABLE titles (
-- 	title_id VARCHAR (6) PRIMARY KEY NOT NULL,
-- 	title VARCHAR (25)
-- );

-- -- DROP TABLE IF EXISTS employees;
-- CREATE TABLE employees (
-- 	emp_no INT PRIMARY KEY,
-- 	emp_title_id VARCHAR,
-- 	birth_date	VARCHAR NOT NULL,
-- 	first_name VARCHAR NOT NULL,
-- 	last_name VARCHAR NOT NULL,
-- 	sex VARCHAR,
-- 	hire_date VARCHAR NOT NULL	
-- );

-- -- DROP TABLE IF EXISTS salaries
-- CREATE TABLE salaries (
-- 	emp_no INT NOT NULL,
-- 	salary INT NOT NULL
-- );

-- -- DROP TABLE IF EXISTS managers;
-- CREATE TABLE managers (
-- 	dept_no VARCHAR NOT NULL,
-- 	emp_no INT PRIMARY KEY NOT NULL
-- );

-- -- DROP TABLE IF EXISTS dept_employee;
-- CREATE TABLE dept_employee (
-- 	emp_no INT NOT NULL,
-- 	dept_no VARCHAR (5) NOT NULL
-- );

----View tables/Check data import
-- SELECT *
-- FROM employees
-- SELECT *
-- FROM departments
-- SELECT *
-- FROM dept_employee
-- SELECT *
-- FROM managers
-- SELECT *
-- FROM salaries
-- SELECT *
-- FROM titles

---- Create Keys



----Import CSV Data

-- -- 1. List the following details of each employee: employee number, last name, first name, sex, and salary.

SELECT employees.emp_no, last_name, first_name, sex, salaries.salary 
FROM employees
FULL JOIN salaries
on employees.emp_no = salaries.emp_no;

-- -- 2. List first name, last name, and hire date for employees who were hired in 1986.

SELECT first_name, last_name, hire_date 
FROM employees
WHERE employees.hire_date BETWEEN '1986-01-01' AND '1986-12-31'; 


-- -- 3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.

SELECT dept_no, dept_name, emp_no, last_name, first_name
FROM departments
JOIN employees
ON employees.emp_no in (
	SELECT managers.emp_no
	FROM managers
	Where managers.emp_no = employees.emp_no);

 
-- -- 4. List the department of each employee with the following information: employee number, last name, first name, and department name.

SELECT employees.emp_no, last_name, first_name, dept_name
FROM employees
JOIN dept_employee
on employees.emp_no = dept_employee.emp_no
JOIN departments 
on departments.dept_no = dept_employee.dept_no;

-- -- 5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."

SELECT first_name, last_name, sex
FROM employees
WHERE employees.first_name = 'Hercules' AND employees.last_name LIKE 'B%';



-- -- 6. List all employees in the Sales department, including their employee number, last name, first name, and department name.

SELECT employees.emp_no, last_name, first_name, dept_name
FROM employees
JOIN dept_employee
on employees.emp_no = dept_employee.emp_no
JOIN departments 
on departments.dept_no = dept_employee.dept_no
WHERE dept_name = 'Sales';


-- -- 7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.

SELECT employees.emp_no, last_name, first_name, dept_name
FROM employees
JOIN dept_employee
on employees.emp_no = dept_employee.emp_no
JOIN departments 
on departments.dept_no = dept_employee.dept_no
WHERE dept_name = 'Sales' 
and dept_name = 'Development';


-- -- 8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.

SELECT COUNT(last_name), last_name 
FROM employees
GROUP BY last_name;

