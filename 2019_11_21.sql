-- col IN (value1, value2...)
-- col의 값이 IN 연산자 안에 나열된 값 중에 포함될 때 참으로 판정

--RDBMS - 집합개념
--1. 집합에는 순서가 없다.
-- {1, 5, 7} , {5, 1, 7}

--2. 집합에는 중복이 없다.
-- {1, 1, 5, 7}, {5, 1, 7}

SELECT *
FROM emp
WHERE deptno IN (10, 20);   --emp 테이블의 직원의 소속부서가 10번이거나 20번인 직원 정보만 조회

-- 이거나 → OR (또는)
-- 이고  →  AND (그리고)

-- IN → OR
-- BETWEEN AND → AND + 산술비교

SELECT *
FROM emp
WHERE deptno = 10 or deptno = 20;

--조건에 맞는 데이터 조회하기 ( IN 실습 where3 )
--user 테이블에서 userid가 brown, cony, sally인 데이터를 다음과 같이 조회하시오
SELECT userid 아이디, usernm 이름, alias 별명
FROM users
WHERE userid IN ('brown', 'cony', 'sally');                 --문자열을 찾을 때 ''안에 검색

-- LIKE 연산자 : 문자열 매칭 연산
-- % : 여러 문자 (문자가 없을 수도 있다)
-- + : 하나의 문자

--emp테이블에서 사원이름(ename)이 S로 시작하는 사원 정보만 조회
SELECT *
FROM emp
WHERE ename LIKE 'S%';

--SMITH
--SCOTT
--첫글자는 S로 시작하고 4번째 글자는 T
--두번쨰, 세번째, 다섯번째 문자는 어떤 문자는 올 수 있다.
SELECT *
FROM emp
WHERE ename LIKE 'S__T_';
WHERE ename LIKE 'S%T_'; -- 'STE', 'STTTT'

--조건에 맞는 데이터 조회하기 (LIKE, %, _ 실습 where4)
--member 테이블에서 회원의 성이 [신]씨인 사람의 mem_id, mem_name을 조회하는 쿼리를 작성하시오
SELECT mem_id, mem_name
FROM member
WHERE mem_name LIKE '신%';

--조건에 맞는 데이터 조회하기 (LIKE, %, _ 실습 where5)
--member 테이블에서 회원의 글자에 [이]가 들어가는 모든 사람의 mem_id, mem_name을 조회하는 쿼리를 작성하시오
SELECT mem_id, mem_name
FROM member
WHERE mem_name LIKE '%이%';

--컬럼 값이 NULL인 데이터 찾기
--emp 테이블에 MGR 컬럼이 NULL 데이터가 존재
SELECT *
FROM emp
WHERE MGR IS NULL;      --NULL값 확인에는 IS NULL 연산자를 사용
WHERE MGR = NULL;       --MGR 컬럼값이 NULL인 사원정보 조회
WHERE MGR = 7698;       --MGR 컬럼값이 7698인 사원정보 조회

--조건에 맞는 데이터 조회하기 (IS NULL 실습 where6)
--emp 테이블에서 회원의 글자에 [이]가 들어가는 모든 사람의 mem_id, mem_name을 조회하는 쿼리를 작성하시오

SELECT *
FROM emp
WHERE comm IS NOT NULL;

UPDATE emp SET comm = 0
WHERE empno = 7844;

COMMIT;


--AND : 조건을 동시에 만족
--OR  : 조건을 한개만 충족하면 만족
--emp테이블에서 mgr가 7698 사번이고, 급여가 1000보다 큰 사람
SELECT *
FROM emp
WHERE mgr = 7698
AND sal > 1000;

--emp테이블에서 mgr가 7698이거나, 급여가 1000보다 큰사람
SELECT *
FROM emp
WHERE mgr = 7698
OR sal > 1000;

--emp테이블에서 관리자 사번이 7698, 7839가 아닌 직원 정보조회
SELECT *
FROM emp
WHERE mgr NOT IN (7698, 7839)
OR mgr IS NULL;

--emp테이블에서 job이 SALESMAN이고 입사일자가 1981년 6월 1일 이후인 직원의 정보를 조회하세요 ****
SELECT *
FROM emp
WHERE job = ('SALESMAN')
AND hiredate >= TO_DATE('19810601','yyyymmdd');
