--------------------------------------------------------
--  파일이 생성됨 - 화요일-4월-28-2020   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table MEMBER
--------------------------------------------------------

  CREATE TABLE "JAVA"."MEMBER" 
   (	"ID" VARCHAR2(100 BYTE), 
	"PWD" VARCHAR2(60 BYTE), 
	"NAME" VARCHAR2(30 BYTE), 
	"ENABLED" NUMBER DEFAULT 1, 
	"AUTHORITY" VARCHAR2(30 BYTE), 
	"PHONE" VARCHAR2(40 BYTE), 
	"ADDRESS" VARCHAR2(150 BYTE), 
	"EMAIL" VARCHAR2(50 BYTE), 
	"REGDATE" DATE DEFAULT sysdate
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "TS_DBSQL" ;

   COMMENT ON COLUMN "JAVA"."MEMBER"."ENABLED" IS '사용가능하면 1 아니면 0';
--------------------------------------------------------
--  DDL for Index MEMBER_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "JAVA"."MEMBER_PK" ON "JAVA"."MEMBER" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "TS_DBSQL" ;
--------------------------------------------------------
--  Constraints for Table MEMBER
--------------------------------------------------------

  ALTER TABLE "JAVA"."MEMBER" ADD CONSTRAINT "MEMBER_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "TS_DBSQL"  ENABLE;
  ALTER TABLE "JAVA"."MEMBER" MODIFY ("ID" NOT NULL ENABLE);
