create database BikeShowRoom;
show databases;
use bikeshowroom;
show tables;

select * from customer;
select * from feedback_rating;
select * from model;
select * from payment_mode;
select * from purchase;
#====================================================================================================================================

create table Model(model_Id int primary key, model_name varchar(30), cost double);
insert into Model values(101,'Hero XPulse2004V',136000);

insert into Model values(102,'Royal Enfield Hunter350',150000),(103,'Bajaj Pulser150',104000),(104,'Bajaj Pulsar N250',138000),
(105,'Royal Enfield classic 350',184000);

# show the total cost of each model name

select sum(cost) as TotalCost from Model;

select model_name,cost from Model;

# Increase the cost of each bike by 10%

update Model set cost = cost + (0.1 * cost);

# show the average cost of all the modelname

select avg(cost) as AverageCost from model;

select * from Model;
#-----------------------------------------------------------------------------------------------------------------------------------------------------------
create table Customer(cust_Id int primary key, first_name varchar(30) not null , last_name varchar(30), mobile_number bigint, gender varchar(7) not null);

insert into Customer values(1,'Ram','Ther',8745673820,'Male'),(2,'Akash','Rane',9945673810,'Male'),(3,'Ganesh','Sawant',7765644840,'Male'),
(4,'Neha','Mire',9874345960,'Female'),(5,'Sant','Hiwale',8745645901,'Male');

# add column email

alter table Customer
add column email varchar(30);

# show the customer whose mobile number is not given
select first_name,last_name from customer where  mobile_number='null';

select * from Customer;

#----------------------------------------------------------------------------------------------------------------------------------------------------------------

create table Purchase(purchase_Id int primary key, cust_Id int, model_Id int, booking_amount double, payment_Id varchar(20) , purchase_date date, rating_Id varchar(15));

drop table Purchase;

select * from Purchase;

insert into Purchase values(111,1,101,25000,'p101','2023-02-27','rt5'),(222,1,102,5000,'p103','2023-03-01','rt3'),(333,3,103,25000,'p102','2023-03-21','rt5'),
(444,5,105,20000,'p101','2023-04-1','rt5'),(555,3,104,2000,'p103','2023-03-11','rt4');

# adding foreign key 

alter table Purchase
add foreign key(cust_Id) references Customer(cust_Id);

alter table Purchase
add foreign key(model_Id) references Model(model_Id);

alter table Purchase
add foreign key(payment_Id) references Payment_mode(payment_Id);

alter table Purchase
add foreign key(rating_Id) references Feedback_rating(rating_Id);

# show the average cost of all the model name
select * from purchase where booking_amount > 20000;
#----------------------------------------------------------------------------------------------------------------------------------------------------------------

create table Payment_mode(payment_Id varchar(20) primary key, payment_type varchar(45));
drop table Payment_mode;

insert into Payment_mode values('p101','online');

insert into Payment_mode values('p102','cash'),('p103','checque');

select * from Payment_mode;

#----------------------------------------------------------------------------------------------------------------------------------------------------------------

create table Feedback_rating(rating_Id varchar(15) primary key, rating varchar(45));
drop table Feedback_rating;

insert into Feedback_rating values('rt1','4star'),('rt2','5star'),('rt3','3star'),('rt4','4star'),('rt5','5star');

# show the number of rating of each model for each model rating type in decreasing order.
select * from Feedback_rating order by (rating) desc;

select * from Feedback_rating;
#----------------------------------------------------------------------------------------------------------------------------------------------------------------
show tables;
