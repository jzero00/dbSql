--------------------------------------------------------
--  파일이 생성됨 - 목요일-4월-23-2020   
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
Insert into JAVA.BOARD (BNO,TITLE,WRITER,CONTENT,VIEWCNT,REGDATE,UPDATEDATE) values (4,'제목4','작성자4','내용4',0,to_date('20/04/21','YY/MM/DD'),null);
Insert into JAVA.BOARD (BNO,TITLE,WRITER,CONTENT,VIEWCNT,REGDATE,UPDATEDATE) values (5,'제목5','작성자5','내용5',0,to_date('20/04/21','YY/MM/DD'),null);
Insert into JAVA.BOARD (BNO,TITLE,WRITER,CONTENT,VIEWCNT,REGDATE,UPDATEDATE) values (1,'제목1','mimi','내용1',8,to_date('20/04/20','YY/MM/DD'),null);
Insert into JAVA.BOARD (BNO,TITLE,WRITER,CONTENT,VIEWCNT,REGDATE,UPDATEDATE) values (2,'제목2','작성자2','내용2',0,to_date('20/04/20','YY/MM/DD'),null);
Insert into JAVA.BOARD (BNO,TITLE,WRITER,CONTENT,VIEWCNT,REGDATE,UPDATEDATE) values (3,'제목3','작성자3','내용3',0,to_date('20/04/20','YY/MM/DD'),null);
Insert into JAVA.BOARD (BNO,TITLE,WRITER,CONTENT,VIEWCNT,REGDATE,UPDATEDATE) values (163,'test제목','mama','<p>rqwrqwf</p>',31,to_date('20/04/22','YY/MM/DD'),to_date('20/04/22','YY/MM/DD'));
Insert into JAVA.BOARD (BNO,TITLE,WRITER,CONTENT,VIEWCNT,REGDATE,UPDATEDATE) values (6,'제목4','작성자4','내용4',0,to_date('20/04/21','YY/MM/DD'),to_date('20/04/21','YY/MM/DD'));
Insert into JAVA.BOARD (BNO,TITLE,WRITER,CONTENT,VIEWCNT,REGDATE,UPDATEDATE) values (7,'제목5','작성자5','내용5',0,to_date('20/04/21','YY/MM/DD'),to_date('20/04/21','YY/MM/DD'));
Insert into JAVA.BOARD (BNO,TITLE,WRITER,CONTENT,VIEWCNT,REGDATE,UPDATEDATE) values (8,'제목1','mimi','내용1',0,to_date('20/04/21','YY/MM/DD'),to_date('20/04/21','YY/MM/DD'));
Insert into JAVA.BOARD (BNO,TITLE,WRITER,CONTENT,VIEWCNT,REGDATE,UPDATEDATE) values (9,'제목2','작성자2','내용2',0,to_date('20/04/21','YY/MM/DD'),to_date('20/04/21','YY/MM/DD'));
Insert into JAVA.BOARD (BNO,TITLE,WRITER,CONTENT,VIEWCNT,REGDATE,UPDATEDATE) values (10,'제목3','작성자3','내용3',0,to_date('20/04/21','YY/MM/DD'),to_date('20/04/21','YY/MM/DD'));
Insert into JAVA.BOARD (BNO,TITLE,WRITER,CONTENT,VIEWCNT,REGDATE,UPDATEDATE) values (11,'제목4','작성자4','내용4',0,to_date('20/04/21','YY/MM/DD'),to_date('20/04/21','YY/MM/DD'));
Insert into JAVA.BOARD (BNO,TITLE,WRITER,CONTENT,VIEWCNT,REGDATE,UPDATEDATE) values (12,'제목5','작성자5','내용5',0,to_date('20/04/21','YY/MM/DD'),to_date('20/04/21','YY/MM/DD'));
Insert into JAVA.BOARD (BNO,TITLE,WRITER,CONTENT,VIEWCNT,REGDATE,UPDATEDATE) values (13,'제목1','mimi','내용1',0,to_date('20/04/21','YY/MM/DD'),to_date('20/04/21','YY/MM/DD'));
Insert into JAVA.BOARD (BNO,TITLE,WRITER,CONTENT,VIEWCNT,REGDATE,UPDATEDATE) values (14,'제목2','작성자2','내용2',0,to_date('20/04/21','YY/MM/DD'),to_date('20/04/21','YY/MM/DD'));
Insert into JAVA.BOARD (BNO,TITLE,WRITER,CONTENT,VIEWCNT,REGDATE,UPDATEDATE) values (15,'제목3','작성자3','내용3',0,to_date('20/04/21','YY/MM/DD'),to_date('20/04/21','YY/MM/DD'));
Insert into JAVA.BOARD (BNO,TITLE,WRITER,CONTENT,VIEWCNT,REGDATE,UPDATEDATE) values (16,'제목4','작성자4','내용4',0,to_date('20/04/21','YY/MM/DD'),to_date('20/04/21','YY/MM/DD'));
Insert into JAVA.BOARD (BNO,TITLE,WRITER,CONTENT,VIEWCNT,REGDATE,UPDATEDATE) values (17,'제목5','작성자5','내용5',0,to_date('20/04/21','YY/MM/DD'),to_date('20/04/21','YY/MM/DD'));
Insert into JAVA.BOARD (BNO,TITLE,WRITER,CONTENT,VIEWCNT,REGDATE,UPDATEDATE) values (18,'제목1','mimi','내용1',0,to_date('20/04/21','YY/MM/DD'),to_date('20/04/21','YY/MM/DD'));
Insert into JAVA.BOARD (BNO,TITLE,WRITER,CONTENT,VIEWCNT,REGDATE,UPDATEDATE) values (19,'제목2','작성자2','내용2',0,to_date('20/04/21','YY/MM/DD'),to_date('20/04/21','YY/MM/DD'));
Insert into JAVA.BOARD (BNO,TITLE,WRITER,CONTENT,VIEWCNT,REGDATE,UPDATEDATE) values (20,'제목3','작성자3','내용3',0,to_date('20/04/21','YY/MM/DD'),to_date('20/04/21','YY/MM/DD'));
Insert into JAVA.BOARD (BNO,TITLE,WRITER,CONTENT,VIEWCNT,REGDATE,UPDATEDATE) values (21,'제목4','작성자4','내용4',0,to_date('20/04/21','YY/MM/DD'),to_date('20/04/21','YY/MM/DD'));
Insert into JAVA.BOARD (BNO,TITLE,WRITER,CONTENT,VIEWCNT,REGDATE,UPDATEDATE) values (22,'제목5','작성자5','내용5',0,to_date('20/04/21','YY/MM/DD'),to_date('20/04/21','YY/MM/DD'));
Insert into JAVA.BOARD (BNO,TITLE,WRITER,CONTENT,VIEWCNT,REGDATE,UPDATEDATE) values (23,'제목1','mimi','내용1',0,to_date('20/04/21','YY/MM/DD'),to_date('20/04/21','YY/MM/DD'));
Insert into JAVA.BOARD (BNO,TITLE,WRITER,CONTENT,VIEWCNT,REGDATE,UPDATEDATE) values (24,'제목2','작성자2','내용2',0,to_date('20/04/21','YY/MM/DD'),to_date('20/04/21','YY/MM/DD'));
Insert into JAVA.BOARD (BNO,TITLE,WRITER,CONTENT,VIEWCNT,REGDATE,UPDATEDATE) values (25,'제목3','작성자3','내용3',0,to_date('20/04/21','YY/MM/DD'),to_date('20/04/21','YY/MM/DD'));
Insert into JAVA.BOARD (BNO,TITLE,WRITER,CONTENT,VIEWCNT,REGDATE,UPDATEDATE) values (26,'제목4','작성자4','내용4',0,to_date('20/04/21','YY/MM/DD'),to_date('20/04/21','YY/MM/DD'));
Insert into JAVA.BOARD (BNO,TITLE,WRITER,CONTENT,VIEWCNT,REGDATE,UPDATEDATE) values (27,'제목5','작성자5','내용5',0,to_date('20/04/21','YY/MM/DD'),to_date('20/04/21','YY/MM/DD'));
Insert into JAVA.BOARD (BNO,TITLE,WRITER,CONTENT,VIEWCNT,REGDATE,UPDATEDATE) values (28,'제목1','mimi','내용1',0,to_date('20/04/21','YY/MM/DD'),to_date('20/04/21','YY/MM/DD'));
Insert into JAVA.BOARD (BNO,TITLE,WRITER,CONTENT,VIEWCNT,REGDATE,UPDATEDATE) values (29,'제목2','작성자2','내용2',0,to_date('20/04/21','YY/MM/DD'),to_date('20/04/21','YY/MM/DD'));
Insert into JAVA.BOARD (BNO,TITLE,WRITER,CONTENT,VIEWCNT,REGDATE,UPDATEDATE) values (30,'제목3','작성자3','내용3',0,to_date('20/04/21','YY/MM/DD'),to_date('20/04/21','YY/MM/DD'));
Insert into JAVA.BOARD (BNO,TITLE,WRITER,CONTENT,VIEWCNT,REGDATE,UPDATEDATE) values (31,'제목4','작성자4','내용4',0,to_date('20/04/21','YY/MM/DD'),to_date('20/04/21','YY/MM/DD'));
Insert into JAVA.BOARD (BNO,TITLE,WRITER,CONTENT,VIEWCNT,REGDATE,UPDATEDATE) values (32,'제목5','작성자5','내용5',0,to_date('20/04/21','YY/MM/DD'),to_date('20/04/21','YY/MM/DD'));
Insert into JAVA.BOARD (BNO,TITLE,WRITER,CONTENT,VIEWCNT,REGDATE,UPDATEDATE) values (33,'제목1','mimi','내용1',0,to_date('20/04/21','YY/MM/DD'),to_date('20/04/21','YY/MM/DD'));
Insert into JAVA.BOARD (BNO,TITLE,WRITER,CONTENT,VIEWCNT,REGDATE,UPDATEDATE) values (34,'제목2','작성자2','내용2',0,to_date('20/04/21','YY/MM/DD'),to_date('20/04/21','YY/MM/DD'));
Insert into JAVA.BOARD (BNO,TITLE,WRITER,CONTENT,VIEWCNT,REGDATE,UPDATEDATE) values (35,'제목3','작성자3','내용3',0,to_date('20/04/21','YY/MM/DD'),to_date('20/04/21','YY/MM/DD'));
Insert into JAVA.BOARD (BNO,TITLE,WRITER,CONTENT,VIEWCNT,REGDATE,UPDATEDATE) values (36,'제목4','작성자4','내용4',0,to_date('20/04/21','YY/MM/DD'),to_date('20/04/21','YY/MM/DD'));
Insert into JAVA.BOARD (BNO,TITLE,WRITER,CONTENT,VIEWCNT,REGDATE,UPDATEDATE) values (37,'제목5','작성자5','내용5',0,to_date('20/04/21','YY/MM/DD'),to_date('20/04/21','YY/MM/DD'));
Insert into JAVA.BOARD (BNO,TITLE,WRITER,CONTENT,VIEWCNT,REGDATE,UPDATEDATE) values (38,'제목1','mimi','내용1',0,to_date('20/04/21','YY/MM/DD'),to_date('20/04/21','YY/MM/DD'));
Insert into JAVA.BOARD (BNO,TITLE,WRITER,CONTENT,VIEWCNT,REGDATE,UPDATEDATE) values (39,'제목2','작성자2','내용2',0,to_date('20/04/21','YY/MM/DD'),to_date('20/04/21','YY/MM/DD'));
Insert into JAVA.BOARD (BNO,TITLE,WRITER,CONTENT,VIEWCNT,REGDATE,UPDATEDATE) values (40,'제목3','작성자3','내용3',0,to_date('20/04/21','YY/MM/DD'),to_date('20/04/21','YY/MM/DD'));
Insert into JAVA.BOARD (BNO,TITLE,WRITER,CONTENT,VIEWCNT,REGDATE,UPDATEDATE) values (41,'제목4','작성자4','내용4',0,to_date('20/04/21','YY/MM/DD'),to_date('20/04/21','YY/MM/DD'));
Insert into JAVA.BOARD (BNO,TITLE,WRITER,CONTENT,VIEWCNT,REGDATE,UPDATEDATE) values (42,'제목5','작성자5','내용5',0,to_date('20/04/21','YY/MM/DD'),to_date('20/04/21','YY/MM/DD'));
Insert into JAVA.BOARD (BNO,TITLE,WRITER,CONTENT,VIEWCNT,REGDATE,UPDATEDATE) values (43,'제목1','mimi','내용1',0,to_date('20/04/21','YY/MM/DD'),to_date('20/04/21','YY/MM/DD'));
Insert into JAVA.BOARD (BNO,TITLE,WRITER,CONTENT,VIEWCNT,REGDATE,UPDATEDATE) values (44,'제목2','작성자2','내용2',0,to_date('20/04/21','YY/MM/DD'),to_date('20/04/21','YY/MM/DD'));
Insert into JAVA.BOARD (BNO,TITLE,WRITER,CONTENT,VIEWCNT,REGDATE,UPDATEDATE) values (45,'제목3','작성자3','내용3',0,to_date('20/04/21','YY/MM/DD'),to_date('20/04/21','YY/MM/DD'));
Insert into JAVA.BOARD (BNO,TITLE,WRITER,CONTENT,VIEWCNT,REGDATE,UPDATEDATE) values (46,'제목4','작성자4','내용4',0,to_date('20/04/21','YY/MM/DD'),to_date('20/04/21','YY/MM/DD'));
Insert into JAVA.BOARD (BNO,TITLE,WRITER,CONTENT,VIEWCNT,REGDATE,UPDATEDATE) values (47,'제목5','작성자5','내용5',0,to_date('20/04/21','YY/MM/DD'),to_date('20/04/21','YY/MM/DD'));
Insert into JAVA.BOARD (BNO,TITLE,WRITER,CONTENT,VIEWCNT,REGDATE,UPDATEDATE) values (48,'제목1','mimi','내용1',0,to_date('20/04/21','YY/MM/DD'),to_date('20/04/21','YY/MM/DD'));
Insert into JAVA.BOARD (BNO,TITLE,WRITER,CONTENT,VIEWCNT,REGDATE,UPDATEDATE) values (49,'제목2','작성자2','내용2',0,to_date('20/04/21','YY/MM/DD'),to_date('20/04/21','YY/MM/DD'));
Insert into JAVA.BOARD (BNO,TITLE,WRITER,CONTENT,VIEWCNT,REGDATE,UPDATEDATE) values (50,'제목3','작성자3','내용3',0,to_date('20/04/21','YY/MM/DD'),to_date('20/04/21','YY/MM/DD'));
Insert into JAVA.BOARD (BNO,TITLE,WRITER,CONTENT,VIEWCNT,REGDATE,UPDATEDATE) values (51,'제목4','작성자4','내용4',0,to_date('20/04/21','YY/MM/DD'),to_date('20/04/21','YY/MM/DD'));
Insert into JAVA.BOARD (BNO,TITLE,WRITER,CONTENT,VIEWCNT,REGDATE,UPDATEDATE) values (52,'제목5','작성자5','내용5',0,to_date('20/04/21','YY/MM/DD'),to_date('20/04/21','YY/MM/DD'));
Insert into JAVA.BOARD (BNO,TITLE,WRITER,CONTENT,VIEWCNT,REGDATE,UPDATEDATE) values (53,'제목1','mimi','내용1',0,to_date('20/04/21','YY/MM/DD'),to_date('20/04/21','YY/MM/DD'));
Insert into JAVA.BOARD (BNO,TITLE,WRITER,CONTENT,VIEWCNT,REGDATE,UPDATEDATE) values (54,'제목2','작성자2','내용2',0,to_date('20/04/21','YY/MM/DD'),to_date('20/04/21','YY/MM/DD'));
Insert into JAVA.BOARD (BNO,TITLE,WRITER,CONTENT,VIEWCNT,REGDATE,UPDATEDATE) values (55,'제목3','작성자3','내용3',0,to_date('20/04/21','YY/MM/DD'),to_date('20/04/21','YY/MM/DD'));
Insert into JAVA.BOARD (BNO,TITLE,WRITER,CONTENT,VIEWCNT,REGDATE,UPDATEDATE) values (56,'제목4','작성자4','내용4',0,to_date('20/04/21','YY/MM/DD'),to_date('20/04/21','YY/MM/DD'));
Insert into JAVA.BOARD (BNO,TITLE,WRITER,CONTENT,VIEWCNT,REGDATE,UPDATEDATE) values (57,'제목5','작성자5','내용5',0,to_date('20/04/21','YY/MM/DD'),to_date('20/04/21','YY/MM/DD'));
Insert into JAVA.BOARD (BNO,TITLE,WRITER,CONTENT,VIEWCNT,REGDATE,UPDATEDATE) values (58,'제목1','mimi','내용1',0,to_date('20/04/21','YY/MM/DD'),to_date('20/04/21','YY/MM/DD'));
Insert into JAVA.BOARD (BNO,TITLE,WRITER,CONTENT,VIEWCNT,REGDATE,UPDATEDATE) values (59,'제목2','작성자2','내용2',0,to_date('20/04/21','YY/MM/DD'),to_date('20/04/21','YY/MM/DD'));
Insert into JAVA.BOARD (BNO,TITLE,WRITER,CONTENT,VIEWCNT,REGDATE,UPDATEDATE) values (60,'제목3','작성자3','내용3',0,to_date('20/04/21','YY/MM/DD'),to_date('20/04/21','YY/MM/DD'));
Insert into JAVA.BOARD (BNO,TITLE,WRITER,CONTENT,VIEWCNT,REGDATE,UPDATEDATE) values (61,'제목4','작성자4','내용4',0,to_date('20/04/21','YY/MM/DD'),to_date('20/04/21','YY/MM/DD'));
Insert into JAVA.BOARD (BNO,TITLE,WRITER,CONTENT,VIEWCNT,REGDATE,UPDATEDATE) values (62,'제목5','작성자5','내용5',0,to_date('20/04/21','YY/MM/DD'),to_date('20/04/21','YY/MM/DD'));
Insert into JAVA.BOARD (BNO,TITLE,WRITER,CONTENT,VIEWCNT,REGDATE,UPDATEDATE) values (63,'제목1','mimi','내용1',0,to_date('20/04/21','YY/MM/DD'),to_date('20/04/21','YY/MM/DD'));
Insert into JAVA.BOARD (BNO,TITLE,WRITER,CONTENT,VIEWCNT,REGDATE,UPDATEDATE) values (64,'제목2','작성자2','내용2',0,to_date('20/04/21','YY/MM/DD'),to_date('20/04/21','YY/MM/DD'));
Insert into JAVA.BOARD (BNO,TITLE,WRITER,CONTENT,VIEWCNT,REGDATE,UPDATEDATE) values (65,'제목3','작성자3','내용3',0,to_date('20/04/21','YY/MM/DD'),to_date('20/04/21','YY/MM/DD'));
Insert into JAVA.BOARD (BNO,TITLE,WRITER,CONTENT,VIEWCNT,REGDATE,UPDATEDATE) values (66,'제목4','작성자4','내용4',0,to_date('20/04/21','YY/MM/DD'),to_date('20/04/21','YY/MM/DD'));
Insert into JAVA.BOARD (BNO,TITLE,WRITER,CONTENT,VIEWCNT,REGDATE,UPDATEDATE) values (67,'제목5','작성자5','내용5',0,to_date('20/04/21','YY/MM/DD'),to_date('20/04/21','YY/MM/DD'));
Insert into JAVA.BOARD (BNO,TITLE,WRITER,CONTENT,VIEWCNT,REGDATE,UPDATEDATE) values (68,'제목1','mimi','내용1',0,to_date('20/04/21','YY/MM/DD'),to_date('20/04/21','YY/MM/DD'));
Insert into JAVA.BOARD (BNO,TITLE,WRITER,CONTENT,VIEWCNT,REGDATE,UPDATEDATE) values (69,'제목2','작성자2','내용2',0,to_date('20/04/21','YY/MM/DD'),to_date('20/04/21','YY/MM/DD'));
Insert into JAVA.BOARD (BNO,TITLE,WRITER,CONTENT,VIEWCNT,REGDATE,UPDATEDATE) values (70,'제목3','작성자3','내용3',0,to_date('20/04/21','YY/MM/DD'),to_date('20/04/21','YY/MM/DD'));
Insert into JAVA.BOARD (BNO,TITLE,WRITER,CONTENT,VIEWCNT,REGDATE,UPDATEDATE) values (71,'제목4','작성자4','내용4',0,to_date('20/04/21','YY/MM/DD'),to_date('20/04/21','YY/MM/DD'));
Insert into JAVA.BOARD (BNO,TITLE,WRITER,CONTENT,VIEWCNT,REGDATE,UPDATEDATE) values (72,'제목5','작성자5','내용5',0,to_date('20/04/21','YY/MM/DD'),to_date('20/04/21','YY/MM/DD'));
Insert into JAVA.BOARD (BNO,TITLE,WRITER,CONTENT,VIEWCNT,REGDATE,UPDATEDATE) values (73,'제목1','mimi','내용1',0,to_date('20/04/21','YY/MM/DD'),to_date('20/04/21','YY/MM/DD'));
Insert into JAVA.BOARD (BNO,TITLE,WRITER,CONTENT,VIEWCNT,REGDATE,UPDATEDATE) values (74,'제목2','작성자2','내용2',0,to_date('20/04/21','YY/MM/DD'),to_date('20/04/21','YY/MM/DD'));
Insert into JAVA.BOARD (BNO,TITLE,WRITER,CONTENT,VIEWCNT,REGDATE,UPDATEDATE) values (75,'제목3','작성자3','내용3',0,to_date('20/04/21','YY/MM/DD'),to_date('20/04/21','YY/MM/DD'));
Insert into JAVA.BOARD (BNO,TITLE,WRITER,CONTENT,VIEWCNT,REGDATE,UPDATEDATE) values (76,'제목4','작성자4','내용4',0,to_date('20/04/21','YY/MM/DD'),to_date('20/04/21','YY/MM/DD'));
Insert into JAVA.BOARD (BNO,TITLE,WRITER,CONTENT,VIEWCNT,REGDATE,UPDATEDATE) values (77,'제목5','작성자5','내용5',0,to_date('20/04/21','YY/MM/DD'),to_date('20/04/21','YY/MM/DD'));
Insert into JAVA.BOARD (BNO,TITLE,WRITER,CONTENT,VIEWCNT,REGDATE,UPDATEDATE) values (78,'제목1','mimi','내용1',0,to_date('20/04/21','YY/MM/DD'),to_date('20/04/21','YY/MM/DD'));
Insert into JAVA.BOARD (BNO,TITLE,WRITER,CONTENT,VIEWCNT,REGDATE,UPDATEDATE) values (79,'제목2','작성자2','내용2',0,to_date('20/04/21','YY/MM/DD'),to_date('20/04/21','YY/MM/DD'));
Insert into JAVA.BOARD (BNO,TITLE,WRITER,CONTENT,VIEWCNT,REGDATE,UPDATEDATE) values (80,'제목3','작성자3','내용3',0,to_date('20/04/21','YY/MM/DD'),to_date('20/04/21','YY/MM/DD'));
Insert into JAVA.BOARD (BNO,TITLE,WRITER,CONTENT,VIEWCNT,REGDATE,UPDATEDATE) values (84,'제목2','mama','내용2',3,to_date('20/04/21','YY/MM/DD'),to_date('20/04/21','YY/MM/DD'));
Insert into JAVA.BOARD (BNO,TITLE,WRITER,CONTENT,VIEWCNT,REGDATE,UPDATEDATE) values (85,'제목3','mama','내용3',67,to_date('20/04/21','YY/MM/DD'),to_date('20/04/21','YY/MM/DD'));
Insert into JAVA.BOARD (BNO,TITLE,WRITER,CONTENT,VIEWCNT,REGDATE,UPDATEDATE) values (87,'제목5','작성자5','내용5',0,to_date('20/04/21','YY/MM/DD'),to_date('20/04/21','YY/MM/DD'));
Insert into JAVA.BOARD (BNO,TITLE,WRITER,CONTENT,VIEWCNT,REGDATE,UPDATEDATE) values (88,'제목1','mimi','내용1',1,to_date('20/04/21','YY/MM/DD'),to_date('20/04/21','YY/MM/DD'));
Insert into JAVA.BOARD (BNO,TITLE,WRITER,CONTENT,VIEWCNT,REGDATE,UPDATEDATE) values (89,'제목2','mama','내용2',2,to_date('20/04/21','YY/MM/DD'),to_date('20/04/21','YY/MM/DD'));
Insert into JAVA.BOARD (BNO,TITLE,WRITER,CONTENT,VIEWCNT,REGDATE,UPDATEDATE) values (90,'제목3','작성자3','내용3',0,to_date('20/04/21','YY/MM/DD'),to_date('20/04/21','YY/MM/DD'));
Insert into JAVA.BOARD (BNO,TITLE,WRITER,CONTENT,VIEWCNT,REGDATE,UPDATEDATE) values (91,'제목4','작성자4','내용4',0,to_date('20/04/21','YY/MM/DD'),to_date('20/04/21','YY/MM/DD'));
Insert into JAVA.BOARD (BNO,TITLE,WRITER,CONTENT,VIEWCNT,REGDATE,UPDATEDATE) values (92,'제목5','작성자5','내용5',0,to_date('20/04/21','YY/MM/DD'),to_date('20/04/21','YY/MM/DD'));
Insert into JAVA.BOARD (BNO,TITLE,WRITER,CONTENT,VIEWCNT,REGDATE,UPDATEDATE) values (93,'제목1','mimi','내용1',0,to_date('20/04/21','YY/MM/DD'),to_date('20/04/21','YY/MM/DD'));
Insert into JAVA.BOARD (BNO,TITLE,WRITER,CONTENT,VIEWCNT,REGDATE,UPDATEDATE) values (94,'제목2','작성자2','내용2',0,to_date('20/04/21','YY/MM/DD'),to_date('20/04/21','YY/MM/DD'));
Insert into JAVA.BOARD (BNO,TITLE,WRITER,CONTENT,VIEWCNT,REGDATE,UPDATEDATE) values (95,'제목3','작성자3','내용3',0,to_date('20/04/21','YY/MM/DD'),to_date('20/04/21','YY/MM/DD'));
Insert into JAVA.BOARD (BNO,TITLE,WRITER,CONTENT,VIEWCNT,REGDATE,UPDATEDATE) values (96,'제목4','작성자4','내용4',0,to_date('20/04/21','YY/MM/DD'),to_date('20/04/21','YY/MM/DD'));
Insert into JAVA.BOARD (BNO,TITLE,WRITER,CONTENT,VIEWCNT,REGDATE,UPDATEDATE) values (97,'제목5','작성자5','내용5',0,to_date('20/04/21','YY/MM/DD'),to_date('20/04/21','YY/MM/DD'));
Insert into JAVA.BOARD (BNO,TITLE,WRITER,CONTENT,VIEWCNT,REGDATE,UPDATEDATE) values (98,'제목1','mimi','내용1',0,to_date('20/04/21','YY/MM/DD'),to_date('20/04/21','YY/MM/DD'));
Insert into JAVA.BOARD (BNO,TITLE,WRITER,CONTENT,VIEWCNT,REGDATE,UPDATEDATE) values (99,'제목2','작성자2','내용2',0,to_date('20/04/21','YY/MM/DD'),to_date('20/04/21','YY/MM/DD'));
Insert into JAVA.BOARD (BNO,TITLE,WRITER,CONTENT,VIEWCNT,REGDATE,UPDATEDATE) values (100,'제목3','작성자3','내용3',0,to_date('20/04/21','YY/MM/DD'),to_date('20/04/21','YY/MM/DD'));
Insert into JAVA.BOARD (BNO,TITLE,WRITER,CONTENT,VIEWCNT,REGDATE,UPDATEDATE) values (101,'제목4','작성자4','내용4',0,to_date('20/04/21','YY/MM/DD'),to_date('20/04/21','YY/MM/DD'));
Insert into JAVA.BOARD (BNO,TITLE,WRITER,CONTENT,VIEWCNT,REGDATE,UPDATEDATE) values (102,'제목5','작성자5','내용5',0,to_date('20/04/21','YY/MM/DD'),to_date('20/04/21','YY/MM/DD'));
Insert into JAVA.BOARD (BNO,TITLE,WRITER,CONTENT,VIEWCNT,REGDATE,UPDATEDATE) values (103,'제목1','mimi','내용1',0,to_date('20/04/21','YY/MM/DD'),to_date('20/04/21','YY/MM/DD'));
Insert into JAVA.BOARD (BNO,TITLE,WRITER,CONTENT,VIEWCNT,REGDATE,UPDATEDATE) values (104,'제목2','작성자2','내용2',0,to_date('20/04/21','YY/MM/DD'),to_date('20/04/21','YY/MM/DD'));
Insert into JAVA.BOARD (BNO,TITLE,WRITER,CONTENT,VIEWCNT,REGDATE,UPDATEDATE) values (105,'제목3','작성자3','내용3',0,to_date('20/04/21','YY/MM/DD'),to_date('20/04/21','YY/MM/DD'));
Insert into JAVA.BOARD (BNO,TITLE,WRITER,CONTENT,VIEWCNT,REGDATE,UPDATEDATE) values (106,'제목4','작성자4','내용4',0,to_date('20/04/21','YY/MM/DD'),to_date('20/04/21','YY/MM/DD'));
Insert into JAVA.BOARD (BNO,TITLE,WRITER,CONTENT,VIEWCNT,REGDATE,UPDATEDATE) values (107,'제목5','작성자5','내용5',0,to_date('20/04/21','YY/MM/DD'),to_date('20/04/21','YY/MM/DD'));
Insert into JAVA.BOARD (BNO,TITLE,WRITER,CONTENT,VIEWCNT,REGDATE,UPDATEDATE) values (108,'제목1','mimi','내용1',0,to_date('20/04/21','YY/MM/DD'),to_date('20/04/21','YY/MM/DD'));
Insert into JAVA.BOARD (BNO,TITLE,WRITER,CONTENT,VIEWCNT,REGDATE,UPDATEDATE) values (109,'제목2','작성자2','내용2',0,to_date('20/04/21','YY/MM/DD'),to_date('20/04/21','YY/MM/DD'));
Insert into JAVA.BOARD (BNO,TITLE,WRITER,CONTENT,VIEWCNT,REGDATE,UPDATEDATE) values (110,'제목3','작성자3','내용3',0,to_date('20/04/21','YY/MM/DD'),to_date('20/04/21','YY/MM/DD'));
Insert into JAVA.BOARD (BNO,TITLE,WRITER,CONTENT,VIEWCNT,REGDATE,UPDATEDATE) values (111,'제목4','작성자4','내용4',0,to_date('20/04/21','YY/MM/DD'),to_date('20/04/21','YY/MM/DD'));
Insert into JAVA.BOARD (BNO,TITLE,WRITER,CONTENT,VIEWCNT,REGDATE,UPDATEDATE) values (112,'제목5','작성자5','내용5',0,to_date('20/04/21','YY/MM/DD'),to_date('20/04/21','YY/MM/DD'));
Insert into JAVA.BOARD (BNO,TITLE,WRITER,CONTENT,VIEWCNT,REGDATE,UPDATEDATE) values (113,'제목1','mimi','내용1',0,to_date('20/04/21','YY/MM/DD'),to_date('20/04/21','YY/MM/DD'));
Insert into JAVA.BOARD (BNO,TITLE,WRITER,CONTENT,VIEWCNT,REGDATE,UPDATEDATE) values (114,'제목2','작성자2','내용2',0,to_date('20/04/21','YY/MM/DD'),to_date('20/04/21','YY/MM/DD'));
Insert into JAVA.BOARD (BNO,TITLE,WRITER,CONTENT,VIEWCNT,REGDATE,UPDATEDATE) values (115,'제목3','작성자3','내용3',0,to_date('20/04/21','YY/MM/DD'),to_date('20/04/21','YY/MM/DD'));
Insert into JAVA.BOARD (BNO,TITLE,WRITER,CONTENT,VIEWCNT,REGDATE,UPDATEDATE) values (116,'제목4','작성자4','내용4',0,to_date('20/04/21','YY/MM/DD'),to_date('20/04/21','YY/MM/DD'));
Insert into JAVA.BOARD (BNO,TITLE,WRITER,CONTENT,VIEWCNT,REGDATE,UPDATEDATE) values (117,'제목5','작성자5','내용5',0,to_date('20/04/21','YY/MM/DD'),to_date('20/04/21','YY/MM/DD'));
Insert into JAVA.BOARD (BNO,TITLE,WRITER,CONTENT,VIEWCNT,REGDATE,UPDATEDATE) values (118,'제목1','mimi','내용1',0,to_date('20/04/21','YY/MM/DD'),to_date('20/04/21','YY/MM/DD'));
Insert into JAVA.BOARD (BNO,TITLE,WRITER,CONTENT,VIEWCNT,REGDATE,UPDATEDATE) values (119,'제목2','작성자2','내용2',0,to_date('20/04/21','YY/MM/DD'),to_date('20/04/21','YY/MM/DD'));
Insert into JAVA.BOARD (BNO,TITLE,WRITER,CONTENT,VIEWCNT,REGDATE,UPDATEDATE) values (120,'제목3','작성자3','내용3',0,to_date('20/04/21','YY/MM/DD'),to_date('20/04/21','YY/MM/DD'));
Insert into JAVA.BOARD (BNO,TITLE,WRITER,CONTENT,VIEWCNT,REGDATE,UPDATEDATE) values (121,'제목4','작성자4','내용4',0,to_date('20/04/21','YY/MM/DD'),to_date('20/04/21','YY/MM/DD'));
Insert into JAVA.BOARD (BNO,TITLE,WRITER,CONTENT,VIEWCNT,REGDATE,UPDATEDATE) values (122,'제목5','작성자5','내용5',0,to_date('20/04/21','YY/MM/DD'),to_date('20/04/21','YY/MM/DD'));
Insert into JAVA.BOARD (BNO,TITLE,WRITER,CONTENT,VIEWCNT,REGDATE,UPDATEDATE) values (123,'제목1','mimi','내용1',0,to_date('20/04/21','YY/MM/DD'),to_date('20/04/21','YY/MM/DD'));
Insert into JAVA.BOARD (BNO,TITLE,WRITER,CONTENT,VIEWCNT,REGDATE,UPDATEDATE) values (124,'제목2','작성자2','내용2',0,to_date('20/04/21','YY/MM/DD'),to_date('20/04/21','YY/MM/DD'));
Insert into JAVA.BOARD (BNO,TITLE,WRITER,CONTENT,VIEWCNT,REGDATE,UPDATEDATE) values (125,'제목3','작성자3','내용3',0,to_date('20/04/21','YY/MM/DD'),to_date('20/04/21','YY/MM/DD'));
Insert into JAVA.BOARD (BNO,TITLE,WRITER,CONTENT,VIEWCNT,REGDATE,UPDATEDATE) values (126,'제목4','작성자4','내용4',0,to_date('20/04/21','YY/MM/DD'),to_date('20/04/21','YY/MM/DD'));
Insert into JAVA.BOARD (BNO,TITLE,WRITER,CONTENT,VIEWCNT,REGDATE,UPDATEDATE) values (127,'제목5','작성자5','내용5',0,to_date('20/04/21','YY/MM/DD'),to_date('20/04/21','YY/MM/DD'));
Insert into JAVA.BOARD (BNO,TITLE,WRITER,CONTENT,VIEWCNT,REGDATE,UPDATEDATE) values (128,'제목1','mimi','내용1',0,to_date('20/04/21','YY/MM/DD'),to_date('20/04/21','YY/MM/DD'));
Insert into JAVA.BOARD (BNO,TITLE,WRITER,CONTENT,VIEWCNT,REGDATE,UPDATEDATE) values (129,'제목2','작성자2','내용2',0,to_date('20/04/21','YY/MM/DD'),to_date('20/04/21','YY/MM/DD'));
Insert into JAVA.BOARD (BNO,TITLE,WRITER,CONTENT,VIEWCNT,REGDATE,UPDATEDATE) values (130,'제목3','작성자3','내용3',0,to_date('20/04/21','YY/MM/DD'),to_date('20/04/21','YY/MM/DD'));
Insert into JAVA.BOARD (BNO,TITLE,WRITER,CONTENT,VIEWCNT,REGDATE,UPDATEDATE) values (131,'제목4','작성자4','내용4',0,to_date('20/04/21','YY/MM/DD'),to_date('20/04/21','YY/MM/DD'));
Insert into JAVA.BOARD (BNO,TITLE,WRITER,CONTENT,VIEWCNT,REGDATE,UPDATEDATE) values (132,'제목5','작성자5','내용5',0,to_date('20/04/21','YY/MM/DD'),to_date('20/04/21','YY/MM/DD'));
Insert into JAVA.BOARD (BNO,TITLE,WRITER,CONTENT,VIEWCNT,REGDATE,UPDATEDATE) values (133,'제목1','mimi','내용1',0,to_date('20/04/21','YY/MM/DD'),to_date('20/04/21','YY/MM/DD'));
Insert into JAVA.BOARD (BNO,TITLE,WRITER,CONTENT,VIEWCNT,REGDATE,UPDATEDATE) values (134,'제목2','mama','내용2',0,to_date('20/04/21','YY/MM/DD'),to_date('20/04/21','YY/MM/DD'));
Insert into JAVA.BOARD (BNO,TITLE,WRITER,CONTENT,VIEWCNT,REGDATE,UPDATEDATE) values (135,'제목3','mama','내용3',0,to_date('20/04/21','YY/MM/DD'),to_date('20/04/21','YY/MM/DD'));
Insert into JAVA.BOARD (BNO,TITLE,WRITER,CONTENT,VIEWCNT,REGDATE,UPDATEDATE) values (136,'제목4','mama','내용4',0,to_date('20/04/21','YY/MM/DD'),to_date('20/04/21','YY/MM/DD'));
Insert into JAVA.BOARD (BNO,TITLE,WRITER,CONTENT,VIEWCNT,REGDATE,UPDATEDATE) values (137,'제목5','mama','내용5',0,to_date('20/04/21','YY/MM/DD'),to_date('20/04/21','YY/MM/DD'));
Insert into JAVA.BOARD (BNO,TITLE,WRITER,CONTENT,VIEWCNT,REGDATE,UPDATEDATE) values (138,'제목1','mimi','내용1',0,to_date('20/04/21','YY/MM/DD'),to_date('20/04/21','YY/MM/DD'));
Insert into JAVA.BOARD (BNO,TITLE,WRITER,CONTENT,VIEWCNT,REGDATE,UPDATEDATE) values (139,'제목2','mama','내용2',0,to_date('20/04/21','YY/MM/DD'),to_date('20/04/21','YY/MM/DD'));
Insert into JAVA.BOARD (BNO,TITLE,WRITER,CONTENT,VIEWCNT,REGDATE,UPDATEDATE) values (140,'제목3','mama','내용3',0,to_date('20/04/21','YY/MM/DD'),to_date('20/04/21','YY/MM/DD'));
Insert into JAVA.BOARD (BNO,TITLE,WRITER,CONTENT,VIEWCNT,REGDATE,UPDATEDATE) values (141,'제목4','mama','내용4',0,to_date('20/04/21','YY/MM/DD'),to_date('20/04/21','YY/MM/DD'));
Insert into JAVA.BOARD (BNO,TITLE,WRITER,CONTENT,VIEWCNT,REGDATE,UPDATEDATE) values (142,'제목5','mama','내용5',0,to_date('20/04/21','YY/MM/DD'),to_date('20/04/21','YY/MM/DD'));
Insert into JAVA.BOARD (BNO,TITLE,WRITER,CONTENT,VIEWCNT,REGDATE,UPDATEDATE) values (143,'제목1','mimi','내용1',0,to_date('20/04/21','YY/MM/DD'),to_date('20/04/21','YY/MM/DD'));
Insert into JAVA.BOARD (BNO,TITLE,WRITER,CONTENT,VIEWCNT,REGDATE,UPDATEDATE) values (144,'제목2','mama','내용2',0,to_date('20/04/21','YY/MM/DD'),to_date('20/04/21','YY/MM/DD'));
Insert into JAVA.BOARD (BNO,TITLE,WRITER,CONTENT,VIEWCNT,REGDATE,UPDATEDATE) values (145,'제목3','mama','내용3',25,to_date('20/04/21','YY/MM/DD'),to_date('20/04/21','YY/MM/DD'));
Insert into JAVA.BOARD (BNO,TITLE,WRITER,CONTENT,VIEWCNT,REGDATE,UPDATEDATE) values (148,'제목1','mimi','내용1',1,to_date('20/04/21','YY/MM/DD'),to_date('20/04/21','YY/MM/DD'));
Insert into JAVA.BOARD (BNO,TITLE,WRITER,CONTENT,VIEWCNT,REGDATE,UPDATEDATE) values (153,'제목1','mimi','내용1',2,to_date('20/04/21','YY/MM/DD'),to_date('20/04/21','YY/MM/DD'));
Insert into JAVA.BOARD (BNO,TITLE,WRITER,CONTENT,VIEWCNT,REGDATE,UPDATEDATE) values (154,'제목2','mama','<p>내용2</p><p><img src="/getImg.do?fileName=8202aa0da03d422f887e7f8abcf5bd15.jpg" style="width: 50%;"></p>',2,to_date('20/04/21','YY/MM/DD'),to_date('20/04/23','YY/MM/DD'));
Insert into JAVA.BOARD (BNO,TITLE,WRITER,CONTENT,VIEWCNT,REGDATE,UPDATEDATE) values (166,'title','mama','<p>수정3</p><p><br></p>',51,to_date('20/04/22','YY/MM/DD'),to_date('20/04/23','YY/MM/DD'));
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
