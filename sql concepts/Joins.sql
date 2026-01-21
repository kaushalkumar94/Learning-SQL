select * 
from employee_demographics as dem
inner join employee_salary as sal
	on sal.employee_id=dem.employee_id;
    
    
select sal.employee_id, age ,occupation     
from employee_demographics as dem
inner join employee_salary as sal
	on sal.employee_id=dem.employee_id;
    
-- left right join 

select * 
from employee_demographics as dem
right join employee_salary as sal
	on dem.employee_id=sal . employee_id;


select * 
from employee_demographics as dem
left join employee_salary as sal
	on dem.employee_id=sal . employee_id;
    
    
    
    
select * 
from employee_salary as sal 	
left join employee_demographics as dem
	on dem.employee_id=sal . employee_id;
    
    
    
    
    
-- self join 

select *
from employee_salary as emp1
join employee_salary as emp2
	on emp1.employee_id=emp2.employee_id;
    
    
    
    
-- joining multiple tables

select * 
from employee_demographics as dem
inner join employee_salary as sal
	on sal.employee_id=dem.employee_id
inner join parks_departments pd
	on sal.dept_id= pd.department_id;
;
