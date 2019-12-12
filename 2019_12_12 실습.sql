EXPLAIN PLAN FOR
SELECT *
FROM emp
WHERE sal BETWEEN : st_sal AND :ed_sal
AND deptno = :deptno;

SELECT *
FROM TABLE (dbms_xplan.display);

EXPLAIN PLAN FOR
SELECT *
FROM emp
WHERE ename = :ename;

SELECT *
FROM TABLE (dbms_xplan.display);

EXPLAIN PLAN FOR
SELECT b.*
FROM emp a, emp b
WHERE a.mgr = b.empno
AND a.deptno = :deptno;

SELECT *
FROM TABLE (dbms_xplan.display);

EXPLAIN PLAN FOR
SELECT *
FROM emp, dept
WHERE emp.deptno = dept.deptno
AND      emp.deptno = :deptno
AND      emp.empno LIKE : empno || '%';

SELECT *
FROM TABLE (dbms_xplan.display);
SELECT *
FROM emp;

|   0 | SELECT STATEMENT             |         |     1 |    58 |     4   (0)| 00:00:01 |
|   1 |  NESTED LOOPS                |         |     1 |    58 |     4   (0)| 00:00:01 |
|   2 |   TABLE ACCESS BY INDEX ROWID| DEPT    |     1 |    20 |     1   (0)| 00:00:01 |
|*  3 |    INDEX UNIQUE SCAN         | PK_DEPT |     1 |       |     0   (0)| 00:00:01 |
|*  4 |   TABLE ACCESS FULL          | EMP     |     1 |    38 |     3   (0)| 00:00:01 |