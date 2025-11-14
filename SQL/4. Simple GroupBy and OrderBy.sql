#simple GROUP_BY
select * 
from parks_and_recreation.employee_demographics;

select gender, avg(age), max(age), min(age), count(gender)
from parks_and_recreation.employee_demographics
group by gender; 

#simple order_by

select *
from parks_and_recreation.employee_demographics
order by gender,age;