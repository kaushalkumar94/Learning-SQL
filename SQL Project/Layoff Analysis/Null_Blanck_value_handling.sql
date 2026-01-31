-- NULL value handling and missing values 

SELECT *
FROM layoff_staging2 
WHERE total_laid_off IS NULL
AND percentage_laid_off IS NULL; # here if we found 2 collumns with a null value this is most probaly uselessfor uss so we have remove it 

# we should take a look at each collumn to make sure from handing of these values 

select distinct industry from layoff_staging2;

SELECT *
FROM layoff_staging2  
WHERE industry IS NULL 
OR industry =''; # this is the missing value 

SELECT *
FROM layoff_staging2
WHERE company='Airbnb';  # we need to populate the data 

SELECT *
FROM layoff_staging2
WHERE company='Carvana';  

SELECT T1.industry ,T2.industry
FROM layoff_staging2 T1
JOIN layoff_staging2 T2 
	ON T1.company= T2.company
    AND T1.location= T2.location
WHERE (T1.industry IS NULL OR  T1.industry = '')
AND T2.industry IS NOT NULL;

-- the update statement 

UPDATE layoff_staging2
SET industry =NULL 
WHERE industry= '';


UPDATE layoff_staging2 T1
JOIN layoff_staging2 T2 
	ON T1.company= T2.company
SET  T1.industry=T2.industry
WHERE T1.industry IS NULL 
AND T2.industry IS NOT NULL;
# the populating part is done with the null values 

# now we will delete the data with 2 or more null values , which is actually of no use 
SELECT *
FROM layoff_staging2 
WHERE total_laid_off IS NULL
AND percentage_laid_off IS NULL; 

DELETE
FROM layoff_staging2 
WHERE total_laid_off IS NULL
AND percentage_laid_off IS NULL; 


# NOW WE WILL BE DELETING THE UNWANTED COLLUMN WHICH WE CREATED INITALLY TO REMOVE DUPLICATES 
# DELETING row_num column 


SELECT * 
FROM layoff_staging2;

ALTER TABLE layoff_staging2
DROP COLUMN row_num1;

SELECT * 
FROM layoff_staging2;


