--  PL/SQL
--  PL/SQL 기본구조
--  DECLARE : 선언부, 변수를 선언하는 부분
-- BEGIN        : PL/SQL의 로직이 들어가는 부분
-- EXCEPTION  : 예외 처리 부

-- DBMS_OUTPUT.PUT_LINE 함수가 출력하는 결과를 화면에 보여주도록 활성화
SET SERVEROUT ON;  
DECLARE     --선언부
--java : 타입 변수명;
--pl/sql : 변수명 타입;
    /*v_dname VARCHAR2(14);
    v_loc VARCHAR2(13);*/
    --테이블 컬럼의 정의를 참조하여 데이터 타입을 선언한다.
    v_dname dept.dname %TYPE;
    v_loc dept.loc %TYPE;
BEGIN
            --dept 테이블에서 10번 부서의 부서이름, LOC 정보를 조회
            SELECT dname, loc
            INTO v_dname, v_loc
            FROM dept
            WHERE deptno = 10;
            --String a = "t";
            --String b = "v";
            --System.out.println(a + b);
            DBMS_OUTPUT.PUT_LINE(v_dname || v_loc);
END;
/

DESC dept;

--PL/SQL 블럭을 실행




-- 10번 부서의 부서이름과 위치 지역을 조회해서 변수에 담고
-- 변수를 DBMS_OUTPUT.PUT_LINE 함수를 이용하여 console에 출력

CREATE OR REPLACE PROCEDURE printdept IS
--선언부
    dname dept.dname %TYPE;
    loc dept.loc %TYPE;
    
--실행부
BEGIN
    SELECT dname, loc
    INTO dname, loc
    FROM dept
    WHERE deptno = 10;
    
--예외처리부 (옵션)
    DBMS_OUTPUT.PUT_LINE(dname || ' ' || loc);
END;
/

exec printdept;

CREATE OR REPLACE PROCEDURE printdept
--파라미터명 IN/OUT 타입
-- p_
( p_deptno IN dept.deptno %TYPE )
IS
--선언부
    dname dept.dname %TYPE;
    loc dept.loc %TYPE;
    
--실행부
BEGIN
    SELECT dname, loc
    INTO dname, loc
    FROM dept
    WHERE deptno = p_deptno;
    
--예외처리부 (옵션)
    DBMS_OUTPUT.PUT_LINE(dname || ' ' || loc);
END;
/

exec printdept(40);

CREATE OR REPLACE PROCEDURE printemp
( p_empno IN emp.empno %TYPE )
IS

ename emp.ename %TYPE;
dname dept.dname %TYPE;

BEGIN
 SELECT ename, dname
 INTO ename, dname
 FROM emp, dept
 WHERE emp.deptno = dept.deptno
 AND emp.empno = p_empno;
 
  DBMS_OUTPUT.PUT_LINE(ename || ' ' || dname);
  END;
  /

exec printemp(7788);

CREATE OR REPLACE PROCEDURE registdept_test
(   p_deptno IN dept.deptno %TYPE ,
    p_dname IN dept.dname %TYPE,
    p_loc IN dept.loc %TYPE)
IS

deptno dept.deptno %TYPE;
dname dept.dname %TYPE;
loc dept.loc %TYPE;
BEGIN

INSERT INTO dept_test VALUES (p_deptno, p_dname, p_loc);
COMMIT;

END; 
/

exec registdept_test(99, 'ddit' , 'daejeon');



SELECT *
FROM dept_test;



