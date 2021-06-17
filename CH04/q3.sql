set @RNUM = 0;

-- (1)
select *
from book;

-- (2)

select *, @RNUM := @RNUM + 1 as ROWNUM
from book, (select @RNUM := 0) R
where @RNUM <= 5;

-- (3)
select *, @RNUM := @RNUM + 1 as rownum
from book, (select @RNUM := 1) R
where @RNUM <= 5
order by price;

-- (4)
select *, @RNUM := @RNUM + 1 as rownum
from (select * from book order by price) b,
	 (select @RNUM := 0) R
where @RNUM < 5;

-- (5)
select *, @RNUM := @RNUM + 1 as rownum
from
(select * from book where @RNUM <= 5) b,
(select @RNUM := 0) R
order by price;

-- (6)
select *, @RNUM := @RNUM + 1 as rownum
from (select * from book where @RNUM <=5 order by price) b,
(select @RNUM := 0) r;