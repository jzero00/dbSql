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

--���� ���� ���� (�н�ƮǪ��� ����)
--���� ���������� ������������ ����
--���� ���� ���� = (����ŷ ���� + KFC ���� + �Ƶ����� ����) / �Ե����� ����
--���� / �õ�/ �ñ���/ ���ù�������(�Ҽ��� ù��° �ڸ�����, ��°�ڸ����� �ݿø�)

SELECT *
FROM fastfood;

SELECT sido, sigungu, gb, COUNT (gb) no_gb
FROM fastfood
WHERE  sigungu = '������'
GROUP BY sido, sigungu, gb;

--�Ƶ����� ����ŷ KFC �Ե����� �ձ��ϴ� ����
SELECT a.sido, a.sigungu, ROUND(a.cnt / b.cnt,1)  ���ù�������
FROM
            (SELECT  sido, sigungu, COUNT(*) cnt
            FROM fastfood
            WHERE gb = '�Ƶ�����' OR gb = '����ŷ' OR gb = 'KFC'
            GROUP BY sido, sigungu) a,
-- �Ե����� ������ ǥ��
            (SELECT  sido, sigungu, COUNT(*) cnt
            FROM fastfood
            WHERE gb = '�Ե�����'
            GROUP BY sido, sigungu) b
WHERE a.sido = b.sido AND a.sigungu = b.sigungu
ORDER BY ���ù������� DESC;

--���� ���� ���� ����� ����
--������ ������                 4/8
--������ ����                    17/12
--������ �߱�                      7/6
--������ ����                       4/8
--������ �����                     2/7

--�ϳ��� SQL�� �ۼ����� ����
--fastfood ���̺��� �̿��Ͽ� ������ SQL �������� ������ ����ؼ� ���ù��������� ���
SELECT  sido, sigungu, SUM(no_gb) 
FROM(
SELECT sido, sigungu, gb, COUNT (gb) no_gb
FROM fastfood
WHERE  sido = '����������'
GROUP BY sido, sigungu, gb)
WHERE gb = '�Ե�����'
GROUP BY sido, sigungu;


SELECT sido, sigungu, ROUND(sal/people,1) well
FROM tax
ORDER BY well DESC;

SELECT *
FROM tax
ORDER BY people DESC;










