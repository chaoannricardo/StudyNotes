--轉換 員工 commission_pct 空值者轉為 0

SELECT last_name, salary, commission_pct,  ISNULL( commission_pct,  0 )
FROM   employees;

--註 ISNULL 與  IS NULL 不同處

SELECT last_name, salary, commission_pct,  ISNULL( cast(commission_pct as varchar(20)),  'No' ) --遇到空值時 轉為指定值
FROM   employees