-- 5 most popular stories
SELECT title, score
FROM hacker_news
ORDER BY score DESC
LIMIT 5;

-- Total score of all stories
SELECT SUM(score)
FROM hacker_news;

-- Individual users who have gotten combined scores of more than 200, and their combined scores.
SELECT user, SUM(score) FROM hacker_news
GROUP BY USER
HAVING SUM(score) > 200
ORDER BY 2 DESC;

-- Impact of individuals to all 
SELECT ROUND((517 + 309 + 304 + 282) / 6366.0 * 100, 2);

-- How much post relate to rickroll?
SELECT user, COUNT(*) FROM hacker_news
WHERE url LIKE 'https://www.youtube.com/watch?v=dQw4w9WgXcQ';

-- Add column that points to source url
SELECT CASE
   WHEN url LIKE '%github.com%' THEN 'GitHub'
   WHEN url LIKE '%medium.com%' THEN 'Medium'
   WHEN url LIKE '%nytimes.com%' THEN 'New York Times'
   ELSE 'Other'
  END AS 'Source'
FROM hacker_news;

-- Add column that points to source url and group by it
SELECT COUNT(*), CASE
   WHEN url LIKE '%github.com%' THEN 'GitHub'
   WHEN url LIKE '%medium.com%' THEN 'Medium'
   WHEN url LIKE '%nytimes.com%' THEN 'New York Times'
   ELSE 'Other'
  END AS 'Source'
FROM hacker_news
GROUP BY 2;

-- Best hour to post
SELECT strftime('%H', timestamp) AS 'HOUR', ROUND(AVG(score)) AS 'Average scores', COUNT(*) AS 'Entities' FROM hacker_news
GROUP BY 1
ORDER BY 2 DESC;
