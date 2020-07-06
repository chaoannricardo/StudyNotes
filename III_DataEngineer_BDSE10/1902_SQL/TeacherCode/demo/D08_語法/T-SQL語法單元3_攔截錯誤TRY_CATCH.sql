
--5 TRY CATCH (錯誤處理)
/*
定義
 實作類似於 Microsoft Visual C# 與 Microsoft Visual C++ 語言中之例外狀況處理的 Transact-SQL 錯誤處理。
 您可以將 Transact-SQL 陳述式群組含括在 TRY 區塊內。如果 TRY 區塊內發生錯誤，就會將控制權傳給含括在
 CATCH 區塊內的另一個陳述式群組。
--從 CATCH 區塊傳回錯誤資訊 不work 在 try就錯不讓執行到 catch

語法

BEGIN TRY
     { sql_statement | statement_block }
END TRY
BEGIN CATCH
     [ { sql_statement | statement_block } ]
END CATCH

限制:
1 TRY…CATCH 建構會捕捉嚴重性高於 10 而未關閉資料庫連接的所有執行錯誤。
2 TRY 區塊後面必須緊接著相關聯的 CATCH 區塊。在 END TRY 與 BEGIN CATCH 陳述式之間包含任何
  其他陳述式，將會產生語法錯誤。
3 TRY…CATCH 建構不能跨越多個批次。TRY…CATCH 建構不能跨越多個 Transact-SQL 陳述式區塊。
  例如，TRY…CATCH 建構不能跨越 Transact-SQL 陳述式的兩個 BEGIN…END 區塊，也不能跨越 IF…ELSE 建構。

錯誤訊息攔截/擷取錯誤資訊
  在 CATCH 區塊的範圍內，下列系統函數可用來取得造成執行 CATCH 區塊之錯誤的相關資訊：

ERROR_NUMBER()    會傳回錯誤碼。
ERROR_SEVERITY()  會傳回嚴重性。
ERROR_STATE()     會傳回錯誤狀態碼。
ERROR_PROCEDURE() 會傳回發生錯誤的預存程序或觸發程序的名稱。
ERROR_LINE()      會傳回常式內造成錯誤的行號。
ERROR_MESSAGE()   會傳回錯誤訊息的完整文字。文字包括提供給任何可替代參數的值，例如，長度、物件名稱或次數。

*/
------------------------------------------------------------------------------------------
--例1 當 try 攔截到  運算有誤時 由 catch  記錄錯誤訊息

BEGIN TRY
    -- Generate divide-by-zero error.
    SELECT 1/0;
END TRY
BEGIN CATCH
    -- 攔截錯誤訊息
   SELECT
    ERROR_NUMBER() AS ErrorNumber
    ,ERROR_SEVERITY() AS ErrorSeverity
    ,ERROR_STATE() AS ErrorState
    ,ERROR_PROCEDURE() AS ErrorProcedure
    ,ERROR_LINE() AS ErrorLine
    ,ERROR_MESSAGE() AS ErrorMessage;
END CATCH;
go

-------------------------------------------------------------

--例2 改寫為 建 procedure 記錄錯誤訊息; 當 try 攔截到 運算有誤時 由 catch 呼叫 procdure 顯示

USE AdventureWorks2016CTP3;
GO
-- Verify that the stored procedure does not already exist.
IF OBJECT_ID ( 'usp_GetErrorInfo', 'P' ) IS NOT NULL 
    DROP PROCEDURE usp_GetErrorInfo;
GO

-- Create procedure to retrieve error information.
CREATE PROCEDURE usp_GetErrorInfo
AS
SELECT
    ERROR_NUMBER() AS ErrorNumber
    ,ERROR_SEVERITY() AS ErrorSeverity
    ,ERROR_STATE() AS ErrorState
    ,ERROR_PROCEDURE() AS ErrorProcedure
    ,ERROR_LINE() AS ErrorLine
    ,ERROR_MESSAGE() AS ErrorMessage;
GO

BEGIN TRY
    -- Generate divide-by-zero error.
    SELECT 1/0;
END TRY
BEGIN CATCH
    -- Execute error retrieval routine.
    EXECUTE usp_GetErrorInfo;
END CATCH;

--------------------------------------------------------------------------------------------
--下列程式碼範例顯示如何在 TRY 區塊內使用 RAISERROR，使執行位置跳到相關聯的 CATCH 區塊。
--這個範例也會顯示如何利用 RAISERROR，來傳回叫用 CATCH 區塊之錯誤的相關資訊。
--例3

BEGIN TRY
    RAISERROR (66666, 19, 1) WITH LOG  
    PRINT '沒有發生重大錯誤'                   
END TRY                                        
BEGIN CATCH  
    IF ERROR_SEVERITY() > 16   
      PRINT '發生嚴重錯誤！請通知管理員, 錯誤編號為:' + 
			CAST(ERROR_NUMBER() AS CHAR)
    ELSE 
	  PRINT '發生錯誤！錯誤訊息為:' + ERROR_MESSAGE()
END CATCH

GO

------------------------------------------------------------------------------
--例4

BEGIN TRY
    
    RAISERROR (66666, 19, 1) WITH LOG  
END TRY
BEGIN CATCH
  
    print 'ErrorMessage: '+cast( ERROR_MESSAGE() as char)
    print 'ErrorServerity: '+cast( ERROR_SEVERITY() as char)
    print 'ErrorState: '+cast( ERROR_STATE() as char)
    
END CATCH;

--例3  線上書範例有問題
BEGIN TRY
    -- RAISERROR with severity 11-19 will cause execution to 
    -- jump to the CATCH block.
    RAISERROR ('Error raised in TRY block.', -- Message text.
               16, -- Severity.
               1 -- State.
               );
END TRY
BEGIN CATCH
    DECLARE @ErrorMessage NVARCHAR(4000);
    DECLARE @ErrorSeverity INT;
    DECLARE @ErrorState INT;

    SELECT 
        @ErrorMessage = ERROR_MESSAGE(),
        @ErrorSeverity = ERROR_SEVERITY(),
        @ErrorState = ERROR_STATE();

    -- Use RAISERROR inside the CATCH block to return error
    -- information about the original error that caused
    -- execution to jump to the CATCH block.
    RAISERROR (@ErrorMessage, -- Message text.
               @ErrorSeverity, -- Severity.
               @ErrorState -- State.
               );
END CATCH;

--錯誤訊息
/*訊息 50000，層級 16，狀態 1，行 22
  Error raised in TRY block.
*/

-------------------------------------------------------------------------------
--例5 程式中語法錯誤或資料表不存在 則直接終止批次 不會到 CATCH
/* 訊息 208，層級 16，狀態 1，行 2
   無效的物件名稱 '資料表ABC'。
*/

BEGIN TRY
    SELECT * FROM 資料表ABC
END TRY
BEGIN CATCH
    PRINT 'TRY…CATCH 發現一個錯誤：' + ERROR_MESSAGE()
END CATCH

-----------------------------------------------------------------------------
--例6 
CREATE TABLE dbo.TableWithKey 
(ColA int PRIMARY KEY, ColB int)
GO

--
SELECT * 
FROM dbo.TableWithKey 
go
--
CREATE PROCEDURE dbo.AddData 
	@a int, @b int 
AS
BEGIN TRY
	INSERT INTO TableWithKey 
	VALUES (@a, @b)
END TRY

BEGIN CATCH 
	SELECT ERROR_NUMBER() N'錯誤碼', 
			ERROR_MESSAGE() N'錯誤訊息'
END CATCH

GO

--
EXEC dbo.AddData 1, 1

--
EXEC dbo.AddData 2, 2

-- 違反 Primary Key
EXEC dbo.AddData 1, 3

--
SELECT * FROM TableWithKey

-- 違反 Primary Key
INSERT TableWithKey 
VALUES(1,3)
