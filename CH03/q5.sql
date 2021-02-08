-- 05. 다음 EXISTS 질의의 결과를 보이시오.
-- (1) 질의의 결과는 무엇인가?
-- 답 : 책 구매를 하지 않은 고객
select *
from customer c1
where not exists(
	select *
    from orders c2
    where c1.custid = c2.custid
);

-- (2) not을 지우면 질의의 결과는 무엇인가?
-- 답 : 책을 구매한 고객
select *
from customer c1
where exists(
	select *
    from orders c2
    where c1.custid = c2.custid
);