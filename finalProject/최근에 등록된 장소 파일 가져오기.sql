SELECT roomname, address, capacity, detailaddress,a.filename
FROM meetingroomattachfile a,
                        (SELECT rownum, m.*
                        FROM
                            (SELECT *
                            FROM meetingroominfo
                            WHERE deleteyn = 'n'
                            ORDER BY regdate DESC) m
                        WHERE rownum < 4) r
WHERE a.roomno = r.no
AND a.profileyn = 'y';

SELECT *
FROM meetingroominfo
WHERE deleteyn = 'n'
ORDER BY regdate DESC;

-- 장소찾기에서 List로 보여줄때 프로필 이미지 추출
SELECT roomname, address, capacity, detailaddress,a.filename--, roomno
FROM meetingroominfo m, meetingroomattachfile a
WHERE deleteyn = 'n'
AND m.no = a.roomno
AND a.profileyn = 'y';