# simple where statements-
select *
from parks_and_recreation.employee_demographics
where age > 50;

# logical opertator
select *
from parks_and_recreation.employee_demographics
where birth_date > "1985-01-01" and gender = "male";


# Like statement
select *
from parks_and_recreation.employee_demographics
where first_name like "a__%";