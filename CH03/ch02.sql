-- 02. 마당서점의 운영자와 경영자가 요구하는 다음 질문에 대해 SQL 문을 작성하시오.
-- (1) 마당서점 도서의 총 개수
select count(*)
from book;

-- (2) 마당서점에 도서를 출고하는 출판사의 총 개수
select count(distinct publisher)
from book;

-- (3) 모든 고객의 이름, 주소
select name, address
from customer;

-- (4) 2014년 7월 4일~7월7일 사이에 주문받은 도서의 주문번호
select bookid
from orders
where orderdate between date_format("2014-07-04","%Y-%m-%d") and date_format("2014-07-07","%Y-%m-%d");

-- (5) 2014년 7월 4일~7월7일 사이에 주문받은 도서를 제외한 도서의 주문번호
select bookid
from orders
where orderdate not between date_format("2014-07-04","%Y-%m-%d") and date_format("2014-07-07","%Y-%m-%d");
            
-- (6) 성이 '김' 씨인 고객의 이름과 주소
select name, address
from customer
where name like '김%';

-- (7) 성이 '김' 씨이고 이름이 '아'로 끝나는 고객의 이름과 주소
select name, address
from customer
where name like '김%아';

-- (8) 주문하지 않은 고객의 이름(부속질의 사용)
select name
from customer
where not exists(
	select custid
    from orders
    where customer.custid = orders.custid    
);

-- (9) 주문 금액의 총액과 주문의 평균 금액
select sum(orders.saleprice) as "총액", round(avg(orders.saleprice)) as "평균 금액"
from orders;

-- (10) 고객의 이름과 고객별 구매액
select customer.name, sum(orders.saleprice)
from orders join customer
on orders.custid = customer.custid
group by orders.custid;

-- (11) 고객의 이름과 고객이 구매한 도서 목록
select customer.name, book.bookname
from orders left join customer on orders.custid = customer.custid
			left join book 	   on orders.bookid = book.bookid;

-- (12) 도서의 가격(Book 테이블)과 판매가격(Orders 테이블)의 차이가 가장 많은 주문
select *
from book join orders on book.bookid = orders.bookid
where price - saleprice like (
	select MAX(price - saleprice)
    from book join orders on book.bookid = orders.bookid
);

-- (13) 도서의 판매액 평균보다 자신의 구매액 평균이 더 높은 고객의 이름
select round(avg(saleprice))
from orders join customer
on orders.custid = customer.custid
group by orders.custid
having avg(saleprice) > (select avg(saleprice) from orders);