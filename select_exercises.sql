USE ymir_christina;

SELECT QUOTE('The name of all albums by Pink Floyd.');
SELECT record_name FROM albums WHERE artist = 'Pink Floyd';

SELECT QUOTE('The year Sgt. Pepper''s Lonely Hearts Club Band was released.');
SELECT release_date FROM albums WHERE record_name = 'Sgt. Pepper''s Lonely Hearts Club Band';


SELECT QUOTE('The genre for Sgt. Pepper''s Lonely Hearts Club Band.');
SELECT genre FROM albums WHERE record_name = 'Sgt. Pepper''s Lonely Hearts Club Band';

SELECT QUOTE('Which albums were released in the 1990s.');
SELECT record_name FROM albums WHERE release_date > 1989;

SELECT QUOTE('Which albums had less than 20 million certified sales.');
SELECT record_name FROM albums WHERE sales < 20;

SELECT QUOTE('All the albums with a genre of "Rock". Why do these query results not include albums with a genre of "Hard rock" or "Progressive rock"?.');
SELECT record_name FROM albums WHERE genre = 'Rock';
--bc its specifically looking for the string "rock"

