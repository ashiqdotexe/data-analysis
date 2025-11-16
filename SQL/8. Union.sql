select * 
from parks_and_recreation.employee_demographics;

select * 
from parks_and_recreation.employee_salary;

select * 
from parks_and_recreation.parks_departments;

select first_name, last_name, "OLD Man" as Label
from parks_and_recreation.employee_demographics as dm
where dm.age > 40 and dm.gender = "Male"
union
select first_name, last_name, "OLD Lady" as Label
from parks_and_recreation.employee_demographics as dm
where dm.age > 40 and dm.gender = "Female"
union
select first_name, last_name, "Highly Payed" as Label
from parks_and_recreation.employee_salary as sal
where sal.salary > 70000
order by first_name, last_name
;
