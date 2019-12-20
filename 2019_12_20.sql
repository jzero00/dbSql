-- ��� ��ȣ, ��� �̸�, �μ���ȣ �޿�, �μ����� ��ü �޿���
SELECT  empno, ename, deptno, sal,
                --���� ó������ ���������
                SUM(sal) OVER (ORDER BY sal
                ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) c_sum,
                
                --�ٷ� ���� ���̶� ����������� �޿���
                SUM(sal) OVER(ORDER BY sal
                ROWS BETWEEN 1 PRECEDING AND CURRENT ROW ) c_sum2

FROM emp
ORDER BY sal;

SELECT  empno, ename, deptno, sal,
                SUM(sal) OVER (PARTITION BY DEPTNO ORDER BY sal ASC, empno ASC) c_sum
FROM emp;


--ROWS vs RANGE ���� Ȯ���ϱ�
SELECT  empno, ename, deptno, sal,
                SUM (sal) OVER (ORDER BY sal ROWS UNBOUNDED PRECEDING ) row_sum,
                SUM (sal) OVER (ORDER BY sal RANGE UNBOUNDED PRECEDING ) range_sum,
                SUM (sal) OVER (ORDER BY sal) c_sum
FROM emp;