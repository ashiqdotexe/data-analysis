DELIMITER $$
Create procedure large()
Begin
	select * 
    from employee_salary
    where employee_salary.salary > 50000;
    select * 
    from employee_salary
    where employee_salary.salary > 70000;
END $$
DELIMITER ;



DELIMITER $$
Create procedure large3(employee_param int)
Begin
	select * 
    from employee_salary
    where employee_salary.employee_id = employee_param;
END $$
DELIMITER ;

call large3(1)