CREATE TABLE friends(
    id INTEGER PRIMARY KEY,
    name TEXT UNIQUE,
    birthday DATE
);

INSERT INTO friends (id, name, birthday)
VALUES (1, 'Ororo Munroe', 'May 30th, 1940');

SELECT * FROM friends;

INSERT INTO friends (id, name, birthday)
VALUES (2, 'Ororo Munroe 2', 'May 29th, 1941');

INSERT INTO friends (id, name, birthday)
VALUES (3, 'Ororo Munroe 3', 'May 28th, 1942');

UPDATE friends
SET name = 'Storm'
WHERE id = 1;

ALTER TABLE friends
ADD COLUMN email TEXT;

UPDATE friends
SET email = 'storm@codecademy.com'
WHERE id = 1;

DELETE FROM friends
WHERE name = "Storm";

-- DROP TABLE friends;