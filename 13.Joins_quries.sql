use testcoursedb;

show tables;

#1. Write a query to find the addresses (location_id, street_address, city, state_province, country_name) of all the departments.

   select * from locations;
   select * from countries;

  select location_id,street_Address,city,state_province,country_name
  from locations l join countries c
  where l.country_ID = c.country_ID; 
  
SELECT location_id, street_address, city, state_province, country_name
FROM locations
NATURAL JOIN countries;

#2. Write a query to find the names (first_name, last name), department ID and name of all the employees.
select * from employees;
select * from departments;

# this query not working 
-- select first_name, last_name, department_id, department_name 
-- from employees e JOIN departments d
-- where e.department_id = d.department_id; 

SELECT first_name, last_name, department_id, department_name 
FROM employees 
JOIN departments USING (department_id);

# 3. Find the names (first_name, last_name), job, department number, and department name of the employees who work in London.

SELECT e.first_name, e.last_name, e.job_id, e.department_id, d.department_name 
FROM employees e 
JOIN departments d 
ON (e.department_id = d.department_id) 
JOIN locations l ON 
(d.location_id = l.location_id) 
WHERE l.city = 'London';


-- 4. Write a query to find the employee id, name (last_name) along with their manager_id, manager name (last_name).

SELECT e.employee_id as 'Emp_Id', e.last_name  as 'Employee', 
m.employee_id as 'Mgr_Id', m.last_name as 'Manager' 
FROM employees e 
join employees m 
ON (e.manager_id = m.employee_id);


-- 5. Find the names (first_name, last_name) and hire date of the employees who were hired after 'Jones'.

SELECT e.first_name, e.last_name, e.hire_date 
FROM employees e 
JOIN employees davies 
ON (davies.last_name = 'Jones') 
WHERE davies.hire_date < e.hire_date;


-- 6. Write a query to get the department name and number of employees in the department.
   select d.department_name , count(*) as 'No fo Employees' from employees e
   join departments d
   where e.department_id = d.department_id;
   
SELECT department_name AS 'Department Name', 
COUNT(*) AS 'No of Employees' 
FROM departments 
INNER JOIN employees 
ON employees.department_id = departments.department_id 
GROUP BY departments.department_id, department_name 
ORDER BY department_name;

   
-- 7. Find the employee ID, job title, number of days between ending date and
-- starting date for all jobs in department 90 from job history.

SELECT employee_id, job_title, end_date-start_date Days FROM job_history 
NATURAL JOIN jobs 
WHERE department_id=90;


-- 8. Write a query to display the department ID, department name and
-- manager first name.

SELECT d.department_id, d.department_name, d.manager_id, e.first_name 
FROM departments d 
INNER JOIN employees e 
ON (d.manager_id = e.employee_id);
