SELECT  empno, ename, hiredate,
        CASE
            WHEN 
                MOD(TO_CHAR(hiredate, 'YYYY') , 2) = 
                MOD(TO_CHAR(SYSDATE, 'YYYY') , 2)
            THEN '�ǰ����� �����'
            ELSE '�ǰ����� ������'
        END contact_to_doctor
FROM emp;


--���⵵ �ǰ����� ����ڸ� ��ȸ�ϴ� ����
--2020�⵵
SELECT  empno, ename, hiredate,
        CASE
            WHEN 
                MOD(TO_CHAR(hiredate, 'YYYY') , 2) = 
                MOD(2020 , 2)
            THEN '�ǰ����� �����'
            ELSE '�ǰ����� ������'
        END contact_to_doctor
FROM emp;

--cond3
SELECT userid, usernm, alias, reg_dt,
    CASE
        WHEN 
            MOD (TO_CHAR(reg_dt , 'YYYY'),2) =
            MOD (TO_CHAR(SYSDATE, 'YYYY'),2)
        THEN '�ǰ����������'
        ELSE '�ǰ�����������'
    END contact_to_doctor
FROM users;

--GROUP FUNCTION
--Ư�� �÷��̳�, ǥ���� �������� �������� ���� ������ ����� ����
--COUNT - �Ǽ�, SUM-�հ�, AVG-���, MAX-�ִ밪, MIN-�ּҰ�
--��ü ������ �������
--���� ���� �޿�
SELECT  MAX(sal)             max_sal,              --���� ���� �޿�
        MIN(sal)             min_sal,              --���� ���� �޿�
        ROUND(AVG(sal),2)    avg_sal,              --�������� �޿� ���
        SUM(sal)             sum_sal,              --�������� �޿� �հ�
        COUNT(sal)           count_sal,            --�޿��Ǽ� (null�� �ƴ� ���̸� 1��)
        COUNT(mgr)           count_mgr,            --������ ������ �Ǽ� (KING�� ��� MGR�� ����.)
        COUNT(*)             count_row             --Ư�� �÷��� �Ǽ��� �ƴ϶� ���� ������ �˰� ������
FROM emp;

--�μ���ȣ�� �׷��Լ� ����

SELECT  deptno,
        MAX(sal)             max_sal,              --�μ����� ���� ���� �޿�
        MIN(sal)             min_sal,              --�μ����� ���� ���� �޿�
        ROUND(AVG(sal),2)    avg_sal,              --�μ������� �޿� ���
        SUM(sal)             sum_sal,              --�μ������� �޿� �հ�
        COUNT(sal)           count_sal,            --�μ��� �޿��Ǽ� (null�� �ƴ� ���̸� 1��)
        COUNT(mgr)           count_mgr,            --�μ������� ������ �Ǽ� (KING�� ��� MGR�� ����.)
        COUNT(*)             count_row             --�μ��� ��������
FROM emp
GROUP BY deptno;

SELECT  deptno, ename,
        MAX(sal)             max_sal,              --�μ����� ���� ���� �޿�
        MIN(sal)             min_sal,              --�μ����� ���� ���� �޿�
        ROUND(AVG(sal),2)    avg_sal,              --�μ������� �޿� ���
        SUM(sal)             sum_sal,              --�μ������� �޿� �հ�
        COUNT(sal)           count_sal,            --�μ��� �޿��Ǽ� (null�� �ƴ� ���̸� 1��)
        COUNT(mgr)           count_mgr,            --�μ������� ������ �Ǽ� (KING�� ��� MGR�� ����.)
        COUNT(*)             count_row             --�μ��� ��������
FROM emp
GROUP BY deptno, ename;

--SELECT ������ GROUP BY ���� ǥ���� �÷� �̿��� �÷��� �� �� ����.
--�������� ������ ���� ���� (3���� ���� ������ �Ѱ��� �����ͷ� GROUPING)
--�� ���������� ��������� SELECT ���� ǥ���� ����
SELECT  deptno, 1, '���ڿ�', SYSDATE,
        MAX(sal)             max_sal,              --�μ����� ���� ���� �޿�
        MIN(sal)             min_sal,              --�μ����� ���� ���� �޿�
        ROUND(AVG(sal),2)    avg_sal,              --�μ������� �޿� ���
        SUM(sal)             sum_sal,              --�μ������� �޿� �հ�
        COUNT(sal)           count_sal,            --�μ��� �޿��Ǽ� (null�� �ƴ� ���̸� 1��)
        COUNT(mgr)           count_mgr,            --�μ������� ������ �Ǽ� (KING�� ��� MGR�� ����.)
        COUNT(*)             count_row             --�μ��� ��������
FROM emp
GROUP BY deptno;

--�׷��Լ������� NULL�÷��� ������� �ʴ´�.
--emp���̺��� comm�÷��� null�� �ƴ� �����ʹ� 4��, 9���� null
SELECT COUNT(comm)      count_comm,     --NULL�� �ƴ� ���� ���� 4��
        SUM(comm)       sum_comm,       --NULL���� ����, 355+500+1400+0=2200
        SUM(sal)        sum_sal,       
        SUM(sal + comm) tot_sal_sum,
        SUM(sal + NVL(comm,0)) tot_sal_sum
FROM emp;

--WHERE ������ GROUP �Լ��� ����� �� ����.
--1. �μ��� �ִ� �޿� ���ϱ�
--2. �μ��� �ִ� �޿� ���� 3000�� �Ѵ� �ุ ���ϱ�
SELECT deptno, MAX(sal) max_sal
FROM emp
WHERE MAX(sal) > 3000 --ORA-00934: group function �ڿ� WHERE���� �� �� ����.
GROUP BY deptno;

SELECT deptno, MAX(sal) max_sal
FROM emp
GROUP BY deptno
HAVING MAX (sal) >= 3000;

--grp1
SELECT  MAX(sal),
        MIN(sal),
        AVG(sal),
        SUM(sal),
        COUNT(sal),
        COUNT(mgr),
        COUNT(sal)
FROM emp;


SELECT  
        deptno,
        MAX(sal)            max_sal,
        MIN(sal)            min_sal,
        ROUND(AVG(sal),2)   avg_sal,
        SUM(sal)            sum_sal,
        COUNT(sal)          count_sal,
        COUNT(mgr)          count_mgr,
        COUNT(sal)          count_all
FROM emp
GROUP BY deptno;

SELECT  CASE
            WHEN deptno = 10 THEN 'ACCOUNTING'
            WHEN deptno = 20 THEN 'RESEARCH'
            WHEN deptno = 30 THEN 'SALES'
        END dname,
        
        MAX(sal)            max_sal,
        MIN(sal)            min_sal,
        ROUND(AVG(sal),2)   avg_sal,
        SUM(sal)            sum_sal,
        COUNT(sal)          count_sal,
        COUNT(mgr)          count_mgr,
        COUNT(sal)          count_all
FROM emp
GROUP BY deptno
ORDER BY deptno;

--grp4
SELECT  TO_CHAR(hiredate,'YYYYMM')          hire_yyyymm,
        COUNT(*)                            cnt         --COUNT(*)�� �ش� �׷� �÷��ȿ� �ִ� ��� ���� ī����
FROM emp
GROUP BY TO_CHAR(hiredate,'YYYYMM');
--ORDER BY TO_CHAR(hiredate,'YYYYMM');

--grp5
SELECT  TO_CHAR(hiredate,'YYYY')    hire_yyyy,
        COUNT(*)
FROM emp
GROUP BY TO_CHAR(hiredate,'YYYY')
ORDER BY TO_CHAR(hiredate,'YYYY');


--grp6
SELECT COUNT(*) cnt
FROM dept;

--grp7
SELECT COUNT(COUNT(*)) cnt
FROM emp
GROUP BY deptno;
--���� ī��Ʈ
SELECT COUNT(COUNT(deptno)) cnt
FROM emp
GROUP BY deptno;
--INLINE VIEW
SELECT COUNT(*) cnt
FROM(
SELECT COUNT(deptno)
        FROM emp
GROUP BY deptno) a;

SELECT COUNT(deptno) cnt
FROM emp
GROUP BY deptno;

SELECT COUNT(DISTINCT deptno)
FROM emp;

--JOIN
--1. ���̺��� ���� ���� ( �÷� �߰�)
--2. �߰��� �÷��� ���� update
--dname �÷��� emp ���̺� �߰�
DESC emp;
DESC dept;

--1 �÷� �߰� (dname, VARCHAR2(14))
ALTER TABLE emp ADD (dname VARCHAR2(14));
DESC emp;

SELECT *
FROM emp;

UPDATE emp SET dname = CASE
                            WHEN deptno = 10 THEN 'ACCOUNTING'
                            WHEN deptno = 20 THEN 'RESEARCH'
                            WHEN deptno = 30 THEN 'SALES'
                        END;
COMMIT;

SELECT empno, ename, deptno, dname
FROM emp;

-- SALES �� MARKET SALES
-- �� 6���� ������ ������ �ʿ��ϴ�.
--���� �ߺ��� �ִ� ���� (��������)
UPDATE emp SET dname = 'MARKET SALES'
WHERE dname = 'SALES';
ROLLBACK;

--emp ���̺�, dept ���̺� ����
SELECT ename, emp.deptno, dept.dname
FROM emp, dept
WHERE emp.deptno = dept.deptno;













