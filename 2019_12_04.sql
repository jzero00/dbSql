-- 1. tax ���̺��� �̿� �õ�/�ñ����� �δ� �������� �Ű�� ���ϱ�
--2. �Ű���� ���� ������ ��ŷ �ο��ϱ�
--��ŷ (1)    �õ�(2)   �ñ���(3)  �δ翬������Ű��(4)-- �Ҽ��� ��°�ڸ����� �ݿø�
--1        ����Ư����    ���ʱ�         7000
--2        ����Ư����    ������         6800

SELECT tax.*, ham_mod.*
FROM(

            (SELECT ROWNUM ranking, mod_tax.*
            FROM(
                            SELECT sido, sigungu, ROUND(sal / people, 1) �δ翬������Ű��
                            FROM tax
                            ORDER BY �δ翬������Ű�� DESC) mod_tax)) tax ,
             
            (SELECT ROWNUM ranking, c.*
            FROM
                            (SELECT a.sido, a.sigungu, ROUND(a.cnt / b.cnt,1)  ���ù�������
                            FROM
                                        (SELECT  sido, sigungu, COUNT(*) cnt
                                        FROM fastfood
                                        WHERE gb = '�Ƶ�����' OR gb = '����ŷ' OR gb = 'KFC'
                                        GROUP BY sido, sigungu) a,
                            -- �Ե����� ������ ǥ��
                                        (SELECT  sido, sigungu, COUNT(*) cnt
                                        FROM fastfood
                                        WHERE gb = '�Ե�����'
                                        GROUP BY sido, sigungu) b
                            WHERE a.sido = b.sido AND a.sigungu = b.sigungu
                            ORDER BY ���ù������� DESC) c ) ham_mod
WHERE ham_mod.ranking (+) = tax. ranking
ORDER BY tax. ranking;          
                
                
--���ù������� �õ�, �ñ����� �������� ���� �ݾ��� �õ�, �ñ�����  ���� �������� ����
--���� ������ tax ���̺��� id �÷� ������ ����
SELECT tax.*, ham_mod.*
FROM(

            (SELECT  mod_tax.*
            FROM(
                            SELECT id, sido, sigungu, ROUND(sal / people, 1) �δ翬������Ű��
                            FROM tax
                            ORDER BY �δ翬������Ű�� DESC) mod_tax)) tax ,
             
            (SELECT c.*
            FROM
                            (SELECT a.sido, a.sigungu, ROUND(a.cnt / b.cnt,1)  ���ù�������
                            FROM
                                        (SELECT  sido, sigungu, COUNT(*) cnt
                                        FROM fastfood
                                        WHERE gb = '�Ƶ�����' OR gb = '����ŷ' OR gb = 'KFC'
                                        GROUP BY sido, sigungu) a,
                            -- �Ե����� ������ ǥ��
                                        (SELECT  sido, sigungu, COUNT(*) cnt
                                        FROM fastfood
                                        WHERE gb = '�Ե�����'
                                        GROUP BY sido, sigungu) b
                            WHERE a.sido = b.sido AND a.sigungu = b.sigungu
                            ORDER BY ���ù������� DESC) c ) ham_mod
WHERE ham_mod.sido (+) = tax. sido AND ham_mod.sigungu (+) = tax.sigungu
ORDER BY tax. id;  

--SMITH�� ���� �μ��� ��� ������ ��ȸ
SELECT deptno
FROM emp
WHERE ename = 'SMITH';

SELECT *
FROM emp
WHERE deptno  =  (SELECT deptno
                                  FROM emp
                                  WHERE ename = 'SMITH');
                                  
SELECT empno, ename, deptno,
                (SELECT dname FROM dept WHERE dept.deptno = emp.deptno) dname
FROM emp;

--SCALAR SUBQUERY
-- SELECT ���� ǥ���� ��������
--����, �� COLUMN�� ��ȸ�ؾ� �Ѵ�
SELECT empno, ename, deptno,
                (SELECT dname FROM dept) dname
FROM emp;

--INLINE VIEW
--FROM ���� ���Ǵ� ��������

--SUBQUERY
--WHERE�� ���Ǵ� ��������
SELECT COUNT(*)
FROM emp
WHERE sal > (SELECT AVG(sal) 
                            FROM emp);
                    
SELECT *
FROM emp
WHERE sal >  (SELECT AVG (sal)
                          FROM emp);


SELECT *
FROM emp
WHERE  deptno = any (SELECT deptno
                                FROM emp
                                WHERE ename IN ('SMITH', 'WARD'));


--WHERE�� �ִ� ���������� ���� ���Ҷ� = �� �ƴ� IN�� ����.

SELECT *
FROM emp
WHERE  deptno IN (SELECT deptno
                                FROM emp
                                WHERE ename = 'SMITH'
                                OR ename = 'WARD');
                                
                                
--SMITH Ȥ�� WARD ���� �޿��� ���� �޴� ������ȸ
SELECT * 
FROM emp
WHERE sal < ANY ( SELECT sal
                        FROM emp
                        WHERE ename IN ('SMITH' , 'WARD'));
                      



--�������� ���
SELECT *
FROM emp            --��� ���� ��ȸ �� ������ ������ ���� �ʴ�
WHERE empno IN (SELECT mgr
                                 FROM emp);
                                 
--������ ������ ���� �ʴ� ��� ���� ��ȸ
-- NOT IN ������ ���� NULL�� �����Ϳ� �������� �ʾƾ� �Ѵ�.
SELECT *
FROM emp            --��� ���� ��ȸ �� ������ ������ ���� �ʴ�
WHERE empno NOT IN (SELECT NVL(mgr, 0) -- NULL���� �������� �������� �����ͷ� ġȯ
                                          FROM emp);

SELECT *
FROM emp            --��� ���� ��ȸ �� ������ ������ ���� �ʴ�
WHERE empno NOT IN (SELECT mgr -- NULL���� �������� �������� �����ͷ� ġȯ
                                          FROM emp
                                          WHERE mgr IS NOT NULL);
                                          
--pair wise
--ALLEN�� CLARK�� �Ŵ����� �μ���ȣ�� ���ÿ� ���� ��� ���� ��ȸ
--(7698,30)
--(7839,10)

--�Ŵ����� 7698�̰ų� 7839�̸鼭 �ҼӺμ��� 10���̰ų� 30���� �������� ��ȣ;
-- 7698, 10
-- 7698, 30
-- 7839, 10
-- 7839, 30

SELECT *
FROM emp
WHERE (mgr, deptno) IN (SELECT mgr, deptno
                                            FROM emp
                                            WHERE empno IN ( 7499, 7782));
                                            
SELECT *
FROM emp
WHERE mgr IN (SELECT mgr
                             FROM emp
                             WHERE empno IN ( 7499, 7782));

SELECT *
FROM emp
WHERE deptno  IN (SELECT deptno
                             FROM emp
                             WHERE empno IN ( 7499, 7782));
                             
--���ȣ ���� ��������
--���� ������ �÷��� ������������ �������� �ʴ� ������ ��������

--���ȣ ���� ���������� ��� ������������ ����ϴ� ���̺�, �������� ��ȸ ������ 
--���������� ������ ������ �Ǵ��Ͽ� ������ �����Ѵ�.
--���� ������ emp���̺��� ���� ���� ���� �ְ�, ���� ������ emp ���̺��� ���� ���� ���� �ִ�.

--���ȣ ���� ���� �������� ���������� ���̺��� ���� ���� ����
--���������� ������ ������ �ߴٶ�� �� �������� ǥ��
--���ȣ ���� ���� �������� ���������� ���̺��� ���߿� ���� ����
--���������� Ȯ���� ������ �ߴٶ�� �� �������� ǥ��

--������ �޿� ��պ��� ���� �޿��� �޴� ���� ���� ��ȸ
--������ �޿� ���
SELECT *
FROM emp
WHERE sal > (SELECT AVG(sal)
                        FROM emp);

--��ȣ ���� ��������
--�ش� ������ ���� �μ��� �޿� ��պ��� ���� �޿��� �޴� ���� ��ȸ

SELECT *
FROM emp m
WHERE sal > (SELECT AVG (sal)
                        FROM emp
                        WHERE deptno = m.deptno);

--10�� �μ��� �޿� ���
SELECT AVG (sal)
FROM emp
WHERE deptno = 10;






