--신고당한 사람 리스트

SELECT COUNT(*) cnt
FROM member
WHERE mem_no = (SELECT board.mem_no

                                    FROM board, report
                                    WHERE board.board_no = report.BOARD_NO);
                                    
                                    SELECT board.mem_no
                                    FROM board, report
                                    WHERE board.board_no = report.BOARD_NO;

SELECT *
FROM member,
(SELECT member.MEM_ID, COUNT(member.mem_no)
FROM board, member
WHERE board.MEM_NO = member.MEM_NO
GROUP BY member.MEM_ID) a
WHERE member.mem_no = ;

SELECT *;

SELECT *
FROM  member
WHERE mem_no =
(SELECT board.mem_no
FROM report, board
WHERE report.board_no = board.BOARD_NO);


SELECT *
FROM board;

SELECT *
FROM report;

SELECT COUNT(*)
FROM report
WHERE mem_no = 107
AND board_no = 222;

--신고당한 사람 리스트
SELECT *
FROM member
WHERE mem_no =
(SELECT board.mem_no
 FROM board, report
WHERE board.board_no = report.BOARD_NO
GROUP BY board.mem_no);

--test
SELECT report.REP_NO, report.REP_REASON, report.REP_CONTENTS, board.mem_no, report.BOARD_NO, report.REP_DATE
 FROM board, report
WHERE board.board_no = report.BOARD_NO;

SELECT REP_NO, REP_REASON, REP_CONTENTS, MEM_NO, BOARD_NO ,to_char(REP_DATE, 'yyyy-MM-dd')
FROM report;

--신고 당한 사람 전체 리스트 조회
SELECT *
FROM member,
(SELECT board.mem_no, report.REP_REASON, report.REP_CONTENTS, report.BOARD_NO, report.REP_DATE
 FROM board, report
WHERE board.board_no = report.BOARD_NO) a
WHERE member.mem_no (+) = a.mem_no ;

--신고 당한 사람의 신고 당한 횟수 구하기
SELECT COUNT(*) reportcnt
FROM member,
(SELECT board.mem_no
 FROM board, report
WHERE board.board_no = report.BOARD_NO
GROUP BY board.mem_no) a
WHERE member.mem_no (+) = a.mem_no
AND member.mem_id = 'user';

--나이
SELECT MONTHS_BETWEEN(TRUNC(SYSDATE,'YEAR'),TRUNC(TO_DATE('19890326','YYYYMMDD'),'YEAR')) /12 +1
FROM DUAL;

--222번글 쓴 사람의 정보
SELECT  *
FROM board, member
WHERE board.mem_no = member.mem_no
AND board.board_no = 222;

SELECT mem_no
FROM board
WHERE board_no = 222;

SELECT TO_CHAR(SYSDATE, 'YYYYMM')+6
FROM dual

--블랙리스트
INSERT INTO blacklist
VALUES(SELECT mem_no
FROM board
WHERE board_no = 222 , BL_REASON, SYSDATE,TO_CHAR(SYSDATE, 'YYYYMM')+6, 1);


UPDATE member
SET CODE_STATE = 402
WHERE  mem_no = (SELECT mem_no
FROM board
WHERE board_no = 222);

ROLLBACK;