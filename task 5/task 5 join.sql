use movie_db;

-- INNER JOIN

SELECT m.title, a.name AS actor_name
FROM movie_actor ma
INNER JOIN movies m ON ma.movie_id = m.movie_id
INNER JOIN actors a ON ma.actor_id = a.actor_id;

-- LEFT JOIN
SELECT m.title, a.name AS actor_name
FROM movies m
LEFT JOIN movie_actor ma ON m.movie_id = ma.movie_id
LEFT JOIN actors a ON ma.actor_id = a.actor_id;

-- RIGHT JOIN

SELECT m.title, a.name AS actor_name
FROM movies m
RIGHT JOIN movie_actor ma ON m.movie_id = ma.movie_id
RIGHT JOIN actors a ON ma.actor_id = a.actor_id;

-- FULL JOIN
SELECT m.title, a.name AS actor_name
FROM movies m
LEFT JOIN movie_actor ma ON m.movie_id = ma.movie_id
LEFT JOIN actors a ON ma.actor_id = a.actor_id

UNION

SELECT m.title, a.name AS actor_name
FROM actors a
LEFT JOIN movie_actor ma ON a.actor_id = ma.actor_id
LEFT JOIN movies m ON ma.movie_id = m.movie_id;


