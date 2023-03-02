USE ymir_employees;

#2.
SELECT DISTINCT last_name
FROM employees
ORDER BY last_name DESC
LIMIT 10;

#3.
SELECT emp_no
FROM salaries
ORDER BY salary desc
LIMIT 5;

#4.
SELECT emp_no
FROM salaries
ORDER BY salary desc
LIMIT 5 OFFSET 45;
