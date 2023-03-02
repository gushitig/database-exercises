
#The LIMIT clause limits the number of results returned to a number or range you specify.

#SELECT columns FROM table LIMIT count [OFFSET count];

SELECT emp_no, first_name, last_name
FROM employees
WHERE first_name LIKE 'M%'
ORDER BY emp_no
LIMIT 10;


SELECT emp_no, first_name, last_name
FROM employees
WHERE first_name LIKE 'M%'
ORDER BY emp_no
LIMIT 10 OFFSET 10;
#this will start us on page 2
#first page is like OFFSET 0
#limit * pageNumber - limit
# or class example (page # - 1) * limit
#top 5 most recent hires
SELECT *
from employees
ORDER BY hire_date desc
LIMIT 5;

#top 5 longest employed
SELECT *
from employees
ORDER BY hire_date asc
LIMIT 5;

