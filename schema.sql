-- [1] DROP tables

DROP TABLE IF EXISTS artworks_museums_xref;
DROP TABLE IF EXISTS artworks;
DROP TABLE IF EXISTS museums;
DROP TABLE IF EXISTS artists;

-- [2] CREATE tables
CREATE TABLE museums (
  museum_id   SERIAL PRIMARY KEY,
  museum_name VARCHAR(64) UNIQUE NOT NULL,
  address     VARCHAR(255) NOT NULL,
  city        VARCHAR(64) NOT NULL
);

CREATE TABLE artists (
  artist_id   SERIAL PRIMARY KEY,
  artist_name VARCHAR(128) NOT NULL,
  birth_date  DATE,
  nationality VARCHAR(64), -- should be a FK to a country table
  description TEXT
);



CREATE TABLE artworks (
  art_id    SERIAL PRIMARY KEY,
  art_name  VARCHAR(255) NOT NULL,
  year      DATE,
  category  VARCHAR(64),
  artist_id INT REFERENCES artists(artist_id)
);



CREATE TABLE artworks_museums_xref (
  art_id    INT REFERENCES artworks(art_id),
  museum_id INT REFERENCES museums(museum_id),
  PRIMARY KEY(art_id, museum_id)
);

CREATE INDEX museum_name_idx ON museums (museum_name);
CREATE INDEX artist_name_idx ON artists (artist_name);
CREATE INDEX artwork_name_idx ON artworks (art_name);
