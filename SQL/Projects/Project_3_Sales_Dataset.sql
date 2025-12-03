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


with ranked_sale as 
(
select country, state, sum(Revenue) as total_revenue, dense_rank() over(partition by country order by sum(Revenue) desc) as ranking
from sales
group by country, state
)

select country, state, total_revenue, ranking
from ranked_sale
where ranking <=3
;

select `Date`, substr(`Date`, 1,7)
from sales;

WITH ranked_date AS (
    SELECT 
        country,
        SUBSTR(`Date`, 1, 7) AS month,
        SUM(Revenue) AS total_revenue,
        DENSE_RANK() OVER (
            PARTITION BY country 
            ORDER BY SUM(Revenue) DESC
        ) AS ranking
    FROM sales
    GROUP BY country, SUBSTR(`Date`, 1, 7)
)

SELECT country, month, total_revenue
FROM ranked_date
where ranking = 1;











