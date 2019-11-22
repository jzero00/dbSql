--emp테이블에서 deptno가 10이 아니고 입사일자가 1981년 6월 1일 이후인 직원의 정보를 조회하세요 ****
SELECT *
FROM emp
WHERE deptno != 10
AND hiredate >= TO_DATE('19810601','YYYYMMDD');

--9
SELECT *
FROM emp
WHERE deptno NOT IN (10)
AND hiredate >= TO_DATE('19810601','YYYYMMDD');

--10 (NOT IN 연산자 사용 금지, IN 연산자만 사용가능)
--dept 컬럼의 값은 10,20,30만 존재한다.

SELECT *
FROM emp
WHERE deptno IN (20, 30)
AND hiredate >= TO_DATE('19810601','YYYYMMDD');

--11
--emp테이블에서 job이 SALESMAN이거나 입사일자가 1981년 6월 1일 이후인
--직원의 정보를 다음과 같이 조회하세요.

SELECT *
FROM emp
WHERE job = 'SALESMAN'
OR hiredate >= TO_DATE('19810601','YYYYMMDD');

--12
--emp 테이블에서 job이 SALESMAN이거나 사원번호가 78로 시작하는 직원의 정보를 다음과 같이 조회하세요
SELECT *
FROM emp
WHERE job = 'SALESMAN'
OR empno LIKE '78%';

--13
--emp테이블에서 job이 SALESMAN이거나 사원번호가 78로 시작하는 직원의 정보를 다음과 같이 조회하세요
--(LIKE 연산자 사용 금지)
--전제조건 : empno가 숫자여야된다. (DESC )
SELECT *
FROM emp
WHERE job = 'SALESMAN'
OR ( empno >= 7800 AND empno < 7900);

--연산자 우선순위 (AND > OR)
--직원 이름이 SMITH이거나, 직원이름이 ALLEN 이면서 역할이 SALESMAN인 직원
SELECT *
FROM emp
WHERE ename = 'SMITH'
OR ename = 'ALLEN'
AND job = 'SALESMAN';

--이게 더 가독성이 좋음
SELECT *
FROM emp
WHERE ename = 'SMITH'
OR (ename = 'ALLEN' AND job = 'SALESMAN');

--직원이름이 SMITH이거나 ALLEN이면서 역할이 SALESMAN인 사람
SELECT *
FROM emp
WHERE (ename = 'SMITH' OR ename = 'ALLEN' )
AND job = 'SALESMAN';

--14
SELECT *
FROM emp
WHERE job = 'SALESMAN'
OR empno LIKE '78%'
AND hiredate > TO_DATE('19810601','YYYYMMDD');

--데이터 정렬
-- 1,3,5,2,10
--오름차순 : 1, 2, 3, 5, 10
--내림차순 : 10, 5, 3, 2, 1

--오름차순 : ASC (표기를 안할 경우 기본값)
--내림차순 : DESC (내림차순시 반드시 표기)
/*
    SELECT col1, col2, ....
    FROM 테이블명
    WHERE col1 = '값'
    ORDER BY 정렬기중컬럼1 [ASC / DESC], 정렬기준컬럼2.... [ASC/DESC]
*/

--사원(emp) 테이블에서 직원의 정보를 직원 이름으로 오름차순정렬
SELECT *
FROM emp
ORDER BY ename;

SELECT *
FROM emp
ORDER BY ename ASC; --정렬기준을 작성하지 않을 경우 오름차순 적용

--사원(emp) 테이블에서 직원의 정보를 직원 이름으로 내림차순정렬
SELECT *
FROM emp
ORDER BY ename DESC;

--사원(emp) 테이블에서 직원의 정보를 부서번호로 오름차순 정렬하고
--부서번호가 같을 때는 sal 내림차순 정렬
--급여(sal)가 같을때는 이름으로 오름차순 정렬한다.
SELECT *
FROM emp
ORDER BY deptno, sal DESC, ename;

--정렬 컬럼을 ALIAS호 표현
SELECT deptno, sal, ename nm
FROM emp
ORDER BY nm;

--조회하는 컬럼의 위치 인덱스로 표현가능
SELECT deptno, sal, ename nm
FROM emp
ORDER BY 3;     --추천하지 않음 (컬럼추가시 의도하지 않은 결과가 나올 수 있음) 쿼리가 수정되지 않으면 좋음

--데이터 정렬
--dept 테이블의 모든 정보를 부서이름으로 오름차순 정렬로 조외되도록 쿼리를 작성하세요
DESC dept;

SELECT *
FROM dept
ORDER BY deptno;

SELECT *
FROM dept
ORDER BY loc DESC;

--emp테이블에서 상여(comm)정보가 있는 사람들만 조회하고, 상여(comm)를 많이 받는 사람이 먼저 조회되도록 하고
--상여가 같을 경우 사번으로 오름차순 정렬하세요
SELECT *
FROM emp
WHERE comm > 0
ORDER BY comm DESC, empno;

--emp테이블에서 관리자가 있는 사람들만 조회하고
--직군 순으로 오름차순 정렬하고
--직업이 같을 경우, 사번이 큰 사원이 먼저 조회되도록 쿼리를 작성하시오
SELECT *
FROM emp
WHERE mgr IS NOT NULL
ORDER BY job, deptno DESC;

--emp테이블에서
SELECT *
FROM emp
WHERE (deptno IN (10, 30))
AND sal > 1500
ORDER BY ename DESC;

--ROWNUM
SELECT ROWNUM, empno, ename
FROM emp;

SELECT ROWNUM, empno, ename
FROM emp
WHERE ROWNUM = 2;           --ROWNUM = equal 비교는 1만 가능

SELECT ROWNUM, empno, ename
FROM emp
WHERE ROWNUM <= 2;          --<= (<) ROWNUM을 1부터 순차적으로 조회하는 경우는 가능

SELECT ROWNUM, empno, ename
FROM emp
WHERE ROWNUM BETWEEN 1 AND 20;          -- 1부터 시작하는 경우 가능

--SELECT 절과 ORDER BY 구문의 실행순서
-- SELECT → ROWNUM → ORDER BY
SELECT ROWNUM, empno, ename
FROM emp
ORDER BY ename;

--INLINE VIEW를 통해 정렬 먼저 실행하고, 해당 결과에 ROWNUM을 적용 ********
--SELECT절에 *표현하고, 다른 컬럼|표현식을 썼을 경우
--*앞에 테이블이나 별칭을 적용
SELECT ROWNUM, a.*
FROM
    (SELECT empno, ename
     FROM emp
     ORDER BY ename) a;

SELECT e.*
FROM emp e;

--row_1
SELECT ROWNUM rn, empno, ename
FROM emp
WHERE ROWNUM <=10;

--row_2
--ROWNUM 값이 11~14인 값만 조회하는 쿼리를 작서해보세요
SELECT *
FROM
    (SELECT ROWNUM rn, a.*
     FROM
        (SELECT empno, ename
         FROM emp) a
    )
WHERE rn BETWEEN 11 AND 20;

--row_3
--emp테이블에서 ename으로 정렬한 결과의 11번째 행과 14번째 행만 조회하는 쿼리를 작성해보세요



SELECT *
FROM
    (SELECT ROWNUM rn, a.*
     FROM
        (SELECT empno, ename
         FROM emp
         ORDER BY ename ) a)
WHERE rn IN (11 ,14) ;