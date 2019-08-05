/* 原 procedure 傳 2個參數進去運算後, 計算後回傳第三個參數
   Returning Values with Output Parameters
*/
USE Northwind
GO
CREATE PROCEDURE dbo.MathTutor
	@m1 smallint,
	@m2 smallint,
	@result smallint OUTPUT
AS
	SET @result = @m1* @m2 
GO

/*
This batch calls the MathTutor stored procedure and passes the values of 5 and 6. These values become variables, which are entered into the SET statement.
*/

--執行
DECLARE @answer smallint
EXECUTE MathTutor 5,6, @answer OUTPUT
SELECT 'The result is:', @answer
GO

--改寫為 Function

CREATE FUNCTION fn_MathTutor (@m1 int, @m2 int)
RETURNS int 
AS
BEGIN
	RETURN   @m1* @m2; 
END;
GO

--執行
DECLARE @answer smallint
SET @answer =  dbo.fn_MathTutor (5,6)
SELECT 'The result is:', @answer
GO

select  dbo.fn_MathTutor (5,6)