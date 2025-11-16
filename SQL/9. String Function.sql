# String function

select first_name, length(first_name) as count
from employee_demographics
order by count
;
select *
from employee_demographics;

select trim("            sky                  ") as "Trimmed String";

select first_name, birth_date, substring(birth_date, 6, 2) as birth_month
from employee_demographics
order by birth_month
;

select concat(first_name," ",last_name) as full_name
from employee_demographics
;