--�Ű���� ��� ����Ʈ

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

--�Ű���� ��� ����Ʈ
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

--�Ű� ���� ��� ��ü ����Ʈ ��ȸ
SELECT *
FROM member,
(SELECT board.mem_no, report.REP_REASON, report.REP_CONTENTS, report.BOARD_NO, report.REP_DATE
 FROM board, report
WHERE board.board_no = report.BOARD_NO) a
WHERE member.mem_no (+) = a.mem_no ;

--�Ű� ���� ����� �Ű� ���� Ƚ�� ���ϱ�
SELECT COUNT(*) reportcnt
FROM member,
(SELECT board.mem_no
 FROM board, report
WHERE board.board_no = report.BOARD_NO
GROUP BY board.mem_no) a
WHERE member.mem_no (+) = a.mem_no
AND member.mem_id = 'user';

--����
SELECT MONTHS_BETWEEN(TRUNC(SYSDATE,'YEAR'),TRUNC(TO_DATE('19890326','YYYYMMDD'),'YEAR')) /12 +1
FROM DUAL;

--222���� �� ����� ����
SELECT  *
FROM board, member
WHERE board.mem_no = member.mem_no
AND board.board_no = 222;

SELECT mem_no
FROM board
WHERE board_no = 222;

SELECT TO_CHAR(SYSDATE, 'YYYYMM')+6
FROM dual

--������Ʈ
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