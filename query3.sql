-- Find the actor_id, first_name, last_name and total_combined_film_length of Drama films for every actor.
-- That is the result should list the names of all of the actors(even if an actor has not been in any Drama films)
-- and the total length of Drama films they have been in.
-- Look at the category table to figure out how to filter data for Drama films.
-- Order your results by all the actors first_name in ascending order.

-- Put query for Q3 here

SELECT 
    a.actor_id,
    a.first_name,
    a.last_name,
    COALESCE(SUM(
        CASE WHEN c.name = 'Drama' THEN f.length ELSE 0 END
    ), 0) AS total_combined_film_length
FROM 
    actor a
LEFT JOIN film_actor fa ON a.actor_id = fa.actor_id
JOIN film f ON fa.film_id = f.film_id
JOIN film_category fc ON f.film_id = fc.film_id
JOIN category c ON fc.category_id = c.category_id
GROUP BY 
    a.actor_id, a.first_name, a.last_name
ORDER BY 
    a.first_name ASC;