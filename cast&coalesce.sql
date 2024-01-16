-- cast and coaesce

select rental_id 
, rental_date, return_date, coalesce(return_date, current_timestamp)
, rental_date, return_date, coalesce(cast(return_date as varchar), 'not Returned') as returndate2
from rental 
order by return_date desc 


--takes a null value and makes it into smn else 
