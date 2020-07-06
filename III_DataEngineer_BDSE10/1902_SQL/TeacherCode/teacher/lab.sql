USE master
GO

IF EXISTS (SELECT name FROM master.dbo.sysdatabases WHERE name = N'DB01')
  BEGIN     
     ALTER DATABASE DB01 SET  SINGLE_USER WITH ROLLBACK IMMEDIATE 
     DROP DATABASE DB01
   END
GO

create database DB01
go

use DB01
go

-- ******  remove tables ....
IF EXISTS (SELECT name FROM sysobjects
            WHERE type = 'U' AND name = 'job_history')
    DROP TABLE job_history
GO

IF EXISTS (SELECT name FROM sysobjects
            WHERE type = 'V' AND name = 'emp_details_view')
    DROP VIEW emp_details_view
GO

IF EXISTS (SELECT name FROM sysobjects
            WHERE type = 'U' AND name = 'employees')
    ALTER TABLE departments drop CONSTRAINT dept_mgr_fk
GO

IF EXISTS (SELECT name FROM sysobjects
            WHERE type = 'U' AND name = 'employees')
    DROP TABLE employees
GO


IF EXISTS (SELECT name FROM sysobjects
            WHERE type = 'U' AND name = 'departments')           
    DROP TABLE departments
GO

IF EXISTS (SELECT name FROM sysobjects
            WHERE type = 'U' AND name = 'jobs')
    DROP TABLE jobs
GO

IF EXISTS (SELECT name FROM sysobjects
            WHERE type = 'U' AND name = 'locations')
    DROP TABLE locations
GO

IF EXISTS (SELECT name FROM sysobjects
            WHERE type = 'U' AND name = 'countries')
    DROP TABLE countries
GO

IF EXISTS (SELECT name FROM sysobjects
            WHERE type = 'U' AND name = 'regions')
    DROP TABLE regions
GO

IF EXISTS (SELECT name FROM sysobjects
            WHERE type = 'U' AND name = 'job_grades')
    DROP TABLE job_grades
GO

-- ******  Creating REGIONS table ....
CREATE TABLE REGIONS
    ( REGION_ID   INT  CONSTRAINT  region_id_nn NOT NULL
                       CONSTRAINT  reg_id_pk  PRIMARY KEY (region_id),
      REGION_NAME VARCHAR(25) 
    )
go

-- ******  Creating COUNTRIES table ....
CREATE TABLE COUNTRIES 
    ( COUNTRY_ID    CHAR(2)     CONSTRAINT  country_id_nn NOT NULL,
      COUNTRY_NAME  VARCHAR(40), 
      REGION_ID     INT, 
      CONSTRAINT country_c_id_pk  PRIMARY KEY (country_id) ,
      CONSTRAINT countr_reg_fk FOREIGN KEY (region_id) REFERENCES regions(region_id)) 

go    
-- ******  Creating LOCATIONS table ....
CREATE TABLE LOCATIONS
    ( LOCATION_ID    INT          CONSTRAINT loc_id_pk PRIMARY KEY (location_id),
      STREET_ADDRESS VARCHAR(40),
      POSTAL_CODE    VARCHAR(12),
      CITY           VARCHAR(30)  CONSTRAINT loc_city_nn  NOT NULL,
      STATE_PROVINCE VARCHAR(25),
      COUNTRY_ID     CHAR(2)CONSTRAINT loc_c_id_fk FOREIGN KEY (country_id)
                            REFERENCES countries(country_id) ) 
go
-- ******  Creating DEPARTMENTS table ....
CREATE TABLE DEPARTMENTS
    ( DEPARTMENT_ID    INT,
      DEPARTMENT_NAME  VARCHAR(30) CONSTRAINT  dept_name_nn  NOT NULL,
      MANAGER_ID       INT,
      LOCATION_ID      INT,
      CONSTRAINT dept_id_pk PRIMARY KEY (department_id),
      CONSTRAINT dept_loc_fk FOREIGN KEY (location_id) REFERENCES locations (location_id)  ) 

go

-- ******  Creating JOBS table ....
CREATE TABLE JOBS
    ( JOB_ID       VARCHAR(10) CONSTRAINT job_id_pk PRIMARY KEY,
      JOB_TITLE    VARCHAR(35) CONSTRAINT job_title_nn  NOT NULL,
      MIN_SALARY   INT,
      MAX_SALARY   INT)
go


-- ******  Creating EMPLOYEES table ....
CREATE TABLE EMPLOYEES
    ( EMPLOYEE_ID    INT          CONSTRAINT emp_emp_id_pk PRIMARY KEY,
      FIRST_NAME     VARCHAR(20),
      LAST_NAME      VARCHAR(25)  CONSTRAINT emp_last_name_nn  NOT NULL,
      EMAIL          VARCHAR(25)  CONSTRAINT emp_email_nn  NOT NULL,
      PHONE_NUMBER   VARCHAR(20),
      HIRE_DATE      DATE	  CONSTRAINT emp_hire_date_nn  NOT NULL,
      JOB_ID         VARCHAR(10)  CONSTRAINT emp_job_nn  NOT NULL,
      SALARY         INT, 
      COMMISSION_PCT decimal(2,2) ,
      MANAGER_ID     INT,
      DEPARTMENT_ID  INT,
      CONSTRAINT     emp_salary_min  CHECK (salary > 0)     ,
      CONSTRAINT     emp_email_uk  UNIQUE (email) ,
      CONSTRAINT     emp_dept_fk  FOREIGN KEY (department_id) REFERENCES departments ,
      CONSTRAINT     emp_job_fk FOREIGN KEY (job_id) REFERENCES jobs (job_id) ,
      CONSTRAINT     emp_manager_fk FOREIGN KEY (manager_id) REFERENCES employees)
go

ALTER TABLE departments add CONSTRAINT dept_mgr_fk FOREIGN KEY (manager_id)  REFERENCES 
employees (employee_id)
go



-- ******  Creating JOB_HISTORY table ....
CREATE TABLE JOB_HISTORY
    ( EMPLOYEE_ID   INT 	CONSTRAINT    jhist_employee_nn  NOT NULL,
      START_DATE    DATE	CONSTRAINT    jhist_start_date_nn  NOT NULL,
      END_DATE      DATE	CONSTRAINT    jhist_end_date_nn  NOT NULL,
      JOB_ID        VARCHAR(10)	CONSTRAINT    jhist_job_nn  NOT NULL,
      DEPARTMENT_ID INT,
      CONSTRAINT jhist_date_interval  CHECK (end_date > start_date),
      CONSTRAINT jhist_emp_id_st_date_pk  PRIMARY KEY(employee_id, start_date),
      CONSTRAINT jhist_job_fk  FOREIGN KEY (job_id) REFERENCES jobs, 
      CONSTRAINT jhist_emp_fk FOREIGN KEY (employee_id) REFERENCES employees,
      CONSTRAINT jhist_dept_fk FOREIGN KEY (department_id) REFERENCES departments
 ) 
go

-- ******  Creating EMP_DETAILS_VIEW view ...

CREATE  VIEW EMP_DETAILS_VIEW
  (employee_id, job_id, manager_id, department_id, location_id, country_id,   
   first_name,  last_name, salary, commission_pct, department_name, job_title, city,   
   state_province, country_name, region_name)
AS SELECT  e.employee_id,   e.job_id,   e.manager_id,   e.department_id,  d.location_id,  
           l.country_id,  e.first_name,   e.last_name,  e.salary,  e.commission_pct,  
           d.department_name,  j.job_title,  l.city, l.state_province, c.country_name,
           r.region_name
FROM  employees e,  departments d,  jobs j,  locations l,  countries c,  regions r
WHERE e.department_id = d.department_id   AND d.location_id = l.location_id
      AND l.country_id = c.country_id   AND c.region_id = r.region_id   
      AND j.job_id = e.job_id 

go

-- ******  Populating REGIONS table ....

INSERT INTO regions VALUES  ( 1, 'Europe' );
INSERT INTO regions VALUES  ( 2, 'Americas' );
INSERT INTO regions VALUES  ( 3, 'Asia' );
INSERT INTO regions VALUES  ( 4, 'Middle East and Africa' );
go

-- ******  Populating COUNTIRES table ....

INSERT INTO countries VALUES ( 'US' , 'United States of America' , 2 );
INSERT INTO countries VALUES ( 'CA' , 'Canada' , 2 );
INSERT INTO countries VALUES ( 'UK' , 'United Kingdom' , 1 );
INSERT INTO countries VALUES ( 'DE' , 'Germany' , 1 );
go

-- ******  Populating LOCATIONS table ....

INSERT INTO locations VALUES ( 1400, '2014 Jabberwocky Rd' , '26192' , 'Southlake' , 'Texas' , 'US' );
INSERT INTO locations VALUES ( 1500, '2011 Interiors Blvd' , '99236' , 'South San Francisco', 'California' , 'US');
INSERT INTO locations VALUES ( 1700, '2004 Charade Rd' , '98199' , 'Seattle' , 'Washington' , 'US' );
INSERT INTO locations VALUES ( 1800, '460 Bloor St. W.' , 'ON M5S 1X8' , 'Toronto' , 'Ontario' , 'CA' );


INSERT INTO locations VALUES ( 2500, 'Magdalen Centre, The Oxford Science Park' , 'OX9 9ZB' , 'Oxford' , 'Oxford' , 'UK' );
go

-- ******  Populating DEPARTMENTS table ....

ALTER TABLE departments   nocheck CONSTRAINT dept_mgr_fk;
go

INSERT INTO departments VALUES ( 10, 'Administration' , 200, 1700 );
INSERT INTO departments VALUES ( 20, 'Marketing' , 201, 1800 );                               
INSERT INTO departments VALUES ( 50, 'Shipping' , 124, 1500 );                
INSERT INTO departments VALUES ( 60, 'IT' , 103, 1400 );                
INSERT INTO departments VALUES ( 80, 'Sales' , 149, 2500 );                
INSERT INTO departments VALUES ( 90, 'Executive' , 100, 1700 );
INSERT INTO departments VALUES ( 110, 'Accounting' , 205, 1700 );
INSERT INTO departments VALUES ( 190, 'Contracting' , NULL, 1700 );
go

-- ******  Populating JOBS table ....

INSERT INTO jobs VALUES ( 'AD_PRES' , 'President' , 20000, 40000 );
INSERT INTO jobs VALUES ( 'AD_VP' , 'Administration Vice President' , 15000, 30000 );
INSERT INTO jobs VALUES ( 'AD_ASST' , 'Administration Assistant' , 3000, 6000 );
INSERT INTO jobs VALUES ( 'AC_MGR' , 'Accounting Manager' , 8200, 16000 );
INSERT INTO jobs VALUES ( 'AC_ACCOUNT' , 'Public Accountant' , 4200, 9000 );
INSERT INTO jobs VALUES ( 'SA_MAN' , 'Sales Manager' , 10000, 20000 );
INSERT INTO jobs VALUES ( 'SA_REP' , 'Sales Representative' , 6000, 12000 );
INSERT INTO jobs VALUES ( 'ST_MAN' , 'Stock Manager' , 5500, 8500 );
INSERT INTO jobs VALUES ( 'ST_CLERK' , 'Stock Clerk' , 2000, 5000 );
INSERT INTO jobs VALUES ( 'IT_PROG' , 'Programmer' , 4000, 10000 );
INSERT INTO jobs VALUES ( 'MK_MAN' , 'Marketing Manager' , 9000, 15000 );
INSERT INTO jobs VALUES ( 'MK_REP' , 'Marketing Representative' , 4000, 9000 );
go

-- ******  Populating EMPLOYEES table ....

INSERT INTO employees VALUES ( 100, 'Steven' , 'King' , 'SKING' , '515.123.4567', '1987-06-17', 
'AD_PRES' , 24000, NULL, NULL, 90 );
INSERT INTO employees VALUES ( 101, 'Neena' , 'Kochhar' , 'NKOCHHAR' , '515.123.4568', '1989-09-21',  'AD_VP' , 17000, NULL, 100, 90 );
INSERT INTO employees VALUES ( 102, 'Lex' , 'De Haan' , 'LDEHAAN' , '515.123.4569', '1993-01-13',  'AD_VP' , 17000, NULL, 100, 90 );
INSERT INTO employees VALUES ( 103, 'Alexander' , 'Hunold' , 'AHUNOLD' , '590.423.4567', '1990-01-03', 
'IT_PROG' , 9000, NULL, 102, 60 );
INSERT INTO employees VALUES ( 104, 'Bruce' , 'Ernst' , 'BERNST' , '590.423.4568', '1991-05-21','IT_PROG' , 6000, NULL, 103, 60 );
INSERT INTO employees VALUES ( 107, 'Diana' , 'Lorentz' , 'DLORENTZ' , '590.423.5567', '1999-02-07',  
'IT_PROG' , 4200, NULL, 103, 60 );
INSERT INTO employees VALUES ( 124, 'Kevin' , 'Mourgos' , 'KMOURGOS' , '650.123.5234', '1999-11-16',  'ST_MAN' , 5800, NULL, 100, 50 );
INSERT INTO employees VALUES ( 141, 'Trenna' , 'Rajs' , 'TRAJS' , '650.121.8009', '1995-10-17',  'ST_CLERK' , 3500, NULL, 124, 50 );
INSERT INTO employees VALUES ( 142, 'Curtis' , 'Davies' , 'CDAVIES' , '650.121.2994', '1997-01-29',  'ST_CLERK' , 3100, NULL, 124, 50 );
INSERT INTO employees VALUES ( 143, 'Randall' , 'Matos' , 'RMATOS' , '650.121.2874', '1998-03-15',  'ST_CLERK' , 2600, NULL, 124, 50 );
INSERT INTO employees VALUES ( 144, 'Peter' , 'Vargas' , 'PVARGAS' , '650.121.2004', '1998-07-09',  'ST_CLERK' , 2500, NULL, 124, 50 );
INSERT INTO employees VALUES ( 149, 'Eleni' , 'Zlotkey' , 'EZLOTKEY' , '011.44.1344.429018' , '2000-01-29', 
'SA_MAN' , 10500, .2, 100, 80 );
INSERT INTO employees VALUES ( 174, 'Ellen' , 'Abel' , 'EABEL' , '011.44.1644.429267', '1996-05-11',  'SA_REP' , 11000, .30, 149, 80 );
INSERT INTO employees VALUES ( 176, 'Jonathon' , 'Taylor' , 'JTAYLOR' , '011.44.1644.429265' , '1998-03-24', 'SA_REP' , 8600, .20, 149, 80 );
INSERT INTO employees VALUES ( 178, 'Kimberely' , 'Grant' , 'KGRANT' , '011.44.1644.429263' , '1999-05-24', 'SA_REP' , 7000, .15, 149, NULL        );
INSERT INTO employees VALUES ( 200, 'Jennifer' , 'Whalen' , 'JWHALEN' , '515.123.4444', '1987-09-17','AD_ASST' , 4400, NULL, 101, 10 );
INSERT INTO employees VALUES ( 201, 'Michael' , 'Hartstein' , 'MHARTSTE' , '515.123.5555' , '1996-02-17','MK_MAN' , 13000, NULL, 100, 20 );
INSERT INTO employees VALUES ( 202, 'Pat' , 'Fay' , 'PFAY' , '603.123.6666' , '1997-08-17' , 'MK_REP' , 6000, NULL, 201, 20 );
INSERT INTO employees VALUES ( 205, 'Shelley' , 'Higgins' , 'SHIGGINS' , '515.123.8080', '1994-06-07','AC_MGR' , 12000, NULL, 101, 110 );
INSERT INTO employees VALUES ( 206, 'William' , 'Gietz' , 'WGIETZ' , '515.123.8181', '1994-06-07',  'AC_ACCOUNT' , 8300, NULL, 205, 110 );
go


-- disable integrity constraint to job_history for empolyee_id 114, 122
ALTER TABLE job_history nocheck CONSTRAINT JHIST_EMP_FK;
go

-- ********* insert data into the JOB_HISTORY table

INSERT INTO job_history VALUES (102, '1993-01-13', '1998-07-24', 'IT_PROG', 60);
INSERT INTO job_history VALUES (101, '1989-09-21', '1993-10-27', 'AC_ACCOUNT', 110);
INSERT INTO job_history VALUES (101, '1993-10-28', '1997-03-15', 'AC_MGR', 110);
INSERT INTO job_history VALUES (201, '1996-02-17', '1999-12-19', 'MK_REP', 20);
INSERT INTO job_history VALUES  (114, '1998-03-24',  '1999-12-31',  'ST_CLERK' , 50 );
INSERT INTO job_history VALUES  (122, '1999-01-01',  '1999-12-31',  'ST_CLERK' , 50 );
INSERT INTO job_history VALUES  (200, '1987-09-17',  '1993-06-17',  'AD_ASST' , 90 );
INSERT INTO job_history VALUES  (176, '1998-03-24',  '1998-12-31',  'SA_REP' , 80 );
INSERT INTO job_history VALUES  (176, '1999-01-01',  '1999-12-31',  'SA_MAN' , 80 );
INSERT INTO job_history VALUES  (200, '1994-07-01',  '1998-12-31',  'AC_ACCOUNT' , 90 );
go

-- enable integrity constraint to DEPARTMENTS

ALTER TABLE departments   check CONSTRAINT dept_mgr_fk;
go

CREATE INDEX emp_department_ix        ON employees (department_id);
CREATE INDEX emp_job_ix       ON employees (job_id);
CREATE INDEX emp_manager_ix         ON employees (manager_id);
CREATE INDEX emp_name_ix        ON employees (last_name, first_name);
CREATE INDEX dept_location_ix        ON departments (location_id);
CREATE INDEX jhist_job_ix        ON job_history (job_id);
CREATE INDEX jhist_employee_ix        ON job_history (employee_id);
CREATE INDEX jhist_department_ix        ON job_history (department_id);
CREATE INDEX loc_city_ix        ON locations (city);
CREATE INDEX loc_state_province_ix	        ON locations (state_province);
CREATE INDEX loc_country_ix        ON locations (country_id);
go

CREATE TABLE JOB_GRADES (GRADE_LEVEL VARCHAR(3),  LOWEST_SAL  INT,  HIGHEST_SAL INT);
go
INSERT INTO job_grades VALUES ('A', 1000, 2999);
INSERT INTO job_grades VALUES ('B', 3000, 5999);
INSERT INTO job_grades VALUES ('C', 6000, 9999);
INSERT INTO job_grades VALUES ('D', 10000, 14999);
INSERT INTO job_grades VALUES ('E', 15000, 24999);
INSERT INTO job_grades VALUES ('F', 25000, 40000);
go

--extra student table
create table student
( id    int        PRIMARY KEY,   --學號
  name  nchar(20),                --姓名
  bdate date,
  tel   char(20)
);

create table course
( id    int     ,   --學號
  name  nchar(20),   --課名
  score int,        --分數
  FOREIGN KEY(id) REFERENCES student(id) 
);
go
