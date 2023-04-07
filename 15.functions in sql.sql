use testcoursedb;

show tables;

select * from employees;


# Add function
/*
CREATE DEFINER=`root`@`localhost` FUNCTION `addNumber`(a int , b int) RETURNS int
    DETERMINISTIC
BEGIN
     declare ans int;
     set ans = a+b;
     return ans;
END
*/
# select addNumber(3,2);   -- function calling

# Sub function

/*
CREATE DEFINER=`root`@`localhost` FUNCTION `subNumber`(a int, b int) RETURNS int
    DETERMINISTIC
BEGIN
   declare ans int;
   set ans = a - b;
RETURN ans;
END
*/

select subNumber(5,1);       -- funciton calling

drop function sub_Numbers;   -- use for function droping

-- multiplication function
/*
CREATE DEFINER=`root`@`localhost` FUNCTION `mulNumber`(a int , b int) RETURNS int
    DETERMINISTIC
BEGIN
   declare ans int;
   set ans = a * b;
RETURN ans;
END
*/

-- select mulNumber(2,5);

-- divide function

/*
CREATE DEFINER=`root`@`localhost` FUNCTION `divNumber`(a int , b int) RETURNS int
    DETERMINISTIC
BEGIN
  declare ans int;
  set ans = a / b;
RETURN ans;
END
*/

#select divNumber(4,2);


# Function for greatest number

/*
CREATE DEFINER=`root`@`localhost` FUNCTION `greatestNum`(a int , b int) RETURNS int
    DETERMINISTIC
BEGIN
   declare result int;
   if(a > b)
    then return a;
   else
    return b;
   end if;
END
*/

-- select greatestNum(3,5);  -- calling function

/*
 result = 1
			    pow = 3 , base = 2       
                 result = 1 * 2 => 2
                 pow = 3 - 1  => 2      pow >= 1
                 
                 pow = 3 - 1 => 2       pow >= 1
                 result = 2 * 2  => 4
                 pow = 2 - 1  => 1      pow >= 1
                 
                 result = 4 * 2 => 8
                 pow = 1-1 => 0
*/

#===============================================================================================================================

# Function for power number

/*
CREATE DEFINER=`root`@`localhost` FUNCTION `powerNumber`(base int , pow int) RETURNS int
    DETERMINISTIC
BEGIN
set @result = 1;
 while(pow>=1)
  do
   set @result = @result * base;
    set pow = pow-1;
  end while;  
RETURN @result;
END
*/

-- select powerNumber(2,3);  calling function 

select * from employees;

#========================================================================================================================================
# Function for finding experience

/*
CREATE DEFINER=`root`@`localhost` FUNCTION `experience`(hire_date date) RETURNS int
    DETERMINISTIC
BEGIN
     RETURN (year(current_date())-year(hire_date));
END
*/

-- select employee_id , concat(first_name ," ",last_name) as FullName , experience(hire_date) as TotalExperience
-- from employees;


#===============================================================================================================================
# Find the bonus

/*CREATE DEFINER=`root`@`localhost` FUNCTION `calbonus`(emp_id int , percent float) RETURNS float
    DETERMINISTIC
BEGIN
     declare temp float;
     declare bonus float;
     select salary into temp 
     from employees where employee_id = emp_id;
     
     set bonus = temp * percent;
     
RETURN bonus;
END*/
                                                              
															
select * from employees;

select employee_id , concat(first_name ," ",last_name) as FullName, salary , calbonus(employee_id,0.1) as DiwaliBonous
from employees;

