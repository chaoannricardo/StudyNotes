
--建立一 資料庫定序為 CS 時 有區分大小寫

CREATE DATABASE DB03
  COLLATE Chinese_Taiwan_Stroke_CS_AS
go

use DB03
go

create table employees
(
  employee_id int,
  last_name   char(20)
)
go

insert into employees values (101,'Abel');
insert into employees values (102,'john');
insert into employees values (102,'JOHN');

go

select * from employees
go

select last_name 
from  employees 
where  last_name = 'Abel'


select last_name 
from  employees 
where  last_name = 'ABEL'


--以函數轉換

select last_name 
from  employees 
where  upper(last_name) = 'ABEL'


--設定序為 CS時 連建表格的欄位也要一致

以下會錯 region_id 大小寫不一致

CREATE TABLE REGIONS
    ( REGION_ID   INT  CONSTRAINT  region_id_nn NOT NULL
                       CONSTRAINT  reg_id_pk  PRIMARY KEY (region_id),
      REGION_NAME VARCHAR(25) 
    )
go

以下才 ok
CREATE TABLE REGIONS
    ( REGION_ID   INT  CONSTRAINT  region_id_nn NOT NULL
                       CONSTRAINT  reg_id_pk  PRIMARY KEY (REGION_ID),
      REGION_NAME VARCHAR(25) 
    )
go
