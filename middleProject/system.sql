--table space ����
SELECT *
FROM DBA_DATA_FILES;

CREATE TABLESPACE middle
DATAFILE 'C:\oraclexe\app\oracle\oradata\XE\MIDDLE.DBF' 
SIZE 100M 
AUTOEXTEND ON;


--����� �߰�
create user middle identified by java
default tablespace MIDDLE
temporary tablespace temp
quota unlimited on MIDDLE
quota 0m on system;


--����, ��������
GRANT CONNECT, RESOURCE TO MIDDLE;