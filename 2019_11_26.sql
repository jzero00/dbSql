--��¥ ���� �Լ�
--ROUND, TRUNC
-- (MONTHS_BETWEEN), ADD_MONTHS, NEXT_DAY
--LAST_DAY : �ش� ��¥�� ���� ���� ������ ���� (DATE)


--�� :1, 3, 5, 7, 8, 10, 12�� : 31��
--      : 2 - ���� ���� 28, 29��
--      :4, 6, 9, 11 : 30��

SELECT SYSDATE, LAST_DAY(SYSDATE)
FROM dual;


--fn3

-- '201912' �� date Ÿ������ �����ϱ�
-- �ش� ��¥�� ������ ��¥�� �̵�
-- ���� �ʵ常 �����ϱ�

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

-- SYSDATE�� YYYY/MM/DD ������ ���ڿ��� ���� (DATE �� CHAR)
SELECT TO_CHAR(SYSDATE,'YYYY/MM/DD') today
FROM dual;

-- ��¥���� �ٽ� �ٲٱ�
SELECT TO_DATE(TO_CHAR(SYSDATE,'YYYY/MM/DD')) today
FROM dual;

-- YYYY-MM-DD HH24:MI:SS ���ڿ��� ����
SELECT TO_CHAR(SYSDATE,'YYYY-MM-DD HH24:MI:SS')
FROM dual;

DESC emp;
--EMPNO    NOT NULL NUMBER(4) 
--HIREDATE          DATE    
--empno�� 7369�� �������� ��ȸ�ϱ�
EXPLAIN PLAN FOR
SELECT *
FROM emp
WHERE empno = 7300+'69'; -- 69 ���ڷ� ����

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


--���� �� ���ڿ�
--���ڿ� �� ����
--���� : 1000000 �� 1,000,000.00 (�ѱ�)
--���� : 1000000 �� 1.000.000,00 (����)
--��¥ ���� : YYYY, MM, DD, HH24, MI, SS
--���� ���� : ���� ǥ�� : 9, �ڸ������� ���� 0ǥ�� : 0, Ȳ����� : L
--           1000�ڸ� ���� : , �Ҽ��� : .
--���� �� ���ڿ� TO_CHAR(����, '����')
--���� ������ ����� ��� ���� �ڸ����� ����� ǥ������� �Ѵ�.
SELECT empno, ename, sal, TO_CHAR(sal, 'L009,999') fm_sal
FROM emp;

SELECT TO_CHAR(10000000000, '999,999,999,999')
FROM dual;

--NULLó�� �Լ� : NVL, NVL2, NILLIF, COALESCE

--NVL(expr1, expr2) : �Լ����� �ΰ�
--expr1�� NULL�̸� expr2�� ��ȯ
--expr1�� NULL�� �ƴϸ�, expr1�� ��ȯ

SELECT empno, ename, comm, NVL(comm, -1) nvl_comm
FROM emp;

--NVL2 (expr1, expr2, expr3)
--expr1 IS NOT NULL expr ����
--expr2 IS NULL expr3 ����

SELECT empno, ename, comm, NVL2(comm, 1000, -500) nvl_comm,
        NVL2(comm, comm, -500) nv2_comm
FROM emp;

--NULLIF(expr1, expr2)
--expr1 = expr2 NULL�� ����
--expr1 != expr2 expr1�� ����

--comm�� NULL�϶� comm+500 : NULL
--  NULLIF(NULL, NULL) : NULL
--comm�� NULL�� �ƴҶ� comm+500 : comm+500
--  NULLIF(comm, comm+500) : comm
SELECT empno, ename, comm, NULLIF(comm, comm+500) nullif_comm
FROM emp;

--COALESCE(expr1, expr2, expr3,....)
--�����߿� ù��°�� �����ϴ� NULL�� �ƴ� exprN�� ����
--expr1 IS NOT NULL expr1�� �����ϰ�
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
--emp. job �÷��� ��������
--'SALESMAN'�̸� sal*1.05�� ������ �� ����
--'MANAGER'�̸� sal*1.10�� ������ �� ����
--'PRESIDENT'�̸� sal*1.20�� ������ �� ����
--�� 3���� ������ �ƴ� ��� sal ����
--empno, ename, job, sal, ���� ������ �޿� AS bonus

SELECT  empno, ename, job, sal,
        CASE
            WHEN job = 'SALESMAN'  THEN sal * 1.05
            WHEN job = 'MANAGER'   THEN sal * 1.10
            WHEN job = 'PRESIDENT' THEN sal * 1.20
            ELSE sal
        END bonus,
        comm,
        
        
        --NULLó�� �Լ� ������� �ʰ� CASE���� �̿���
        --comm�� NULL�� ��� -10�� ����
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

--���� �ǽ� 1,2��
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
        = MOD(TO_CHAR(SYSDATE, 'YYYY') , 2) THEN '�ǰ����� �����'
            ELSE '�ǰ����� ������'
        END
FROM emp;

SELECT  empno, ename, hiredate,
        CASE
            WHEN 
                MOD(TO_CHAR(hiredate, 'YYYY') , 2) = 
                MOD(TO_CHAR(SYSDATE, 'YYYY') , 2)
            THEN '�ǰ����� �����'
            ELSE '�ǰ����� ������'
        END contact_to_doctor
FROM emp;






