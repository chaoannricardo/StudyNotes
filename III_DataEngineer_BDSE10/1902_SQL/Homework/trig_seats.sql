--程式開始

create TRIGGER trig_seats 
ON    playlist
AFTER INSERT
AS
If(select COUNT(*) from inserted) > 0
BEGIN
  DECLARE   @v_ptime   varchar(20); 
  DECLARE   @v_movie   int;
  DECLARE   @v_roomid  varchar(10);

  --引用新的值從 inserted 表格 ; 無法直接以 inserted.ptime存取
   
  SELECT @v_ptime = ptime, @v_movie = movie, @v_roomid =roomid
  FROM   inserted;
      
  --根據 inserted表觸發產生的值,呼叫 作業2-4 之 gen_seats stored procedure

  EXEC gen_seats @v_ptime, @v_movie, @v_roomid;

END;

--程式結束