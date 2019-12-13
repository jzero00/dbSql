SELECT *
FROM emp_test
ORDER BY empno;

--emp ���̺� �����ϴ� �����͸� emp_test ���̺�� ����
--���� empno�� ������ �����Ͱ� �����ϸ� 
--ename update : ename || 'merge'
--���� empno�� ������ �����Ͱ� �������� ���� ���
--emp���̺��� empno, ename, emp_test �����ͷ� insert
--emp_test �����Ϳ��� ������ �����͸� ����

DELETE emp_test
WHERE empno >= 7788;
COMMIT;

--emp���̺��� 14���� �����Ͱ� ����
--emp_test ���̺��� ����� 7788���� ���� 7���� �����Ͱ� ����
--emp ���̺��� �̿��� emp_test ���̺��� �����ϰ� �Ǹ�
--emp ���̺��� �����ϴ� ���� (����� 7788���� ũ�ų� ����) 7��
--emp_test�� ���Ӱ� insert�� �� ���̰�
--emp, emp_test�� ���ʹ�ȣ�� �����ϰ� �����ϴ� 7���� �����ʹ�
--(����� 7788���� ���� ����) ename �÷��� ename || '_modify' �� ������Ʈ�Ѵ�.

/*
MERGE INTO ���̺��
USING ������� ���̺� ot �� or ��������
ON (���̺��� ���� ����� �������)
WHEN MATCHES THEN
        UPDATE .........
WHEN NOT MATCHES THEN
        INSERT ...........
*/

MERGE INTO emp_test
USING emp
ON (emp.empno = emp_test.empno)
WHEN MATCHED THEN
        UPDATE SET ename = ename || '_mod'
WHEN NOT MATCHED THEN
        INSERT VALUES (emp.empno, emp.ename);
        
SELECT *
FROM emp_test;

-- emp_test ���̺� ����� 9999�� �����Ͱ� �����ϸ�
-- ename�� 'brown'���� update
-- �������� ���� ��� empno, ename VALUES (9999, 'brwon') ���� insert
-- ���� �ó������� MERGE ������ Ȱ���Ͽ� �ѹ��� ��SQL�� ����

-- :empno - 9999, :ename = 'brown'
MERGE INTO emp_test
USING dual
ON (emp_test.empno = :empno)
WHEN MATCHED THEN
        UPDATE SET ename = :ename || '_mod'
WHEN NOT MATCHED THEN
        INSERT VALUES (:empno, :ename);
        
SELECT *
FROM emp_test
WHERE empno = 9999;
        
--���� merge ������ ���ٸ�
--1. empno = 9999�� �����Ͱ� �����ϴ��� Ȯ��
-- 2-1. 1.�� ���׿��� �����Ͱ� �����ϸ� UPDATE
-- 2-2. 1�� ���׿��� �����ʹ� �������� ������ INSERT


--GROUP_AD1
--�μ��� �޿� �հ� ��ü ���� �����̺�� ��Ÿ����
SELECT deptno, SUM(sal) sal
FROM emp
GROUP BY deptno
UNION ALL
SELECT NULL, SUM(sal) sal
FROM emp;

--JOIN �������
--emp ���̺��� 14���� �����͸� 28������ ����
--������(1 - 14, 2 - 14)�� �������� group by
--�����ڸ� rownum���� ���
--������ 1 : �μ���ȣ �������� 14 row
--������ 2 : ��ü row�� ����
SELECT DECODE(b.rn , 1, emp.deptno, 2 , null) deptno,
               SUM(emp.sal)
FROM emp, (SELECT ROWNUM rn
                    FROM dept
                    WHERE ROWNUM <=2 ) b
GROUP BY DECODE(b.rn , 1, emp.deptno, 2 , null);

--REPORT GROUP BY
--ROLLUP
--GROUP BY ROLLUP(col1, col2......)
--ROLLUP ���� ����� �÷��� �����ʿ��� ���� ���� �����
--SUB GROUP�� �����Ͽ� �������� GROUP BY ���� �ϳ��� SQL���� ����ǵ����Ѵ�.

GROUP BY ROLLUP (job, deptno)
--GROUP BY job, deptno
--GROUP BY job
--GROUP BY �� ��ü ���� ������� GROUP BY

--emp���̺��� �̿��Ͽ� �μ���ȣ��, ��ü ������ �޿����� ���ϴ� ������
--ROLLUP ����� �̿��Ͽ� �ۼ�
SELECT deptno, SUM(sal) sal
FROM emp
GROUP BY ROLLUP(deptno);

--EMP ���̺��� �̿��Ͽ� job, deptno �� �޿� + comm �հ�
--                                        job �� sal + comm �հ�
--                                       ��ü ������ sal + comm �հ�
--ROLLUP�� Ȱ���Ͽ� �ۼ�
SELECT job, deptno, SUM(sal + NVL(comm , 0)) sal_sum
FROM emp
GROUP BY ROLLUP (job, deptno);

--ROLLUP�� �÷� ������ ��ȸ����� ������ ��ģ��.
GROUP BY ROLLUP (job, deptno);
--GROUP BY job, deptno
--GROUP BY job
--GROUP BY �� ��ü ROW ���

GROUP BY ROLLUP (deptno, job);
--GROUP BY deptno, job
--GROUP BY deptno
--GROUP BY �� ��ü ROW ���


--GROUP_AD2
SELECT  DECODE (GROUPING (job), 1, '�Ѱ�', job) job,
                deptno,
                SUM(sal + NVL(comm , 0)) sal_sum
FROM emp
GROUP BY ROLLUP (job, deptno);


--GROUP_AD2-1
SELECT  DECODE (GROUPING (job), 1, '��', job) job,
                DECODE (GROUPING (deptno), 1 , DECODE (GROUPING (job), 1, '��', '�Ұ�'), deptno) deptno,
                SUM(sal + NVL(comm , 0)) sal_sum
FROM emp
GROUP BY ROLLUP (job, deptno);

--GROUP_AD3
SELECT deptno, job, SUM(sal + NVL(comm , 0)) sal
FROM emp
GROUP BY ROLLUP (deptno, job);

--UNION ALL�� ġȯ
SELECT deptno, job, SUM(sal + NVL(comm , 0)) sal
FROM emp
GROUP BY  (deptno, job)
UNION ALL
SELECT deptno, NULL, SUM(sal + NVL(comm , 0)) sal
FROM emp
GROUP BY  (deptno)
UNION ALL
SELECT NULL, NULL, SUM(sal + NVL(comm , 0)) sal
FROM emp;

--GROUP_AD4
SELECT dname, job, SUM(sal + NVL(comm,0)) sal
FROM emp, dept
WHERE emp.deptno = dept.deptno
GROUP BY ROLLUP (dname,job);

--GROUP_AD5
SELECT DECODE(GROUPING(dname) ,1 , '����' ,0, dname)dname,
                job, SUM(sal + NVL(comm,0)) sal
FROM emp, dept
WHERE emp.deptno = dept.deptno
GROUP BY ROLLUP (dname,job);

