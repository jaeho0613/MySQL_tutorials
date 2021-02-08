-- 04. 다음 질의에 대해 DDL 문과 DML 문을 작성하시오.
-- (1) 새로운 도서 ('스포츠 세계', '대한미디어', 10000원)이 마당서점에 입고되었다. 삽입이 안 될 경우 필요한 데이터가 더 있는지 찾아보시오.
-- 답 : 북 아이디가 필요하다.
insert into book(bookid, bookname, publisher, price) values('북 아이디가 필요하다.','스포츠 세계', '대한미디어', 10000);

-- (2) '삼성당'에서 출판한 도서를 삭제하시오. (safe 옵션 해제)
delete from book
where publisher = "삼성당";

-- (3) '이상미디어'에서 출판한 도서를 삭제하시오. 삭제가 안 되면 원인을 생각해보시오.
-- 답 : orders에 공유 된 키가 있기 때문에 지워지지 않는다. orders에 bookid가 7,8인 경우가 없어야 삭제 가능
delete from book
where publisher = "이상미디어";

-- (4) 출판사 '대한미디어'를 '대한출판사'로 이름을 바꾸시오.
update book
set publisher = '대한출판사'
where publisher = '대한미디어';

-- (5) (테이블 생성) 출판사에 대한 정보를 저장하는 테이블 Bookcompany(name, address, begin)을 생성하고자 한다.
-- name은 기본키며 VARCHAR(20), address는 VARCHAR(20), begin는 DATE 타입으로 선언하여 생성하시오.
create table Bookcompany(
	name varchar(20) primary key,
    address varchar(20),
    begin date
);

-- (6) (테이블 수정) Bookcompany 테이블에 인터넷 주소를 저장하는 webaddress 속성을 varchar(30)으로 추가하시오.
alter table bookcompany add webaddress varchar(30);

-- (7) Bookcompany 테이블에 임의의 투플 name = 한빛아카데미, address = 서울시 마포구, begin=1993-01-01, webaddress=http://hanbit.co.kr을 삽입하시오.
insert into bookcompany(name, address, begin, webaddress) values('한빛아카데미','서울시 마포구','1993-01-01','http://hanbit.co.kr');
