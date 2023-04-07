use testcoursedb;

show tables;

select * from employees;

select distinct(salary) from employees
order by salary desc;

select count(distinct(salary)) from employees
order by salary;

# Find 3rd highest salary

select distinct salary
from employees e1 
where 3 = (select count(distinct(salary))
           from employees e2
		   where e1.salary <= e2.salary);
           
#OR

select distinct salary
from employees
order by salary desc limit 2,1;

# OR       
     
select min(salary) from employees;

select distinct(salary) from employees
 order by salary desc limit 3;

select min(salary) from
(select distinct(salary) from employees
 order by salary desc limit 3) as ThirdHighestSalary;     
       
#================================================================================================================
           
# Find 3rd lowest salary 

select distinct salary
from employees e1
where 3 = (select count(distinct(SALARY))
           from employees e2
           where e1.salary >= e2.salary);
           
# OR

select distinct salary
from employees
order by SALARY limit 2,1;

# OR

select max(salary) 
from (select distinct(salary) from employees
 order by salary asc limit 3) as ThirdLowestSalary;
           
#======================================================================================================          

# 3rd highest number

select * from employees;

select distinct salary 
from employees 
order by salary desc limit 2,1;

select distinct salary 
from employees e1 
where 3 = (select count(distinct(salary))
           from employees e2
		   where e2.salary >= e1.salary);


select min(salary) from employees;

select distinct(salary) from employees
order by salary desc limit 3;

select min(salary) from 
(select distinct(salary) from employees
order by salary desc limit 3) as ThirdHighestSalary;



select min(salary) from employees
order by salary desc;

select min(salary) from 
(select distinct(salary) from 
employees order by SALARY desc limit 2) as SecondHighestSal;



















       
           
           