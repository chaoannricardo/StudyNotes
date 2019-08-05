SELECT   last_name,              
         ISNULL(CAST (commission_pct as varchar(20)), 'No Commission') COMM      
FROM     employees