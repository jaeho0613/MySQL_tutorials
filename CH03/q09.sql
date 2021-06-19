SELECT * FROM DEPT D ; -- 부서
SELECT * FROM EMP E ; -- 사원

-- (1) 사원의 이름과 직위를 출력하시오. 단, 
-- 사원이 이름은 '사원이름', 직위는 '사원직위' 머리글이 나오도록 출력한다.
SELECT E.ENAME '사원이름', D.DNAME '사원직위'
FROM EMP E, DEPT D 
WHERE E.DEPTNO = D.DEPTNO;

-- (2) 30번 부서에 근무하는 모든 사원의 이름과 급여를 출력하시오.
SELECT E.ENAME '사원이름', E.SAL 
FROM EMP E, DEPT D 
WHERE E.DEPTNO = D.DEPTNO
AND D.DEPTNO = 30;

-- (3) 사원번호와 이름, 현재 급여, 증가된 급여분(열 이름은 '증가액'), 10% 인상된 급여(열 이름은 '인상된 급여')를 사원번호순으로 출력하시오.
SELECT ENAME , SAL , IFNULL(SAL+COMM, SAL) '증가액',  (SAL+(SAL * 0.1)) '인상된 급여'
FROM EMP
ORDER BY EMPNO ;

-- (4) 'S'로 시작하는 모든 사원과 부서번호를 출력하시오.
SELECT  ENAME , DEPTNO 
FROM EMP 
WHERE ENAME LIKE 'S%'

-- (5) 모든 사원의 최대 및 최소 급여, 합계 및 평균 급여를 출력하시오
-- 열 이름은 각각 MAX, MIN, SUM, AVG로 한다. 단, 소수점 이하는 반올림하여 정수로 출력한다.
SELECT MAX(SAL), MIN(SAL), SUM(SAL), ROUND(AVG(SAL))  
FROM EMP;

-- (6) 업무 이름과 업무별로 동일한 업무를 하는 사원의 수를 출력하시오.
-- 열 이름은 각각 '업무'와 '업무별 사원수'로 한다.
SELECT D.DNAME '업무', COUNT(*) '업무별 사원수' 
FROM EMP E, DEPT D 
WHERE E.DEPTNO = D.DEPTNO
GROUP BY D.DNAME; 

-- (7) 사원의 최대 급여와 최소 급여의 차액을 출력하시오.
SELECT (MAX(SAL) - MIN(SAL)) '차액' 
FROM EMP;

-- (8) 30번 부서의 구성원 수와 사원들 급여의 합계와 평균을 출력하시오.
SELECT COUNT(*) '구성원 수', SUM(SAL) '합계', ROUND(AVG(SAL)) '평균' 
FROM EMP
WHERE DEPTNO = 30
ORDER BY DEPTNO;

-- (9) 평균급여가 가장 높은 부서의 번호를 출력하시오.
SELECT DEPTNO DNO, ROUND(AVG(SAL)) AVGSAL
FROM EMP
GROUP BY DEPTNO
ORDER BY AVGSAL DESC 
LIMIT 1;

-- (10) 세일즈맨(SALESMAN)을 제외하고, 각 업무별 사원의 총 급여가 3,000 이상인 각 업무에 대해서,
-- 업무명과 각 업무별 평균급여를 출력하시오. 단 평균급여의 내림차순으로 출력한다.
SELECT E.JOB '업무명', ROUND(AVG(SAL)) 평균급여
FROM EMP E 
WHERE E.JOB != 'SALESMAN'
GROUP BY E.JOB 
HAVING SUM(E.SAL) >= 3000 
ORDER BY 평균급여 DESC;

-- (11) 전체 사원 가운데 직속상관이 있는 사원의 수를 출력하시오.
SELECT COUNT(*)
FROM EMP 
WHERE NOT MGR IS NULL;

-- (12) EMP 테이블에서 이름, 급여, 커미션(COMM) 금액, 총액(SAL + COMM)을 구하여 총액이 많은 순서대로 출력하시오.
-- 단, 커미션이 NULL인 사람은 제외한다.
SELECT ENAME '이름', SAL '금액', COMM '커미션', (SAL + COMM) 총액
FROM EMP E 
WHERE COMM IS NOT NULL
ORDER BY 총액 DESC;

-- (13) 각 부서별로 같은 업무를 하는 사람의 인원 수를 구하여 부서번호, 업무 이름, 인원 수를 출력하시오.
SELECT DEPTNO '부서번호', JOB '업무 이름', COUNT(*) '인원 수'
FROM EMP 
GROUP BY JOB

-- (14) 사원이 한 명도 없는 부서의 이름을 출력하시오.
SELECT D.DNAME 
FROM EMP E RIGHT JOIN DEPT D 
ON E.DEPTNO = D.DEPTNO 
WHERE E.EMPNO IS NULL;

-- (15) 같은 업무를 하는 사람의 수가 네 명 이상인 업무와 인원 수를 출력하시오.
SELECT JOB '업무' , COUNT(*) '인원 수'
FROM EMP
GROUP BY JOB 
HAVING COUNT(*) >= 4;

-- (16) 사원번호가 7400 이상 7600 이하인 사원의 이름을 출력하시오.
SELECT ENAME 
FROM EMP
WHERE EMPNO BETWEEN 7400 AND 7600;

-- (17) 사원의 이름과 사원의 부서를 출력하시오.
SELECT E.ENAME '이름', D.DNAME 
FROM EMP E, DEPT D 
WHERE E.DEPTNO = D.DEPTNO ;

-- (18) 사원의 이름과 팀장(MGR)의 이름을 출력하시오. ? 팀장 이름 테이블이 없다.

-- (19) 사원 SCOTT보다 급여를 많이 받는 사람의 이름을 출력하시오.
SELECT E.ENAME '이름'
FROM EMP E
WHERE E.SAL > (SELECT SAL 
FROM EMP E 
WHERE ENAME = 'SCOTT');