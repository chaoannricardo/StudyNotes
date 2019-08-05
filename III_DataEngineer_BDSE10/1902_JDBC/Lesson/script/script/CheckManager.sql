
CREATE PROCEDURE dbo.CheckManager(@empno numeric(4))
   AS
   DECLARE @job varchar(10)
BEGIN
   select @job = job from emp where EMPNO=@empno
   IF (@job = '經理')
	 RETURN 1
   ELSE
	RETURN 0
END