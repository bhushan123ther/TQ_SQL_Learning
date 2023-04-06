-- delete quries.

use bookstall_db;        -- use bookstall_db database
show tables;             -- use to see all tables present in database

select * from book;      -- use to fetch all data from table book   

delete from book
where book_id='B105';    -- use to delete record from table 

ALTER TABLE book
DROP COLUMN book_Name;   -- use to delete bookName table from book table.
 
delete from book
where book_Name="C" and price=500;  -- delete specific record where bookName = C and price = 500

truncate table book;     -- use to remove all the rows from a table and table structure remains as it is

drop table book;         -- use to delete whole table 

drop database database_name;  -- use to delete database permanantly

#======================================================================================================================

-- update quries

-- syntax : 
-- update tableName
-- set .....
-- where ...

select * from faculty;   

#increase salary by 10000

update faculty
set salary = salary+10000;                -- use to increase salary by 10000 


update faculty
set salary= salary +(0.1*salary)
where experience>=5;                      -- use to increase salary by 10% whoes experience is greater that 5

update faculty
set experience=experience+2
where fname= "Khadija";                    -- use to increase experience by 2 whoes name is khadija

select * from student;      

update student 
set courseid= 102
where sname like "Vivek";                  -- use to set courseId = 102 whoes name is vivek

update student
set courseid= 105
where courseid=106;                       -- use to set courseid = 105 whoes courseId = 106

select * from course;                    -- use to fetch all data from course table

update course
set duration="4 months"
where cname="java";                        -- use to set duration = 4 month whoes course name is Java

update course
set duration="4 months"
where cname="java" or cname="python";       -- use to set duration = 4 month whoes course name is Java or python


update course
set fees= fees+5000
where duration= "4 months";                  -- use to increase fees by 5000 whoes course duration is 4 month