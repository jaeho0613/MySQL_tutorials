-- 1. 마당서점의 고객이 요구하는 다음 질문에 대해 SQL 문을 작성하시오.
-- (1) 도서번호가 1인 도서의 이름
select bookname
from book
where bookid = 1;

-- (2) 가격이 20,00원 이상인 도서의 이름
select bookname
from book
where price >= 20000;

-- (3) 박지성의 총 구매액
select sum(saleprice)
from orders
where custid = (select custid
from customer
where name = "박지성");

-- (4) 박지성이 구매한 도서의 수
select count(*)
from orders
where custid = 1;

-- (5) 박지성이 구매한 도서의 출판사 수
select count(distinct publisher) as "출판사 수"
from book
where bookid in (select bookid
from orders
where custid = (select custid
from customer
where name = "박지성"));

-- (6) 박지성이 구매한 도서의 이름, 가격, 정가와 판매가격의 차이
select bookname as 책이름, price as 가격, price - saleprice as "정가 차이"
from orders join book
on orders.bookid = book.bookid
where custid = (select custid
from customer
where name = "박지성");

-- (7) 박지성이 구매하지 않은 도서의 이름
select *
from book
where not exists(
	select bookname
    from orders
    where orders.bookid = book.bookid and orders.custid = 
		(select custid
	     from customer
	     where name = "박지성")
);