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

