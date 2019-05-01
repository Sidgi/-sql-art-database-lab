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

-- [3] List all of the artworks by Pablo Picasso and which museums they are currently in
-- result set: (artwork_id, artwork_name, artwork_year, museum_id, museum_name, museum_city)

-- [4] Oh noes, one of our disgruntled interns just quit; they have left some garbage data in the database. Please hunt down and update the fields.
-- Hint: The artist is correct but the fields are incorrect. (Google is your friend!)

-- [5] How many pieces of art does each museum have sorted by year?
-- Hint: Use COUNT
-- result set: (museum_name, artwork_count)

-- [6] Which museum contains the most artworks?
-- result set: (museum_name, artwork_count)
