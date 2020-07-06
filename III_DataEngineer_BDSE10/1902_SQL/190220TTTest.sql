create table member 
( mno int  primary key,
name char(20),
addr char(30)
)
--Q4
select count(name) 'Count'
from member
--Q5.1
select mno, pname
from prod 
where pname = 'CD-PRO2'
--Q5.2
select mno, pname
from prod 
where pname like '%�D���O%'
--Q5.3
select m.mno, m.name ,p.pname
from member m join prod p
on m.mno = p.mno
where p.pname = 'CD-PRO2'
--Q6
select  pclass, count(pclass) '���O�ƶq'
from prod
group by pclass
--Q7.1
select pno, mno, bdate, bprice
from bid 
where pno = 5
--Q7.2
select b.pno, m.name, b.bdate, b.bprice
from member m join bid b
on m.mno = b.mno
where b.pno = 5
--Q7.3
select p.pname, m.name, b.bdate, b.bprice
from member m join bid b
on m.mno = b.mno
join prod p
on m.mno = p.mno
where b.pno = 5
--8.1
insert into prod(pclass, pname, bprice, edate)
values('����', '�N�׬[', 200, '2015-09-20')
--8.2
delete from bid
where pno = 3
--8.3
update member
set addr = '�x�_�����s�_��100��'
where mno = 123 
--9
select pclass, pname
from prod 
where pclass = (
   select distinct pclass
   from prod
   where pname = 'IBM R51'
)

--�H�U�O����D�T�{�ϥ�
select mno
from member
where mno between 105 and 108

create table  kkk 
( pno int  primary key,
pclass char(10),
pname char(20),
bprice int,
edate date,
mno int
)

INSERT INTO kkk 
SELECT * FROM prod

select mno
from member
where mno is not null

SELECT distinct department_id
FROM employees
Where salary > ANY (SELECT AVG(salary)
FROM employees
GROUP BY department_id) 

select COUNT(HIRE_DATE) 
from employees

SELECT last_name, 12*salary*(isnull(commission_pct,0))
FROM EMPLOYEES

SELECT *
FROM  EMPLOYEES
WHERE HIRE_DATE BETWEEN '2000-01-01' and '2000-12-31'