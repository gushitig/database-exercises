USE ymir_employees;

#Grouping results based on data in columns allows us to remove duplicates, much like using DISTINCT.
# We can also use GROUP BY in combination with aggregate functions.

#syntax
# SELECT column FROM table GROUP BY column_name;

SELECT DISTINCT first_name
FROM employees;

# OR W GROUP BY

SELECT first_name, COUNT(*)
FROM employees
GROUP BY first_name;
#asked for count per first name group

SELECT last_name, first_name, COUNT(*) as count_people
FROM employees
GROUP BY last_name, first_name;
#count is a computed column

#to find the people whose names match
SELECT last_name, first_name, COUNT(*) as count_people
FROM employees
GROUP BY last_name, first_name
WHERE count_people > 1;
#where wont work on a computed column
#can use HAVING instead on computed columns

SELECT last_name, first_name, COUNT(*) as count_people
FROM employees
GROUP BY last_name, first_name
HAVING count_people > 1;


SELECT COUNT(first_name)
FROM employees;
#gives us the record counts, counts all the first name values

SELECT COUNT(DISTINCT first_name)
FROM employees;
#gives us the number of distinct first names


#The COUNT() function will be the one you used most frequently, but there are many others such as SUM(), AVG(), MIN() and MAX().

#use group by w aggregate functions




