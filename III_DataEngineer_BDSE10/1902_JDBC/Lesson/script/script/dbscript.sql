
begin transaction;
DROP TABLE EMP;
DROP TABLE DEPT;
DROP TABLE accounts;
DROP SEQUENCE emp_seq;
DROP SEQUENCE dept_seq;


CREATE TABLE DEPT (
 DEPTNO             int NOT NULL,
 DNAME              VARCHAR(14),
 LOCATION           VARCHAR(13),
 CONSTRAINT DEPT_PRIMARY_KEY PRIMARY KEY (DEPTNO));
 
CREATE SEQUENCE dept_seq
INCREMENT BY 10
START WITH 10;

INSERT INTO DEPT VALUES (next value for dept_seq,'財務部','台北');
INSERT INTO DEPT VALUES (next value for dept_seq,'研發部','新竹');
INSERT INTO DEPT VALUES (next value for dept_seq,'業務部','台中');
INSERT INTO DEPT VALUES (next value for dept_seq,'生管部','高雄');



CREATE TABLE EMP (
 EMPNO               int NOT NULL,
 ENAME               VARCHAR(10),
 JOB                 VARCHAR(9),
 HIREDATE            DATE,
 SALARY              numeric(8,2),
 COMMISSION          numeric(8,2),
 DEPTNO              int NOT NULL,
 Version             int NOT NULL default(0),
 CONSTRAINT EMP_DEPTNO_FK FOREIGN KEY (DEPTNO) REFERENCES DEPT (DEPTNO),
 CONSTRAINT EMP_EMPNO_PK PRIMARY KEY (EMPNO));
 
CREATE SEQUENCE emp_seq
INCREMENT BY 1
START WITH 1001;

INSERT INTO EMP  (EMPNO,ENAME,JOB,HIREDATE,SALARY,COMMISSION,DEPTNO,Version) VALUES (next value for emp_seq,'王先生','總裁',CAST('1970-11-1' as datetime),5100,0.0,10,0);
INSERT INTO EMP  (EMPNO,ENAME,JOB,HIREDATE,SALARY,COMMISSION,DEPTNO,Version)VALUES (next value for emp_seq,'李小姐','經理',CAST('1971-05-2' as datetime),3940,0.0,30,0);
INSERT INTO EMP  (EMPNO,ENAME,JOB,HIREDATE,SALARY,COMMISSION,DEPTNO,Version)VALUES (next value for emp_seq,'陳小扁','經理',CAST('1972-01-19' as datetime),1234,0.0,10,0);
INSERT INTO EMP  (EMPNO,ENAME,JOB,HIREDATE,SALARY,COMMISSION,DEPTNO,Version)VALUES (next value for emp_seq,'馬小九','經理',CAST('1973-04-12' as datetime),9876,0.0,20,0);
INSERT INTO EMP  (EMPNO,ENAME,JOB,HIREDATE,SALARY,COMMISSION,DEPTNO,Version)VALUES (next value for emp_seq,'羅有大','業務',CAST('1974-09-03' as datetime),8876,1400,30,0);
INSERT INTO EMP  (EMPNO,ENAME,JOB,HIREDATE,SALARY,COMMISSION,DEPTNO,Version)VALUES (next value for emp_seq,'老來旺','業務',CAST('1975-02-2' as datetime),1098,300,30,0);
INSERT INTO EMP  (EMPNO,ENAME,JOB,HIREDATE,SALARY,COMMISSION,DEPTNO,Version)VALUES (next value for emp_seq,'柯蘭詩','業務',CAST('1976-09-28' as datetime),1300,0,30,0);
INSERT INTO EMP  (EMPNO,ENAME,JOB,HIREDATE,SALARY,COMMISSION,DEPTNO,Version)VALUES (next value for emp_seq,'劉比蒂','行銷',CAST('1978-12-03' as datetime),6789,0.0,30,0);
INSERT INTO EMP  (EMPNO,ENAME,JOB,HIREDATE,SALARY,COMMISSION,DEPTNO,Version)VALUES (next value for emp_seq,'范劍','業務',CAST('1979-02-22' as datetime),3456,500,30,0);
INSERT INTO EMP  (EMPNO,ENAME,JOB,HIREDATE,SALARY,COMMISSION,DEPTNO,Version) VALUES (next value for emp_seq,'范統','行銷',CAST('1980-12-03' as datetime),9999,0.0,20,0);
INSERT INTO EMP  (EMPNO,ENAME,JOB,HIREDATE,SALARY,COMMISSION,DEPTNO,Version)VALUES (next value for emp_seq,'秦壽生','行銷',CAST('1981-12-17' as datetime),8008,0.0,20,0);


drop table Files;

CREATE TABLE Files (
 filename      varchar(30) NOT NULL,
 DATA          varbinary(MAX),
 contents	   varchar(max)
);


drop table users;
CREATE TABLE users (
 username      varchar(30) NOT NULL,
 password      varchar(30) NOT NULL
);

insert into users (username,password) values ('scott','tiger');

CREATE TABLE Accounts (
 accountName      varchar(50) NOT NULL,
 balance          int,
 version          int not null
);
insert into Accounts (accountName,balance,version) values ('A',1000,0);
insert into Accounts (accountName,balance,version) values ('B',1000,0);
insert into Accounts (accountName,balance,version) values ('C',1000,0);


commit;

