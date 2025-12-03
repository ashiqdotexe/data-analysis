select *
from sales;

select str_to_date(`Date`, '%m/%d/%Y')
from sales;

update sales
set `Date` = str_to_date(`Date`, '%m/%d/%Y');

alter table sales
modify column `Date` date;


select state, sum(Profit), sum(Cost), sum(Revenue)
from sales
group by state
order by 4 desc;