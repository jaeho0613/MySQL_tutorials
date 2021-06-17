-- (1) orders에 custid로 customer과 join하여 주소로 맵핑하여 합계를 출력
select custid, (select address from customer cs where cs.custid = od.custid) 'address', sum(saleprice) 'total' 
from orders od
group by od.custid;

-- (2) orders의 주문 정보를 받아 이름으로 맵핑하여 평균 주문 price를 출력
select cs.name, s 
from (
	select custid, avg(saleprice) s
	from orders
	group by custid
	) od, customer cs
where cs.custid = od.custid;

-- (3) customer의 custid 값이 3보다 작은 경우와 orders의 custid가 동일한 경우에 saleprice의 합
select sum(saleprice) 'total' 
from orders od 
where exists (
			select *
			from customer cs 
			where custid <= 3 and cs.custid = od.custid 
);

-- 위의 3번을 join으로 해석한 방법
select sum(saleprice) 'total' 
from orders o join customer c
on o.custid = c.custid
where o.custid <= 3;