SELECT   last_name, DATEDIFF(MONTH, hire_date, getdate()) MONTHS_WORKED      
FROM     employees      
ORDER BY DATEDIFF(MONTH, hire_date, getdate())