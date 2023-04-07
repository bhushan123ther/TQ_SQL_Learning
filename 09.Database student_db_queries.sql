use student_db;

show tables;

select * from course;
desc course;

select * from faculty;
desc faculty;

select * from student;

CREATE TABLE student (
   stid int NOT NULL,
   sname varchar(30) NOT NULL,
   email varchar(30) DEFAULT NULL,
   phoneNo bigint NOT NULL,
   courseId int DEFAULT NULL,
   feestatus varchar(10) DEFAULT NULL,
   joiningdate date DEFAULT NULL,
  PRIMARY KEY (stid)
);

INSERT INTO student VALUES (1,'sagar','sagar@gmail.com',995651212,101,'paid','2023-01-01'),
(2,'vivek','vivek@gmail.com',554521512,102,'paid','2023-03-02'),
(3,'omkar','omkar@gmail.com',78785454,103,'paid','2023-04-05'),
(4,'suyog','suyog@gmail.com',4512154512,104,'paid','2023-10-12'),
(5,'bhushan','bhushan@gmail.com',8785421545,105,'half','2023-09-10'),
(7,'yashank','shan@gmail.com',699778845,104,'paid','2023-10-15'),
(8,'mamta','mamat@gmail.com',9988774547,103,'paid',NULL),
(10,'vaishanavi','vaish@gmail.com',99774455,101,'paid',NULL),
(11,'sairaj','sai@gmail.com',54545454,NULL,NULL,NULL);

select * from student;
#==============================================================================================================================

CREATE TABLE course (
  `courseId` int NOT NULL,
  `cname` varchar(45) NOT NULL,
  `duration` varchar(30) DEFAULT NULL,
  `fees` int DEFAULT NULL,
  PRIMARY KEY (`courseId`));

INSERT INTO course VALUES (101,'java','3 months',3000),
(102,'python','3 months',3500),(103,'.net','3months',300),
(104,'full stack','1 year',10000);

select * from course;
#------------------------------------------------------------------------------------------------------------------------------

CREATE TABLE faculty (
  `facultyId` int NOT NULL,
  `fname` varchar(30) NOT NULL,
  `phoneNo` bigint NOT NULL,
  `salary` float DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `joiningdate` varchar(45) NOT NULL,
  `experience` float DEFAULT NULL,
  `location` text,
  PRIMARY KEY (`facultyId`)
);

INSERT INTO faculty VALUES (1,'Medha',9875578905,910000,'medha@gmail.com','2020-01-01',4,NULL),
(2,'Kiran',9177800112,72000.5,'kiran@gmail.com','2020-01-02',4,NULL),
(3,'Jayshree',8900675467,68000.5,'jayshree@gmail.com','2020-01-03',5,NULL),
(4,'Shuruti',9873366895,55000.9,'shruti@gmail.com','2020-01-04',5,NULL),
(5,'Khadija',8977665540,34000,'khadija@gmail.com','2020-01-05',6,NULL),
(6,'Raksha',9006789760,45000,'raksha@gmail.com','2020-01-06',6,NULL);

select * from faculty;
#------------------------------------------------------------------------------------------------------------------------------

CREATE TABLE coursefaculty (
  `cfid` int NOT NULL,
  `courseId` int NOT NULL,
  `facultyId` int NOT NULL,
  `experience` float NOT NULL,
  PRIMARY KEY (`cfid`)
); 

INSERT INTO coursefaculty VALUES (1,101,1,0),(2,102,3,0),(3,102,4,0),(4,103,5,0),(5,103,6,0),(6,104,2,0),(7,104,6,0),(8,105,1,0);

select * from coursefaculty;
#------------------------------------------------------------------------------------------------------------------------------
drop table course,faculty,student;

# How to add foreign key to existing table

alter table student 
add foreign key(courseId) references course(courseId);

# Add new column in table student
alter table student
add column joiningDate date;

# Arrange data in ascending order of joining Date 
select * from student
order by joiningDate;

select * from student
order by joiningDate desc;

# show data in descending form whose courseId = 104 
select * from student
where courseId = 104
order by joiningDate desc;

# show the data by ascening order of course and is the course is same then
# descending order of joining date.
select * from student
order by courseId asc , joiningDate desc;

# show the student who have enrolled in course 103,104
select * from student
where courseId in (103,104);

select * from student
where courseId not in (103,104);

# show the salary between range 50000 and 95000
select * from faculty
where salary between 50000 and 950000;

# show the salary not between range 50000 and 950000
select * from faculty 
where salary not between 50000 and 950000;

# Limit
select * from faculty
where salary between 50000 and 950000
order by salary desc limit 2;

select * from student
where courseId = 104 limit 2;

# aggregate functions : avg(), min(), max(), sum(), count()

select sum(salary) as TotalSalary
from faculty;

# Alise name

select count(*) as Count
from student
where courseId = 104;

select count(*) as Count
from student;

# column name does not count null values

select count(courseId) as Count
from student;

select avg(salary) as AverageSalary
from faculty;

select max(salary) as MaxSalary
from faculty;

select min(salary) as MinSalary
from faculty;

select avg(salary) as AverageSalary
from faculty
where experience >= 5;

# Like

# start with s 
select sname from student
where sname like's%';

# end with a
select sname from student
where sname like'%a';

# min 6 characters starting from s
select * from student
where sname like 's_____%';

# show name of student who contain y
select * from student
where sname like '%y%';

# show name of student start with s and end with a
select * from student
where sname like 's%r';

select * from student
where courseId like 103;

select * from faculty
order by salary desc;

# Group By

select * from  student;

select feestatus,count(*)
from student
group by feestatus;

select courseid,count(*) as Total
from student
group by courseid;

select  courseid,count(*) as Total
from student
group by courseid
order by total desc;

select courseid,count(*) as Total
from student
group by courseid
order by total;

select courseid,count(*) as Total
from student
where courseid in(103,104)
group by courseid
order by total desc;

select courseId, count(*) as Total
from student group by courseid
having courseid in (103,104)
order by total desc;

select * from faculty;

select experience, sum(salary)
from faculty
group by experience;