USE ymir_employees;

#2.
SELECT CONCAT(first_name, ' ', last_name) as full_name
FROM employees
WHERE last_name LIKE 'e%'
   AND last_name LIKE '%e'
ORDER BY emp_no;

#3.
SELECT *
FROM employees
WHERE month(birth_date) = 12
  AND day(birth_date) = 25;

#4.
SELECT *
FROM employees
WHERE year(hire_date) BETWEEN 1990 AND 1999
  AND month(birth_date) = 12
  AND day(birth_date) = 25;

#5.
SELECT *
FROM employees
WHERE year(hire_date) BETWEEN 1990 AND 1999
  AND month(birth_date) = 12
  AND day(birth_date) = 25
ORDER BY birth_date, hire_date DESC;

#6.
SELECT *, DATEDIFF(CURDATE(), hire_date) as days_worked
FROM employees
WHERE year(hire_date) BETWEEN 1990 AND 1999
  AND month(birth_date) = 12
  AND day(birth_date) = 25;