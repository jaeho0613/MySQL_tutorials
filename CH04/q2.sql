-- (1)
select *
from mybook;

-- (2)
select bookid, ifnull(price, 0)
from mybook;

-- (3)
select *
from mybook 
where price is null;

-- (4)
select *
from mybook 
where price = ' ';

-- (5)
select bookid, price+100
from mybook;

-- (6)
select sum(price), avg(price), count(*)
from mybook
where bookid >= 4;

-- (7)
select count(*), count(price)
from mybook;

-- (8)
select sum(price), avg(price)
from mybook;