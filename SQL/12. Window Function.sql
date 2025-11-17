#Window Functions

#Over function

select em.employee_id, concat(em.first_name," ", em.last_name) as full_name,gender, sal.salary, Sum(salary) over(partition by gender order by employee_id) as Rolling_total
from employee_demographics as em
join employee_salary as sal
	on em.employee_id = sal.employee_id;
    
    
select em.employee_id, concat(em.first_name," ", em.last_name) as full_name,gender, sal.salary, Sum(salary) over(partition by gender order by employee_id) as Rolling_total,
row_number() over(partition by gender order by salary desc) as row_num,
rank() over(partition by gender order by salary desc) as rank_num,
dense_rank() over(partition by gender order by salary desc) as rank_num
from employee_demographics as em
join employee_salary as sal
	on em.employee_id = sal.employee_id;