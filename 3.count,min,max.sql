/* task: 
-how many films has each customer rented? 
- how much $ has each person spent?
- what is the average length of the films each customer rented?
- when was each customer's earliest rental date?
when was each custome's recent rental date?
- new commands : sum,avg, min, max, round, trunc 
*/

select customer.customer_id, customer.first_name, customer.last_name
	, count(*) as " count of rentals"
	, sum( payment.amount) as "Total money spent"
	, avg(film.length) as " Average Film Length"
	, round( avg(film.length), 2) as " Average Film Length (rounded)"
	, trunc( avg(film.length), 2) as " Average Film Length (truncated)"
	, min( rental.rental_date) as " Earliest Rental Date"
	, max( rental.rental_date) as "Latest Rental Date"
From film
	inner join inventory
		on inventory.film_id= film.film_id
	inner join rental
		on rental.inventory_id= inventory.inventory_id
	inner join customer 
		on customer.customer_id= rental.customer_id
	left join payment
		on payment.rental_id= rental.rental_id
		and payment.customer_id = customer.customer_id
group by customer.customer_id, 
	customer.first_name, 
	customer.last_name 
order by 4 desc
	
-- 9876.54321 has precision= 9, scale =4
--