-- task which customers rented movied in february 
select distinct customer.first_name, customer.last_name, customer.email, rental.rental_date
from rental 
	inner join customer 
		on customer.customer_id= rental.customer_id 
where date_part('month', rental.rental_date) = 2 		

-- ehat is the most popular time for rentals
select extract('hour' from rental.rental_date) as Rental_hour
	, count(rental.rental_id) as Rental_Count
from rental 
group by extract('hour' from rental.rental_date)
order by Rental_Count desc 

-- what is the length of each rental? 
select rental.rental_date, return_date, age( return_date, rental_date) as time_borrowed 

from rental
where return_date is not null
order by avg_time_borrowed desc

-- avg borrowing time 
select avg(age( return_date, rental_date))as avg_time_borrowed
from rental
where return_date is not null