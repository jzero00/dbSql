--OUTER join : ���� ���ῡ �����ϴ��� ������ �Ǵ� ���̺��� �����ʹ� ���������ϴ� join
--LEFT OUTER JOIN : ���̺� 1 LEFT OUTER JOIN ���̺� 2
-- ���̺� 1�� ���̺� 2�� �����Ҷ� ���ο� �����ϴ��� ���̺� 1�ʿ� �����ʹ� ��ȸ�� �ǵ��� �Ѵ�.
--���ο� ������ �࿡�� ���̺� 1�� �÷����� �������� �����Ƿ� NULL�� ǥ�õȴ�.
-- (ANSI ����)
SELECT e.empno, e.ename, m.empno, m.ename
FROM emp e LEFT OUTER JOIN emp m
                        ON (e.mgr = m.empno);
--
SELECT e.empno, e.ename, e.deptno, m.empno, m.ename, m.deptno
FROM emp e LEFT OUTER JOIN emp m
                        ON (e.mgr = m.empno AND m.deptno = 10);
                        
SELECT e.empno, e.ename, e.deptno, m.empno, m.ename, m.deptno
FROM emp e LEFT OUTER JOIN emp m
                        ON (e.mgr = m.empno )
WHERE m.deptno = 10;

--ORACLE outer join syntax
--�Ϲ� ���ΰ� �������� �÷��� (+)ǥ��
--(+)ǥ�� : �����Ͱ� �������� �ʴµ� ���;� �ϴ� ���̺��� �÷�
-- ���� LEFT OUTER JOIN �Ŵ���
--      ON (����.�Ŵ�����ȣ = �Ŵ���.������ȣ)
--      ORACLE OUTER

-- WHERE ����.�Ŵ�����ȣ = �Ŵ���.������ȣ(+) -- �Ŵ����� �����Ͱ� �������� ����
--ANSI
SELECT e.empno, e.ename, m.empno, m.ename
FROM emp e LEFT OUTER JOIN emp m
                        ON (e.mgr = m.empno);
                        
--      ORACLE OUTER
SELECT e.empno, e.ename, m.empno, m.ename
FROM emp e, emp m
WHERE e.mgr = m.empno(+);

--�Ŵ��� �μ���ȣ ����
--ANSI SQL WHERE ���� ����� ����
-- �� OUTER JOIN�� ������� ���� ��Ȳ
-- ***      OUTER JOIN�� ����Ǿ�� �ϴ� ���̺��� ��� �÷��� (+)�� �پ�� Ⱥ��.
SELECT e.empno, e.ename, m.empno, m.ename
FROM emp e, emp m
WHERE e.mgr = m.empno(+)
AND m.deptno = 10;


--ANSI SQL�� ON���� ����� ���� ����
SELECT e.empno, e.ename, m.empno, m.ename
FROM emp e, emp m
WHERE e.mgr = m.empno(+)
AND m.deptno (+) = 10;

--emp ���̺��� 14���� ������ �ְ� 14���� 10, 20, 30�μ� �߿� �� �μ��� ���Ѵ�.
--������ dept ���̺��� 10, 20,30, 40 �� �μ��� ����
--�μ���ȣ �μ���, �ش� �μ��� ���� ���� ���� �������� ������ �ۼ�

SELECT dept.deptno, dept.dname, COUNT(emp.deptno)
FROM dept LEFT OUTER JOIN emp
ON emp.deptno = dept.deptno
GROUP BY dept.deptno, dept.dname
ORDER BY deptno;
                    
 SELECT  dept.deptno, dept.dname, COUNT(emp.deptno)
FROM dept, emp
WHERE emp.deptno(+) = dept.deptno
GROUP BY dept.deptno, dept.dname
ORDER BY deptno;


SELECT dept.deptno, dept.dname, NVL(emp_cnt.cnt, 0) cnt
FROM dept, 
(SELECT deptno, COUNT(*) cnt
FROM emp
GROUP BY deptno) emp_cnt
WHERE dept.deptno = emp_cnt.deptno(+);


SELECT dept.deptno, dept.dname, NVL(emp_cnt.cnt, 0) cnt
FROM
dept LEFT OUTER JOIN (SELECT deptno, COUNT(*) cnt
                                            FROM emp
                                            GROUP BY deptno) emp_cnt
                                    ON (dept.deptno = emp_cnt.deptno);


SELECT e.empno, e.ename, m.empno, m.ename
FROM emp e LEFT OUTER JOIN emp m
                        ON (e.mgr = m.empno);

SELECT e.empno, e.ename, m.empno, m.ename
FROM emp m RIGHT OUTER JOIN emp e
                        ON (e.mgr = m.empno);
                  
--FULL OUTER : LEFT OUTER + RIGHT OUTER - �ߺ� ������ �ѰǸ� �����      
 SELECT e.empno, e.ename, m.empno, m.ename
FROM emp m FULL OUTER JOIN emp e
                        ON (e.mgr = m.empno);
                        
--outer join 1
SELECT a.buy_date, a.buy_prod, prod.prod_id, prod.prod_name, a.buy_qty
FROM prod,
        (SELECT buyprod.buy_date, buyprod.buy_prod, prod.prod_id,
                        prod.prod_name, buyprod.buy_qty
        FROM buyprod, prod
        WHERE buyprod.buy_prod= prod.prod_id
        AND buyprod.buy_date = TO_DATE('20050125','yyyymmdd') )a
WHERE a.buy_prod (+) = prod.prod_id;

--outer join 2
SELECT nvl (a.buy_date, TO_DATE('20050125','yyyymmdd')) buy_date,
        a.buy_prod, prod.prod_id, prod.prod_name, a.buy_qty
FROM prod,
        (SELECT buyprod.buy_date, buyprod.buy_prod, prod.prod_id,
                        prod.prod_name, buyprod.buy_qty
        FROM buyprod, prod
        WHERE buyprod.buy_prod= prod.prod_id
        AND buyprod.buy_date = TO_DATE('20050125','yyyymmdd') )a
WHERE a.buy_prod (+) = prod.prod_id;

--outer join 3
--buy_qty
SELECT nvl (a.buy_date, TO_DATE('20050125','yyyymmdd')) buy_date,
        a.buy_prod, prod.prod_id, prod.prod_name, 
        nvl (a.buy_qty,0)
FROM prod,
        (SELECT buyprod.buy_date, buyprod.buy_prod, prod.prod_id,
                        prod.prod_name, buyprod.buy_qty
        FROM buyprod, prod
        WHERE buyprod.buy_prod= prod.prod_id
        AND buyprod.buy_date = TO_DATE('20050125','yyyymmdd') )a
WHERE a.buy_prod (+) = prod.prod_id;


--outer join 4
SELECT  nvl(product.pid,200) pid,
product.pnm,  
nvl(cycle.cid,0) cid,
nvl(cycle.day,0) day
, COUNT(cid) cnt
FROM cycle, product
WHERE cycle.pid (+) = product.pid
AND cycle.cid (+) = 1
GROUP BY cycle.pid, product.pnm, cid, cycle.day, nvl(product.pid,200)
ORDER BY pid;

--outer join 5
SELECT  nvl(product.pid,200) pid,
product.pnm,  nvl(cycle.cid,0) cid,
product.pnm,
nvl(cycle.day,0) day, COUNT(cid) cnt
FROM cycle, product, customer
WHERE cycle.pid (+) = product.pid
AND cycle.cid (+) = 1
AND cycle.pid = customer.pid
GROUP BY  pid,
product.pnm, cid,
product.pnm,
 day,
ORDER BY pid;


SELECT *
FROM cycle;

SELECT *
FROM product;


SELECT *
FROM customer;
