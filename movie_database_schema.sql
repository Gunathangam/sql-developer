SELECT * FROM movie_db.actors;
use movie_db
DROP TABLE IF EXISTS movie_actor;
DROP TABLE IF EXISTS movies;
DROP TABLE IF EXISTS genres;
DROP TABLE IF EXISTS actors;
DROP TABLE IF EXISTS directors;
CREATE TABLE directors (
    director_id INT PRIMARY KEY,
    name TEXT
);
CREATE TABLE actors (
    actor_id INT PRIMARY KEY,
    name TEXT
);
CREATE TABLE movies (
    movie_id INT PRIMARY KEY,
    title TEXT,
    release_year INT,
    genre_id INT,
    FOREIGN KEY (genre_id) REFERENCES genres(genre_id)
);
CREATE TABLE genres (
    genre_id INT PRIMARY KEY,
    genre_name TEXT
);
INSERT INTO genres VALUES (1, 'Action');
INSERT INTO movies VALUES (1, 'Inception', 2010, 1);
INSERT INTO actors VALUES (1, 'Leonardo DiCaprio');
INSERT INTO directors VALUES (1, 'Christopher Nolan');
DROP TABLE IF EXISTS movie_actor;
CREATE TABLE movie_actor (
    movie_id INT,
    actor_id INT,
    PRIMARY KEY (movie_id, actor_id),
    FOREIGN KEY (movie_id) REFERENCES movies(movie_id),
    FOREIGN KEY (actor_id) REFERENCES actors(actor_id)
);
INSERT INTO movie_actor (movie_id, actor_id)
VALUES (1, 1);
INSERT INTO actors (actor_id, name) VALUES (2, 'Tom Hardy');
INSERT INTO movies (movie_id, title, release_year, genre_id) 
VALUES (2, 'The Revenant', 2015, 1);
INSERT INTO movie_actor (movie_id, actor_id) VALUES (2, 1);
INSERT INTO movie_actor (movie_id, actor_id) VALUES (2, 2);





