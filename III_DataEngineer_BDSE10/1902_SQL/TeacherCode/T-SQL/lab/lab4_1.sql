--1.	Run the statement in the lab4_1.sql script to build the MY_EMPLOYEE table to be used for the lab.
  --  ���� lab4_1.sql �ɮ׫إ� MY_EMPLOYEE ��ƪ�

CREATE TABLE MY_EMPLOYEE
(ID         INT CONSTRAINT MY_EMPLOYEE_ID_NN   NOT NULL,
 LAST_NAME  VARCHAR(25),
 FIRST_NAME VARCHAR(25),
 USERID     VARCHAR(8),
 SALARY     decimal(9,2)
);