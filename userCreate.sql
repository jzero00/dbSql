--table space ?��?��
  CREATE TABLESPACE TS_DBSQL
   DATAFILE 'C:\oraclexe\app\oracle\oradata\XE\TS_201805F.DBF' 
   SIZE 100M 
   AUTOEXTEND ON;


--?��?��?�� 추�?
create user final identified by java
default tablespace TS_DBSQL
temporary tablespace temp
quota unlimited on TS_DBSQL
quota 0m on system;


--?��?��, ?��?��권한
GRANT CONNECT, RESOURCE TO final;
