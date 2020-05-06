--------------------------------------------------------
--  파일이 생성됨 - 화요일-4월-28-2020   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table REPLY
--------------------------------------------------------

  CREATE TABLE "ZERO"."REPLY" 
   (	"RNO" NUMBER, 
	"BNO" NUMBER, 
	"REPLYTEXT" VARCHAR2(600 BYTE), 
	"REPLYER" VARCHAR2(50 BYTE), 
	"REGDATE" DATE DEFAULT sysdate, 
	"UPDATEDATE" DATE DEFAULT sysdate
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "TS_DBSQL" ;
--------------------------------------------------------
--  Constraints for Table REPLY
--------------------------------------------------------

  ALTER TABLE "JAVA"."REPLY" MODIFY ("RNO" NOT NULL ENABLE);
  ALTER TABLE "JAVA"."REPLY" MODIFY ("REPLYTEXT" NOT NULL ENABLE);
