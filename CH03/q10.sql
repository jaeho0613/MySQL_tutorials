-- (1) 각 테이블에 대하여 기본키, 외래키를 표시하시오.
use ch03_10;

desc countries;
desc '테이블명';

-- (2) 테이블의 구조를 살펴보자
'살펴본다.'

-- (3) Employees와 Departments 테이블에 저장된 투플의 개수를 출력하시오.
select count(*)
from employees e;

select count(*)
from departments d ;

-- (4) Employees 테이블에 대한 employee_id, last_name, job_id, hire_date를 출력하시오.
select employee_id , last_name , job_id , hire_date 
from employees e ;

-- (5) Employees 테이블에서 salary가 12,000 이상인 직원의 last_name과 salary를 출력하시오.
select last_name , salary 
from employees e 
where salary >= 12000;

-- (6) 부서번호(department_id)가 20 혹은 50인 직원의 last_name과 
--     department_id를 last_name에 대하여 오름차순으로 출력하시오.
select last_name , department_id 
from employees 
where department_id in (20, 50);

-- (7) last_name의 세 번째에 a가 들어가는 직원의 last_name을 출력하시오.
select last_name 
from employees
where substr(last_name, 3,1) = 'a' ;

-- (8) 같은 일(job)을 하는 사람의 수를 세어 출력하시오
select job_id ,count(*) 
from employees e 
group by job_id ;

-- (9) 급여(salaary)의 최댓값과 최솟값의 차이를 구하시오.
select max(salary) - min(salary)
from employees e ;

-- (10) Toronto에서 일하는 직원의 last_name, job, department_id, department_name을 출력하시오.
select e.last_name , j.job_title , e.department_id , d.department_name 
from employees e , departments d ,locations l, jobs j 
where e.department_id = d.department_id 
and d.location_id = l.location_id 
and e.job_id = j.job_id 
and l.city = 'Toronto';

-- (11) Create a report to display the last name, job ID, and start date for the employess
-- whose last names are matos and talyorm order the query in ascending order by start date.
-- lastname, jobId, 