--------------------------------------------------------
--  파일이 생성됨 - 월요일-4월-27-2020   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table REPLY
--------------------------------------------------------

  CREATE TABLE "JAVA"."REPLY" 
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
REM INSERTING into JAVA.REPLY
SET DEFINE OFF;
Insert into JAVA.REPLY (RNO,BNO,REPLYTEXT,REPLYER,REGDATE,UPDATEDATE) values (130,166,'띠로리?','mama',to_date('20/04/23','YY/MM/DD'),to_date('20/04/23','YY/MM/DD'));
Insert into JAVA.REPLY (RNO,BNO,REPLYTEXT,REPLYER,REGDATE,UPDATEDATE) values (131,166,'하하하하하','mama',to_date('20/04/23','YY/MM/DD'),to_date('20/04/23','YY/MM/DD'));
Insert into JAVA.REPLY (RNO,BNO,REPLYTEXT,REPLYER,REGDATE,UPDATEDATE) values (132,166,'사쿠라여?','hogu',to_date('20/04/23','YY/MM/DD'),to_date('20/04/23','YY/MM/DD'));
Insert into JAVA.REPLY (RNO,BNO,REPLYTEXT,REPLYER,REGDATE,UPDATEDATE) values (133,166,'사장 나랑 바둑한판두세 내가 알려줄게~~','hogu',to_date('20/04/23','YY/MM/DD'),to_date('20/04/23','YY/MM/DD'));
Insert into JAVA.REPLY (RNO,BNO,REPLYTEXT,REPLYER,REGDATE,UPDATEDATE) values (135,166,'코와이네... ','mama',to_date('20/04/27','YY/MM/DD'),to_date('20/04/27','YY/MM/DD'));
Insert into JAVA.REPLY (RNO,BNO,REPLYTEXT,REPLYER,REGDATE,UPDATEDATE) values (0,85,'댓글입니다.','평경장',to_date('20/04/21','YY/MM/DD'),to_date('20/04/21','YY/MM/DD'));
Insert into JAVA.REPLY (RNO,BNO,REPLYTEXT,REPLYER,REGDATE,UPDATEDATE) values (1,85,'댓글입니다.','평경장',to_date('20/04/21','YY/MM/DD'),to_date('20/04/21','YY/MM/DD'));
Insert into JAVA.REPLY (RNO,BNO,REPLYTEXT,REPLYER,REGDATE,UPDATEDATE) values (2,85,'댓글입니다.','평경장',to_date('20/04/21','YY/MM/DD'),to_date('20/04/21','YY/MM/DD'));
Insert into JAVA.REPLY (RNO,BNO,REPLYTEXT,REPLYER,REGDATE,UPDATEDATE) values (3,85,'댓글입니다.','평경장',to_date('20/04/21','YY/MM/DD'),to_date('20/04/21','YY/MM/DD'));
Insert into JAVA.REPLY (RNO,BNO,REPLYTEXT,REPLYER,REGDATE,UPDATEDATE) values (4,85,'댓글입니다.','평경장',to_date('20/04/21','YY/MM/DD'),to_date('20/04/21','YY/MM/DD'));
Insert into JAVA.REPLY (RNO,BNO,REPLYTEXT,REPLYER,REGDATE,UPDATEDATE) values (5,85,'댓글입니다.','평경장',to_date('20/04/21','YY/MM/DD'),to_date('20/04/21','YY/MM/DD'));
Insert into JAVA.REPLY (RNO,BNO,REPLYTEXT,REPLYER,REGDATE,UPDATEDATE) values (6,85,'댓글입니다.','평경장',to_date('20/04/21','YY/MM/DD'),to_date('20/04/21','YY/MM/DD'));
Insert into JAVA.REPLY (RNO,BNO,REPLYTEXT,REPLYER,REGDATE,UPDATEDATE) values (7,85,'댓글입니다.','평경장',to_date('20/04/21','YY/MM/DD'),to_date('20/04/21','YY/MM/DD'));
Insert into JAVA.REPLY (RNO,BNO,REPLYTEXT,REPLYER,REGDATE,UPDATEDATE) values (8,85,'댓글입니다.','평경장',to_date('20/04/21','YY/MM/DD'),to_date('20/04/21','YY/MM/DD'));
Insert into JAVA.REPLY (RNO,BNO,REPLYTEXT,REPLYER,REGDATE,UPDATEDATE) values (9,85,'댓글입니다.','평경장',to_date('20/04/21','YY/MM/DD'),to_date('20/04/21','YY/MM/DD'));
Insert into JAVA.REPLY (RNO,BNO,REPLYTEXT,REPLYER,REGDATE,UPDATEDATE) values (10,85,'댓글입니다.','평경장',to_date('20/04/21','YY/MM/DD'),to_date('20/04/21','YY/MM/DD'));
Insert into JAVA.REPLY (RNO,BNO,REPLYTEXT,REPLYER,REGDATE,UPDATEDATE) values (11,85,'댓글입니다.','평경장',to_date('20/04/21','YY/MM/DD'),to_date('20/04/21','YY/MM/DD'));
Insert into JAVA.REPLY (RNO,BNO,REPLYTEXT,REPLYER,REGDATE,UPDATEDATE) values (12,85,'댓글입니다.','평경장',to_date('20/04/21','YY/MM/DD'),to_date('20/04/21','YY/MM/DD'));
Insert into JAVA.REPLY (RNO,BNO,REPLYTEXT,REPLYER,REGDATE,UPDATEDATE) values (13,85,'댓글입니다.','평경장',to_date('20/04/21','YY/MM/DD'),to_date('20/04/21','YY/MM/DD'));
Insert into JAVA.REPLY (RNO,BNO,REPLYTEXT,REPLYER,REGDATE,UPDATEDATE) values (14,85,'댓글입니다.','평경장',to_date('20/04/21','YY/MM/DD'),to_date('20/04/21','YY/MM/DD'));
Insert into JAVA.REPLY (RNO,BNO,REPLYTEXT,REPLYER,REGDATE,UPDATEDATE) values (15,85,'댓글입니다.','평경장',to_date('20/04/21','YY/MM/DD'),to_date('20/04/21','YY/MM/DD'));
Insert into JAVA.REPLY (RNO,BNO,REPLYTEXT,REPLYER,REGDATE,UPDATEDATE) values (16,85,'댓글입니다.','평경장',to_date('20/04/21','YY/MM/DD'),to_date('20/04/21','YY/MM/DD'));
Insert into JAVA.REPLY (RNO,BNO,REPLYTEXT,REPLYER,REGDATE,UPDATEDATE) values (17,85,'댓글입니다.','평경장',to_date('20/04/21','YY/MM/DD'),to_date('20/04/21','YY/MM/DD'));
Insert into JAVA.REPLY (RNO,BNO,REPLYTEXT,REPLYER,REGDATE,UPDATEDATE) values (18,85,'댓글입니다.','평경장',to_date('20/04/21','YY/MM/DD'),to_date('20/04/21','YY/MM/DD'));
Insert into JAVA.REPLY (RNO,BNO,REPLYTEXT,REPLYER,REGDATE,UPDATEDATE) values (19,85,'댓글입니다.','평경장',to_date('20/04/21','YY/MM/DD'),to_date('20/04/21','YY/MM/DD'));
Insert into JAVA.REPLY (RNO,BNO,REPLYTEXT,REPLYER,REGDATE,UPDATEDATE) values (20,85,'댓글입니다.','평경장',to_date('20/04/21','YY/MM/DD'),to_date('20/04/21','YY/MM/DD'));
Insert into JAVA.REPLY (RNO,BNO,REPLYTEXT,REPLYER,REGDATE,UPDATEDATE) values (21,85,'댓글입니다.','평경장',to_date('20/04/21','YY/MM/DD'),to_date('20/04/21','YY/MM/DD'));
Insert into JAVA.REPLY (RNO,BNO,REPLYTEXT,REPLYER,REGDATE,UPDATEDATE) values (22,85,'댓글입니다.','평경장',to_date('20/04/21','YY/MM/DD'),to_date('20/04/21','YY/MM/DD'));
Insert into JAVA.REPLY (RNO,BNO,REPLYTEXT,REPLYER,REGDATE,UPDATEDATE) values (23,85,'댓글입니다.','평경장',to_date('20/04/21','YY/MM/DD'),to_date('20/04/21','YY/MM/DD'));
Insert into JAVA.REPLY (RNO,BNO,REPLYTEXT,REPLYER,REGDATE,UPDATEDATE) values (24,85,'댓글입니다.','평경장',to_date('20/04/21','YY/MM/DD'),to_date('20/04/21','YY/MM/DD'));
Insert into JAVA.REPLY (RNO,BNO,REPLYTEXT,REPLYER,REGDATE,UPDATEDATE) values (25,85,'댓글입니다.','평경장',to_date('20/04/21','YY/MM/DD'),to_date('20/04/21','YY/MM/DD'));
Insert into JAVA.REPLY (RNO,BNO,REPLYTEXT,REPLYER,REGDATE,UPDATEDATE) values (26,85,'댓글입니다.','평경장',to_date('20/04/21','YY/MM/DD'),to_date('20/04/21','YY/MM/DD'));
Insert into JAVA.REPLY (RNO,BNO,REPLYTEXT,REPLYER,REGDATE,UPDATEDATE) values (27,85,'댓글입니다.','평경장',to_date('20/04/21','YY/MM/DD'),to_date('20/04/21','YY/MM/DD'));
Insert into JAVA.REPLY (RNO,BNO,REPLYTEXT,REPLYER,REGDATE,UPDATEDATE) values (28,85,'댓글입니다.','평경장',to_date('20/04/21','YY/MM/DD'),to_date('20/04/21','YY/MM/DD'));
Insert into JAVA.REPLY (RNO,BNO,REPLYTEXT,REPLYER,REGDATE,UPDATEDATE) values (29,85,'댓글입니다.','평경장',to_date('20/04/21','YY/MM/DD'),to_date('20/04/21','YY/MM/DD'));
Insert into JAVA.REPLY (RNO,BNO,REPLYTEXT,REPLYER,REGDATE,UPDATEDATE) values (30,85,'댓글입니다.','평경장',to_date('20/04/21','YY/MM/DD'),to_date('20/04/21','YY/MM/DD'));
Insert into JAVA.REPLY (RNO,BNO,REPLYTEXT,REPLYER,REGDATE,UPDATEDATE) values (31,85,'댓글입니다.','평경장',to_date('20/04/21','YY/MM/DD'),to_date('20/04/21','YY/MM/DD'));
Insert into JAVA.REPLY (RNO,BNO,REPLYTEXT,REPLYER,REGDATE,UPDATEDATE) values (32,85,'댓글입니다.','평경장',to_date('20/04/21','YY/MM/DD'),to_date('20/04/21','YY/MM/DD'));
Insert into JAVA.REPLY (RNO,BNO,REPLYTEXT,REPLYER,REGDATE,UPDATEDATE) values (33,85,'댓글입니다.','평경장',to_date('20/04/21','YY/MM/DD'),to_date('20/04/21','YY/MM/DD'));
Insert into JAVA.REPLY (RNO,BNO,REPLYTEXT,REPLYER,REGDATE,UPDATEDATE) values (34,85,'댓글입니다.','평경장',to_date('20/04/21','YY/MM/DD'),to_date('20/04/21','YY/MM/DD'));
Insert into JAVA.REPLY (RNO,BNO,REPLYTEXT,REPLYER,REGDATE,UPDATEDATE) values (35,85,'댓글입니다.','평경장',to_date('20/04/21','YY/MM/DD'),to_date('20/04/21','YY/MM/DD'));
Insert into JAVA.REPLY (RNO,BNO,REPLYTEXT,REPLYER,REGDATE,UPDATEDATE) values (36,85,'댓글입니다.','평경장',to_date('20/04/21','YY/MM/DD'),to_date('20/04/21','YY/MM/DD'));
Insert into JAVA.REPLY (RNO,BNO,REPLYTEXT,REPLYER,REGDATE,UPDATEDATE) values (37,85,'댓글입니다.','평경장',to_date('20/04/21','YY/MM/DD'),to_date('20/04/21','YY/MM/DD'));
Insert into JAVA.REPLY (RNO,BNO,REPLYTEXT,REPLYER,REGDATE,UPDATEDATE) values (38,85,'댓글입니다.','평경장',to_date('20/04/21','YY/MM/DD'),to_date('20/04/21','YY/MM/DD'));
Insert into JAVA.REPLY (RNO,BNO,REPLYTEXT,REPLYER,REGDATE,UPDATEDATE) values (39,85,'댓글입니다.','평경장',to_date('20/04/21','YY/MM/DD'),to_date('20/04/21','YY/MM/DD'));
Insert into JAVA.REPLY (RNO,BNO,REPLYTEXT,REPLYER,REGDATE,UPDATEDATE) values (40,85,'댓글입니다.','평경장',to_date('20/04/21','YY/MM/DD'),to_date('20/04/21','YY/MM/DD'));
Insert into JAVA.REPLY (RNO,BNO,REPLYTEXT,REPLYER,REGDATE,UPDATEDATE) values (41,85,'댓글입니다.','평경장',to_date('20/04/21','YY/MM/DD'),to_date('20/04/21','YY/MM/DD'));
Insert into JAVA.REPLY (RNO,BNO,REPLYTEXT,REPLYER,REGDATE,UPDATEDATE) values (42,85,'댓글입니다.','평경장',to_date('20/04/21','YY/MM/DD'),to_date('20/04/21','YY/MM/DD'));
Insert into JAVA.REPLY (RNO,BNO,REPLYTEXT,REPLYER,REGDATE,UPDATEDATE) values (43,85,'댓글입니다.','평경장',to_date('20/04/21','YY/MM/DD'),to_date('20/04/21','YY/MM/DD'));
Insert into JAVA.REPLY (RNO,BNO,REPLYTEXT,REPLYER,REGDATE,UPDATEDATE) values (44,85,'댓글입니다.','평경장',to_date('20/04/21','YY/MM/DD'),to_date('20/04/21','YY/MM/DD'));
Insert into JAVA.REPLY (RNO,BNO,REPLYTEXT,REPLYER,REGDATE,UPDATEDATE) values (45,85,'댓글입니다.','평경장',to_date('20/04/21','YY/MM/DD'),to_date('20/04/21','YY/MM/DD'));
Insert into JAVA.REPLY (RNO,BNO,REPLYTEXT,REPLYER,REGDATE,UPDATEDATE) values (46,85,'댓글입니다.','평경장',to_date('20/04/21','YY/MM/DD'),to_date('20/04/21','YY/MM/DD'));
Insert into JAVA.REPLY (RNO,BNO,REPLYTEXT,REPLYER,REGDATE,UPDATEDATE) values (47,85,'댓글입니다.','평경장',to_date('20/04/21','YY/MM/DD'),to_date('20/04/21','YY/MM/DD'));
Insert into JAVA.REPLY (RNO,BNO,REPLYTEXT,REPLYER,REGDATE,UPDATEDATE) values (48,85,'댓글입니다.','평경장',to_date('20/04/21','YY/MM/DD'),to_date('20/04/21','YY/MM/DD'));
Insert into JAVA.REPLY (RNO,BNO,REPLYTEXT,REPLYER,REGDATE,UPDATEDATE) values (49,85,'댓글입니다.','평경장',to_date('20/04/21','YY/MM/DD'),to_date('20/04/21','YY/MM/DD'));
Insert into JAVA.REPLY (RNO,BNO,REPLYTEXT,REPLYER,REGDATE,UPDATEDATE) values (50,85,'댓글입니다.','평경장',to_date('20/04/21','YY/MM/DD'),to_date('20/04/21','YY/MM/DD'));
Insert into JAVA.REPLY (RNO,BNO,REPLYTEXT,REPLYER,REGDATE,UPDATEDATE) values (51,85,'댓글입니다.','평경장',to_date('20/04/21','YY/MM/DD'),to_date('20/04/21','YY/MM/DD'));
Insert into JAVA.REPLY (RNO,BNO,REPLYTEXT,REPLYER,REGDATE,UPDATEDATE) values (52,85,'댓글입니다.','평경장',to_date('20/04/21','YY/MM/DD'),to_date('20/04/21','YY/MM/DD'));
Insert into JAVA.REPLY (RNO,BNO,REPLYTEXT,REPLYER,REGDATE,UPDATEDATE) values (53,85,'댓글입니다.','평경장',to_date('20/04/21','YY/MM/DD'),to_date('20/04/21','YY/MM/DD'));
Insert into JAVA.REPLY (RNO,BNO,REPLYTEXT,REPLYER,REGDATE,UPDATEDATE) values (54,85,'댓글입니다.','평경장',to_date('20/04/21','YY/MM/DD'),to_date('20/04/21','YY/MM/DD'));
Insert into JAVA.REPLY (RNO,BNO,REPLYTEXT,REPLYER,REGDATE,UPDATEDATE) values (55,85,'댓글입니다.','평경장',to_date('20/04/21','YY/MM/DD'),to_date('20/04/21','YY/MM/DD'));
Insert into JAVA.REPLY (RNO,BNO,REPLYTEXT,REPLYER,REGDATE,UPDATEDATE) values (56,85,'댓글입니다.','평경장',to_date('20/04/21','YY/MM/DD'),to_date('20/04/21','YY/MM/DD'));
Insert into JAVA.REPLY (RNO,BNO,REPLYTEXT,REPLYER,REGDATE,UPDATEDATE) values (57,85,'댓글입니다.','평경장',to_date('20/04/21','YY/MM/DD'),to_date('20/04/21','YY/MM/DD'));
Insert into JAVA.REPLY (RNO,BNO,REPLYTEXT,REPLYER,REGDATE,UPDATEDATE) values (58,85,'댓글입니다.','평경장',to_date('20/04/21','YY/MM/DD'),to_date('20/04/21','YY/MM/DD'));
Insert into JAVA.REPLY (RNO,BNO,REPLYTEXT,REPLYER,REGDATE,UPDATEDATE) values (59,85,'댓글입니다.','평경장',to_date('20/04/21','YY/MM/DD'),to_date('20/04/21','YY/MM/DD'));
Insert into JAVA.REPLY (RNO,BNO,REPLYTEXT,REPLYER,REGDATE,UPDATEDATE) values (60,85,'댓글입니다.','평경장',to_date('20/04/21','YY/MM/DD'),to_date('20/04/21','YY/MM/DD'));
Insert into JAVA.REPLY (RNO,BNO,REPLYTEXT,REPLYER,REGDATE,UPDATEDATE) values (61,85,'댓글입니다.','평경장',to_date('20/04/21','YY/MM/DD'),to_date('20/04/21','YY/MM/DD'));
Insert into JAVA.REPLY (RNO,BNO,REPLYTEXT,REPLYER,REGDATE,UPDATEDATE) values (62,85,'댓글입니다.','평경장',to_date('20/04/21','YY/MM/DD'),to_date('20/04/21','YY/MM/DD'));
Insert into JAVA.REPLY (RNO,BNO,REPLYTEXT,REPLYER,REGDATE,UPDATEDATE) values (63,85,'댓글입니다.','평경장',to_date('20/04/21','YY/MM/DD'),to_date('20/04/21','YY/MM/DD'));
Insert into JAVA.REPLY (RNO,BNO,REPLYTEXT,REPLYER,REGDATE,UPDATEDATE) values (64,85,'댓글입니다.','평경장',to_date('20/04/21','YY/MM/DD'),to_date('20/04/21','YY/MM/DD'));
Insert into JAVA.REPLY (RNO,BNO,REPLYTEXT,REPLYER,REGDATE,UPDATEDATE) values (65,85,'댓글입니다.','평경장',to_date('20/04/21','YY/MM/DD'),to_date('20/04/21','YY/MM/DD'));
Insert into JAVA.REPLY (RNO,BNO,REPLYTEXT,REPLYER,REGDATE,UPDATEDATE) values (66,85,'댓글입니다.','평경장',to_date('20/04/21','YY/MM/DD'),to_date('20/04/21','YY/MM/DD'));
Insert into JAVA.REPLY (RNO,BNO,REPLYTEXT,REPLYER,REGDATE,UPDATEDATE) values (67,85,'댓글입니다.','평경장',to_date('20/04/21','YY/MM/DD'),to_date('20/04/21','YY/MM/DD'));
Insert into JAVA.REPLY (RNO,BNO,REPLYTEXT,REPLYER,REGDATE,UPDATEDATE) values (68,85,'댓글입니다.','평경장',to_date('20/04/21','YY/MM/DD'),to_date('20/04/21','YY/MM/DD'));
Insert into JAVA.REPLY (RNO,BNO,REPLYTEXT,REPLYER,REGDATE,UPDATEDATE) values (69,85,'댓글입니다.','평경장',to_date('20/04/21','YY/MM/DD'),to_date('20/04/21','YY/MM/DD'));
Insert into JAVA.REPLY (RNO,BNO,REPLYTEXT,REPLYER,REGDATE,UPDATEDATE) values (70,85,'댓글입니다.','평경장',to_date('20/04/21','YY/MM/DD'),to_date('20/04/21','YY/MM/DD'));
Insert into JAVA.REPLY (RNO,BNO,REPLYTEXT,REPLYER,REGDATE,UPDATEDATE) values (71,85,'댓글입니다.','평경장',to_date('20/04/21','YY/MM/DD'),to_date('20/04/21','YY/MM/DD'));
Insert into JAVA.REPLY (RNO,BNO,REPLYTEXT,REPLYER,REGDATE,UPDATEDATE) values (72,85,'댓글입니다.','평경장',to_date('20/04/21','YY/MM/DD'),to_date('20/04/21','YY/MM/DD'));
Insert into JAVA.REPLY (RNO,BNO,REPLYTEXT,REPLYER,REGDATE,UPDATEDATE) values (73,85,'댓글입니다.','평경장',to_date('20/04/21','YY/MM/DD'),to_date('20/04/21','YY/MM/DD'));
Insert into JAVA.REPLY (RNO,BNO,REPLYTEXT,REPLYER,REGDATE,UPDATEDATE) values (74,85,'댓글입니다.','평경장',to_date('20/04/21','YY/MM/DD'),to_date('20/04/21','YY/MM/DD'));
Insert into JAVA.REPLY (RNO,BNO,REPLYTEXT,REPLYER,REGDATE,UPDATEDATE) values (75,85,'댓글입니다.','평경장',to_date('20/04/21','YY/MM/DD'),to_date('20/04/21','YY/MM/DD'));
Insert into JAVA.REPLY (RNO,BNO,REPLYTEXT,REPLYER,REGDATE,UPDATEDATE) values (76,85,'댓글입니다.','평경장',to_date('20/04/21','YY/MM/DD'),to_date('20/04/21','YY/MM/DD'));
Insert into JAVA.REPLY (RNO,BNO,REPLYTEXT,REPLYER,REGDATE,UPDATEDATE) values (77,85,'댓글입니다.','평경장',to_date('20/04/21','YY/MM/DD'),to_date('20/04/21','YY/MM/DD'));
Insert into JAVA.REPLY (RNO,BNO,REPLYTEXT,REPLYER,REGDATE,UPDATEDATE) values (78,85,'댓글입니다.','평경장',to_date('20/04/21','YY/MM/DD'),to_date('20/04/21','YY/MM/DD'));
Insert into JAVA.REPLY (RNO,BNO,REPLYTEXT,REPLYER,REGDATE,UPDATEDATE) values (79,85,'댓글입니다.','평경장',to_date('20/04/21','YY/MM/DD'),to_date('20/04/21','YY/MM/DD'));
Insert into JAVA.REPLY (RNO,BNO,REPLYTEXT,REPLYER,REGDATE,UPDATEDATE) values (80,85,'댓글입니다.','평경장',to_date('20/04/21','YY/MM/DD'),to_date('20/04/21','YY/MM/DD'));
Insert into JAVA.REPLY (RNO,BNO,REPLYTEXT,REPLYER,REGDATE,UPDATEDATE) values (81,85,'댓글입니다.','평경장',to_date('20/04/21','YY/MM/DD'),to_date('20/04/21','YY/MM/DD'));
Insert into JAVA.REPLY (RNO,BNO,REPLYTEXT,REPLYER,REGDATE,UPDATEDATE) values (82,85,'댓글입니다.','평경장',to_date('20/04/21','YY/MM/DD'),to_date('20/04/21','YY/MM/DD'));
Insert into JAVA.REPLY (RNO,BNO,REPLYTEXT,REPLYER,REGDATE,UPDATEDATE) values (83,85,'댓글입니다.','평경장',to_date('20/04/21','YY/MM/DD'),to_date('20/04/21','YY/MM/DD'));
Insert into JAVA.REPLY (RNO,BNO,REPLYTEXT,REPLYER,REGDATE,UPDATEDATE) values (84,85,'댓글입니다.','평경장',to_date('20/04/21','YY/MM/DD'),to_date('20/04/21','YY/MM/DD'));
Insert into JAVA.REPLY (RNO,BNO,REPLYTEXT,REPLYER,REGDATE,UPDATEDATE) values (85,85,'댓글입니다.','평경장',to_date('20/04/21','YY/MM/DD'),to_date('20/04/21','YY/MM/DD'));
Insert into JAVA.REPLY (RNO,BNO,REPLYTEXT,REPLYER,REGDATE,UPDATEDATE) values (86,85,'댓글입니다.','평경장',to_date('20/04/21','YY/MM/DD'),to_date('20/04/21','YY/MM/DD'));
Insert into JAVA.REPLY (RNO,BNO,REPLYTEXT,REPLYER,REGDATE,UPDATEDATE) values (87,85,'댓글입니다.','평경장',to_date('20/04/21','YY/MM/DD'),to_date('20/04/21','YY/MM/DD'));
Insert into JAVA.REPLY (RNO,BNO,REPLYTEXT,REPLYER,REGDATE,UPDATEDATE) values (88,85,'댓글입니다.','평경장',to_date('20/04/21','YY/MM/DD'),to_date('20/04/21','YY/MM/DD'));
Insert into JAVA.REPLY (RNO,BNO,REPLYTEXT,REPLYER,REGDATE,UPDATEDATE) values (89,85,'댓글입니다.','평경장',to_date('20/04/21','YY/MM/DD'),to_date('20/04/21','YY/MM/DD'));
Insert into JAVA.REPLY (RNO,BNO,REPLYTEXT,REPLYER,REGDATE,UPDATEDATE) values (90,85,'댓글입니다.','평경장',to_date('20/04/21','YY/MM/DD'),to_date('20/04/21','YY/MM/DD'));
Insert into JAVA.REPLY (RNO,BNO,REPLYTEXT,REPLYER,REGDATE,UPDATEDATE) values (91,85,'댓글입니다.','평경장',to_date('20/04/21','YY/MM/DD'),to_date('20/04/21','YY/MM/DD'));
Insert into JAVA.REPLY (RNO,BNO,REPLYTEXT,REPLYER,REGDATE,UPDATEDATE) values (92,85,'댓글입니다.','평경장',to_date('20/04/21','YY/MM/DD'),to_date('20/04/21','YY/MM/DD'));
Insert into JAVA.REPLY (RNO,BNO,REPLYTEXT,REPLYER,REGDATE,UPDATEDATE) values (93,85,'댓글입니다.','평경장',to_date('20/04/21','YY/MM/DD'),to_date('20/04/21','YY/MM/DD'));
Insert into JAVA.REPLY (RNO,BNO,REPLYTEXT,REPLYER,REGDATE,UPDATEDATE) values (94,85,'댓글입니다.','평경장',to_date('20/04/21','YY/MM/DD'),to_date('20/04/21','YY/MM/DD'));
Insert into JAVA.REPLY (RNO,BNO,REPLYTEXT,REPLYER,REGDATE,UPDATEDATE) values (95,85,'댓글입니다.','평경장',to_date('20/04/21','YY/MM/DD'),to_date('20/04/21','YY/MM/DD'));
Insert into JAVA.REPLY (RNO,BNO,REPLYTEXT,REPLYER,REGDATE,UPDATEDATE) values (96,85,'댓글입니다.','평경장',to_date('20/04/21','YY/MM/DD'),to_date('20/04/21','YY/MM/DD'));
Insert into JAVA.REPLY (RNO,BNO,REPLYTEXT,REPLYER,REGDATE,UPDATEDATE) values (97,85,'댓글입니다.','평경장',to_date('20/04/21','YY/MM/DD'),to_date('20/04/21','YY/MM/DD'));
Insert into JAVA.REPLY (RNO,BNO,REPLYTEXT,REPLYER,REGDATE,UPDATEDATE) values (98,85,'댓글입니다.','평경장',to_date('20/04/21','YY/MM/DD'),to_date('20/04/21','YY/MM/DD'));
Insert into JAVA.REPLY (RNO,BNO,REPLYTEXT,REPLYER,REGDATE,UPDATEDATE) values (99,85,'댓글입니다.','평경장',to_date('20/04/21','YY/MM/DD'),to_date('20/04/21','YY/MM/DD'));
Insert into JAVA.REPLY (RNO,BNO,REPLYTEXT,REPLYER,REGDATE,UPDATEDATE) values (100,85,'댓글입니다.','평경장',to_date('20/04/21','YY/MM/DD'),to_date('20/04/21','YY/MM/DD'));
Insert into JAVA.REPLY (RNO,BNO,REPLYTEXT,REPLYER,REGDATE,UPDATEDATE) values (101,85,'댓글입니다.','평경장',to_date('20/04/21','YY/MM/DD'),to_date('20/04/21','YY/MM/DD'));
Insert into JAVA.REPLY (RNO,BNO,REPLYTEXT,REPLYER,REGDATE,UPDATEDATE) values (102,85,'댓글입니다.','평경장',to_date('20/04/21','YY/MM/DD'),to_date('20/04/21','YY/MM/DD'));
Insert into JAVA.REPLY (RNO,BNO,REPLYTEXT,REPLYER,REGDATE,UPDATEDATE) values (103,85,'댓글입니다.','평경장',to_date('20/04/21','YY/MM/DD'),to_date('20/04/21','YY/MM/DD'));
Insert into JAVA.REPLY (RNO,BNO,REPLYTEXT,REPLYER,REGDATE,UPDATEDATE) values (104,85,'댓글입니다.','평경장',to_date('20/04/21','YY/MM/DD'),to_date('20/04/21','YY/MM/DD'));
Insert into JAVA.REPLY (RNO,BNO,REPLYTEXT,REPLYER,REGDATE,UPDATEDATE) values (105,85,'댓글입니다.','평경장',to_date('20/04/21','YY/MM/DD'),to_date('20/04/21','YY/MM/DD'));
Insert into JAVA.REPLY (RNO,BNO,REPLYTEXT,REPLYER,REGDATE,UPDATEDATE) values (106,85,'댓글입니다.','평경장',to_date('20/04/21','YY/MM/DD'),to_date('20/04/21','YY/MM/DD'));
Insert into JAVA.REPLY (RNO,BNO,REPLYTEXT,REPLYER,REGDATE,UPDATEDATE) values (107,85,'댓글입니다.','평경장',to_date('20/04/21','YY/MM/DD'),to_date('20/04/21','YY/MM/DD'));
Insert into JAVA.REPLY (RNO,BNO,REPLYTEXT,REPLYER,REGDATE,UPDATEDATE) values (108,85,'댓글입니다.','평경장',to_date('20/04/21','YY/MM/DD'),to_date('20/04/21','YY/MM/DD'));
Insert into JAVA.REPLY (RNO,BNO,REPLYTEXT,REPLYER,REGDATE,UPDATEDATE) values (109,85,'댓글입니다.','평경장',to_date('20/04/21','YY/MM/DD'),to_date('20/04/21','YY/MM/DD'));
Insert into JAVA.REPLY (RNO,BNO,REPLYTEXT,REPLYER,REGDATE,UPDATEDATE) values (110,85,'댓글입니다.','평경장',to_date('20/04/21','YY/MM/DD'),to_date('20/04/21','YY/MM/DD'));
Insert into JAVA.REPLY (RNO,BNO,REPLYTEXT,REPLYER,REGDATE,UPDATEDATE) values (111,85,'댓글입니다.','평경장',to_date('20/04/21','YY/MM/DD'),to_date('20/04/21','YY/MM/DD'));
Insert into JAVA.REPLY (RNO,BNO,REPLYTEXT,REPLYER,REGDATE,UPDATEDATE) values (112,85,'댓글입니다.','평경장',to_date('20/04/21','YY/MM/DD'),to_date('20/04/21','YY/MM/DD'));
Insert into JAVA.REPLY (RNO,BNO,REPLYTEXT,REPLYER,REGDATE,UPDATEDATE) values (113,85,'댓글입니다.','평경장',to_date('20/04/21','YY/MM/DD'),to_date('20/04/21','YY/MM/DD'));
Insert into JAVA.REPLY (RNO,BNO,REPLYTEXT,REPLYER,REGDATE,UPDATEDATE) values (114,85,'댓글입니다.','평경장',to_date('20/04/21','YY/MM/DD'),to_date('20/04/21','YY/MM/DD'));
Insert into JAVA.REPLY (RNO,BNO,REPLYTEXT,REPLYER,REGDATE,UPDATEDATE) values (115,85,'댓글입니다.','평경장',to_date('20/04/21','YY/MM/DD'),to_date('20/04/21','YY/MM/DD'));
Insert into JAVA.REPLY (RNO,BNO,REPLYTEXT,REPLYER,REGDATE,UPDATEDATE) values (116,85,'댓글입니다.','평경장',to_date('20/04/21','YY/MM/DD'),to_date('20/04/21','YY/MM/DD'));
Insert into JAVA.REPLY (RNO,BNO,REPLYTEXT,REPLYER,REGDATE,UPDATEDATE) values (117,85,'댓글입니다.','평경장',to_date('20/04/21','YY/MM/DD'),to_date('20/04/21','YY/MM/DD'));
Insert into JAVA.REPLY (RNO,BNO,REPLYTEXT,REPLYER,REGDATE,UPDATEDATE) values (118,85,'댓글입니다.','평경장',to_date('20/04/21','YY/MM/DD'),to_date('20/04/21','YY/MM/DD'));
Insert into JAVA.REPLY (RNO,BNO,REPLYTEXT,REPLYER,REGDATE,UPDATEDATE) values (119,85,'댓글입니다.','평경장',to_date('20/04/21','YY/MM/DD'),to_date('20/04/21','YY/MM/DD'));
Insert into JAVA.REPLY (RNO,BNO,REPLYTEXT,REPLYER,REGDATE,UPDATEDATE) values (120,85,'댓글입니다.','평경장',to_date('20/04/21','YY/MM/DD'),to_date('20/04/21','YY/MM/DD'));
Insert into JAVA.REPLY (RNO,BNO,REPLYTEXT,REPLYER,REGDATE,UPDATEDATE) values (121,85,'댓글입니다.','평경장',to_date('20/04/21','YY/MM/DD'),to_date('20/04/21','YY/MM/DD'));
Insert into JAVA.REPLY (RNO,BNO,REPLYTEXT,REPLYER,REGDATE,UPDATEDATE) values (122,85,'댓글입니다.','평경장',to_date('20/04/21','YY/MM/DD'),to_date('20/04/21','YY/MM/DD'));
Insert into JAVA.REPLY (RNO,BNO,REPLYTEXT,REPLYER,REGDATE,UPDATEDATE) values (123,85,'댓글입니다.','평경장',to_date('20/04/21','YY/MM/DD'),to_date('20/04/21','YY/MM/DD'));
Insert into JAVA.REPLY (RNO,BNO,REPLYTEXT,REPLYER,REGDATE,UPDATEDATE) values (124,85,'댓글입니다.','평경장',to_date('20/04/21','YY/MM/DD'),to_date('20/04/21','YY/MM/DD'));
Insert into JAVA.REPLY (RNO,BNO,REPLYTEXT,REPLYER,REGDATE,UPDATEDATE) values (125,85,'댓글입니다.','평경장',to_date('20/04/21','YY/MM/DD'),to_date('20/04/21','YY/MM/DD'));
Insert into JAVA.REPLY (RNO,BNO,REPLYTEXT,REPLYER,REGDATE,UPDATEDATE) values (126,85,'댓글입니다.','평경장',to_date('20/04/21','YY/MM/DD'),to_date('20/04/21','YY/MM/DD'));
Insert into JAVA.REPLY (RNO,BNO,REPLYTEXT,REPLYER,REGDATE,UPDATEDATE) values (127,85,'댓글입니다.','평경장',to_date('20/04/21','YY/MM/DD'),to_date('20/04/21','YY/MM/DD'));
Insert into JAVA.REPLY (RNO,BNO,REPLYTEXT,REPLYER,REGDATE,UPDATEDATE) values (134,166,'그게~~~ 나야~~','mama',to_date('20/04/23','YY/MM/DD'),to_date('20/04/23','YY/MM/DD'));
--------------------------------------------------------
--  Constraints for Table REPLY
--------------------------------------------------------

  ALTER TABLE "JAVA"."REPLY" MODIFY ("RNO" NOT NULL ENABLE);
  ALTER TABLE "JAVA"."REPLY" MODIFY ("REPLYTEXT" NOT NULL ENABLE);
