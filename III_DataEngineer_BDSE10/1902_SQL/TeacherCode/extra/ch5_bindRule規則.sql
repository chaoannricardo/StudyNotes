

-- 規則RULE: Define the rule for use in the database

CREATE RULE dbo.regioncode_rule AS @value IN ('IA','IL','KS','MO','NY','CA')
GO

--table

create table t4(id int, state varchar(2))

-- Bind the rule to a specific column in a table
EXEC sp_bindrule  regioncode_rule,	'dbo.t4.state'
GO

--test
insert into t4 values (101,'IL')     --OK
 
insert into t4 values (102,'WA')     --Error



--訊息 513，層級 16，狀態 0，行 1
--資料行插入或更新與先前 CREATE RULE 陳述式賦予的規則衝突。陳述式已結束。
--衝突發生在資料庫 'sample3'，資料--表 'dbo.t4'，資料行 'state'。陳述式已經結束。

--bindrule 與 CHECK比較 (前者須分兩段宣告, 後者一次宣告)


create table t5
( id    int, 
  state varchar(2)  check (state in ('IA','IL','KS','MO','NY','CA'))
)