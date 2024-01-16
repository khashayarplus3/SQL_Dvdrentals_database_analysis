select localtimestamp
/*
, current_date
, cast( localtimestamp as date) as "Date"
, localtime
, cast(localtimestamp as time) as "Time"
, current_timestamp
, current_time
*/
,current_timestamp at time zone 'Europe/Helsinki'
, extract( year from current_timestamp) as "year"
, extract( month  from current_timestamp) as "month"
, extract( hour from current_timestamp) as "hour"
, extract( minute from current_timestamp) as "minute"
, date_part('year', current_date) as "Todays''s year" -- use double '' when using this char
, date_part('month', current_date) as "Todays''s month"
, date_part('day', current_date) as "Todays''s day"


, date_trunc( 'year', current_date) as "trunc_year"
, date_trunc( 'month', current_date) as "trunc_month"
-- trunc gives the fill date but truncates the "year or "month 

select age(localtimestamp, date_trunc('year', localtimestamp)) as age_example

--to see all the timezones:
-- select * from pg_timezone_names
--extract: allows you to pull some part of the timestamp
-- can use date_part ( 'year', some date)