--�{���}�l

create TRIGGER trig_seats 
ON    playlist
AFTER INSERT
AS
If(select COUNT(*) from inserted) > 0
BEGIN
  DECLARE   @v_ptime   varchar(20); 
  DECLARE   @v_movie   int;
  DECLARE   @v_roomid  varchar(10);

  --�ޥηs���ȱq inserted ��� ; �L�k�����H inserted.ptime�s��
   
  SELECT @v_ptime = ptime, @v_movie = movie, @v_roomid =roomid
  FROM   inserted;
      
  --�ھ� inserted��Ĳ�o���ͪ���,�I�s �@�~2-4 �� gen_seats stored procedure

  EXEC gen_seats @v_ptime, @v_movie, @v_roomid;

END;

--�{������