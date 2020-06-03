DROP TABLE MEMBER cascade constraints  PURGE ;
DROP TABLE ROLE CASCADE CONSTRAINTS PURGE;
DROP TABLE MENU CASCADE CONSTRAINTS PURGE;
DROP TABLE PROJECTMASTER  CASCADE CONSTRAINTS  PURGE;
DROP TABLE PROJECTTEAM CASCADE CONSTRAINTS PURGE;
DROP TABLE PROJECTBOARDMASTER  CASCADE CONSTRAINTS PURGE;
DROP TABLE PROJECTBOARD CASCADE CONSTRAINTS PURGE;
DROP TABLE REPLY CASCADE CONSTRAINTS PURGE;
DROP TABLE ATTACHFILE CASCADE CONSTRAINTS PURGE;
DROP TABLE FILEDETAIL CASCADE CONSTRAINTS PURGE;
DROP TABLE PERSONALSCHEDULE CASCADE CONSTRAINTS PURGE;
DROP TABLE SMSHISTORY CASCADE CONSTRAINTS PURGE;
DROP TABLE NOTICEHISTORY CASCADE CONSTRAINTS PURGE;
DROP TABLE METTINGROOMINFO CASCADE CONSTRAINTS PURGE;
DROP TABLE LOGINLOG CASCADE CONSTRAINTS PURGE;
DROP TABLE MAILHISTORY CASCADE CONSTRAINTS PURGE;
DROP TABLE SENSERINFO CASCADE CONSTRAINTS PURGE;
DROP TABLE COMMONCODE CASCADE CONSTRAINTS PURGE;
DROP TABLE RESERVATION CASCADE CONSTRAINTS PURGE;
DROP TABLE PERSONALSCHEDULEDETAIL CASCADE CONSTRAINTS PURGE;
DROP TABLE OFFICIALSCHEDULE CASCADE CONSTRAINTS PURGE;




-- 사용자
CREATE TABLE MEMBER (
		email VARCHAR(20) NOT NULL,
		password VARCHAR(15) NOT NULL,
		phonenumber VARCHAR(30) NOT NULL,
		name VARCHAR(20) NOT NULL,
		nickname VARCHAR(10) NOT NULL,
		postcode NUMERIC NOT NULL,
		address VARCHAR(150) NOT NULL,
		detailaddress VARCHAR(150) NOT NULL,
		picture VARCHAR(50) NOT NULL,
		role VARCHAR(20) NOT NULL,
		deleteyn CHAR(1) NOT NULL,
		regdate DATE NOT NULL
);

-- 사용자
ALTER TABLE MEMBER
	ADD CONSTRAINT PK_MEMBER -- 사용자 기본키
	PRIMARY KEY (
		email -- 아이디
	);

-- 권한
CREATE TABLE ROLE (
		code VARCHAR(20) NOT NULL,
		name VARCHAR(50) NOT NULL,
		regdate DATE NOT NULL
);

-- 권한
ALTER TABLE ROLE
	ADD CONSTRAINT PK_ROLE -- 권한 기본키
	PRIMARY KEY (
		code -- 코드명
	);

-- 메뉴
CREATE TABLE MENU (
		url VARCHAR(15) NOT NULL,
		name VARCHAR(30) NOT NULL,
		depth NUMERIC NOT NULL,
		register VARCHAR(20) NOT NULL,
		regdate DATE NOT NULL
);

-- 메뉴
ALTER TABLE MENU
	ADD CONSTRAINT PK_MENU -- 메뉴 기본키
	PRIMARY KEY (
		url -- 주소
	);

-- 프로젝트관리
CREATE TABLE PRO_MASTER (
		projectid VARCHAR(15) NOT NULL,
		projectname VARCHAR(300) NOT NULL,
		projectmanagerid VARCHAR(20) NOT NULL,
		projectleaderid VARCHAR(20) NOT NULL,
		startdate DATE NOT NULL,
		enddate DATE NOT NULL,
		regdate DATE NOT NULL
);

-- 프로젝트관리
ALTER TABLE PRO_MASTER
	ADD CONSTRAINT PK_PRO_MASTER -- 프로젝트관리 기본키
	PRIMARY KEY (
		projectid -- 프로젝트아이디
	);



-- 프로젝트멤버
CREATE TABLE PRO_TEAM (
		projectid VARCHAR(15) NOT NULL,
		memberid VARCHAR(20) NOT NULL,
		regdate DATE NOT NULL
);

-- 프로젝트멤버
ALTER TABLE PRO_TEAM
	ADD CONSTRAINT PK_PRO_TEAM -- 프로젝트멤버 기본키
	PRIMARY KEY (
		projectid, -- 프로젝트아이디
		memberid   -- 멤버아이디
	);

-- 프로젝트게시판관리
CREATE TABLE PRO_BOARDMASTER (
		boardname VARCHAR(20) NOT NULL,
		boardtype VARCHAR(20) NOT NULL,
		fileyn CHAR(1) NOT NULL,
		replyyn CHAR(1) NOT NULL,
		filedownloadyn CHAR(1) NOT NULL,
		register VARCHAR(20) NOT NULL,
		regdate DATE NOT NULL
);

-- 프로젝트게시판관리
ALTER TABLE PRO_BOARDMASTER
	ADD CONSTRAINT PK_PRO_BOARDMASTER -- 프로젝트게시판관리 기본키
	PRIMARY KEY (
		boardname -- 보드이름
	);

-- 게시판
CREATE TABLE PRO_BOARD (
		boardname VARCHAR(20) NOT NULL,
		no NUMERIC NOT NULL,
		title VARCHAR(100) NOT NULL,
		content VARCHAR(1500) NOT NULL,
		writer VARCHAR(20) NOT NULL,
		viewcnt NUMERIC NOT NULL,
		regdate DATE NOT NULL,
		updatedate DATE NOT NULL,
		startdate DATE NULL,
		enddate DATE NULL,
		attachid VARCHAR(50) NOT NULL,
		deleteyn CHAR(1) NOT NULL,
		fileopenyn CHAR(1) NOT NULL
);

-- 게시판
ALTER TABLE PRO_BOARD
	ADD CONSTRAINT PK_PRO_BOARD -- 게시판 기본키
	PRIMARY KEY (
		no -- 게시글번호
	);



-- 댓글
CREATE TABLE REPLY (
		no NUMERIC NOT NULL,
		bno NUMERIC NOT NULL,
		content VARCHAR(20) NOT NULL,
		writer VARCHAR(20) NOT NULL,
		regdate DATE NOT NULL,
		deleteyn CHAR(1) NOT NULL,
		updatedate DATE NOT NULL
);

-- 댓글
ALTER TABLE REPLY
	ADD CONSTRAINT PK_REPLY -- 댓글 기본키
	PRIMARY KEY (
		no -- 관리번호
	);



-- 첨부파일
CREATE TABLE ATTACHFILE (
		attachid VARCHAR(50) NOT NULL,
		register VARCHAR(20) NOT NULL,
		regdate DATE NOT NULL
);

-- 첨부파일
ALTER TABLE ATTACHFILE
	ADD CONSTRAINT PK_ATTACHFILE -- 첨부파일 기본키
	PRIMARY KEY (
		attachid -- 관리번호
	);

-- 파일세부사항
CREATE TABLE FILEDETAIL (
		attachid VARCHAR(50) NOT NULL,
		attachdirectory VARCHAR(30) NOT NULL,
		storedfilename VARCHAR(100) NOT NULL,
		originfilename VARCHAR(100) NOT NULL,
		extension VARCHAR(5) NOT NULL,
		filesize NUMERIC NOT NULL,
		register VARCHAR(20) NOT NULL
);

-- 파일세부사항
ALTER TABLE FILEDETAIL
	ADD CONSTRAINT PK_FILEDETAIL -- 파일세부사항 기본키
	PRIMARY KEY (
		attachid -- 관리번호
	);

-- 개인별일정
CREATE TABLE PER_SCHEDULE (
		no NUMERIC NOT NULL,
		todolist CLOB NOT NULL,
		startdate DATE NOT NULL,
		enddate DATE NOT NULL,
		memberid VARCHAR(20) NULL,
		register VARCHAR(20) NOT NULL,
		regdate DATE NOT NULL,
		projectid VARCHAR(15) NULL
);

-- 개인별일정
ALTER TABLE PER_SCHEDULE
	ADD CONSTRAINT PK_PER_SCHEDULE -- 개인별일정 기본키
	PRIMARY KEY (
		no -- 관리번호
	);


-- 메일이력
CREATE TABLE MAILHISTORY (
		no NUMERIC NOT NULL,
		processtatus VARCHAR(10) NOT NULL,
		subjcet VARCHAR(200) NOT NULL,
		content CLOB NOT NULL,
		senderemail VARCHAR(20) NOT NULL,
		receiveremail VARCHAR(20) NOT NULL,
		attachid VARCHAR(50) NOT NULL,
		regdate DATE NOT NULL
);

-- 메일이력
ALTER TABLE MAILHISTORY
	ADD CONSTRAINT PK_MAILHISTORY -- 메일이력 기본키
	PRIMARY KEY (
		no -- 관리번호
	);


-- 문자발송이력
CREATE TABLE SMSHISTORY (
		no NUMERIC NOT NULL,
		processstatus VARCHAR(10) NOT NULL,
		sendertelno VARCHAR(30) NOT NULL,
		receivertelno VARCHAR(30) NOT NULL,
		content VARCHAR(150) NOT NULL,
		regdate DATE NOT NULL
);

-- 문자발송이력
ALTER TABLE SMSHISTORY
	ADD CONSTRAINT PK_SMSHISTORY -- 문자발송이력 기본키
	PRIMARY KEY (
		no -- 관리번호
	);



-- 쪽지이력관리
CREATE TABLE NOT_HISTORY (
		no NUMERIC NOT NULL,
		sender VARCHAR(20) NOT NULL,
		receiver VARCHAR(20) NOT NULL,
		title VARCHAR(100) NOT NULL,
		content VARCHAR(1500) NOT NULL,
		register VARCHAR(20) NOT NULL,
		regdate DATE NOT NULL
);

-- 쪽지이력관리
ALTER TABLE NOT_HISTORY
	ADD CONSTRAINT PK_NOT_HISTORY -- 쪽지이력관리 기본키
	PRIMARY KEY (
		no -- 관리번호
	);


-- 회의실정보
CREATE TABLE METTINGROOMINFO (
		no NUMERIC NOT NULL,
		latitude  VARCHAR(15) NOT NULL,
		longitude VARCHAR(15) NOT NULL,
		postcode NUMERIC NOT NULL,
		zibunaddress VARCHAR(200) NOT NULL,
		deatiladdress VARCHAR(200) NOT NULL,
		register VARCHAR(20) NOT NULL,
		regdate DATE NOT NULL
);

-- 회의실정보
ALTER TABLE METTINGROOMINFO
	ADD CONSTRAINT PK_METTINGROOMINFO -- 회의실정보 기본키
	PRIMARY KEY (
		no -- 관리번호
	);



-- 아두이노센서이력
CREATE TABLE SENSERINFO (
		NO NUMERIC NOT NULL,
		Temperatured NUMERIC NOT NULL,
		Humidity NUMERIC NOT NULL,
		Distance NUMERIC NOT NULL,
		Discomfort_index NUMERIC NOT NULL,
		regdate DATE NOT NULL
);

-- 아두이노센서이력
ALTER TABLE SENSERINFO
	ADD CONSTRAINT PK_SENSERINFO -- 아두이노센서이력 기본키
	PRIMARY KEY (
		NO -- 관리번호
	);
\
-- 로그인이력
CREATE TABLE LOGINLOG (
		no NUMERIC NOT NULL,
		accessid VARCHAR(20) NOT NULL,
		ipaddress VARCHAR(15) NOT NULL,
		logitime DATE NOT NULL,
		logout DATE NOT NULL
);

-- 로그인이력
ALTER TABLE LOGINLOG
	ADD CONSTRAINT PK_LOGINLOG -- 로그인이력 기본키
	PRIMARY KEY (
		no -- 관리번호
	);

-- 공통코드
CREATE TABLE COMMONCODE (
		code VARCHAR(10) NOT NULL,
		name VARCHAR(30) NOT NULL,
		register VARCHAR(20) NOT NULL,
		regdate DATE NOT NULL
);

-- 공통코드
ALTER TABLE COMMONCODE
	ADD CONSTRAINT PK_COMMONCODE -- 공통코드 기본키
	PRIMARY KEY (
		code -- 공통코드
	);

-- 예약
CREATE TABLE RESERVATION (
		no NUMERIC NOT NULL,
		email VARCHAR(20) NOT NULL,
		payment NUMERIC(10,3) NOT NULL,
		meetingno NUMERIC NOT NULL,
		type VARCHAR(20) NOT NULL,
		regdate DATE NOT NULL
);

-- 예약
ALTER TABLE RESERVATION
	ADD CONSTRAINT PK_RESERVATION -- 예약 기본키
	PRIMARY KEY (
		no -- 관리번호
	);


-- 개인별일정상세
CREATE TABLE PER_SCH_DETAIL (
		no NUMERIC NOT NULL,
		taskno NUMERIC NOT NULL,
		processpercent NUMERIC NOT NULL,
		approvalyn CHAR(1) NOT NULL,
		processtatus VARCHAR(10) NOT NULL,
		attachid VARCHAR(50) NULL
);

-- 개인별일정상세
ALTER TABLE PER_SCH_DETAIL
	ADD CONSTRAINT PK_PER_SCH_DETAIL -- 개인별일정상세 기본키
	PRIMARY KEY (
		no -- 관리번호
	);


-- 공식일정
CREATE TABLE OFF_SCHEDULE (
		no NUMERIC NOT NULL,
		projectid VARCHAR(15) NOT NULL,
		taskname VARCHAR(1000) NOT NULL,
		startdate DATE NOT NULL,
		enddate DATE NOT NULL,
		register VARCHAR(20) NOT NULL,
		regdate DATE NOT NULL
);

-- 공식일정
ALTER TABLE OFF_SCHEDULE
	ADD CONSTRAINT PK_OFF_SCHEDULE -- 공식일정 기본키
	PRIMARY KEY (
		no -- 관리번호
	);


-- 사용자
ALTER TABLE MEMBER
	ADD CONSTRAINT FK_ROLE_TO_MEMBER -- 권한 -> 사용자
	FOREIGN KEY (
		role -- 권한
	)
	REFERENCES ROLE ( -- 권한
		code -- 코드명
	);

-- 메뉴
ALTER TABLE MENU
	ADD CONSTRAINT FK_MEMBER_TO_MENU -- 사용자 -> 메뉴
	FOREIGN KEY (
		register -- 등록한사람
	)
	REFERENCES MEMBER ( -- 사용자
		email -- 아이디
	);

-- 프로젝트관리
ALTER TABLE PRO_MASTER
	ADD CONSTRAINT FK_MEMBER_TO_PRO_MASTER -- 사용자 -> 프로젝트관리
	FOREIGN KEY (
		projectmanagerid -- 프로젝트매니저아이디
	)
	REFERENCES MEMBER ( -- 사용자
		email -- 아이디
	);

-- 프로젝트관리
ALTER TABLE PRO_MASTER
	ADD CONSTRAINT FK_MEMBER_TO_PRO_MASTER2 -- 사용자 -> 프로젝트관리2
	FOREIGN KEY (
		projectleaderid -- 프로젝트리더아이디
	)
	REFERENCES MEMBER ( -- 사용자
		email -- 아이디
	);

-- 프로젝트멤버
ALTER TABLE PRO_TEAM
	ADD CONSTRAINT FK_MEMBER_TO_PRO_TEAM -- 사용자 -> 프로젝트멤버
	FOREIGN KEY (
		memberid -- 멤버아이디
	)
	REFERENCES MEMBER ( -- 사용자
		email -- 아이디
	);

-- 프로젝트멤버
ALTER TABLE PRO_TEAM
	ADD CONSTRAINT FK_PRO_MASTER_TO_PRO_TEAM -- 프로젝트관리 -> 프로젝트멤버
	FOREIGN KEY (
		projectid -- 프로젝트아이디
	)
	REFERENCES PRO_MASTER ( -- 프로젝트관리
		projectid -- 프로젝트아이디
	);

-- 프로젝트게시판관리
ALTER TABLE PRO_BOARDMASTER
	ADD CONSTRAINT FK_MEMBER_TO_PRO_BOA_MAS -- 사용자 -> 프로젝트게시판관리
	FOREIGN KEY (
		register -- 등록한사람
	)
	REFERENCES MEMBER ( -- 사용자
		email -- 아이디
	);

-- 게시판
ALTER TABLE PRO_BOARD
	ADD CONSTRAINT FK_PRO_BOA_MAS_TO_PRO_BOARD -- 프로젝트게시판관리 -> 게시판
	FOREIGN KEY (
		boardname -- 게시판이름
	)
	REFERENCES PRO_BOARDMASTER ( -- 프로젝트게시판관리
		boardname -- 보드이름
	);

-- 게시판
ALTER TABLE PRO_BOARD
	ADD CONSTRAINT FK_MEMBER_TO_PRO_BOA -- 사용자 -> 게시판
	FOREIGN KEY (
		writer -- 작성자
	)
	REFERENCES MEMBER ( -- 사용자
		email -- 아이디
	);

-- 게시판
ALTER TABLE PRO_BOARD
	ADD CONSTRAINT FK_ATT_FIL_TO_PRO_BOARD -- 첨부파일 -> 게시판
	FOREIGN KEY (
		attachid -- 파일관리번호
	)
	REFERENCES ATTACHFILE ( -- 첨부파일
		attachid -- 관리번호
	);

-- 댓글
ALTER TABLE REPLY
	ADD CONSTRAINT FK_MEMBER_TO_REPLY -- 사용자 -> 댓글
	FOREIGN KEY (
		writer -- 작성자
	)
	REFERENCES MEMBER ( -- 사용자
		email -- 아이디
	);

-- 댓글
ALTER TABLE REPLY
	ADD CONSTRAINT FK_PRO_BOARD_TO_REPLY -- 게시판 -> 댓글
	FOREIGN KEY (
		bno -- 게시글번호
	)
	REFERENCES PRO_BOARD ( -- 게시판
		no -- 게시글번호
	);

-- 첨부파일
ALTER TABLE ATTACHFILE
	ADD CONSTRAINT FK_MEMBER_TO_ATTACHFILE -- 사용자 -> 첨부파일
	FOREIGN KEY (
		register -- 등록한사람
	)
	REFERENCES MEMBER ( -- 사용자
		email -- 아이디
	);

-- 파일세부사항
ALTER TABLE FILEDETAIL
	ADD CONSTRAINT FK_ATTACHFILE_TO_FILEDETAIL -- 첨부파일 -> 파일세부사항
	FOREIGN KEY (
		attachid -- 관리번호
	)
	REFERENCES ATTACHFILE ( -- 첨부파일
		attachid -- 관리번호
	);

-- 파일세부사항
ALTER TABLE FILEDETAIL
	ADD CONSTRAINT FK_MEMBER_TO_FILEDETAIL -- 사용자 -> 파일세부사항
	FOREIGN KEY (
		register -- 등록한사람
	)
	REFERENCES MEMBER ( -- 사용자
		email -- 아이디
	);

-- 개인별일정
ALTER TABLE PER_SCHEDULE
	ADD CONSTRAINT FK_MEMBER_TO_PER_SCHEDULE -- 사용자 -> 개인별일정
	FOREIGN KEY (
		register -- 할당한사람아이디
	)
	REFERENCES MEMBER ( -- 사용자
		email -- 아이디
	);

-- 개인별일정
ALTER TABLE PER_SCHEDULE
	ADD CONSTRAINT FK_PRO_TEAM_TO_PER_SCHEDULE -- 프로젝트멤버 -> 개인별일정
	FOREIGN KEY (
		projectid, -- 프로젝트아이디
		memberid   -- 담당자
	)
	REFERENCES PRO_TEAM ( -- 프로젝트멤버
		projectid, -- 프로젝트아이디
		memberid   -- 멤버아이디
	);

-- 메일이력
ALTER TABLE MAILHISTORY
	ADD CONSTRAINT FK_ATTACHFILE_TO_MAILHISTORY -- 첨부파일 -> 메일이력
	FOREIGN KEY (
		attachid -- 파일관리번호
	)
	REFERENCES ATTACHFILE ( -- 첨부파일
		attachid -- 관리번호
	);

-- 메일이력
ALTER TABLE MAILHISTORY
	ADD CONSTRAINT FK_COMMONCODE_TO_MAILHISTORY -- 공통코드 -> 메일이력
	FOREIGN KEY (
		processtatus -- 프로세스상태
	)
	REFERENCES COMMONCODE ( -- 공통코드
		code -- 공통코드
	);

-- 문자발송이력
ALTER TABLE SMSHISTORY
	ADD CONSTRAINT FK_COMMONCODE_TO_SMSHISTORY -- 공통코드 -> 문자발송이력
	FOREIGN KEY (
		processstatus -- 프로세스상태
	)
	REFERENCES COMMONCODE ( -- 공통코드
		code -- 공통코드
	);

-- 쪽지이력관리
ALTER TABLE NOT_HISTORY
	ADD CONSTRAINT FK_MEMBER_TO_NOT_HISTORY -- 사용자 -> 쪽지이력관리
	FOREIGN KEY (
		register -- 등록한사람
	)
	REFERENCES MEMBER ( -- 사용자
		email -- 아이디
	);

-- 회의실정보
ALTER TABLE METTINGROOMINFO
	ADD CONSTRAINT FK_MEMBER_TO_METTINGROOMINFO -- 사용자 -> 회의실정보
	FOREIGN KEY (
		register -- 등록한사람
	)
	REFERENCES MEMBER ( -- 사용자
		email -- 아이디
	);

-- 로그인이력
ALTER TABLE LOGINLOG
	ADD CONSTRAINT FK_MEMBER_TO_LOGINLOG -- 사용자 -> 로그인이력
	FOREIGN KEY (
		accessid -- 접속아이디
	)
	REFERENCES MEMBER ( -- 사용자
		email -- 아이디
	);

-- 공통코드
ALTER TABLE COMMONCODE
	ADD CONSTRAINT FK_MEMBER_TO_COMMONCODE -- 사용자 -> 공통코드
	FOREIGN KEY (
		register -- 등록한사람
	)
	REFERENCES MEMBER ( -- 사용자
		email -- 아이디
	);

-- 예약
ALTER TABLE RESERVATION
	ADD CONSTRAINT FK_MEMBER_TO_RESERVATION -- 사용자 -> 예약
	FOREIGN KEY (
		email -- 결제요청자
	)
	REFERENCES MEMBER ( -- 사용자
		email -- 아이디
	);

-- 예약
ALTER TABLE RESERVATION
	ADD CONSTRAINT FK_MET_ROO_INF_TO_RESERVATION -- 회의실정보 -> 예약
	FOREIGN KEY (
		meetingno -- 회의실정보번호
	)
	REFERENCES METTINGROOMINFO ( -- 회의실정보
		no -- 관리번호
	);

-- 개인별일정상세
ALTER TABLE PER_SCH_DETAIL
	ADD CONSTRAINT FK_PER_SCH_TO_PER_SCH_DETAIL -- 개인별일정 -> 개인별일정상세
	FOREIGN KEY (
		taskno -- 개인별일정번호
	)
	REFERENCES PER_SCHEDULE ( -- 개인별일정
		no -- 관리번호
	);

-- 개인별일정상세
ALTER TABLE PER_SCH_DETAIL
	ADD CONSTRAINT FK_COM_COD_TO_PER_SCH_DET -- 공통코드 -> 개인별일정상세
	FOREIGN KEY (
		processtatus -- 프로세스상태
	)
	REFERENCES COMMONCODE ( -- 공통코드
		code -- 공통코드
	);

-- 개인별일정상세
ALTER TABLE PER_SCH_DETAIL
	ADD CONSTRAINT FK_ATT_FIL_TO_PER_SCH_DET -- 첨부파일 -> 개인별일정상세
	FOREIGN KEY (
		attachid -- 파일이름
	)
	REFERENCES ATTACHFILE ( -- 첨부파일
		attachid -- 관리번호
	);

-- 공식일정
ALTER TABLE OFF_SCHEDULE
	ADD CONSTRAINT PRO_MAS_TO_OFF_SCH
	FOREIGN KEY (
		projectid 
	)
	REFERENCES PRO_MASTER ( 
		projectid
	);

-- 공식일정
ALTER TABLE OFF_SCHEDULE
	ADD CONSTRAINT FK_MEMBER_TO_OFF_SCH
	FOREIGN KEY (
		register -- 등록자
	)
	REFERENCES MEMBER ( -- 사용자
		email -- 아이디
	);