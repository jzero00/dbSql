--�Ű���� ��� ����Ʈ

SELECT COUNT(*) cnt
FROM member
WHERE mem_no = (SELECT board.mem_no

                                    FROM board, report
                                    WHERE board.board_no = report.BOARD_NO);
                                    
                                    SELECT COUNT(board.mem_no) cnt
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


--�Ű���� ��� ����Ʈ
SELECT *
FROM member
WHERE mem_no =
(SELECT board.mem_no
 FROM board, report
WHERE board.board_no = report.BOARD_NO
GROUP BY board.mem_no);

--�Ű� ���� ��� ��ü ����Ʈ ��ȸ
SELECT *
FROM member,
(SELECT board.mem_no
 FROM board, report
WHERE board.board_no = report.BOARD_NO
GROUP BY board.mem_no) a
WHERE member.mem_no (+) = a.mem_no ;


--����
SELECT MONTHS_BETWEEN(TRUNC(SYSDATE,'YEAR'),TRUNC(TO_DATE('19890326','YYYYMMDD'),'YEAR')) /12 +1
FROM DUAL;
