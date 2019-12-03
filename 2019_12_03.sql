--outer join 1
SELECT a.buy_date, a.buy_prod, prod.prod_id, prod.prod_name, a.buy_qty
FROM prod,
        (SELECT buyprod.buy_date, buyprod.buy_prod, prod.prod_id,
                        prod.prod_name, buyprod.buy_qty
        FROM buyprod, prod
        WHERE buyprod.buy_prod= prod.prod_id
        AND buyprod.buy_date = TO_DATE('20050125','yyyymmdd') )a
WHERE a.buy_prod (+) = prod.prod_id;

--outer join 2
SELECT nvl (a.buy_date, TO_DATE('20050125','yyyymmdd')) buy_date,
        a.buy_prod, prod.prod_id, prod.prod_name, a.buy_qty
FROM prod,
        (SELECT buyprod.buy_date, buyprod.buy_prod, prod.prod_id,
                        prod.prod_name, buyprod.buy_qty
        FROM buyprod, prod
        WHERE buyprod.buy_prod= prod.prod_id
        AND buyprod.buy_date = TO_DATE('20050125','yyyymmdd') )a
WHERE a.buy_prod (+) = prod.prod_id;

--outer join 3
--buy_qty
SELECT nvl (a.buy_date, TO_DATE('20050125','yyyymmdd')) buy_date,
        a.buy_prod, prod.prod_id, prod.prod_name, 
        NVL (a.buy_qty,0) buy_qty
FROM prod,
        (SELECT buyprod.buy_date, buyprod.buy_prod, prod.prod_id,
                        prod.prod_name, buyprod.buy_qty
        FROM buyprod, prod
        WHERE buyprod.buy_prod= prod.prod_id
        AND buyprod.buy_date = TO_DATE('20050125','yyyymmdd') )a
WHERE a.buy_prod (+) = prod.prod_id;


--outer join 4
SELECT  NVL(product.pid,200) pid,
product.pnm,  
NVL (cycle.cid,0) cid,
NVL (cycle.day,0) day
, COUNT(cid) cnt
FROM cycle, product
WHERE cycle.pid (+) = product.pid
AND cycle.cid (+) = 1
GROUP BY cycle.pid, product.pnm, cid, cycle.day, nvl(product.pid,200)
ORDER BY pid;

--outer join 5
SELECT a.pid, a.pnm, a.cid, customer.cnm, a.day, a.cnt
FROM
(SELECT product.pid, product.pnm,
               :cid,  NVL(cycle.day , 0) day, NVL(cycle.cnt , 0) cnt
FROM product, cycle
WHERE cycle.cid (+) = :cid
AND cycle.pid(+) = product.pid) a, customer
WHERE a.cid = customer.cid;

--outer join 5
SELECT  NVL (product.pid,200) pid,
product.pnm,  NVL (cycle.cid,0) cid,
product.pnm,
nvl(cycle.day,0) day, COUNT(cid) cnt
FROM cycle cyc, product pro, customer cus
WHERE cyc.cid (+) = cus.cid
AND cyc.pid (+) = pro.pid
ORDER BY pid;

--crossjoin1
SELECT *
FROM customer, product;

--도시 발전 지수 (패스트푸드로 ㅋㅋ)
--도시 발전지수를 내림차순으로 정렬
--도시 발전 지수 = (버거킹 개수 + KFC 개수 + 맥도날드 개수) / 롯데리아 개수
--순위 / 시도/ 시군구/ 도시발전지수(소수점 첫번째 자리까지, 둘째자리에서 반올림)

SELECT *
FROM fastfood;

SELECT sido, sigungu, gb, COUNT (gb) no_gb
FROM fastfood
WHERE  sigungu = '유성구'
GROUP BY sido, sigungu, gb;

--맥도날드 버거킹 KFC 롯데리아 합구하는 과정
SELECT a.sido, a.sigungu, ROUND(a.cnt / b.cnt,1)  도시발전지수
FROM
            (SELECT  sido, sigungu, COUNT(*) cnt
            FROM fastfood
            WHERE gb = '맥도날드' OR gb = '버거킹' OR gb = 'KFC'
            GROUP BY sido, sigungu) a,
-- 롯데리아 갯수만 표시
            (SELECT  sido, sigungu, COUNT(*) cnt
            FROM fastfood
            WHERE gb = '롯데리아'
            GROUP BY sido, sigungu) b
WHERE a.sido = b.sido AND a.sigungu = b.sigungu
ORDER BY 도시발전지수 DESC;

--도시 발전 지수 만드는 과정
--대전시 유성구                 4/8
--대전시 서구                    17/12
--대전시 중구                      7/6
--대전시 동구                       4/8
--대전시 대덕구                     2/7

--하나의 SQL로 작성하지 말것
--fastfood 테이블을 이용하여 여러번 SQL 실행결과를 손으로 계산해서 도시발전지수를 계산
SELECT  sido, sigungu, SUM(no_gb) 
FROM(
SELECT sido, sigungu, gb, COUNT (gb) no_gb
FROM fastfood
WHERE  sido = '대전광역시'
GROUP BY sido, sigungu, gb)
WHERE gb = '롯데리아'
GROUP BY sido, sigungu;


SELECT sido, sigungu, ROUND(sal/people,1) well
FROM tax
ORDER BY well DESC;

SELECT *
FROM tax
ORDER BY people DESC;










