-- =====================================================================
-- Unit 4 — Build and Fill Your Database
-- Client: Music
-- Database Applications Development · MCCC
--
-- Rename this file unit4_lastname.sql before you start.
-- Use unit4_Music_Data.xlsx for the columns, keys, and data rows.
--
-- Name:
-- =====================================================================


-- =====================================================================
-- PART 1 — DROP the tables (last table first)
-- Order: playlist_songs, songs, playlists, albums, artists
-- =====================================================================

DROP TABLE IF EXISTS playlist_songs;
DROP TABLE IF EXISTS songs;
DROP TABLE IF EXISTS playlists;
DROP TABLE IF EXISTS albums;
DROP TABLE IF EXISTS artists;

-- =====================================================================
-- PART 2 — CREATE the tables (in this order)
-- Put a comment above each table:  -- tablename: one row = ...
-- Add at least two CHECK rules of your own.
-- =====================================================================

-- artists

CREATE TABLE artists(
artist_name TEXT NOT NUll PRIMARY KEY,
artist_country TEXT
);

-- albums

CREATE TABLE albums(
	album_id TEXT PRIMARY KEY NOT NULL,
	album_name TEXT NOT NULL,
	album_release_date TEXT
	
);

-- playlists

CREATE TABLE playlists(
	playlist_id TEXT PRIMARY KEY NOT NULL,
	playlist_name TEXT NOT NULL,
	playlist_genre TEXT,
	CHECK (playlist_genre IN ('r&b', 'pop', 'rock'))
);

-- songs

CREATE TABLE songs(
	track_id TEXT PRIMARY KEY NOT NULL,
    song_name TEXT NOT NULL,
    popularity INTEGER,
    duration_ms INTEGER,
    danceability REAL,
    energy REAL,
    artist_name TEXT NOT NULL REFERENCES artists (artist_name),
    album_id TEXT NOT NULL REFERENCES albums (album_id),
	CHECK (danceability BETWEEN 0 AND 1)
);

-- playlist_songs

CREATE TABLE playlist_songs(
	playlist_id TEXT NOT NULL REFERENCES playlists (playlist_id),
    track_id TEXT NOT NULL REFERENCES songs (track_id),
    PRIMARY KEY (playlist_id, track_id)
);


-- =====================================================================
-- PART 3 — INSERT the four rows for each table (same order as Part 2)
-- =====================================================================

-- artists

INSERT INTO artists(artist_name, artist_country) VALUES
('Drake', 'Canada'),
('Ariana Grande', 'USA'),
('Billie Eilish', 'USA'),
('Dua Lipa', 'UK');

-- albums

INSERT INTO albums(album_id, album_name, album_release_date) VALUES
('1ATL5GLyefJaxhQzSPVrLX', 'Scorpion', '2018-06-29'),
('3tx8gQqWbGwqIGZHqDNrGe', 'Sweetner', '2018-08-17'),
('0S0KGZnfBGSIssfF54WSJh', 'WHEN WE ALL FALL ASLEEP, WHERE DO WE GO?', '2019-03-29'),
('01sfgrNbnnPUEyz6GZYlt9', 'Dua Lipa (Deluxe)', '2017-06-02');

-- playlists

INSERT INTO playlists(playlist_id, playlist_name, playlist_genre) VALUES
('1Sc7bobknESH7SXQcnmoX5', 'Hip pop', 'r&b'),
('222nc9tKxKhfZ2GBrOpwH3', 'Post pop teen', 'pop'),
('5Go0Jsxj1UnsU7Om841BEo', 'Permanent Wave', 'rock'),
('7ENISpOJhocpMJVcGb0qcT', "Today's Hits (Clean)", 'r&b');

-- songs

INSERT INTO songs(track_id, song_name, popularity, duration_ms, danceability, energy, artist_name, album_id) VALUES
('6DCZcSspjsKoFjzjrWoCdn', "God's Plan", 86, 198973, 0.754, 0.449, 'Drake', '1ATL5GLyefJaxhQzSPVrLX'),
('2qT1uLXPVPzGgFOx4jtEuo', 'no tears left to cry', 83, 205920, 0.699, 0.713, 'Ariana Grande', '3tx8gQqWbGwqIGZHqDNrGe'),
('2Fxmhks0bxGSBdJ92vM42m', 'bad guy', 95, 194088, 0.701, 0.425,	'Billie Eilish', '0S0KGZnfBGSIssfF54WSJh'),
('2ekn2ttSfGqwhhate0LSR0', 'New Rules', 83, 209320, 0.762, 0.7,	'Dua Lipa', '01sfgrNbnnPUEyz6GZYlt9');


-- playlist_songs

INSERT INTO playlist_songs(playlist_id, track_id) VALUES
('1Sc7bobknESH7SXQcnmoX5', '6DCZcSspjsKoFjzjrWoCdn'),
('222nc9tKxKhfZ2GBrOpwH3', '2qT1uLXPVPzGgFOx4jtEuo'),
('5Go0Jsxj1UnsU7Om841BEo', '2Fxmhks0bxGSBdJ92vM42m'),
('7ENISpOJhocpMJVcGb0qcT', '2ekn2ttSfGqwhhate0LSR0');



-- =====================================================================
-- PART 4 — CHECK YOUR WORK: SELECT * FROM each table
-- =====================================================================

SELECT * FROM artists;
SELECT * FROM albums;
SELECT * FROM playlists;
SELECT * FROM songs;
SELECT * FROM playlist_songs;


-- Run the whole script twice. No errors both times?
-- Write Changes, then commit this file and your .db file.