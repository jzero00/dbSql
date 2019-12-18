-- WITH
-- WITH ���̸� AS (
--      ��������
-- )

-- SELECT *
-- FROM ���̸�

-- deptno, avg(sal) avg_sal
-- �ش� �μ��� �޿� ����� ��ü ������ �޿� ��պ��� ���� �μ��� ���� ��ȸ
SELECT deptno, AVG(sal) avg_sal
FROM emp
/*WHERE avg(sal) > (��ü���� �޿� ���) �� �ȵ�*/
GROUP BY deptno
HAVING avg(sal) > (SELECT AVG(sal) FROM emp);

-- WITH ���� ����Ͽ� ���� ������ �ۼ�
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

--���� �������� ���� ���
WITH test AS (
        SELECT 1, 'TEST1' FROM dual UNION ALL
        SELECT 2, 'TEST2' FROM dual UNION ALL
        SELECT 3, 'TEST3' FROM dual)
SELECT *
FROM test;

--�������� ���� ���� �ٲٴ� ���
--���� ����
--�޷� �����
-- CONNECT BY LEVEL <= N
-- ���̺��� ROW �Ǽ��� N��ŭ �ݺ��Ѵ�.
-- CONNECT BY LEVEL ���� ����� ����������
-- SELECT ������ LEVEL �̶�� Ư�� �÷��� ����� �� �ִ�.
-- ������ ǥ���ϴ� Ư�� �÷����� 1������ �����ϸ� ROWNUM�� �����ϳ�
-- ���Ŀ� ���� �� START WITH, CONNECT BY ������ �ٸ� ���� ���� �ȴ�.

--201911���� 30�ϱ��� ����
--201911
--���� + ���� = ������ŭ �̷��� ����
--201911 �� �ش� ����� ��¥�� ���ϱ��� �����ϴ°�?

SELECT TO_DATE(:yyyymm, 'yyyymm') + (LEVEL - 1)
FROM dual
CONNECT BY LEVEL <= 30;

SELECT TO_CHAR( LAST_DAY ( TO_DATE (:yyyymm, 'YYYYMM')), 'DD')
FROM dual;

SELECT /* �Ͽ����̸� ��¥ ,  ȭ�����̸� ��¥ , ... ������̸� ��¥*/
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



SELECT /* �Ͽ����̸� ��¥ ,  ȭ�����̸� ��¥ , ... ������̸� ��¥*/
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

--�١ڡ١ڡ١ڡ١ڡ١ڡ١ڡ١ڡ١ڡ١ڡ١ڡ١ڡ١ڡ١ڡ١ڡ١ڡ١ڡ١ڡ١ڼ���
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

/*dept_h ����*/
SELECT dept_h.* , LEVEL
FROM dept_h
START WITH deptcd = 'dept0'    --�������� deptcd = 'dept0'     �� XXȸ�� (�ֻ��� ����) 
CONNECT BY PRIOR deptcd = p_deptcd
;


/*
    dept0  (XXȸ��)
            dept0_00 (�����κ�)
                    dept0_00_0 (��������)
            dept0_01 (���� ��ȹ��)
                    dept0_01_0 (��ȹ��)
                            dept0_00_0_0	(��ȹ��Ʈ)
            dept0_02	(�����ý��ۺ�)
                    dept0_02_0	(����1��)
                    dept0_02_1	(����2��)
*/



