-- DATA Cleaning 

SELECT *
FROM layoffs;

-- remove  duplicates
-- standardize the data 
-- null values or blank values 
-- remove any collumn

# WE will make a duplicate of the original table 

CREATE TABLE layoff_staging
LIKE layoffs;

INSERT layoff_staging
SELECT *
FROM layoffs;

SELECT * FROM layoff_staging;

# Removing Duplicates

-- we assigned a row number to the some of the collumns 
SELECT *,
ROW_NUMBER() OVER(
				PARTITION BY company, location,industry,total_laid_off,percentage_laid_off,stage,country,`date`,funds_raised_millions) as row_num
FROM layoff_staging;

-- now if we can see the rou number comes out to be 1 , now we will run another query if any row_num>1 means that is a duplicate 
 
WITH duplicate_cte as 
 (
SELECT *,
ROW_NUMBER() OVER(
				PARTITION BY company, location,industry,total_laid_off,percentage_laid_off,stage,country,`date`,funds_raised_millions) as row_num
FROM layoff_staging
)
SELECT * 
FROM duplicate_cte
WHERE row_num>1;


select * from layoff_staging
where company ='casper' and company ='hibob';




-- now we have to delete the duplicates which we got in the above query 
-- note we can not directly delete using the cte (see the query below ) and the response error


WITH duplicate_cte as 
 (
SELECT *,
ROW_NUMBER() OVER(
				PARTITION BY company, location,industry,total_laid_off,percentage_laid_off,stage,country,`date`,funds_raised_millions) as row_num
FROM layoff_staging
)
DELETE  # HERE IF WE TRY DELETE WE GET  --Error Code: 1288. The target table duplicate_cte of the DELETE is not updatable

FROM duplicate_cte
WHERE row_num>1;

-- we will make a copy of this table again and then delte from it 

CREATE TABLE `layoff_staging2` (
  `company` text,
  `location` text,
  `industry` text,
  `total_laid_off` int DEFAULT NULL,
  `percentage_laid_off` text,
  `date` text,
  `stage` text,
  `country` text,
  `funds_raised_millions` int DEFAULT NULL,
  `row_num1` int
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO layoff_staging2
SELECT *,
ROW_NUMBER() OVER(
				PARTITION BY company, location,industry,total_laid_off,percentage_laid_off,stage,country,`date`,funds_raised_millions) as row_num
FROM layoff_staging;
 
 
SELECT * FROM layoff_staging2
WHERE row_num1>1;

SET SQL_SAFE_UPDATES = 0; ##Run this before your DELETE: This error is actually protecting you from accidentally nuking an entire table.
-- Error Code: 1175. You are using safe update mode and you tried to update a table without a WHERE that uses a KEY column.  To disable safe mode, toggle the option in Preferences -> SQL Editor and reconnect.

DELETE
FROM layoff_staging2
WHERE row_num1>1;

## now finally the duplicate data is removed .
