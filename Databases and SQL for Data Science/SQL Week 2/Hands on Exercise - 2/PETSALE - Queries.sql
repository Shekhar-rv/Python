-- Drop the PETSALE table in case it exists

drop table PETSALE;

-- Create the PETSALE table 

create table PETSALE (
	ID INTEGER PRIMARY KEY NOT NULL,
	ANIMAL VARCHAR(20),
	QUANTITY INTEGER,
	SALEPRICE DECIMAL(6,2),
	SALEDATE DATE
	);
	
-- Insert saple data into PETSALE table

insert into PETSALE values 
	(1,'Cat',9,450.09,'2018-05-29'),
	(2,'Dog',3,666.66,'2018-06-01'),
	(3,'Dog',1,100.00,'2018-06-04'),
	(4,'Parrot',2,50.00,'2018-06-04'),
	(5,'Dog',1,75.75,'2018-06-10'),
	(6,'Hamster',6,60.60,'2018-06-11'),
	(7,'Cat',1,44.44,'2018-06-11'),
	(8,'Goldfish',24,48.48,'2018-06-14'),
	(9,'Dog',2,222.22,'2018-06-15')
	
;

-- Queries

select * from PETSALE;

-- Query 1: Finding the sum of the sale price

select SUM(SALEPRICE) from PETSALE;

-- Query 2: Finding the sum of the sale price and assigning a column name

select SUM(SALEPRICE) AS SUM_OF_SALEPRICE from PETSALE;

-- Query 3: Finding the maximum quantity 

select MAX(QUANTITY) from PETSALE;

-- Query 4: Finding average sales price

select AVG(SALEPRICE) from PETSALE;

-- Query 5: Finding average sales price / Quantity only for dogs

select AVG(SALEPRICE /QUANTITY) from PETSALE where ANIMAL = 'Dog';

-- Query 6: Rounding the sales price of each entry to the nearest integer

select ROUND(SALEPRICE) from PETSALE;

-- Query 7: Finding the length of the characters in the coulmn animal

select LENGTH(ANIMAL) from PETSALE;

-- Query 8: Converting all the Animal names to uppercase

select UCASE(ANIMAL) from PETSALE;

-- Query 9: Finding the distinct animal names and returning them in Uppercase

select DISTINCT(UCASE(ANIMAL)) from PETSALE;

-- Query 10: Finding the details where Animal name cat is saved as lowercase

select * from PETSALE where LCASE(ANIMAL) = 'cat';

-- Query 11: Finding the days from the dates where cats were sold. 

select DAY(SALEDATE) from PETSALE where ANIMAL = 'Cat';

-- Query 12: Finding the sales on the month of March.

select COUNT(*) from PETSALE where MONTH(SALEDATE)='05';

-- Query 13: Finding date 3 days from the salesdate

select (SALEDATE + 3 DAYS) from PETSALE;

-- Query 14: Subtracting the current date from the sales date

select (CURRENT DATE - SALEDATE) from PETSALE;




