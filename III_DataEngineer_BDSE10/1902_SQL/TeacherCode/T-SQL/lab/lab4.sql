--T_SQL  Lab

--Lab 4資料的新增、修改、刪除

--2.	Add the first row of data to the MY_EMPLOYEE table from the following sample data. Do not list the columns in the INSERT clause.
  -- 新增INSERT一筆資料到MY_EMPLOYEE 資料表, 如員工編號ID 3,姓名last_name: Dancs ;不要列出欄位名稱
insert into MY_EMPLOYEE (id, last_name) values(3, 'Dancs')

--3.	Confirm your addition to the table
    --確認資料己新增到 表格中(即 查詢 資料表)

select *
from my_employee
 

--4.	Change the last name of employee 3 to Drexler.
  --  修改UPDATE員工編號(employee_id) 3 的員工姓名last_name為 Drexler

update MY_EMPLOYEE 
set LAST_NAME = 'Drexler'
where ID = 3

--5.	Delete Drexler from the MY_EMPLOYEE table.
   -- 刪除 員工姓名last_name為 Drexler之員工資料

   delete from MY_EMPLOYEE
   where LAST_NAME = 'Drexler'

--6.	Empty the entire table.
  --  刪除 MY_EMPLOYEE表格中所有的資料列

  truncate table MY_EMPLOYEE

--Lab 9補充 進階SQL指令 介紹
 --參考 講義範例
