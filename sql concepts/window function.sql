CREATE TABLE employees (
emp_id INTEGER,
emp_name CHARACTER VARYING(50),
dept_name CHARACTER VARYING(50),
salary INTEGER
);

INSERT INTO employees (emp_id, emp_name, dept_name, salary) VALUES
(101, 'Mohan', 'Admin', 4000),
(102, 'Rajkumar', 'HR', 3000),
(103, 'Akbar', 'IT', 4000),
(104, 'Dorvin', 'Finance', 6500),
(105, 'Rohit', 'HR', 3000),
(106, 'Rajesh', 'Finance', 5000),
(107, 'Preet', 'HR', 7000);

INSERT INTO employees (emp_id, emp_name, dept_name, salary) VALUES
(108, 'Sneha', 'Admin', 4500),
(109, 'Vikram', 'IT', 4800),
(110, 'Priya', 'Finance', 6200),
(111, 'Arjun', 'HR', 3200),
(112, 'Kiran', 'IT', 4600),
(113, 'Neha', 'Admin', 4100),
(114, 'Suresh', 'Finance', 5800),
(115, 'Anita', 'HR', 3400),
(116, 'Ravi', 'IT', 5000),
(117, 'Meera', 'Admin', 4300),
(118, 'Hari', 'Finance', 5900),
(119, 'Sunil', 'HR', 3600),
(120, 'Lakshmi', 'IT', 4700),
(121, 'Deepak', 'Admin', 4200),
(122, 'Shalini', 'Finance', 6300),
(123, 'Vijay', 'HR', 3800),
(124, 'Pooja', 'IT', 4900);

select * from employees; 



-- window functions 

select *from employees;

select max(salary) as maxsalary from employees;

# finding max salary in each department 
select dept_name, max(salary) as maxsal
from employees 
group by dept_name;

#if we wnt to display every thing along with the max salary 
select dept_name, emp_id,max(salary) as maxsal
from employees 
group by dept_name;
# we can not do this beacasue of this error 
#Error Code: 1055. Expression #2 of SELECT list is not in GROUP BY clause and contains nonaggregated column 'parks_and_recreation.employees.emp_id' which is not functionally dependent on columns in GROUP BY clause; this is incompatible with sql_mode=only_full_group_by


-- now we use windows funciton 


select *,
max(salary) over() as maxsal
from employees ;
# this will give max slary alon side with all the columns 


## now if we want max slary corresponding to each department \
select *,
max(salary) over(partition by dept_name) as maxsal
from employees ;

#functions of windows function 

#row number -- this give uniques row number to each record
select e.*,
row_number() over() as rn
from employees e;

select e.*,
row_number() over(partition by dept_name) as rn
from employees e; 


select e.*,
row_number() over(partition by salary) as rn
from employees e;

#here we can get the details of 1st two employees joined in each department who joined the company
select *from(
select e.*,
row_number() over(partition by dept_name order by emp_id) as rn
from employees e ) as x
where x.rn<3;


-- RANK 
-- lets say we have to find top 3 employees who has max slary in each of the deptarment 
select * from 
(
select e.*,
rank() over(partition by dept_name order by salary desc) as rnk
from employees e) as x
where x.rnk<4;


-- DENSE RANK
#rank skips a rank for a duplicate value where as dense rank count each value either it is duplicate ornot
select * from 
(
select e.*,
rank() over(partition by dept_name order by salary desc) as rnk,
dense_rank() over(partition by dept_name order by salary desc) as dense_rnk
from employees e) as x
where x.rnk<4;

-- LEAD 
# fetch a query to display if the salry of an employee is higher or lower than the previous employee

select e.*,
lag(salary) over(partition by dept_name order by emp_id) as prevEmpSal
from employees as e;


select e.*,
lag(salary,2,0) over(partition by dept_name order by emp_id) as prevEmpSal # check 2 records previosu to it and for no record gives it 0 
from employees as e;

-- LEAD
select e.*,
lag(salary) over(partition by dept_name order by emp_id) as prevEmpSal
,lead(salary) over(partition by dept_name order by emp_id) as nextEmpSal
from employees as e;



select e.*,
lag(salary) over(partition by dept_name order by emp_id) as prevEmpSal,
case when e.salary> lag(salary) over(partition by dept_name order by emp_id) then 'higher than previous emp'
	 when e.salary< lag(salary) over(partition by dept_name order by emp_id) then 'lower than previous emp'
     when e.salary= lag(salary) over(partition by dept_name order by emp_id) then 'equal to  previous emp'
end as sal_range
from employees as e;



