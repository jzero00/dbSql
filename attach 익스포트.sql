--------------------------------------------------------
--  파일이 생성됨 - 월요일-4월-27-2020   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table ATTACH
--------------------------------------------------------

  CREATE TABLE "ATTACH" 
   (	"ANO" NUMBER, 
	"UPLOADPATH" VARCHAR2(300 BYTE), 
	"FILENAME" VARCHAR2(300 BYTE), 
	"PNO" NUMBER, 
	"ATTACHER" VARCHAR2(50 BYTE), 
	"REGDATE" DATE DEFAULT SYSDATE, 
	"FILETYPE" VARCHAR2(20 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "TS_DBSQL" ;
REM INSERTING into ATTACH
SET DEFINE OFF;
Insert into ATTACH (ANO,UPLOADPATH,FILENAME,PNO,ATTACHER,REGDATE,FILETYPE) values (1,'c:\pds\file\upload','2f3b2b8affce44ce96e780221f6167a4$$Pocket-watch-precision-struct_m.jpg',407,'mama',to_date('20/04/27','YY/MM/DD'),'jpg');
Insert into ATTACH (ANO,UPLOADPATH,FILENAME,PNO,ATTACHER,REGDATE,FILETYPE) values (4,'c:\pds\file\upload','75493f51945f43dc835fa75f5286eacd$$apache-tomcat-8.5.53.exe',409,'mama',to_date('20/04/27','YY/MM/DD'),'exe');
Insert into ATTACH (ANO,UPLOADPATH,FILENAME,PNO,ATTACHER,REGDATE,FILETYPE) values (2,'c:\pds\file\upload','fa1f49bf0c994302ba0468d8c5f59403$$1 (1).gif',408,'mama',to_date('20/04/27','YY/MM/DD'),'gif');
Insert into ATTACH (ANO,UPLOADPATH,FILENAME,PNO,ATTACHER,REGDATE,FILETYPE) values (3,'c:\pds\file\upload','2c5a68d4e1e841ffb1f30977ee68e584$$1 (1).jpg',408,'mama',to_date('20/04/27','YY/MM/DD'),'jpg');
--------------------------------------------------------
--  DDL for Index ATTATCH_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "ATTATCH_PK" ON "ATTACH" ("ANO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "TS_DBSQL" ;
--------------------------------------------------------
--  Constraints for Table ATTACH
--------------------------------------------------------

  ALTER TABLE "ATTACH" ADD CONSTRAINT "ATTATCH_PK" PRIMARY KEY ("ANO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "TS_DBSQL"  ENABLE;
  ALTER TABLE "ATTACH" MODIFY ("FILENAME" NOT NULL ENABLE);
  ALTER TABLE "ATTACH" MODIFY ("UPLOADPATH" NOT NULL ENABLE);
  ALTER TABLE "ATTACH" MODIFY ("ANO" NOT NULL ENABLE);
--------------------------------------------------------
--  Ref Constraints for Table ATTACH
--------------------------------------------------------

  ALTER TABLE "ATTACH" ADD CONSTRAINT "ATTATCH_FK1" FOREIGN KEY ("PNO")
	  REFERENCES "PDS" ("PNO") ON DELETE CASCADE ENABLE;

--------------------------------------------------------
--  Commit for Table ATTACH
--------------------------------------------------------
COMMIT;