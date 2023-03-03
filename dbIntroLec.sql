-- //Data types -
--     //INT - Any number without a decimal point.
--     //FLOAT - A number with decimal values, but which can sometimes be less accurate. You can use DOUBLE instead to increase the precision.
--     //DECIMAL - (length, precision) length number of integers its going to have, precision is amount of decimal places to the right of the decimal
--     //ex allowed: 99.99, 4.50, -88.10
--     //ex not allowed: 100.00, 7.134
--
--     //unsigned - cannot be negative from 0 to 4,294,967,295, common w ids bc you cant have a negative id
--
--     //boolean - TINYINT - -128 to 127 and treats 0 as false and 1 as true
--
--
--
--     //String types
--     //CHAR(length) — takes a parameter. A string with a fixed number of characters, where length can be from 1 to 255.
--     //ex CHAR(2) states are only 2 chars long, CHAR(5) zip codes are only 5 chars
--
--     //VARCHAR(length) — For strings where the length could vary up to some maximum number. VARCHAR columns are probably the most common type of column you will use in your database tables. Although VARCHAR lengths can go up to 65,535, if you need more than 255 characters consider using TEXT instead.
--
--     //TEXT -  A large block of characters that can be any length. Only use TEXT columns for very large blocks of text, like the full text of an article, or the pages of a book.
--
--
--     //date types
--     //DATE — A date value without any time. Typically MySQL displays dates as YYYY-MM-DD.
--     //TIME — A time down to the seconds. MySQL uses 24-hour times.
--     //DATETIME — A combined date and time value. DATETIME does not store any timezone information and will typically display information in the format YYYY-MM-DD HH:MM:SS
--     //uses utc but are ways of changing it if ya want
--
--
--     //null
--     //means something is just not there, absence of value
--
--     //MySQL commands are typically written in all caps
--     //NOT NULL means that category at min must have an entry
--
--     //MySQL is typically worked w in the console, but adminer is a gui to learn and see what what we're creating in real time
--
--
--     //select shows whats inside the tables
--
--     //PRIMARY KEYS - used a lot for ids, but each value must be unique, cannot be null, only on in a table
--
--
--     //Default values can be declared
--     /*CREATE TABLE quotes (
--             id INT UNSIGNED NOT NULL AUTO_INCREMENT,
--             author_first_name VARCHAR(50) DEFAULT 'NONE',
--     author_last_name  VARCHAR(100) NOT NULL,
--     content TEXT NOT NULL,
--     PRIMARY KEY (id)
-- );*/
--
--     //you typically want the ids to be created by mtSQL not the user so you can use id INT UNSIGNED NOT NULL AUTO_INCREMENT
--     //to auto increment nd assign
--
--
--
--     //showing tables
--     //SHOW TABLES;
--
--
--     // command to show the structure of a table is DESCRIBE.
--     //DESCRIBE quotes;
--
--
--     //if we need to get rid of a table we use the DROP TABLE command.
--     //DROP TABLE quotes;
--     //DROP TABLE IF EXISTS quotes; if youre creating a db using a migration file that creates tables on its own
--
--     //CREATE TABLE IF NOT EXISTS quotes (
--     //    ...
--     //);
--
--
--     //mysql -u USERNAME -p -t < filename.sql
--
--
--     //USE lola;
--     //SHOW TABLES;
--
--
--
--
--
--
--
--
--     //BASIC STATEMENTS
--     // C R U D
--     //CREATE, READ, UPDATE, DELETE
--
--     //INSERT - create
--     //SELECT - read
--     //UPDATE - update
--     //DELETE - delete
--
--
--     //insert
--     //INSERT INTO table_name (field1, field2, ...)
--     //VALUES ('value1', 'value2', ...);
--     //INSERT INTO quotes (author_first_name, author_last_name, content)
--     //VALUES ('Douglas', 'Adams',    'Time is an illusion. Lunchtime doubly so.'),
--     //       ('Mark',    'Twain',    'Clothes make the man. Naked people have little or no influence on society.'),
--     //       ('Kurt',    'Vonnegut', 'The universe is a big place, perhaps the biggest.');
--
--     //If you need to put a single quote in a string, you can escape it, (\') or you can use two single quotes in a row ('') like the following:
--     //INSERT INTO quotes (author_first_name, author_last_name, content)
--     //VALUES ('Douglas', 'Adams', 'Don''t Panic.');
--
--
-- //select
--       //SELECT column1, column2, ... FROM table_name;
-- //SELECT author_last_name, content FROM quotes;
-- //will show last name and content
    //* will show the whole table
    //SELECT * FROM quotes;

    //where clause
    //SELECT column1, column2, ...
    //FROM table_name
    //WHERE column_name = 'value';

    //SELECT * FROM quotes WHERE author_last_name = 'Adams';

    //Also remember, the guaranteed fastest and most precise way to find a single record in a table is to use the table's primary key:
    //SELECT * FROM quotes WHERE id = 5;


    //Operator	Description
    //=	- Equal
    //!= or <> - Not equal
    //<	- Less than
    //>	- Greater than
    //<= -	Less than or equal to
    //>= -	Greater than or equal to
    //BETWEEN value1 AND value2	- Greater than or equal to value1 and less than or equal to value2

    //ex SELECT * FROM quotes WHERE id < 2;

    //Miscellaneous Output - can force output to appear




    //update - command to modify existing data in a table
    //UPDATE table_name
    //SET column1 = 'value1', column2 = 'value2', ...
    //WHERE columnA = 'valueA';

    //ex:
    // UPDATE quotes
    //SET author_first_name = 'Samuel', author_last_name = 'Clemens'
    //WHERE id = 4;




    //delete - remove records from a table
    //DELETE FROM table_name WHERE column_name = 'value';
    //ex: DELETE FROM quotes WHERE id = 3;
    //it doesnt give feedback when deleting and you cant get it back


    //truncate - remove all the records from a table and keep the skeleton
    //TRUNCATE table_name;
