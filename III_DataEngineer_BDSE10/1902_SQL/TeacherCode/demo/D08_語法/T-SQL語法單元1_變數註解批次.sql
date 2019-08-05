
--------------------------------------------------------------------------------
--1 使用註解(Comment): 2種

--例1 單行註解

-- 一行註解用兩個 "-" (減號)

--例2 多行註解

/* 多行註解 , 使用 /* 開始 及  */  結束
   說明在此
*/

--------------------------------------------------------------------------------
/*
2 批次(Batch)執行, 數個SQL指令當做一個執行單元(Unit), 一起編譯成為執行計畫(Execution   Plan), 再加以執行; 
  - 以 GO 分隔不同批次執行
  - 下列指令只能單獨一個批次執行: CREATE VIEW, CREATE DEFAULT, CREATE RULE, CREATE PROCEDURE ..

  -批次錯誤時系統的處理方式
   1 編譯時錯誤: 不會有任何指令被執行
   2 執行中發生較大錯誤時 : 如找不到 指定資料表, 則立即中止執行及傳回錯誤訊息,
     之後的敘述不會被執行, 但之前已正確執行的敘述不會被取消
   3 執行中發生輕微錯誤 : 如新增或修改資料 違反條件約束, 則取消該錯誤敘述, 之後
     的敘述仍會繼續執行
*/

--例 1

INSERT INTO 表 VALUES (值1)
INSERT INTO 表 VALUES (值2)
SELECT * FROM 表
GO

--例 2 建議以 ";" 分號 區隔每個指令

INSERT INTO 表 VALUES (值1) ;
INSERT INTO 表 VALUES (值2) ;
SELECT * FROM 表 ;
GO

--------------------------------------------------------------------------------
/*
3 變數: 區域變數(Local Varaible) 以 @開頭, 儲存批次執行時的資料
        全域變數(Global Varaible) 以 @@開頭, 由系統提供用來儲存系統資訊;如 @@ERROR, @@ROWCOUNT
        -宣告以 DECLARE , 設定變數 以 SET 或 SELECT 

*/

--語法 DECLARE @local_variable [AS] datatype

--例1 宣告變數及 指定值

DECLARE @name varchar(40)     -- 區域變數以 @ 為開頭

SET @name = 'John'            -- 設定區域變數
SELECT @name                  -- 顯示區域變數的內容

SELECT @name = 'Mary'         -- 用 SELECT 也可拿來設定變數
SELECT @name                  -- 顯示區域變數的內容


SELECT @@CPU_BUSY             -- @@CPU_BUSY 為一全域變數 , 全域變數常是系統變數 
SELECT @@ERROR                -- @@ERROR 為一全域變數 , 全域變數常是系統變數 

--通常搭配 IF判斷

IF @@ERROR = 0
  SELECT CAST(@@error AS VARCHAR(10))+'ok'
ELSE
  SELECT  CAST(@@error AS VARCHAR(10))+'error'
  
--例2 DECLARE也可設定初始值

DECLARE @n int = 5;  --設定初始值

SELECT @n            --顯示

--------------------------------------------------------------------------------
/*
3-2 TABLE 型別的變數 : 用法與 暫存資料表(#或##開頭)類似, 皆可暫時存放一組資料表型式的資料集,
                       只能用於t-sql中用來定義區域變數 預存程序或自訂函數的參數或傳回值,
                       不能當做資料表的型別; 且直能宣告 Primary key, Unique key 及null三種
                       不可用於 SELECT INTO 的子句中
*/

--語法 DECLARE @local_variable  TABLE (表格定義)

--例

DECLARE @mytable  TABLE ( eno int, name varchar(20))

INSERT INTO @mytable SELECT employeeid, lastname from employees

SELECT * FROM @mytable

UPDATE @mytable SET name = 'John' where eno = 1
DELETE FROM @mytable WHERE eno = 1
SELECT * FROM @mytable

--不可使用於 SELECT INTO

SELECT employeeid, lastname
INTO   @mytable
FROM   employees

--亦不可
SELECT employeeid, lastname
INTO   #tmp1
FROM   @mytable

--比較不同處: 存成暫存表 於 系統資料庫 tempdb
SELECT employeeid, lastname
INTO   #mytable2
FROM   employees

--與: 存成永久資料表

SELECT employeeid, lastname
INTO   mytable2
FROM   employees

--------------------------------------------------------------------------------
--3-3 建立 使用者定義資料表類型

--語法 CREATE TYPE type_name AS TABLE (表格定義)

--例

CREATE TYPE t_table AS TABLE ( eno  int PRIMARY KEY,
                               name varchar(20))
GO

DECLARE @mytable t_table  --宣告為 自訂 table type

INSERT INTO @mytable SELECT employeeid, lastname from employees;

SELECT * FROM @mytable;


--------------------------------------------------------------------------------
--4 顯示 PRINT 或 SELECT
 
--語法
  PRINT msg_str | @local_variable | string_expr


--例1 

PRINT  '顯示於訊息視窗'
SELECT '顯示於結果視窗'

--------------------------------------------------------------------------------
