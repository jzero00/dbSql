--------------------------------------------------------
--  파일이 생성됨 - 월요일-4월-27-2020   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table BOARD
--------------------------------------------------------

  CREATE TABLE "JAVA"."BOARD" 
   (	"BNO" NUMBER DEFAULT 1, 
	"TITLE" VARCHAR2(200 BYTE), 
	"WRITER" VARCHAR2(50 BYTE), 
	"CONTENT" VARCHAR2(3200 BYTE), 
	"VIEWCNT" NUMBER DEFAULT 0, 
	"REGDATE" DATE DEFAULT sysdate, 
	"UPDATEDATE" DATE DEFAULT sysdate
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "TS_DBSQL" ;
REM INSERTING into JAVA.BOARD
SET DEFINE OFF;
Insert into JAVA.BOARD (BNO,TITLE,WRITER,CONTENT,VIEWCNT,REGDATE,UPDATEDATE) values (163,'test제목','mama','<p>rqwrqwf</p>',32,to_date('20/04/22','YY/MM/DD'),to_date('20/04/22','YY/MM/DD'));
Insert into JAVA.BOARD (BNO,TITLE,WRITER,CONTENT,VIEWCNT,REGDATE,UPDATEDATE) values (84,'제목2','mama','내용2',3,to_date('20/04/21','YY/MM/DD'),to_date('20/04/21','YY/MM/DD'));
Insert into JAVA.BOARD (BNO,TITLE,WRITER,CONTENT,VIEWCNT,REGDATE,UPDATEDATE) values (85,'제목3','mama','내용3',68,to_date('20/04/21','YY/MM/DD'),to_date('20/04/21','YY/MM/DD'));
Insert into JAVA.BOARD (BNO,TITLE,WRITER,CONTENT,VIEWCNT,REGDATE,UPDATEDATE) values (89,'제목2','mama','내용2',2,to_date('20/04/21','YY/MM/DD'),to_date('20/04/21','YY/MM/DD'));
Insert into JAVA.BOARD (BNO,TITLE,WRITER,CONTENT,VIEWCNT,REGDATE,UPDATEDATE) values (134,'제목2','mama','내용2',0,to_date('20/04/21','YY/MM/DD'),to_date('20/04/21','YY/MM/DD'));
Insert into JAVA.BOARD (BNO,TITLE,WRITER,CONTENT,VIEWCNT,REGDATE,UPDATEDATE) values (135,'제목3','mama','내용3',0,to_date('20/04/21','YY/MM/DD'),to_date('20/04/21','YY/MM/DD'));
Insert into JAVA.BOARD (BNO,TITLE,WRITER,CONTENT,VIEWCNT,REGDATE,UPDATEDATE) values (136,'제목4','mama','내용4',0,to_date('20/04/21','YY/MM/DD'),to_date('20/04/21','YY/MM/DD'));
Insert into JAVA.BOARD (BNO,TITLE,WRITER,CONTENT,VIEWCNT,REGDATE,UPDATEDATE) values (137,'제목5','mama','내용5',0,to_date('20/04/21','YY/MM/DD'),to_date('20/04/21','YY/MM/DD'));
Insert into JAVA.BOARD (BNO,TITLE,WRITER,CONTENT,VIEWCNT,REGDATE,UPDATEDATE) values (139,'제목2','mama','내용2',0,to_date('20/04/21','YY/MM/DD'),to_date('20/04/21','YY/MM/DD'));
Insert into JAVA.BOARD (BNO,TITLE,WRITER,CONTENT,VIEWCNT,REGDATE,UPDATEDATE) values (140,'제목3','mama','내용3',0,to_date('20/04/21','YY/MM/DD'),to_date('20/04/21','YY/MM/DD'));
Insert into JAVA.BOARD (BNO,TITLE,WRITER,CONTENT,VIEWCNT,REGDATE,UPDATEDATE) values (141,'제목4','mama','내용4',0,to_date('20/04/21','YY/MM/DD'),to_date('20/04/21','YY/MM/DD'));
Insert into JAVA.BOARD (BNO,TITLE,WRITER,CONTENT,VIEWCNT,REGDATE,UPDATEDATE) values (142,'제목5','mama','내용5',0,to_date('20/04/21','YY/MM/DD'),to_date('20/04/21','YY/MM/DD'));
Insert into JAVA.BOARD (BNO,TITLE,WRITER,CONTENT,VIEWCNT,REGDATE,UPDATEDATE) values (144,'제목2','mama','내용2',0,to_date('20/04/21','YY/MM/DD'),to_date('20/04/21','YY/MM/DD'));
Insert into JAVA.BOARD (BNO,TITLE,WRITER,CONTENT,VIEWCNT,REGDATE,UPDATEDATE) values (145,'제목3','mama','내용3',25,to_date('20/04/21','YY/MM/DD'),to_date('20/04/21','YY/MM/DD'));
Insert into JAVA.BOARD (BNO,TITLE,WRITER,CONTENT,VIEWCNT,REGDATE,UPDATEDATE) values (154,'제목2','mama','<p>내용2</p><p><img src="/getImg.do?fileName=8202aa0da03d422f887e7f8abcf5bd15.jpg" style="width: 50%;"></p>',2,to_date('20/04/21','YY/MM/DD'),to_date('20/04/23','YY/MM/DD'));
Insert into JAVA.BOARD (BNO,TITLE,WRITER,CONTENT,VIEWCNT,REGDATE,UPDATEDATE) values (166,'title','mama','<p>수정6</p>',64,to_date('20/04/22','YY/MM/DD'),to_date('20/04/27','YY/MM/DD'));
--------------------------------------------------------
--  DDL for Index BOARD_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "JAVA"."BOARD_PK" ON "JAVA"."BOARD" ("BNO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "TS_DBSQL" ;
--------------------------------------------------------
--  Constraints for Table BOARD
--------------------------------------------------------

  ALTER TABLE "JAVA"."BOARD" MODIFY ("TITLE" NOT NULL ENABLE);
  ALTER TABLE "JAVA"."BOARD" MODIFY ("WRITER" NOT NULL ENABLE);
  ALTER TABLE "JAVA"."BOARD" ADD CONSTRAINT "BOARD_PK" PRIMARY KEY ("BNO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "TS_DBSQL"  ENABLE;
  ALTER TABLE "JAVA"."BOARD" MODIFY ("BNO" NOT NULL ENABLE);
--------------------------------------------------------
--  Ref Constraints for Table BOARD
--------------------------------------------------------

  ALTER TABLE "JAVA"."BOARD" ADD CONSTRAINT "BOARD_FK1" FOREIGN KEY ("WRITER")
	  REFERENCES "JAVA"."MEMBER" ("ID") ENABLE;
