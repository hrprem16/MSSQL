CREATE database employeeDB;
use employeeDB;

create table employee_info (
    empId INTEGER PRIMARY KEY,
    empName VARCHAR(20) NOT NULL,
    empSalary Decimal(10,2) NOT NULL,
    job VARCHAR(20) ,
    phone BIGINT UNIQUE,
    deptId INTEGER NOT NULL
);

insert into employee_info VALUES(1,'Ankit',6000,'Sr.Developer',9876543212,101),(2,'Prince',25000,'Manager',7654323456,102);
insert into employee_info VALUES(3,'Chandru',8000,'Technical Staff',9876543202,103);
insert into employee_info VALUES(4,'Kunal',9000,'jr.Developer',9876543312,104);
insert into employee_info VALUES(5,'Dhanush',8000,'jr.Developer',9866543312,105);
insert into employee_info VALUES(6,'Dhanush',8000,'jr.Developer',9861543312,104);

SELECT *FROM employee_info;

SELECT *FROM employee_info WHERE empName LIKE 'A%'; 

update employee_info set job='Chief Executive' WHERE deptId=102;
update employee_info set job='Founder', phone=8765345675 WHERE deptId=101;

delete from employee_info where deptId=103; -- delete the records which is having deptId=103
select *from employee_info;
DELETE from employee_info; --delete all the records from the table
select *from employee_info order BY empSalary;
select empSalary FROM employee_info ORDER BY empSalary;
select empName FROM employee_info ORDER BY empSalary;

select SUM(empSalary) from employee_info;
select MAX(empSalary) from employee_info;
 select EXP(1);

 select empName,LEN(empName) from employee_info; --LEN(column_name) is used 

 create table tbl_user_login(
    userid INT PRIMARY KEY IDENTITY,
    user_Name VARCHAR(50) NOT NULL UNIQUE,
    email VARCHAR(100),
    password VARCHAR(50) NOT NULL
 );
 INSERT into tbl_user_login VALUES
 ('ironman','tony@stark.com','tony123'),
 ('captain','steve@captain.com','steve456'),
 ('wonder','wonder@woman.com','wonder123');

 select *from tbl_user_login;

select user_Name from tbl_user_login WHERE email='steve@captain.com';
SELECT GETDATE() as today_date; -- will give today date with the column name today_date

select DATENAME(month , CURRENT_TIMESTAMP) as month;
select DATEDIFF(month,'JANUARY 6 1995',CURRENT_TIMESTAMP);
select DATEDIFF(YEAR,'JANUARY 6 1995',CURRENT_TIMESTAMP) As AgeinYear;
select DATEDIFF(MONTH,'JANUARY 6 1995',CURRENT_TIMESTAMP) As AgeinMonth;
select DATEDIFF(HOUR,'JANUARY 6 1995',CURRENT_TIMESTAMP) As AgeinHOUR;
select DATEDIFF(YEAR,'JANUARY 6 1995','DECEMBER 1 2023') As AgeinHOUR;


SELECT DATEADD(YEAR,100,CURRENT_TIMESTAMP) AS "100YearFromNow";
SELECT DATEADD(HOUR,100,CURRENT_TIMESTAMP) AS "100HoursFromNow";
SELECT DATEADD(MONTH,100,CURRENT_TIMESTAMP) AS "100MonthFromNow";

select deptId from employee_info GROUP BY deptId;
select deptId,SUM(empSalary) from employee_info GROUP BY deptId;

select deptId, SUM(empSalary) from employee_info GROUP by deptId having deptId=104;
select deptId, SUM(empSalary) from employee_info where deptId=104 GROUP by deptId;


select TOP(4) deptId from employee_info;
select TOP(4) empSalary from employee_info order by empSalary DESC ;

create database emp_details;
use emp_details;
select * INTO emp_details_info from employeeDB.dob.employee_info;
select *from emp_details_info;

Alter table emp_details_info add  age int;

use emp_details;
create table emp_info(
    id int,
    name VARCHAR(10)

);
alter TABLE emp_info add roll_num int UNIQUE;
insert into emp_info VALUES(1,'Prince',57);
select *from emp_info;
alter table emp_info add phone BIGINT;

alter table emp_info ADD city VARCHAR(10) null CONSTRAINT eID_Unique_Key not null;
alter table emp_info alter column city VARCHAR(10);
insert into emp_info VALUES(2,'Ankit',58,98762345,'patna');
select *from emp_info;

create table company_info(id int);

ALTER table company_info ADD revenue DECIMAL(10,2) null, projectID INTEGER CONSTRAINT pID_pk PRIMARY KEY;
select *FROM company_info;

-- JOIN QUERIES
create table EMPLOYEE(
    emp_Id int PRIMARY Key,
    emp_Name VARCHAR(20),
    emp_Salary int DEFAULT 25000,
    emp_deptId VARCHAR(10)
);

CREATE table DEPARTMENT(
    dept_Id VARCHAR(10) not null,
    dept_Name VARCHAR(20),
    dept_Location VARCHAR(20)

);
INSERT into EMPLOYEE 
VALUES(1111,'STEVE',35000,'D1'),(1112,'ADAM',28000,'D2'),(1113,'JOHN',50000,'D3'),(1114,'MIKE',45000,'D4'),(1115,'PETER',60000,'D5');

UPDATE EMPLOYEE SET emp_deptId='D2' WHERE emp_Id=1114;

Insert into DEPARTMENT VALUES
('D1','DEVELOPMENT','CALIFORNIA'),('D2','MARKETING','MUMBAI'),('D3','ACCOUNTS','NEWYORK'),('D4','MANAGEMENT','SYDNEY');

SELECT *FROM EMPLOYEE;
SELECT *FROM DEPARTMENT;

--INNER JOINS - return the intersection of both the tables

select emp_Id,emp_Name,emp_Salary,dept_Name,dept_Location from EMPLOYEE INNER JOIN DEPARTMENT 
ON EMPLOYEE.emp_deptId=DEPARTMENT.dept_Id;

                        --OR

select e.emp_Id, e.emp_Name, e.emp_Salary, d.dept_Name,d.dept_Location 
from EMPLOYEE as e INNER JOIN DEPARTMENT as d 
ON e.emp_deptId=d.dept_Id;

--LEFT OUTER JOIN  OR LEFT JOIN - it will return the left table records and the matching values in the right side table 
select e.emp_Id, e.emp_Name, e.emp_Salary, d.dept_Name,d.dept_Location 
from EMPLOYEE as e LEFT OUTER JOIN DEPARTMENT as d 
ON e.emp_deptId=d.dept_Id;

--RIGHt OUTER JOIN OR RIGHT JOIN - it will return the right table records and the matching values in the Left side table 
select e.emp_Id, e.emp_Name, e.emp_Salary, d.dept_Name,d.dept_Location 
from EMPLOYEE as e RIGHT OUTER JOIN DEPARTMENT as d 
ON e.emp_deptId=d.dept_Id; 

select Top(3) *from EMPLOYEE WHERE emp_Salary>30000;

-- FUll Outer Join - it will return records with combination of left-hand table and right-hand table
select e.emp_Id, e.emp_Name, e.emp_Salary, d.dept_Name,d.dept_Location 
from EMPLOYEE as e FULL OUTER JOIN DEPARTMENT as d 
ON e.emp_deptId=d.dept_Id; 

--SubQuery
SELECT *from EMPLOYEE;
SELECT emp_Salary from EMPLOYEE where emp_Name='MIKE';
--Display name,salary of the employees whose salary is greater than Mike's salary 
SELECT emp_Name,emp_Salary FROM EMPLOYEE  WHERE emp_Salary> (SELECT emp_Salary from EMPLOYEE where emp_Name='MIKE');

--Display name,salary of the employees whose salary is greater than Adam' salary  and deptno same as Adam's deptno.

SELECT emp_Name, emp_Salary from EMPLOYEE 
where emp_Salary> (SELECT emp_salary from EMPLOYEE where emp_Name='ADAM') and emp_deptId=(select emp_deptId from EMPLOYEE WHERE emp_Name='ADAM');
-- Display the employee information whose department is located at New York
select emp_Id, emp_Name,emp_Salary,emp_deptId, dept_Name,dept_Location from EMPLOYEE LEFT JOIN DEPARTMENT
ON EMPLOYEE.emp_deptId=DEPARTMENT.dept_Id WHERE dept_Location='NEWYORK' ;



 