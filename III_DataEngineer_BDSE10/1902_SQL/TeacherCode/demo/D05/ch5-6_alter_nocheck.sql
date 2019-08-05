--Example 1 Add Constraint without checking existing data


CREATE TABLE Employee1 
(id     INT         NOT NULL,
 name   VARCHAR(10) NOT NULL,
 salary INT         NOT NULL   
);

--insert data without checking

INSERT INTO Employee1 VALUES (1,'Joe Brown' , 65000);
INSERT INTO Employee1 VALUES (3,'Pat Jones' ,105000);

--Add constraint and try another insert; this will fail.
--可 enable成功 不檢查既有錯誤資料,

ALTER TABLE Employee1 WITH NOCHECK ADD CONSTRAINT ck_salary1 CHECK (salary < 100000);

INSERT INTO Employee1 VALUES (2,'Mary Smith', 75000);
INSERT INTO Employee1 VALUES (4,'Eric James',110000) ;

select * from Employee1


--Example 2 DISABLE Constraint

CREATE TABLE Employee2 
(id     INT         NOT NULL,
 name   VARCHAR(10) NOT NULL,
 salary INT         NOT NULL   CONSTRAINT ck_salary2 CHECK (salary < 100000)
);

-- Valid inserts
INSERT INTO Employee2 VALUES (1,'Joe Brown' , 65000);
INSERT INTO Employee2 VALUES (2,'Mary Smith', 75000);

-- This insert violates the constraint.
INSERT INTO Employee2 VALUES (3,'Pat Jones',105000);

-- Disable the constraint and try again.
ALTER TABLE Employee2 NOCHECK CONSTRAINT ck_salary2;
INSERT INTO Employee2 VALUES (3,'Pat Jones',105000);

-- Re-enable the constraint and try another insert; this will fail.
--可 enable成功 不檢查既有錯誤資料,
ALTER TABLE Employee2 CHECK CONSTRAINT ck_salary2 ;
INSERT INTO Employee2 VALUES (4,'Eric James',110000) ;

select * from Employee2


