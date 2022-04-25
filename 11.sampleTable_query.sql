-- 서브 쿼리
SELECT 
    MAX(list_price)
FROM PRODUCTS
;

-- list_price가 8867.99인 행을 출력하시오.
SELECT
    product_id
    ,product_name
    ,list_price
FROM PRODUCTS
WHERE list_price = 8867.99
;



-- PRODUCTS에 있는 list_price가 가장 높은 것 product_id,product_name,list_price 검색.
SELECT
    
FROM PRODUCTS
WHERE list_price = (
                    SELECT 
                    MAX(list_price) 
                    FROM PRODUCTS
                    )
;


-- 스칼라 서브쿼리
/*
    각 제품의 가격을 구하면서
    해당 제품이 위치하고 있는 제품 카테고리의 평균 가격도 같이 구하시오.
    
    PRODUCT_NAME            LIST_PRICE              AVG_LIST_PRICE
*/


SELECT 
        A.PRODUCT_NAME
        ,A.LIST_PRICE
        ,ROUND((
                SELECT AVG(k.list_price)
                FROM PRODUCTS K
                WHERE K.CATEGORY_ID = A.CATEGORY_ID      
        ),2) AVG_LIST_PRICE
FROM PRODUCTS A
ORDER BY a.product_name
;















