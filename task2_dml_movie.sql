INSERT INTO actors (actor_id, name) VALUES (4, NULL);


UPDATE movies
SET release_year = 2020
WHERE movie_id = 4;


DELETE FROM movies
WHERE movie_id = 4;
SELECT * FROM movies;
