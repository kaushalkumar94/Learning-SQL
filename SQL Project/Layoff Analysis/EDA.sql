-- EDA Exploratory Data Analysis

SELECT MAX(total_laid_off) 
FROM layoff_staging2;

SELECT MAX(total_laid_off) ,MAX(percentage_laid_off)
FROM layoff_staging2;

SELECT *
FROM layoff_staging2
WHERE total_laid_off=12000 ;#OR percentage_laid_off=1; 

SELECT *
FROM layoff_staging2 
WHERE percentage_laid_off=1
ORDER BY funds_raised_millions DESC;

SELECT company, SUM(total_laid_off)
FROM layoff_staging2 
GROUP BY company
ORDER BY 2 DESC;

SELECT MIN(`date`), MAX(`date`)
FROM layoff_staging2;

SELECT industry , SUM(total_laid_off)
FROM layoff_staging2
GROUP BY industry 
ORDER BY 2 DESC;


SELECT country , SUM(total_laid_off)
FROM layoff_staging2
GROUP BY country
ORDER BY 2 DESC;


SELECT YEAR(`date`), SUM(total_laid_off)
FROM layoff_staging2
GROUP BY YEAR(`date`)
ORDER BY 2 DESC;


SELECT stage , SUM(total_laid_off)
FROM layoff_staging2
GROUP BY stage 
ORDER BY 2 DESC;



SELECT SUBSTRING(`date`,1,7) AS `MONTH`, SUM(total_laid_off)
FROM layoff_staging2
WHERE SUBSTRING(`date`,1,7) IS NOT NULL
GROUP BY `MONTH`
ORDER BY 1 ASC;


-- rolling summ
WITH rolling_total AS  
(
SELECT SUBSTRING(`date`,1,7) AS `MONTH`, SUM(total_laid_off) AS  total_off
FROM layoff_staging2
WHERE SUBSTRING(`date`,1,7) IS NOT NULL
GROUP BY `MONTH`
ORDER BY 1 ASC
)
SELECT `MONTH`, total_off,
 SUM(total_off) OVER (ORDER BY `MONTH`) AS rolling_total
FROM rolling_total;


-- companies laying off per year
SELECT company, SUM(total_laid_off)
FROM layoff_staging2 
GROUP BY company
ORDER BY 2 DESC;


SELECT company, YEAR(`date`),SUM(total_laid_off)
FROM layoff_staging2 
GROUP BY company,YEAR (`date`)
ORDER BY company desc;

-- ranking the company based on their layoffs 

SELECT company, YEAR(`date`),SUM(total_laid_off)
FROM layoff_staging2 
GROUP BY company,YEAR (`date`)
ORDER BY 3 DESC;

WITH company_year (comapny, years,total_laid_off) AS 
(SELECT company, YEAR(`date`),SUM(total_laid_off)
FROM layoff_staging2 
GROUP BY company,YEAR(`date`)
) 
SELECT *, DENSE_RANK() OVER( PARTITION BY years ORDER BY total_laid_off DESC) AS ranking 
FROM company_year
ORDER BY ranking ASC;

select*from layoff_staging2;


WITH company_year (comapny, years,total_laid_off) AS 
(SELECT company, YEAR(`date`),SUM(total_laid_off)
FROM layoff_staging2 
GROUP BY company,YEAR(`date`)
),
company_year_rank AS 
(
SELECT *, DENSE_RANK() OVER( PARTITION BY years ORDER BY total_laid_off DESC) AS ranking 
FROM company_year
ORDER BY ranking ASC
)
SELECT *
FROM company_year_rank
WHERE ranking<=5;
