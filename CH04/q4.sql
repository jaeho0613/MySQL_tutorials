-- (1) orders�� custid�� customer�� join�Ͽ� �ּҷ� �����Ͽ� �հ踦 ���
select custid, (select address from customer cs where cs.custid = od.custid) 'address', sum(saleprice) 'total' 
from orders od
group by od.custid;

-- (2) orders�� �ֹ� ������ �޾� �̸����� �����Ͽ� ��� �ֹ� price�� ���
select cs.name, s 
from (
	select custid, avg(saleprice) s
	from orders
	group by custid
	) od, customer cs
where cs.custid = od.custid;

-- (3) customer�� custid ���� 3���� ���� ���� orders�� custid�� ������ ��쿡 saleprice�� ��
select sum(saleprice) 'total' 
from orders od 
where exists (
			select *
			from customer cs 
			where custid <= 3 and cs.custid = od.custid 
);

-- ���� 3���� join���� �ؼ��� ���
select sum(saleprice) 'total' 
from orders o join customer c
on o.custid = c.custid
where o.custid <= 3;