-- 1. tax 테이블을 이용 시도/시군구별 인당 연말정산 신고액 구하기
--2. 신고액이 많은 순서로 랭킹 부여하기
--랭킹 (1)    시도(2)   시군구(3)  인당연말정산신고액(4)-- 소수점 둘째자리에서 반올림
--1        서울특별시    서초구         7000
--2        서울특별시    강남구         6800

SELECT tax.*, ham_mod.*
FROM(

            (SELECT ROWNUM ranking, mod_tax.*
            FROM(
                            SELECT sido, sigungu, ROUND(sal / people, 1) 인당연말정산신고액
                            FROM tax
                            ORDER BY 인당연말정산신고액 DESC) mod_tax)) tax ,
             
            (SELECT ROWNUM ranking, c.*
            FROM
                            (SELECT a.sido, a.sigungu, ROUND(a.cnt / b.cnt,1)  도시발전지수
                            FROM
                                        (SELECT  sido, sigungu, COUNT(*) cnt
                                        FROM fastfood
                                        WHERE gb = '맥도날드' OR gb = '버거킹' OR gb = 'KFC'
                                        GROUP BY sido, sigungu) a,
                            -- 롯데리아 갯수만 표시
                                        (SELECT  sido, sigungu, COUNT(*) cnt
                                        FROM fastfood
                                        WHERE gb = '롯데리아'
                                        GROUP BY sido, sigungu) b
                            WHERE a.sido = b.sido AND a.sigungu = b.sigungu
                            ORDER BY 도시발전지수 DESC) c ) ham_mod
WHERE ham_mod.ranking (+) = tax. ranking
ORDER BY tax. ranking;          
                
                
--도시발전지수 시도, 시군구와 연말정산 납입 금액의 시도, 시군구가  같은 지역끼리 조인
--정렬 순서는 tax 테이블의 id 컬럼 순으로 정렬
SELECT tax.*, ham_mod.*
FROM(

            (SELECT  mod_tax.*
            FROM(
                            SELECT id, sido, sigungu, ROUND(sal / people, 1) 인당연말정산신고액
                            FROM tax
                            ORDER BY 인당연말정산신고액 DESC) mod_tax)) tax ,
             
            (SELECT c.*
            FROM
                            (SELECT a.sido, a.sigungu, ROUND(a.cnt / b.cnt,1)  도시발전지수
                            FROM
                                        (SELECT  sido, sigungu, COUNT(*) cnt
                                        FROM fastfood
                                        WHERE gb = '맥도날드' OR gb = '버거킹' OR gb = 'KFC'
                                        GROUP BY sido, sigungu) a,
                            -- 롯데리아 갯수만 표시
                                        (SELECT  sido, sigungu, COUNT(*) cnt
                                        FROM fastfood
                                        WHERE gb = '롯데리아'
                                        GROUP BY sido, sigungu) b
                            WHERE a.sido = b.sido AND a.sigungu = b.sigungu
                            ORDER BY 도시발전지수 DESC) c ) ham_mod
WHERE ham_mod.sido (+) = tax. sido AND ham_mod.sigungu (+) = tax.sigungu
ORDER BY tax. id;  

--SMITH가 속한 부서의 모든 직원을 조회
SELECT deptno
FROM emp
WHERE ename = 'SMITH';

SELECT *
FROM emp
WHERE deptno  =  (SELECT deptno
                                  FROM emp
                                  WHERE ename = 'SMITH');
                                  
SELECT empno, ename, deptno,
                (SELECT dname FROM dept WHERE dept.deptno = emp.deptno) dname
FROM emp;

--SCALAR SUBQUERY
-- SELECT 절에 표현된 서브쿼리
--한행, 한 COLUMN을 조회해야 한다
SELECT empno, ename, deptno,
                (SELECT dname FROM dept) dname
FROM emp;

--INLINE VIEW
--FROM 절에 사용되는 서브쿼리

--SUBQUERY
--WHERE에 사용되는 서브쿼리
SELECT COUNT(*)
FROM emp
WHERE sal > (SELECT AVG(sal) 
                            FROM emp);
                    
SELECT *
FROM emp
WHERE sal >  (SELECT AVG (sal)
                          FROM emp);


SELECT *
FROM emp
WHERE  deptno = any (SELECT deptno
                                FROM emp
                                WHERE ename IN ('SMITH', 'WARD'));


--WHERE에 있는 서브쿼리의 값을 비교할때 = 가 아닌 IN을 쓴다.

SELECT *
FROM emp
WHERE  deptno IN (SELECT deptno
                                FROM emp
                                WHERE ename = 'SMITH'
                                OR ename = 'WARD');
                                
                                
--SMITH 혹은 WARD 보다 급여를 적게 받는 직원조회
SELECT * 
FROM emp
WHERE sal < ANY ( SELECT sal
                        FROM emp
                        WHERE ename IN ('SMITH' , 'WARD'));
                      



--관리자인 사원
SELECT *
FROM emp            --사원 정보 조회 → 관리자 역할을 하지 않는
WHERE empno IN (SELECT mgr
                                 FROM emp);
                                 
--관리자 역할을 하지 않는 사원 정보 조회
-- NOT IN 연산자 사용시 NULL이 데이터에 존재하지 않아야 한다.
SELECT *
FROM emp            --사원 정보 조회 → 관리자 역할을 하지 않는
WHERE empno NOT IN (SELECT NVL(mgr, 0) -- NULL값을 존재하지 않을만한 데이터로 치환
                                          FROM emp);

SELECT *
FROM emp            --사원 정보 조회 → 관리자 역할을 하지 않는
WHERE empno NOT IN (SELECT mgr -- NULL값을 존재하지 않을만한 데이터로 치환
                                          FROM emp
                                          WHERE mgr IS NOT NULL);
                                          
--pair wise
--ALLEN과 CLARK의 매니저와 부서번호가 동시에 같은 사원 정보 조회
--(7698,30)
--(7839,10)

--매니저가 7698이거나 7839이면서 소속부서가 10번이거나 30번인 직원정보 조호;
-- 7698, 10
-- 7698, 30
-- 7839, 10
-- 7839, 30

SELECT *
FROM emp
WHERE (mgr, deptno) IN (SELECT mgr, deptno
                                            FROM emp
                                            WHERE empno IN ( 7499, 7782));
                                            
SELECT *
FROM emp
WHERE mgr IN (SELECT mgr
                             FROM emp
                             WHERE empno IN ( 7499, 7782));

SELECT *
FROM emp
WHERE deptno  IN (SELECT deptno
                             FROM emp
                             WHERE empno IN ( 7499, 7782));
                             
--비상호 연관 서브쿼리
--메인 쿼리의 컬럼을 서브쿼리에서 가용하지 않는 형태의 서브쿼리

--비상호 연관 서브쿼리의 경우 메인쿼리에서 사용하는 테이블, 서브쿼리 조회 순서를 
--성능적으로 유리한 쪽으로 판단하여 순서를 결정한다.
--메인 쿼리의 emp테이블을 먼저 읽을 수도 있고, 서브 쿼리의 emp 테이블을 먼저 읽을 수도 있다.

--비상호 연관 서브 쿼리에서 서브쿼리쪽 테이블을 먼저 읽을 때는
--서브쿼리가 제공자 역할을 했다라고 모 도서에서 표현
--비상호 연관 서브 쿼리에서 서브쿼리쪽 테이블을 나중에 읽을 때는
--서브쿼리가 확인자 역할을 했다라고 모 도서에서 표현

--직원의 급여 평균보다 높은 급여를 받는 직원 정보 조회
--직원의 급여 평균
SELECT *
FROM emp
WHERE sal > (SELECT AVG(sal)
                        FROM emp);

--상호 연관 서브쿼리
--해당 직원이 속한 부서의 급여 평균보다 높은 급여를 받는 직원 조회

SELECT *
FROM emp m
WHERE sal > (SELECT AVG (sal)
                        FROM emp
                        WHERE deptno = m.deptno);

--10번 부서의 급여 평균
SELECT AVG (sal)
FROM emp
WHERE deptno = 10;






