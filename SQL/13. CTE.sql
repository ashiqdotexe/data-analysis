#CTE = common table expression

WITH CTE_Example1(employee_id,first_name, age , gender) as 
(
	select employee_id, first_name, age, gender
    from employee_demographics
    where birth_date > "1985-01-01"
), 
CTE_EXAMPLE2(employee_id, salary) as
(
	select employee_id, salary
	from employee_salary
    where salary > 50000
)
select *
from CTE_Example1 as ct1
join CTE_EXAMPLE2  as ct2
	on ct1.employee_id = ct2. employee_id    
;