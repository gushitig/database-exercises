#2
SELECT d.dept_name as `Department Name`, CONCAT(e.first_name, ' ', e.last_name) AS `Department Manager`
FROM departments as d
JOIN dept_manager as dm
    ON dm.dept_no = d.dept_no
JOIN employees AS e
    ON e.emp_no = dm.emp_no
WHERE dm.to_date = '9999-01-01';

#1 Find the name of all departments currently managed by women.
SELECT d.dept_name, CONCAT(e.first_name, ' ', e.last_name) AS dept_mgr
FROM employees as e
JOIN dept_manager as dm
    ON dm.emp_no = e.emp_no
JOIN departments as d
    ON d.dept_no = dm.dept_no
WHERE dm.to_date = '9999-01-01' AND e.gender = 'F';

#1 Find the current titles of employees currently working in the Customer Service department.
SELECT t.title, COUNT(t.title) as total
FROM employees as e
         JOIN dept_emp as de
              ON de.emp_no = e.emp_no
         JOIN titles as t
              ON t.emp_no = de.emp_no
WHERE de.dept_no = 'd009'
AND t.to_date = '9999-01-01'
AND de.to_date = '9999-01-01'
GROUP BY t.title
ORDER BY total DESC;


#1 Find the current salary of all current managers.
SELECT d.dept_name, CONCAT(e.first_name, ' ', e.last_name) AS dept_mgr, s.salary as salary
FROM employees as e
         JOIN dept_manager as dm
              ON dm.emp_no = e.emp_no
         JOIN departments as d
              ON d.dept_no = dm.dept_no
         JOIN salaries as s
              ON s.emp_no = e.emp_no
WHERE dm.to_date = '9999-01-01'
  AND s.to_date = '9999-01-01';




#bonus hint: refer to the employees table twice, once for emp and one for mgr
SELECT CONCAT(e.first_name, ' ', e.last_name) AS employee,
       d.dept_name,
       CONCAT(e2.first_name, ' ', e2.last_name) AS dept_mgr
FROM employees as e
         JOIN dept_emp as de
              ON e.emp_no = de.emp_no
         JOIN departments as d
              ON de.dept_no = d.dept_no
         JOIN dept_manager as dm
              ON d.dept_no = dm.dept_no
         JOIN employees as e2
              ON dm.emp_no = e2.emp_no
WHERE de.to_date = '9999-01-01'
AND dm.to_date = '9999-01-01'
ORDER BY d.dept_name;