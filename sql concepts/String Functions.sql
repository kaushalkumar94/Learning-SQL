-- string functions

select length('sky fall');

select first_name, length(first_name)
from employee_demographics
order by 1; # here order by 1OR2 means coullumn

select upper('sky');
select lower('LAISAFSAJ');

-- TRIM
select trim('           sky')
union all
select ('           sky')
union all
select ltrim('           sky            ')
union all
select rtrim('           sky            ');


select first_name, left(first_name,4)
from employee_demographics;

select first_name, right(first_name,4)
from employee_demographics;

#Error Code: 1630. FUNCTION parks_and_recreation.substring does not exist. Check the 'Function Name Parsing and Resolution' section in the Reference Manual

SELECT first_name,
       LEFT(first_name, 4),
       RIGHT(first_name, 4),
       SUBSTRING(first_name, 3, 3),
       birth_date,
       SUBSTRING(birth_date, 6, 2)
FROM employee_demographics;


# replace  Error Code: 1054. Unknown column 'a' in 'field list'

  
select first_name, REPLACE (first_name,'a','z')
from employee_demographics;


-- LOCATE

select locate('h', 'kaushal');

select first_name, locate ('An',first_name)
from employee_demographics;



-- concatination  

select first_name, last_name,
concat (first_name,' ',last_name)
from employee_demographics;