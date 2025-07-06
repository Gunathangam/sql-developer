DELIMITER $$

CREATE PROCEDURE get_movies_by_genre(IN genreName VARCHAR(100))
BEGIN
    SELECT m.title, m.release_year
    FROM movies m
    JOIN genres g ON m.genre_id = g.genre_id
    WHERE g.genre_name = genreName;
END $$

DELIMITER ;

CALL get_movies_by_genre('Action');

DELIMITER $$

CREATE FUNCTION count_actors(movieId INT)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE actorCount INT;

    SELECT COUNT(*) INTO actorCount
    FROM movie_actor
    WHERE movie_id = movieId;

    RETURN actorCount;
END $$

DELIMITER ;

SELECT title, count_actors(movie_id) AS total_actors
FROM movies;



