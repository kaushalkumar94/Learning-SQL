-- triggers
select*from employee_demographics;

delimiter $$
create trigger employee_insert
	after insert on employee_salary
    for each row 
begin
	insert into employee_demographics(employee_id, first_name,last_name)
    values (new.employee_id, new.first_name, new.last_name);
end $$
delimiter ;


insert into employee_salary(employee_id,first_name,last_name,occupation,salary,dept_id)
values (20,'kaushal', 'kumar','analyst',100000,null);


DROP TRIGGER IF EXISTS employee_insert;

select * from employee_salary;
select * from employee_demographics;


-- events 

select * from employee_demographics;

delimiter $$
create event delete_retirees
on schedule  every 30 second
do 
begin 
	delete
    from employee_demographics
    where age>=60;
end $$
delimiter ;

select * from employee_demographics;


DROP EVENT IF EXISTS delete_retirees;


