/*
Transact-SQL 流程控制語言關鍵字如下：

BEGIN...END      RETURN 
BREAK            TRY...CATCH 
CONTINUE         WAITFOR 
GOTO label       WHILE 
IF...ELSE 
  
*/ 
-----------------------------------------------------------------------------
/*
流程控制
1 IF ELSE : 改變程式執行流程
2 WHILE   : 重覆執行區塊中的指令
*/

-----------------------------------------------------------------------------
/*
1 IF ELSE 定義:
在 Transact-SQL 陳述式的執行上強加條件。如果 IF 關鍵字的條件獲得滿足，就會執行在 IF 關鍵字及其條件
之後的 Transact-SQL 陳述式：布林運算式會傳回 TRUE。選擇性的 ELSE 關鍵字導入了另一個在 IF 條件未獲
滿足時所執行的 Transact-SQL 陳述式：布林運算式會傳回 FALSE。
在 Transact-SQL 陳述式的執行上強加條件。如果 Boolean_expression 得出 TRUE，便會執行在
Boolean_expression 之後的 Transact-SQL 陳述式 (sql_statement)。選擇性的 ELSE 關鍵字是
Boolean_expression 得出 FALSE 或 NULL 時，所執行的替代 Transact-SQL 陳述式。

*/

/*
語法
IF Boolean_expression 
     { sql_statement | statement_block } 
[ ELSE 
     { sql_statement | statement_block } ] 
*/

-----------------------------------------------------------------------------
--例

DECLARE @n int;

SET @n=5;
IF @n >= 1 
  PRINT '大於1'
ELSE
  PRINT '小於1'

-----------------------------------------------------------------------------
/*
2 WHILE 定義: 
  只要指定的條件為真，WHILE 陳述式能將一個陳述式或陳述式區塊重複執行。
  有兩個 Transact-SQL 陳述式經常與 WHILE 合用：BREAK 或 CONTINUE。BREAK 陳述式可由最內層的 WHILE 迴圈跳出，
  而 CONTINUE 陳述式則重新啟動 WHILE 迴圈。在沒有其他資料列需要執行的情況下，程式會執行 BREAK 陳述式。
  在需要繼續執行程式碼的情況下，程式會執行 CONTINUE 陳述式。

*/
/*
語法
WHILE Boolean_expression 
     { sql_statement | statement_block } 
     [ BREAK ] 
     { sql_statement | statement_block } 
     [ CONTINUE ] 
     { sql_statement | statement_block } 

說明
{sql_statement | statement_block} 
  這是利用陳述式區塊來定義的任何 Transact-SQL 陳述式或陳述式分組。若要定義陳述式區塊，
  請使用流程控制關鍵字 BEGIN 和 END。

BREAK
  結束最內層的 WHILE 迴圈。將執行出現在 END 關鍵字 (表示迴圈結束) 之後的任何陳述式。

CONTINUE
  重新啟動 WHILE 迴圈，忽略 CONTINUE 關鍵字之後的任何陳述式。
*/

-----------------------------------------------------------------------------
--例1

DECLARE @n int;

SET @n=1;
WHILE ( @n <= 10 )
  BEGIN
    PRINT 'n= '+ CAST(@n AS varchar(2));
    SET @n = @n + 1 ;   --或 SET @n += 1; 
  END

-----------------------------------------------------------------------------
--例2 CONTINUTE
DECLARE @i int
SET @i=0

WHILE (@i< 10)
  BEGIN
    SET @i = @i + 1
      IF @i % 2 = 0
         PRINT '偶數'+cast(@i as varchar(2))
      ELSE
         CONTINUE   --從頭執行
  END


-----------------------------------------------------------
/*4 BEGIN END

定義
BEGIN 和 END 陳述式是用以將多個 Transact-SQL 陳述式群組成一個邏輯區塊。若有流程控制陳述式必須執行
含有二或多個 Transact-SQL 陳述式的區塊，就可以使用 BEGIN 和 END 陳述式。

*/
-----------------------------------------------------------
--例1

BEGIN
  INSERT INTO 表 VALUES (值1)
  INSERT INTO 表 VALUES (值2)
  SELECT * FROM 表
END

--或

BEGIN
  DECLARE @cnt  int;

  UPDATE 表 SET 欄 = 值1;
  BEGIN
    SET @cnt = 1; 
    SELECT * FROM 表 where 欄 = @cnt;
  END
END
GO

--例2 IF 陳述式控制僅執行一個 Transact-SQL 陳述式的情況時，就不需要使用 BEGIN 或 END 陳述式：

  IF (@@ERROR <> 0)
   SET @ErrorSaveVariable = @@ERROR

--例3 當 IF 的評估結果為 FALSE 時，使用 BEGIN 和 END 陳述式能使 IF 陳述式略過陳述式區塊：

IF (@@ERROR <> 0)
  BEGIN
    SET @ErrorSaveVariable = @@ERROR
    PRINT 'Error encountered, ' + 
         CAST(@ErrorSaveVariable AS VARCHAR(10))
  END
-----------------------------------------------------------
/*
BEGIN 和 END 陳述式的使用時機為：
  1 WHILE 迴圈需要包含陳述式區塊。
  2 CASE 函數項目需要包含陳述式區塊。
  3 IF 或 ELSE 子句需要包含陳述式區塊。

*/
-------------------------------------------------------------
/*
流程控制 其它例子
*/
--例1  用 OBJECT_ID判斷 object是否存在

USE AdventureWorks2016CTP3
GO

IF OBJECT_ID ( 'HumanResources.uspGetAllEmployees', 'P' ) IS NOT NULL 
    DROP PROCEDURE HumanResources.uspGetAllEmployees;
GO

-----------------------------------------------------------------------------
--例2 用 system table判斷 object 是否存在 

USE master
GO

IF EXISTS (SELECT name FROM master.dbo.sysdatabases WHERE name = N'DB01')
   DROP DATABASE [DB01]
GO

-----------------------------------------------------------------------------
--例3 用 system table判斷 object 是否存在 

IF EXISTS (SELECT name FROM sysobjects
            WHERE type = 'U' AND name = 'employees')      
   DROP TABLE employees
GO
-----------------------------------------------------------------------------
--例4 用 system table判斷 object 是否存在 

IF 'employees' IN  (SELECT name FROM sysobjects WHERE type = 'U' )
   PRINT '表格已存在'
ELSE
   PRINT '表格不存在'


-----------------------------------------------------------------------------
--例5  用 OBJECTPROPERTY判斷 object是否存在
IF OBJECTPROPERTY ( object_id('employees'),'ISTABLE') = 1
   PRINT '表格已存在'

-----------------------------------------------------------------------------
/*其他有效的 WHILE 條件測試：

1 WHILE (@ACounterVariable < 100)
2 WHILE EXISTS(SELECT LastName FROM Person.Contact WHERE FirstName = N'Anne')

*/

/*
例2
搭配巢狀 IF...ELSE 和 WHILE 來使用 BREAK 和 CONTINUE
在下列範例中，如果產品的平均標價小於 $300，WHILE 迴圈會將標價加倍，再選取最大價格。
如果最大價格小於或等於 $500，WHILE 迴圈會重新啟動，價格會再加倍。這個迴圈會繼續使價格加倍，
直到最大價格大於 $500，再結束 WHILE 迴圈及列印訊息。
*/

USE AdventureWorks2016CTP3;
GO
WHILE (SELECT AVG(ListPrice) FROM Production.Product) < $300
BEGIN
   UPDATE Production.Product
      SET ListPrice = ListPrice * 2
   SELECT MAX(ListPrice) FROM Production.Product
   IF (SELECT MAX(ListPrice) FROM Production.Product) > $500
      BREAK
   ELSE
      CONTINUE
END
PRINT 'Too much for the market to bear';

--------------------------------------------------------------
/*3 RETURN

定義: 
  RETURN 陳述式可無條件終止查詢、預存程序或批次。位在 RETURN 陳述式後面的預存程序或批次中的
  任何陳述式，都不會執行。
  RETURN 用於預存程序時，能夠指定整數值傳回至發呼叫的應用程式、批次或程序。如果 RETURN 中沒有指定值，
  則預存程序傳回值為 0。

  大部份預存程序遵照使用傳回碼的慣例，來指出預存程序成功或失敗。若沒有發現錯誤，則預存程序傳回 0 值。
  非零值表示有發生錯誤。例如：
*/
--------------------------------------------------------------
--例1 procedure 傳值後 回傳OUTPUT 資料及 return 狀態

USE AdventureWorks2016CTP3;
GO
-- Create a procedure that takes one input parameter
-- and returns one output parameter and a return code.

CREATE PROCEDURE SampleProcedure @EmployeeIDParm INT,
                                 @MaxTotal INT OUTPUT
AS
  -- Declare and initialize a variable to hold @@ERROR.
  DECLARE @ErrorSave int;
  SET @ErrorSave = 0;
  -- Do a SELECT using the input parameter.
  SELECT c.FirstName, c.LastName, e.Title
  FROM HumanResources.Employee AS e JOIN Person.Contact AS c 
  ON e.ContactID = c.ContactID
  WHERE EmployeeID = @EmployeeIDParm;

  -- Save any nonzero @@ERROR value.
  IF (@@ERROR <> 0)
     SET @ErrorSave = @@ERROR;
  -- Set a value in the output parameter.
  SELECT @MaxTotal = MAX(TotalDue)
  FROM Sales.SalesOrderHeader;
  IF (@@ERROR <> 0)
     SET @ErrorSave = @@ERROR;

  -- Returns 0 if neither SELECT statement had
  -- an error, otherwise returns the last error.
  RETURN @ErrorSave;
GO

--run 執行預存程序的 Transact-SQL 批次或預存程序，可擷取傳回碼並放到整數變數中：

DECLARE @ReturnStatus int;
DECLARE @MaxTotalVariable int;
DECLARE @MaxTotal int;
EXECUTE @ReturnStatus = SampleProcedure @EmployeeIDParm = 65 ,@MaxTotal = @MaxTotalVariable OUTPUT;
PRINT ' ';
PRINT 'Return code = ' + CAST(@ReturnStatus AS CHAR(10));
PRINT 'Maximum Order Total = ' + CAST(@MaxTotalVariable AS CHAR(15));
GO


