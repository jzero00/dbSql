/* 게시판 속성 */
DROP TABLE BoardAttr 
   CASCADE CONSTRAINTS;

/* 게시글 */
DROP TABLE Board 
   CASCADE CONSTRAINTS;

/* 첨부파일 */
DROP TABLE attachfile 
   CASCADE CONSTRAINTS;

/* 댓글 */
DROP TABLE Cmts 
   CASCADE CONSTRAINTS;

/* 일반 회원 */
DROP TABLE Member 
   CASCADE CONSTRAINTS;

/* 업체 회원 */
DROP TABLE ComMember 
   CASCADE CONSTRAINTS;

/* 블랙리스트 */
DROP TABLE BlackList 
   CASCADE CONSTRAINTS;

/* 예약 */
DROP TABLE Rsy 
   CASCADE CONSTRAINTS;

/* 결제 */
DROP TABLE Pay 
   CASCADE CONSTRAINTS;

/* 업체 서비스 */
DROP TABLE ComService 
   CASCADE CONSTRAINTS;

/* 코드그룹 */
DROP TABLE CodeGroup 
   CASCADE CONSTRAINTS;

/* 예약게시판 */
DROP TABLE RsyBoard 
   CASCADE CONSTRAINTS;

/* 신고 게시판 */
DROP TABLE Report 
   CASCADE CONSTRAINTS;

/* 리뷰 게시판 */
DROP TABLE Review 
   CASCADE CONSTRAINTS;

/* 리뷰댓글 */
DROP TABLE ReviewCmts 
   CASCADE CONSTRAINTS;

/* 예약리뷰첨부파일 */
DROP TABLE RRFile 
   CASCADE CONSTRAINTS;

/* 게시판 속성 */
CREATE TABLE BoardAttr (
   board_id INTEGER NOT NULL, /* 게시판 id */
   board_name VARCHAR2(50), /* 게시판 이름 */
   board_writable INTEGER /* 게시판 활성화 여부 */
);

COMMENT ON TABLE BoardAttr IS '게시판 속성';

COMMENT ON COLUMN BoardAttr.board_id IS '게시판 id';

COMMENT ON COLUMN BoardAttr.board_name IS '게시판 이름';

COMMENT ON COLUMN BoardAttr.board_writable IS '게시판 활성화 여부';

CREATE UNIQUE INDEX PK_BoardAttr
   ON BoardAttr (
      board_id ASC
   );

ALTER TABLE BoardAttr
   ADD
      CONSTRAINT PK_BoardAttr
      PRIMARY KEY (
         board_id
      );

/* 게시글 */
CREATE TABLE Board (
   board_no INTEGER NOT NULL, /* 게시글 번호 */
   board_type VARCHAR2(50), /* 게시글 타입 */
   board_title VARCHAR2(300), /* 게시글 제목 */
   board_contents CLOB, /* 게시글 내용 */
   board_regdate DATE, /* 게시글 작성일시 */
   board_modi_date DATE, /* 게시글 수정일시 */
   board_del_date DATE, /* 게시글 삭제일시 */
   board_act INTEGER, /* 게시글 활성화여부 */
   board_view_count INTEGER, /* 게시글 조회수 */
   board_rec_count INTEGER, /* 게시글 추천수 */
   board_auth_level INTEGER, /* 게시글 우선순위 레벨 */
   board_cmts_act INTEGER, /* 게시글 댓글 활성화 여부 */
   board_id INTEGER, /* 게시판 id */
   mem_no INTEGER /* 게시글 작성자 */
);

COMMENT ON TABLE Board IS '게시글';

COMMENT ON COLUMN Board.board_no IS '게시글 번호';

COMMENT ON COLUMN Board.board_type IS '게시글 타입';

COMMENT ON COLUMN Board.board_title IS '게시글 제목';

COMMENT ON COLUMN Board.board_contents IS '게시글 내용';

COMMENT ON COLUMN Board.board_regdate IS '게시글 작성일시';

COMMENT ON COLUMN Board.board_modi_date IS '게시글 수정일시';

COMMENT ON COLUMN Board.board_del_date IS '게시글 삭제일시';

COMMENT ON COLUMN Board.board_act IS '게시글 활성화여부';

COMMENT ON COLUMN Board.board_view_count IS '게시글 조회수';

COMMENT ON COLUMN Board.board_rec_count IS '게시글 추천수';

COMMENT ON COLUMN Board.board_auth_level IS '게시글 우선순위 레벨';

COMMENT ON COLUMN Board.board_cmts_act IS '게시글 댓글 활성화 여부';

COMMENT ON COLUMN Board.board_id IS '게시판 id';

COMMENT ON COLUMN Board.mem_no IS '게시글 작성자';

CREATE UNIQUE INDEX PK_Board
   ON Board (
      board_no ASC
   );

ALTER TABLE Board
   ADD
      CONSTRAINT PK_Board
      PRIMARY KEY (
         board_no
      );

/* 첨부파일 */
CREATE TABLE attachfile (
   atfile_no NUMBER NOT NULL, /* 첨부파일 번호 */
   atfile_path VARCHAR2(500), /* 첨부파일 경로 */
   atfile_tmp_name VARCHAR2(500), /* 첨부파일 임시파일명 */
   atfile_org_name VARCHAR2(500), /* 첨부파일 원본파일명 */
   atfile_regdate DATE, /* 첨부파일 등록일시 */
   board_no INTEGER /* 게시글 번호 */
);

COMMENT ON TABLE attachfile IS '첨부파일';

COMMENT ON COLUMN attachfile.atfile_no IS '첨부파일 번호';

COMMENT ON COLUMN attachfile.atfile_path IS '첨부파일 경로';

COMMENT ON COLUMN attachfile.atfile_tmp_name IS '첨부파일 임시파일명';

COMMENT ON COLUMN attachfile.atfile_org_name IS '첨부파일 원본파일명';

COMMENT ON COLUMN attachfile.atfile_regdate IS '첨부파일 등록일시';

COMMENT ON COLUMN attachfile.board_no IS '게시글 번호';

CREATE UNIQUE INDEX PK_attachfile
   ON attachfile (
      atfile_no ASC
   );

ALTER TABLE attachfile
   ADD
      CONSTRAINT PK_attachfile
      PRIMARY KEY (
         atfile_no
      );

/* 댓글 */
CREATE TABLE Cmts (
   cmts_no INTEGER NOT NULL, /* 댓글 번호 */
   cmts_contents VARCHAR2(1500), /* 댓글 내용 */
   cmts_rgst_date DATE, /* 댓글 작성 일시 */
   cmts_modi_date DATE, /* 댓글 수정 일시 */
   cmts_del_date DATE, /* 댓글 삭제 일시 */
   cmts_par_no INTEGER, /* 댓글 부모 번호 */
   mem_no INTEGER, /* 댓글 작성자 */
   board_no INTEGER, /* 게시글 번호 */
   cmts_reply INTEGER /* 답글 활성화 여부 */
);

COMMENT ON TABLE Cmts IS '댓글';

COMMENT ON COLUMN Cmts.cmts_no IS '댓글 번호';

COMMENT ON COLUMN Cmts.cmts_contents IS '댓글 내용';

COMMENT ON COLUMN Cmts.cmts_rgst_date IS '댓글 작성 일시';

COMMENT ON COLUMN Cmts.cmts_modi_date IS '댓글 수정 일시';

COMMENT ON COLUMN Cmts.cmts_del_date IS '댓글 삭제 일시';

COMMENT ON COLUMN Cmts.cmts_par_no IS '댓글 부모 번호';

COMMENT ON COLUMN Cmts.mem_no IS '댓글 작성자';

COMMENT ON COLUMN Cmts.board_no IS '게시글 번호';

COMMENT ON COLUMN Cmts.cmts_reply IS '답글 활성화 여부';

CREATE UNIQUE INDEX PK_Cmts
   ON Cmts (
      cmts_no ASC
   );

ALTER TABLE Cmts
   ADD
      CONSTRAINT PK_Cmts
      PRIMARY KEY (
         cmts_no
      );

/* 일반 회원 */
CREATE TABLE Member (
   mem_no INTEGER NOT NULL, /* 회원 번호 */
   mem_id VARCHAR2(50), /* 회원 아이디 */
   mem_pw VARCHAR2(50), /* 회원 비밀번호 */
   mem_nickname VARCHAR2(50), /* 회원 닉네임 */
   mem_name VARCHAR2(50), /* 회원 이름 */
   mem_age INTEGER, /* 회원 나이 */
   mem_email VARCHAR2(100), /* 회원 이메일 */
   mem_tel VARCHAR2(30), /* 회원 전화번호 */
   mem_addr VARCHAR2(255), /* 회원 주소 */
   mem_profile_image VARCHAR2(255), /* 회원 프로필사진 경로 */
   mem_rgst_date DATE, /* 회원 가입일시 */
   mem_last_date DATE, /* 회원 마지막접속일시 */
   cg_id INTEGER /* 회원 권한 및 상태 */
);

COMMENT ON TABLE Member IS '일반 회원';

COMMENT ON COLUMN Member.mem_no IS '회원 번호';

COMMENT ON COLUMN Member.mem_id IS '회원 아이디';

COMMENT ON COLUMN Member.mem_pw IS '회원 비밀번호';

COMMENT ON COLUMN Member.mem_nickname IS '회원 닉네임';

COMMENT ON COLUMN Member.mem_name IS '회원 이름';

COMMENT ON COLUMN Member.mem_age IS '회원 나이';

COMMENT ON COLUMN Member.mem_email IS '회원 이메일';

COMMENT ON COLUMN Member.mem_tel IS '회원 전화번호';

COMMENT ON COLUMN Member.mem_addr IS '회원 주소';

COMMENT ON COLUMN Member.mem_profile_image IS '회원 프로필사진 경로';

COMMENT ON COLUMN Member.mem_rgst_date IS '회원 가입일시';

COMMENT ON COLUMN Member.mem_last_date IS '회원 마지막접속일시';

COMMENT ON COLUMN Member.cg_id IS '회원 권한 및 상태';

CREATE UNIQUE INDEX PK_Member
   ON Member (
      mem_no ASC
   );

ALTER TABLE Member
   ADD
      CONSTRAINT PK_Member
      PRIMARY KEY (
         mem_no
      );

/* 업체 회원 */
CREATE TABLE ComMember (
   com_no INTEGER NOT NULL, /* 업체 번호 */
   com_num VARCHAR2(100), /* 업체 사업자등록번호 */
   com_name VARCHAR2(500), /* 업체명 */
   com_addr VARCHAR2(500), /* 업체 주소 */
   com_tel VARCHAR2(50), /* 업체 전화번호 */
   mem_no INTEGER, /* 회원 번호 */
   rsy_no INTEGER /* 예약  번호 */
);

COMMENT ON TABLE ComMember IS '업체 회원';

COMMENT ON COLUMN ComMember.com_no IS '업체 번호';

COMMENT ON COLUMN ComMember.com_num IS '업체 사업자등록번호';

COMMENT ON COLUMN ComMember.com_name IS '업체명';

COMMENT ON COLUMN ComMember.com_addr IS '업체 주소';

COMMENT ON COLUMN ComMember.com_tel IS '업체 전화번호';

COMMENT ON COLUMN ComMember.mem_no IS '회원 번호';

COMMENT ON COLUMN ComMember.rsy_no IS '예약  번호';

CREATE UNIQUE INDEX PK_ComMember
   ON ComMember (
      com_no ASC
   );

ALTER TABLE ComMember
   ADD
      CONSTRAINT PK_ComMember
      PRIMARY KEY (
         com_no
      );

/* 블랙리스트 */
CREATE TABLE BlackList (
   mem_no INTEGER NOT NULL, /* 회원 번호 */
   bl_reason VARCHAR2(500), /* 블랙리스트 사유 */
   bl_regdate DATE, /* 블랙리스트 등록일시 */
   bl_del_date DATE, /* 블랙리스트 종료일시 */
   bl_count INTEGER /* 블랙리스트 횟수 */
);

COMMENT ON TABLE BlackList IS '블랙리스트';

COMMENT ON COLUMN BlackList.mem_no IS '회원 번호';

COMMENT ON COLUMN BlackList.bl_reason IS '블랙리스트 사유';

COMMENT ON COLUMN BlackList.bl_regdate IS '블랙리스트 등록일시';

COMMENT ON COLUMN BlackList.bl_del_date IS '블랙리스트 종료일시';

COMMENT ON COLUMN BlackList.bl_count IS '블랙리스트 횟수';

CREATE UNIQUE INDEX PK_BlackList
   ON BlackList (
      mem_no ASC
   );

ALTER TABLE BlackList
   ADD
      CONSTRAINT PK_BlackList
      PRIMARY KEY (
         mem_no
      );

/* 예약 */
CREATE TABLE Rsy (
   rsy_no INTEGER NOT NULL, /* 예약  번호 */
   rsy_personnel INTEGER, /* 예약 인원 */
   rsy_date DATE, /* 예약 방문일시 */
   rsy_regDate DATE, /* 예약 등록일시 */
   rsy_modi_date DATE, /* 예약 수정일시 */
   rsy_del_date DATE, /* 예약 취소일시 */
   mem_no INTEGER, /* 예약자명 */
   rsy_board_no INTEGER, /* 예약게시글 번호 */
   cg_id INTEGER /* 예약 상태 */
);

COMMENT ON TABLE Rsy IS '예약';

COMMENT ON COLUMN Rsy.rsy_no IS '예약  번호';

COMMENT ON COLUMN Rsy.rsy_personnel IS '예약 인원';

COMMENT ON COLUMN Rsy.rsy_date IS '예약 방문일시';

COMMENT ON COLUMN Rsy.rsy_regDate IS '예약 등록일시';

COMMENT ON COLUMN Rsy.rsy_modi_date IS '예약 수정일시';

COMMENT ON COLUMN Rsy.rsy_del_date IS '예약 취소일시';

COMMENT ON COLUMN Rsy.mem_no IS '예약자명';

COMMENT ON COLUMN Rsy.rsy_board_no IS '예약게시글 번호';

COMMENT ON COLUMN Rsy.cg_id IS '예약 상태';

CREATE UNIQUE INDEX PK_Rsy
   ON Rsy (
      rsy_no ASC
   );

ALTER TABLE Rsy
   ADD
      CONSTRAINT PK_Rsy
      PRIMARY KEY (
         rsy_no
      );

/* 결제 */
CREATE TABLE Pay (
   rsy_no INTEGER NOT NULL, /* 예약  번호 */
   pay_no INTEGER NOT NULL, /* 결제 번호 */
   pay_method VARCHAR2(20), /* 결제 방식 */
   pay_price INTEGER, /* 결제 금액 */
   pay_info VARCHAR2(1500), /* 결제 내용 */
   pay_regdate DATE, /* 결제 등록일시 */
   pay_modi_date DATE, /* 결제 수정일시 */
   pay_del_date DATE /* 결제 취소일시 */
);

COMMENT ON TABLE Pay IS '결제';

COMMENT ON COLUMN Pay.rsy_no IS '예약  번호';

COMMENT ON COLUMN Pay.pay_no IS '결제 번호';

COMMENT ON COLUMN Pay.pay_method IS '결제 방식';

COMMENT ON COLUMN Pay.pay_price IS '결제 금액';

COMMENT ON COLUMN Pay.pay_info IS '결제 내용';

COMMENT ON COLUMN Pay.pay_regdate IS '결제 등록일시';

COMMENT ON COLUMN Pay.pay_modi_date IS '결제 수정일시';

COMMENT ON COLUMN Pay.pay_del_date IS '결제 취소일시';

CREATE UNIQUE INDEX PK_Pay
   ON Pay (
      rsy_no ASC,
      pay_no ASC
   );

ALTER TABLE Pay
   ADD
      CONSTRAINT PK_Pay
      PRIMARY KEY (
         rsy_no,
         pay_no
      );

/* 업체 서비스 */
CREATE TABLE ComService (
   com_service VARCHAR2(50) NOT NULL, /* 업체 사업서비스 종류 */
   com_service_info VARCHAR2(1500), /* 업체 사업서비스 종류 정보 */
   com_no INTEGER /* 업체 번호 */
);

COMMENT ON TABLE ComService IS '업체 서비스';

COMMENT ON COLUMN ComService.com_service IS '업체 사업서비스 종류';

COMMENT ON COLUMN ComService.com_service_info IS '업체 사업서비스 종류 정보';

COMMENT ON COLUMN ComService.com_no IS '업체 번호';

CREATE UNIQUE INDEX PK_ComService
   ON ComService (
      com_service ASC
   );

ALTER TABLE ComService
   ADD
      CONSTRAINT PK_ComService
      PRIMARY KEY (
         com_service
      );

/* 코드그룹 */
CREATE TABLE CodeGroup (
   cg_id INTEGER NOT NULL, /* 코드그룹 아이디 */
   cg_no VARCHAR2(10), /* 코드 그룹 번호 */
   cg_info VARCHAR2(1500) /* 코드그룹 정보 */
);

COMMENT ON TABLE CodeGroup IS '코드그룹';

COMMENT ON COLUMN CodeGroup.cg_id IS '코드그룹 아이디';

COMMENT ON COLUMN CodeGroup.cg_no IS '회원권한, 회원상태, 예약상태';

COMMENT ON COLUMN CodeGroup.cg_info IS '상태및 권한에 대한 정보';

CREATE UNIQUE INDEX PK_CodeGroup
   ON CodeGroup (
      cg_id ASC
   );

ALTER TABLE CodeGroup
   ADD
      CONSTRAINT PK_CodeGroup
      PRIMARY KEY (
         cg_id
      );

/* 예약게시판 */
CREATE TABLE RsyBoard (
   rsy_board_no INTEGER NOT NULL, /* 예약게시글 번호 */
   rsy_board_type VARCHAR2(50), /* 예약게시글 타입 */
   rsy_board_title VARCHAR2(300), /* 예약게시글 제목 */
   rsy_board_content CLOB, /* 예약게시글 내용 */
   rsy_board_regdate DATE, /* 예약게시글 작성일시 */
   rsy_board_modi_date DATE, /* 예약게시글 수정일시 */
   rsy_board_del_date DATE, /* 예약게시글 삭제일시 */
   rsy_board_act INTEGER, /* 예약게시글 활성화여부 */
   rsy_board_view_count INTEGER, /* 예약게시글 조회수 */
   rsy_board_rec_count INTEGER, /* 예약게시글 추천수 */
   rsy_board_cmts_act INTEGER, /* 예약댓글 작성 여부 */
   rsy_board_auth_level INTEGER, /* 예약게시글 우선순위 레벨 */
   com_no INTEGER, /* 예약게시글 작성자 */
   board_no INTEGER /* 게시글 번호 */
);

COMMENT ON TABLE RsyBoard IS '예약게시판';

COMMENT ON COLUMN RsyBoard.rsy_board_no IS '예약게시글 번호';

COMMENT ON COLUMN RsyBoard.rsy_board_type IS '예약게시글 타입';

COMMENT ON COLUMN RsyBoard.rsy_board_title IS '예약게시글 제목';

COMMENT ON COLUMN RsyBoard.rsy_board_content IS '예약게시글 내용';

COMMENT ON COLUMN RsyBoard.rsy_board_regdate IS '예약게시글 작성일시';

COMMENT ON COLUMN RsyBoard.rsy_board_modi_date IS '예약게시글 수정일시';

COMMENT ON COLUMN RsyBoard.rsy_board_del_date IS '예약게시글 삭제일시';

COMMENT ON COLUMN RsyBoard.rsy_board_act IS '예약게시글 활성화여부';

COMMENT ON COLUMN RsyBoard.rsy_board_view_count IS '예약게시글 조회수';

COMMENT ON COLUMN RsyBoard.rsy_board_rec_count IS '예약게시글 추천수';

COMMENT ON COLUMN RsyBoard.rsy_board_cmts_act IS '예약댓글 작성 여부';

COMMENT ON COLUMN RsyBoard.rsy_board_auth_level IS '예약게시글 우선순위 레벨';

COMMENT ON COLUMN RsyBoard.com_no IS '예약게시글 작성자';

COMMENT ON COLUMN RsyBoard.board_no IS '게시글 번호';

CREATE UNIQUE INDEX PK_RsyBoard
   ON RsyBoard (
      rsy_board_no ASC
   );

ALTER TABLE RsyBoard
   ADD
      CONSTRAINT PK_RsyBoard
      PRIMARY KEY (
         rsy_board_no
      );

/* 신고 게시판 */
CREATE TABLE Report (
   rep_no INTEGER NOT NULL, /* 신고 게시판 번호 */
   rep_reason VARCHAR2(255), /* 신고사유 */
   rep_contents VARCHAR2(1500), /* 신고 내용 */
   mem_no INTEGER, /* 신고자 */
   board_no INTEGER /* 게시글 번호 */
);

COMMENT ON TABLE Report IS '신고 게시판';

COMMENT ON COLUMN Report.rep_no IS '신고 게시판 번호';

COMMENT ON COLUMN Report.rep_reason IS '신고사유';

COMMENT ON COLUMN Report.rep_contents IS '신고 내용';

COMMENT ON COLUMN Report.mem_no IS '신고자';

COMMENT ON COLUMN Report.board_no IS '게시글 번호';

CREATE UNIQUE INDEX PK_Report
   ON Report (
      rep_no ASC
   );

ALTER TABLE Report
   ADD
      CONSTRAINT PK_Report
      PRIMARY KEY (
         rep_no
      );

/* 리뷰 게시판 */
CREATE TABLE Review (
   review_board_no INTEGER NOT NULL, /* 리뷰 게시글 번호 */
   review_board_title VARCHAR2(300), /* 리뷰 제목 */
   review_board_content CLOB, /* 리뷰 내용 */
   review_board_regdate DATE, /* 리뷰 작성일시 */
   review_board_modi_date DATE, /* 리뷰 수정일시 */
   review_board_del_date DATE, /* 리뷰 삭제일시 */
   review_board_act INTEGER, /* 리뷰 활성화여부 */
   review_board_rec_count INTEGER, /* 리뷰 평점 */
   review_board_image VARCHAR2(500), /* 리뷰 이미지 경로 */
   rsy_board_no INTEGER, /* 예약게시글 번호 */
   mem_no INTEGER /* 리뷰 작성자 */
);

COMMENT ON TABLE Review IS '리뷰 게시판';

COMMENT ON COLUMN Review.review_board_no IS '리뷰 게시글 번호';

COMMENT ON COLUMN Review.review_board_title IS '리뷰 제목';

COMMENT ON COLUMN Review.review_board_content IS '리뷰 내용';

COMMENT ON COLUMN Review.review_board_regdate IS '리뷰 작성일시';

COMMENT ON COLUMN Review.review_board_modi_date IS '리뷰 수정일시';

COMMENT ON COLUMN Review.review_board_del_date IS '리뷰 삭제일시';

COMMENT ON COLUMN Review.review_board_act IS '리뷰 활성화여부';

COMMENT ON COLUMN Review.review_board_rec_count IS '리뷰 평점';

COMMENT ON COLUMN Review.review_board_image IS '리뷰 이미지 경로';

COMMENT ON COLUMN Review.rsy_board_no IS '예약게시글 번호';

COMMENT ON COLUMN Review.mem_no IS '리뷰 작성자';

CREATE UNIQUE INDEX PK_Review
   ON Review (
      review_board_no ASC
   );

ALTER TABLE Review
   ADD
      CONSTRAINT PK_Review
      PRIMARY KEY (
         review_board_no
      );

/* 리뷰댓글 */
CREATE TABLE ReviewCmts (
   rv_cmts_no INTEGER NOT NULL, /* 리뷰 댓글 번호 */
   rv_cmts_contents VARCHAR2(1500), /* 리뷰 댓글 내용 */
   rv_cmts_rgst_date DATE, /* 리뷰 댓글 작성 일시 */
   rv_cmts_modi_date DATE, /* 리뷰 댓글 수정 일시 */
   rv_cmts_del_date DATE, /* 리뷰 댓글 삭제 일시 */
   rv_cmts_par_no INTEGER, /* 리뷰 댓글 부모 번호 */
   review_board_no INTEGER, /* 리뷰 게시글 번호 */
   mem_no INTEGER, /* 댓글 작성자 */
   rv_cmts_reply INTEGER /* 답글 활성화 여부 */
);

COMMENT ON TABLE ReviewCmts IS '리뷰댓글';

COMMENT ON COLUMN ReviewCmts.rv_cmts_no IS '리뷰 댓글 번호';

COMMENT ON COLUMN ReviewCmts.rv_cmts_contents IS '리뷰 댓글 내용';

COMMENT ON COLUMN ReviewCmts.rv_cmts_rgst_date IS '리뷰 댓글 작성 일시';

COMMENT ON COLUMN ReviewCmts.rv_cmts_modi_date IS '리뷰 댓글 수정 일시';

COMMENT ON COLUMN ReviewCmts.rv_cmts_del_date IS '리뷰 댓글 삭제 일시';

COMMENT ON COLUMN ReviewCmts.rv_cmts_par_no IS '리뷰 댓글 부모 번호';

COMMENT ON COLUMN ReviewCmts.review_board_no IS '리뷰 게시글 번호';

COMMENT ON COLUMN ReviewCmts.mem_no IS '댓글 작성자';

COMMENT ON COLUMN ReviewCmts.rv_cmts_reply IS '답글 활성화 여부';

CREATE UNIQUE INDEX PK_ReviewCmts
   ON ReviewCmts (
      rv_cmts_no ASC
   );

ALTER TABLE ReviewCmts
   ADD
      CONSTRAINT PK_ReviewCmts
      PRIMARY KEY (
         rv_cmts_no
      );

/* 예약리뷰첨부파일 */
CREATE TABLE RRFile (
   rr_file_no NUMBER NOT NULL, /* 예약리뷰첨부파일 번호 */
   rr_file_path VARCHAR2(500), /* 예약리뷰첨부파일 경로 */
   rr_file_tmp_name VARCHAR2(500), /* 예약리뷰첨부파일 임시파일명 */
   rr_file_org_name VARCHAR2(500), /* 예약리뷰첨부파일 원본파일명 */
   rr_file_regdate DATE, /* 예약리뷰첨부파일 등록일시 */
   rsy_board_no INTEGER, /* 예약게시글 번호 */
   review_board_no INTEGER /* 리뷰 게시글 번호 */
);

COMMENT ON TABLE RRFile IS '예약리뷰첨부파일';

COMMENT ON COLUMN RRFile.rr_file_no IS '예약리뷰첨부파일 번호';

COMMENT ON COLUMN RRFile.rr_file_path IS '예약리뷰첨부파일 경로';

COMMENT ON COLUMN RRFile.rr_file_tmp_name IS '예약리뷰첨부파일 임시파일명';

COMMENT ON COLUMN RRFile.rr_file_org_name IS '예약리뷰첨부파일 원본파일명';

COMMENT ON COLUMN RRFile.rr_file_regdate IS '예약리뷰첨부파일 등록일시';

COMMENT ON COLUMN RRFile.rsy_board_no IS '예약게시글 번호';

COMMENT ON COLUMN RRFile.review_board_no IS '리뷰 게시글 번호';

CREATE UNIQUE INDEX PK_RRFile
   ON RRFile (
      rr_file_no ASC
   );

ALTER TABLE RRFile
   ADD
      CONSTRAINT PK_RRFile
      PRIMARY KEY (
         rr_file_no
      );

ALTER TABLE Board
   ADD
      CONSTRAINT FK_BoardAttr_TO_Board
      FOREIGN KEY (
         board_id
      )
      REFERENCES BoardAttr (
         board_id
      );

ALTER TABLE Board
   ADD
      CONSTRAINT FK_Member_TO_Board
      FOREIGN KEY (
         mem_no
      )
      REFERENCES Member (
         mem_no
      );

ALTER TABLE attachfile
   ADD
      CONSTRAINT FK_Board_TO_attachfile
      FOREIGN KEY (
         board_no
      )
      REFERENCES Board (
         board_no
      );

ALTER TABLE Cmts
   ADD
      CONSTRAINT FK_Board_TO_Cmts
      FOREIGN KEY (
         board_no
      )
      REFERENCES Board (
         board_no
      );

ALTER TABLE Cmts
   ADD
      CONSTRAINT FK_Cmts_TO_Cmts
      FOREIGN KEY (
         cmts_reply
      )
      REFERENCES Cmts (
         cmts_no
      );

ALTER TABLE Cmts
   ADD
      CONSTRAINT FK_Member_TO_Cmts
      FOREIGN KEY (
         mem_no
      )
      REFERENCES Member (
         mem_no
      );

ALTER TABLE Member
   ADD
      CONSTRAINT FK_CodeGroup_TO_Member
      FOREIGN KEY (
         cg_id
      )
      REFERENCES CodeGroup (
         cg_id
      );

ALTER TABLE ComMember
   ADD
      CONSTRAINT FK_Member_TO_ComMember
      FOREIGN KEY (
         mem_no
      )
      REFERENCES Member (
         mem_no
      );

ALTER TABLE ComMember
   ADD
      CONSTRAINT FK_Rsy_TO_ComMember
      FOREIGN KEY (
         rsy_no
      )
      REFERENCES Rsy (
         rsy_no
      );

ALTER TABLE BlackList
   ADD
      CONSTRAINT FK_Member_TO_BlackList
      FOREIGN KEY (
         mem_no
      )
      REFERENCES Member (
         mem_no
      );

ALTER TABLE Rsy
   ADD
      CONSTRAINT FK_Member_TO_Rsy
      FOREIGN KEY (
         mem_no
      )
      REFERENCES Member (
         mem_no
      );

ALTER TABLE Rsy
   ADD
      CONSTRAINT FK_CodeGroup_TO_Rsy
      FOREIGN KEY (
         cg_id
      )
      REFERENCES CodeGroup (
         cg_id
      );

ALTER TABLE Rsy
   ADD
      CONSTRAINT FK_RsyBoard_TO_Rsy
      FOREIGN KEY (
         rsy_board_no
      )
      REFERENCES RsyBoard (
         rsy_board_no
      );

ALTER TABLE Pay
   ADD
      CONSTRAINT FK_Rsy_TO_Pay
      FOREIGN KEY (
         rsy_no
      )
      REFERENCES Rsy (
         rsy_no
      );

ALTER TABLE ComService
   ADD
      CONSTRAINT FK_ComMember_TO_ComService
      FOREIGN KEY (
         com_no
      )
      REFERENCES ComMember (
         com_no
      );

ALTER TABLE RsyBoard
   ADD
      CONSTRAINT FK_ComMember_TO_RsyBoard
      FOREIGN KEY (
         com_no
      )
      REFERENCES ComMember (
         com_no
      );

ALTER TABLE RsyBoard
   ADD
      CONSTRAINT FK_Board_TO_RsyBoard
      FOREIGN KEY (
         board_no
      )
      REFERENCES Board (
         board_no
      );

ALTER TABLE Report
   ADD
      CONSTRAINT FK_Board_TO_Report
      FOREIGN KEY (
         board_no
      )
      REFERENCES Board (
         board_no
      );

ALTER TABLE Report
   ADD
      CONSTRAINT FK_Member_TO_Report
      FOREIGN KEY (
         mem_no
      )
      REFERENCES Member (
         mem_no
      );

ALTER TABLE Review
   ADD
      CONSTRAINT FK_RsyBoard_TO_Review
      FOREIGN KEY (
         rsy_board_no
      )
      REFERENCES RsyBoard (
         rsy_board_no
      );

ALTER TABLE Review
   ADD
      CONSTRAINT FK_Member_TO_Review
      FOREIGN KEY (
         mem_no
      )
      REFERENCES Member (
         mem_no
      );

ALTER TABLE ReviewCmts
   ADD
      CONSTRAINT FK_Review_TO_ReviewCmts
      FOREIGN KEY (
         review_board_no
      )
      REFERENCES Review (
         review_board_no
      );

ALTER TABLE ReviewCmts
   ADD
      CONSTRAINT FK_Member_TO_ReviewCmts
      FOREIGN KEY (
         mem_no
      )
      REFERENCES Member (
         mem_no
      );

ALTER TABLE ReviewCmts
   ADD
      CONSTRAINT FK_ReviewCmts_TO_ReviewCmts
      FOREIGN KEY (
         rv_cmts_reply
      )
      REFERENCES ReviewCmts (
         rv_cmts_no
      );

ALTER TABLE RRFile
   ADD
      CONSTRAINT FK_RsyBoard_TO_RRFile
      FOREIGN KEY (
         rsy_board_no
      )
      REFERENCES RsyBoard (
         rsy_board_no
      );

ALTER TABLE RRFile
   ADD
      CONSTRAINT FK_Review_TO_RRFile
      FOREIGN KEY (
         review_board_no
      )
      REFERENCES Review (
         review_board_no
      );