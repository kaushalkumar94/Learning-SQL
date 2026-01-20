-- having vs where clause


select gender, avg(age)
from employee_demographics
where avg(age)>40 #Error Code: 1111. Invalid use of group function
group by gender;


select gender, avg(age)
from employee_demographics
group by gender
having avg(age)>40; # correct method

select occupation , avg(salary) 
from employee_salary
group by occupation;


select occupation , avg(salary) 
from employee_salary
where occupation like '%manager%' 
group by occupation;



select occupation , avg(salary) 
from employee_salary
where occupation like '%manager%' 
group by occupation
having avg(salary)>75000