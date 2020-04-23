INSERT INTO board
(bno, title, writer, content)
SELECT BOARD_SEQ.nextval, title, writer,content
FROM board;

COMMIT;
