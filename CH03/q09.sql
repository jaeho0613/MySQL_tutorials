SELECT * FROM DEPT D ; -- �μ�
SELECT * FROM EMP E ; -- ���

-- (1) ����� �̸��� ������ ����Ͻÿ�. ��, 
-- ����� �̸��� '����̸�', ������ '�������' �Ӹ����� �������� ����Ѵ�.
SELECT E.ENAME '����̸�', D.DNAME '�������'
FROM EMP E, DEPT D 
WHERE E.DEPTNO = D.DEPTNO;

-- (2) 30�� �μ��� �ٹ��ϴ� ��� ����� �̸��� �޿��� ����Ͻÿ�.
SELECT E.ENAME '����̸�', E.SAL 
FROM EMP E, DEPT D 
WHERE E.DEPTNO = D.DEPTNO
AND D.DEPTNO = 30;

-- (3) �����ȣ�� �̸�, ���� �޿�, ������ �޿���(�� �̸��� '������'), 10% �λ�� �޿�(�� �̸��� '�λ�� �޿�')�� �����ȣ������ ����Ͻÿ�.
SELECT ENAME , SAL , IFNULL(SAL+COMM, SAL) '������',  (SAL+(SAL * 0.1)) '�λ�� �޿�'
FROM EMP
ORDER BY EMPNO ;

-- (4) 'S'�� �����ϴ� ��� ����� �μ���ȣ�� ����Ͻÿ�.
SELECT  ENAME , DEPTNO 
FROM EMP 
WHERE ENAME LIKE 'S%'

-- (5) ��� ����� �ִ� �� �ּ� �޿�, �հ� �� ��� �޿��� ����Ͻÿ�
-- �� �̸��� ���� MAX, MIN, SUM, AVG�� �Ѵ�. ��, �Ҽ��� ���ϴ� �ݿø��Ͽ� ������ ����Ѵ�.
SELECT MAX(SAL), MIN(SAL), SUM(SAL), ROUND(AVG(SAL))  
FROM EMP;

-- (6) ���� �̸��� �������� ������ ������ �ϴ� ����� ���� ����Ͻÿ�.
-- �� �̸��� ���� '����'�� '������ �����'�� �Ѵ�.
SELECT D.DNAME '����', COUNT(*) '������ �����' 
FROM EMP E, DEPT D 
WHERE E.DEPTNO = D.DEPTNO
GROUP BY D.DNAME; 

-- (7) ����� �ִ� �޿��� �ּ� �޿��� ������ ����Ͻÿ�.
SELECT (MAX(SAL) - MIN(SAL)) '����' 
FROM EMP;

-- (8) 30�� �μ��� ������ ���� ����� �޿��� �հ�� ����� ����Ͻÿ�.
SELECT COUNT(*) '������ ��', SUM(SAL) '�հ�', ROUND(AVG(SAL)) '���' 
FROM EMP
WHERE DEPTNO = 30
ORDER BY DEPTNO;

-- (9) ��ձ޿��� ���� ���� �μ��� ��ȣ�� ����Ͻÿ�.
SELECT DEPTNO DNO, ROUND(AVG(SAL)) AVGSAL
FROM EMP
GROUP BY DEPTNO
ORDER BY AVGSAL DESC 
LIMIT 1;

-- (10) �������(SALESMAN)�� �����ϰ�, �� ������ ����� �� �޿��� 3,000 �̻��� �� ������ ���ؼ�,
-- ������� �� ������ ��ձ޿��� ����Ͻÿ�. �� ��ձ޿��� ������������ ����Ѵ�.
SELECT E.JOB '������', ROUND(AVG(SAL)) ��ձ޿�
FROM EMP E 
WHERE E.JOB != 'SALESMAN'
GROUP BY E.JOB 
HAVING SUM(E.SAL) >= 3000 
ORDER BY ��ձ޿� DESC;

-- (11) ��ü ��� ��� ���ӻ���� �ִ� ����� ���� ����Ͻÿ�.
SELECT COUNT(*)
FROM EMP 
WHERE NOT MGR IS NULL;

-- (12) EMP ���̺��� �̸�, �޿�, Ŀ�̼�(COMM) �ݾ�, �Ѿ�(SAL + COMM)�� ���Ͽ� �Ѿ��� ���� ������� ����Ͻÿ�.
-- ��, Ŀ�̼��� NULL�� ����� �����Ѵ�.
SELECT ENAME '�̸�', SAL '�ݾ�', COMM 'Ŀ�̼�', (SAL + COMM) �Ѿ�
FROM EMP E 
WHERE COMM IS NOT NULL
ORDER BY �Ѿ� DESC;

-- (13) �� �μ����� ���� ������ �ϴ� ����� �ο� ���� ���Ͽ� �μ���ȣ, ���� �̸�, �ο� ���� ����Ͻÿ�.
SELECT DEPTNO '�μ���ȣ', JOB '���� �̸�', COUNT(*) '�ο� ��'
FROM EMP 
GROUP BY JOB

-- (14) ����� �� �� ���� �μ��� �̸��� ����Ͻÿ�.
SELECT D.DNAME 
FROM EMP E RIGHT JOIN DEPT D 
ON E.DEPTNO = D.DEPTNO 
WHERE E.EMPNO IS NULL;

-- (15) ���� ������ �ϴ� ����� ���� �� �� �̻��� ������ �ο� ���� ����Ͻÿ�.
SELECT JOB '����' , COUNT(*) '�ο� ��'
FROM EMP
GROUP BY JOB 
HAVING COUNT(*) >= 4;

-- (16) �����ȣ�� 7400 �̻� 7600 ������ ����� �̸��� ����Ͻÿ�.
SELECT ENAME 
FROM EMP
WHERE EMPNO BETWEEN 7400 AND 7600;

-- (17) ����� �̸��� ����� �μ��� ����Ͻÿ�.
SELECT E.ENAME '�̸�', D.DNAME 
FROM EMP E, DEPT D 
WHERE E.DEPTNO = D.DEPTNO ;

-- (18) ����� �̸��� ����(MGR)�� �̸��� ����Ͻÿ�. ? ���� �̸� ���̺��� ����.

-- (19) ��� SCOTT���� �޿��� ���� �޴� ����� �̸��� ����Ͻÿ�.
SELECT E.ENAME '�̸�'
FROM EMP E
WHERE E.SAL > (SELECT SAL 
FROM EMP E 
WHERE ENAME = 'SCOTT');