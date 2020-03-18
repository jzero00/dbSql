SELECT *
FROM
    (SELECT rownum rn, board.*
    FROM board
    ORDER BY board_no DESC)a, attachfile
WHERE a.board_no = attachfile.board_no(+)
AND a.rn BETWEEN 1 AND 10;