--- Sub queries, Nested Selects and working with Multiple tables

--- Query 1:
--- Consider the EMPLOYEES table from the previous lesson. 
--- Lets say we want to retrieve the list of employees who earn more than the average salary. 

select * from employees 
	where salary > avg(salary);

-- limitations of built-in aggregate functions like AVG() is that they cannot always be evaluated in the WHERE clause

--- Nested selects works for this query

select EMP_ID, F_NAME, L_NAME, SALARY from employees 
	where SALARY < 
	(select AVG(SALARY) from employees);
	
--- IN operator can also be used and there can be multiple leves of sub-queries

select EMP_ID, F_NAME, L_NAME, DEP_ID from employees 
	where DEP_ID IN  
	( select DEP_ID from employees where DEP_ID > 
	( select MIN(DEP_ID) from employees ) 
 );
 
 --- The sub-select doesn't just have to go in the where clause, it can also go in other parts of the query such as in the list of columns to be selected:
 
select EMP_ID, SALARY,
	( select AVG(SALARY) from employees ) 
	AS AVG_SALARY
	from employees ;
	
--- Another option is to make the sub-query be part of the FROM clause:

select * from 
	( select EMP_ID, F_NAME, L_NAME, DEP_ID 
	from employees) ;
	
--- I. Sub-queries

--- Retrieve only the employee records that correspond to departments in the DEPARTMENTS table

select * from employees 
	where DEP_ID IN
	( select DEPT_ID_DEP from departments );
  
--- Retrieve only the list of employees from a specific location.

select * from employees 
	where DEP_ID IN
	( select DEPT_ID_DEP from departments 
	where LOC_ID = 'L0002' );
	
--- Retrieve the department ID and name for Empolyees who earn more than 70000:

select DEPT_ID_DEP, DEP_NAME from departments
	where DEPT_ID_DEP IN
	( select DEP_ID from employees 
	where SALARY > 70000 ) ;
	
--- II. Implicit Join 

--- Here we specify two tables in the query (but note we are not explicitly using the JOIN operator). 
---The result is a full join (or cartesian join), because every row in the first table is joined with every row in the second table. 
---If you examine the result set you will see more rows than in both tables individually

select * from employees, departments;

--- We can use additional operands to limit the result set. In the following example we limit the result set to only rows with matching department IDs:

select * from employees, departments 
	where employees.DEP_ID = departments.DEPT_ID_DEP;
	
--- Notice that in the where clause we pre-fixed the name of the column with the name of the table to fully qualify the column name since its possible -
--- that the different tables could have the some column names that are exactly the same. 
--- Since the table names can be sometimes long, we can use shorther aliases for table names as follows: 

select * from employees E, departments D 
	where E.DEP_ID = D.DEPT_ID_DEP;
	
--- Similarly, the column names in the select clause can be pre-fixed by aliases:

select E.EMP_ID, D.DEPT_ID_DEP  
	from employees E, departments D 
	where E.DEP_ID = D.DEPT_ID_DEP;

--- Let's say we want to see the department name for each employee:

select E.EMP_ID, D.DEP_NAME from 
	employees E, departments D
	where E.DEP_ID = D.DEPT_ID_DEP;