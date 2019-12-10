--제약조건 활성화 / 비활성화
--ALTER TABLE 테이블명 ENABLE OR DISABLE CONSTRAINT 제약조건명;

--USER_CINSTRAINTS view를 통해 dept_test 테이블에 설정된
--제약조건 확인
SELECT *
FROM USER_CONSTRAINTS
WHERE TABLE_NAME = 'DEPT_TEST';

ALTER TABLE dept_test DISABLE CONSTRAINT SYS_C007221;

SELECT *
FROM dept_test;

--dept_test 테이블의 depno 컬럼에 적용된 PRIMARY KEY 제약 조건을 비활성화하여
--동일한 부서번호를 갖는 데이터를 입력할 수 있다.
INSERT INTO dept_test VALUES (99, 'ddit' , 'daejeon');
INSERT INTO dept_test VALUES (99,'DDIT', '대전');

--dept_test 테이블의 PRIMARY KEY 제약조건 활성화
--이미 위에서 실행한 두개의 INSERT 구문에 의해 같은 부서번호를 갖는 데이터가
--존재하기 때문에 PRIMARY KEY 제약조건을 활성화 할 수 없다.
--활성화 하려면 중복데이터를 삭제해야 한다.
ALTER TABLE dept_test ENABLE CONSTRAINT SYS_C007221;

--부서번호가 중복되는 데이터만 조회하여
--해당 데이터에 대해 수정후 PRIMARY KEY 제약조건을 활성화 할 수 있다.
SELECT deptno, COUNT(*)
FROM dept_test
GROUP BY deptno
HAVING COUNT(*) >= 2 ;


--table_name, constraint_name, column_name
--position 정렬 (ASC)
SELECT *
FROM user_constraints
WHERE table_name = 'BUYER';

SELECT *
FROM user_cons_columns
WHERE table_name = 'BUYER';

--테이블에 대한 설명 (주석) VIEW
SELECT*
FROM USER_TAB_COMMENTS;

--테이블 주석
--COMMENT ON TABLE 테이블명 IS '주석';
COMMENT ON TABLE dept IS '부서';

--컬럼 주석
--COMMENT ON COLUMN 테이블명.컬럼명 IS '주석'
COMMENT ON COLUMN dept.deptno IS '부서번호';
COMMENT ON COLUMN dept.dname IS '부서명';
COMMENT ON COLUMN dept.loc IS '부서위치 지역';

SELECT *
FROM USER_COL_COMMENTS
WHERE TABLE_NAME = 'DEPT';

--COMMENT1
SELECT   USER_TAB_COMMENTS.TABLE_NAME, USER_TAB_COMMENTS.TABLE_TYPE,
                    USER_TAB_COMMENTS.COMMENTS,USER_COL_COMMENTS.COLUMN_NAME,USER_COL_COMMENTS.COMMENTS
FROM USER_COL_COMMENTS, USER_TAB_COMMENTS 
WHERE user_tab_comments.table_name = USER_COL_COMMENTS.TABLE_NAME
AND user_tab_comments.table_name IN ('CUSTOMER' , 'CYCLE', 'DAILY', 'PRODUCT')
ORDER BY USER_TAB_COMMENTS.COMMENTS;


SELECT *
FROM USER_TAB_COMMENTS;

--VIEW  : QUERY이다   (O)
--테이블처럼 데이터가 물리적으로 존재하는 것이 아니다.
--논리적 데이터 셋 = QUERY
--VIEW는 테이블이다   (X)

--VIEW 생성
--CREATE OR REPLACE VIEW 뷰이름 [{컬럼별칭1), {컬럼별칭2) ... )] AS
--SUBQUERY

--emp테이블에서 sal, comm 컬럼을 제외한 나머지 6개 컬럼만 조회가 되는 view
--v+emp 이름으로 생성
CREATE OR REPLACE VIEW v_emp AS
SELECT empno, ename, job, mgr, hiredate, deptno
FROM emp;

--SYSTEM 계정에서 작업
--VIEW 생성 권한 PC05  계정에 부여
GRANT CREATE VIEW TO PC05;

--VIEW를 통해 데이터 조회
SELECT *
FROM v_emp;

--INLINE VIEW
SELECT *
FROM    (SELECT empno, ename, job, mgr, hiredate, deptno
                FROM emp);

--emp테이블을 수정하면 view에 영향을 줄까?
--KINH의 부서번호가 현재 10번
--emp 테이블의 KING의 부서번호 데이터를 30번으로 수정 (COMMIT하지 말것)
--v_emp 테이블에서 KING 부서번호를 관찰

UPDATE emp SET deptno = 30
WHERE ename = 'KING';

--v_emp 테이블에서 KING의 부서 번호를 관찰
SELECT *
FROM v_emp;
ROLLBACK;

--조인된 결과를 view로 생성
CREATE OR REPLACE VIEW v_emp_dept AS
SELECT emp.empno, emp.ename, dept.deptno, dept.dname
FROM emp, dept
WHERE emp.deptno = dept.deptno;

SELECT *
FROM v_emp_dept;

--emp테이블에서 KING 삭제 (COMMIT 하지 말것)
DELETE emp 
WHERE ename = 'KING';

SELECT *
FROM emp;

--emp 테이블에서 KING 데이터 삭제후 v_emp_depe view의 조회결과 확인
SELECT *
FROM v_emp_dept;

--INLINE VIEW
SELECT *
FROM    (SELECT emp.empno, emp.ename, dept.deptno, dept.dname
                FROM emp, dept
                WHERE emp.deptno = dept.deptno
                );
--emp 테이블의 empno 컬럼을 eno로 컬럼이름 변경
ALTER TABLE emp RENAME COLUMN empno TO eno;
ALTER TABLE emp RENAME COLUMN eno TO empno;

SELECT *
FROM v_emp_dept;

ROLLBACK;

--VIEW 삭제
DROP VIEW v_emp;
DROP VIEW v_emp_dept;

INSERT INTO EMP VALUES
        (7839, 'KING',   'PRESIDENT', NULL,
        TO_DATE('17-NOV-1981', 'DD-MON-YYYY', 'NLS_DATE_LANGUAGE = AMERICAN'), 5000, NULL, 10);
COMMIT;

--부서별 직원의 급여 합계
CREATE OR REPLACE VIEW v_emp_sal AS
SELECT deptno, SUM(sal) sum_sal
FROM emp
GROUP BY deptno;

SELECT *
FROM v_emp_sal
WHERE deptno = 20;

SELECT*
FROM    (SELECT deptno, SUM(sal) sum_sal
                FROM emp
                GROUP BY deptno)
WHERE deptno = 20;

--SEQUENCE
--오라클 객체로 중복되지 않는 정수 값을 리턴해주는 객체
--CREATE SEQUENCE 시퀀스명
--[옵션....]

CREATE SEQUENCE seq_board; 


DROP SEQUENCE seq_board;

--시퀀스 사용방법 : 시퀀스 명.nextval
SELECT seq_board.nextval
FROM dual;

SELECT seq_board.currval
FROM dual;

ROLLBACK;

SELECT rowid, rownum, emp.*
FROM emp;

--emp 테이블 empno 컬럼으로 PRIMARY KEY 제약 생성 : pk_emp
ALTER TABLE emp ADD CONSTRAINT pk_emp PRIMARY KEY (empno);

--dept 테이블 deptno 컬럼으로 PRIMARY KEY 제약 생성 : pk_dept
ALTER TABLE dept ADD CONSTRAINT pk_dept PRIMARY KEY (deptno);

--emp 테이블의 empno 컬럼이 dept 테이블의 deptno 컬럼을 참조하도록
--FOREIGN KEY 제약추가 : fk_dept_deptno
ALTER TABLE emp ADD CONSTRAINT deptno FOREIGN KEY (deptno)
                                REFERENCES dept (deptno);

DROP TABLE emp_test;

--emp 테이블을 이용하야 emp_test 테이블 생성
CREATE TABLE emp_test AS
SELECT *
FROM emp;

--emp_test 테이블에는 인덱스가 없는 상태
--원하는 데이터를 찾기 위해서는 테이블의 데이터를 모두 읽어봐야 한다.
EXPLAIN PLAN FOR
SELECT *
FROM emp_test
WHERE empno = 7369;

SELECT *
FROM table (dbms_xplan.display);
--실행계획을 통해 7369인 사번을 갖는 직원정보를 조회하기 위해 테이블의 모든 데이터 (14)를 읽어본 다음에 7369인 사번인 데이터만
--선택하여 사용자에게 반환
--*****     13건의 데이터는 불필요하게 조회후 버림.


EXPLAIN PLAN FOR
SELECT *
FROM emp
WHERE empno = 7369;

SELECT *
FROM table (dbms_xplan.display);

--실행계획을 통해 분석을 하면
--empno 가 7369인 직원을 index를 통해 매우 빠르게 인덱스에 접근
--table에서 읽은 데이터는 7369사번 데이터 한건만 조회하고 나머지 13건에 대해서는 읽지 않고 처리
-- 14→1
-- 1→1
Plan hash value: 2949544139











