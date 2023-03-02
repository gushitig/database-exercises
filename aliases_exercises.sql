USE ymir_employees;

SELECT CONCAT(emp_no, ' - ', last_name, ', ', first_name) AS full_name, birth_date as DOB
FROM employees
GROUP BY full_name, last_name
ORDER BY last_name
    LIMIT 10;