SELECT   last_name, hire_date      
FROM     employees      
WHERE    hire_date LIKE '%1994%'

��

SELECT   last_name, hire_date      
FROM     employees      
WHERE    datename(year,hire_date) =1994

