#Alias is used to give a temporary name to COLUMN OR TABLES

select salary as s
from employee_salary;


select gender , avg(age) as a
from employee_demographics
group by gender
having a>40;


# LIMIT is used to control how many rows are returned.

select *
from employee_demographics; # shows the full tahle 

select*
from employee_demographics
limit 5; # shows the first 5 entries from the table

# this can be usefull in getting oldest and newest entries if we order by age

select*
from employee_demographics
order by age desc
limit 3; # gives us the 3 oldest people

select*
from employee_demographics
order by age 
limit 3; # this gives us the youngest people
