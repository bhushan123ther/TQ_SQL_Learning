use employee_database;
show tables;

desc employee;
drop table employee;

create table Employee(
                     Id int, 
                     name varchar(25) not null,
                     salary float, 
                     contactNo varchar(12),
                     joiningDate date ,
                     email varchar(25),
                     deptId varchar(10),
                     experience int, 
                     address varchar(135),
                     designation varchar(25),

                     PRIMARY KEY(Id),
				     FOREIGN KEY (deptId) REFERENCES Department(deptId)
                     );
    
    alter table employee
    add FOREIGN KEY(deptId) REFERENCES Department(deptId);
    
    insert into employee values(101,'Bhushan',45000,'9834696710','2022-4-12','bhushan@gmail.com','D101',1,'Ambegaon bk.Pune','Java Developer');
    insert into employee values
	(102,'Kuhan',45000,'9834696710','2022-4-12','kuhan@gmail.com','D101',1,'Vodgaon bk.Pune','PHP Developer'),
	(103,'Roshan',65000,'9867543322','2019-2-10','roshan@gmail.com','D103',3,'Lokhand wala Mumbai','Python Developer'),
	(104,'Nitin',55000,'9056789034','2020-4-12','nitin@gmail.com','D101',2,'Safe Gate Nagpur','Java Developer'),
	(105,'Mina',75000,'5678903456','2017-4-12','mina@gmail.com','D102',5,'Warje Pool .Pune','Angular Developer');

    select * from employee;
#=============================================================================================================================== 

desc Department;
drop table department;

create table Department(
                       deptId varchar(10),
                       dName varchar(30),
                       locationId varchar(10),
                       companyId varchar(10),
                       HeadEmployeeId varchar(10),

                       PRIMARY KEY(deptId),
					   FOREIGN KEY (locationId) REFERENCES Location(locationId),
                       FOREIGN KEY (companyId) REFERENCES Company(companyId)
                       );
 
 alter table Department
 add FOREIGN KEY(locationId) REFERENCES Location(locationId);
 
 alter table Department
 add FOREIGN KEY(companyId) REFERENCES Company(companyId);
 
 insert into Department values('D101','IT','L1','CMP101','HEI101');

 insert into Department values('D102','Sales','L2','CMP103','HEI102');
                                  
 insert into Department values ('D103','IT','L3','CMP102','HEI103');
 insert into Department values ('D104','FINANCE','L4','CMP104','HEP104');
 

select * from Department;
#===============================================================================================================================

create table location(
                      locationId varchar(10),
                      LocName varchar(25),
                      cityId varchar(10),

                      PRIMARY KEY(locationId),
                      FOREIGN KEY (cityId) REFERENCES City(cityId)
                     );
                     
 alter table location 
 add FOREIGN KEY(cityId) REFERENCES City(cityId);
 
 insert into location values('L1','Hinjewadi Park','C111');
 
 insert into location values('L2','Hinjewadi Phase1','C111'),('L3','Hinjewadi Phase2','C111'),
                            ('L4','Kharadi Phase1','C222'),('L5','Balewadi Phase1','C444');
                            
 select * from location;                            
#===============================================================================================================================

create table City(
                  cityId varchar(10),
                  cityName varchar(20),
                  Pincode bigint,

                  PRIMARY KEY(cityId)
                 );

insert into City values('C111','Pune',411042);

insert into City values('C222','Pune',411048),('C333','Nagpur',431040),('C444','Delhi',555048),('C555','Mumbai',421048);

select * from city;
#===============================================================================================================================   

create table Company(
                     companyId varchar(10) primary key,
                     companyName varchar(25),
                     RegNo varchar(10),
                     startDate date
                    );
 
insert into Company values('CMP101','Mphasis','Reg11','1987-02-11');

insert into Company values('CMP102','Wipro','Reg21','1980-03-05'),('CMP103','Infosys','Reg51','1988-05-25'),
                          ('CMP104','Angular','Reg40','1990-02-05'),('CMP106','GCP','Reg31','1998-03-05');

select * from Company;