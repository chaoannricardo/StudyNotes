SELECT   last_name, salary, commission_pct      
FROM     employees      
WHERE    commission_pct IS NOT NULL      
ORDER BY salary DESC, commission_pct DESC
 
