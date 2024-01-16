--subquery in the from clause: derived table 
-- task business wants to reward top 5 customers who spent more than $30 bw feb 15-21 x7 
-- derive table for name and email of top 5 customers

select first_name, last_name, email, top_five.TotalAmount
from(
	select customer_id, sum(amount) as TotalAmount
	from payment
	where payment_date between '2007-02-15' and '2007-05-21'
	group by customer_id
	having sum(amount) > 30
	order by TotalAmount desc 
	limit 5
) as top_five
inner join customer
on customer.customer_id = top_five.customer_id 
order by 4 desc 

-- Same thing with Nested Subqueries 
select first_name, last_name, email 
from customer
where customer_id in ( 
	select customer_id 
	from( 
		select customer_id, sum(amount) as TotalAmount
		From payment 
		where payment_date between '2007-02-15' and '2007-05-21'
	group by customer_id
	having sum(amount) > 30
	order by TotalAmount desc 
	limit 5) as top_five 
	)
	
	
	
	
