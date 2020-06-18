SELECT *
FROM site_board
WHERE boardname = '공지사항'
AND SYSDATE BETWEEN startdate AND enddate
AND deleteyn = 'n'
ORDER BY viewcnt DESC;

COMMIT;