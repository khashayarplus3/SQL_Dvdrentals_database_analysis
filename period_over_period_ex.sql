-- row number is very effective for retiriving earliest date, last date lowest or highest numbers , can help with filtering certain results
--similar to subqueries in week 2
-- Task : tryna get the most recent rental of each customer 

with cte as ( 
	select rental.customer_id
	, rental.inventory_id 
	,rental.rental_date
	, row_number() over( partition by customer_id order by rental_date desc) rownum
from rental
)

select customer.first_name, customer.last_name , cte.rental_date, film.title
from cte
	inner join customer
		on customer.customer_id= customer.customer_id 
	inner join inventory 
		on inventory.inventory_id= cte.inventory_id
	inner join film 
		on film.film_id = inventory.film_id
where cte.rownum = 1 -- by this you get the most recent rental 
order by first_name
	,last_name 

