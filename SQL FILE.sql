select*
from layoffs;

 select*,
  ROW_NUMBER() OVER(
  partition by company, industry, total_laid_off, percentage_laid_off, 'date') AS ROW_NUM
 from layoffs_staging;
 
 WITH 	duplicate_cte AS
 (
 select*,
  ROW_NUMBER() OVER(
  partition by company, industry, total_laid_off, percentage_laid_off, 'date') AS ROW_NUM
 from layoffs_staging)

DELETE
 from layoffs_staging
 where ROW_NUM > 1;
 
 SELECT COMPANY,TRIM(COMPANY)
 FROM layoffs_staging;
 
 UPDATE layoffs_staging
 set company = TRIM(COMPANY);
 
