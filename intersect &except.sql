-- Intersect and Except 
-- intercept: returns any rows availablle in both sets 
-- except: returns rows in the first set that doesnt appear int he 2nd set
-- task: actors harrison bale and panelope monroe starred in a film but we dont know what, figure it out 
with CTE as (
	select a.first_name, a.last_name, f.title
	from actor as a 
		inner join film_actor fa
			on fa.actor_id= a.actor_id 
		inner join film f 
				on f.film_id= fa.film_id 
)

select title 
from CTE
where CTE.last_name= 'Bale' 

intersect
--except: shows all movies bale played in but penelope didnt   

select title 
from CTE 
where CTE.last_name= 'Monroe' and CTE.first_name= 'Penelope'
