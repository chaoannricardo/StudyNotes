

--ch3 create db

CREATE   DATABASE   DB01;

--open database
USE DB01;

--create table
create table student
( id    int        PRIMARY KEY,   --�Ǹ�
  name  nchar(20),                --�m�W
  bdate date,
  tel   char(20)
);

create table course
( id    int     ,   --�Ǹ�
  name  nchar(20),  --�ҦW
  score int,        --����
  FOREIGN KEY(id) REFERENCES student(id) 
);
go
