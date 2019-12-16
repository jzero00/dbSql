--INDEX�� ��ȸ�Ͽ� ������� �䱸������ �����ϴ� �����͸� ����� �� �� �ִ� ���

SELECT rowid, emp.*
FROM emp;

--emp���̺��� ��� �÷��� ��ȸ
EXPLAIN PLAN FOR
SELECT *
FROM emp
WHERE empno = 7782;

SELECT *
FROM TABLE (dbms_xplan.display);

Plan hash value: 2949544139
 
--------------------------------------------------------------------------------------
| Id  | Operation                                            | Name       | Rows   | Bytes  | Cost (%CPU)| Time     |
--------------------------------------------------------------------------------------
|   0 | SELECT STATEMENT                       |                  |     1       |    38    |     1   (0)        | 00:00:01 |
|   1 |  TABLE ACCESS BY INDEX ROWID| EMP         |     1       |    38    |     1   (0)        | 00:00:01 |
|*  2 |   INDEX UNIQUE SCAN                     | PK_EMP  |     1       |            |     0   (0)         | 00:00:01 |
--------------------------------------------------------------------------------------
 
Predicate Information (identified by operation id):
---------------------------------------------------
 
   2 - access("EMPNO"=7782)
   
--emp���̺��� empno �÷��� ��ȸ
EXPLAIN PLAN FOR
SELECT empno
FROM emp
WHERE empno = 7782;

SELECT *
FROM TABLE (dbms_xplan.display);
   
Plan hash value: 56244932
 
----------------------------------------------------------------------------
| Id  | Operation         | Name   | Rows  | Bytes | Cost (%CPU)| Time     |
----------------------------------------------------------------------------
|   0   | SELECT STATEMENT    |                   |     1 |     4 |     0   (0)| 00:00:01 |
|*  1  |  INDEX UNIQUE SCAN   | PK_EMP    |     1 |     4 |     0   (0)| 00:00:01 |
----------------------------------------------------------------------------
 
Predicate Information (identified by operation id):
---------------------------------------------------
 
   1 - access("EMPNO"=7782)
   
   
--�����ε��� ����
--pk_emp �������� ���� �� unique ���� ���� �� pk_emp �ε��� ����
ALTER TABLE emp DROP CONSTRAINT pk_emp;
   
--INDEX ���� (�÷� �ߺ� ����)
--  UNIQUE INDEX : �ε��� �÷��� ���� �ߺ��� �� ���� �ε���
--  (emp.empno,dept.deptno)
--  NON-UNIQUE INDEX (default)  : �ε��� �÷��� ���� �ߺ��� �� �ִ� �ε���
--  (emp.job)

--CREATE UNIQUE INDEX idx_n_emp_01 ON emp (empno);  (����ũ �ε��� ����� ���)

--���� ��Ȳ�� �޶��� ���� EMPNO �÷����� ������ �ε�����
--UNIQUE �� NON-UNIQUE �ε����� �����
CREATE INDEX idx_n_emp_01 ON emp (empno);
   
SELECT *
FROM emp
WHERE empno = 7782;

EXPLAIN PLAN FOR
SELECT *
FROM emp
WHERE empno = 7782;

SELECT *
FROM TABLE (dbms_xplan.display);
   
--7782
DELETE emp WHERE empno = 9999;
INSERT INTO emp (empno, ename) VALUES (7782, 'brown');
COMMIT;

--emp ���̺� job �÷����� non-unique �ε��� ����
--�ε����� : idx_n_emp_02
CREATE INDEX idx_n_emp_02 ON emp (job);

SELECT job, rowid
FROM emp
ORDER BY job;

--emp���̺� �ε����� 2�� ����
-- 1. empno
-- 2. job


SELECT *
FROM emp
WHERE empno = 7369;

--IDX_02 �ε���
--emp ���̺��� �ε����� 2�� ����
-- 1. empno
-- 2. job

SELECT *
FROM emp
WHERE job = 'MANAGER'
AND ename LIKE 'C%';

--idx_n_emp_03
--emp ���̺��� job, ename �÷����� non-unique �ε��� ����
CREATE INDEX idx_n_emp_03 ON emp (job, ename);

SELECT job, ename, rowid
FROM emp
ORDER BY job, ename;

-- idx_n_emp_04
-- ename, job �÷����� emp���̺� non-unique �ε��� ����
CREATE INDEX idx_n_emp_04 ON emp (ename, job);

SELECT ename, job, rowid
FROM emp
ORDER BY ename, job;

EXPLAIN PLAN FOR
SELECT *
FROM emp
WHERE job = 'MANAGER'
AND ename LIKE 'J%';

SELECT *
FROM TABLE (dbms_xplan.display);

--JOIN ���������� �ε���
--emp ���̺��� empno �÷����� PRIMARY KEY ���������� ����
--dept ���̺��� deptno �÷����� PRIMARY KRY ���������� ����
--emp ���̺��� PRIMARY KEY ������ ������ �����̹Ƿ� �����
DELETE emp
WHERE ename = 'brown';
COMMIT;

SELECT *
FROM emp
WHERE ename = 'brown';

ALTER TABLE emp ADD CONSTRAINT pk_emp PRIMARY KEY(empno);

EXPLAIN PLAN FOR
SELECT ename, dname, loc
FROM emp, dept
WHERE emp.deptno = dept.deptno;

SELECT *
FROM TABLE(dbms_xplan.display);

DELETE TABLE dept_test;

CREATE TABLE dept_test1 AS
SELECT *
FROM dept
WHERE 1 = 1;

--idx 1
CREATE UNIQUE INDEX idx_u_dept_test1 ON dept_test1 (deptno);
CREATE INDEX idx_n_dept_test2 ON dept_test1 (dname);
CREATE INDEX idx_n_dept_test3 ON dept_test1 (deptno, dname);

--idx2
DROP INDEX idx_u_dept_test1;
DROP INDEX idx_n_dept_test2;
DROP INDEX idx_n_dept_test3;

DROP TABLE dept_test;

--hr������ �ִ� �����͸� ���̺� ������ �Ȱ��� �ؼ� �ؽ�Ʈ���Ϸ� �����
















