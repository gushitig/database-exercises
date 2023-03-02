SELECT 1 + 1 AS 1_plus_1;

SELECT CONCAT(first_name, ' ', last_name) AS full_name
FROM employees
LIMIT 25;

# try to keep column names as letters, underscores, and numbers if you need to, but no weird symbols

SELECT CONCAT(first_name, ' ', last_name) AS full_name
FROM employees
ORDER BY full_name
LIMIT 25;
#can order by, group by, or having the alias name too


#table aliases
SELECT employees.emp_no
#once you give a table an alias its easier to call
SELECT e.emp_no
from employees as e;
#try to keep the aliases really short perhaps the first letter or a few


SELECT e.emp_no, CONCAT(e.first_name, ' ', e.last_name) as full_name
from employees as e
ORDER BY full_name;
#We can still use the original column names alongside the aliases
SELECT CONCAT(first_name, ' ', last_name) AS full_name
FROM employees
GROUP BY full_name, last_name
ORDER BY last_name
LIMIT 25;


########Don't use aliases in WHERE clauses.##########


