use sample_db;

create table Movies(movieId int primary key,
					movieName varchar(50),
                    releaseYear int ,
                    boxofficeCollection bigint);
                    
                    
create table Roles(rollId int primary key,
                   rollName enum('1-producer' ,
                                 '2-director', '3-hero',
                                 '4-heroine', '5-villain'
                                 ) not null);
drop table Roles;  
                               
select * from Roles;    

#======================================================================

create table Celebrity(celebrityId int primary key,
                       celebrityName varchar(30),
					   bod date,
                       phoneNum varchar(12),
                       email varchar(50)); 
                       
 #=====================================================================
 
 create table Bollywood(Bollywood_Id varchar(5) primary key,
                       celebrityId int,
					   movieId int,
                       rollId int,
                       FOREIGN KEY (celebrityId) REFERENCES Celebrity(celebrityId),
                       FOREIGN KEY (movieId) REFERENCES Movies(movieId),
                       FOREIGN KEY (rollId) REFERENCES Roles(rollId)
                       );
				   
