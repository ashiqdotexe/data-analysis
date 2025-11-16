# Case Statements

select concat(first_name, last_name) as "FULL NAME", pd.department_name, salary,
case
	when salary > 50000 then salary + (salary*0.07)
    when salary < 50000 then salary + (salary*0.05)
end as new_salary,
case
	when pd.department_name = "Finance" then salary * 0.10
end as bonus
from employee_salary as sal
right join parks_departments as pd
	on sal.dept_id = pd.department_id
order by new_salary
;