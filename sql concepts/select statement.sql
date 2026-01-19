SELECT *
FROM parks_and_recreation.employee_demographics;

select age, gender
from employee_demographics;

select gender,age, first_name
from employee_demographics;

select gender,
age,
age+10 # reason to write this way is , its easy to read and we can do calculations 
from employee_demographics; #we can even do basic calulation in here 

#PEMDAS ()Parentheses, Exponents, Multiplication and Division (from left to right), Addition and Subtraction (from left to right)

select first_name
from employee_demographics;

select distinct first_name
from employee_demographics;

select distinct gender
from employee_demographics;

select distinct gender,
first_name
from employee_demographics;

