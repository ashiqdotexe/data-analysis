#Temp Table

create temporary table salary_over_70k
select *
from parks_and_recreation.employee_salary
where salary > 70000;


select * 
from salary_over_70k;