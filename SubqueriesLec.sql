#Subqueries, also called nested queries, refers to having more than one query expression in a query.

    #syntax:
# SELECT column_a, column_b, column_c
# FROM table_a
# WHERE column_a IN (
#     SELECT column_a
#     FROM table_b
#     WHERE column_b = true
# );


#example
SELECT first_name, last_name, birth_date
FROM employees
WHERE emp_no IN (
    SELECT emp_no
    FROM dept_manager
)
    LIMIT 10;
#this gives the employee numbers from the employees that are managers

#most subqueries situations could be done w a join, but in most cases subqueries are easier to read


#subqueries can present multiple
# INSERT INTO users (name, email, role_id)
# VALUES('fer', 'fer@codeup.com',
#        (SELECT id FROM roles WHERE name = 'commenter')
#       );
