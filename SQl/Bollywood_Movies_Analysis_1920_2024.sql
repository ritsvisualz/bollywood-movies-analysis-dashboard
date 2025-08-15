CREATE TABLE movies (
    movie_id INT PRIMARY KEY,
    title VARCHAR(255),
    year INT,
    genre VARCHAR(255),
    primary_genre VARCHAR(100)
);


SELECT distinct primary_genre, COUNT(*) AS count
FROM movies
GROUP BY primary_genre
ORDER BY count DESC
LIMIT 15;

SELECT year, COUNT(*) AS count
FROM movies
GROUP BY year
ORDER BY count DESC
LIMIT 5;

-- Count all movies in the dataset
SELECT COUNT(*) AS total_movies
FROM movies;

-- Group movies by decade (1920s, 1930s, etc.)
SELECT (year/10)*10 AS decade, COUNT(*) AS movie_count
FROM movies
GROUP BY decade
ORDER BY decade;


-- Most common primary genres
SELECT primary_genre, COUNT(*) AS count
FROM movies
GROUP BY primary_genre
ORDER BY count DESC
LIMIT 15;


-- Which year had the highest number of movie releases?
SELECT year, COUNT(*) AS count
FROM movies
GROUP BY year
ORDER BY count DESC
LIMIT 1;

-- Which year had the lowest number of movie releases?
SELECT year, COUNT(*) AS count
FROM movies
GROUP BY year
ORDER BY count 
LIMIT 1;

-- Compare movie counts before and after 2000
SELECT 
    CASE WHEN year < 2000 THEN 'Before 2000' ELSE '2000 & After' END AS period,
    COUNT(*) AS movie_count
FROM movies
GROUP BY period;

-- Last 10 years (adjust if current year changes)
SELECT primary_genre as genre, COUNT(*) AS count
FROM movies
WHERE year >= 2015
GROUP BY primary_genre
ORDER BY genre asc ,count DESC


-- Most dominant genre in each decade
SELECT decade, primary_genre, movie_count
FROM (
    SELECT (year/10)*10 AS decade, primary_genre, COUNT(*) AS movie_count,
           RANK() OVER (PARTITION BY (year/10)*10 ORDER BY COUNT(*) DESC) AS rank_in_decade
    FROM movies
    GROUP BY decade, primary_genre
) AS ranked_genres
WHERE rank_in_decade = 1
ORDER BY decade;


-- Calculate yearly growth percentage (CAGR approximation can be computed later)
SELECT year, COUNT(*) AS movie_count
FROM movies
GROUP BY year
ORDER BY year;


-- Calculate starting and ending values for CAGR
WITH stats AS (
    SELECT 
        MIN(year) AS start_year,
        MAX(year) AS end_year,
        (SELECT COUNT(*) FROM movies WHERE year = (SELECT MIN(year) FROM movies)) AS start_count,
        (SELECT COUNT(*) FROM movies WHERE year = (SELECT MAX(year) FROM movies)) AS end_count
    FROM movies
)
SELECT start_year, end_year, start_count, end_count,
       POWER(end_count::decimal / start_count, 1.0 / (end_year - start_year)) - 1 AS cagr
FROM stats;


-- Which decade saw the maximum number of movies?
SELECT (year/10)*10 AS decade, COUNT(*) AS movie_count
FROM movies
GROUP BY decade
ORDER BY movie_count DESC
LIMIT 1;

-- How each genre evolved across decades
SELECT (year/10)*10 AS decade, primary_genre, COUNT(*) AS movie_count
FROM movies
GROUP BY decade, primary_genre
ORDER BY decade, movie_count DESC;

-- Genres that were present before 1970 but not after 2000
SELECT DISTINCT primary_genre
FROM movies
WHERE year < 1970
AND primary_genre NOT IN (
    SELECT DISTINCT primary_genre FROM movies WHERE year >= 2000
);



