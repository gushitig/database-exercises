USE ymir_employees;

#smaller tables are more efficient and easier to read, so sometimes we need to bring info together from different tables, and indexes/indicies are PART OF how we do this

    #We use indexes on almost every table we create. At the very least, we are going to set a primary key, or a unique identifier for each row, much like a row number in a spreadsheet. This will give us the ability to easily reference the data in that row, and MySQL will make sure there are never duplicates.

        #linear searches are the worst kind of search bc theyre very slow
        #we can make indexes by any of the fields ex: socials or dob
        #if you dont have indexes then the db will perform a linear search (bad)
        #need to know what fields youre going to be searching by bc they need to have indexes
        #there is over head tho. when you create a record it needs to get an index, when you delete it the index needs to be deleted
        #ask users/employees which fields you need to be able to search one
            #theyre gonna change their minds a lot and thats ok bc you can add or remove idndexes whenever

    #number one reason that a db is slow is bc they are not indexed on the fields your searching



    #Typically we add the PRIMARY KEY index on our id column, along with AUTO_INCREMENT.
        #user doesnt need the key, its for you on the back end

CREATE TABLE quotes (
id INT NOT NULL AUTO_INCREMENT,
author VARCHAR(50) NOT NULL,
content VARCHAR(240) NOT NULL,
PRIMARY KEY (id)
);

#most tables have one primary key called id, usually ints, but you need to know about how many entries youre gonna have to make sure int will cover it
#performing queries on the id will be very fast
#if you delete all the records, the primary key does not automatically reset, but there is a way to tell it to do that

#its ok to give primary keys explicit values so long as its nt a duplicate

##UNIQUE

#UNIQUE indexes work very similar to primary keys; however, unique indexes are not limited to 1 per table. If we need to add a constraint on a column to make sure there are not duplicates, like email addresses in a user database, then the UNIQUE constraint can be added to the column.

ALTER TABLE quotes
ADD UNIQUE (content);
#this makes it so the quotes have to be unique



#Multiple-Column Indexes

CREATE TABLE authors (
                         id INT NOT NULL AUTO_INCREMENT,
                         first_name VARCHAR(100) NOT NULL,
                         last_name VARCHAR(100) NOT NULL,
                         PRIMARY KEY (id),
                         UNIQUE (first_name, last_name)
);
#this last line means we can have multiple bobs and multiple smiths but only one bob smith

