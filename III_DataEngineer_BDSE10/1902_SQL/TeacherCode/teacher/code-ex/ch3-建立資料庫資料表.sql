

--ch3 create db

CREATE   DATABASE   DB01;

--open database
USE DB01;

--create table
create table student
( id    int        PRIMARY KEY,   --學號
  name  nchar(20),                --姓名
  bdate date,
  tel   char(20)
);

create table course
( id    int     ,   --學號
  name  nchar(20),  --課名
  score int,        --分數
  FOREIGN KEY(id) REFERENCES student(id) 
);
go
