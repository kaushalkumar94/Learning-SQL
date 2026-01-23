-- case statements

select first_name ,
last_name ,
case
	when age<=30 then  'young'
    when age between 31 and 50 then 'old'
    when age>=50 then "on death row"
end as Age_bracket
from employee_demographics;


-- pay increase and bonus 
-- <5k = 5%
-- >5k = 7%
-- finance = 10% bonus;

select first_name, last_name, salary ,
Case 
	when salary<5000 then salary + (salary *0.5)
    when salary>5000 then salary *1.07
end  as newsalary,
case 
	when dept_id =6 then salary*.10
end as bonus  
from employee_salary;


