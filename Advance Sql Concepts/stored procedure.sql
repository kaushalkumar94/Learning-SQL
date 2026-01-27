-- stored procedure
-- A Stored Procedure is a precompiled set of SQL statements that is stored inside the database and can be executed whenever needed.
-- Think of it like a function in programming, but for SQL.


select * 
from employee_salary
where salary>=50000;

create procedure large_sal()
select * 
from employee_salary
where salary>=50000;

call large_sal();

# for making a complex query  stored procedure we have to use delimeter 
delimiter $$
create procedure large_sal2()
begin 
	select *
    from employee_salary
    where salary>=50000;
    select *
    from employee_salary
    where salary>=10000;
end $$
delimiter ;
call large_sal2();

# we can also pass parameter in a stroed procedure 
delimiter $$
create procedure sal_pro(employee_id int)
begin
	select salary,first_name
    from employee_salary;
end $$sal_pro
delimiter ;

call sal_pro(2);
