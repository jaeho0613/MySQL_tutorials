-- (1) 각 테이블에 대하여 기본키, 외래키를 표시하시오.
use ch03_10;

desc countries;
desc '데이터 베이스 이름';

-- (2) 테이블의 구조를 살펴보자.
-- 살펴보자

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

-- (6) 부서번호(department_id)가 20 혹은 50인 직원의 last_name과 department_id를 
-- last_name에 대하여 오름차순ㄴ으로 출력하시오.
select last_name , department_id 
from employees 
where department_id in (20, 50)
order by last_name;

-- (7) last_name의 세 번째에 a가 들어가는 직원의 last_name을 출력하시오.
select last_name 
from employees
where substr(last_name, 3,1) = 'a' ;

-- (8) 같은 일(job)을 하는 사람의 수를 세어 출력하시오.
select job_id ,count(*) 
from employees e 
group by job_id ;

-- (9) 급여(salary)의 최댓값과 최솟값을 차이를 구하시오.
select max(salary) - min(salary)
from employees e ;

-- (10) Toronto에서 일하는 직원의 last_name, job, department_id, department_name을 출력하시오.
select e.last_name , j.job_title , e.department_id , d.department_name 
from employees e , departments d ,locations l, jobs j 
where e.department_id = d.department_id 
and d.location_id = l.location_id 
and e.job_id = j.job_id 
and l.city = 'Toronto';

-- (11) CREATE A REPORT TO DISPLAY THE LAST NAME, JOB ID, AND START DATE FOR THE EMPLOYESS
-- WHOSE LAST NAMES ARE MATOS AND TALYORM ORDER THE QUERY IN ASCENDING ORDER BY START DATE.

-- 해석
-- LAST_NAME, JOB_ID, START_DATE를 표시하는 테이블을 생성하는데 
-- LAST_NAME이 MATOR 이거나 TALYOR인 데이터를 START DATE를 기준으로 오름차순 정렬후 보여준다.
 SELECT E.LAST_NAME, E.JOB_ID , JH.START_DATE 
 FROM EMPLOYEES E JOIN JOB_HISTORY JH 
 ON E.JOB_ID = JH.JOB_ID 
 WHERE LAST_NAME = 'MATOS' OR LAST_NAME ='TAYLOR'
 ORDER BY JH.START_DATE ASC;

-- (12) THE HR DEPARTMENT NEEDS A REPORT THAT DISPLAYS THE LAST NAME AND HIRE DATE FOR ALL 
-- EMPLOYEES WHO WERE HIRED IN 1994

-- 해석
-- LAST_NAME, HIRE DATE를 모두 보여주는 부서의 테이블이 필요한데 HIRED가 1994에 고용된 데이터를 보여줘라
SELECT  LAST_NAME , HIRE_DATE 
FROM EMPLOYEES
WHERE DATE_FORMAT(HIRE_DATE, '%Y') = '1994'

-- (13) DISPLAY THE LAST NAME, JOB, AND SALARY FOR ALL EMPLOYEES WHOSE JOB IS EITHER THAT
-- OF A SALES REPRESENTATIVE OR A STOCK CLERK, AND WHOSE SALARY IS NOT EQUAL TO $2,500, $3,500, OR $7,000.

-- 해석
-- LAST_NAME, JOB, SALARY를 보여주는 부서 테이블을 만들려고 한다.
-- 급여가 2500, 3500, 7000와 같지 않은 판매원(SALES REPRESENTATIVE)과 증권사(STOCK CLERK)직원을 보여줘라
SELECT E.LAST_NAME , J.JOB_TITLE , E.SALARY 
FROM EMPLOYEES E JOIN JOBS J 
ON E.JOB_ID = J.JOB_ID 
WHERE E.SALARY NOT IN(2500,3500,7000)
AND (J.JOB_TITLE LIKE 'SALES REPRESENTATIVE'
OR J.JOB_TITLE LIKE 'STOCK CLERK');

-- (14) DETERMINE THE NUMBER OF MANAGERS WITHOUT LISTING THEM. LABEL THE COLUMN NUMBER OF MANAGERS.

-- 해석 
-- 관리자 수를 나열하지 않고 보여줄려 한다. 컬럼 넘버와 매니저를 라벨로 보여줘라 (이 문제는 해석을 잘 못하겠네요.)

SELECT IFNULL(MANAGER_ID, 'NOT MANAGER') 'MANAGER NUMBER' ,COUNT(*) 'COUNT'
FROM EMPLOYEES 
GROUP BY MANAGER_ID;

-- (15) create a report to display the manager number and the salary of the lowestpaid employee for the manager.
-- exclude anyone whose manager is not known. exclude any groups where the minimum salary is $6,000 or less.
-- sort the output in descending order of salary.

-- 해석
-- 관리자 번호와 관리자에게 가장 낮은 급여를 지급한 직원의 급여를 표시하는 보고서를 작성합니다.
-- 관리자를 알 수 없는 사람은 제외합니다. 최저 급여가 $6,000 이하인 그룹은 제외합니다
-- 급여의 내림차순으로 분류한다.
select e.manager_id, e.salary 
from employees e 
where e.salary = (
				select min(salary)
				from employees e
				where e.salary > 6000
				)
and e.manager_id is not null
order by e.salary desc;

-- (16) Create a report to display the last name and employee number of employee along with their manager`s
-- last name and manager number. Label the columms Employee, Emp#, Manager, and Mgr#, respectively.

-- 해석 (풀지 못한다..?)
-- 보고서를 작성하여 직원의 성과 직원 번호와 관리자의 성과 관리자 번호를 표시합니다. 
-- 각각 직원, Emp#, Manager 및 Mgr# 열에 레이블을 표시합니다.

-- manager의 last_name과 manager number를 기입하라는데 manager의 last_name 데이터가 없다.

-- (17) Create a report for the HR department that displays employee last names, depart-ment numbers,
-- and all the employee who work in the same department as a given employee.