-- text manipulation 
--substring, position , length , replace 

select customer_id, first_name, last_name, email, substring(email, 5, 5) as substring_ex
	, position('@' in email) as posn_ex1
	, position('.' in email) as posn_ex2
	, substring( email, 1 , position('@' in email)-1) as user_name
-- we want to get the domain name from the email (gmail.com ..)
	, substring( email, position('@' in email)+1, length(email)) as domain_name
	-- ,length(email) as length_ex
	, replace(email, 'sakilacustomer.org', 'adventureworks.org')
from customer

--substring(searchtext, start postiion, length)
-- positions start from 1 
--replace (source, old text, new) 

-- task take email, break it into user name and then the username into first and last naem 
select email, 
	 position('@' in email)as posn_ex1
	, position('.' in email) as psn_ex2
	, substring( email, 1, position('@' in email)-1) as username 
	, substring( email, 1, position('.' in email)-1) as first_name
	, substring(email, position('.' in email)+1, length(last_name) )as last_name
	, substring(email, position('.' in email)+1, position('@'in email)-1 - position('.' in email)) as last_name3
from customer

