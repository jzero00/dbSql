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

--201910 : 35 , ù��¥, ������ ��¥ ù���� �Ͽ��� : 9/29 ������ ���� ����� ��¥ :  11/2
/* �� (1), ��(2) ȭ (3) ��(4) ��(5) ��(6) ��(7) */
SELECT *
FROM
(SELECT  LAST_DAY(TO_DATE(:yyyymm, 'YYYYMM')) ldt,

                TO_CHAR(LAST_DAY(TO_DATE(:yyyymm, 'YYYYMM')) , 'D') +
                7 - TO_CHAR(LAST_DAY(TO_DATE(:yyyymm, 'YYYYMM')) , 'D') dt,
                
                TO_DATE(:yyyymm, 'YYYYMM') -
                (TO_CHAR(TO_DATE(:yyyymm, 'YYYYMM') , 'D' ) - 1 ) fdt
FROM dual);


SELECT
                MAX(DECODE(d, 1, dt) ) ��, MAX(DECODE(d, 2, dt) )) ��, MAX(DECODE(d, 3, dt) )) ȭ,
                MAX(DECODE(d, 4, dt) ) ��, MAX(DECODE(d, 5, dt) ) ��, MAX(DECODE(d, 6, dt) ) ��, MAX (DECODE(d, 7, dt) ) ��
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
START WITH deptcd = 'dept0'    --�������� deptcd = 'dept0'     �� XXȸ�� (�ֻ��� ����) 
CONNECT BY PRIOR deptcd = p_deptcd;

SELECT  LPAD('XXȸ��' , 15 , '*'),
                LPAD('XXȸ��' , 15 )
FROM dual;

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
--h_2
SELECT LEVEL , dept_h.*
FROM dept_h
START WITH deptcd = 'dept0_02'
CONNECT BY PRIOR deptcd = p_deptcd;

SELECT *
FROM dept_h;

-- ������ ��(dept0_00_0)�� �������� ����� �������� �ۼ�
-- �ڱ� �μ��� �θ� �μ��� ������ �Ѵ�.
SELECT dept_h.* , LEVEL
FROM dept_h
START WITH deptcd = 'dept0_00_0'
CONNECT BY PRIOR p_deptcd = deptcd;
'������%' ; /*PRIOR �� ���� ���� ��*/

--���� ������ ���÷������� ���밡���Ѱ�?
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
START WITH org_cd = 'XXȸ��'
CONNECT BY PRIOR org_cd = parent_org_cd;

-- pruning branch (����ġ��)
-- ���� ������ �������
-- FROM �� START WITH �� CONNECT BY �� WHERE
-- ������ CONNECT BY �� ����� ���
-- . ���ǿ� ���� ���� ROW�� ������ �ȵǰ� ����
-- ������ WHERE ���� ����� ���
-- . START WITH ~ CONNECT BY ���� ���� ���������� ���� ����� 
--   WHERE ���� ����� ��� ���� �ش��ϴ� �����͸� ��ȸ

--�ֻ��� ��忡�� ��������� Ž��
-- CONNECT BY ���� deptnm != '������ȹ��' ������ ����� ���
SELECT *
FROM dept_h
START WITH deptcd = 'dept0'
CONNECT BY PRIOR deptcd = p_deptcd AND deptnm != '������ȹ��';

--�ֻ��� ��忡�� ��������� Ž��
-- WHERE ���� deptnm != '������ȹ��' ������ ����� ���
-- ���� ������ �����ϰ��� ���� ����� WHERE�� ������ ����
SELECT *
FROM dept_h
WHERE  deptnm != '������ȹ��'
START WITH deptcd = 'dept0'
CONNECT BY PRIOR deptcd = p_deptcd;

--���� �������� ��� ������ Ư�� �Լ�
-- CONNECT_BY _ROOT (col) ���� �ֻ��� row�� col ���� �� ��ȸ
-- SYS_CONNECT_BY_PATH(col , ������) : �ֻ��� row���� ���� row���� col���� �����ڷ� �������� ���ڿ�
-- (Ex : XXȸ�� - �����κ� - ��������)
-- CONNECT_BY_ISLEAF : �ش� row�� ������ ������� (leaf Node)
-- leaf node : 1, node : 0
SELECT deptcd , LPAD( '  ', 4*(LEVEL - 1)) || deptnm,
                CONNECT_BY_ROOT(deptnm) c_root,
                LTRIM ( SYS_CONNECT_BY_PATH (deptnm , '-' ) , '-' ) sys_path,    --LTRIM ������ �����ڸ� �����ش�.
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





