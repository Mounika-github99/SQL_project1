-- Data Cleaning SQL --
select *
from layoffs;

create table layoffs_staging
like layoffs;

select *
from layoffs_staging;

INSERT layoffs_staging
select *
from layoffs;

select *,
ROW_NUMBER() over(
partition by company,industry,total_laid_off,percentage_laid_off,`date` order by company) as row_num
from layoffs_staging;

-- Handling Duplicates --

with duplicate_cte as
(
select *,
ROW_NUMBER() over(
partition by company,location,
industry,total_laid_off,percentage_laid_off,`date`,stage,company,funds_raised_millions
) as row_num
from layoffs_staging
)

select*
from duplicate_cte
where row_num=2;

select *
from duplicate_cte
where row_num>1;

select *
from layoffs_staging
where company='Oda';

select*
from duplicate_cte
where row_num=2;

select *
from layoffs_staging
where company='Casper';

with duplicate_cte as
(
select *,
ROW_NUMBER() over(
partition by company,location,
industry,total_laid_off,percentage_laid_off,`date`,stage,company,funds_raised_millions
) as row_num
from layoffs_staging
)
delete
from duplicate_cte
where row_num>1;



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

select *
from layoffs_staging2
where row_num>1;

insert into layoffs_staging2
select *,
ROW_NUMBER() over(
partition by company,location,
industry,total_laid_off,percentage_laid_off,`date`,stage,company,funds_raised_millions
) as row_num
from layoffs_staging;

SET SQL_SAFE_UPDATES = 0;

delete
from layoffs_staging2
where row_num>1;

select *
from layoffs_staging2;

SET SQL_SAFE_UPDATES = 1;

-- Standardizing data --

select company,trim(company)
from layoffs_staging2;

SET SQL_SAFE_UPDATES = 0;

update layoffs_staging2
set company=trim(company);

select distinct industry
from layoffs_staging2
order by 1;

select *
from layoffs_staging2
where industry like 'Crypt%';

select distinct industry
from layoffs_staging2;

update layoffs_staging2
SET industry='Crypto'
where industry like 'Crypto%';

select distinct location
from layoffs_staging2
order by 1;

select *
from layoffs_staging2
order by 1;

select distinct country
from layoffs_staging2
order by 1;

select *
from layoffs_staging2
where country like 'United States%'
order by 1;

select distinct country,trim(trailing '.' from country) as new_country
from layoffs_staging2
order by 1;

update layoffs_staging2
set country=trim(trailing '.' from country)
where country like 'United States%';

select `date`
from layoffs_staging2;

select `date`,
str_to_date(`date`,'%m/%d/%y') as perfect;

update layoffs_staging2
set `date`=str_to_date(`date`,'%m/%d/%Y')
where date like '%/%/%';

Alter table layoffs_staging2
modify column `date` Date;

-- NUll values --

select *
from layoffs_staging2;

select *
from layoffs_staging2
where total_laid_off is NULL
and percentage_laid_off is NULL;

update layoffs_staging2
set industry=NULL
where industry='';

select *
from layoffs_staging2
where industry is null or industry='';

select *
from layoffs_staging2 t1
join layoffs_staging2 t2
	on t1.company=t2.company
    and t1.location=t2.location
where (t1.industry is NULL or t1.industry='')
and t2.industry is not null;

select *
from layoffs_staging2
where company='Airbnb';

select t1.industry,t2.industry
from layoffs_staging2 t1
join layoffs_staging2 t2
	on t1.company=t2.company
    and t1.location=t2.location
where t1.industry is NULL
and t2.industry is not null;

update layoffs_staging2 t1
join layoffs_staging2 t2 
	on t1.company=t2.company
set t1.industry=t2.industry
where (t1.industry is null or t1.industry='')
and t2.industry is not null;

select *
from layoffs_staging2
where company like 'Bally%';

select *
from layoffs_staging2
where total_laid_off is null
and percentage_laid_off is null;

DELETE 
from layoffs_staging2
where total_laid_off is null
and percentage_laid_off is null;

select *
from layoffs_staging2;

Alter table layoffs_staging2
drop column row_num;