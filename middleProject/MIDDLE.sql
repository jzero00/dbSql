/* �Խ��� �Ӽ� */
DROP TABLE BoardAttr 
   CASCADE CONSTRAINTS;

/* �Խñ� */
DROP TABLE Board 
   CASCADE CONSTRAINTS;

/* ÷������ */
DROP TABLE attachfile 
   CASCADE CONSTRAINTS;

/* ��� */
DROP TABLE Cmts 
   CASCADE CONSTRAINTS;

/* �Ϲ� ȸ�� */
DROP TABLE Member 
   CASCADE CONSTRAINTS;

/* ��ü ȸ�� */
DROP TABLE ComMember 
   CASCADE CONSTRAINTS;

/* ������Ʈ */
DROP TABLE BlackList 
   CASCADE CONSTRAINTS;

/* ���� */
DROP TABLE Rsy 
   CASCADE CONSTRAINTS;

/* ���� */
DROP TABLE Pay 
   CASCADE CONSTRAINTS;

/* ��ü ���� */
DROP TABLE ComService 
   CASCADE CONSTRAINTS;

/* �ڵ�׷� */
DROP TABLE CodeGroup 
   CASCADE CONSTRAINTS;

/* ����Խ��� */
DROP TABLE RsyBoard 
   CASCADE CONSTRAINTS;

/* �Ű� �Խ��� */
DROP TABLE Report 
   CASCADE CONSTRAINTS;

/* ���� �Խ��� */
DROP TABLE Review 
   CASCADE CONSTRAINTS;

/* ������ */
DROP TABLE ReviewCmts 
   CASCADE CONSTRAINTS;

/* ���ฮ��÷������ */
DROP TABLE RRFile 
   CASCADE CONSTRAINTS;

/* �Խ��� �Ӽ� */
CREATE TABLE BoardAttr (
   board_id INTEGER NOT NULL, /* �Խ��� id */
   board_name VARCHAR2(50), /* �Խ��� �̸� */
   board_writable INTEGER /* �Խ��� Ȱ��ȭ ���� */
);

COMMENT ON TABLE BoardAttr IS '�Խ��� �Ӽ�';

COMMENT ON COLUMN BoardAttr.board_id IS '�Խ��� id';

COMMENT ON COLUMN BoardAttr.board_name IS '�Խ��� �̸�';

COMMENT ON COLUMN BoardAttr.board_writable IS '�Խ��� Ȱ��ȭ ����';

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

/* �Խñ� */
CREATE TABLE Board (
   board_no INTEGER NOT NULL, /* �Խñ� ��ȣ */
   board_type VARCHAR2(50), /* �Խñ� Ÿ�� */
   board_title VARCHAR2(300), /* �Խñ� ���� */
   board_contents CLOB, /* �Խñ� ���� */
   board_regdate DATE, /* �Խñ� �ۼ��Ͻ� */
   board_modi_date DATE, /* �Խñ� �����Ͻ� */
   board_del_date DATE, /* �Խñ� �����Ͻ� */
   board_act INTEGER, /* �Խñ� Ȱ��ȭ���� */
   board_view_count INTEGER, /* �Խñ� ��ȸ�� */
   board_rec_count INTEGER, /* �Խñ� ��õ�� */
   board_auth_level INTEGER, /* �Խñ� �켱���� ���� */
   board_cmts_act INTEGER, /* �Խñ� ��� Ȱ��ȭ ���� */
   board_id INTEGER, /* �Խ��� id */
   mem_no INTEGER /* �Խñ� �ۼ��� */
);

COMMENT ON TABLE Board IS '�Խñ�';

COMMENT ON COLUMN Board.board_no IS '�Խñ� ��ȣ';

COMMENT ON COLUMN Board.board_type IS '�Խñ� Ÿ��';

COMMENT ON COLUMN Board.board_title IS '�Խñ� ����';

COMMENT ON COLUMN Board.board_contents IS '�Խñ� ����';

COMMENT ON COLUMN Board.board_regdate IS '�Խñ� �ۼ��Ͻ�';

COMMENT ON COLUMN Board.board_modi_date IS '�Խñ� �����Ͻ�';

COMMENT ON COLUMN Board.board_del_date IS '�Խñ� �����Ͻ�';

COMMENT ON COLUMN Board.board_act IS '�Խñ� Ȱ��ȭ����';

COMMENT ON COLUMN Board.board_view_count IS '�Խñ� ��ȸ��';

COMMENT ON COLUMN Board.board_rec_count IS '�Խñ� ��õ��';

COMMENT ON COLUMN Board.board_auth_level IS '�Խñ� �켱���� ����';

COMMENT ON COLUMN Board.board_cmts_act IS '�Խñ� ��� Ȱ��ȭ ����';

COMMENT ON COLUMN Board.board_id IS '�Խ��� id';

COMMENT ON COLUMN Board.mem_no IS '�Խñ� �ۼ���';

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

/* ÷������ */
CREATE TABLE attachfile (
   atfile_no NUMBER NOT NULL, /* ÷������ ��ȣ */
   atfile_path VARCHAR2(500), /* ÷������ ��� */
   atfile_tmp_name VARCHAR2(500), /* ÷������ �ӽ����ϸ� */
   atfile_org_name VARCHAR2(500), /* ÷������ �������ϸ� */
   atfile_regdate DATE, /* ÷������ ����Ͻ� */
   board_no INTEGER /* �Խñ� ��ȣ */
);

COMMENT ON TABLE attachfile IS '÷������';

COMMENT ON COLUMN attachfile.atfile_no IS '÷������ ��ȣ';

COMMENT ON COLUMN attachfile.atfile_path IS '÷������ ���';

COMMENT ON COLUMN attachfile.atfile_tmp_name IS '÷������ �ӽ����ϸ�';

COMMENT ON COLUMN attachfile.atfile_org_name IS '÷������ �������ϸ�';

COMMENT ON COLUMN attachfile.atfile_regdate IS '÷������ ����Ͻ�';

COMMENT ON COLUMN attachfile.board_no IS '�Խñ� ��ȣ';

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

/* ��� */
CREATE TABLE Cmts (
   cmts_no INTEGER NOT NULL, /* ��� ��ȣ */
   cmts_contents VARCHAR2(1500), /* ��� ���� */
   cmts_rgst_date DATE, /* ��� �ۼ� �Ͻ� */
   cmts_modi_date DATE, /* ��� ���� �Ͻ� */
   cmts_del_date DATE, /* ��� ���� �Ͻ� */
   cmts_par_no INTEGER, /* ��� �θ� ��ȣ */
   mem_no INTEGER, /* ��� �ۼ��� */
   board_no INTEGER, /* �Խñ� ��ȣ */
   cmts_reply INTEGER /* ��� Ȱ��ȭ ���� */
);

COMMENT ON TABLE Cmts IS '���';

COMMENT ON COLUMN Cmts.cmts_no IS '��� ��ȣ';

COMMENT ON COLUMN Cmts.cmts_contents IS '��� ����';

COMMENT ON COLUMN Cmts.cmts_rgst_date IS '��� �ۼ� �Ͻ�';

COMMENT ON COLUMN Cmts.cmts_modi_date IS '��� ���� �Ͻ�';

COMMENT ON COLUMN Cmts.cmts_del_date IS '��� ���� �Ͻ�';

COMMENT ON COLUMN Cmts.cmts_par_no IS '��� �θ� ��ȣ';

COMMENT ON COLUMN Cmts.mem_no IS '��� �ۼ���';

COMMENT ON COLUMN Cmts.board_no IS '�Խñ� ��ȣ';

COMMENT ON COLUMN Cmts.cmts_reply IS '��� Ȱ��ȭ ����';

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

/* �Ϲ� ȸ�� */
CREATE TABLE Member (
   mem_no INTEGER NOT NULL, /* ȸ�� ��ȣ */
   mem_id VARCHAR2(50), /* ȸ�� ���̵� */
   mem_pw VARCHAR2(50), /* ȸ�� ��й�ȣ */
   mem_nickname VARCHAR2(50), /* ȸ�� �г��� */
   mem_name VARCHAR2(50), /* ȸ�� �̸� */
   mem_age INTEGER, /* ȸ�� ���� */
   mem_email VARCHAR2(100), /* ȸ�� �̸��� */
   mem_tel VARCHAR2(30), /* ȸ�� ��ȭ��ȣ */
   mem_addr VARCHAR2(255), /* ȸ�� �ּ� */
   mem_profile_image VARCHAR2(255), /* ȸ�� �����ʻ��� ��� */
   mem_rgst_date DATE, /* ȸ�� �����Ͻ� */
   mem_last_date DATE, /* ȸ�� �����������Ͻ� */
   cg_id INTEGER /* ȸ�� ���� �� ���� */
);

COMMENT ON TABLE Member IS '�Ϲ� ȸ��';

COMMENT ON COLUMN Member.mem_no IS 'ȸ�� ��ȣ';

COMMENT ON COLUMN Member.mem_id IS 'ȸ�� ���̵�';

COMMENT ON COLUMN Member.mem_pw IS 'ȸ�� ��й�ȣ';

COMMENT ON COLUMN Member.mem_nickname IS 'ȸ�� �г���';

COMMENT ON COLUMN Member.mem_name IS 'ȸ�� �̸�';

COMMENT ON COLUMN Member.mem_age IS 'ȸ�� ����';

COMMENT ON COLUMN Member.mem_email IS 'ȸ�� �̸���';

COMMENT ON COLUMN Member.mem_tel IS 'ȸ�� ��ȭ��ȣ';

COMMENT ON COLUMN Member.mem_addr IS 'ȸ�� �ּ�';

COMMENT ON COLUMN Member.mem_profile_image IS 'ȸ�� �����ʻ��� ���';

COMMENT ON COLUMN Member.mem_rgst_date IS 'ȸ�� �����Ͻ�';

COMMENT ON COLUMN Member.mem_last_date IS 'ȸ�� �����������Ͻ�';

COMMENT ON COLUMN Member.cg_id IS 'ȸ�� ���� �� ����';

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

/* ��ü ȸ�� */
CREATE TABLE ComMember (
   com_no INTEGER NOT NULL, /* ��ü ��ȣ */
   com_num VARCHAR2(100), /* ��ü ����ڵ�Ϲ�ȣ */
   com_name VARCHAR2(500), /* ��ü�� */
   com_addr VARCHAR2(500), /* ��ü �ּ� */
   com_tel VARCHAR2(50), /* ��ü ��ȭ��ȣ */
   mem_no INTEGER, /* ȸ�� ��ȣ */
   rsy_no INTEGER /* ����  ��ȣ */
);

COMMENT ON TABLE ComMember IS '��ü ȸ��';

COMMENT ON COLUMN ComMember.com_no IS '��ü ��ȣ';

COMMENT ON COLUMN ComMember.com_num IS '��ü ����ڵ�Ϲ�ȣ';

COMMENT ON COLUMN ComMember.com_name IS '��ü��';

COMMENT ON COLUMN ComMember.com_addr IS '��ü �ּ�';

COMMENT ON COLUMN ComMember.com_tel IS '��ü ��ȭ��ȣ';

COMMENT ON COLUMN ComMember.mem_no IS 'ȸ�� ��ȣ';

COMMENT ON COLUMN ComMember.rsy_no IS '����  ��ȣ';

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

/* ������Ʈ */
CREATE TABLE BlackList (
   mem_no INTEGER NOT NULL, /* ȸ�� ��ȣ */
   bl_reason VARCHAR2(500), /* ������Ʈ ���� */
   bl_regdate DATE, /* ������Ʈ ����Ͻ� */
   bl_del_date DATE, /* ������Ʈ �����Ͻ� */
   bl_count INTEGER /* ������Ʈ Ƚ�� */
);

COMMENT ON TABLE BlackList IS '������Ʈ';

COMMENT ON COLUMN BlackList.mem_no IS 'ȸ�� ��ȣ';

COMMENT ON COLUMN BlackList.bl_reason IS '������Ʈ ����';

COMMENT ON COLUMN BlackList.bl_regdate IS '������Ʈ ����Ͻ�';

COMMENT ON COLUMN BlackList.bl_del_date IS '������Ʈ �����Ͻ�';

COMMENT ON COLUMN BlackList.bl_count IS '������Ʈ Ƚ��';

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

/* ���� */
CREATE TABLE Rsy (
   rsy_no INTEGER NOT NULL, /* ����  ��ȣ */
   rsy_personnel INTEGER, /* ���� �ο� */
   rsy_date DATE, /* ���� �湮�Ͻ� */
   rsy_regDate DATE, /* ���� ����Ͻ� */
   rsy_modi_date DATE, /* ���� �����Ͻ� */
   rsy_del_date DATE, /* ���� ����Ͻ� */
   mem_no INTEGER, /* �����ڸ� */
   rsy_board_no INTEGER, /* ����Խñ� ��ȣ */
   cg_id INTEGER /* ���� ���� */
);

COMMENT ON TABLE Rsy IS '����';

COMMENT ON COLUMN Rsy.rsy_no IS '����  ��ȣ';

COMMENT ON COLUMN Rsy.rsy_personnel IS '���� �ο�';

COMMENT ON COLUMN Rsy.rsy_date IS '���� �湮�Ͻ�';

COMMENT ON COLUMN Rsy.rsy_regDate IS '���� ����Ͻ�';

COMMENT ON COLUMN Rsy.rsy_modi_date IS '���� �����Ͻ�';

COMMENT ON COLUMN Rsy.rsy_del_date IS '���� ����Ͻ�';

COMMENT ON COLUMN Rsy.mem_no IS '�����ڸ�';

COMMENT ON COLUMN Rsy.rsy_board_no IS '����Խñ� ��ȣ';

COMMENT ON COLUMN Rsy.cg_id IS '���� ����';

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

/* ���� */
CREATE TABLE Pay (
   rsy_no INTEGER NOT NULL, /* ����  ��ȣ */
   pay_no INTEGER NOT NULL, /* ���� ��ȣ */
   pay_method VARCHAR2(20), /* ���� ��� */
   pay_price INTEGER, /* ���� �ݾ� */
   pay_info VARCHAR2(1500), /* ���� ���� */
   pay_regdate DATE, /* ���� ����Ͻ� */
   pay_modi_date DATE, /* ���� �����Ͻ� */
   pay_del_date DATE /* ���� ����Ͻ� */
);

COMMENT ON TABLE Pay IS '����';

COMMENT ON COLUMN Pay.rsy_no IS '����  ��ȣ';

COMMENT ON COLUMN Pay.pay_no IS '���� ��ȣ';

COMMENT ON COLUMN Pay.pay_method IS '���� ���';

COMMENT ON COLUMN Pay.pay_price IS '���� �ݾ�';

COMMENT ON COLUMN Pay.pay_info IS '���� ����';

COMMENT ON COLUMN Pay.pay_regdate IS '���� ����Ͻ�';

COMMENT ON COLUMN Pay.pay_modi_date IS '���� �����Ͻ�';

COMMENT ON COLUMN Pay.pay_del_date IS '���� ����Ͻ�';

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

/* ��ü ���� */
CREATE TABLE ComService (
   com_service VARCHAR2(50) NOT NULL, /* ��ü ������� ���� */
   com_service_info VARCHAR2(1500), /* ��ü ������� ���� ���� */
   com_no INTEGER /* ��ü ��ȣ */
);

COMMENT ON TABLE ComService IS '��ü ����';

COMMENT ON COLUMN ComService.com_service IS '��ü ������� ����';

COMMENT ON COLUMN ComService.com_service_info IS '��ü ������� ���� ����';

COMMENT ON COLUMN ComService.com_no IS '��ü ��ȣ';

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

/* �ڵ�׷� */
CREATE TABLE CodeGroup (
   cg_id INTEGER NOT NULL, /* �ڵ�׷� ���̵� */
   cg_no VARCHAR2(10), /* �ڵ� �׷� ��ȣ */
   cg_info VARCHAR2(1500) /* �ڵ�׷� ���� */
);

COMMENT ON TABLE CodeGroup IS '�ڵ�׷�';

COMMENT ON COLUMN CodeGroup.cg_id IS '�ڵ�׷� ���̵�';

COMMENT ON COLUMN CodeGroup.cg_no IS 'ȸ������, ȸ������, �������';

COMMENT ON COLUMN CodeGroup.cg_info IS '���¹� ���ѿ� ���� ����';

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

/* ����Խ��� */
CREATE TABLE RsyBoard (
   rsy_board_no INTEGER NOT NULL, /* ����Խñ� ��ȣ */
   rsy_board_type VARCHAR2(50), /* ����Խñ� Ÿ�� */
   rsy_board_title VARCHAR2(300), /* ����Խñ� ���� */
   rsy_board_content CLOB, /* ����Խñ� ���� */
   rsy_board_regdate DATE, /* ����Խñ� �ۼ��Ͻ� */
   rsy_board_modi_date DATE, /* ����Խñ� �����Ͻ� */
   rsy_board_del_date DATE, /* ����Խñ� �����Ͻ� */
   rsy_board_act INTEGER, /* ����Խñ� Ȱ��ȭ���� */
   rsy_board_view_count INTEGER, /* ����Խñ� ��ȸ�� */
   rsy_board_rec_count INTEGER, /* ����Խñ� ��õ�� */
   rsy_board_cmts_act INTEGER, /* ������ �ۼ� ���� */
   rsy_board_auth_level INTEGER, /* ����Խñ� �켱���� ���� */
   com_no INTEGER, /* ����Խñ� �ۼ��� */
   board_no INTEGER /* �Խñ� ��ȣ */
);

COMMENT ON TABLE RsyBoard IS '����Խ���';

COMMENT ON COLUMN RsyBoard.rsy_board_no IS '����Խñ� ��ȣ';

COMMENT ON COLUMN RsyBoard.rsy_board_type IS '����Խñ� Ÿ��';

COMMENT ON COLUMN RsyBoard.rsy_board_title IS '����Խñ� ����';

COMMENT ON COLUMN RsyBoard.rsy_board_content IS '����Խñ� ����';

COMMENT ON COLUMN RsyBoard.rsy_board_regdate IS '����Խñ� �ۼ��Ͻ�';

COMMENT ON COLUMN RsyBoard.rsy_board_modi_date IS '����Խñ� �����Ͻ�';

COMMENT ON COLUMN RsyBoard.rsy_board_del_date IS '����Խñ� �����Ͻ�';

COMMENT ON COLUMN RsyBoard.rsy_board_act IS '����Խñ� Ȱ��ȭ����';

COMMENT ON COLUMN RsyBoard.rsy_board_view_count IS '����Խñ� ��ȸ��';

COMMENT ON COLUMN RsyBoard.rsy_board_rec_count IS '����Խñ� ��õ��';

COMMENT ON COLUMN RsyBoard.rsy_board_cmts_act IS '������ �ۼ� ����';

COMMENT ON COLUMN RsyBoard.rsy_board_auth_level IS '����Խñ� �켱���� ����';

COMMENT ON COLUMN RsyBoard.com_no IS '����Խñ� �ۼ���';

COMMENT ON COLUMN RsyBoard.board_no IS '�Խñ� ��ȣ';

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

/* �Ű� �Խ��� */
CREATE TABLE Report (
   rep_no INTEGER NOT NULL, /* �Ű� �Խ��� ��ȣ */
   rep_reason VARCHAR2(255), /* �Ű���� */
   rep_contents VARCHAR2(1500), /* �Ű� ���� */
   mem_no INTEGER, /* �Ű��� */
   board_no INTEGER /* �Խñ� ��ȣ */
);

COMMENT ON TABLE Report IS '�Ű� �Խ���';

COMMENT ON COLUMN Report.rep_no IS '�Ű� �Խ��� ��ȣ';

COMMENT ON COLUMN Report.rep_reason IS '�Ű����';

COMMENT ON COLUMN Report.rep_contents IS '�Ű� ����';

COMMENT ON COLUMN Report.mem_no IS '�Ű���';

COMMENT ON COLUMN Report.board_no IS '�Խñ� ��ȣ';

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

/* ���� �Խ��� */
CREATE TABLE Review (
   review_board_no INTEGER NOT NULL, /* ���� �Խñ� ��ȣ */
   review_board_title VARCHAR2(300), /* ���� ���� */
   review_board_content CLOB, /* ���� ���� */
   review_board_regdate DATE, /* ���� �ۼ��Ͻ� */
   review_board_modi_date DATE, /* ���� �����Ͻ� */
   review_board_del_date DATE, /* ���� �����Ͻ� */
   review_board_act INTEGER, /* ���� Ȱ��ȭ���� */
   review_board_rec_count INTEGER, /* ���� ���� */
   review_board_image VARCHAR2(500), /* ���� �̹��� ��� */
   rsy_board_no INTEGER, /* ����Խñ� ��ȣ */
   mem_no INTEGER /* ���� �ۼ��� */
);

COMMENT ON TABLE Review IS '���� �Խ���';

COMMENT ON COLUMN Review.review_board_no IS '���� �Խñ� ��ȣ';

COMMENT ON COLUMN Review.review_board_title IS '���� ����';

COMMENT ON COLUMN Review.review_board_content IS '���� ����';

COMMENT ON COLUMN Review.review_board_regdate IS '���� �ۼ��Ͻ�';

COMMENT ON COLUMN Review.review_board_modi_date IS '���� �����Ͻ�';

COMMENT ON COLUMN Review.review_board_del_date IS '���� �����Ͻ�';

COMMENT ON COLUMN Review.review_board_act IS '���� Ȱ��ȭ����';

COMMENT ON COLUMN Review.review_board_rec_count IS '���� ����';

COMMENT ON COLUMN Review.review_board_image IS '���� �̹��� ���';

COMMENT ON COLUMN Review.rsy_board_no IS '����Խñ� ��ȣ';

COMMENT ON COLUMN Review.mem_no IS '���� �ۼ���';

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

/* ������ */
CREATE TABLE ReviewCmts (
   rv_cmts_no INTEGER NOT NULL, /* ���� ��� ��ȣ */
   rv_cmts_contents VARCHAR2(1500), /* ���� ��� ���� */
   rv_cmts_rgst_date DATE, /* ���� ��� �ۼ� �Ͻ� */
   rv_cmts_modi_date DATE, /* ���� ��� ���� �Ͻ� */
   rv_cmts_del_date DATE, /* ���� ��� ���� �Ͻ� */
   rv_cmts_par_no INTEGER, /* ���� ��� �θ� ��ȣ */
   review_board_no INTEGER, /* ���� �Խñ� ��ȣ */
   mem_no INTEGER, /* ��� �ۼ��� */
   rv_cmts_reply INTEGER /* ��� Ȱ��ȭ ���� */
);

COMMENT ON TABLE ReviewCmts IS '������';

COMMENT ON COLUMN ReviewCmts.rv_cmts_no IS '���� ��� ��ȣ';

COMMENT ON COLUMN ReviewCmts.rv_cmts_contents IS '���� ��� ����';

COMMENT ON COLUMN ReviewCmts.rv_cmts_rgst_date IS '���� ��� �ۼ� �Ͻ�';

COMMENT ON COLUMN ReviewCmts.rv_cmts_modi_date IS '���� ��� ���� �Ͻ�';

COMMENT ON COLUMN ReviewCmts.rv_cmts_del_date IS '���� ��� ���� �Ͻ�';

COMMENT ON COLUMN ReviewCmts.rv_cmts_par_no IS '���� ��� �θ� ��ȣ';

COMMENT ON COLUMN ReviewCmts.review_board_no IS '���� �Խñ� ��ȣ';

COMMENT ON COLUMN ReviewCmts.mem_no IS '��� �ۼ���';

COMMENT ON COLUMN ReviewCmts.rv_cmts_reply IS '��� Ȱ��ȭ ����';

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

/* ���ฮ��÷������ */
CREATE TABLE RRFile (
   rr_file_no NUMBER NOT NULL, /* ���ฮ��÷������ ��ȣ */
   rr_file_path VARCHAR2(500), /* ���ฮ��÷������ ��� */
   rr_file_tmp_name VARCHAR2(500), /* ���ฮ��÷������ �ӽ����ϸ� */
   rr_file_org_name VARCHAR2(500), /* ���ฮ��÷������ �������ϸ� */
   rr_file_regdate DATE, /* ���ฮ��÷������ ����Ͻ� */
   rsy_board_no INTEGER, /* ����Խñ� ��ȣ */
   review_board_no INTEGER /* ���� �Խñ� ��ȣ */
);

COMMENT ON TABLE RRFile IS '���ฮ��÷������';

COMMENT ON COLUMN RRFile.rr_file_no IS '���ฮ��÷������ ��ȣ';

COMMENT ON COLUMN RRFile.rr_file_path IS '���ฮ��÷������ ���';

COMMENT ON COLUMN RRFile.rr_file_tmp_name IS '���ฮ��÷������ �ӽ����ϸ�';

COMMENT ON COLUMN RRFile.rr_file_org_name IS '���ฮ��÷������ �������ϸ�';

COMMENT ON COLUMN RRFile.rr_file_regdate IS '���ฮ��÷������ ����Ͻ�';

COMMENT ON COLUMN RRFile.rsy_board_no IS '����Խñ� ��ȣ';

COMMENT ON COLUMN RRFile.review_board_no IS '���� �Խñ� ��ȣ';

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