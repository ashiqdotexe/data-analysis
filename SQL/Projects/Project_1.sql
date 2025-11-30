##Copy and pasting
select *
from layoffs;

create table layoffs_staging
like layoffs;


insert into layoffs_staging
select *
from layoffs;

select *
from layoffs_staging;


# remove duplicates
select *,
row_number() over(partition by company, location, industry, total_laid_off, percentage_laid_off, `date`, stage, country, funds_raised_millions) as row_num
from layoffs_staging
where row_num > 1;

with duplicates_cte as
(
select *,
row_number() over(partition by company, location, industry, total_laid_off, percentage_laid_off, `date`, stage, country, funds_raised_millions) as row_num
from layoffs_staging
)
select *
from duplicates_cte
where row_num > 1;

CREATE TABLE `layoffs_staging2` (
  `company` text,
  `location` text,
  `industry` text,
  `total_laid_off` int DEFAULT NULL,
  `percentage_laid_off` text,
  `date` text,
  `stage` text,
  `country` text,
  `funds_raised_millions` int DEFAULT NULL,
  `row_num` int
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

delete
from layoffs_staging2
where row_num>1;

insert into layoffs_staging2
select *,
row_number() over(partition by company, location, industry, total_laid_off, percentage_laid_off, `date`, stage, country, funds_raised_millions) as row_num
from layoffs_staging;


select *
from layoffs_staging2
where row_num>1;

#Data standardization
select layoffs_staging2.company, trim(company)
from layoffs_staging2;

update layoffs_staging2
set company = trim(company)
;


select distinct country, trim(trailing '.' from country)
from layoffs_staging2
order by 1;

update layoffs_staging2
set country = trim(trailing '.' from country);

#Changing date column

select `date`
from layoffs_staging2;

update layoffs_staging2
set `date` = str_to_date(`date`, '%m/%d/%Y');

alter table layoffs_staging2
modify column `date` date;

# Handling industry null values
select *
from layoffs_staging2
where industry is Null
or industry = '';

update layoffs_staging2
set industry = Null
where industry = '';

select *
from layoffs_staging2
where company like 'Airbnb%';

update layoffs_staging2 t1
join layoffs_staging2 t2
	on t1.company = t2.company
set t1.industry = t2.industry
where t1.industry is Null
and t2.industry is not Null;







