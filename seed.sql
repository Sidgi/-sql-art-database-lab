-- Don't name the database in the file
-- \c art_db

DELETE FROM museums_artworks_xref;
DELETE FROM artists;
DELETE FROM artworks;
DELETE FROM museums;

INSERT INTO museums VALUES (DEFAULT, 'Whitney Museum', '99 Gansevoort Street', 'New York');
INSERT INTO museums VALUES (DEFAULT, 'Jewish Museum', '1109 Fifth Avenue', 'New York');
INSERT INTO museums VALUES (DEFAULT, 'Solomon R. Guggenheim Museum', '1071 Fifth Avenue', 'New York');

INSERT INTO artists VALUES (DEFAULT, 'Diane Arbus', 1923, 'American', 'Diane Arbus was an American photographer noted for photographs of marginalized people.');
INSERT INTO artists VALUES (DEFAULT, 'Pablo Picasso', 1881, 'French', 'Pablo Ruiz Picasso was a Spanish painter, sculptor, printmaker, ceramicist, stage designer, poet and playwright who spent most of his adult life in France.');
INSERT INTO artists VALUES (DEFAULT, 'Edouard Manet', 1832, 'French', 'Édouard Manet was a French painter.');

INSERT INTO artworks VALUES(DEFAULT, 'Two Boys Smoking in Central Park', 1963, 'photography', 1);
INSERT INTO artworks VALUES(DEFAULT, 'Les Demoiselles dAvignon', 1907, 'painting', 3);
INSERT INTO artworks VALUES(DEFAULT, 'The Weeping Woman', 1937, 'painting', 2);
INSERT INTO artworks VALUES(DEFAULT, 'Blah Blah Blah', 1945, 'painting', 3);
INSERT INTO artworks VALUES(DEFAULT, 'I quit this crappy museum', 1965, 'painting', 3);

INSERT INTO museums_artworks_xref VALUES (1, 1);
INSERT INTO museums_artworks_xref VALUES (1, 2);
INSERT INTO museums_artworks_xref VALUES (1, 3);
INSERT INTO museums_artworks_xref VALUES (1, 4);
INSERT INTO museums_artworks_xref VALUES (1, 5);
INSERT INTO museums_artworks_xref VALUES (3, 2);
INSERT INTO museums_artworks_xref VALUES (2, 2);
