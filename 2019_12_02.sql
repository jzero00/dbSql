--OUTER join : 조인 연결에 실패하더라도 기준이 되는 테이블의 데이터는 나오도록하는 join
--LEFT OUTER JOIN : 테이블 1 LEFT OUTER JOIN 테이블 2
-- 테이블 1과 테이블 2를 조인할때 조인에 실패하더라도 테이블 1쪽에 데이터는 조회가 되도록 한다.
--조인에 실패한 행에서 테이블 1의 컬럼값은 존재하지 않으므로 NULL로 표시된다.
-- (ANSI 기준)
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
--일반 조인과 차이점은 컬럼명에 (+)표시
--(+)표시 : 데이터가 존재하지 않는데 나와야 하는 테이블의 컬럼
-- 직원 LEFT OUTER JOIN 매니저
--      ON (직원.매니저번호 = 매니저.직원번호)
--      ORACLE OUTER

-- WHERE 직원.매니저번호 = 매니저.직원번호(+) -- 매니저쪽 데이터가 존재하지 않음
--ANSI
SELECT e.empno, e.ename, m.empno, m.ename
FROM emp e LEFT OUTER JOIN emp m
                        ON (e.mgr = m.empno);
                        
--      ORACLE OUTER
SELECT e.empno, e.ename, m.empno, m.ename
FROM emp e, emp m
WHERE e.mgr = m.empno(+);

--매니저 부서번호 제한
--ANSI SQL WHERE 절에 기술한 형태
-- → OUTER JOIN이 적용되지 않은 상황
-- ***      OUTER JOIN이 적용되어야 하는 테이블의 모든 컬럼에 (+)가 붙어야 횐다.
SELECT e.empno, e.ename, m.empno, m.ename
FROM emp e, emp m
WHERE e.mgr = m.empno(+)
AND m.deptno = 10;


--ANSI SQL의 ON절에 기술한 경우와 동일
SELECT e.empno, e.ename, m.empno, m.ename
FROM emp e, emp m
WHERE e.mgr = m.empno(+)
AND m.deptno (+) = 10;

--emp 테이블에는 14명의 직원이 있고 14명은 10, 20, 30부서 중에 한 부서에 속한다.
--하지만 dept 테이블에는 10, 20,30, 40 번 부서가 존재
--부서번호 부서명, 해당 부서에 속한 직원 수가 나오도록 쿼리를 작성

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
                  
--FULL OUTER : LEFT OUTER + RIGHT OUTER - 중복 데이터 한건만 남기기      
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
