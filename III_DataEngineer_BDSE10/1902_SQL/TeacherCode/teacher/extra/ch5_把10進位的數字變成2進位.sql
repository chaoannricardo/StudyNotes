--��10�i�쪺�Ʀr�ܦ�2�i��--�Ʀr��0-15(16�i���ন2�i���)
--Java 
/* int a = 101;
   System.out.println(Integer.toBinaryString(a));
*/

--T-SQL http://evabow.blogspot.tw/2008/01/102-0-15162.html

create FUNCTION [dbo].[10Transfer2_16] (@Code Int) RETURNS Nvarchar(8)
AS
BEGIN
�@DECLARE @Number Int
�@DECLARE @I INT
�@DECLARE @Two Nvarchar(8)

�@SET @Number = @Code
�@SET @I = 7 --�u��7��
�@SET @Two = ''

�@WHILE @I <> 0
�@BEGIN
�@�@SET @Two = CONVERT(Nvarchar(1), @Number%2) + @Two
�@�@SET @Number = @Number / 2
�@�@SET @I = @I - 1
�@END

�@IF @I = 0
�@BEGIN
�@�@SET @Two = CONVERT(Nvarchar(1), @Number) + @Two
�@END

�@RETURN LTRIM(RTRIM(@Two))
END

-- run
-- Select dbo.[10Transfer2_16](14)   ==> 00001110
-- Select dbo.[10Transfer2_16](59)   ==> 00111011
