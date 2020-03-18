--table space 생성
SELECT *
FROM DBA_DATA_FILES;

CREATE TABLESPACE middle
DATAFILE 'C:\oraclexe\app\oracle\oradata\XE\MIDDLE.DBF' 
SIZE 100M 
AUTOEXTEND ON;


--사용자 추가
create user middle identified by java
default tablespace MIDDLE
temporary tablespace temp
quota unlimited on MIDDLE
quota 0m on system;


--접속, 생성권한
GRANT CONNECT, RESOURCE TO MIDDLE;