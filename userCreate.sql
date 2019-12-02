--table space ?Éù?Ñ±
  CREATE TABLESPACE TS_DBSQL
   DATAFILE 'C:\oraclexe\app\oracle\oradata\XE\TS_201805F.DBF' 
   SIZE 100M 
   AUTOEXTEND ON


--?Ç¨?ö©?ûê Ï∂îÍ?
create user PC05 identified by java
default tablespace TS_DBSQL
temporary tablespace temp
quota unlimited on TS_DBSQL
quota 0m on system;


--?†ë?Üç, ?Éù?Ñ±Í∂åÌïú
GRANT CONNECT, RESOURCE TO PC05;
