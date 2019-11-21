--Ư�� ���̺��� �÷� ��ȸ
--1. DESC ���̺��
--2. SELECT * FROM user_tab_columns;

--prod ���̺��� �÷� ��ȸ
--DESC prod;

--VARCHAR2, CHAR --> ���ڿ� (Charater)
--NUNMBER --> ���� 
--CLOB --> Charater Large OBject, ���ڿ� Ÿ���� ���� ������ ���ϴ� Ÿ��   
        -- �ִ� ������ : VARCHAR(4000) , CLOB : 4GB
--DATE --> ��¥(�Ͻ� = ��, ��, �� + �ð�, ��, ��)

--date Ÿ�Կ� ���� ������ �����?
--'2019/11/20 09:16:20' + 1 = ?

--USERS ���̺��� ��� �÷��� ��ȸ�غ�����
SELECT*
FROM users;

--userid, usernm, reg_dt ������ �÷��� ��ȸ
--������ ���� ���ο� �÷��� ���� (reg_dt�� ���� ������ �� ���ο� ���� �÷�)
--��¥ + ���� ���� ==> ���ڸ� ���� ��¥ Ÿ���� ����� ���´�.
--��Ī : ���� �÷����̳� ������ ���� ������ ���� �÷��� ������ �÷��̸��� �ο�
--      col | express [AS] ��Ī��
SELECT userid, usernm, reg_dt reg_date, reg_dt+5 AS after5day
FROM users;

-- ���� ���, ���ڿ� ��� ( oracle : '', java : '', "")
-- table�� ���� ���� ���Ƿ� �÷����� ����
-- ���ڿ� ���� ����  (+, -, *, /)
-- ���ڿ� ���� ���� ( +�� �������� ���� , �� || )
SELECT (10-2)*2, 'DB SQL ����',
        /*userid '_modified' , ���ڿ� ������ ���ϱ� ������ ����.*/
        usernm || '_modified' usernm, reg_dt
FROM users;

--NULL : ���� �𸣴� ��
--NULL�� ���� ���� ����� �׻� NULL�̴�.
--DESC ���̺� �� : NOT NULL�� �����Ǿ� �ִ� �÷����� ���� �ݵ�� ���� �Ѵ�.

--users ���ʿ��� ������ ����
SELECT *
FROM users;

DELETE users
WHERE userid NOT IN ('brown', 'sally', 'cony', 'moon', 'james');

rollback;
commit;

SELECT userid, usernm, reg_dt
FROM users;

--null ������ �����غ��� ���� moon�� reg_dt �÷��� null�� ����
UPDATE users SET reg_dt = NULL
WHERE userid = 'moon';

COMMIT;


--users ���̺��� reg_dt �÷����� 5���� ���� ���ο� �÷��� ����
--NULL���� ���� ������ ����� NULL�̴�.
SELECT userid, usernm, reg_dt, reg_dt+5
FROM users;

--Column alias (�ǽ� select2)
--prod ���̺��� prod_id, prod_name �� �÷��� ��ȸ�ϴ� ������ �ۼ��Ͻÿ�.
--(�� prod_id �� id, prod_name �� name ���� �÷� ������ ����
SELECT prod_id id, prod_name name
FROM prod;

--lprod ���̺��� lprod_gu, lprod_nm �� �÷��� ��ȸ�ϴ� ������ �ۼ��Ͻÿ�.
--�� lprod_gu �� gu, lprod_nm �� nm���� �÷� ��Ī�� ����)
SELECT lprod_gu gu, lprod_nm nm
FROM lprod;

--buyer ���̺��� buyer_id, buyer_name �� �÷��� ��ȸ�ϴ� ������ �ۼ��Ͻÿ�
--(�� buyer_id �� ���̾���̵�, buyer_name �� �̸� ���� �÷� ��Ī�� ����)
SELECT buyer_id �ٺ����̵�, buyer_name �̸�
FROM buyer;

--���ڿ� �÷��� ����    (�÷� || �÷�, '���ڿ����' || �÷�) CONCAT�� ##����ϴ� ��� : CONCAT(�÷�, �÷�)
SELECT userid, usernm,  
       userid || usernm AS id_nm,
       CONCAT (userid, usernm) con_id_nm,

       -- ||�� �̿��ؼ� userid, usernm, pass
       userid||usernm||pass id_nm_pass,
        --CONCAT�� �̿��ؼ� userid, usernm, pass
        CONCAT(userid, CONCAT(usernm, pass)) con_id_nm_pass
FROM users;

--����ڰ� ������ ���̺� ��� ��ȸ
SELECT table_name
FROM USER_TABLES;

SELECT *
FROM lprod;

--Literal Charater, Concatenation (���ڿ� ���� �ǽ� sel_con1)
-- ���� ������ ����ڰ� ������ ���̺� ����� ��ȸ
SELECT table_name
FROM USER_TABLES;

--���ڿ� ������ �̿��Ͽ� ������ ���� ��ȸ�ǵ��� ������ �ۼ��Ͻÿ�
--LPOED �� SELECT * FROM LPROD; �� ���ս�Ű��
SELECT 'SELECT * FROM ' || table_name || ';' QUERY
FROM USER_TABLES;

    --CONCAT �Լ��� �̿��ؼ�
SELECT CONCAT(CONCAT('SELECT * FROM ', table_name),';') query
FROM USER_TABLES;

--WHERE : ������ ��ġ�ϴ� �ุ ��ȸ�ϱ� ���� ���
--        �࿡ ���� ��ȸ ������ �ۼ�
--WHERE���� ������ �ش� ���̺��� ��� �࿡ ���� ��ȸ

SELECT userid, usernm, alias, reg_dt
FROM users;

SELECT userid, usernm, alias, reg_dt
FROM users
WHERE userid = 'brown'; -- userid �÷��� 'brown'�� ��(row)�� ��ȸ

--emp���̺��� ��ü ������ ��ȸ (��� ��, ��)
SELECT *
FROM emp;

--�μ���ȣ�� (deptno) �� 20���� ũ�ų� ���� �μ����� ���ϴ� ���� ���� ��ȸ

SELECT *
FROM emp
WHERE deptno >= 20;

--�����ȣ�� 7700���� ũ�ų� ���� ����� ������ ��ȸ
SELECT *
FROM emp
WHERE empno >= 7700;

--����Ի����ڰ� 1982�� 1�� 1�� ������ ��� ���� ��ȸ
--���ڿ� �� ��¥ Ÿ������ ���� : TO_DATE('��¥ ���ڿ�",'��¥ ���ڿ� ����')
--�ѱ� ��¥ ǥ�� : ��-��-��
--�̱� ��¥ ǥ�� : ��-��-�� 
SELECT empno, ename, hiredate,
       2000 no, '���ڿ� ���' str, TO_DATE('19820101' , 'yyyymmdd')
FROM emp
WHERE hiredate>= TO_DATE('19820101', 'YYYYMMDD');

--���� ��ȸ (BETWEEN ���۱��� AND �������)
-- ���۱���, ��������� ����
--����߿��� �޿� (sal)�� 1000���� ũ�ų� ����, 2000���� �۰ų� ���� ��� ������ȸ
SELECT *
FROM emp
WHERE sal BETWEEN 1000 AND 2000;

--BETWEEN AND �����ڴ� �ε�ȣ �����ڷ� ��ü ����
SELECT *
FROM emp
WHERE sal >= 1000
AND   sal <= 2000;

--���ǿ� �´� ������ ��ȸ�ϱ� (BETWEEN ... AND ... �ǽ� whrer1)
--emp ���̺��� �Ի� ���ڰ� 1982�� 1�� 1�� ���ĺ��� 1983�� 1�� 1�� ������ �����
--ename, hiredate �����͸� ��ȸ�ϴ� ������ �ۼ��Ͻÿ� (�� �����ڴ� between�� ����Ѵ�)
SELECT ename, hiredate
FROM emp
WHERE hiredate BETWEEN TO_DATE('19820101','yyyymmdd') AND
                       TO_DATE('19830101','yyyyddmm');
                       
--�� �����ڸ� ����϶�
SELECT ename, hiredate
FROM emp
WHERE hiredate >= TO_DATE('19820101','yyyymmdd')
AND   hiredate <= TO_DATE('19830101','yyyymmdd');