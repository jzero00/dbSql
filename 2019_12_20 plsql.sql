--  PL/SQL
--  PL/SQL �⺻����
--  DECLARE : �����, ������ �����ϴ� �κ�
-- BEGIN        : PL/SQL�� ������ ���� �κ�
-- EXCEPTION  : ���� ó�� ��

-- DBMS_OUTPUT.PUT_LINE �Լ��� ����ϴ� ����� ȭ�鿡 �����ֵ��� Ȱ��ȭ
SET SERVEROUT ON;  
DECLARE     --�����
--java : Ÿ�� ������;
--pl/sql : ������ Ÿ��;
    /*v_dname VARCHAR2(14);
    v_loc VARCHAR2(13);*/
    --���̺� �÷��� ���Ǹ� �����Ͽ� ������ Ÿ���� �����Ѵ�.
    v_dname dept.dname %TYPE;
    v_loc dept.loc %TYPE;
BEGIN
            --dept ���̺��� 10�� �μ��� �μ��̸�, LOC ������ ��ȸ
            SELECT dname, loc
            INTO v_dname, v_loc
            FROM dept
            WHERE deptno = 10;
            --String a = "t";
            --String b = "v";
            --System.out.println(a + b);
            DBMS_OUTPUT.PUT_LINE(v_dname || v_loc);
END;
/

DESC dept;

--PL/SQL ���� ����




-- 10�� �μ��� �μ��̸��� ��ġ ������ ��ȸ�ؼ� ������ ���
-- ������ DBMS_OUTPUT.PUT_LINE �Լ��� �̿��Ͽ� console�� ���

CREATE OR REPLACE PROCEDURE printdept IS
--�����
    dname dept.dname %TYPE;
    loc dept.loc %TYPE;
    
--�����
BEGIN
    SELECT dname, loc
    INTO dname, loc
    FROM dept
    WHERE deptno = 10;
    
--����ó���� (�ɼ�)
    DBMS_OUTPUT.PUT_LINE(dname || ' ' || loc);
END;
/

exec printdept;

CREATE OR REPLACE PROCEDURE printdept
--�Ķ���͸� IN/OUT Ÿ��
-- p_
( p_deptno IN dept.deptno %TYPE )
IS
--�����
    dname dept.dname %TYPE;
    loc dept.loc %TYPE;
    
--�����
BEGIN
    SELECT dname, loc
    INTO dname, loc
    FROM dept
    WHERE deptno = p_deptno;
    
--����ó���� (�ɼ�)
    DBMS_OUTPUT.PUT_LINE(dname || ' ' || loc);
END;
/

exec printdept(40);

CREATE OR REPLACE PROCEDURE printemp
( p_empno IN emp.empno %TYPE )
IS

ename emp.ename %TYPE;
dname dept.dname %TYPE;

BEGIN
 SELECT ename, dname
 INTO ename, dname
 FROM emp, dept
 WHERE emp.deptno = dept.deptno
 AND emp.empno = p_empno;
 
  DBMS_OUTPUT.PUT_LINE(ename || ' ' || dname);
  END;
  /

exec printemp(7788);

CREATE OR REPLACE PROCEDURE registdept_test
(   p_deptno IN dept.deptno %TYPE ,
    p_dname IN dept.dname %TYPE,
    p_loc IN dept.loc %TYPE)
IS

deptno dept.deptno %TYPE;
dname dept.dname %TYPE;
loc dept.loc %TYPE;
BEGIN

INSERT INTO dept_test VALUES (p_deptno, p_dname, p_loc);
COMMIT;

END; 
/

exec registdept_test(99, 'ddit' , 'daejeon');



SELECT *
FROM dept_test;



