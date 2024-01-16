--ctes or with queries,  cte1, cte2 
-- ctes are only useful within 1 query but temp tables can be called from other queries 

with crew as ( 
	select * 
	from crew_members
)

select * 
from crew

--temp tables exists for a session 
-- temp tables another advantage is that you can give it indexes 
--ctes are quicker and more disposable 
-- we will not cover how to create and manage indexes in the course but learn it!!

create temp tables temptable as ( select * form crew_memeber)
create index idx_temp on temptable(crewmember_id asc)