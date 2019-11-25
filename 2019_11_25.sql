-- row_1 : emp 테이블에서(empno, enmae) 정렬없이 조회하고, ROWNUM이 1~10인 행만 조회
SELECT ROWNUM, empno, ename
FROM emp
WHERE ROWNUM BETWEEN 1 AND 10;

--row_2 : ROWNUM이 11~14인 행만 조회
SELECT *
FROM
(SELECT ROWNUM rn, empno, ename
FROM emp)
WHERE rn BETWEEN 11 AND 14;

--roW_3
SELECT rn, empno, ename
FROM
    (SELECT ROWNUM rn, a.*
     FROM
        (SELECT empno, ename
         FROM emp
         ORDER BY ename) a)
WHERE rn BETWEEN 11 AND 14;

--DUAL 테이블 : sys 계정에 있는 누구나 사용가능한 테이블이며,
--한 행만 존재하며 컬럼(dummy)도 하나 존재
SELECT *
FROM dual;

-- SINGLE EOW FUNCTION : 행당 한번의 FUNCTION이 실행
-- 1개의 행 INPUT → 1개의 행으로 OUTPUT (COLUMN)
-- 'Hello, World'
-- dual 테이블에는 데이터가 아니라 하나의 행만 존재한다. 결과도 하나의 행으로 나온다.

SELECT LOWER('Hello, World'), UPPER('Hello, World'),
INITCAP ('Hello, World')
FROM dual;

SELECT LOWER('Hello, World'), UPPER('Hello, World'),
INITCAP ('Hello, World')
FROM emp;

--컬럼에 function 적용
SELECT empno, LOWER (ename) low_enm
FROM emp
WHERE ename = UPPER('smith');   --직원이름이 smith인 사람을 조회하려면 대문자/소문자?


-- 테이블 컬럼을 가공해도 동일한 결과를 얻을 수 있지만
-- 테이블 컬럼보다는 상수쪽을 가공하는 것이 속도면에서 유리
-- 해당 컬럼에 인덱스가 존재하더라도 함수를 적용하게 되면 값이 달라지게 되어
-- 인덱스를 활용할 수 없게 된다.
-- 예외 : FBI (Function Based Index)
SELECT UPPER('smith')
FROM dual;

-- HELLO
-- ,
-- WORLD
-- HELLO, WORLD (위 3가지 문자열 상수를 이용, CONCAT 함수를 사용하여 문자열 결합)
SELECT CONCAT (CONCAT ('HELLO', ', ') , 'WOLRD') c1,
       CONCAT ('HELLO', ', ') c2,
       'HELLO' || ', ' || 'WORLD',
       
    --시작 인덱스는 1부터, 종료 인덱스 문자열까지 포함한다.
       SUBSTR ('HELLO, WORLD', 1, 5) s1, --SUBSTR(문자열, 시작인덱스, 종료인덱스)

    --INSTR : 문자열에 특정 문자열이 존재하는지, 존재할 경우 문자의 인덱스를 리턴
    INSTR('HELLO, WORLD', 'O') i1,     -- 5, 9
    --'HELLO, WORLD' 문자열의 6번째 인덱스 이후에 등장하는 '0'문자열의 인덱스 리턴
    INSTR('HELLO, WORLD', 'O', 6) i2,   -- 문자열의 특정 인덱스 이후부터 검색하도록 옵션
    INSTR('HELLO, WORLD', 'O', INSTR('HELLO, WORLD', 'O') +1 ) i3,
    
    --L/RPAD 특정 문자열의 왼쪽/오른쪽에 설정한 문자열 길이보다 부족한 만큼 문자열을 채워넣는다    
    LPAD('HELLO, WORLD', 15, '*') L1,
    LPAD('HELLO, WORLD', 15) L2,        --DEFAULT 채움 문자는 공백이다.
    ---***HELLO, WORLD
    RPAD('HELLO, WORLD', 15, '*') R1,
    
    --REPLACE (대상문자열, 검색 문자열, 변경할 문자열)
    --대상 문자열에서 검색 문자열을 변경할 문자열로 치환
    REPLACE('HELLO, WORLD', 'HELLO', 'hello') rep1,  --hello, WORLD
    
    --문자열 앞, 뒤의 공백을 제거
    '   HELLO, WORLD   ' before_trim,
    TRIM('   HELLO, WORLD   ') after_trim,
    TRIM('H' FROM 'HELLO, WORLD   ') after_trim2   
FROM dept;


--숫자 조작함수
--ROUND : 반올림       - ROUND(숫자, 반올림 자리)
--TRUNC : 절삭        -TRUNC(숫자, 절삭자리)
--MOD : 나머지 연산 MOD (피제수, 제수) //MOD(5,2) : 1

SELECT --반올림 결과가 소수점 한자리 까지 나오도록 (소수점 둘째자리에서 반올림)
    ROUND(105.51,1) r1,
    ROUND(105.55,1) r2,
    ROUND(105.55,0) r3,  -- 소수점 첫번째 자리에서 반올림
    ROUND(105.55,-1) r4  -- 정수 첫번째 자리에서 반올림
FROM dual;

SELECT --절삭의 결과가 소수점 한자리 까지 나오도록 (소수점 둘째자리에서 절삭)
    TRUNC(105.51,1)  t1,
    TRUNC(105.55,1)  t2,
    TRUNC(105.55,0)  t3,  -- 소수점 첫번째 자리에서 절삭
    TRUNC(105.55,-1) t4  -- 정수 첫번째 자리에서 절삭
FROM dual;

--MOD(피제수, 제수) 피제수를 제수로 나누 값
--MOD(M,2) 의 결과 종류 : 0, 1 (0~ 제수-1 )
SELECT MOD (5,2) M1 -- 5/2 : 몫이 2, 나머지가 1
FROM dual;

--emp 테이블의 sal 컬럼을 1000으로 나누었을 때 사원별 나머지 값을 조회하는 sql 작성
--ename, sal, sal/1000의 몫, sal/1000의 나머지
SELECT  ename, sal,
        TRUNC (sal/1000) 몫,     --0번쨰 자리는 생략 가능
        MOD (sal,1000) 나머지,
        TRUNC (sal/1000) * 1000 + MOD (sal,1000) sal2
FROM emp;

--DATE : 년 월 일 시간, 분, 초
SELECT ename, hiredate, TO_CHAR(hiredate, 'YYYY/MM/DD hh24:mi:ss')--YYYY/MM/DD
FROM emp;

--SYSDATE : 서버의 현재 DATE를 리턴하는 내장함수, 특별한 인자가 없다.
--DATE 연산 + 정수 N = DATE에 N일자 만큼 더한다
--DATE 연산에 있어서 정수는 일자
--하루는 24시간
--DATE 타입에 시간을 더할 수 있다 1시간 = 1/24

SELECT  TO_CHAR(SYSDATE + 5, 'YYYY-MM-DD hh24:mi:ss') AFTER5days,
        TO_CHAR(SYSDATE + 5/24, 'YYYY-MM-DD hh24:mi:ss') AFTERhour,
        TO_CHAR(SYSDATE + 5/24/60, 'YYYY-MM-DD hh24:mi:ss') AFTER5min
FROM dual;

-- fn1
--1. 2019년 12월 31일을 date형으로 표현
--2. 12월 31일을 date형으로 표현하고 5일 이전 날짜
--3. 현재날짜
--4. 현재 날짜에서 3일 전 값
SELECT  TO_DATE('20191231', 'YYYY/MM/DD') lastday,
        TO_DATE('20191231', 'YYYY/MM/DD')-5 lastday_before5days,
        TO_CHAR(SYSDATE, 'YY/MM/DD') now,
        TO_CHAR(SYSDATE -3 , 'YY/MM/DD') now_before3days
FROM dual;

--YYYY,MM,DD, D (요일을 숫자로 : 일요일 : 1, 월요일 2, 화요일3.... 토요일 : 7)
--IW (주차 1~53), HH, MI, SS
SELECT    TO_CHAR(SYSDATE, 'YYYY') YYYY     --현재 년도
         ,TO_CHAR(SYSDATE, 'MM') MM         --현재월
         ,TO_CHAR(SYSDATE, 'DD') DD         --현대일
         ,TO_CHAR(SYSDATE, 'D') D           --현재 요일 (주간일자 1~7)
         ,TO_CHAR(SYSDATE, 'IW') IW         --현재 일자 주차(해당 주의 목요일을 주차의 기준으로)
--2019년 12월 31일은 몇주차가 나오는가?
         ,TO_CHAR(TO_DATE('20191231', 'YYYY/MM/DD'), 'IW') IW 
FROM dual;

--f2
SELECT
         TO_CHAR(SYSDATE, 'YYYY-MM-DD') DT_DASH
        ,TO_CHAR(SYSDATE, 'YYYY-MM-DD HH:MI:SS') dt_dash_with_time
        ,TO_CHAR(SYSDATE, 'DD-MM-YYYY') dt_dd_mm_yyyy
FROM dual;

--DATE 타입의 ROUND, TRUNC 적용
SELECT  TO_CHAR(SYSDATE, 'YYYY-MM-DD hh24:mi:ss') now
        --MM에서 절삭
        ,TO_CHAR(ROUND(SYSDATE, 'YYYY'), 'YYYY-MM-DD hh24:mi:ss') now_YYYY
        --DD에서 절삭
        ,TO_CHAR(ROUND(SYSDATE, 'MM'), 'YYYY-MM-DD hh24:mi:ss') now_MM
        --시간에서 절삭 (현재시간 → 0시)
        ,TO_CHAR(ROUND(SYSDATE, 'DD'), 'YYYY-MM-DD hh24:mi:ss') now_DD
FROM dual;



--날짜 조작 함수
--MONTHS_BETWEEN(date1, date2)       : date2와 date 1 사이의 개월 수
--ADD_MONTHS(date, 가감할 개월수)      : date에서 특정 개월수를 더하거나 뺀 날짜
--NEXT_DAY(date, weekday(1~7))       : date이후 첫 번째 wekkday 날짜
--LAST_DAT(date)                     : date가 속한 월의 마지막 날짜

--MONTHS_BETWEEN
SELECT MONTHS_BETWEEN  (TO_DATE('20191125', 'yyyy-mm-dd'),
                        TO_DATE('20190325', 'yyyy-mm-dd')) m_bet
                        ,TO_DATE('20191125', 'yyyy-mm-dd')-
                        TO_DATE('20190331', 'yyyy-mm-dd') d_m --두 날짜 사이의 일자수
FROM dual;

--ADD_MONTHS (date, number(+ or -))
SELECT  ADD_MONTHS(TO_DATE('20191125', 'YYYYMMDD'), 5) now_after5m
        ,ADD_MONTHS(TO_DATE('20191125', 'YYYYMMDD'), -5) now_before5m
        ,SYSDATE +100 --100일 뒤의 날짜 (월 개념 3월 31일, 2월 28이나 29일)
FROM dual;

--NEXT_DAY (date, weekday number (1~7))
SELECT NEXT_DAY(SYSDATE,1) -- 오늘 날짜 (2019/11/25)일 이후에 등장하는 첫번째 토요일
FROM dual;