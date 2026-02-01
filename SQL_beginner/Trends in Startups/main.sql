-- Create and import table
CREATE TABLE startups (
    name TEXT,
    location TEXT,
    category TEXT,
    employees INTEGER,
    raised  INTEGER,
    valuation INTEGER,
    founded INTEGER,
    stage TEXT,
    ceo TEXT,
    info TEXT
);
.import "startups.csv" startups

-- Clean table
UPDATE startups SET 
  name = NULLIF(name, ''),
  location = NULLIF(location, ''),
  category = NULLIF(category, ''),
  employees = NULLIF(employees, ''),
  raised = NULLIF(raised, ''),
  valuation = NULLIF(valuation, ''),
  founded = NULLIF(founded, ''),
  stage = NULLIF(stage, ''),
  ceo = NULLIF(ceo, ''),
  info = NULLIF(info, '');

DELETE FROM startups
WHERE category IS 'category';

-- Show table
SELECT * FROM startups;

-- Calculate the total number of companies in the table
SELECT COUNT(*) FROM startups;

-- Total value of all companies in this table
SELECT SUM(valuation) FROM startups;

-- Highest amount raised by a startup
SELECT MAX(raised) FROM startups;

-- Highest amount raised by a startup in seed stage
SELECT MAX(raised) FROM startups
WHERE stage IS 'Seed';

-- Oldest company on the list founded
SELECT name, MIN(founded) FROM startups;

-- Average valuation
SELECT AVG(valuation) FROM startups;

-- Average valuation in each category
SELECT category, AVG(valuation) FROM startups
GROUP BY category;

-- Average valuation rounded in each category
SELECT category, ROUND(AVG(valuation), 2) FROM startups
GROUP BY category;

-- Average valuation rounded in each category ordered
SELECT category, ROUND(AVG(valuation), 2) FROM startups
GROUP BY category
ORDER BY 2 DESC;

-- How much companies belong to category
SELECT category, COUNT(*) FROM startups
GROUP BY category;

-- How much companies belong to category with number more than 3
SELECT category, COUNT(*) FROM startups
GROUP BY category
HAVING COUNT(*) > 3
ORDER BY 2 DESC;

-- Average size of a startup in each location
SELECT location, ROUND(AVG(employees), 2) FROM startups
GROUP BY location
ORDER BY 2 DESC;

-- Average size of a startup in each location with >500 workers
SELECT location, ROUND(AVG(employees), 2) AS 'Average workers' FROM startups
GROUP BY location
HAVING ROUND(AVG(employees), 2) > 500
ORDER BY 2 DESC;

DROP TABLE startups