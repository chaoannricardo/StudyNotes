--�ഫ ���u commission_pct �ŭȪ��ର 0

SELECT last_name, salary, commission_pct,  ISNULL( commission_pct,  0 )
FROM   employees;

--�� ISNULL �P  IS NULL ���P�B

SELECT last_name, salary, commission_pct,  ISNULL( cast(commission_pct as varchar(20)),  'No' ) --�J��ŭȮ� �ର���w��
FROM   employees