USE ymir_christina;

CREATE TABLE user (
id INT UNSIGNED NOT NULL AUTO_INCREMENT,
email VARCHAR(50),
pass  VARCHAR(20) NOT NULL,
PRIMARY KEY (id)
);


INSERT INTO user(email, pass) VALUES
('nova@gmail.com', 'SuP3r'),
('neptune@gmail.com', 'w4trR'),
('zeus@gmail.com', 'lightn11n'),
('karen@gmail.com', 'restingB17chf4c3'),
('zeb@gmail.com', 'zebbeneezer'),
('sasha@gmail.com', 'r0o0un6');

CREATE TABLE ads (
id INT UNSIGNED NOT NULL AUTO_INCREMENT,
title VARCHAR(100),
description VARCHAR(500) NOT NULL,
PRIMARY KEY (id)
);

ALTER TABLE ads
ADD Price INT;

# ALTER TABLE ads
# ADD CONSTRAINT FK_user_id INT UNSIGNED NOT NULL,
# FOREIGN KEY (FK_user_id) REFERENCES user (id);

INSERT INTO ads(title, description, price) VALUES
('PS2', 'Really great condition for age. Two controllers and Spyro included.', 100),
('Bookshelf', 'Solid Oak, 5 shelves. Must bring someone with you to help load.', 150),
('2014 Nissan Versa Note S', 'Fair condition, 130,000 miles, brand new tires', 4200),
('2022 Santa Cruz Bronson', 'Carbon, mullet set up, 150 mm travel, Fox 36 factory fork', 5000),
('Sawsall', 'Dewalt sawsall, lightly used on foam overspray, comes with one used and one new blade', 50),
('LoTR Volumes 1 -3 ', 'Read once, well taken care of, collectors edition', 50);

INSERT INTO ads(title, description, price, user_id) VALUES
('ipod mini', 'Still works!!', 20, 5),
('Gaming headset', 'Doesnt fit my head, so basically new', 100, 5);


CREATE TABLE category (
id INT UNSIGNED NOT NULL AUTO_INCREMENT,
cat VARCHAR(100),
PRIMARY KEY (id)
);

INSERT INTO category(cat) VALUES
('Help Wanted'),
('FREE'),
('Furniture'),
('Appliances'),
('Cars'),
('Bikes'),
('Books'),
('Electronics'),
('Household'),
('Jewelery'),
('Camping'),
('Tools'),
('General/Misc');



CREATE TABLE ads_category (
ads_id INTEGER UNSIGNED NOT NULL,
category_id INTEGER UNSIGNED NOT NULL,
FOREIGN KEY (ads_id) REFERENCES ads(id),
FOREIGN KEY (category_id) REFERENCES category(id)
);


#Queries
#For a given ad, what is the email address of the user that created it?
SELECT user.email
FROM user
JOIN ads a ON user.id = a.user_id
WHERE a.id = 2;

#For a given ad, what category, or categories, does it belong to?
SELECT cat
FROM category
JOIN ads_category ac on category.id = ac.category_id
JOIN ads a on ac.ads_id = a.id
WHERE a.id = 2;

#For a given category, show all the ads that are in that category.
SELECT *
FROM ads
JOIN ads_category ac on ads.id = ac.ads_id
JOIN category c on ac.category_id = c.id
WHERE c.cat = 'Electronics';

#For a given user, show all the ads they have posted.
SELECT *
FROM ads a
JOIN user u ON u.id = a.user_id
WHERE u.id = 5;
