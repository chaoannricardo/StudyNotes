--費氏數列(fibonacci sequence): 0 1 1 2 3 5 8 13..
--每一項的值就是前兩項的值相加
--只要兩個變數 網路查的 JAVA world 以 JAVA改寫,
  
declare @v1 int, @v2 int
set @v1 = 0;
set @v2 = 1;
print @v1;
while (@v2<=100)
begin
  print @v2;
  set @v2 = @v2 + @v1;  --總和為前兩數相加 v1 + v2
  set @v1 = @v2 - @v1;  --v1 設為 原來 的v2
end;