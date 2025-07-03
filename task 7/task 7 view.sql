use movie_db;

CREATE VIEW view_movie_genre AS
SELECT 
    m.movie_id,
    m.title,
    m.release_year,
    g.genre_name
FROM movies m
JOIN genres g ON m.genre_id = g.genre_id;

SELECT * FROM view_movie_genre;

CREATE VIEW view_movie_actor AS
SELECT 
    m.title AS movie_title,
    a.name AS actor_name
FROM movies m
JOIN movie_actor ma ON m.movie_id = ma.movie_id
JOIN actors a ON ma.actor_id = a.actor_id;

SELECT * FROM view_movie_actor WHERE actor_name LIKE '%Leonardo%';

CREATE VIEW view_genre_movie_count AS
SELECT 
    g.genre_name,
    COUNT(m.movie_id) AS total_movies
FROM genres g
LEFT JOIN movies m ON g.genre_id = m.genre_id
GROUP BY g.genre_name;

SELECT * FROM view_genre_movie_count ORDER BY total_movies DESC;