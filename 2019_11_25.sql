-- row_1 : emp ���̺���(empno, enmae) ���ľ��� ��ȸ�ϰ�, ROWNUM�� 1~10�� �ุ ��ȸ
SELECT ROWNUM, empno, ename
FROM emp
WHERE ROWNUM BETWEEN 1 AND 10;

--row_2 : ROWNUM�� 11~14�� �ุ ��ȸ
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

--DUAL ���̺� : sys ������ �ִ� ������ ��밡���� ���̺��̸�,
--�� �ุ �����ϸ� �÷�(dummy)�� �ϳ� ����
SELECT *
FROM dual;

-- SINGLE EOW FUNCTION : ��� �ѹ��� FUNCTION�� ����
-- 1���� �� INPUT �� 1���� ������ OUTPUT (COLUMN)
-- 'Hello, World'
-- dual ���̺��� �����Ͱ� �ƴ϶� �ϳ��� �ุ �����Ѵ�. ����� �ϳ��� ������ ���´�.

SELECT LOWER('Hello, World'), UPPER('Hello, World'),
INITCAP ('Hello, World')
FROM dual;

SELECT LOWER('Hello, World'), UPPER('Hello, World'),
INITCAP ('Hello, World')
FROM emp;

--�÷��� function ����
SELECT empno, LOWER (ename) low_enm
FROM emp
WHERE ename = UPPER('smith');   --�����̸��� smith�� ����� ��ȸ�Ϸ��� �빮��/�ҹ���?


-- ���̺� �÷��� �����ص� ������ ����� ���� �� ������
-- ���̺� �÷����ٴ� ������� �����ϴ� ���� �ӵ��鿡�� ����
-- �ش� �÷��� �ε����� �����ϴ��� �Լ��� �����ϰ� �Ǹ� ���� �޶����� �Ǿ�
-- �ε����� Ȱ���� �� ���� �ȴ�.
-- ���� : FBI (Function Based Index)
SELECT UPPER('smith')
FROM dual;

-- HELLO
-- ,
-- WORLD
-- HELLO, WORLD (�� 3���� ���ڿ� ����� �̿�, CONCAT �Լ��� ����Ͽ� ���ڿ� ����)
SELECT CONCAT (CONCAT ('HELLO', ', ') , 'WOLRD') c1,
       CONCAT ('HELLO', ', ') c2,
       'HELLO' || ', ' || 'WORLD',
       
    --���� �ε����� 1����, ���� �ε��� ���ڿ����� �����Ѵ�.
       SUBSTR ('HELLO, WORLD', 1, 5) s1, --SUBSTR(���ڿ�, �����ε���, �����ε���)

    --INSTR : ���ڿ��� Ư�� ���ڿ��� �����ϴ���, ������ ��� ������ �ε����� ����
    INSTR('HELLO, WORLD', 'O') i1,     -- 5, 9
    --'HELLO, WORLD' ���ڿ��� 6��° �ε��� ���Ŀ� �����ϴ� '0'���ڿ��� �ε��� ����
    INSTR('HELLO, WORLD', 'O', 6) i2,   -- ���ڿ��� Ư�� �ε��� ���ĺ��� �˻��ϵ��� �ɼ�
    INSTR('HELLO, WORLD', 'O', INSTR('HELLO, WORLD', 'O') +1 ) i3,
    
    --L/RPAD Ư�� ���ڿ��� ����/�����ʿ� ������ ���ڿ� ���̺��� ������ ��ŭ ���ڿ��� ä���ִ´�    
    LPAD('HELLO, WORLD', 15, '*') L1,
    LPAD('HELLO, WORLD', 15) L2,        --DEFAULT ä�� ���ڴ� �����̴�.
    ---***HELLO, WORLD
    RPAD('HELLO, WORLD', 15, '*') R1,
    
    --REPLACE (����ڿ�, �˻� ���ڿ�, ������ ���ڿ�)
    --��� ���ڿ����� �˻� ���ڿ��� ������ ���ڿ��� ġȯ
    REPLACE('HELLO, WORLD', 'HELLO', 'hello') rep1,  --hello, WORLD
    
    --���ڿ� ��, ���� ������ ����
    '   HELLO, WORLD   ' before_trim,
    TRIM('   HELLO, WORLD   ') after_trim,
    TRIM('H' FROM 'HELLO, WORLD   ') after_trim2   
FROM dept;


--���� �����Լ�
--ROUND : �ݿø�       - ROUND(����, �ݿø� �ڸ�)
--TRUNC : ����        -TRUNC(����, �����ڸ�)
--MOD : ������ ���� MOD (������, ����) //MOD(5,2) : 1

SELECT --�ݿø� ����� �Ҽ��� ���ڸ� ���� �������� (�Ҽ��� ��°�ڸ����� �ݿø�)
    ROUND(105.51,1) r1,
    ROUND(105.55,1) r2,
    ROUND(105.55,0) r3,  -- �Ҽ��� ù��° �ڸ����� �ݿø�
    ROUND(105.55,-1) r4  -- ���� ù��° �ڸ����� �ݿø�
FROM dual;

SELECT --������ ����� �Ҽ��� ���ڸ� ���� �������� (�Ҽ��� ��°�ڸ����� ����)
    TRUNC(105.51,1)  t1,
    TRUNC(105.55,1)  t2,
    TRUNC(105.55,0)  t3,  -- �Ҽ��� ù��° �ڸ����� ����
    TRUNC(105.55,-1) t4  -- ���� ù��° �ڸ����� ����
FROM dual;

--MOD(������, ����) �������� ������ ���� ��
--MOD(M,2) �� ��� ���� : 0, 1 (0~ ����-1 )
SELECT MOD (5,2) M1 -- 5/2 : ���� 2, �������� 1
FROM dual;

--emp ���̺��� sal �÷��� 1000���� �������� �� ����� ������ ���� ��ȸ�ϴ� sql �ۼ�
--ename, sal, sal/1000�� ��, sal/1000�� ������
SELECT  ename, sal,
        TRUNC (sal/1000) ��,     --0���� �ڸ��� ���� ����
        MOD (sal,1000) ������,
        TRUNC (sal/1000) * 1000 + MOD (sal,1000) sal2
FROM emp;

--DATE : �� �� �� �ð�, ��, ��
SELECT ename, hiredate, TO_CHAR(hiredate, 'YYYY/MM/DD hh24:mi:ss')--YYYY/MM/DD
FROM emp;

--SYSDATE : ������ ���� DATE�� �����ϴ� �����Լ�, Ư���� ���ڰ� ����.
--DATE ���� + ���� N = DATE�� N���� ��ŭ ���Ѵ�
--DATE ���꿡 �־ ������ ����
--�Ϸ�� 24�ð�
--DATE Ÿ�Կ� �ð��� ���� �� �ִ� 1�ð� = 1/24

SELECT  TO_CHAR(SYSDATE + 5, 'YYYY-MM-DD hh24:mi:ss') AFTER5days,
        TO_CHAR(SYSDATE + 5/24, 'YYYY-MM-DD hh24:mi:ss') AFTERhour,
        TO_CHAR(SYSDATE + 5/24/60, 'YYYY-MM-DD hh24:mi:ss') AFTER5min
FROM dual;

-- fn1
--1. 2019�� 12�� 31���� date������ ǥ��
--2. 12�� 31���� date������ ǥ���ϰ� 5�� ���� ��¥
--3. ���糯¥
--4. ���� ��¥���� 3�� �� ��
SELECT  TO_DATE('20191231', 'YYYY/MM/DD') lastday,
        TO_DATE('20191231', 'YYYY/MM/DD')-5 lastday_before5days,
        TO_CHAR(SYSDATE, 'YY/MM/DD') now,
        TO_CHAR(SYSDATE -3 , 'YY/MM/DD') now_before3days
FROM dual;

--YYYY,MM,DD, D (������ ���ڷ� : �Ͽ��� : 1, ������ 2, ȭ����3.... ����� : 7)
--IW (���� 1~53), HH, MI, SS
SELECT    TO_CHAR(SYSDATE, 'YYYY') YYYY     --���� �⵵
         ,TO_CHAR(SYSDATE, 'MM') MM         --�����
         ,TO_CHAR(SYSDATE, 'DD') DD         --������
         ,TO_CHAR(SYSDATE, 'D') D           --���� ���� (�ְ����� 1~7)
         ,TO_CHAR(SYSDATE, 'IW') IW         --���� ���� ����(�ش� ���� ������� ������ ��������)
--2019�� 12�� 31���� �������� �����°�?
         ,TO_CHAR(TO_DATE('20191231', 'YYYY/MM/DD'), 'IW') IW 
FROM dual;

--f2
SELECT
         TO_CHAR(SYSDATE, 'YYYY-MM-DD') DT_DASH
        ,TO_CHAR(SYSDATE, 'YYYY-MM-DD HH:MI:SS') dt_dash_with_time
        ,TO_CHAR(SYSDATE, 'DD-MM-YYYY') dt_dd_mm_yyyy
FROM dual;

--DATE Ÿ���� ROUND, TRUNC ����
SELECT  TO_CHAR(SYSDATE, 'YYYY-MM-DD hh24:mi:ss') now
        --MM���� ����
        ,TO_CHAR(ROUND(SYSDATE, 'YYYY'), 'YYYY-MM-DD hh24:mi:ss') now_YYYY
        --DD���� ����
        ,TO_CHAR(ROUND(SYSDATE, 'MM'), 'YYYY-MM-DD hh24:mi:ss') now_MM
        --�ð����� ���� (����ð� �� 0��)
        ,TO_CHAR(ROUND(SYSDATE, 'DD'), 'YYYY-MM-DD hh24:mi:ss') now_DD
FROM dual;



--��¥ ���� �Լ�
--MONTHS_BETWEEN(date1, date2)       : date2�� date 1 ������ ���� ��
--ADD_MONTHS(date, ������ ������)      : date���� Ư�� �������� ���ϰų� �� ��¥
--NEXT_DAY(date, weekday(1~7))       : date���� ù ��° wekkday ��¥
--LAST_DAT(date)                     : date�� ���� ���� ������ ��¥

--MONTHS_BETWEEN
SELECT MONTHS_BETWEEN  (TO_DATE('20191125', 'yyyy-mm-dd'),
                        TO_DATE('20190325', 'yyyy-mm-dd')) m_bet
                        ,TO_DATE('20191125', 'yyyy-mm-dd')-
                        TO_DATE('20190331', 'yyyy-mm-dd') d_m --�� ��¥ ������ ���ڼ�
FROM dual;

--ADD_MONTHS (date, number(+ or -))
SELECT  ADD_MONTHS(TO_DATE('20191125', 'YYYYMMDD'), 5) now_after5m
        ,ADD_MONTHS(TO_DATE('20191125', 'YYYYMMDD'), -5) now_before5m
        ,SYSDATE +100 --100�� ���� ��¥ (�� ���� 3�� 31��, 2�� 28�̳� 29��)
FROM dual;

--NEXT_DAY (date, weekday number (1~7))
SELECT NEXT_DAY(SYSDATE,1) -- ���� ��¥ (2019/11/25)�� ���Ŀ� �����ϴ� ù��° �����
FROM dual;