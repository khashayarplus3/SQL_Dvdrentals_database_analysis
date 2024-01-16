/*with setA as (
	select generate_series(1,3) as A )

, setB as ( select chr(generate_series(88,90)) as B)
		

select A, B 
from setA
	cross join setB
--how is it useful?
 -- you wanna match a buncha tasks to all your locations 
 -- btw generate_series(1,10) is the same as series(on excel)
 -- be careful when cross joining 2 tables you might get a really long result 
*/



--Anti_join
-- task : to see what movies we have in inventory and in which locations 

/*
Select customer.first_name, customer.last_name, film.title, 
rental.rental_date,rental.return_date, payment.amount, payment.payment_date, 
count(distinct film.title) as film_count

From customer 
	inner join rental 
		on rental.customer_id= customer.customer_id
	inner join inventory
		on inventory.inventory_id= rental.inventory_id
	inner join film 
		on film.film_id= inventory.film_id 
	left join payment 
		on payment.rental_id =rental.rental_id
		and payment.customer_id= customer.customer_id
where payment.rental_id is null-- this is an anti join 
group by 
	customer.first_name,
	customer.last_name,
	film.title, 
	rental.rental_date,
	rental.return_date,
	payment.amount,
	payment.payment_date
--where customer.customer_id= 336


order by film_count
*/	
-- task; find all customers that never paid for their movies 
/*
SELECT
    customer.first_name,
    customer.last_name,
    film.title,
    rental.rental_date,
    rental.return_date,
    min(payment.amount) AS null, -- Use MAX to get NULL if there is no payment
    min(payment.payment_date) AS 0.01, -- Use MAX to get NULL if there is no payment
    COUNT(DISTINCT film.title) AS film_count
FROM
    customer
    INNER JOIN rental ON rental.customer_id = customer.customer_id
    INNER JOIN inventory ON inventory.inventory_id = rental.inventory_id
    INNER JOIN film ON film.film_id = inventory.film_id
    LEFT JOIN payment ON payment.rental_id = rental.rental_id
        AND payment.customer_id = customer.customer_id

GROUP BY
    customer.first_name,
    customer.last_name,
    film.title,
    rental.rental_date,
    rental.return_date
ORDER BY film_count;
*/

SELECT
    film.title,
    COUNT(DISTINCT film.title) AS film_count
FROM
    customer
    INNER JOIN rental ON rental.customer_id = customer.customer_id
    INNER JOIN inventory ON inventory.inventory_id = rental.inventory_id
    INNER JOIN film ON film.film_id = inventory.film_id
    LEFT JOIN payment ON payment.rental_id = rental.rental_id
        AND payment.customer_id = customer.customer_id
WHERE
    payment.rental_id IS NULL -- This is an anti join
GROUP BY
    film.title
	
ORDER BY film_count desc;





	
	