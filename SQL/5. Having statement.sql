# having statements
select * 
from parks_and_recreation.employee_salary;

select occupation, avg(salary)
from parks_and_recreation.employee_salary
where occupation like "%manager%"
group by occupation
having avg(salary) > 75000
;
