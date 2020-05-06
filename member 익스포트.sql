--------------------------------------------------------
--  파일이 생성됨 - 월요일-4월-27-2020   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table MEMBER
--------------------------------------------------------

  CREATE TABLE "MEMBER" 
   (	"ID" VARCHAR2(50 BYTE), 
	"PWD" VARCHAR2(60 BYTE), 
	"NAME" VARCHAR2(30 BYTE), 
	"ENABLED" NUMBER DEFAULT 1, 
	"PICTURE" VARCHAR2(150 BYTE), 
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

   COMMENT ON COLUMN "MEMBER"."ENABLED" IS '사용가능하면 1 아니면 0';
REM INSERTING into MEMBER
SET DEFINE OFF;
Insert into MEMBER (ID,PWD,NAME,ENABLED,PICTURE,AUTHORITY,PHONE,ADDRESS,EMAIL,REGDATE) values ('test','test','키자루',1,'57fad8d3d4ab4de8a5b96d43c9e939d4.jpg','ROLE_ADMIN','01012357895',null,'hogu@hogu.com',to_date('20/04/17','YY/MM/DD'));
Insert into MEMBER (ID,PWD,NAME,ENABLED,PICTURE,AUTHORITY,PHONE,ADDRESS,EMAIL,REGDATE) values ('caca','caca','caca',0,'8be6aa3d788743bdb2c01544f1f26d45.jpg','ROLE_USER','01123456324',null,'test',to_date('20/04/21','YY/MM/DD'));
Insert into MEMBER (ID,PWD,NAME,ENABLED,PICTURE,AUTHORITY,PHONE,ADDRESS,EMAIL,REGDATE) values ('mymy','mymy','아이린',1,'f517ee1e9b284c91a7549350d0116b23.jpg',null,'01023457896',null,'irien@revel.com',to_date('20/04/17','YY/MM/DD'));
Insert into MEMBER (ID,PWD,NAME,ENABLED,PICTURE,AUTHORITY,PHONE,ADDRESS,EMAIL,REGDATE) values ('mama','mama123','공승연',1,'ba049fc500de4a2bb7dcf98ec22fa805.jpg','ROLE_USER','01078951234',null,'ksy@zero.com',to_date('20/04/17','YY/MM/DD'));
Insert into MEMBER (ID,PWD,NAME,ENABLED,PICTURE,AUTHORITY,PHONE,ADDRESS,EMAIL,REGDATE) values (' drkim','drkim','김사부',1,'c1cb6ff8ecc0476d9bd927f8b73f043d.jpg',null,'01123451234',null,'drkim@doldam.com',to_date('20/04/17','YY/MM/DD'));
Insert into MEMBER (ID,PWD,NAME,ENABLED,PICTURE,AUTHORITY,PHONE,ADDRESS,EMAIL,REGDATE) values ('mrchoi','mrchoi','최익현',1,'48ebbba9b80d41bda31e7598af712ec1.jpg',null,'01023456754',null,'gangchio@crime.com',to_date('20/04/17','YY/MM/DD'));
Insert into MEMBER (ID,PWD,NAME,ENABLED,PICTURE,AUTHORITY,PHONE,ADDRESS,EMAIL,REGDATE) values ('kimpan','kiapan','김판호',1,'80e5e8ae2d8140c492fbacf00ea03044.jpg',null,'01112357895',null,'kiapango@crime.com',to_date('20/04/17','YY/MM/DD'));
Insert into MEMBER (ID,PWD,NAME,ENABLED,PICTURE,AUTHORITY,PHONE,ADDRESS,EMAIL,REGDATE) values ('irondragon','123','곽철용',1,'f3b007e3ba6e4df3acc7da33088b8589.jpg',null,'01023534577',null,'theblue@tazza.com',to_date('20/04/17','YY/MM/DD'));
Insert into MEMBER (ID,PWD,NAME,ENABLED,PICTURE,AUTHORITY,PHONE,ADDRESS,EMAIL,REGDATE) values ('jobo','jobo','조보아',1,'9052755d68964f5a8b55276e3875b909.jpg',null,'01032152364',null,'joboa@actor.com',to_date('20/04/17','YY/MM/DD'));
Insert into MEMBER (ID,PWD,NAME,ENABLED,PICTURE,AUTHORITY,PHONE,ADDRESS,EMAIL,REGDATE) values ('sejong','123','세종',1,'4776f026ee034423852053bb464b89c4.jpg',null,'01023451253',null,'sejong@josun.com',to_date('20/04/17','YY/MM/DD'));
Insert into MEMBER (ID,PWD,NAME,ENABLED,PICTURE,AUTHORITY,PHONE,ADDRESS,EMAIL,REGDATE) values ('hogu2','123','호구선생',1,'551e3b50a16a47b5905ecd4dafd8405d.jpg',null,'01198751267',null,'test',to_date('20/04/20','YY/MM/DD'));
Insert into MEMBER (ID,PWD,NAME,ENABLED,PICTURE,AUTHORITY,PHONE,ADDRESS,EMAIL,REGDATE) values ('hogu','hogu','호구',1,'2568d7d4f2644e62885eca061e2d31e4.jpg','ROLE_USER','01178954567',null,'hogu@hogu.com',to_date('20/04/17','YY/MM/DD'));
Insert into MEMBER (ID,PWD,NAME,ENABLED,PICTURE,AUTHORITY,PHONE,ADDRESS,EMAIL,REGDATE) values ('zaza','zaza','코와이네',1,'85f090ee60fe40afb7dff06f66589238.jpg','ROLE_USER','01078954567',null,'kizaru@zero.com',to_date('20/04/16','YY/MM/DD'));
Insert into MEMBER (ID,PWD,NAME,ENABLED,PICTURE,AUTHORITY,PHONE,ADDRESS,EMAIL,REGDATE) values ('tazza','tazza','평경장',1,'c761ddbd45584f4dbc2c72afa77c84a7.jpg',null,'01012345679',null,'tazza1@tazza.com',to_date('20/04/16','YY/MM/DD'));
Insert into MEMBER (ID,PWD,NAME,ENABLED,PICTURE,AUTHORITY,PHONE,ADDRESS,EMAIL,REGDATE) values ('bbal','bbal','김실장',1,'4f0f9dc1ecb64cb7af07587269c3cd5c.jpg','ROLE_USER','01078957895',null,'bbal@tazza.com',to_date('20/04/10','YY/MM/DD'));
Insert into MEMBER (ID,PWD,NAME,ENABLED,PICTURE,AUTHORITY,PHONE,ADDRESS,EMAIL,REGDATE) values ('hwaran','hwaran','화란',1,'fce681a8a063414e992b9c8f129cf06e.jpg',null,'01012356879',null,'hwaran@tazza.com',to_date('20/04/09','YY/MM/DD'));
--------------------------------------------------------
--  DDL for Index MEMBER_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "MEMBER_PK" ON "MEMBER" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "TS_DBSQL" ;
--------------------------------------------------------
--  Constraints for Table MEMBER
--------------------------------------------------------

  ALTER TABLE "MEMBER" ADD CONSTRAINT "MEMBER_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "TS_DBSQL"  ENABLE;
  ALTER TABLE "MEMBER" MODIFY ("ID" NOT NULL ENABLE);

--------------------------------------------------------
--  Commit for Table MEMBER
--------------------------------------------------------
COMMIT;