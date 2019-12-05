INSERT INTO dept VALUES (99, 'ddit', 'daejeon');
COMMIT;


--sub4
SELECT *
FROM dept
WHERE deptno NOT IN (SELECT deptno
                                            FROM emp);

-- sub5
SELECT *
FROM product
WHERE pid NOT IN (SELECT pid
                                    FROM cycle
                                    WHERE cid = 1);

--sub6
SELECT *
FROM cycle
WHERE pid IN (SELECT pid
                            FROM cycle
                            WHERE cid = 2)
AND cid = 1;


--sub7 : sub 6�� ������� ����, ��ǰ���� �߰�
SELECT *
FROM customer, product, cycle 
WHERE cycle.pid IN (SELECT pid
                            FROM cycle
                            WHERE cid = 2)
AND cycle.cid = 1
AND cycle.pid = product.pid
AND cycle.cid = customer.cid;


--�Ŵ����� �����ϴ� �������� ��ȸ
SELECT *
FROM emp e
WHERE EXISTS (SELECT 1
                                FROM emp m
                                WHERE m.empno = e.mgr);

--sub8
SELECT m.*, e.ename manager
FROM emp m, emp e
WHERE e.empno = m.mgr; --mgr�� ���� �� ���� NULL�̴�.

--sub9
SELECT *
FROM product
WHERE EXISTS (SELECT 'x'
                                FROM cycle
                                WHERE cycle.cid = 1
                                AND cycle.pid = product.pid);
 
 
 --sub10
SELECT *
FROM product
WHERE NOT EXISTS (SELECT 'x'
                                         FROM cycle
                                         WHERE cycle.cid = 1
                                          AND cycle.pid = product.pid);
                                
--���տ���
--UNION : ������ , �� ������ �ߺ����� �����Ѵ�.
--��� ������ SALESMAN�� ������ ������ȣ, ���� �̸� ��ȸ
--�� �Ʒ� ��� ���� ���� ������ ������ ������ �ϰ� �� ���
--�ߺ��Ǵ� �����ʹ� �ѹ��� ǥ���Ѵ�.
SELECT *
FROM emp
WHERE job = 'SALESMAN'

UNION

SELECT *
FROM emp
WHERE job = 'CLERK';


--UNION ALL
--������ ����� �ߺ� ���Ÿ� ���� �ʴ´�.
--�� �Ʒ� ��� ���� �ٿ��ֱ⸸ �Ѵ�.
SELECT *
FROM emp
WHERE job = 'SALESMAN'

UNION ALL

SELECT *
FROM emp
WHERE job = 'CLERK';

--���� ����� ���� ���� �÷��� �����ؾ� �Ѵ�.
--�÷��� ������ �ٸ� ��� ������ ���� �ִ� ������� ������ �����ش�.
SELECT empno, ename, ''
FROM emp
WHERE job = 'SALESMAN'

UNION ALL

SELECT empno, ename, job
FROM emp
WHERE job = 'CLERK';

-- INTERSECT : ������
--�� ���հ� �������� �����͸� ��ȸ
SELECT empno, ename, job
FROM emp
WHERE job IN ('SALESMAN' , 'CLERK')

INTERSECT

SELECT empno, ename, job
FROM emp
WHERE job IN ('SALESMAN');

--MINUS : ������
--������ : ��, �Ʒ�, ������ �������� �� ���տ��� ������ ������ ��ȸ
--�������� ��� ������, �����հ� �ٸ��� ������ ���� ������ ��� ���տ� ������ �ش�.
SELECT empno, ename, job
FROM emp
WHERE job IN ('SALESMAN' , 'CLERK')

MINUS

SELECT empno, ename, job
FROM emp
WHERE job IN ('SALESMAN');

--DML
--INSERT : ���̺� ���ο� �����͸� �Է�
DELETE dept
WHERE deptno = 99;
COMMIT;
SELECT *
FROM dept;

--INSERT �� �÷��� ������ ���
--������ �÷��� ���� �Է��� ���� ������ ������ ����Ѵ�.
--INSERT INTO ���̺�� (�÷�1, �÷�2...)
--                          VALUES (��1, ��2 ...)

--dept ���̺� 99�� �μ���ȣ, ddit ������, daejeon �������� ���� �����͸� �Է�
INSERT INTO dept (deptno, dname, loc)
                VALUES (99, 'ddit' , 'daejeon');
ROLLBACK;
SELECT *
FROM dept;
                
--�÷��� ����� ��� ���̺��� �÷� ���� ������ �ٸ��� �����ص� ����� ����.
--dept ���̺��� �÷� ���� : location, deptno, dname
--dept ���̺� 99�� �μ���ȣ, ddit ������, daejeon �������� ���� �����͸� �Է�
INSERT INTO dept (loc, deptno, dname )
                VALUES ('daejeon' , 99, 'ddit');

--�÷��� ������� �ʴ� ��� : ���̺��� �÷� ���� ������ ���� ���� ����Ѵ�.
INSERT INTO dept VALUES (99, 'ddit', 'daejeon');

--��¥ �� �Է��ϱ�
--1. SYSDATE
--2. ����ڷκ��� ���� ���ڿ��� DATEŸ������ �����Ͽ� �Է�
DESC emp;
INSERT INTO emp VALUES (9998, 'sally', 'SALESMAN', NULL, SYSDATE, 500, NULL, NULL);
--2019�� 12�� 2�� �Ի�
INSERT INTO emp VALUES (9997, 'james', 'CLERK', NULL, TO_DATE('20191202', 'YYYYMMDD'), 500, NULL, NULL);
SELECT *
FROM emp;

ROLLBACK;

--�������� �����͸� �ѹ��� �Է�
--SELECT ����� ���̺� �Է��� �� �ִ�.
INSERT INTO emp

SELECT 9998, 'sally', 'SALESMAN', NULL, SYSDATE, 500, NULL, NULL
FROM dual

UNION ALL

SELECT 9997, 'james', 'CLERK', NULL, TO_DATE('20191202', 'YYYYMMDD'), 500, NULL, NULL
FROM dual;



