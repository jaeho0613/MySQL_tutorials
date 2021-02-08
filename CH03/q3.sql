-- 03. 마당서점에서 다음의 심화된 질문에 대해 SQL 문을 작성하시오.
-- 1. 박지성이 구매한 도서의 출판사와 같은 출판사에서 도서를 구매한 고객의 이름
select distinct name
from customer join orders
on customer.custid = orders.custid
where bookid in (select bookid
from book
where customer.name not like "박지성" and
publisher in (
		select publisher
		from orders join book
		on orders.bookid = book.bookid
        where orders.custid = (
			select custid
            from customer
            where name like "박지성"
        )
));

-- 2. 두 개 이상의 서로 다른 출판사에서 도서를 구매한 고객의 이름
select name
from customer c1
where 2 >= (
	select count(distinct publisher)
	from orders join book on orders.bookid = book.bookid
				join customer on orders.custid = customer.custid
	where name like c1.name
	);

-- 3. 전체 고객의 30% 이상이 구매한 도서
 select bookname
 from book b1
 where (
	select count(book.bookid)
    from book join orders
    on book.bookid = orders.bookid
    where book.bookid = b1.bookid
 ) >= 0.3 * (select count(*) from customer);
