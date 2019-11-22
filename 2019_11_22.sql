--emp���̺��� deptno�� 10�� �ƴϰ� �Ի����ڰ� 1981�� 6�� 1�� ������ ������ ������ ��ȸ�ϼ��� ****
SELECT *
FROM emp
WHERE deptno != 10
AND hiredate >= TO_DATE('19810601','YYYYMMDD');

--9
SELECT *
FROM emp
WHERE deptno NOT IN (10)
AND hiredate >= TO_DATE('19810601','YYYYMMDD');

--10 (NOT IN ������ ��� ����, IN �����ڸ� ��밡��)
--dept �÷��� ���� 10,20,30�� �����Ѵ�.

SELECT *
FROM emp
WHERE deptno IN (20, 30)
AND hiredate >= TO_DATE('19810601','YYYYMMDD');

--11
--emp���̺��� job�� SALESMAN�̰ų� �Ի����ڰ� 1981�� 6�� 1�� ������
--������ ������ ������ ���� ��ȸ�ϼ���.

SELECT *
FROM emp
WHERE job = 'SALESMAN'
OR hiredate >= TO_DATE('19810601','YYYYMMDD');

--12
--emp ���̺��� job�� SALESMAN�̰ų� �����ȣ�� 78�� �����ϴ� ������ ������ ������ ���� ��ȸ�ϼ���
SELECT *
FROM emp
WHERE job = 'SALESMAN'
OR empno LIKE '78%';

--13
--emp���̺��� job�� SALESMAN�̰ų� �����ȣ�� 78�� �����ϴ� ������ ������ ������ ���� ��ȸ�ϼ���
--(LIKE ������ ��� ����)
--�������� : empno�� ���ڿ��ߵȴ�. (DESC )
SELECT *
FROM emp
WHERE job = 'SALESMAN'
OR ( empno >= 7800 AND empno < 7900);

--������ �켱���� (AND > OR)
--���� �̸��� SMITH�̰ų�, �����̸��� ALLEN �̸鼭 ������ SALESMAN�� ����
SELECT *
FROM emp
WHERE ename = 'SMITH'
OR ename = 'ALLEN'
AND job = 'SALESMAN';

--�̰� �� �������� ����
SELECT *
FROM emp
WHERE ename = 'SMITH'
OR (ename = 'ALLEN' AND job = 'SALESMAN');

--�����̸��� SMITH�̰ų� ALLEN�̸鼭 ������ SALESMAN�� ���
SELECT *
FROM emp
WHERE (ename = 'SMITH' OR ename = 'ALLEN' )
AND job = 'SALESMAN';

--14
SELECT *
FROM emp
WHERE job = 'SALESMAN'
OR empno LIKE '78%'
AND hiredate > TO_DATE('19810601','YYYYMMDD');

--������ ����
-- 1,3,5,2,10
--�������� : 1, 2, 3, 5, 10
--�������� : 10, 5, 3, 2, 1

--�������� : ASC (ǥ�⸦ ���� ��� �⺻��)
--�������� : DESC (���������� �ݵ�� ǥ��)
/*
    SELECT col1, col2, ....
    FROM ���̺��
    WHERE col1 = '��'
    ORDER BY ���ı����÷�1 [ASC / DESC], ���ı����÷�2.... [ASC/DESC]
*/

--���(emp) ���̺��� ������ ������ ���� �̸����� ������������
SELECT *
FROM emp
ORDER BY ename;

SELECT *
FROM emp
ORDER BY ename ASC; --���ı����� �ۼ����� ���� ��� �������� ����

--���(emp) ���̺��� ������ ������ ���� �̸����� ������������
SELECT *
FROM emp
ORDER BY ename DESC;

--���(emp) ���̺��� ������ ������ �μ���ȣ�� �������� �����ϰ�
--�μ���ȣ�� ���� ���� sal �������� ����
--�޿�(sal)�� �������� �̸����� �������� �����Ѵ�.
SELECT *
FROM emp
ORDER BY deptno, sal DESC, ename;

--���� �÷��� ALIASȣ ǥ��
SELECT deptno, sal, ename nm
FROM emp
ORDER BY nm;

--��ȸ�ϴ� �÷��� ��ġ �ε����� ǥ������
SELECT deptno, sal, ename nm
FROM emp
ORDER BY 3;     --��õ���� ���� (�÷��߰��� �ǵ����� ���� ����� ���� �� ����) ������ �������� ������ ����

--������ ����
--dept ���̺��� ��� ������ �μ��̸����� �������� ���ķ� ���ܵǵ��� ������ �ۼ��ϼ���
DESC dept;

SELECT *
FROM dept
ORDER BY deptno;

SELECT *
FROM dept
ORDER BY loc DESC;

--emp���̺��� ��(comm)������ �ִ� ����鸸 ��ȸ�ϰ�, ��(comm)�� ���� �޴� ����� ���� ��ȸ�ǵ��� �ϰ�
--�󿩰� ���� ��� ������� �������� �����ϼ���
SELECT *
FROM emp
WHERE comm > 0
ORDER BY comm DESC, empno;

--emp���̺��� �����ڰ� �ִ� ����鸸 ��ȸ�ϰ�
--���� ������ �������� �����ϰ�
--������ ���� ���, ����� ū ����� ���� ��ȸ�ǵ��� ������ �ۼ��Ͻÿ�
SELECT *
FROM emp
WHERE mgr IS NOT NULL
ORDER BY job, deptno DESC;

--emp���̺���
SELECT *
FROM emp
WHERE (deptno IN (10, 30))
AND sal > 1500
ORDER BY ename DESC;

--ROWNUM
SELECT ROWNUM, empno, ename
FROM emp;

SELECT ROWNUM, empno, ename
FROM emp
WHERE ROWNUM = 2;           --ROWNUM = equal �񱳴� 1�� ����

SELECT ROWNUM, empno, ename
FROM emp
WHERE ROWNUM <= 2;          --<= (<) ROWNUM�� 1���� ���������� ��ȸ�ϴ� ���� ����

SELECT ROWNUM, empno, ename
FROM emp
WHERE ROWNUM BETWEEN 1 AND 20;          -- 1���� �����ϴ� ��� ����

--SELECT ���� ORDER BY ������ �������
-- SELECT �� ROWNUM �� ORDER BY
SELECT ROWNUM, empno, ename
FROM emp
ORDER BY ename;

--INLINE VIEW�� ���� ���� ���� �����ϰ�, �ش� ����� ROWNUM�� ���� ********
--SELECT���� *ǥ���ϰ�, �ٸ� �÷�|ǥ������ ���� ���
--*�տ� ���̺��̳� ��Ī�� ����
SELECT ROWNUM, a.*
FROM
    (SELECT empno, ename
     FROM emp
     ORDER BY ename) a;

SELECT e.*
FROM emp e;

--row_1
SELECT ROWNUM rn, empno, ename
FROM emp
WHERE ROWNUM <=10;

--row_2
--ROWNUM ���� 11~14�� ���� ��ȸ�ϴ� ������ �ۼ��غ�����
SELECT *
FROM
    (SELECT ROWNUM rn, a.*
     FROM
        (SELECT empno, ename
         FROM emp) a
    )
WHERE rn BETWEEN 11 AND 20;

--row_3
--emp���̺��� ename���� ������ ����� 11��° ��� 14��° �ุ ��ȸ�ϴ� ������ �ۼ��غ�����



SELECT *
FROM
    (SELECT ROWNUM rn, a.*
     FROM
        (SELECT empno, ename
         FROM emp
         ORDER BY ename ) a)
WHERE rn IN (11 ,14) ;