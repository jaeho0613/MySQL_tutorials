-- (1) �� ���̺� ���Ͽ� �⺻Ű, �ܷ�Ű�� ǥ���Ͻÿ�.
use ch03_10;

desc countries;
desc '���̺��';

-- (2) ���̺��� ������ ���캸��
'���캻��.'

-- (3) Employees�� Departments ���̺� ����� ������ ������ ����Ͻÿ�.
select count(*)
from employees e;

select count(*)
from departments d ;

-- (4) Employees ���̺� ���� employee_id, last_name, job_id, hire_date�� ����Ͻÿ�.
select employee_id , last_name , job_id , hire_date 
from employees e ;

-- (5) Employees ���̺��� salary�� 12,000 �̻��� ������ last_name�� salary�� ����Ͻÿ�.
select last_name , salary 
from employees e 
where salary >= 12000;

-- (6) �μ���ȣ(department_id)�� 20 Ȥ�� 50�� ������ last_name�� 
--     department_id�� last_name�� ���Ͽ� ������������ ����Ͻÿ�.
select last_name , department_id 
from employees 
where department_id in (20, 50);

-- (7) last_name�� �� ��°�� a�� ���� ������ last_name�� ����Ͻÿ�.
select last_name 
from employees
where substr(last_name, 3,1) = 'a' ;

-- (8) ���� ��(job)�� �ϴ� ����� ���� ���� ����Ͻÿ�
select job_id ,count(*) 
from employees e 
group by job_id ;

-- (9) �޿�(salaary)�� �ִ񰪰� �ּڰ��� ���̸� ���Ͻÿ�.
select max(salary) - min(salary)
from employees e ;

-- (10) Toronto���� ���ϴ� ������ last_name, job, department_id, department_name�� ����Ͻÿ�.
select e.last_name , j.job_title , e.department_id , d.department_name 
from employees e , departments d ,locations l, jobs j 
where e.department_id = d.department_id 
and d.location_id = l.location_id 
and e.job_id = j.job_id 
and l.city = 'Toronto';

-- (11) Create a report to display the last name, job ID, and start date for the employess
-- whose last names are matos and talyorm order the query in ascending order by start date.
-- lastname, jobId, 