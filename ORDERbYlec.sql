#The ORDER BY clause allows us to specify the order in which we wish to view our data.


#thi is the form
SELECT column FROM table ORDER BY column_name [ASC|DESC];

SELECT first_name, last_name
FROM employees
ORDER BY last_name;
#default is ascending

SELECT first_name, last_name
FROM employees
ORDER BY last_name DESC;
#this will make it descending

SELECT first_name, last_name
FROM employees
ORDER BY last_name DESC, first_name ASC;
#this will give all the the last names from the zs first, but sort the first names of all the smiths by as first

SELECT first_name, last_name
FROM employees
WHERE first_name like 'sus%'
ORDER BY last_name DESC, first_name ASC;

