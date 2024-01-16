--Lead and Lag : logical opposites, 
--lead for the following row 
--useful for period over period analysis 

--Task calculate week-over-week revenue based on amounts from our payment table 

with weeklyrevenue as ( 
	select extract( week from payment_date) as week 
	, sum(payment.amount) as revenue 
	from rental
		
	inner join payment
		on payment.rental_id =rental.rental_id 
		and payment.customer_id= rental.customer_id
	group by extract( week from payment_date)
)

select week, revenue, lag(revenue, 1 ) over(order by week) as lag_ex
	, revenue- lag(revenue,1) over (order by week) as wow_rev
--	, revenue, lead(revenue, 1 ) over(order by week) as lead_ex
--	,revenue, lag(revenue, 2 ) over(order by week) as lag_ex2
 ,revenue- lead(revenue,1) over (order by week) as weekforward
from weeklyrevenue