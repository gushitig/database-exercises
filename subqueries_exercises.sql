#1. Find all the employees with the same hire date as employee 101010 using a subquery.

SELECT *
FROM employees
WHERE hire_date IN (
    SELECT hire_date
    FROM employees
    WHERE emp_no = '101010'
);

#2. Find all the titles held by all employees with the first name Aamod.

SELECT title as `Title`
FROM titles
WHERE emp_no IN (
    SELECT emp_no
    FROM employees
    WHERE first_name = 'Aamod'
);

SELECT DISTINCT title as `Title`
FROM titles
WHERE emp_no IN (
    SELECT emp_no
    FROM employees
    WHERE first_name = 'Aamod'
);

#3. Find all the current department managers that are female.
SELECT first_name, last_name
FROM employees
WHERE emp_no IN (
    SELECT emp_no
    FROM dept_manager
    WHERE to_date = '9999-01-01'
)
AND gender = 'F';

#try to get your subqueries to produce the smallest amount of info possible

#BONUS
#1.
SELECT dept_name
FROM departments
WHERE dept_no IN (
    SELECT dept_no
    FROM dept_manager dm2
    INNER join employees on dm2.emp_no = employees.emp_no
    WHERE dm2.to_date = '9999-01-01'
    AND employees.gender = 'F' );


#BONUS 2 hint use = instead of IN
SELECT first_name, last_name
FROM employees
WHERE emp_no = (
    SELECT emp_no
    FROM salaries
    ORDER BY salary DESC
    LIMIT 1
);

