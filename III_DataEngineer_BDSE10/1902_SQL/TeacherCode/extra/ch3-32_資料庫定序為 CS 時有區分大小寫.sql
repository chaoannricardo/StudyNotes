
--�إߤ@ ��Ʈw�w�Ǭ� CS �� ���Ϥ��j�p�g

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


--�H����ഫ

select last_name 
from  employees 
where  upper(last_name) = 'ABEL'


--�]�w�Ǭ� CS�� �s�ت�檺���]�n�@�P

�H�U�|�� region_id �j�p�g���@�P

CREATE TABLE REGIONS
    ( REGION_ID   INT  CONSTRAINT  region_id_nn NOT NULL
                       CONSTRAINT  reg_id_pk  PRIMARY KEY (region_id),
      REGION_NAME VARCHAR(25) 
    )
go

�H�U�~ ok
CREATE TABLE REGIONS
    ( REGION_ID   INT  CONSTRAINT  region_id_nn NOT NULL
                       CONSTRAINT  reg_id_pk  PRIMARY KEY (REGION_ID),
      REGION_NAME VARCHAR(25) 
    )
go
