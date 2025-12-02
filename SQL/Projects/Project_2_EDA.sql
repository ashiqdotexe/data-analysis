#Exploratory Data Analysis(EDA)

select *
from world_trade.layoffs_staging2;

select *
from layoffs_staging2
where percentage_laid_off = 1;

select company, sum(layoffs_staging2.total_laid_off) as total_laid_off
from layoffs_staging2
where total_laid_off is not null
group by company
order by 2  desc
;

select industry, sum(layoffs_staging2.total_laid_off) as total_laid_off
from layoffs_staging2
where total_laid_off is not null
group by industry
order by 2  desc
;


select country, sum(layoffs_staging2.total_laid_off) as total_laid_off
from layoffs_staging2
where total_laid_off is not null
group by country
order by 2  desc
;

SELECT industry, COUNT(DISTINCT company) AS company_count
FROM layoffs_staging2
GROUP BY industry
ORDER BY company_count DESC;

#Ranking top three company per year those laid of the most -

with company_year as 
(
select company, year(`date`) as years, sum(total_laid_off) as total_laid_off
from layoffs_staging2
group by company, year(`date`)
),
company_rank as
(
select company, years, total_laid_off, dense_rank() over(partition by years order by total_laid_off desc) as ranking
from company_year
where total_laid_off is not null
and years is not null
)
select *
from company_rank
where ranking <=3;



#Rolling total_laid of per month
with rolling_total as 
(
select substr(`date`, 1, 7) as dates, sum(total_laid_off) as total_laid_off
from layoffs_staging2
where substr(`date`, 1, 7) is not Null
group by substr(`date`, 1, 7)
order by 1
)
select dates, total_laid_off, SUM(total_laid_off) OVER (ORDER BY dates ASC) as rolling_total_layoffs
from rolling_total
group by dates
;







