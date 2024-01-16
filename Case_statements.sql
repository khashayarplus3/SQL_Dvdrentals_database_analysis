--case statements for conditional logics 
-- like if then else in other langs 
/*nestable  
case
	when (condition)then
		case
			when (condition) then (output)
			else (other output)
			end 
	else (other output )
end
*/
--task use a case statement to classify the films into (<1 hr, 1-2 hrs, 2-3hrs, 3+ hrs)

select film_id, title, length , rating, 
	case
		when length between 0 and 59 then 'Less than 1 hour'
		when length between 60 and 119 then '1 to 2 hours'
		when length between 120 and 179 then '2-3 hours '
		else '3+ hours'
	end as Film_Length_category
from film
order by length 

--task how many films fall into each category
select case
	when length between 0 and 59 then 'Less than 1 hour'
	when length between 60 and 119 then '1 to 2 hours'
	when length between 120 and 179 then '2-3 hours '
	else '3+ hours'
	end as Film_Length_category
	, count(film_id) as count_of_films
from film
group by case
	when length between 0 and 59 then 'Less than 1 hour'
	when length between 60 and 119 then '1 to 2 hours'
	when length between 120 and 179 then '2-3 hours '
	else '3+ hours' 
	end -- since you cant specify an alias in a groupby clause 
order by count_of_films desc

-- group our films to see how many films in each cateory based on viewers suggestion
select rating 
	,case rating 
		when 'G' then 'General Audience'
		when 'PG' then 'Parental guidance suggested'
		when 'PG-13' then 'Parents strongly cautioned '
		when 'R' then ' restriced'
		when 'NC-17' then 'Adults only'
		else 'Unknown'
		end as Rating_Description
, count(film_id)as count_of_films
from film 
group by rating,
	case rating 
		when 'G' then 'General Audience'
		when 'PG' then 'Parental guidance suggested'
		when 'PG-13' then 'Parents strongly cautioned '
		when 'R' then ' restriced'
		when 'NC-17' then 'Adults only'
		else 'Unknown'
	end
order by Rating_Description

--  
