--圖表事後建cust PK (右鍵 資料表名/設計/右鍵欄位 選 設定主索引鍵 或點 快捷列 金黃色鑰匙/ 點 儲存(功能選單 磁碟片圖示) )

create table cust2
(
  cno   int  NOT NULL,
  name char(10)
);

--圖表事後加 FK (右鍵 資料表名/設計/右鍵欄位 選 關聯性 或點 快捷列 關聯性 圖示 )
--點 加入 / 資料表及資料行規格 / 點 "..." 展開 /設定主表 及子表的欄位屬性
--設定 ON DELETE CASCADE: 點 INSERT 及 UPDATE 規格 / 刪除規則 / 下拉 選 "重疊顯示"
--左上功能表 : 全部儲存 (磁碟片 圖示)

create table ord2
(ordno  int  primary key,
 qty    int  check(qty >= 10),
 cno    int  
 )

--從資料庫圖表事後建cust PK / FK
--右鍵 從資料庫圖表 / 新增資料庫圖表 / Ctrl + Click 複選 多個資料表
--  **若出現AUTHORIAZATION .則依訊息說明,在資料庫/屬性 /檔案 / 指定擁有者 如 sa
--點 cust / (右鍵欄位 選 設定主索引鍵)

create table cust3
(
  cno   int  NOT NULL,
  name char(10)
);

--從資料庫圖表事後加 FK (拖拉 FK欄位 至 PK欄位, 或右鍵欄位 選 關聯性/ 儲存 )

create table ord3
(ordno  int  primary key,
 qty    int  check(qty >= 10),
 cno    int  
 )

--從從資料庫 建立表格
--自行從圖型介面練習

--測試資料 自行修改
 
 insert into cust2 values (101,'張三')
 insert into cust2 values (102,'李四')
 
 insert into ord2 values (1, 15, 101)
 insert into ord2 values (2, 12, 102)
 
 insert into ord2 values (3, 12, 109); --error
 
 select * from cust2
 select * from ord2
 
 
 