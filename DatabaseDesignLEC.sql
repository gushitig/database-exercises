#have to turn the customers plain language into database schema
    #normalization - avoiding duplicated data

#We'll take a look at two common cases: a one-to-many relationship and a many-to-many relationship

#general guideline on how to start is to look at the nouns
#data needs to persist afterwards so we could use: files or a relational database
#files are inefficient, especially when theres a lot of them

#subject domain - topic of db, ex quotes
#domain expert - expert on the data and structure
#so what should a quotes table have: quote, person who said it, date it was said?
    #brain storm and then clarify w the customer what exactly they want included
    #request example data to start exploring what youll need

#author table and a quotes table
#have to figure out the relationship between the two
#one author can have many quotes, but can a quote have many authors?
#if yes, the relationship is many to many, and this is when we require an associative table
#if no, we need a foreign key still to link the two tables

#It is a common convention to name foreign key columns with the name of the table you are relating to, followed by _id, like in the example below.

#ONE TO MANY RELATIONSHIP


use ymir_christina;

CREATE TABLE authors (
id INT UNSIGNED NOT NULL AUTO_INCREMENT,
first_name VARCHAR(50),
last_name  VARCHAR(100) NOT NULL,
PRIMARY KEY (id)
);

INSERT INTO authors(first_name, last_name) VALUES
('Douglas', 'Adams'),
('Mark', 'Twain'),
('Kurt', 'Vonnegut');


CREATE TABLE quotes (
 id INT UNSIGNED NOT NULL AUTO_INCREMENT,
 content TEXT NOT NULL,
 author_id INT UNSIGNED NOT NULL,
 PRIMARY KEY (id),
 FOREIGN KEY (author_id) REFERENCES authors (id)
);

# Seeds
INSERT INTO quotes (author_id, content)
VALUES ((select id from authors where first_name = 'Douglas' and last_name = 'Adams'),
        'I love deadlines. I love the whooshing noise they make as they go by.');
INSERT INTO quotes (author_id, content)
VALUES ((select id from authors where first_name = 'Douglas' and last_name = 'Adams'),
        'Time is an illusion. Lunchtime doubly so.');
INSERT INTO quotes (author_id, content)
values ((select id from authors where first_name = 'Mark' and last_name = 'Twain'),
        'Clothes make the man. Naked people have little or no influence on society.');
INSERT INTO quotes (author_id, content)
values ((select id from authors where first_name = 'Kurt' and last_name = 'Vonnegut'),
        'The universe is a big place, perhaps the biggest.');
INSERT INTO quotes (author_id, content)
VALUES ((select id from authors where first_name = 'Douglas' and last_name = 'Adams'), 'Don''t Panic.');


#tinytext, mediumtext, longtext
#in general it is bad practice to store files tho, you can put one in there, but its a no no
    #use a cloud accessible file storage for that, its what its made for
#relational databases are meant to be very fast in order to store relational data pieces not files

PRIMARY KEY (id)
#this is the line that establishes the foreign key NOT:
FOREIGN KEY (author_id) REFERENCES authors (id)
#this is just a little mechanism to link them and creates the constraint that we cannot add a quote without linking it to a valid author
#we also cannot delete an author bc it would leave quotes abandoned this is referred to as referential integrity
#primary keys guarantee uniqueness

#why separate the two tables tho? with this particular data wouldnt it have been easier to keep it in one?
    #if we have a million quotes, and a thousand of them are from douglas adams
    #well, now lets add all the authors addresses and photos, now we have to duplicate his address and photo a thousand times and creates a huge mess where its hard to keep track of which data is up to date
#so as a rule of thumb, look for the duplication of data and pull it out into its own table bc you never know what your customer is going to ask for later
#normalizing your database after the creation of your database is NOT the same as going back and changing variable names in your code
    #it will literally break everything, especially your queries

#indexing and normalizing are nist important take always as far as dbes go

#MANY TO MANY RELATIONSHIPS
CREATE TABLE topics (
id INT UNSIGNED NOT NULL AUTO_INCREMENT,
name VARCHAR(255),
PRIMARY KEY (id)
);

INSERT INTO topics(name) VALUES
('Space and Time'),
('Humor'),
('Office Life'),
('Hitchiker''s Guide to the Galaxy');

#customer comes back and wants to add in topics to the quotes
    #topics is a noun so it could/should be another table
        #adding it to the quotes would involve a lot of duplication again, so we go w another table
#go the extra mile to get the db designed right from the beginning
#We would describe the nature of this relationship as many-to-many. A quote has many topics, and a topic can have many quotes. In this scenario, we need to define a separate associative table to relate the two together

CREATE TABLE quote_topic (
quote_id INTEGER UNSIGNED NOT NULL,
topic_id INTEGER UNSIGNED NOT NULL,
FOREIGN KEY (quote_id) REFERENCES quotes(id),
FOREIGN KEY (topic_id) REFERENCES topics(id)
);

INSERT INTO quote_topic(quote_id, topic_id)
VALUES (1, 2), (1, 3), (2, 4), (3, 1),
       (3, 2), (3, 3), (3, 4), (4, 2), (5, 1);

SELECT *
FROM quotes as q
INNER JOIN authors a on q.author_id = a.id
INNER JOIN quote_topic qt on q.id = qt.quote_id
INNER  JOIN topics t on qt.topic_id = t.id;

#if the quotes table is home base, in order to get to topic we first have to go through quote_topic (associative) table first

#diagrams are good reference material to explain the path for you
#right click db > diagrams > tab or popup


#Events and Attendees
#Common Mistakes
#Some common database design mistakes are
    #Having a column on a table whose contents is a string of comma separated values. These should probably be separate rows in a separate table (or an enum).
    #Column names that have numbers at the end. Usually this means you should be putting that data on a separate table.

#Steps
#identify the tables from plain language
    #customers HAVE to participate in the software design bc its a big translation game

#Exercsie
#nouns are not always tables, but can also be fields
#The AdLister is a small scale Craigslist clone where users can post ads for items.
    #nouns: users, items
#Users sign up for the site with an email and password
    #maybe a users table w fields email and pass
#Users create ads with a title and description and category.
    #ads table w title, description, and maybe a separate cat table
#Each ad is associated with the user that created it.
    #
#An ad can be in one or more categories (for example, "help wanted", "giveaway", or "furniture")
    #def a sep cat table



######the foreign key always goes on the MANY side of the table



#database naming conventions
#takes should be pluralized: ads
#primary key should just be called: id
#lowercase typically and underscores for spaces
#junction table should be the singular form of each table combined w an underscore: ad_category
#junction table foreign ids are just the other table underscore id: category_id, ad_id

