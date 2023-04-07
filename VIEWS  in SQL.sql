use student_db;
show tables;

select * from student;
select * from course;

# -----------------------------------------------------------------------------------------
-- VIEWS in SQL
-- view is virtual table i.e created when we want to show some data according to the database that can 
-- be done with the help of joins and with the help of single table.

-- Whatever changes are there , they are also replected in view


-- To drop view from table
drop view fees_issue;

-- To create view 
create view fees_issue as
select sname , phoneNo , feestatus
from student where feestatus in ("Half Paid","Not Paid");

create view three_month_duration as
select courseId , cname ,  fees 
from course
where duration = "3 months";

-- To see view 
select * from fees_issue;

select * from three_month_duration;

update student
set feestatus = "Full paid"
where stid = 104;

# join

select * from student;

create view student_in_course as
select c.courseid, c.cname, c.fees, count(s.stid) as TotalStudent
from student s join course c
on s.courseid = c.courseid
group by s.courseid;               -- use to create view using joins

drop view student_in_course;       -- use to drop view from table


select * from student_in_course;   -- use to see view in table














