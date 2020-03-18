SELECT *
FROM DBA_DATA_FILES;

--table space ���� (����Ÿ�� ����Ǵ� ����)
  CREATE TABLESPACE TS_DBSQL
   DATAFILE 'C:\ORACLEXE\APP\ORACLE\ORADATA\XE\DBSQL.DBF' 
   SIZE 100M 
   AUTOEXTEND ON;

--����� �߰�
create user PC05 identified by java
default tablespace TS_DBSQL
temporary tablespace temp
quota unlimited on TS_DBSQL --�뷮 ���� ����
quota 0m on system; --�ý��ۿ����� �����͸� �ִ� ���� ���´�.

--����, ��������
GRANT CONNECT, RESOURCE TO PC05;