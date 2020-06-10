
--다음 시퀀스 가져와
SELECT PRO_BOARD_SEQ.nextval
FROM dual;

-- 자료실 글 등록
INSERT INTO pro_board
(BOARDNAME, NO, TITLE, CONTENT, WRITER, VIEWCNT, REGDATE, UPDATEDATE, DELETEYN, FILEOPENYN)
VALUES ('자료실', 2, '제목', '내용', 'test', 0, SYSDATE, SYSDATE, 'n', 'y');

-- 자료실 글 조회
SELECT *
FROM pro_board
WHERE boardname = '자료실'
AND deleteyn = 'n'
AND no = 3
ORDER BY regdate;

--자료실 글 수정
UPDATE pro_board SET
title = '제목2',
content = '내용2',
updatedate = SYSDATE
WHERE no = 2;

--자료실 글 삭제
UPDATE pro_board SET
deleteyn = 'y'
WHERE no = 2;

INSERT INTO pro_board
SELECT *
FROM pro_board;

ROLLBACK;

COMMIT;

-- 주소마스터
CREATE TABLE jusomaster (
		no NUMERIC NOT NULL,
		city VARCHAR(20) NULL,
		area VARCHAR(30) NULL,
		detail VARCHAR(40) NULL
);

-- 주소마스터
ALTER TABLE jusomaster
	ADD CONSTRAINT PK_jusomaster -- 주소마스터 기본키
	PRIMARY KEY (
		no -- 관리번호
	);
    
INSERT INTO MEMBER (EMAIL, PASSWORD, PHONENUMBER, NAME, NICKNAME, POSTCODE, ADDRESS, DETAILADDRESS, ROLE, DELETEYN, REGDATE)
VALUES ('DolphinShark@naver.com', '1234', '01012345678', '상어가된돌고래', '돌고래상어', '548754', '내고향바다', '돌고래도좋고 상어도 좋아', 'ROLE_ADMIN', 'N', SYSDATE);