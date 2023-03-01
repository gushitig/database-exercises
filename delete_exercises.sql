USE ymir_christina;




SELECT QUOTE('Albums released after in 1967.');
DELETE FROM albums WHERE release_date = 1967;



SELECT QUOTE('Albums with the genre ''stuff''');
DELETE FROM albums WHERE genre = 'stuff';



SELECT QUOTE('Albums by ''Metallica''.');
DELETE FROM albums WHERE artist = 'Metallica';