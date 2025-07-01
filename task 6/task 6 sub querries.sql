use movie_db;

SELECT 
  m.title,
  (SELECT COUNT(*) 
   FROM movie_actor ma 
   WHERE ma.movie_id = m.movie_id) AS actor_count
FROM movies m;

SELECT * FROM movies
WHERE genre_id = (
  SELECT genre_id FROM movies WHERE title = 'Inception'
);

SELECT name FROM actors 
WHERE actor_id IN (
  SELECT actor_id FROM movie_actor 
  WHERE movie_id IN (
    SELECT movie_id FROM movies WHERE release_year = 2010
  )
);

SELECT * FROM movies m
WHERE EXISTS (
  SELECT 1 FROM movie_actor ma WHERE ma.movie_id = m.movie_id
);

SELECT AVG(actor_count) AS avg_actors_per_movie
FROM (
  SELECT movie_id, COUNT(*) AS actor_count
  FROM movie_actor
  GROUP BY movie_id
) AS movie_actor_counts;


