-- We want to find out how many of each category of film GRACE MOSTEL has starred in.
-- So return a table with category_name and the count as the number_of_films that GRACE was in that category.
-- Your query should return a non-null value for every category even if GRACE has been in no films in that category.
-- Order by the category name in descending order.

-- Put query for Q2 here
SELECT 
    c.name AS category_name,
    COALESCE(COUNT(fa.actor_id), 0) AS number_of_films
FROM 
    category c
LEFT JOIN 
    film_category fc ON c.category_id = fc.category_id
LEFT JOIN 
    film f ON fc.film_id = f.film_id
LEFT JOIN 
    film_actor fa ON f.film_id = fa.film_id AND fa.actor_id = (
        SELECT actor_id 
        FROM actor 
        WHERE first_name = 'GRACE' AND last_name = 'MOSTEL'
    )
GROUP BY 
    c.name
ORDER BY 
    c.name DESC;
