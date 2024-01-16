create Table SciFI_films As 
	select category.name as Category, film.title as Film_Title 
		, film.length as film_length, film.rating as film_rating

	from film 
		inner join film_category fc 
			on fc.film_id= film.film_id
		inner join category 
			on  fc.category_id = category.category_id

	where category.name= 'Sci-Fi'

-- suppose we want to create a table in our_database to store the output of the sci-fi category query 
-- two ways

Select * from SciFI_films
-- drop table SciFI_films

-- way 2: 
/*
select category.name as Category, film.title as Film_Title 
		, film.length as film_length, film.rating as film_rating
into SciFI_films

	from film 
		inner join film_category fc 
			on fc.film_id= film.film_id
		inner join category 
			on  fc.category_id = category.category_id

	where category.name= 'Sci-Fi'
	
	
