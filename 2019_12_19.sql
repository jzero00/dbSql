SELECT /* 일요일이면 날짜 ,  화요일이면 날짜 , ... 토요일이면 날짜*/
               iw_mod, m
               MAX  ( DECODE ( d , 1 , dt) ) SUN , MAX ( DECODE ( d , 2 , dt) ) MON , MAX ( DECODE ( d , 3 , dt) ) TUE ,
               MAX  ( DECODE ( d , 4 , dt) ) WED ,MAX ( DECODE ( d , 5 , dt) ) THU , MAX ( DECODE ( d , 6 , dt) ) FRI, MAX ( DECODE ( d , 7 , dt) ) SAT

FROM 
            (SELECT    LEVEL, TRUNC (LEVEL - 1 / 7) m,
                                TO_DATE( :yyyymm, 'yyyymm' ) + ( LEVEL - 1 ) dt,
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
GROUP BY m
ORDER BY m;

--사원이름, 사원번호, 전체직원 건수

--ana0
--사원의 부서별 급여별 순위 구하기
SELECT a.ename, a.sal, a.deptno, b.rn sal_rank
FROM
            (SELECT ename, sal, deptno , ROWNUM j_rn
            FROM emp)a,
            
            (SELECT rn, ROWNUM j_rn
            FROM
                            (SELECT a.rn, b.*,ROWNUM
                            FROM
                                        (SELECT ROWNUM rn
                                        FROM dual
                                        CONNECT BY LEVEL <= (SELECT COUNT(*) FROM emp)) a,
                                        
                                        (SELECT deptno, COUNT(*) cnt
                                        FROM emp
                                        GROUP BY deptno) b
                            WHERE b.cnt >= a.rn
                            ORDER BY b.deptno,a.rn)
                            ) b
WHERE a.j_rn = b.j_rn;

--ana0 을 분석함수로
SELECT ename, sal, deptno,
                RANK() OVER(PARTITION BY deptno ORDER BY sal DESC) sal_rank
FROM emp;


SELECT ename, sal, deptno,
                RANK() OVER(PARTITION BY deptno ORDER BY sal ) rank,
                DENSE_RANK() OVER(PARTITION BY deptno ORDER BY sal ) dense_rank,
                ROW_NUMBER() OVER(PARTITION BY deptno ORDER BY sal ) row_number
FROM emp;

--ana1
SELECT empno, ename, sal, deptno,
                ROW_NUMBER() OVER(ORDER BY sal DESC, empno) sal_rank,
                RANK() OVER(ORDER BY sal DESC, empno) rank,
                ROW_NUMBER() OVER(ORDER BY sal DESC, empno) sal_row_number
FROM emp;

--no_ana2
SELECT emp.empno, emp.ename,  a.*
FROM emp,   (SELECT deptno, COUNT(deptno) cnt
                        FROM emp
                        GROUP BY deptno) a
WHERE emp.deptno = a.deptno
ORDER BY emp.deptno,emp.empno;

--사원번호, 사원 이름, 부서번호, 부서의 직원수
SELECT empno, ename, deptno,
                COUNT(*) OVER(PARTITION BY deptno) cnt
FROM emp;

--ana2
SELECT empno, ename, sal, deptno,
                ROUND(AVG(sal) OVER(PARTITION BY deptno) ,2) avg
FROM emp;

--ana3
SELECT empno, ename, sal, deptno,
                MAX(sal) OVER(PARTITION BY deptno)  max_sal
FROM emp;

--ana4
SELECT empno, ename, sal, deptno,
                MIN(sal) OVER(PARTITION BY deptno)  max_sal
FROM emp;

--ana5
--전체사원을 대상으로 급여순위가 자신보다 한단계 낮은 사람의 급여
--급여가 같을 경우 입사일자가 빠른 사람이 높은 순위
SELECT empno, ename, hiredate, sal,
                LEAD(sal) OVER(ORDER BY sal DESC, hiredate) lead_sal
FROM emp;

SELECT empno, ename, hiredate, sal,
                LAG(sal) OVER(ORDER BY sal DESC, hiredate) lead_sal
FROM emp;

--ana6
SELECT empno, ename, hiredate, job, sal,
                LAG(sal) OVER(PARTITION BY job ORDER BY sal DESC, job, hiredate ASC) lag_sal
FROM emp;



--no_ana3
SELECT s1.empno, s1.ename, s1.sal1 AS sal , SUM(s2.sal2) c_sal
FROM
            (SELECT s1.* , ROWNUM rn1
            FROM
                        (SELECT empno, ename, sal AS sal1
                        FROM emp
                        ORDER BY sal) s1)s1,

(SELECT s2.* , ROWNUM rn2
FROM
            (SELECT sal AS sal2
            FROM emp
            ORDER BY sal) s2)s2
WHERE s2.rn2 <= s1.rn1
GROUP BY s1.empno, s1.ename, s1.sal1
ORDER BY sal;


SELECT *
FROM emp;
