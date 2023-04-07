use testcoursedb;

show tables;

# String functions

# Find the length of string 'Java'
select length("Java");
select length("Java")from dual;     # dual is temparay table

# Combine two strings together
select concat("Bhushan"," ","Ther") as Full_Name;

# chech the index of character
select instr("Java",'a');

# Returning sub-string  // get 4 character form 2nd index
select substr("Bhushan",2,4);   # 2 is starting point and 4 is length of character

select substr("Bhushan",-3,2);

# combile two string and find ther length
select length(concat("Bhushan","Ther"));

select ascii('t');
select ascii('a');
select ascii('z');
select ascii('A');
select ascii('Z');

# UPPER AND LOWER functions of string

select upper('bhushan');
select lower('BHUSHAN');

select format("0.481","Percent");

