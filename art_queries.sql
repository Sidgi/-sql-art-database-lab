-- [1] Do a complete inventory of art and artists in the Whitney Museum.
-- result set (museum_id, museum_name, artwork_id, artwork_name, artist_id, artist_name, artwork_year)
--SELECT * FROM museums
--SELECT * FROM artworks_museums_xref;
SELECT artist_name, art_name FROM artworks
JOIN artists ON artworks.artist_id = artists.artist_id
JOIN artworks_museums_xref ON artworks.art_id = artworks_museums_xref.art_id
JOIN museums ON artworks_museums_xref.museum_id = museums.museum_id
WHERE museum_name = 'Whitney Museum';

-- [2] Add ten more pieces of art to the database by Pablo Picasso
-- (use Wikipedia to get the data, find out which museum the artwork is in and add the museum to the database if necessary)
-- Adding 10 Picaso's artworks
INSERT INTO artworks VALUES 
(DEFAULT, 'Guernica', 1937, 'photography', 2),
(DEFAULT, 'La Vie', 1903, 'photography', 2),
(DEFAULT, 'Old Woman', 1901, 'photography', 2),
(DEFAULT, 'Pierrot', 1918, 'photography', 2),
(DEFAULT, 'Portraint of Gertruda Stein', 1906, 'photography', 2),
(DEFAULT, 'Au lapin Agile', 1905, 'photography', 2),
(DEFAULT, 'The old Guitarist', 1904, 'photography', 2),
(DEFAULT, 'Femme au cafe', 1902, 'photography', 2),
(DEFAULT, 'Nous autres ...', 1921, 'photography', 2),
(DEFAULT, 'Sleaping Peasants', 1919, 'photography', 2);
--Adding missing museums
INSERT INTO museums VALUES 
(DEFAULT, 'Hermitage museum', '38 Palace Embankment', 'Saint Petesburg'),
(DEFAULT, 'Philadelphia museum of Art', '2600 Benjamin Franklin Pkwy,', 'Philadelphia'),
(DEFAULT, 'Metropolitan museum of Art', '1000 5th Ave', 'New York'),
(DEFAULT, 'Museum of Modern Art', '11 W 53rd St', 'New York');

--FIRST art_id SECOND museum_id
--Connecting museums to artworks
INSERT INTO artworks_museums_xref VALUES
((SELECT art_id FROM artworks WHERE art_name LIKE 'Guernica'),3),
((SELECT art_id FROM artworks WHERE art_name LIKE 'La Vie'),4),
((SELECT art_id FROM artworks WHERE art_name LIKE 'Old Woman'),7),
((SELECT art_id FROM artworks WHERE art_name LIKE 'Pierrot'),9),
((SELECT art_id FROM artworks WHERE art_name LIKE 'Portraint of%'),8),
((SELECT art_id FROM artworks WHERE art_name LIKE 'Au lapin%'),8),
((SELECT art_id FROM artworks WHERE art_name LIKE 'The old Guitarist'),4),
((SELECT art_id FROM artworks WHERE art_name LIKE 'Femme%'),6),
((SELECT art_id FROM artworks WHERE art_name LIKE 'Nous autres%'),2),
((SELECT art_id FROM artworks WHERE art_name = 'Sleaping Peasants'),9);

-- [3] List all of the artworks by Pablo Picasso and which museums they are currently in
-- result set: (artwork_id, artwork_name, artwork_year, museum_id, museum_name, museum_city)
SELECT art_name, artist_name, museum_name FROM artworks
JOIN artists ON artworks.artist_id = artists.artist_id
JOIN artworks_museums_xref ON artworks.art_id = artworks_museums_xref.art_id
JOIN museums ON museums.museum_id = artworks_museums_xref.museum_id
WHERE artist_name LIKE 'Pablo%';
-- [4] Oh noes, one of our disgruntled interns just quit; they have left some garbage data in the database. Please hunt down and update the fields.
-- Hint: The artist is correct but the fields are incorrect. (Google is your friend!)
UPDATE artists SET birth_date = 1908 WHERE artist_name LIKE 'Pablo%'; 
-- [5] How many pieces of art does each museum have sorted by year?
-- Hint: Use COUNT
-- result set: (museum_name, artwork_count)
SELECT year,museum_name,COUNT(art_name) 
FROM artworks
JOIN artworks_museums_xref  ON artworks_museums_xref.art_id= artworks.art_id
JOIN museums ON museums.museum_id = artworks_museums_xref.museum_id
GROUP BY museum_name,year
ORDER BY year DESC;

-- [6] Which museum contains the most artworks?
-- result set: (museum_name, artwork_count)
SELECT museum_name, COUNT(art_name)
FROM artworks
JOIN artworks_museums_xref  ON artworks_museums_xref.art_id= artworks.art_id
JOIN museums ON museums.museum_id = artworks_museums_xref.museum_id
GROUP BY museum_name
ORDER BY COUNT(art_name) DESC
LIMIT 1; 
