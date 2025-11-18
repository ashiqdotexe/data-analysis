select *
from parks_and_recreation.employee_demographics;

select *
from parks_and_recreation.employee_salary;

# Inner join

select *
from parks_and_recreation.employee_demographics as dem
inner join parks_and_recreation.employee_salary as sal
	on dem.employee_id = sal.employee_id;
    
#outer join
select *
from parks_and_recreation.employee_demographics as dem
right join parks_and_recreation.employee_salary as sal
	on dem.employee_id = sal.employee_id;
;

#working on multiple table

select dem.employee_id, dem.age, dem.gender, sal.occupation, sal.salary, pd.department_name
from parks_and_recreation.employee_demographics as dem
right join parks_and_recreation.employee_salary as sal
	on dem.employee_id = sal.employee_id
inner join parks_and_recreation.parks_departments as pd
	on sal.dept_id = pd.department_id
;