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


--sub7 : sub 6의 결과에서 고객명, 제품명을 추가
SELECT *
FROM customer, product, cycle 
WHERE cycle.pid IN (SELECT pid
                            FROM cycle
                            WHERE cid = 2)
AND cycle.cid = 1
AND cycle.pid = product.pid
AND cycle.cid = customer.cid;


--매니저가 존재하는 직원정보 조회
SELECT *
FROM emp e
WHERE EXISTS (SELECT 1
                                FROM emp m
                                WHERE m.empno = e.mgr);

--sub8
SELECT m.*, e.ename manager
FROM emp m, emp e
WHERE e.empno = m.mgr; --mgr가 없다 → 값이 NULL이다.

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
                                
--집합연산
--UNION : 합집합 , 두 집합의 중복건은 제거한다.
--담당 업무가 SALESMAN인 직원의 직원번호, 직원 이름 조회
--위 아래 결과 셋이 같기 때문에 합집합 연산을 하게 될 경우
--중복되는 데이터는 한번만 표현한다.
SELECT *
FROM emp
WHERE job = 'SALESMAN'

UNION

SELECT *
FROM emp
WHERE job = 'CLERK';


--UNION ALL
--합집합 연산시 중복 제거를 하지 않는다.
--위 아래 결과 셋을 붙여주기만 한다.
SELECT *
FROM emp
WHERE job = 'SALESMAN'

UNION ALL

SELECT *
FROM emp
WHERE job = 'CLERK';

--집합 연산시 집합 셋의 컬럼이 동일해야 한다.
--컬럼의 개수가 다를 경우 임의의 값을 넣는 방식으로 개수를 맞춰준다.
SELECT empno, ename, ''
FROM emp
WHERE job = 'SALESMAN'

UNION ALL

SELECT empno, ename, job
FROM emp
WHERE job = 'CLERK';

-- INTERSECT : 교집합
--두 집합간 공통적인 데이터만 조회
SELECT empno, ename, job
FROM emp
WHERE job IN ('SALESMAN' , 'CLERK')

INTERSECT

SELECT empno, ename, job
FROM emp
WHERE job IN ('SALESMAN');

--MINUS : 차집합
--차집합 : 위, 아래, 집합의 교집합을 위 집합에서 제거한 집합을 조회
--차집합의 경우 합집합, 교집합과 다르게 집합의 선언 순서가 결과 집합에 영향을 준다.
SELECT empno, ename, job
FROM emp
WHERE job IN ('SALESMAN' , 'CLERK')

MINUS

SELECT empno, ename, job
FROM emp
WHERE job IN ('SALESMAN');

--DML
--INSERT : 테이블에 새로운 데이터를 입력
DELETE dept
WHERE deptno = 99;
COMMIT;
SELECT *
FROM dept;

--INSERT 시 컬럼을 나열한 경우
--나열한 컬럼에 맞춰 입력할 값을 동일한 순서로 기술한다.
--INSERT INTO 테이블명 (컬럼1, 컬럼2...)
--                          VALUES (값1, 값2 ...)

--dept 테이블에 99번 부서번호, ddit 조직명, daejeon 지역명을 갖는 데이터를 입력
INSERT INTO dept (deptno, dname, loc)
                VALUES (99, 'ddit' , 'daejeon');
ROLLBACK;
SELECT *
FROM dept;
                
--컬럼을 기술할 경우 테이블의 컬럼 정의 순서와 다르게 나열해도 상관이 없다.
--dept 테이블의 컬럼 순서 : location, deptno, dname
--dept 테이블에 99번 부서번호, ddit 조직명, daejeon 지역명을 갖는 데이터를 입력
INSERT INTO dept (loc, deptno, dname )
                VALUES ('daejeon' , 99, 'ddit');

--컬럼을 기술하지 않는 경우 : 테이블의 컬럼 정의 순서에 맞춰 값을 기술한다.
INSERT INTO dept VALUES (99, 'ddit', 'daejeon');

--날짜 값 입력하기
--1. SYSDATE
--2. 사용자로부터 받은 문자열을 DATE타입으로 변경하여 입력
DESC emp;
INSERT INTO emp VALUES (9998, 'sally', 'SALESMAN', NULL, SYSDATE, 500, NULL, NULL);
--2019년 12월 2일 입사
INSERT INTO emp VALUES (9997, 'james', 'CLERK', NULL, TO_DATE('20191202', 'YYYYMMDD'), 500, NULL, NULL);
SELECT *
FROM emp;

ROLLBACK;

--여러건의 데이터를 한번에 입력
--SELECT 결과를 테이블에 입력할 수 있다.
INSERT INTO emp

SELECT 9998, 'sally', 'SALESMAN', NULL, SYSDATE, 500, NULL, NULL
FROM dual

UNION ALL

SELECT 9997, 'james', 'CLERK', NULL, TO_DATE('20191202', 'YYYYMMDD'), 500, NULL, NULL
FROM dual;



