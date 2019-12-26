-- EXCEPTION
-- ���� �߻��� ���α׷��� �����Ű�� �ʰ�
-- �ش� ���ܿ� ���� �ٸ� ������ �����ų �� �ְԲ� ó���Ѵ�.

-- ���ܰ� �߻��ߴµ� ���� ó���� ���� ��� : pl/sql ����� ������ �Բ� ����ȴ�.
-- �������� SELECT ����� �����ϴ� ��Ȳ���� ��Į�� ������ ���� �ִ� ��Ȳ

-- emp���̺��� ����̸��� ��ȸ
SET SERVEROUTPUT ON;
DECLARE
        --��� �̸��� ������ �� �ִ� ����
        v_ename emp.ename%TYPE;
        
BEGIN
        -- 14���� SELECT ����� ������ SQL �� ��Į�� ������ ������ �Ұ����ϴ�. ( ���� )
        SELECT ename
        INTO v_ename
        FROM emp;
        
EXCEPTION  
        WHEN TOO_MANY_ROWS THEN
                DBMS_OUTPUT.PUT_LINE('�������� SELECT ����� ����');
        WHEN OTHERS THEN
                DBMS_OUTPUT.PUT_LINE('WHEN OTHERS');
END;
/

-- ����� ���� ����
-- ����Ŭ���� ������ ������ ���� �̿ܿ��� �����ڰ� �ش� ����Ʈ���� �����Ͻ� �������� ������ ���ܸ� ����, ����� �� �ִ�.
-- ������� SELECT ����� ���� ��Ȳ���� ����Ŭ������ NO_DATA_FOUND ���ܸ� ������
-- �ش� ���ܸ� ��� NO_EMP��� �����ڰ� ������ ���ܷ� ������ �Ͽ� ���ܸ� ���� �� �ִ�.

--
DECLARE
        -- emp ���̺� ��ȸ ����� ������ ����� ����� ���� ����
        -- ���ܸ� EXCEPTION;
        no_emp EXCEPTION;
        v_name emp.ename%TYPE;
BEGIN
        
        -- NO_DATA_DOUND
        BEGIN
                SELECT ename
                INTO v_ename
                FROM emp
                WHERE empno = 7000;
        EXCEPTION
                WHEN NO_DATA_FOUND THEN
                        RAISE no_emp;                      --java throw new NoEMPException ()
        END;
        
EXCEPTION
        WHEN no_emp THEN
                DBMS_OUTPUT.PUT_LINE('NO_EMP');
END;
/

-- ����� �Է¹޾Ƽ� �ش� ������ �̸��� �����ϴ� �Լ�
-- getEmpName(7369) �� SMITH

CREATE OR REPLACE FUNCTION getEmpName (p_empno emp.empno%TYPE)
RETURN VARCHAR2 IS

        -- �����
        v_ename emp.ename%TYPE;
BEGIN
        SELECT ename
        INTO v_ename
        FROM emp
        WHERE empno = p_empno;
        
        return v_ename;
END;
/

SELECT getEmpName(7369)
FROM dual;

CREATE OR REPLACE FUNCTION getDeptName (p_deptno dept.deptno%TYPE)
RETURN VARCHAR2 IS
        v_dname dept.dname%TYPE;
BEGIN
        SELECT dname
        INTO v_dname
        FROM dept
        WHERE deptno = p_deptno;
        
        return v_dname;
END;
/

SELECT getDeptName(10)
FROM dual;


-- cache : 20
-- ������ ������ :
-- deptno (�ߺ��߻� ����) : �������� ���� �ʴ�.
-- empno (�ߺ��� ����) : �������� ����.

--emp���̺��� �����Ͱ� 100�����ΰ��
-- 100���߿��� deptno�� ������ 4�� (10~40)
SELECT  getdeptname(deptno),         --4����
                getempname(empno)           --row ����ŭ �����Ͱ� ���� 
FROM emp;
--�������� ���� ������ �Լ��� ����ϰ� �������� ������ join�� ����

SELECT deptcd, LPAD('',(LEVEL - 1) * 4 , '') || deptnm deptnm, LEVEL
FROM dept_h
START WITH p_deptcd IS NULL
CONNECT BY PRIOR deptcd = p_deptcd;

CREATE OR REPLACE FUNCTION indent (p_lv NUMBER, p_dname VARCHAR2)
RETURN VARCHAR2 IS
        v_dname VARCHAR2(200);
BEGIN
        
        SELECT LPAD('   ',(p_lv - 1) * 4 , '    ') || p_dname
        INTO v_dname
        FROM dual;
        
        return v_dname;
END;
/



SELECT deptcd, indent (LEVEL, deptnm), LEVEL
FROM dept_h
START WITH p_deptcd IS NULL
CONNECT BY PRIOR deptcd = p_deptcd;

-- users ���̺��� ��й�ȣ �÷��� ������ ��������
-- ������ ����ϴ� ��й�ȣ �÷� �̷��� �����ϱ� ���� ���̺�
CREATE TABLE users_history   (
        userid VARCHAR2 (20),
        pass VARCHAR2 (100),
        mod_dt DATE
);

CREATE OR REPLACE TRIGGER make_history
        --timing
        BEFORE UPDATE ON USERS
        FOR EACH ROW        --��Ʈ����, ���� ������ ���������� �����Ѵ�.
        -- ���� ������ ���� : OLD
        -- ���� ������ ���� : NEW
        BEGIN
                --users ���̺��� pass �÷��� ������ �� trigger ����
                IF :OLD.pass != :NEW.pass THEN
                        INSERT INTO users_history
                                VALUES(:OLD.userid, :OLD.pass, sysdate);
                END IF;
                -- �ٸ� �÷��� ���ؼ��� �����Ѵ�.
        END;
        /
-- users ���̺��� pass�÷��� ����������
-- trigger�� ���ؼ� users_history ���̺� �̷��� �����Ǵ��� Ȯ��

SELECT*
FROM users_history;

UPDATE users SET pass = '1234'
WHERE userid = 'brown';

SELECT*
FROM users_history;