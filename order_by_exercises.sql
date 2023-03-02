USE ymir_employees;

#part one
#2.
SELECT emp_no, first_name, last_name
FROM employees
WHERE first_name IN ('Irena','Vidya', 'Maya')
ORDER BY first_name ASC;

#3.
SELECT emp_no, first_name, last_name
FROM employees
WHERE first_name IN ('Irena','Vidya', 'Maya')
ORDER BY first_name ASC, last_name ASC;

#4.
SELECT emp_no, first_name, last_name
FROM employees
WHERE first_name IN ('Irena','Vidya', 'Maya')
ORDER BY last_name ASC, first_name ASC;

#5.
SELECT emp_no, last_name
FROM employees
WHERE last_name LIKE '%e%'
ORDER BY emp_no;

SELECT last_name
FROM employees
WHERE last_name LIKE 'e%'
   OR last_name LIKE '%e'
ORDER BY emp_no;

SELECT last_name
FROM employees
WHERE last_name LIKE 'e%'
  AND last_name LIKE '%e'
ORDER BY emp_no;




