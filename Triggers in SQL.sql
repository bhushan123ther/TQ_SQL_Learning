use student_db;
show tables;

select * from student;
select * from course;

alter table course
add column scount int 
after fees;

update course
set  scount = (select count(*) from student
               group by courseid having course.courseid = student.courseid);
               
insert into student values(6,'Rohi','ro@gmail.com','8976543728',105,'Half Paid','2023-03-02');             
          
# How to make trigger  
-- go to table structure then triggers then click on (+) to create trigger.
/*        
CREATE DEFINER=`root`@`localhost` TRIGGER `course_BEFORE_INSERT` BEFORE INSERT ON `course` FOR EACH ROW BEGIN
   if new.fees < 20000
   then
   signal sqlstate '26000'
   set message_text = "Fees should be greater than 20000";
   end if;
END

*/   


# How to drop the trigger
DROP TRIGGER IF EXISTS course_BEFORE_INSERT;


insert into course values(105,'Angular','4 month',15000,1);        
insert into course values(105,'Angular','4 month',25000,1);  
   
insert into course values(106,'React','4 month',19000,0);   
insert into course values(106,'React','4 month',22000,0);


# In student table 
-- After Insert : update the course : increase the scount

/*
CREATE DEFINER=`root`@`localhost` TRIGGER `student_AFTER_INSERT` AFTER INSERT ON `student` FOR EACH ROW BEGIN
  update course
  set scount = scount + 1
  where courseid = new.courseid;
END
*/  

select * from student;
select * from course;

insert into student values(13,'Gopal','gopal@gmail.com','9765437567',106,'Half Paid','2023-03-02');    
  
 -- create logtable           
 -- use for tracking our data 
 
 create table logtable(
  logid int primary key auto_increment,
  action_task varchar(30),
  done_on date,
  details varchar(135));
  
  select * from logtable;
  
  drop table logtable;
  
  -- course_Before_update trigger
  /*
  CREATE DEFINER=`root`@`localhost` TRIGGER `course_BEFORE_UPDATE` BEFORE UPDATE ON `course` FOR EACH ROW BEGIN
  insert into logtable
  values("courseBeforeUpdate",now(),concat(old.courseId," ",old.cname," ",old.duration," ",old.fees,old.scount));
END
  */
  
  UPDATE course SET fees = 35000
  WHERE courseId = 105;
  
  -- course_After_update trigger
  /*
  CREATE DEFINER=`root`@`localhost` TRIGGER `course_AFTER_UPDATE` AFTER UPDATE ON `course` FOR EACH ROW BEGIN
    insert into logtable (actiontask, doneon, details)
  values("courseAfterUpdate",now(),concat(old.courseId," ",old.cname," ",old.duration," ",old.fees,old.scount));
END
  */
  
  -- course_Before_delete
  
  /*
  CREATE DEFINER=`root`@`localhost` TRIGGER `course_BEFORE_DELETE` BEFORE DELETE ON `course` FOR EACH ROW BEGIN
   if exists(select courseid from student where courseid = old.courseid)
   then
   signal sqlstate'46000'
   set message_text = "Student exists in this course... cannot delete it";
   end if;
END
  */
  
  -- course_After_delete
  /*
  CREATE DEFINER=`root`@`localhost` TRIGGER `course_AFTER_DELETE` AFTER DELETE ON `course` FOR EACH ROW BEGIN
  insert into logtable (actiontask, doneon, details)
  values("courseDeleted",now(),concat(old.courseId," ",old.cname," ",old.duration," ",old.fees,old.scount));
END
  */
  
  select * from course;
  
  delete from course
  where courseid = 101;   -- can not delete because after 101 5 records exists
  
  delete from course
  where courseid = 106;