--SQL Week 2 - HR Table creation

--- Creating the HR Database tables

CREATE TABLE EMPLOYEES (
                            EMP_ID CHAR(9) NOT NULL, 
                            F_NAME VARCHAR(15) NOT NULL,
                            L_NAME VARCHAR(15) NOT NULL,
                            SSN CHAR(9),
                            B_DATE DATE,
                            SEX CHAR,
                            ADDRESS VARCHAR(30),
                            JOB_ID CHAR(9),
                            SALARY DECIMAL(10,2),
                            MANAGER_ID CHAR(9),
                            DEP_ID CHAR(9) NOT NULL,
                            PRIMARY KEY (EMP_ID));
                            
  CREATE TABLE JOB_HISTORY (
                            EMPL_ID CHAR(9) NOT NULL, 
                            START_DATE DATE,
                            JOBS_ID CHAR(9) NOT NULL,
                            DEPT_ID CHAR(9),
                            PRIMARY KEY (EMPL_ID,JOBS_ID));
 
 CREATE TABLE JOBS (
                            JOB_IDENT CHAR(9) NOT NULL, 
                            JOB_TITLE VARCHAR(15) ,
                            MIN_SALARY DECIMAL(10,2),
                            MAX_SALARY DECIMAL(10,2),
                            PRIMARY KEY (JOB_IDENT));

CREATE TABLE DEPARTMENTS (
                            DEPT_ID_DEP CHAR(9) NOT NULL, 
                            DEP_NAME VARCHAR(15) ,
                            MANAGER_ID CHAR(9),
                            LOC_ID CHAR(9),
                            PRIMARY KEY (DEPT_ID_DEP));

CREATE TABLE LOCATIONS (
                            LOCT_ID CHAR(9) NOT NULL,
                            DEP_ID_LOC CHAR(9) NOT NULL,
                            PRIMARY KEY (LOCT_ID,DEP_ID_LOC));
                            
                         
--- Queries

select * 
	from EMPLOYEES;

select * 
	from DEPARTMENTS;

--- Query 1 

select * 
	from EMPLOYEES 	
	where address like '%Elgin,IL%';
	
--- Query 2

select * 
	from EMPLOYEES
	where B_DATE like '197%'; 
	
--- Query 3

select * 
	from EMPLOYEES 	
	where (SALARY between 60000 and 70000) and DEP_ID = 5;
	
--- Query 4A

select * 	
	from EMPLOYEES
	order by DEP_ID;
	
--- Query 4B

select * 
	from EMPLOYEES
	order by DEP_ID desc,L_NAME desc;
	
--- Query 5A

select DEP_ID,count(DEP_ID)
	as count
	from EMPLOYEES
	group by DEP_ID;
	
--- Query 5B

select count(DEP_ID), avg(SALARY)
	from EMPLOYEES
	group by DEP_ID;

--- Query 5C

select DEP_ID,count(DEP_ID) as "NUM_EMPLOYEES", avg(SALARY) as "AVG_SALARY"
from EMPLOYEES
group by DEP_ID;

--- Query 5D

select DEP_ID,count(DEP_ID) as "NUM_EMPLOYEES", avg(SALARY) as "AVG_SALARY"
from EMPLOYEES
group by DEP_ID
order by AVG_SALARY;

--- Query 5E 

select DEP_ID,count(DEP_ID) as "NUM_EMPLOYEES", avg(SALARY) as "AVG_SALARY"
from EMPLOYEES
group by DEP_ID
having count(DEP_ID) < 4
order by AVG_SALARY;
--End of SQL Week 2 - HR Table creation
