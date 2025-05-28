-- Find the film_title of all films which feature both UMA WOOD and FRED COSTNER
-- Order the results by film_title in descending order.
--  Warning: this is a tricky one and while the syntax is all things you know, you have to think a bit oustide the box 
--  to figure out how to get a table that shows pairs of actors in movies.

-- Put your query for Q5 here.
WITH UmaFilms AS (
    SELECT f.film_id, f.title
    FROM film f
    JOIN film_actor fa ON f.film_id = fa.film_id
    JOIN actor a ON fa.actor_id = a.actor_id
    WHERE a.first_name = 'UMA' AND a.last_name = 'WOOD'
),
FredFilms AS (
    SELECT f.film_id, f.title
    FROM film f
    JOIN film_actor fa ON f.film_id = fa.film_id
    JOIN actor a ON fa.actor_id = a.actor_id
    WHERE a.first_name = 'FRED' AND a.last_name = 'COSTNER'
)
SELECT uf.title AS film_title
FROM UmaFilms uf
JOIN FredFilms ff ON uf.film_id = ff.film_id
ORDER BY film_title DESC;
