--�O��ƦC(fibonacci sequence): 0 1 1 2 3 5 8 13..
--�C�@�����ȴN�O�e�ⶵ���Ȭۥ[
--�u�n����ܼ� �����d�� JAVA world �H JAVA ���j��g,
--JAVA http://gn00466269.blogspot.tw/2015/10/java.html

create function fay ( @n int)
returns int
as
begin
 if (@n = 1 or @n = 2)
    set @n=1;
 else
   begin
    set @n=  dbo.fay(@n-1) + dbo.fay(@n-2)
   end
 print  @n;
 return @n;
end

/* test
print  dbo.fay(1)  --1
print  dbo.fay(2)  --1
print  dbo.fay(3)  --2
print  dbo.fay(4)  --3
print  dbo.fay(5)  --5
print  dbo.fay(6)  --8
print  dbo.fay(7)  --13
print  dbo.fay(8)  --21
print  dbo.fay(9)  --34
print  dbo.fay(10) --55

--��
declare @x int = 1;
while (@x<=10)
  begin
    print dbo.fay(@x);
    set @x = @x + 1;
  end

*/