
create database BookStall_db;  -- use for creating database

use BookStall_db;  -- for using Sample_db database

-- create table Book and set book_Id as Primary key

create table Book(book_Id varchar(5) primary key,
				  book_Name varchar(25), 
				  author_Id int,
			      price double);
                  
-- Insert values in Book table 

INSERT INTO Book(book_Id, book_Name, author_Id, price) VALUES ('B101','C',001,500);   -- inserting single records 
INSERT INTO Book VALUES('B102','C++',002,600),
                        ('B103','Angular',003,400),
                        ('B104','Python',004,600),
                        ('B105','Java',005,600);                                      -- inserting multiple records at single time
                        
                        

