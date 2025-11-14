#simple limit and aliassing

select *
from parks_and_recreation.employee_salary;
select *
from parks_and_recreation.employee_demographics;
#limit
select *
from parks_and_recreation.employee_salary
order by salary desc
limit 2,1;

#aliassing

select gender, avg(age) as avg_age
from parks_and_recreation.employee_demographics
group by gender 
having avg_age > 40;