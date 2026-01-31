-- Standardizing the data 

-- first of all triming the extra white spaces from company name 

SELECT company , TRIM(company)
FROM layoff_staging2;

UPDATE layoff_staging2
SET company=TRIM(company);

SELECT company , TRIM(company)
FROM layoff_staging2;


-- now we are renaming the same industry in the ds 
-- here we can see crypto has multiple name so making it one 'crypto'

SELECT DISTINCT industry
FROM layoff_staging2
ORDER BY 1;

SELECT *
FROM layoff_staging2
WHERE industry like 'Crypto%'; 

UPDATE layoff_staging2
SET industry='Crypto'
WHERE industry LIKE 'Crypto%';

SELECT *
FROM layoff_staging2
WHERE industry like 'Crypto%'; 

select distinct industry 
from layoff_staging2;

-- now we will check all the collumns like this , see whether we have any repeating words  for example us and us. accidental period 

SELECT DISTINCT location 
FROM layoff_staging2
ORDER BY 1;

SELECT DISTINCT country
FROM layoff_staging2
ORDER BY 1;  #United States.  and United States

SELECT  DISTINCT country , TRIM(TRAILING '.' FROM country )
FROM layoff_staging2
ORDER BY 1;

UPDATE layoff_staging2
SET country = TRIM(TRAILING '.' FROM country )
WHERE country LIKE 'United States%';


-- now we will check the format of data in our table if it is 'text' format we need to change it to date format 

SELECT `date`
FROM layoff_staging2;

SELECT `date`,
STR_TO_DATE(`date`,'%m/%d/%Y') # remember this format for date m/d/Y
FROM layoff_staging2;

UPDATE layoff_staging2
SET `date`=STR_TO_DATE(`date`,'%m/%d/%Y');

SELECT `date`
FROM layoff_staging2;

ALTER TABLE layoff_staging2
MODIFY COLUMN `date` DATE;

-- standardization of data is done here now we move on to null value handling ..
