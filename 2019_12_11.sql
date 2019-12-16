--INDEX만 조회하여 사용자의 요구사항을 만족하는 데이터를 만들어 낼 수 있는 경우

SELECT rowid, emp.*
FROM emp;

--emp테이블의 모든 컬럼을 조회
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
   
--emp테이블의 empno 컬럼을 조회
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
   
   
--기존인덱스 제거
--pk_emp 제약조건 삭제 → unique 제약 삭제 → pk_emp 인덱스 삭제
ALTER TABLE emp DROP CONSTRAINT pk_emp;
   
--INDEX 종류 (컬럼 중복 여부)
--  UNIQUE INDEX : 인덱스 컬럼의 값이 중복될 수 없는 인덱스
--  (emp.empno,dept.deptno)
--  NON-UNIQUE INDEX (default)  : 인덱스 컬럼의 값이 중복될 수 있는 인덱스
--  (emp.job)

--CREATE UNIQUE INDEX idx_n_emp_01 ON emp (empno);  (유니크 인덱스 만드는 방법)

--위쪽 상황과 달라진 것은 EMPNO 컬럼으로 생성된 인덱스가
--UNIQUE → NON-UNIQUE 인덱스로 변경됨
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

--emp 테이블에 job 컬럼으로 non-unique 인덱스 생성
--인덱스명 : idx_n_emp_02
CREATE INDEX idx_n_emp_02 ON emp (job);

SELECT job, rowid
FROM emp
ORDER BY job;

--emp테이블에 인덱스가 2개 존재
-- 1. empno
-- 2. job


SELECT *
FROM emp
WHERE empno = 7369;

--IDX_02 인덱스
--emp 테이블에는 인덱스가 2개 존재
-- 1. empno
-- 2. job

SELECT *
FROM emp
WHERE job = 'MANAGER'
AND ename LIKE 'C%';

--idx_n_emp_03
--emp 테이블의 job, ename 컬럼으로 non-unique 인덱스 생성
CREATE INDEX idx_n_emp_03 ON emp (job, ename);

SELECT job, ename, rowid
FROM emp
ORDER BY job, ename;

-- idx_n_emp_04
-- ename, job 컬럼으로 emp테이블에 non-unique 인덱스 생성
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

--JOIN 쿼리에서의 인덱스
--emp 테이블은 empno 컬럼으로 PRIMARY KEY 제약조건이 존재
--dept 테이블은 deptno 컬럼으로 PRIMARY KRY 제약조건이 존재
--emp 테이블은 PRIMARY KEY 제약을 삭제한 상태이므로 재생성
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

--hr계정에 있는 데이터를 테이블 정보를 똑같이 해서 텍스트파일로 만들기
















