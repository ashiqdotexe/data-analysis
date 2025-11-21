select *
from employee_demographics;

select *
from employee_salary;

# Trigger
DELIMITER $$
Create trigger add_member
after insert on employee_salary
for each row
begin
	insert into employee_demographics(employee_demographics.employee_id, employee_demographics.first_name, employee_demographics.last_name)
    values(NEW.employee_id, NEW.first_name, NEW.last_name);
end $$
DELIMITER ;

insert into employee_salary(employee_id, first_name, last_name, occupation, salary, dept_id)
values(14, "HM Adnanur", "Rahman", "free fire player", 5000, 5)

#event
DELIMITER $$
create event delete_retires
on schedule every 1 minute
do
begin
	delete
    from employee_demographics
    where age >= 60;
end $$
DELIMITER ;
