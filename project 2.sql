-- Exploratory Data Analysis --
use world_layoffs;
select *
from layoffs_staging2;

select max(total_laid_off),max(percentage_laid_off)
from layoffs_staging2;

select *
from layoffs_staging2
where percentage_laid_off=1
order by total_laid_off desc;

select *
from layoffs_staging2
where percentage_laid_off=1
order by funds_raised_millions desc;

select company,sum(total_laid_off)
from layoffs_staging2
group by company
order by 2 desc;

select min(`date`),max(`date`)
from layoffs_staging2;

select industry,sum(total_laid_off)
from layoffs_staging2
group by industry
order by 2 desc;

select country,sum(total_laid_off)
from layoffs_staging2
group by country
order by 2 desc;

select `date`,sum(total_laid_off)
from layoffs_staging2
group by `date`
order by 1 desc;

select YEAR(`date`),sum(total_laid_off)
from layoffs_staging2
group by YEAR(`date`)
order by 1 desc;

select stage,sum(total_laid_off)
from layoffs_staging2
group by stage
order by 2 desc;

select company,sum(percentage_laid_off) as sum
from layoffs_staging2
group by company
order by 2 desc;

select company,avg(percentage_laid_off) as sum
from layoffs_staging2
group by company
order by 2 desc;

SELECT SUBSTRING(`date`, 1, 7) AS `month`, SUM(total_laid_off)
FROM layoffs_staging2
where substring(`date`, 1, 7) is not null
GROUP BY `month`
order by 1 asc; 

with Rolling_total as 
(
SELECT SUBSTRING(`date`, 1, 7) AS `month`, SUM(total_laid_off) as total_off
FROM layoffs_staging2
where substring(`date`, 1, 7) is not null
GROUP BY `month`
order by 1 asc
)
select `month`,
total_off,sum(total_off) over(order by 'month') as rolling_total
from rolling_total;

select company,sum(total_laid_off)
from layoffs_staging2
group by company
order by 2 desc;

select company,YEAR(`date`),sum(total_laid_off)
from layoffs_staging2
group by company,YEAR(`date`)
order by 3 asc;

with company_year(company,years,total_laid_off) as
(
select company,YEAR(`date`),sum(total_laid_off)
from layoffs_staging2
group by company,YEAR(`date`)
),company_year_rank as
(select *,
dense_rank() over (partition by years order by total_laid_off Desc) as ranking
from company_year
where years is not null
)
select *
from company_year_rank
where ranking<=5;
