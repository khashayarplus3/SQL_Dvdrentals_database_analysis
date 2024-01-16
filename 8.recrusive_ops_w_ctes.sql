--Recrusive operation using ctes 
-- parernt_child relationship exs; manager to employyee , parent companies ot subsidiaries .. 
-- hierarchical data 
-- recursive query = query that refers to itself , best way to use them is w ctes 

select * from crew_members 

alter table crew_members 
add column manager_id smallint 

--task update scripts to set manager ids for each crew member who has a manager 
-- reporting to amos : naomi Alex bobbi
alter table crew_members 
rename column crewmwmber_id to crewmember_id

update crew_members
	set manager_id = (
		select crewmember_id
		from crew_members
		where name = 'Amos'
		limit 1)
	where crew_members.name in ('Naomi', 'Alex' , 'Bobbi');

		