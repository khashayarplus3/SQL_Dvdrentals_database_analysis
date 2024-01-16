/*--outer and inner join  
Select first_name, last_name, film.title
From actor 
	left join film_actor
--or left join 
		on film_actor.actor_id =actor.actor_id
	--left join film
	inner join film
		on film.film_id= film_actor.film_id 
	and film.title= 'Snowman Rollercoaster'
where first_name= 'Woody'
and last_name= 'Hoffman'
--note: the ON criteria is used when two columns are equa to eachother
--and film.title= 'Snowman Rollercoaster'
order by 3; 
-- right and left joins do the same thing basically 
*/

--task frind the best way to write a query that returns all the movies woody hoffman has starred in 
/*Select first_name, last_name, film.title
From actor 
	inner join film_actor
	on film_actor.actor_id= actor.actor_id
	inner join film
	on film.film_id= film_actor.film_id 
where first_name= 'Woody' and last_name= 'Hoffman'
order by 3 
*/

--find actors in sonw man rollercoaster
Select first_name, last_name, film.title
From actor 
	inner join film_actor
-- or join
	on film_actor.actor_id= actor.actor_id
	inner join film
	on film.film_id= film_actor.film_id 
where film.title= 'Snowman Rollercoaster'
order by 3
