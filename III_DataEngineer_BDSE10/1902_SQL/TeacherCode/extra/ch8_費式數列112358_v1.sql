--�O��ƦC(fibonacci sequence): 0 1 1 2 3 5 8 13..
--�C�@�����ȴN�O�e�ⶵ���Ȭۥ[
--�u�n����ܼ� �����d�� JAVA world �H JAVA��g,
  
declare @v1 int, @v2 int
set @v1 = 0;
set @v2 = 1;
print @v1;
while (@v2<=100)
begin
  print @v2;
  set @v2 = @v2 + @v1;  --�`�M���e��Ƭۥ[ v1 + v2
  set @v1 = @v2 - @v1;  --v1 �]�� ��� ��v2
end;