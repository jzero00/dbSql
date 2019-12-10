INSERT INTO dept (deptno, dname, loc) VALUES (99, 'DDIT', 'daejeon');

SELECT *
FROM dept;

UPDATE dept
SET dname = '대덕IT', loc = '영민빌딩'
WHERE deptno = 99;

ROLLBACK;

--emp테이블에서 empno가 9999 ename이 'JAY' job은 NULL로 삽입
INSERT INTO emp (empno, ename, job) VALUES (9999, 'JAY' , NULL);

--emp테이블에서 empno가 9999번인 사원을 SMITH의 deptno와 job으로 업데이트 
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

--empno가 9999인 직원 삭제
DELETE emp
WHERE empno = 9999;

--dept_test 테이블을 만들어 deptno 를 PRIMARY KEY로 설정
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

--dept_test 테이블을 만들어 deptno 를 PRIMARY KEY로 설정
--dname을 UNIQUE로 설정
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
-- emp_test 테이블이 참조할 dept_test 테이블 생성
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