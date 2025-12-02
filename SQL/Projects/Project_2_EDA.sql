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

#Rolling total_laid off -

select company, sum(layoffs_staging2.total_laid_off) as total_off
from layoffs_staging2
where total_laid_off is not null
group by company;









