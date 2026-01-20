 # group by is used to group rows that have the same values in a column and then apply aggregate functions on each group
 
 select gender 
 from employee_demographics
 group by gender;
 
 select gender , AVG(age)
 from employee_demographics
 group by gender; 
 
 select*
 from employee_salary;
 
 select occupation , salary
 from employee_salary
 group by occupation,salary;
 
 
  
 select gender , AVG(age), MAX(age) ,min(age), count(age)
 from employee_demographics
 group by gender; 



-- ORDER BY \

SELECT *
FROM employee_demographics
ORDER BY first_name;
 SELECT *
FROM employee_demographics
ORDER BY employee_id;

select *
from employee_demographics
order by gender;

select *
from employee_demographics
order by gender, age desc # here the order matters , which to keep first 
;


select *
from employee_demographics
order by 5 , 4 #we can also use collumn positon instead of name if we know (but this is not recommended)
