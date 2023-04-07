use student_db;

create table copy_faculty 
as select * from faculty;   -- use to copy whole table to another table

select * from copy_faculty;
select * from faculty;

-- use to drop specific column from table 
alter table faculty
drop column location;

# ============================================================================================================

-- Index
-- Index is something by which we can retrieve data fast from database
-- Index is data structure that helps us to retrieve the records from the database.
-- It is used to access fast data from data structure. 

-- To create index
alter table faculty
add index(phoneNo);

-- To view index
show index from faculty;

-- retrieve data using index
select * from faculty
where phoneNo = 8900675467;

-- To drop index
drop index phoneNo on faculty;

-- To give name to the index
create index p1 
on faculty(phoneNo);


