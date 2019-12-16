-- GROUPUNG SETS (col1, col2)
-- ������ ����� ����
-- �����ڰ� GROUP BY�� ������ ���� ����Ѵ�.
-- ROLLUP���� �޸� ���⼺�� ���� �ʴ´�.
-- GROUPING SETS(col1, col2) = GROUPUNG SETS (col1, col2)

/*  GROUP BY col1
     UNION ALL
     GROUPBY col2*/
     
-- emp ���̺��� ������ job�� �޿�(sal) + ��(comm) ��
-- deptno (�μ�) �� �޿� (sal) + ��(comm) �� ���ϱ�
-- ���� ��� (GROUP FUNCTION) : 2���� SQL �ۼ� �ʿ� (UNION / UNION ALL)

SELECT job, NULL deptno, sum(sal+ NVL(comm, 0)) sal_comm_sum
FROM emp
GROUP BY job
UNION ALL
SELECT '', deptno, sum(sal+ NVL(comm, 0)) sal_comm_sum
FROM emp
GROUP BY deptno;

-- GROUPING SETS ������ ����Ͽ� ���� SQL�� ���� ������ ������� �ʰ�
-- ���̺��� �ѹ� �о ó��
SELECT job, deptno, SUM(sal + NVL(comm,0)) sal_comm_sum
FROM emp
GROUP BY GROUPING SETS (job, deptno);

-- job, deptno �� �׷����� �� sal+comm��
-- mgr�� �׷����� �� sal+comm ��
-- GROUP BY job, deptno
-- UNION ALL
-- GROUP BT mgr
-- �� GROUPING SETS ((job, deptno), mgr)

SELECT job, deptno, mgr, SUM(sal+ NVL (comm,0)) sal_comm_sum,
                GROUPING (job), GROUPING (deptno), GROUPING (mgr)
FROM emp
GROUP BY GROUPING SETS ((job, deptno) , mgr);

-- CUBE (col1, col2 ....)
-- ������ �÷��� ��� ������ �������� GROUP BT subset�� �����.
-- CUBE�� ������ �÷��� �ΰ��� ��� : ������ ���� 4��
-- CUBE�� ������ �÷��� ������ ��� : ������ ���� 8��
-- CUBE�� ������ �÷����� 2�� ������ �� ����� ������ ���� ������ �ȴ� (2^n)
-- �÷��� ���ݸ� �������� ������ ������ ���ϱ޼������� �þ�� ������ ���� ��������� �ʴ´�

-- job, deptno�� �̿��Ͽ� CUBE ����
SELECT job, deptno, SUM(sal + NVL (comm, 0)) sal_comm_sum
FROM emp
GROUP BY CUBE (job, deptno);
-- job, deptno
-- 1,   1           �� GROUP BY job, deptno
-- 1,   0           �� GROUP BY job
-- 0,   1           �� GROUP BY deptno
-- 0,   0           �� GROUP BY  --emp ���̺��� ��� �࿡ ���� GROUP BY

--GROUP BY ����
-- GROUP BY, ROLL UP, CUBE�� ���� ����ϱ�
-- ������ ������ �����غ��� ���� ����� ������ �� �ִ�.
-- GROUP BY job, rollup (deptno), cube(mre

SELECT job, deptno, mgr, SUM(sal + NVL( comm, 0)) sal_comm_sum
FROM emp
GROUP BY job, ROLLUP(deptno), CUBE (mgr);

SELECT job, job, SUM(sal)
FROM emp
GROUP BY job, ROLLUP(job, deptno), CUBE(mgr);

DROP TABLE dept_test;

-- sub_a1
CREATE TABLE dept_test AS
SELECT *
FROM dept;

ALTER TABLE dept_test ADD (empcnt NUMBER);

UPDATE dept_test SET  empcnt = (SELECT COUNT (*) empcnt
                                                        FROM emp
                                                        WHERE emp.deptno = dept_test.deptno
                                                        );
SELECT *
FROM dept_test;

-- sub_a2

DROP TABLE dept_test;

CREATE TABLE dept_test AS
SELECT *
FROM dept;

INSERT INTO dept_test VALUES (99, 'it1' , 'daejeon');
INSERT INTO dept_test VALUES (98, 'it2' , 'daejeon');

DELETE dept_test
WHERE deptno NOT IN (SELECT deptno
                               FROM emp);

-- sub_a3
DROP TABLE emp_test;

CREATE TABLE emp_test AS SELECT* FROM emp;

SELECT *
FROM emp_test;


UPDATE emp_test SET sal = sal + 200
WHERE  sal < (SELECT ROUND (AVG(sal) , 2) 
                            FROM emp
                            WHERE deptno = emp_test.deptno);

ROLLBACK;                

SELECT deptno, AVG(sal)
FROM emp_test
GROUP BY deptno;
-- MERGE ������ �̿��� ������Ʈ
MERGE INTO emp_test a
USING (SELECT deptno, AVG(sal) avg_sal
                FROM emp_test
                GROUP BY deptno) b
ON (a.deptno = b.deptno)
WHEN MATCHED THEN
        UPDATE SET a.sal = sal +200
        WHERE a.sal < b. avg_sal;
        
        
        
MERGE INTO emp_test a
USING (SELECT deptno, AVG(sal) avg_sal
                FROM emp_test
                GROUP BY deptno) b
ON (a.deptno = b.deptno)
WHEN MATCHED THEN
        UPDATE SET a.sal = CASE
                                            WHEN a.sal < b.avg_sal THEN sal +200
                                            ELSE sal
        END;
