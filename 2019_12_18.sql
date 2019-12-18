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

--201910 : 35 , 첫날짜, 마지막 날짜 첫주의 일요일 : 9/29 마지막 주의 토요일 날짜 :  11/2
/* 일 (1), 월(2) 화 (3) 수(4) 목(5) 금(6) 토(7) */
SELECT *
FROM
(SELECT  LAST_DAY(TO_DATE(:yyyymm, 'YYYYMM')) ldt,

                TO_CHAR(LAST_DAY(TO_DATE(:yyyymm, 'YYYYMM')) , 'D') +
                7 - TO_CHAR(LAST_DAY(TO_DATE(:yyyymm, 'YYYYMM')) , 'D') dt,
                
                TO_DATE(:yyyymm, 'YYYYMM') -
                (TO_CHAR(TO_DATE(:yyyymm, 'YYYYMM') , 'D' ) - 1 ) fdt
FROM dual);


SELECT
                MAX(DECODE(d, 1, dt) ) 일, MAX(DECODE(d, 2, dt) )) 월, MAX(DECODE(d, 3, dt) )) 화,
                MAX(DECODE(d, 4, dt) ) 수, MAX(DECODE(d, 5, dt) ) 목, MAX(DECODE(d, 6, dt) ) 금, MAX (DECODE(d, 7, dt) ) 토
FROM
    (SELECT 
            TO_DATE(:yyyymm, 'YYYYMM') + (LEVEL - 1) dt,
            TO_CHAR(TO_DATE(:yyyymm, 'YYYYMM') + (LEVEL - 1), 'D') d,
            TO_CHAR(TO_DATE(:yyyymm, 'YYYYMM') + (LEVEL), 'IW') iw
    FROM dual
    CONNECT BY LEVEL <=         /*TO_CHAR(LAST_DAY(TO_DATE(:yyyymm, 'YYYYMM')), 'DD'))*/        --before
    GROUP BY dt - (d - 1)
    ORDER BY dt - (d - 1);

--202008 : 42

SELECT dept_h.* , LEVEL, LPAD(' ', (LEVEL - 1) * 3) || deptnm
FROM dept_h
START WITH deptcd = 'dept0'    --시작점은 deptcd = 'dept0'     → XX회사 (최상위 조직) 
CONNECT BY PRIOR deptcd = p_deptcd;

SELECT  LPAD('XX회사' , 15 , '*'),
                LPAD('XX회사' , 15 )
FROM dual;

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
--h_2
SELECT LEVEL , dept_h.*
FROM dept_h
START WITH deptcd = 'dept0_02'
CONNECT BY PRIOR deptcd = p_deptcd;

SELECT *
FROM dept_h;

-- 디자인 팀(dept0_00_0)을 기준으로 상향식 계층쿼리 작성
-- 자기 부서의 부모 부서와 연결을 한다.
SELECT dept_h.* , LEVEL
FROM dept_h
START WITH deptcd = 'dept0_00_0'
CONNECT BY PRIOR p_deptcd = deptcd;
'디자인%' ; /*PRIOR 는 내가 읽은 행*/

--조인 조건이 한컬럼에서만 적용가능한가?
SELECT *
FROM tab_a, tab_b
WHERE tab_a. a = tab_b.a
AND     tab_a.b = tab_b.b;

hr_3
SELECT dept_h.* , LEVEL, LPAD(' ' , (LEVEL - 1) * 10) || deptnm deptnm
FROM dept_h
START WITH deptcd = 'dept0_00_0'
CONNECT BY PRIOR p_deptcd = deptcd;

SELECT *
FROM h_sum;

hr4
SELECT LPAD( ' ' , ( LEVEL - 1) * 10) || s_id AS s_id, value 
FROM h_sum
START WITH s_id = 0
CONNECT BY PRIOR s_id = ps_id;

SELECT *
FROM no_emp;

SELECT LPAD ( ' ' , (LEVEL - 1 ) * 10 ) || org_cd  AS org_cd, no_emp
FROM no_emp
START WITH org_cd = 'XX회사'
CONNECT BY PRIOR org_cd = parent_org_cd;

-- pruning branch (가지치기)
-- 계층 쿼리의 실행순서
-- FROM → START WITH → CONNECT BY → WHERE
-- 조건을 CONNECT BY 에 기술한 경우
-- . 조건에 따라 다음 ROW로 연결이 안되고 종료
-- 조건을 WHERE 절에 기술한 경우
-- . START WITH ~ CONNECT BY 절에 의해 계층형으로 나온 결과에 
--   WHERE 절에 기술한 결과 값에 해당하는 데이터만 조회

--최상위 노드에서 하향식으로 탐색
-- CONNECT BY 절에 deptnm != '정보기획부' 조건을 기술한 경우
SELECT *
FROM dept_h
START WITH deptcd = 'dept0'
CONNECT BY PRIOR deptcd = p_deptcd AND deptnm != '정보기획부';

--최상위 노드에서 하향식으로 탐색
-- WHERE 절에 deptnm != '정보기획부' 조건을 기술한 경우
-- 계층 쿼리를 실행하고나서 최종 결과에 WHERE절 조건을 적용
SELECT *
FROM dept_h
WHERE  deptnm != '정보기획부'
START WITH deptcd = 'dept0'
CONNECT BY PRIOR deptcd = p_deptcd;

--계층 쿼리에서 사용 가능한 특수 함수
-- CONNECT_BY _ROOT (col) 가장 최상위 row의 col 정보 값 조회
-- SYS_CONNECT_BY_PATH(col , 구분자) : 최상위 row에서 현재 row까지 col값을 구분자로 연결해준 문자열
-- (Ex : XX회사 - 디자인부 - 디자인팀)
-- CONNECT_BY_ISLEAF : 해당 row가 마지막 노드인지 (leaf Node)
-- leaf node : 1, node : 0
SELECT deptcd , LPAD( '  ', 4*(LEVEL - 1)) || deptnm,
                CONNECT_BY_ROOT(deptnm) c_root,
                LTRIM ( SYS_CONNECT_BY_PATH (deptnm , '-' ) , '-' ) sys_path,    --LTRIM 왼쪽의 구분자를 없애준다.
                CONNECT_BY_ISLEAF isleaf
FROM dept_h
START WITH deptcd = 'dept0'
CONNECT BY PRIOR deptcd = p_deptcd;

h6
SELECT seq, LPAD ( ' ' , 10 * (LEVEL - 1 ) ) || title AS title
FROM board_test
START WITH parent_seq IS NULL
CONNECT BY PRIOR seq = parent_seq;

h7
SELECT seq, LPAD ( ' ' , 10 * (LEVEL - 1 ) ) || title AS title
FROM board_test
START WITH parent_seq IS NULL
CONNECT BY PRIOR seq = parent_seq
ORDER BY seq DESC;

h8
SELECT seq, LPAD ( ' ' , 10 * (LEVEL - 1 ) ) || title AS title
FROM board_test
START WITH parent_seq IS NULL
CONNECT BY PRIOR seq = parent_seq
ORDER SIBLINGS BY seq DESC;

h9

SELECT seq, LPAD ( ' ' , 10 * (LEVEL - 1 ) ) || title AS title, CONNECT_BY_ROOT(seq) s_root
FROM board_test
START WITH parent_seq IS NULL
CONNECT BY PRIOR seq = parent_seq
ORDER BY s_root DESC, seq ASC ;

SELECT CONNECT_BY _ROOT (seq)
FROM board_test;





