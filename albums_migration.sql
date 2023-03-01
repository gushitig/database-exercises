USE ymir_christina;
DROP TABLE IF EXISTS albums;

CREATE TABLE albums (
        id INT UNSIGNED NOT NULL AUTO_INCREMENT,
        artist VARCHAR(250),
        record_name VARCHAR(350),
        release_date INT,
        sales FLOAT,
        genre VARCHAR(250),
        PRIMARY KEY (id)

);

-- we could call this from the console w: mysql -u codeup_test_user -p < albums_migration.sql
