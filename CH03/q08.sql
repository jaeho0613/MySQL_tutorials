-- 08 [��� ������Ʈ �����ͺ��̽�] ���� ����..

-- (1) ���̺� ����, ������ ����
-- �ʱ�ȭ ����
drop database if exists ch03;
create database ch03;
use ch03;

-- ���̺� ����
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

-- �ܷ�Ű ����
alter table Employee add constraint foreign key(deptno) references Department(deptno) on delete cascade on update cascade;
alter table Project add constraint foreign key(deptno) references Department(deptno) on delete cascade on update cascade;
alter table Works add constraint foreign key(empno) references Employee(empno) on delete cascade on update cascade;
alter table Works add constraint foreign key(projno) references Project(projno) on delete cascade on update cascade;

-- ������ ����
insert into Department values(1, '����1��', '��ȣ');
insert into Department values(2, '����2��', '����');
insert into Department values(3, '����1��', '����');
insert into Department values(4, '����2��', '����');

insert into Project values(1, 'Admin Page Project', 1);
insert into Project values(2, 'Client Page Project', 2);
insert into Project values(3, 'Ad TV', 3);
insert into Project values(4, 'Ad Web', 4);

insert into Employee values(null, '����', '010-1234-1230', '����', '����', 'IT', 1);
insert into Employee values(null, '����', '010-1234-1231', '�λ�', '����', 'IT', 2);
insert into Employee values(null, '����', '010-1234-1232', '���', '����', 'service', 3);
insert into Employee values(null, '����', '010-1234-1233', '����', '����', 'IT', 1);
insert into Employee values(null, '�ÿ�', '010-1234-1234', '����', '����', 'service', 4);
insert into Employee values(null, '�ֿ�', '010-1234-1235', '�λ�', '����', 'IT', 2);
insert into Employee values(null, '����', '010-1234-1236', '����', '����', 'service', 4);
insert into Employee values(null, '��ȣ', '010-1234-1237', '���', '����', 'service', 3);
insert into Employee values(null, '����', '010-1234-1238', '����', '����', 'IT', 1);
insert into Employee values(null, '�ؼ�', '010-1234-1239', '����', '����', 'IT', 2);

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

-- (2) ��� ����� �̸��� ���̽ÿ�.
select name from employee;

-- (3) ���� ����� �̸��� ���̽ÿ�.
select name from employee where sex = '����';

-- (4) ����(manager)�� �̸��� ���̽ÿ�.
select manager from department;

-- (5) 'IT' �μ����� ���ϴ� ����� �̸��� �ּҸ� ���̽ÿ�.
select name, address
from employee
where `position` = 'IT';

-- (6) 'ȫ�浿' ����(manager) �μ����� ���ϴ� ����� �������̽ÿ�.
select count(*)
from employee e, (select deptno
				  from department
				  where manager = 'ȫ�浿') dn
where e.deptno = dn.deptno;

-- (7) ������� ���� �ð� ���� �μ���, ��� �̸��� ������������ ���̽ÿ�.
select d.deptname, e.name, w.hours_worked 
from works w, employee e , department d 
where w.empno = e.empno and e.deptno = d.deptno 
order by hours_worked;

-- (8) �� �� �̻��� ����� ������ ������Ʈ�� ��ȣ, �̸�, ����� ���� ���̽ÿ�.		
select re.projno '������Ʈ ��ȣ', re.projname '������Ʈ �̸�', re.count '��� ��'
from employee e join (
					select w.empno, w.projno, p.projname ,if(count(*) >= 2, 'y', 'n') 'check', count(*) count
					from works w join project p 
					on w.projno = p.projno 
					group by projno) re
on e.empno  = re.empno
where re.check = 'y';

-- (9) �� �� �̻��� ����� �ִ� �μ��� ��� �̸��� ���̽ÿ�.
select e1.name as '�̸�'
from employee e1, (
					select if(count(*) >= 3, deptno , null) 'check'
					from employee
					group by deptno) e2
where e1.deptno = e2.check;