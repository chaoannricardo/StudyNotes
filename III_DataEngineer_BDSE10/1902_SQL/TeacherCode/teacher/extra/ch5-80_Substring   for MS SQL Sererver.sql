--Substring   for MS SQL Sererver 

select substring('abcdefg',  1 , 5)   --ahcde 眖1秨﹍ length 5
select substring('abcdefg',  2 , 3)   --hcd   眖2秨﹍ length 3

--start 币﹍单0,眖材1秨﹍ 
select substring('abcdefg', -1 , 9)   --ahc  币﹍单0,眖材1秨﹍ 
                                      --      start + length -1 = -1+5-1 = 3
select substring('abcdefg', -1 , 4)   --ab  -1+4-1 = 2

select substring('abcdefg', 0 , 5)    --abcd   0+5-1 = 4
select substring('abcdefg', 0 , 4)    --abc    0+4-1 = 3

select substring('abcdefg', -3 , 5)
select substring('abcdefg', -3 , 4)
select substring('abcdefg', -3 , 3)

--error
select substring('abcdefg', 1 , -1)
select substring('abcdefg', 1 , -3)

 --Oracle https://docs.oracle.com/cd/B19306_01/server.102/b14200/functions162.htm
 --strart 璽计 琌眖┕玡计
 --Oracle Substr('abcdefg', -3 , 2)    -- ef
 --Oracle Substr('abcdefg', -5 , 4)    -- cdef
