--1.	Run the statement in the lab4_1.sql script to build the MY_EMPLOYEE table to be used for the lab.
  --  執行 lab4_1.sql 檔案建立 MY_EMPLOYEE 資料表

CREATE TABLE MY_EMPLOYEE
(ID         INT CONSTRAINT MY_EMPLOYEE_ID_NN   NOT NULL,
 LAST_NAME  VARCHAR(25),
 FIRST_NAME VARCHAR(25),
 USERID     VARCHAR(8),
 SALARY     decimal(9,2)
);