use mult_demo_db;
create table student(Id varchar(255), Name varchar(255), Department_id varchar(255));
insert into student values('1001', 'Money', 'M001');
insert into student values('1002', 'Jack', 'M001');
insert into student values('1003', 'Mary', 'E001');
insert into student values('1004', 'Judy', 'E001');
insert into student values('1005', 'Cat', 'I001');
insert into student values('1006', 'Dog', 'I001');
create table Department(Department_id varchar(255), Department varchar(255));
insert into Department values('M001', 'Mechanical');
insert into Department values('E001', 'Electrical');
insert into Department values('I001', 'Information');
create table Course(Course_id varchar(255), Course varchar(255));
insert into Course values('C01', 'Chinese');
insert into Course values('C02', 'English');
insert into Course values('C03', 'Math');
create table Score(Id varchar(255), Course_id varchar(255), Score varchar(255));
insert into Score values('1001', 'C01', '80');
insert into Score values('1001', 'C02', '88');
insert into Score values('1002', 'C03', '85');
insert into Score values('1003', 'C02', '88');
insert into Score values('1003', 'C03', '90');
insert into Score values('1004', 'C01', '80');
insert into Score values('1005', 'C02', '83');
insert into Score values('1006', 'C03', '81');
insert into Score values('1006', 'C01', '88');