-- CTEs common table expressions 
 WITH CTE_Example AS (
    SELECT 
        gender, 
        AVG(salary) AS avg_sal, 
        MAX(salary) AS max_sal, 
        MIN(salary) AS min_sal, 
        COUNT(salary) AS count_sal
    FROM employee_demographics dem
    JOIN employee_salary sal
        ON dem.employee_id = sal.employee_id
    GROUP BY gender
)
SELECT *
	FROM CTE_Example;



with cte_example as 
(
select employee_id , gender, birth_date
from employee_demographics
where birth_date>'1985-01-01'
),

cte_example2 as 
(
select employee_id, salary
from employee_salary
where salary>50000
)

select * 
from cte_example c1
join cte_example2 c2
on c1.employee_id=c2.employee_id;