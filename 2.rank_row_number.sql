-- rank: ranks based on smn , if theres a tie it adds up the number of tied ppl 
-- if grades= 10, 10, 9 > rank  will give 3 for 9 but dense rank would give 2 
-- dense_rank
--row_number : gives the row number 

--Task : rank the customers by the number of rentals each person has 


with cte as( 
	select customer.customer_id, customer.first_name, customer.last_name, 
		count(rental.rental_id) as count_of_rentals

	from customer
		inner join rental 
			on rental.customer_id= customer.customer_id

	group by customer.customer_id,
		customer.first_name, customer.last_name
)	

select cte.customer_id,cte.first_name, cte.last_name, cte.count_of_rentals
	,rank() over( order by count_of_rentals desc) as Rank_ex
	,dense_rank() over( order by count_of_rentals desc) as ÍDense_Rank_ex
	, row_number() over( order by count_of_rentals desc) as Row_num_ex	
from cte 
order by count_of_rentals desc

