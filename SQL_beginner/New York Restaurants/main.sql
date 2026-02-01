-- IMPORT DATA FROM CSV FILE
CREATE TABLE nomnom (
    name TEXT, 
    neighborhood TEXT, 
    cuisine TEXT,
    review INTEGER, 
    price TEXT, 
    health TEXT
);
.import "restaurants.csv" nomnom

-- REMOVE UNNECESARY ROW
DELETE FROM nomnom
WHERE neighborhood = 'neighborhood';

-- SET PROPER NULL VALUES
UPDATE nomnom SET review = NULL WHERE review = '' OR review IS NULL;
UPDATE nomnom SET price = NULL WHERE price = '' OR price IS NULL;
UPDATE nomnom SET price = '$$' WHERE price = ' $$';
UPDATE nomnom SET health = NULL WHERE health = '  ' OR health = '' OR health IS NULL;

-- SHOW DATA
SELECT * FROM nomnom;

-- CHECK HOW MUCH ROWS
SELECT COUNT(*) FROM nomnom;

-- DISTINCT TYPES OF CUISINE
SELECT DISTINCT cuisine FROM nomnom;

-- DISTINCT TYPES OF NEIGHBORHOOD
SELECT DISTINCT neighborhood FROM nomnom;

-- CHINESE RESTAURANTS
SELECT * FROM nomnom
WHERE cuisine IS 'Chinese';

-- ALL RESTAURANTS WITH REVIEW ABOVE 4
SELECT * FROM nomnom
WHERE review > 4;

-- Restaurants that are Italian and $$$
SELECT * FROM nomnom
WHERE price IS '$$$' AND cuisine IS 'Italian';

-- Restaurants with name that contains word 'meatball'
SELECT * FROM nomnom
WHERE name LIKE '%meatball%';

-- Find all the close by spots in Midtown, Downtown or Chinatown
SELECT * FROM nomnom
WHERE neighborhood IS 'Midtown' OR neighborhood IS 'Downtown' OR neighborhood IS 'Chinatown';

-- Restaurants without health grade
SELECT * FROM nomnom
WHERE health IS NULL;

-- TOP 10 RESTAURANTS
SELECT * FROM nomnom
ORDER BY review DESC
LIMIT 10;

-- Add rating system column
SELECT *, 
    CASE
        WHEN  review > 4.5 THEN 'Extraordinary'
        WHEN review > 4 THEN 'Exellent'
        WHEN review > 3 THEN 'Good'
        WHEN review > 2 THEN 'Fair'
        WHEN review IS NULL THEN 'Unknown'
        ELSE 'Poor'
    END AS 'rating_system'
FROM nomnom;

DROP TABLE nomnom;