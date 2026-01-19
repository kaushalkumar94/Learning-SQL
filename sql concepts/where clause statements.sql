# The WHERE clause is used in SQL to filter rows from a table based on a condition.
select*
from employee_demographics
where first_name= 'Leslie';



select*
from employee_salary
where salary<=50000;

select*
from employee_demographics
where gender ='Female';


select*
from employee_demographics
where gender !='Female';

select*
from employee_demographics
where birth_date > '1985-01-01';

# logical operators AND OR NOT in where clause
select*
from employee_demographics
where birth_date > '1985-01-01'
AND gender	= 'male';


#pemdas work here too 
select*
from employee_demographics
where(first_name= 'leslie' AND age= 44) OR age>54; # () make statement isolated 


# LIKE statements
select*
from employee_demographics
where first_name like 'Je%';

select*
from employee_demographics
where first_name like '%A%';


select*
from employee_demographics
where first_name like 'A__%';

select*
from employee_demographics
where birth_date like '1989%';
