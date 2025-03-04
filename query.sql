create database netflix 

use netflix  ---selecting database
---------------------------checked all the null  values
SELECT * FROM netflix
WHERE show_id IS  NULL 
   OR type IS NULL 
   OR title IS NULL 
   OR director IS  NULL 
   OR cast IS NULL 
   OR country IS NULL 
   OR date_added IS  NULL 
   OR release_year IS  NULL 
   OR rating IS  NULL 
   OR duration IS NULL 
   OR listed_in IS  NULL 
   OR description IS NULL;





BEGIN TRANSACTION;
-- Run DELETE query
ROLLBACK

-------so my date_added column is listed in with time portion (2021-09-15 00:00:00.000) we want to remove the time portion we want (2021-07-03)

alter table netflix
alter column date_added date;

select  * from netflix
	
------check everythingrows hasd been added---
select count(*) 
from netflix


-----we can find how type of content we have

select distinct type 
from netflix


----we can also find directors
select distinct  director
from netflix



------------------------------------most of the besinesss problem we get

--1. Count the number of Movies vs TV Shows

select * from netflix

select type , count(show_id) as no_of_movies
from netflix
group by type


-------------2. Find the most common rating for movies and TV shows

select * from netflix

---i used cte to do this

with table_1
as
(
select
	type,
	rating,
	count(*) as common_rating,
rank() over (partition by type order by count(*) desc) as ranking
from netflix
group by type,rating)

select * from table_1
where ranking = 1

-----by using subquery 
SELECT * 
FROM (
    SELECT 
        type,
        rating,
        COUNT(*) AS common_rating,
        RANK() OVER (PARTITION BY type ORDER BY COUNT(*) DESC) AS ranking
    FROM netflix
    GROUP BY type, rating
) AS ranked_table
WHERE ranking = 1;



---3. List all movies released in a specific year (e.g., 2020)

select * from netflix
where 
type = 'movie'
and release_year = 2020



---4. Find the top 5 countries with the most content on Netflix

SELECT
	TOP 5
	new_country,
	COUNT(*) AS Total_content
FROM 
	(SELECT    TRIM(value) AS new_country
	FROM netflix
	CROSS APPLY STRING_SPLIT(country, ',')
) AS Country_Data
GROUP BY new_country
ORDER BY Total_content DESC

------another way--------------------------
select top 5 country,count(*) as total_content
from netflix
group by country
order by count(*) desc
-------another way to do this 
SELECT 
    TRIM(value) AS new_country, 
    COUNT(*) AS total_content
FROM netflix
CROSS APPLY STRING_SPLIT(country, ',')
GROUP BY TRIM(value)
ORDER BY total_content DESC
OFFSET 0 ROWS FETCH NEXT 5 ROWS ONLY;

---5. Identify the longest movie

select * from netflix
where
type='movie'
and duration = (Select max(duration)  as longest_movie from netflix)

---6. Find content added in the last 5 years

select  *
from netflix
where datediff(year,date_added,getdate()) <5


--7. Find all the movies/TV shows by director 'Rajiv Chilaka'!

select type,COUNT(*) AS  LIST_MOVIES
from netflix
where director = 'Rajiv Chilaka'
GROUP BY TYPE

--8. List all TV shows with more than 5 

 SELECT *
FROM netflix
WHERE 
    TYPE = 'TV Show'
    AND CAST(PARSENAME(REPLACE(duration, ' ', '.'), 2) AS INT) > 5

--9. Count the number of content items in each genre
----i used cross apply operator in this and also its table _valued function(string_Split)

select 
	VALUE AS GENRE,
	count(show_id) as number_list
from netflix
CROSS APPLY STRING_SPLIT(listed_in, ',') as genre
group by VALUE


--10.Find each year and the average numbers of content release in India on netflix. 
--return top 5 year with highest avg content release!

SELECT TOP 5
    country,
    release_year,
    COUNT(show_id) AS total_release,
	round(cast(COUNT(show_id) AS FLOAT) / 
        (SELECT CAST(COUNT(show_id) AS FLOAT) FROM netflix WHERE country = 'India') * 100, 
        2
    ) AS avg_release
FROM netflix
WHERE country = 'India'
GROUP BY country, release_year
ORDER BY total_release DESC;


--11. List all movies that are documentaries

 SELECT *
FROM netflix

select type,listed_in ,title
from netflix
where type = 'Movie'
and listed_in = 'Documentaries'


--12. Find all content without a director

select * from netflix
where director is null


--13. Find how many movies actor 'Salman Khan' appeared in last 10 years!

SELECT * 
FROM netflix
WHERE 
    cast LIKE '%Salman Khan%'
    AND release_year > 2015;


--14. Find the top 10 actors who have appeared in the highest number of movies produced in India.

select  top 10
	value as actors ,
	count(type) as number_movies
from netflix
CROSS APPLY STRING_SPLIT(cast, ',') as actors
where country = 'india'
and type = 'movie'
group by value
order by number_movies desc

/*15.
Categorize the content based on the presence of the keywords 'kill' and 'violence' in 
the description field. Label content containing these keywords as 'Bad' and all other 
content as 'Good'. Count how many items fall into each category.*/



select category ,
type,count(*)
from(
SELECT 
        *,
        CASE 
            WHEN description LIKE '%kill%' OR description LIKE '%violence%' THEN 'Bad'
            ELSE 'Good'
        END AS category
    FROM netflix
	) as category_list
group by category,type
order by type