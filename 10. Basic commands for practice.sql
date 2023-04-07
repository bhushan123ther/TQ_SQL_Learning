use testcoursedb;
select * from employees;

#1. Write a query to display the names (first_name, last_name) using alias name “First Name", "Last Name" 

    select first_name as 'First Name', last_name as 'Last Name' from employees; 

# 2. Write a query to get unique department ID from employee table.

    select distinct department_Id  from employees;

# 3. Write a query to get all employee details from the employee table order by first name, descending.

    select * from employees order by first_name desc;

# 4. Write a query to get the names (first_name, last_name), salary, PF of all the employees (PF is calculated as 12% of salary).

  select first_name , last_name , salary , salary * 0.12 as TotalPF
  from employees;
  
#  5. Write a query to get the employee ID, names (first_name, last_name), salary in ascending order of salary.

    select employee_Id, first_name, last_name , salary from employees order by salary;

# 6. Write a query to get the total salaries payable to employees.

	select sum(salary) as TotalSalary from employees;

# 7. Write a query to get the maximum and minimum salary from employees table.

     select max(salary) as Maximum_Salary,min(salary) as Minimum_Salary from employees;

# 8. Write a query to get the average salary and number of employees in the employees table.

    select avg(salary) as AVERAGE_SALARY, count(*) as TotalEmployee from employees;


# 9. Write a query to get the number of employees working with the company.

          select count(*) as TotalEmployee from employees;

# 10. Write a query to get the number of jobs available in the employees table. 

      select count(job_Id) as Total_Jobs from employees;

# 11. Write a query get all first name from employees table in upper case. 

      select upper(first_name) from employees;

# 12. Write a query to get the first 3 characters of first name from employees table. 

      select substr(first_name,1,3) from employees;

# 13. Write a query to calculate 171*214+625. 

      select 171*214+625 as Result;

# 14. Write a query to get the names (for example Ellen Abel, Sundar Ande etc.) of all the employees from employees table. 

     select concat(first_name," ",last_name)as Full_Name from employees;

# 15. Write a query to get first name from employees table after removing white spaces from both side. 

    select * from employees;
    
    SELECT TRIM(first_name) AS first_name_trimmed
	FROM employees;

# 16. Write a query to get the length of the employee names (first_name, last_name) from employees table

      select length(first_name) as LengthOfFirstName , length(last_name) as LengthOfLastName from employees;
      
      select concat(length(first_name)  + length(last_name)) as LengthOfEmpFullName from employees; 

# 17. Write a query to check if the first_name fields of the employees table contains numbers. 

    select * from employees;
    
	SELECT first_name 
    FROM employees 
    WHERE first_name REGEXP '[0-9]';

    UPDATE employees SET FIRST_NAME = 'Steven' WHERE (`EMPLOYEE_ID` = '100');
    
	  
 # 18. Write a query to select first 10 records from a table. 

       select * from employees limit 1,10;

 #  Write a query to get 2th max salaries of employees.
    
    SELECT salary
    FROM employees
    ORDER BY salary DESC
    LIMIT 1 OFFSET 2;

#  Write a query to get 1th max salaries of employees.  
  
    select salary from employees order by salary desc limit 1; 
 
 # 19. Write a query to get monthly salary (round 2 decimal places) of each and every employee 
--  Note : Assume the salary field provides the 'annual salary' information.

     select * from employees;
     
      select salary , ROUND(salary / 12,2) as MonthlySalary
       from employees;