--날짜 관련 함수
--ROUND, TRUNC
-- (MONTHS_BETWEEN), ADD_MONTHS, NEXT_DAY
--LAST_DAY : 해당 날짜가 속한 원의 마지막 일자 (DATE)


--월 :1, 3, 5, 7, 8, 10, 12월 : 31일
--      : 2 - 윤년 여부 28, 29일
--      :4, 6, 9, 11 : 30일

SELECT SYSDATE, LAST_DAY(SYSDATE)
FROM dual;


--fn3

-- '201912' → date 타입으로 변경하기
-- 해당 날짜의 마지막 날짜로 이동
-- 일자 필드만 추출하기

SELECT  '201912' param1,
        TO_CHAR(LAST_DAY(TO_DATE('201912','YYYYMM')),'DD') dt1,
        '201911' param2,
        TO_CHAR(LAST_DAY(TO_DATE('201911','YYYYMM')),'DD') dt2,
        '201602' param3,
        TO_CHAR(LAST_DAY(TO_DATE('201602','YYYYMM')),'DD') dt3
FROM dual;

SELECT :yyyymm param,
        TO_CHAR(LAST_DAY(TO_DATE(:yyyymm,'YYYYMM')),'DD') dt3
FROM dual;

-- SYSDATE를 YYYY/MM/DD 포맷의 문자열로 변경 (DATE → CHAR)
SELECT TO_CHAR(SYSDATE,'YYYY/MM/DD') today
FROM dual;

-- 날짜열로 다시 바꾸기
SELECT TO_DATE(TO_CHAR(SYSDATE,'YYYY/MM/DD')) today
FROM dual;

-- YYYY-MM-DD HH24:MI:SS 문자열로 변경
SELECT TO_CHAR(SYSDATE,'YYYY-MM-DD HH24:MI:SS')
FROM dual;

DESC emp;
--EMPNO    NOT NULL NUMBER(4) 
--HIREDATE          DATE    
--empno가 7369인 직원정보 조회하기
EXPLAIN PLAN FOR
SELECT *
FROM emp
WHERE empno = 7300+'69'; -- 69 숫자로 변경

SELECT *
FROM TABLE(dbms_xplan.display);


SELECT *
FROM emp
WHERE hiredate >= TO_DATE('1981/03/01', 'YYYY/MM/DD');

SELECT *
FROM emp
WHERE hiredate >= TO_DATE('81/06/01', 'RR/MM/DD');

SELECT  TO_DATE('50/05/05', 'RR/MM/DD'),
        TO_DATE('49/05/05', 'RR/MM/DD'),
        TO_DATE('49/05/05', 'YY/MM/DD'),
        TO_DATE('49/05/05', 'YY/MM/DD')
FROM dual;


--숫자 → 문자열
--문자열 → 숫자
--숫자 : 1000000 → 1,000,000.00 (한국)
--숫자 : 1000000 → 1.000.000,00 (독일)
--날짜 포맷 : YYYY, MM, DD, HH24, MI, SS
--숫자 포맷 : 숫자 표현 : 9, 자리맞춤을 위한 0표시 : 0, 황폐단위 : L
--           1000자리 구분 : , 소수점 : .
--숫자 → 문자열 TO_CHAR(숫자, '포맷')
--숫자 포맷이 길어질 경우 숫자 자리수를 충분히 표현해줘야 한다.
SELECT empno, ename, sal, TO_CHAR(sal, 'L009,999') fm_sal
FROM emp;

SELECT TO_CHAR(10000000000, '999,999,999,999')
FROM dual;

--NULL처리 함수 : NVL, NVL2, NILLIF, COALESCE

--NVL(expr1, expr2) : 함수인자 두개
--expr1이 NULL이면 expr2를 반환
--expr1이 NULL이 아니면, expr1을 반환

SELECT empno, ename, comm, NVL(comm, -1) nvl_comm
FROM emp;

--NVL2 (expr1, expr2, expr3)
--expr1 IS NOT NULL expr 리턴
--expr2 IS NULL expr3 리턴

SELECT empno, ename, comm, NVL2(comm, 1000, -500) nvl_comm,
        NVL2(comm, comm, -500) nv2_comm
FROM emp;

--NULLIF(expr1, expr2)
--expr1 = expr2 NULL을 리턴
--expr1 != expr2 expr1을 리턴

--comm이 NULL일때 comm+500 : NULL
--  NULLIF(NULL, NULL) : NULL
--comm이 NULL이 아닐때 comm+500 : comm+500
--  NULLIF(comm, comm+500) : comm
SELECT empno, ename, comm, NULLIF(comm, comm+500) nullif_comm
FROM emp;

--COALESCE(expr1, expr2, expr3,....)
--인자중에 첫번째로 등장하는 NULL이 아닌 exprN을 리턴
--expr1 IS NOT NULL expr1을 리턴하고
--expr1 IS NULL COALESCE (expr2, expr3..)

SELECT empno, ename, comm, sal, COALESCE(comm, sal) coal_sal
FROM emp;

--fn4
SELECT  empno, ename, mgr,
        nvl(mgr, '9999') mgr_n,
        nvl2(mgr , mgr , 9999) mgr_n_1,
        COALESCE(mgr, 9999) mgr_n_2
FROM emp;

--fn5
SELECT  userid, usernm, reg_dt,
        nvl(reg_dt, SYSDATE)n_reg_dt
FROM users
WHERE userid NOT IN ('brown');

--condition
--case
--emp. job 컬럼을 기준으로
--'SALESMAN'이면 sal*1.05를 적용한 값 리턴
--'MANAGER'이면 sal*1.10을 적용한 값 리턴
--'PRESIDENT'이면 sal*1.20을 적용한 값 리턴
--위 3가지 직군이 아닐 경우 sal 리턴
--empno, ename, job, sal, 요율 적용한 급여 AS bonus

SELECT  empno, ename, job, sal,
        CASE
            WHEN job = 'SALESMAN'  THEN sal * 1.05
            WHEN job = 'MANAGER'   THEN sal * 1.10
            WHEN job = 'PRESIDENT' THEN sal * 1.20
            ELSE sal
        END bonus,
        comm,
        
        
        --NULL처리 함수 사용하지 않고 CASE절을 이용해
        --comm이 NULL일 경우 -10을 리턴
        CASE
            WHEN comm IS NULL THEN -10
            ELSE comm
        END comm_mod
FROM emp;

--DECODE
SELECT empno, ename, job, sal,
        DECODE(job, 'SALESMAN'   ,   sal * 1.05,
                    'MANAGER'    ,   sal * 1.10,
                    'PRESIDENT'  ,   sal * 1.20,
                                     sal) bonus
FROM emp;

--과제 실습 1,2번
SELECT  empno, ename, deptno,
        DECODE( deptno, 10, 'ACCOUNTING',
                        20, 'RESEARCH'  ,
                        30, 'SALES'     ,
                        40, 'OPERATIONS',
                            'DDIT') dname
FROM emp;


SELECT  empno, ename, hiredate
        ,CASE
        WHEN MOD(TO_CHAR(hiredate, 'YYYY') , 2)
        = MOD(TO_CHAR(SYSDATE, 'YYYY') , 2) THEN '건강검진 대상자'
            ELSE '건강검진 비대상자'
        END
FROM emp;

SELECT  empno, ename, hiredate,
        CASE
            WHEN 
                MOD(TO_CHAR(hiredate, 'YYYY') , 2) = 
                MOD(TO_CHAR(SYSDATE, 'YYYY') , 2)
            THEN '건강검진 대상자'
            ELSE '건강검진 비대상자'
        END contact_to_doctor
FROM emp;






