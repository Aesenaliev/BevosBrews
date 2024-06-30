-- Get data into neat format

SELECT name, stars, reviews, tags, miles, link FROM coffee

-- Get the best rated coffee shop within 1 mile

SELECT name, stars, reviews, miles FROM coffee WHERE miles <= 1 ORDER BY stars DESC, reviews DESC
SELECT name, stars, reviews, miles FROM coffee ORDER BY stars DESC, reviews DESC

-- Top 10 most review coffee shops

SELECT TOP 10 name, stars, reviews, tags, miles, link FROM coffee ORDER BY reviews DESC

-- Get closet coffee shops

SELECT name, stars, reviews, tags, miles, link FROM coffee ORDER BY miles ASC
SELECT name, stars, reviews, tags, miles, link FROM coffee ORDER BY miles ASC, stars DESC, reviews DESC

-- Select tea places with best star count and reviews

SELECT name, stars, reviews, tags, miles, link FROM coffee WHERE tags LIKE '%Tea%' ORDER BY stars DESC, reviews DESC

-- Get dessert places

SELECT name, stars, reviews, tags, miles, link FROM coffee WHERE tags LIKE '%Desserts%'


-- More ratings by distance

SELECT CASE
	WHEN miles <= 1 THEN '<1 mile'
	WHEN miles <= 5 THEN '1-5 miles'
END AS distance_range,
AVG(stars) AS avg_stars,
SUM(reviews) AS total_reviews
FROM coffee
GROUP BY CASE
	WHEN miles <= 1 THEN '<1 mile'
	WHEN miles <= 5 THEN '1-5 miles'
END
ORDER BY distance_range

SELECT CASE
	WHEN miles <= 1 THEN '<1 mile'
	WHEN miles <= 3 THEN '1-3 miles'
END AS distance_range,
name, stars, reviews, tags, miles, link
FROM coffee

SELECT CASE
	WHEN stars <= 3 THEN '<3 stars'
	WHEN stars <= 4 THEN '3-4 stars'
	WHEN stars <= 5 THEN '4-5 stars'
END AS star_range,
name, stars, reviews, tags, miles, link
FROM coffee
