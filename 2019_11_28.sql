--emp 테이블, dept 테이블 조인
실행계획
EXPLAIN PLAN FOR 
SELECT ename, emp.deptno, dept.dname
FROM emp, dept
WHERE emp.deptno = dept.deptno; --두 테이블간 연결고리;

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

--natural join : 조인 테이블간 같은 타입, 같은 이름의 컬럼으로    
--               같은 값을 가질 경우 조인
DESC emp;
DESC dept;

SELECT *
FROM emp NATURAL JOIN dept;

--ANSI SQL
SELECT deptno, a.empno, ename
FROM emp a NATURAL JOIN dept b; --컬럼에 별칭을 주는 것도 가능

--oracle 문법
SELECT emp.deptno, emp.empno, ename
FROM emp, dept
WHERE emp.deptno = dept.deptno;

--JOIN USING
--join하려고 하는 테이블간 도일한 이름의 컬럼이 두 개 이상일 때
--join한 컬럼을 하나만 사용하고 싶을 때

--ANSI SQL
SELECT *
FROM emp JOIN dept USING (deptno);

--ORACLE SQL
SELECT *
FROM emp, dept
WHERE emp.deptno = dept.deptno;

--ANSI SQL JOIN with ON
--조인하고자 하는 테이블의 컬럼 이름이 다를떄
--개발자가 조인 조건을 직접 제어할 때

SELECT *
FROM emp JOIN dept ON (emp.deptno = dept.deptno);

--oracle
SELECT *
FROM emp, dept
WHERE emp.deptno = dept.deptno;

--SELF JOIN : 같은 테이블간 조인
--emp 테이블간 조인 할만한 사항 : 직원의 관리자 정보 조회
--직원의 관리자 정보를 조회
--직원이름 , 관리자 이름
--ANSI
--직원 이름, 직원의 상급자 이름, 직원의 상급자의 상급자이름
SELECT e.ename, m.ename
FROM emp e JOIN emp m on (e.mgr = m.empno);

--oracle
SELECT e.ename, m.ename
FROM emp e, emp m
WHERE e.mgr = m.empno;

--매니저의 매니저를 구하는 방법
SELECT e.ename, m.ename, t.ename
FROM emp e, emp m, emp t
WHERE e.mgr = m.empno AND m.mgr = t.empno;


--매니저의 매니저의 매니저를 구하는 방법
SELECT e.ename, m.ename, t.ename, p.ename
FROM emp e, emp m, emp t, emp p
WHERE e.mgr = m.empno AND m.mgr = t.empno AND t.mgr = p.empno;

--여러테이블을 ANSI JOIN을 이용한 JOIN
SELECT e.ename, m.ename, t.ename
FROM emp e JOIN emp m ON (e.mgr = m.empno)
           JOIN emp t ON (m.mgr = t.empno)
           JOIN emp k ON (t.mgr = k.empno);
           
SELECT e.ename, m.ename, t.ename
FROM emp e JOIN emp m ON (e.mgr = m.empno)
           JOIN emp t ON (m.mgr = t.empno);
           
--직원의 이름과 해당 직원의 관리자의 이름을 조회
--단 직원의 사번이 7369~7698인 직원을 대상으로 조회

SELECT e.ename , m.ename
FROM emp e, emp m
WHERE e.mgr = m.empno
AND e.empno BETWEEN 7369 AND 7698;

--NON-EQUI JOIN : 조인 조건이 =(equal)이 아닌 JOIN
-- !=, BETWEEN AND 

SELECT *
FROM salgrade;

SELECT e.empno, e.ename, e.sal, g.grade/*급여 grade*/
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