
ALTER TABLE table_name
ADD PRIMARY KEY(column_name);                                                   -- How to add primary key


ALTER TABLE table_name
ADD FOREIGN KEY(xyz_column) REFERENCES another_table_name(xyz_column);           -- How to add foreign key          


-- Example :

ALTER TABLE Supplier
ADD PRIMARY KEY(supID);                                           -- adding primary key to table Supplier

ALTER TABLE Item
ADD PRIMARY KEY(item_Id);                                         -- adding primary key to table Item

ALTER TABLE Item
ADD FOREIGN KEY(supId) REFERENCES Supplier(supId);               -- adding foreign key

ALTER TABLE Item
DROP FOREIGN KEY sup_idfk;                                       -- droping foreign key from table

ALTER TABLE Supplier
DROP PRIMARY KEY ;                                        -- droping primary key from table