-- list  1 2 3 4...10
declare  @x  int,
         @str  varchar(200)
set @x  = 1
set @str = 'Hello world'
print @x
print @str
go

--2 list  1 2 3 4...10
declare  @x  int,
         @str  varchar(200)
set @x  = 1
while(@x<=10)
begin
  --set @str = 'Hello world'
  print @x
  --print @str
  set @x = @x + 1
end
go


--2 list  2 4 6 8 10
declare  @x  int,
         @str  varchar(200)
set @x  = 2
while(@x<=10)
begin
  print @x
  set @x = @x + 2  -- 1  3  5
end
go

--2 list  2 4 6 8 10
declare  @x  int,
         @str  varchar(200)
set @x  = 1
while(@x<=10)
begin
  if @x % 2  = 0
     print @x
  set @x = @x + 1  -- 1  3  5
end
go

--2 sum 1+ 2 +3 +4...+10
declare  @x  int,
         @str  varchar(200),
		 @s int = 0
set @x  = 1
while(@x<=10)
begin
  print @x
  set @s = @s  + @x    --  s =  0  + 1
  set @x = @x + 1
end
print 's= ' + cast(@s as varchar(4))
go