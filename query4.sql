-- Find the actor_id, first_name, and last_name of all actors who have never been in a Sports film.
-- Order your results by actor_id in descending order.

-- Put query for Q4 here
SELECT 
    a.actor_id,
    a.first_name,
    a.last_name
FROM actor a
WHERE a.actor_id NOT IN (
    SELECT fa.actor_id
    FROM film_actor fa
    JOIN film_category fc ON fa.film_id = fc.film_id
    JOIN category c ON fc.category_id = c.category_id
    WHERE c.name = 'Sports'
)
ORDER BY a.actor_id DESC;
