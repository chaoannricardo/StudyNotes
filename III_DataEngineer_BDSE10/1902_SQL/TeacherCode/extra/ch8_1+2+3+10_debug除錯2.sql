--1+2+3...+10

DECLARE @n int,
        @s  int,
		@str  varchar(200)

SET @n=1;
set @s = 0
set @str = ''

WHILE ( @n <= 10 )
  BEGIN
    PRINT 'n= '+ CAST(@n AS varchar(2));
	set @s = @s  + @n
	if @n< 10
	  set @str = @str + CAST(@n AS varchar(2))  + ' + '
    else
	  set @str = @str + CAST(@n AS varchar(2))  + ' = '

    SET @n = @n + 1 ;   --�� SET @n += 1; 
  END

 PRINT 'S= '+ CAST(@s AS varchar(4));
 PRINT  @str +  CAST(@s AS varchar(4));



--�}�ldebug
-- �I �\��� / ���� / ���� / �ϰ��ܼ�
-- �I�{���X����Ǧ�� �]���_�I
-- �� ���T���� / �I "�v�B����" ��"���i�J�{��" �� "�����{��"
