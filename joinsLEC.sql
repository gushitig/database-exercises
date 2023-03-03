USE ymir_christina;

#smaller tables are more efficient and easier to read, so sometimes we need to bring info together from different tables, and indexes/indicies are PART OF how we do this

    #FOREIGN KEY - links the two tables

    # JOIN tables, usually based on a foreign key relationship. The process of joining will allow us to obtain query results from more than one table in a single query. There are different types of joins, and those different types give us a lot of flexibility in the actual query results. We will be discussing the following types of joins:

        JOIN aka INNER JOIN
        LEFT JOIN
        RIGHT JOIN


    #join syntax
# SELECT columns
# FROM table_a as A
# JOIN table_b as B ON A.id = B.fk_id;

#inner join/basic join
#For a basic join, we can expect that we will get only the results where both the left and right tables have values for their respective keys that are mentioned in the ON part of the query

SELECT *
FROM users as u
INNER JOIN roles ON u.role_id = roles.id;
#telling the db that the role id on the users table HAS to match the role table id



#left join
#LEFT JOIN is used when you want to retrieve all the records from the left table, regardless of whether or not they have a corresponding record in the right table

SELECT users.name AS user_name, roles.name AS role_name
FROM users
LEFT JOIN roles ON users.role_id = roles.id;
#so we are including all the users even the ones who dont have a role

#if the employer askes if we have any users without a role
#exclusive left join
SELECT users.name AS user_name, roles.name AS role_name
FROM users
LEFT JOIN roles ON users.role_id = roles.id
WHERE users.role_id IS NULL;



#right join
#A RIGHT JOIN is used when you want to retrieve all the records from the right table, regardless of whether or not they have a corresponding record in the left table. The reason that RIGHT JOIN is not used as often is because a RIGHT JOIN can be rewritten as a LEFT JOIN by changing the order of the tables in the query

SELECT users.name AS user_name, roles.name AS role_name
FROM users
RIGHT JOIN roles ON users.role_id = roles.id;

#REWRITTEN AS A LEFT JOIN:
SELECT users.name as user_name, roles.name as role_name
FROM roles
LEFT JOIN users ON users.role_id = roles.id;


#Associative Tables and Joins
#aka junction or helper tables
#contains the records that describe the relationships betweent he two tables
#so if our users could hold multiple roles, we need to add a junction table
#bob would have two entries in the junction table w his user id of 1 with a role id of 1(admin) and a second entry w a user id of 1 and a role id of 3(reviewer)

SELECT CONCAT(e.first_name, ' ', e.last_name) AS full_name, d.dept_name
FROM employees as e
         JOIN dept_emp as de
              ON de.emp_no = e.emp_no
         JOIN departments as d
              ON d.dept_no = de.dept_no
WHERE de.to_date = '9999-01-01' AND e.emp_no = 10001;