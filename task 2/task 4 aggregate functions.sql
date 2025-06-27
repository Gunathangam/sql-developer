use movie_db;

INSERT INTO genres (genre_id, genre_name) VALUES
(2, 'Drama'),
(3, 'Comedy'),
(4, 'Sci-Fi'),
(5, 'Horror');

SELECT CONSTRAINT_NAME
FROM information_schema.KEY_COLUMN_USAGE
WHERE TABLE_NAME = 'movie_actor'
  AND TABLE_SCHEMA = 'movie_db';
  
  ALTER TABLE movie_actor
DROP FOREIGN KEY movie_actor_ibfk_1;

ALTER TABLE movies
MODIFY movie_id INT AUTO_INCREMENT;

ALTER TABLE movie_actor
ADD CONSTRAINT movie_actor_ibfk_1
FOREIGN KEY (movie_id)
REFERENCES movies(movie_id);

ALTER TABLE movie_actor
    DROP FOREIGN KEY movie_actor_ibfk_2;  

ALTER TABLE actors
    MODIFY actor_id INT AUTO_INCREMENT;

ALTER TABLE movie_actor
    ADD CONSTRAINT movie_actor_ibfk_2
    FOREIGN KEY (actor_id) REFERENCES actors(actor_id);

INSERT INTO movies (title, release_year, genre_id) VALUES
  ('Interstellar',        2014, 4),
  ('Titanic',             1997, 2),
  ('The Dark Knight',     2008, 1),
  ('The Conjuring',       2013, 5),
  ('Joker',               2019, 2),
  ('Avengers: Endgame',   2019, 1),
  ('The Hangover',        2009, 3),
  ('Get Out',             2017, 5),
  ('Shutter Island',      2010, 2);

INSERT INTO actors (name) VALUES
  ('Leonardo DiCaprio'),
  ('Matthew McConaughey'),
  ('Kate Winslet'),
  ('Christian Bale'),
  ('Vera Farmiga'),
  ('Joaquin Phoenix'),
  ('Robert Downey Jr.'),
  ('Mark Ruffalo'),
  ('Zach Galifianakis'),
  ('Daniel Kaluuya');

INSERT IGNORE INTO movie_actor (movie_id, actor_id)
SELECT m.movie_id, a.actor_id
FROM   movies m
JOIN   actors a
WHERE
     (m.title = 'Interstellar'       AND a.name = 'Matthew McConaughey')
  OR (m.title = 'Titanic'            AND a.name = 'Leonardo DiCaprio')
  OR (m.title = 'Titanic'            AND a.name = 'Kate Winslet')
  OR (m.title = 'The Dark Knight'    AND a.name = 'Christian Bale')
  OR (m.title = 'The Conjuring'      AND a.name = 'Vera Farmiga')
  OR (m.title = 'Joker'              AND a.name = 'Joaquin Phoenix')
  OR (m.title = 'Avengers: Endgame'  AND a.name = 'Robert Downey Jr.')
  OR (m.title = 'Avengers: Endgame'  AND a.name = 'Mark Ruffalo')
  OR (m.title = 'The Hangover'       AND a.name = 'Zach Galifianakis')
  OR (m.title = 'Get Out'            AND a.name = 'Daniel Kaluuya')
  OR (m.title = 'Shutter Island'     AND a.name = 'Leonardo DiCaprio');

SELECT COUNT(*) AS movies        FROM movies;
SELECT COUNT(*) AS actors        FROM actors;
SELECT COUNT(*) AS links         FROM movie_actor;
SELECT genre_name, COUNT(*) AS total
FROM movies m JOIN genres g ON m.genre_id = g.genre_id
GROUP BY genre_name;

-- TOTAL MOVIES
SELECT COUNT(*) AS total_movies FROM movies;

 -- MOVIES PER GENRE
SELECT g.genre_name, COUNT(*) AS total
FROM   movies m JOIN genres g ON m.genre_id = g.genre_id
GROUP  BY g.genre_name;

-- Average release year
SELECT AVG(release_year) AS avg_year FROM movies;

-- Actor count per movie (only those with >1 actor)
SELECT m.title, COUNT(ma.actor_id) AS actor_count
FROM   movie_actor ma JOIN movies m ON ma.movie_id = m.movie_id
GROUP  BY m.title
HAVING COUNT(ma.actor_id) > 1
ORDER  BY actor_count DESC;

