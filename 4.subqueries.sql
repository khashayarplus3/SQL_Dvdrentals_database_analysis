-- subqueries : queries written within queries 
-- we want to find all films that have rental rate more than the average rate, using subqueries 
select film.title, film.rental_rate
from film
where film.rental_rate > 
	(select avg(film.rental_rate)
	from film)

--subqueries to see if data exists in a table 
--task find all customers who rented films between two specific dates 
select customer.customer_id, customer.first_name, customer.last_name
from customer 
where customer.customer_id in (
	select rental.customer_id
	from rental 
	where rental.rental_date between '2005-05-25' and '2005-05-26')