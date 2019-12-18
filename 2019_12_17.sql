-- WITH
-- WITH 블럭이름 AS (
--      서브쿼리
-- )

-- SELECT *
-- FROM 블럭이름

-- deptno, avg(sal) avg_sal
-- 해당 부서의 급여 평균이 전체 직원의 급여 평균보다 높은 부서에 한해 조회
SELECT deptno, AVG(sal) avg_sal
FROM emp
/*WHERE avg(sal) > (전체직원 급여 평균) 은 안됨*/
GROUP BY deptno
HAVING avg(sal) > (SELECT AVG(sal) FROM emp);

-- WITH 절을 사용하여 위의 쿼리를 작성
WITH dept_sal_avg AS (
        SELECT deptno, AVG(sal) avg_sal
        FROM emp
        GROUP BY deptno) ,
        emp_sal_avg AS (
        SELECT AVG(sal) avg_sal FROM emp
)
SELECT *
FROM dept_sal_avg
WHERE dept_sal_avg.avg_sal > (SELECT avg_sal FROM emp_sal_avg);

--개발 목적으로 많이 사용
WITH test AS (
        SELECT 1, 'TEST1' FROM dual UNION ALL
        SELECT 2, 'TEST2' FROM dual UNION ALL
        SELECT 3, 'TEST3' FROM dual)
SELECT *
FROM test;

--데이터의 행을 열로 바꾸는 방법
--계층 쿼리
--달력 만들기
-- CONNECT BY LEVEL <= N
-- 테이블의 ROW 건수를 N만큼 반복한다.
-- CONNECT BY LEVEL 절을 사용한 쿼리에서는
-- SELECT 절에서 LEVEL 이라는 특수 컬럼을 사용할 수 있다.
-- 계층을 표현하는 특수 컬럼으로 1월부터 증가하며 ROWNUM과 유사하나
-- 추후에 배우게 될 START WITH, CONNECT BY 절에서 다른 점을 배우게 된다.

--201911월은 30일까지 존재
--201911
--일자 + 정수 = 정수만큼 미래의 일자
--201911 → 해당 년월의 날짜가 몇일까지 존재하는가?

SELECT TO_DATE(:yyyymm, 'yyyymm') + (LEVEL - 1)
FROM dual
CONNECT BY LEVEL <= 30;

SELECT TO_CHAR( LAST_DAY ( TO_DATE (:yyyymm, 'YYYYMM')), 'DD')
FROM dual;

SELECT /* 일요일이면 날짜 ,  화요일이면 날짜 , ... 토요일이면 날짜*/
                iw,
               MAX  ( DECODE ( d , 1 , dt) ) SUN , MAX ( DECODE ( d , 2 , dt) ) MON , MAX ( DECODE ( d , 3 , dt) ) TUE ,
               MAX  ( DECODE ( d , 4 , dt) ) WED ,MAX ( DECODE ( d , 5 , dt) ) THU , MAX ( DECODE ( d , 6 , dt) ) FRI, MAX ( DECODE ( d , 7 , dt) ) SAT

FROM 
            (SELECT    TO_DATE( :yyyymm, 'yyyymm' ) + ( LEVEL - 1 ) dt,
                                TO_CHAR( TO_DATE ( :yyyymm, 'yyyymm' ) + ( LEVEL - 1 ) , 'D' ) d,
                                TO_CHAR( TO_DATE ( :yyyymm, 'yyyymm' ) + ( LEVEL ) , 'IW' ) iw
            FROM dual
            CONNECT BY LEVEL <= TO_CHAR( LAST_DAY ( TO_DATE (:yyyymm, 'YYYYMM')), 'DD'))
GROUP BY iw
ORDER BY iw;



SELECT /* 일요일이면 날짜 ,  화요일이면 날짜 , ... 토요일이면 날짜*/
               iw_mod,
               MAX  ( DECODE ( d , 1 , dt) ) SUN , MAX ( DECODE ( d , 2 , dt) ) MON , MAX ( DECODE ( d , 3 , dt) ) TUE ,
               MAX  ( DECODE ( d , 4 , dt) ) WED ,MAX ( DECODE ( d , 5 , dt) ) THU , MAX ( DECODE ( d , 6 , dt) ) FRI, MAX ( DECODE ( d , 7 , dt) ) SAT

FROM 
            (SELECT    TO_DATE( :yyyymm, 'yyyymm' ) + ( LEVEL - 1 ) dt,
                                TO_CHAR( TO_DATE ( :yyyymm, 'yyyymm' ) + ( LEVEL - 1 ) , 'D' ) d,
                                TO_CHAR( TO_DATE ( :yyyymm, 'yyyymm' ) + ( LEVEL ) , 'IW' ) iw,
                                CASE 
                                        WHEN TO_CHAR( TO_DATE ( :yyyymm, 'yyyymm' ) + ( LEVEL ) , 'IW' ) = 1
                                           AND TO_CHAR( TO_DATE ( :yyyymm, 'yyyymm' ) + ( LEVEL ) , 'MM' ) = 12
                                        THEN TO_CHAR( TO_DATE ( :yyyymm, 'yyyymm' ) + ( LEVEL ) , 'IW' ) + 53
                                        
                                        WHEN TO_CHAR( TO_DATE ( :yyyymm, 'yyyymm' ) + ( LEVEL ) , 'IW' ) = 53
                                       AND TO_CHAR( TO_DATE ( :yyyymm, 'yyyymm' ) + ( LEVEL ) , 'MM' ) = 1
                                       THEN TO_CHAR( TO_DATE ( :yyyymm, 'yyyymm' ) + ( LEVEL ) , 'IW' ) - 53
                                       
                                        WHEN TO_CHAR( TO_DATE ( :yyyymm, 'yyyymm' ) + ( LEVEL ) , 'IW' ) = 52
                                       AND TO_CHAR( TO_DATE ( :yyyymm, 'yyyymm' ) + ( LEVEL ) , 'MM' ) = 1
                                       THEN TO_CHAR( TO_DATE ( :yyyymm, 'yyyymm' ) + ( LEVEL ) , 'IW' ) - 52
                                       
                                        ELSE TO_CHAR( TO_DATE ( :yyyymm, 'yyyymm' ) + ( LEVEL ) , 'IW' ) * 1
                                        
                                        END iw_mod
            FROM dual
            CONNECT BY LEVEL <= TO_CHAR( LAST_DAY ( TO_DATE (:yyyymm, 'YYYYMM')), 'DD'))
GROUP BY iw_mod
ORDER BY iw_mod;

--☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★☆★숙제
SELECT 
               iw_mod, sun_rep1, sun_rep2,
               ( DECODE ( d , 1 , dt) ) SUN ,  ( DECODE ( d , 2 , dt) ) MON ,  ( DECODE ( d , 3 , dt) ) TUE ,
               ( DECODE ( d , 4 , dt) ) WED , ( DECODE ( d , 5 , dt) ) THU ,  ( DECODE ( d , 6 , dt) ) FRI,  ( DECODE ( d , 7 , dt) ) SAT

FROM 
            (SELECT    TO_DATE( :yyyymm, 'yyyymm' ) + ( LEVEL - 1 ) dt,
                                TO_CHAR( TO_DATE ( :yyyymm, 'yyyymm' ) + ( LEVEL - 1 ) , 'D' ) d,
                                TO_CHAR( TO_DATE ( :yyyymm, 'yyyymm' ) + ( LEVEL ) , 'IW' ) iw,
                                TO_DATE( :yyyymm, 'yyyymm' ) + ( LEVEL - 1 )  - TO_CHAR( TO_DATE ( :yyyymm, 'yyyymm' ) + ( LEVEL - 1 ) , 'D' ) + 1 sun_rep1,
                                TO_DATE( :yyyymm, 'yyyymm' ) + ( LEVEL - 1 )  + 7 - TO_CHAR( TO_DATE ( :yyyymm, 'yyyymm' ) + ( LEVEL - 1 ) , 'D' )  sun_rep2,
                                CASE 
                                        WHEN TO_CHAR( TO_DATE ( :yyyymm, 'yyyymm' ) + ( LEVEL ) , 'IW' ) = 1
                                           AND TO_CHAR( TO_DATE ( :yyyymm, 'yyyymm' ) + ( LEVEL ) , 'MM' ) = 12
                                        THEN TO_CHAR( TO_DATE ( :yyyymm, 'yyyymm' ) + ( LEVEL ) , 'IW' ) + 53
                                        
                                        WHEN TO_CHAR( TO_DATE ( :yyyymm, 'yyyymm' ) + ( LEVEL ) , 'IW' ) = 53
                                       AND TO_CHAR( TO_DATE ( :yyyymm, 'yyyymm' ) + ( LEVEL ) , 'MM' ) = 1
                                       THEN TO_CHAR( TO_DATE ( :yyyymm, 'yyyymm' ) + ( LEVEL ) , 'IW' ) - 53
                                       
                                        WHEN TO_CHAR( TO_DATE ( :yyyymm, 'yyyymm' ) + ( LEVEL ) , 'IW' ) = 52
                                       AND TO_CHAR( TO_DATE ( :yyyymm, 'yyyymm' ) + ( LEVEL ) , 'MM' ) = 1
                                       THEN TO_CHAR( TO_DATE ( :yyyymm, 'yyyymm' ) + ( LEVEL ) , 'IW' ) - 52
                                       
                                        ELSE TO_CHAR( TO_DATE ( :yyyymm, 'yyyymm' ) + ( LEVEL ) , 'IW' ) * 1
                                        
                                        END iw_mod
            FROM dual
            CONNECT BY LEVEL <= TO_NUMBER( LAST_DAY ( TO_DATE (:yyyymm, 'YYYYMM')), 'DD')) + (35 - TO_NUMBER( LAST_DAY ( TO_DATE (:yyyymm, 'YYYYMM')), 'DD'))
            );
GROUP BY iw_mod
ORDER BY iw_mod;

--201912 : 35
--202008 : 42



SELECT *
FROM sales;

SELECT  SUM (NVL ( DECODE ( TO_CHAR(dt, 'mm') , 01 , SUM (sales) ) , 0) ) JAN,
                SUM (NVL ( DECODE ( TO_CHAR(dt, 'mm') , 02 , SUM (sales) ) , 0) ) FEB,
                SUM (NVL ( DECODE ( TO_CHAR(dt, 'mm') , 03 , SUM (sales) ) , 0) ) MAR,
                SUM (NVL ( DECODE ( TO_CHAR(dt, 'mm') , 04 , SUM (sales) ) , 0) ) APR,
                SUM (NVL ( DECODE ( TO_CHAR(dt, 'mm') , 05 , SUM (sales) ) , 0) ) MAY,
                SUM (NVL ( DECODE ( TO_CHAR(dt, 'mm') , 06 , SUM (sales) ) , 0) ) JUN
FROM sales
GROUP BY TO_CHAR(dt, 'mm');

/*dept_h 실행*/
SELECT dept_h.* , LEVEL
FROM dept_h
START WITH deptcd = 'dept0'    --시작점은 deptcd = 'dept0'     → XX회사 (최상위 조직) 
CONNECT BY PRIOR deptcd = p_deptcd
;


/*
    dept0  (XX회사)
            dept0_00 (디자인부)
                    dept0_00_0 (디자인팀)
            dept0_01 (정보 기획부)
                    dept0_01_0 (기획팀)
                            dept0_00_0_0	(기획파트)
            dept0_02	(정보시스템부)
                    dept0_02_0	(개발1팀)
                    dept0_02_1	(개발2팀)
*/



