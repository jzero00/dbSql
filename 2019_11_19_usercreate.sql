SELECT *
FROM DBA_DATA_FILES;

--table space 생성 (데이타가 저장되는 공간)
  CREATE TABLESPACE TS_DBSQL
   DATAFILE 'C:\ORACLEXE\APP\ORACLE\ORADATA\XE\DBSQL.DBF' 
   SIZE 100M 
   AUTOEXTEND ON;

--사용자 추가
create user PC05 identified by java
default tablespace TS_DBSQL
temporary tablespace temp
quota unlimited on TS_DBSQL --용량 제한 없음
quota 0m on system; --시스템에서는 데이터를 넣는 것을 막는다.

--접속, 생성권한
GRANT CONNECT, RESOURCE TO PC05;