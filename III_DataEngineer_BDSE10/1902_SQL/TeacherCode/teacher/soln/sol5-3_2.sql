SELECT lower(last_name) 'Name', LEN(last_name) 'Length'      
FROM   employees      
WHERE  last_name LIKE 'J%'      
  OR   last_name LIKE 'M%'      
  OR   last_name LIKE 'A%'
ORDER BY 'Name'

--©Î

SELECT lower(last_name) 'Name', LEN(last_name) 'Length'      
FROM   employees      
WHERE  last_name LIKE '[AJM]%' 
ORDER BY 'Name'

