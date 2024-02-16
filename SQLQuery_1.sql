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

 select empName,LEN(empName) from employee_info;


