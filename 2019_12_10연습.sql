INSERT INTO dept (deptno, dname, loc) VALUES (99, 'DDIT', 'daejeon');

SELECT *
FROM dept;

UPDATE dept
SET dname = '���IT', loc = '���κ���'
WHERE deptno = 99;

ROLLBACK;

--emp���̺��� empno�� 9999 ename�� 'JAY' job�� NULL�� ����
INSERT INTO emp (empno, ename, job) VALUES (9999, 'JAY' , NULL);

--emp���̺��� empno�� 9999���� ����� SMITH�� deptno�� job���� ������Ʈ 
UPDATE emp
SET deptno = (SELECT deptno
                    FROM emp
                    WHERE ename = 'SMITH'),
         job = (SELECT job
                    FROM emp
                    WHERE ename = 'SMITH')
WHERE empno = 9999;


SELECT *
FROM emp;

--empno�� 9999�� ���� ����
DELETE emp
WHERE empno = 9999;

--dept_test ���̺��� ����� deptno �� PRIMARY KEY�� ����
CREATE TABLE dept_test (
    deptno NUMBER(2) PRIMARY KEY,
    dname VARCHAR2(14),
    loc VARCHAR2(13)
);

SELECT *
FROM dept_test;

DROP TABLE dept_test;

INSERT INTO dept_test VALUES (1, '' , 'daejeon');
INSERT INTO dept_test VALUES (1, NULL , 'daejeon');

--dept_test ���̺��� ����� deptno �� PRIMARY KEY�� ����
--dname�� UNIQUE�� ����
CREATE TABLE dept_test (
    deptno NUMBER(2) PRIMARY KEY,
    dname VARCHAR2(14) UNIQUE,
    loc VARCHAR2(13)
);

SELECT *
FROM dept_test;

INSERT INTO dept_test VALUES (1, 'DDIT', 'daejeon');
INSERT INTO dept_test VALUES (2, 'DDIT', 'daejeon');

DROP TABLE dept_test;
COMMIT;

--23p
-- emp_test ���̺��� ������ dept_test ���̺� ����
CREATE TABLE dept_test (
        deptno NUMBER (2,0) PRIMARY KEY,
        dname VARCHAR2(14),
        loc VARCHAR2 (13)
        );
SELECT *
FROM dept_test;

INSERT INTO dept_test VALUES (1, 'DDIT', 'daejeon');

--p24
CREATE TABLE emp_test (
        empno NUMBER (4,0) PRIMARY KEY,
        ename VARCHAR2(10),
        deptno NUMBER(2,0) REFERENCES dept_test (deptno)
        );