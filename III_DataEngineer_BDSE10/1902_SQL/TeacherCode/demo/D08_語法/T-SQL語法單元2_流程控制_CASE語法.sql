--CASE 判斷用於欄位運算 不可單獨敘述

/*語法 :

CASE input_expression
    WHEN when_expression THEN result_expression
        [...n]
        [ ELSE else_result_expression ]
END

或

CASE  WHEN input_expression = when_expression THEN result_expression
      [...n]
      [ ELSE else_result_expression ]
END
*/
---------------------------------------------------------------------------
--例 1

DECLARE @i int , @answer nvarchar(10)
SET @i=2

SET @answer = CASE @i
                WHEN 1 THEN '普通'
                WHEN 2 THEN '良好'
              END

PRINT @answer

---------------------------------------------------------------------------
--例 2

USE AdventureWorks2016CTP3;
GO
SELECT   ProductNumber, ProductLine, Category =
      CASE ProductLine
         WHEN 'R' THEN 'Road'
         WHEN 'M' THEN 'Mountain'
         WHEN 'T' THEN 'Touring'
         WHEN 'S' THEN 'Other sale items'
         ELSE 'Not for sale'
      END,
   Name
FROM Production.Product
ORDER BY ProductNumber;
GO


---------------------------------------------------------------------------
--例 3 類似2

USE AdventureWorks2016CTP3
GO
SELECT Name, 
   CASE Name
      WHEN 'Human Resources' THEN 'HR'
      WHEN 'Finance' THEN 'FI'
      WHEN 'Information Services' THEN 'IS'
      WHEN 'Executive' THEN 'EX'
      WHEN 'Facilities and Maintenance' THEN 'FM'
   END AS Abbreviation
FROM AdventureWorks.HumanResources.Department
WHERE GroupName = 'Executive General and Administration'
go
