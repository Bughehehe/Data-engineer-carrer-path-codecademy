CREATE TABLE state_climate (
    state TEXT,
    year INTEGER,
    tempf REAL,
    tempc REAL
);

-- IMPORT data from csv (in sqlite3 cli)
-- sqlite3 climate.db
.mode csv
.import "state_climate.csv" state_climate

SELECT * FROM state_climate
LIMIT 50;

SELECT COUNT(*) FROM state_climate;

-- how the average temperature changes over time in each state
SELECT 
    state, 
    year, 
    tempf, 
    tempc,
    AVG(tempc) OVER (
        PARTITION BY state
        ORDER BY year DESC
    ) AS running_avg_temp
FROM state_climate;

-- lowest temperatures for each state
SELECT
    state,
    year,
    MIN(tempf),
    MIN(tempc)
FROM state_climate
GROUP BY state;

-- lowest temperatures for each state
SELECT
    state,
    year,
    FIRST_VALUE (tempf) OVER (
        PARTITION BY state
        ORDER BY tempf
    ) AS lowest_tempf,
    FIRST_VALUE (tempc) OVER (
        PARTITION BY state
        ORDER BY tempc
    ) AS lowest_tempc
FROM state_climate

-- highest temperatures for each state
SELECT
    state,
    year,
    MAX(tempf),
    MAX(tempc)
FROM state_climate
GROUP BY state
ORDER BY year DESC;

-- highest temperatures for each state
SELECT
    state,
    year,
    LAST_VALUE (tempf) OVER (
        PARTITION BY state
        ORDER BY tempf
        RANGE BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
    ) AS highest_tempf,
    LAST_VALUE (tempc) OVER (
        PARTITION BY state
        ORDER BY tempc
        RANGE BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
    ) AS highest_tempc
FROM state_climate

-- how temperature has changed each year in each state
SELECT
    state,
    year,
    tempc - LAG(tempc) OVER (
        PARTITION BY state
        ORDER BY year
    ) AS temp_diff
FROM state_climate
WHERE 3 IS NOT NULL
ORDER BY temp_diff DESC;

-- query to return a rank of the coldest temperatures on record 
SELECT
    state,
    year,
    tempc,
    RANK() OVER (
        ORDER BY tempc ASC
    )
FROM state_climate;

-- query to return a rank of the warmest temperatures on record 
SELECT
    state,
    year,
    tempc,
    RANK() OVER (
        ORDER BY tempc DESC
    )
FROM state_climate;

-- query that will return the average yearly temperatures in quartiles
SELECT
    state,
    year,
    tempc,
    NTILE(4) OVER (
        PARTITION BY state
        ORDER BY tempc ASC
    )
FROM state_climate;

-- query that will return the average yearly temperatures in quartiles
SELECT
    state,
    year,
    tempc,
    NTILE(5) OVER (
        PARTITION BY year
        ORDER BY tempc ASC
    )
FROM state_climate;

DROP TABLE state_climate;