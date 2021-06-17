-- 08 [기업 프로젝트 데이터베이스] 제목 줄임..

-- (1) 테이블 생성, 데이터 저장
-- 초기화 설정
drop database if exists ch03;
create database ch03;
use ch03;

-- 테이블 생성
create table Employee
(
	empno int auto_increment primary key,
	name varchar(10),
	phoneno varchar(13),
	address varchar(20),
	sex varchar(20),
	position varchar(20),
	deptno int not null
);

create table Department
(
	deptno int primary key,
	deptname varchar(20),
	manager varchar(20)
);

create table Project
(
	projno int primary key,
	projname varchar(20),
	deptno int
);

create table Works
(
	empno int not null,
	projno int not null,
	hours_worked int
);

-- 외래키 설정
alter table Employee add constraint foreign key(deptno) references Department(deptno) on delete cascade on update cascade;
alter table Project add constraint foreign key(deptno) references Department(deptno) on delete cascade on update cascade;
alter table Works add constraint foreign key(empno) references Employee(empno) on delete cascade on update cascade;
alter table Works add constraint foreign key(projno) references Project(projno) on delete cascade on update cascade;

-- 데이터 저장
insert into Department values(1, '개발1팀', '재호');
insert into Department values(2, '개발2팀', '하윤');
insert into Department values(3, '서비스1팀', '진우');
insert into Department values(4, '서비스2팀', '하윤');

insert into Project values(1, 'Admin Page Project', 1);
insert into Project values(2, 'Client Page Project', 2);
insert into Project values(3, 'Ad TV', 3);
insert into Project values(4, 'Ad Web', 4);

insert into Employee values(null, '민준', '010-1234-1230', '서울', '남자', 'IT', 1);
insert into Employee values(null, '서준', '010-1234-1231', '부산', '남자', 'IT', 2);
insert into Employee values(null, '예준', '010-1234-1232', '울산', '여자', 'service', 3);
insert into Employee values(null, '도윤', '010-1234-1233', '김포', '남자', 'IT', 1);
insert into Employee values(null, '시우', '010-1234-1234', '서울', '여자', 'service', 4);
insert into Employee values(null, '주원', '010-1234-1235', '부산', '여자', 'IT', 2);
insert into Employee values(null, '하준', '010-1234-1236', '김포', '남자', 'service', 4);
insert into Employee values(null, '지호', '010-1234-1237', '울산', '여자', 'service', 3);
insert into Employee values(null, '지후', '010-1234-1238', '서울', '남자', 'IT', 1);
insert into Employee values(null, '준서', '010-1234-1239', '서울', '여자', 'IT', 2);

insert into Works values(1, 1, 10);
insert into Works values(2, 2, 2);
insert into Works values(3, 3, 40);
insert into Works values(4, 1, 20);
insert into Works values(5, 4, 11);
insert into Works values(6, 2, 5);
insert into Works values(7, 4, 9);
insert into Works values(8, 3, 4);
insert into Works values(9, 1, 4);
insert into Works values(10, 2, 12);

select * from department d ;
select * from employee e ;
select * from project p ;
select * from works w ;

-- (2) 모든 사원의 이름을 보이시오.
select name from employee;

-- (3) 여자 사원의 이름을 보이시오.
select name from employee where sex = '여자';

-- (4) 팀장(manager)의 이름을 보이시오.
select manager from department;

-- (5) 'IT' 부서에서 일하는 사원의 이름과 주소를 보이시오.
select name, address
from employee
where `position` = 'IT';

-- (6) '홍길동' 팀장(manager) 부서에서 일하는 사원의 수를보이시오.
select count(*)
from employee e, (select deptno
				  from department
				  where manager = '홍길동') dn
where e.deptno = dn.deptno;

-- (7) 사원들이 일한 시간 수를 부서별, 사원 이름별 오름차순으로 보이시오.
select d.deptname, e.name, w.hours_worked 
from works w, employee e , department d 
where w.empno = e.empno and e.deptno = d.deptno 
order by hours_worked;

-- (8) 두 명 이상의 사원이 참여한 프로젝트의 번호, 이름, 사원의 수를 보이시오.		
select re.projno '프로젝트 번호', re.projname '프로젝트 이름', re.count '사원 수'
from employee e join (
					select w.empno, w.projno, p.projname ,if(count(*) >= 2, 'y', 'n') 'check', count(*) count
					from works w join project p 
					on w.projno = p.projno 
					group by projno) re
on e.empno  = re.empno
where re.check = 'y';

-- (9) 세 명 이상의 사원이 있는 부서의 사원 이름을 보이시오.
select e1.name as '이름'
from employee e1, (
					select if(count(*) >= 3, deptno , null) 'check'
					from employee
					group by deptno) e2
where e1.deptno = e2.check;