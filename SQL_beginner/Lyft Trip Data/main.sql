-- CREATE TABLES
CREATE TABLE cars (
    id INTEGER,
    model TEXT,
    OS TEXT,
    status TEXT,
    trips_completed INTEGER
);

CREATE TABLE riders (
    id INTEGER,
    first TEXT,
    last TEXT,
    username TEXT,
    rating INTEGER,
    total_trips INTEGER,
    referred INTEGER
);

CREATE TABLE riders2 (
    id INTEGER,
    first TEXT,
    last TEXT,
    username TEXT,
    rating INTEGER,
    total_trips INTEGER,
    referred INTEGER
);

CREATE TABLE trips (
id INTEGER,
date TEXT,
pickup TEXT,
dropoff TEXT,
rider_id INTEGER,
car_id INTEGER,
type TEXT,
cost INTEGER
);

-- IMPORT data from csv
.import "cars.csv" cars
.import "riders.csv" riders
.import "trips.csv" trips
.import "riders2.csv" riders2

-- CLEAN duplicated rows
DELETE FROM cars
WHERE model = 'model';

DELETE FROM riders
WHERE first = 'first';

DELETE FROM trips
WHERE date = 'date';

DELETE FROM riders2
WHERE first = 'first';

-- UPDATE proper NULL values
UPDATE riders
SET referred = NULL
WHERE referred = '';

UPDATE riders2
SET referred = NULL
WHERE referred = '';

-- QUERY data
SELECT * FROM cars;
SELECT * FROM riders;
SELECT * FROM trips;
SELECT * FROM riders2;

-- LEFT JOIN trips and riders
SELECT * FROM trips
LEFT JOIN riders
ON trips.rider_id = riders.id;

-- INNER JOIN trips and cars
SELECT * FROM trips
JOIN cars
ON trips.car_id = cars.id;

-- STACK riders2 on top of riders
SELECT * FROM riders
UNION
SELECT * FROM riders2;

-- What is average cost of trip?
SELECT ROUND(AVG(cost), 2) AS 'Average cost' FROM trips;

-- Find all the riders who have used Lyft less than 500 times
SELECT * FROM (
    SELECT * FROM riders
    UNION
    SELECT * FROM riders2
) AS 'All riders'
WHERE total_trips < 500;


-- Calculate the number of cars that are active
SELECT COUNT(*) AS 'Number of active cars' FROM cars
WHERE status = 'active';

-- Write a query that finds the two cars that have the highest trips_completed
SELECT model, OS, trips_completed FROM cars
ORDER BY trips_completed DESC
LIMIT 2;


-- Clean database
DROP TABLE cars;
DROP TABLE riders;
DROP TABLE trips;