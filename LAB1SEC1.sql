create database company;

use company;

create table employee( emp_no int primary key,
 emp_name char(20),
 e_address char (30),
 e_phno int,
 dept_no int,
 dept_name char(20),
 job_id int,
 salary int);
 

 desc employee;
 INSERT INTO employee (emp_no,emp_name, e_address, e_phno, dept_no, dept_name, job_id, salary, hiredata)
VALUES (12, 'kaushal', 'nagpur', 9427, 12, 'cse', 99, 55000, '1981-05-12');
select*from employee;
select*from employee where dept_no=12;
UPDATE employee
SET e_address = 'Rajasthan'
WHERE emp_no=12;
select e_name from employee where hiredata is("1-may-81","3-dec-81","17-dec-81","19-jan-80");

