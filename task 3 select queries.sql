use movie_db
SELECT * FROM movies;

SELECT title, release_year FROM movies;

SELECT * FROM movies
WHERE release_year > 2010;

SELECT * FROM movies
WHERE genre_id = 1 AND release_year >= 2010;

SELECT * FROM movies
WHERE title LIKE 'In%';

SELECT * FROM movies
WHERE release_year BETWEEN 2000 AND 2015;

SELECT * FROM movies
ORDER BY release_year DESC;

SELECT * FROM movies
ORDER BY release_year DESC
LIMIT 3;
