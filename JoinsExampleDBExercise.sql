#3 join
SELECT users.name as user_name, roles.name as role_name
FROM users
JOIN roles ON users.role_id = roles.id;

#3 left join
SELECT users.name AS user_name, roles.name AS role_name
FROM users
LEFT JOIN roles ON users.role_id = roles.id;


#3 right join
SELECT users.name AS user_name, roles.name AS role_name
FROM users
RIGHT JOIN roles ON users.role_id = roles.id;

#4
SELECT COUNT(roles.name) AS user_count, roles.name AS role_name
FROM users
RIGHT JOIN roles ON users.role_id = roles.id
GROUP BY roles.name;




