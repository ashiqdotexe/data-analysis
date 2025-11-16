# Subquery
select *
from employee_demographics 
where employee_id in (select employee_id
						from employee_salary
                        where dept_id=1)
;

select first_name, salary,
(select avg(salary)
from employee_salary) as avg_salary
from employee_salary;

select avg(max_age) as "Average Age"
from(select gender, 
avg(age) as avg_age, 
max(age) as max_age, 
min(age) as min_age
from employee_demographics
group by gender
) as Agr_age
;

select concat(first_name," ", last_name), age,
(select avg(age) from employee_demographics) as avg_age
from employee_demographics;
