-- analytic 'Windows ' functions where we use another table to perform an oporation 
-- Task : find the cumulative spending of each customer for the month of February 

select customer.customer_id, customer.first_name, customer.last_name,
	rental.rental_date, payment.payment_date, payment.amount, 
	sum(payment.amount) over(
--	comment out line 8 and 10 to get the cumulative average( not by customer) and then coment in 9
--		partition by customer.customer_id
		order by customer.customer_id, payment.payment_date	 
--		order by payment.payment_date
	) as cumulativeamount
-- over specifies the set of rows that the sum fuction will be applied to 
-- partition by determines the cope of each window 
	
from public.rental
	inner join public.customer
		on customer.customer_id= rental.customer_id 
	inner join payment
		on payment.rental_id = rental.rental_id 
		and payment.customer_id = customer.customer_id 

where extract( month from payment_date) = 2 
	and extract( year from payment_date) = 2007 
	
order by customer.customer_id 
	, payment.payment_date