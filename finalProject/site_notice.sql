-- 사이트 공지 등록
-- 파일 다운로드 가능
INSERT INTO site_board (boardname, sno, title, content, writer, viewcnt, regdate, updatedate, deleteyn, fileopenyn )
VALUES ('공지', SITE_BOARD_SEQ.nextval, '제목', '내용', 'test', 0, sysdate, sysdate, 'n', 'y');

-- 시퀀스 가져와
SELECT SITE_BOARD_SEQ.nextval
FROM dual;

-- 사이트 공지 수정
UPDATE site_board
SET content = '내용',
title = '제목5',
updatedate = sysdate
WHERE sno = 1;

-- 사이트 공지 삭제
UPDATE site_board
SET deleteyn = 'y'
WHERE sno = 5;

-- 공지 리스트 조회
SELECT *
FROM site_board
WHERE deleteyn = 'n'
ORDER BY regdate;

-- 사이트 공지 조회수 올리기
UPDATE site_board
SET viewcnt = viewcnt + 1
WHERE sno = 5;

SELECT *
FROM site_board
WHERE sno = 1;

SELECT COUNT(*)
FROM attachfile
WHERE sno=27;