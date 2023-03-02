USE ymir_employees;

#part one
#2.
SELECT emp_no, first_name, last_name
FROM employees
WHERE first_name IN ('Irena','Vidya', 'Maya');

#3.
SELECT last_name
FROM employees
WHERE last_name LIKE 'e%';

#4.
SELECT last_name
FROM employees
WHERE last_name LIKE '%q%';


#PART TWO
#1.
SELECT emp_no, first_name, last_name
FROM employees
WHERE first_name OR first_name ='Irena'
   OR first_name ='Vidya'
   OR first_name ='Maya';

#2.
SELECT emp_no, first_name, last_name
FROM employees
WHERE gender = 'M'
AND ( first_name ='Irena'
   OR first_name ='Vidya'
   OR first_name ='Maya');

#3.
SELECT last_name
FROM employees
WHERE last_name LIKE 'e%'
OR last_name LIKE '%e';

#4.
SELECT last_name
FROM employees
WHERE last_name LIKE 'e%'
   AND last_name LIKE '%e';

#5.
SELECT last_name
FROM employees
WHERE last_name LIKE '%q%'
AND last_name NOT LIKE '%qu%' ;