-- 사원 번호, 사원 이름, 부서번호 급여, 부서원의 전체 급여합
SELECT  empno, ename, deptno, sal,
                --가장 처음부터 현재행까지
                SUM(sal) OVER (ORDER BY sal
                ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) c_sum,
                
                --바로 이전 행이랑 현재행까지의 급여합
                SUM(sal) OVER(ORDER BY sal
                ROWS BETWEEN 1 PRECEDING AND CURRENT ROW ) c_sum2

FROM emp
ORDER BY sal;

SELECT  empno, ename, deptno, sal,
                SUM(sal) OVER (PARTITION BY DEPTNO ORDER BY sal ASC, empno ASC) c_sum
FROM emp;


--ROWS vs RANGE 차이 확인하기
SELECT  empno, ename, deptno, sal,
                SUM (sal) OVER (ORDER BY sal ROWS UNBOUNDED PRECEDING ) row_sum,
                SUM (sal) OVER (ORDER BY sal RANGE UNBOUNDED PRECEDING ) range_sum,
                SUM (sal) OVER (ORDER BY sal) c_sum
FROM emp;