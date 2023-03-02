use ymir_employees;
#concat

SELECT CONCAT('Hello ', 'Codeup', '!');

SELECT CONCAT(first_name, ' ', last_name, ' ', hire_date)
FROM employees
WHERE first_name = 'Susanne';
#can use this to copy and paste into a spreadsheet

SELECT CONCAT(first_name, ' ', last_name, ' ', hire_date) as full_name
FROM employees
WHERE first_name = 'Susanne';
#can change the column name instead of it printing the concat function

#lots of date and time functions
#yyyy-mm-dd is naturally really good for sorting chronologically and therefore the normal format for databases

SELECT MONTH('2008-02-03');
-- Will return 2

SELECT YEAR('1987-01-01');
-- Will return 1987

SELECT *
FROM employees
WHERE year(birth_date) BETWEEN 1950 AND 1959
  AND month(birth_date) = 7
  AND day(birth_date) = 4;


SELECT NOW();
#returns the current time in YYYY-MM-DD HH:MM:SS format.


SELECT CURDATE();
#returns just the current date with no time information in YYYY-MM-DD format.

SELECT count(*);

#datediff -diff between two dates in a variety of units
# and dateadd - can give a date and add time to it to figure out the new date
# datesubtract is the same but in reverse