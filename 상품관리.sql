SELECT prod_id, prod_name, prod_lgu, prod_buyer, prod_cost, prod_price, prod_sale, prod_outline, prod_detail
FROM lprod, prod
WHERE lprod.LPROD_GU = prod.PROD_LGU (+);

SELECT *
FROM prod;

SELECT prod_name
FROM lprod,prod
WHERE lprod_nm  = '컴퓨터제품'
AND lprod.LPROD_GU = prod.PROD_LGU (+);
            
            
            
            
SELECT lprod_nm
FROM lprod;