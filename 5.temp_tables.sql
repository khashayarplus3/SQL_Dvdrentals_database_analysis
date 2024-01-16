-- Temporary Tables- temp tables
-- almost the sam esyntaxs as perm tables and theres some limitations 
-- purpose: to temporarirly store some tables before some complex 


-- we dont need to list the crewmember_id since its a serial column
CREATE temp TABLE if not exists temp_crew_members  (
    crewmember_id   smallserial 	PRIMARY KEY ,
    name            text 	NOT NULL,
    position        text 	NOT NULL,
    join_date       timestamp 	NOT NULL,
    modified        timestamp 	NULL
);

INSERT INTO temp_crew_members (name, position, join_date)
VALUES
    ('Naomi', 'Engineer', current_timestamp),
    ('Amos', 'Captain', current_timestamp),
    ('Alex', 'Janitor', current_timestamp),
    ('Bobbi', 'Shoota', current_timestamp),
    ('Chris', 'HR', current_timestamp);


--drop table temp_crew_members

-- tables tab wont show temp tables, but at least temporarirly 

select name , position
from temp_crew_members
where name= 'Naomi'

-- temp tables r kinda like Ctes the difference is explained in the next video on ctes 

