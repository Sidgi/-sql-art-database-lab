DROP DATABASE art_db;
CREATE DATABASE art_db;

\c art_db

DROP TABLE IF EXISTS museums_artworks_xref;
DROP TABLE IF EXISTS museums;
DROP TABLE IF EXISTS artists;
DROP TABLE IF EXISTS artworks;


CREATE TABLE artworks (
  id SERIAL PRIMARY KEY,
  title VARCHAR(128) NOT NULL,
  year SMALLINT NOT NULL,
  category VARCHAR(128) NOT NULL,
  artist_id INTEGER REFERENCES artists(id)
);

CREATE TABLE artists (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  birth SMALLINT NOT NULL,
  nationality VARCHAR(128) NOT NULL,
  description VARCHAR(255) NOT NULL
);

CREATE TABLE museums (
  id SERIAL PRIMARY KEY,
  name VARCHAR(128) NOT NULL,
  address VARCHAR(255) NOT NULL,
  city VARCHAR(128) NOT NULL
);

CREATE TABLE museums_artworks_xref(
  museum_id INTEGER REFERENCES museums(id),
  artwork_id INTEGER REFERENCES artworks(id),
  PRIMARY KEY(museum_id, artwork_id)
);
