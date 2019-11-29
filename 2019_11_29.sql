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

--join1
SELECT lprod.lprod_gu, lprod.lprod_nm, prod.prod_id, prod.prod_name
FROM lprod, prod
WHERE lprod.lprod_gu = prod.prod_lgu;

--join2
SELECT buyer.buyer_id, buyer.buyer_name, prod.prod_id, prod.prod_name
FROM prod, buyer
WHERE prod_buyer = buyer_id;

--join3
SELECT member.mem_id, member.mem_name, prod.prod_name, cart.cart_qty
FROM member, cart, prod
WHERE member.mem_id = cart.cart_member
AND cart.cart_prod = prod.prod_id;

--join4
SELECT *
FROM customer cum, cycle cyc
WHERE cum.cid = cyc.cid
AND (cum.CNM = 'brown'
OR cum.CNM = 'sally');

--join5
SELECT cum.cid, cum.cnm, pro.pid, pro.pnm, cyc.day, cyc.cnt
FROM customer cum, cycle cyc, product pro
WHERE cum.cid = cyc.cid
AND cyc.pid = pro.pid
AND
  (cum.cnm = 'brown'
OR cum.cnm = 'sally');

--join6
SELECT cum.cid, cum.cnm, pro.pid, pro.pnm, SUM(cyc.cnt) cnt
FROM customer cum, cycle cyc, product pro
WHERE cum.cid = cyc.cid
AND cyc.pid = pro.pid
GROUP BY cum.cid, cum.cnm, pro.pid, pro.pnm
ORDER BY cid;

--join7
SELECT cyc.pid, pro.pnm, SUM(cyc.cnt) cnt
FROM cycle cyc, product pro
WHERE cyc.pid = pro.pid
GROUP BY cyc.pid, pro.pnm;

--join8









