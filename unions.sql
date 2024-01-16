-- Union and Union all 
-- is to combine the results of the 2 or more select statement into 1 list, 1 removes duplicates 
-- task: return a list of all customers named susan combined w a list of all actresses named susan , results combined in 1 list 
select customer.first_name, customer.last_name, 'Customer' as Type 
from customer 
where customer.first_name = 'Susan'

union all 
--union : removes duplicates from the 2 sets 

select actor.first_name, actor.last_name,  'Actor' 
from actor 
where actor.first_name = 'Susan'

union all 

select actor.first_name, actor.last_name, 'Actor' 
from actor 
where actor.first_name = 'Tom'
order by last_name

--rules : each union query must have the same number of columns 
-- 		the columns must have similar dtypes 
--		if u specify order by  clause it should be after al the unions 
-- logical processing review: from, where ,group by, select , distinct, union , order by, limit 
-- if you want to alias something it should be in the 1st union statement and you dont need to repeat it again