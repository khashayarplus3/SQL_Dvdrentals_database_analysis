--create, insert, update, delete 
-- task create a rable and fill it w the data

CREATE TABLE IF NOT EXISTS crew_members (
    crewmember_id   smallserial PRIMARY KEY NOT NULL,
    name            text NOT NULL,
    position        text NOT NULL,
    join_date       timestamp NOT NULL,
    modified        timestamp NULL
);

INSERT INTO crew_members (name, position, join_date)
VALUES
    ('Naomi', 'Engineer', current_timestamp),
    ('Amos', 'Captain', current_timestamp),
    ('Alex', 'Janitor', current_timestamp),
    ('Bobbi', 'Shoota', current_timestamp),
    ('Chris', 'HR', current_timestamp);
-- we dont need to list the crewmember_id since its a serial column

select * from crew_members

update crew_members
	set position = 'Marketing'
		, modified = current_timestamp where crew_members.name= 'Bobbi'
		
delete from crew_members where crew_members.name = 'Chris'