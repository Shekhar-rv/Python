-- Sería bueno traducirlo al españo amvv
--SQL Week 1 - Hands on
-- If table exisits then uncomment the below line of code:
drop table INSTRUCTOR;

-- Task 1
-- Creating a table INSTRUCTOR ith id,lastname,firstname,city and country

create table INSTRUCTOR (
ins_id integer PRIMARY KEY NOT NULL,
lastname varchar(10) NOT NULL,
firstname varchar(10) NOT NULL,
city varchar(10),country char(2));

-- Inserting values into the table 
--Task 2A

insert into INSTRUCTOR 
(ins_id,lastname,firstname,city,country)
values
(1,'Ahuja','Rav','Toronto','CA');

-- MAKE SURE YOU USE SINGLE QOUTES'' INSTEAD OF ""

--Task 2B -- Inserting mutiple values at once

insert into INSTRUCTOR 
(ins_id,lastname,firstname,city,country)
values
(2,'Chong','Raul','Toronto','CA'),
(3,'Vasudevan','Hima','Chicago','US');

-- Task 3 - Select all the rows from the table 

select * from INSTRUCTOR;

-- Task 3B - Select the firstname, lastname and country where the city is Toronto

select firstname,lastname,country from INSTRUCTOR
where city = 'Toronto';

-- Task 4 Update the row for Rav Ahuja and change his city to Markham.

update INSTRUCTOR
set city = 'Markham'
where ins_id =1;

--Task 5: Delete the row for Raul Chong from the table.

delete from INSTRUCTOR 
where ins_id =2;

--Task 5B: Retrieve all rows in the INSTRUCTOR table

select * from INSTRUCTOR;
--End of SQL Week 1 - Hands on
