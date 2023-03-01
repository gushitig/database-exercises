USE ymir_christina;




SELECT QUOTE('Albums released after 1991.');
SELECT * FROM albums WHERE release_date > 1990;



SELECT QUOTE('Albums with the genre ''disco''');
SELECT * FROM albums WHERE genre = 'disco';



SELECT QUOTE('Albums by ''Whitney Houston'' (...or maybe an artist of your choice).');
SELECT * FROM albums WHERE artist = 'Whitney Houston';