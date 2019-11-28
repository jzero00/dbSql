--emp ���̺�, dept ���̺� ����
�����ȹ
EXPLAIN PLAN FOR 
SELECT ename, emp.deptno, dept.dname
FROM emp, dept
WHERE emp.deptno = dept.deptno; --�� ���̺� �����;

SELECT *
FROM TABLE(dbms_xplan.display);

SELECT ename, emp.deptno, dept.dname
FROM emp, dept
WHERE emp.deptno != dept.deptno
AND emp.deptno=10;

SELECT ename, deptno
FROM emp;

SELECT deptno, dname
From dept;

--natural join : ���� ���̺� ���� Ÿ��, ���� �̸��� �÷�����    
--               ���� ���� ���� ��� ����
DESC emp;
DESC dept;

SELECT *
FROM emp NATURAL JOIN dept;

--ANSI SQL
SELECT deptno, a.empno, ename
FROM emp a NATURAL JOIN dept b; --�÷��� ��Ī�� �ִ� �͵� ����

--oracle ����
SELECT emp.deptno, emp.empno, ename
FROM emp, dept
WHERE emp.deptno = dept.deptno;

--JOIN USING
--join�Ϸ��� �ϴ� ���̺� ������ �̸��� �÷��� �� �� �̻��� ��
--join�� �÷��� �ϳ��� ����ϰ� ���� ��

--ANSI SQL
SELECT *
FROM emp JOIN dept USING (deptno);

--ORACLE SQL
SELECT *
FROM emp, dept
WHERE emp.deptno = dept.deptno;

--ANSI SQL JOIN with ON
--�����ϰ��� �ϴ� ���̺��� �÷� �̸��� �ٸ���
--�����ڰ� ���� ������ ���� ������ ��

SELECT *
FROM emp JOIN dept ON (emp.deptno = dept.deptno);

--oracle
SELECT *
FROM emp, dept
WHERE emp.deptno = dept.deptno;

--SELF JOIN : ���� ���̺� ����
--emp ���̺� ���� �Ҹ��� ���� : ������ ������ ���� ��ȸ
--������ ������ ������ ��ȸ
--�����̸� , ������ �̸�
--ANSI
--���� �̸�, ������ ����� �̸�, ������ ������� ������̸�
SELECT e.ename, m.ename
FROM emp e JOIN emp m on (e.mgr = m.empno);

--oracle
SELECT e.ename, m.ename
FROM emp e, emp m
WHERE e.mgr = m.empno;

--�Ŵ����� �Ŵ����� ���ϴ� ���
SELECT e.ename, m.ename, t.ename
FROM emp e, emp m, emp t
WHERE e.mgr = m.empno AND m.mgr = t.empno;


--�Ŵ����� �Ŵ����� �Ŵ����� ���ϴ� ���
SELECT e.ename, m.ename, t.ename, p.ename
FROM emp e, emp m, emp t, emp p
WHERE e.mgr = m.empno AND m.mgr = t.empno AND t.mgr = p.empno;

--�������̺��� ANSI JOIN�� �̿��� JOIN
SELECT e.ename, m.ename, t.ename
FROM emp e JOIN emp m ON (e.mgr = m.empno)
           JOIN emp t ON (m.mgr = t.empno)
           JOIN emp k ON (t.mgr = k.empno);
           
SELECT e.ename, m.ename, t.ename
FROM emp e JOIN emp m ON (e.mgr = m.empno)
           JOIN emp t ON (m.mgr = t.empno);
           
--������ �̸��� �ش� ������ �������� �̸��� ��ȸ
--�� ������ ����� 7369~7698�� ������ ������� ��ȸ

SELECT e.ename , m.ename
FROM emp e, emp m
WHERE e.mgr = m.empno
AND e.empno BETWEEN 7369 AND 7698;

--NON-EQUI JOIN : ���� ������ =(equal)�� �ƴ� JOIN
-- !=, BETWEEN AND 

SELECT *
FROM salgrade;

SELECT e.empno, e.ename, e.sal, g.grade/*�޿� grade*/
FROM emp e, salgrade g
WHERE e.sal BETWEEN g.losal AND g.hisal;

--join0
SELECT empno, ename, dept.deptno, dname
FROM emp, dept
WHERE emp.deptno = dept.deptno
ORDER BY deptno;

--join0_1
SELECT empno, ename, dept.deptno, dname
FROM emp, dept
WHERE emp.deptno = dept.deptno
AND emp.deptno !=20;

--join0_2
SELECT empno, ename, emp.sal, dept.deptno, dname
FROM emp, dept
WHERE emp.deptno = dept.deptno
AND emp.sal>2500
ORDER BY sal DESC;

--join0_3
SELECT empno, ename, emp.sal, dept.deptno, dname
FROM emp, dept
WHERE emp.deptno = dept.deptno
AND emp.sal > 2500
AND empno > 7600
ORDER BY sal DESC;

--join0_4
SELECT empno, ename, emp.sal, dept.deptno, dname
FROM emp, dept
WHERE emp.deptno = dept.deptno
AND emp.sal > 2500
AND empno > 7600
AND dname = 'RESEARCH'
ORDER BY sal DESC;