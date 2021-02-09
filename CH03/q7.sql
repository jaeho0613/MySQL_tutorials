-- (1) 테이블을 생성하는 CREATE 문과 데이터를 삽입하는 Insert 문을 작성하시오.
-- 테이블의 데이터 타입은 임의로 정하고, 데이터는 아래 질의의 결과가 나오도록 삽입한다.
create database 판매원;
use 판매원;

-- 테이블 생성 : 판매원
create table Salesperson(
	name varchar(20) primary key,
    age integer,
    salary integer
);

-- 테이블 생성 : 고객
create table customer (
	name varchar(20) primary key,
    city varchar(20),
    industrytype varchar(20)
);

-- 테이블 생성 : 주문
create table orders (
	number integer,
    custname varchar(20),
    saesperson varchar(20),
    amount integer,
    foreign key (custname) references customer(name),
    foreign key (saesperson) references Salesperson(name)
);

-- 데이터 삽입 : 판매원
insert into salesperson(name, age, salary) values('Tom', '26', 10000);
insert into salesperson(name, age, salary) values('Roy', '32', 15000);
insert into salesperson(name, age, salary) values('Sally', '24', 9000);
insert into salesperson(name, age, salary) values('Nancy', '29', 7000);
insert into salesperson(name, age, salary) values('Clara', '40', 8500);

-- 데이터 삽입 : 고객
insert into customer(name, city, industrytype) values('Mary', 'LA', '개발자');
insert into customer(name, city, industrytype) values('Carrie', 'LA', '요리사');
insert into customer(name, city, industrytype) values('IU', 'KR', '가수');
insert into customer(name, city, industrytype) values('Diane', 'LA', '개발자');
insert into customer(name, city, industrytype) values('Grace', 'DE', '요리사');
insert into customer(name, city, industrytype) values('Nancy', 'MX', '교육자');
insert into customer(name, city, industrytype) values('Frank', 'US', '교육자');

-- 데이터 삽입 : 주문
insert into orders(number, custname, saesperson, amount) values('1', 'Mary','Tom', '1000');
insert into orders(number, custname, saesperson, amount) values('2', 'IU','Sally', '2000');
insert into orders(number, custname, saesperson, amount) values('3', 'Diane','Nancy', '3000');
insert into orders(number, custname, saesperson, amount) values('4', 'Grace','Roy', '4000');
insert into orders(number, custname, saesperson, amount) values('5', 'Nancy','Tom', '5000');
insert into orders(number, custname, saesperson, amount) values('6', 'Diane','Sally', '6000');
insert into orders(number, custname, saesperson, amount) values('7', 'Grace','Roy', '7000');
insert into orders(number, custname, saesperson, amount) values('8', 'Nancy','Nancy', '8000');

-- (2) 모든 판매원의 이름과 급여를 보이시오. 단, 중복 행은 제거한다.
select name, salary
from salesperson;

-- (3) 나이가 30세 미만인 판매원의 이름을 보이시오.
select name
from salesperson
where age < 30;

-- (4) 'S'로 끝나는 도시에 사는 고객의 이름을 보이시오.
select name
from customer
where city like "%S";

-- (5) 주문을 한 고객의 수(서로 다른 고객만)를 구하시오.
select count(distinct custname)
from orders;

-- (6) 판매원 각각에 대하여 주문의 수를 계산하시오.
select count(salesperson)
from orders
group by salesperson;

-- (7) 'LA'에 사는 고객으로부터 주문을 받은 판매원의 이름과 나이를 보이시오.(부속질의를 사용)
select name, age
from salesperson
where name in (
	select salesperson
	from orders
	where custname in (
		select name
		from customer
		where city like 'LA')
);

-- (8) 'LA'에 사는 고객으로부터 주문을 받은 판매원의 이름과 나이를 보이시오. (조인 사용)
select salesperson.name, salesperson.age
from orders join customer on orders.custname = customer.name
			join salesperson on orders.salesperson = salesperson.name
where customer.city = 'LA';

-- (9) 두 번 이상 주문을 받은 판매원의 이름을 보이시오.
select name
from salesperson s1
where 2 <= (
	select count(salesperson)
    from orders
    where orders.salesperson = s1.name
);

-- (10) 판매원 'TOM'의 봉급을 45,000원으로 변경하는 SQL 문을 작성하시오.
update salesperson
set salary = 45000
where name = 'TOM';