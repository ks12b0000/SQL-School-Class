-- ���� ����
SELECT 
    MAX(list_price)
FROM PRODUCTS
;

-- list_price�� 8867.99�� ���� ����Ͻÿ�.
SELECT
    product_id
    ,product_name
    ,list_price
FROM PRODUCTS
WHERE list_price = 8867.99
;



-- PRODUCTS�� �ִ� list_price�� ���� ���� �� product_id,product_name,list_price �˻�.
SELECT
    
FROM PRODUCTS
WHERE list_price = (
                    SELECT 
                    MAX(list_price) 
                    FROM PRODUCTS
                    )
;


-- ��Į�� ��������
/*
    �� ��ǰ�� ������ ���ϸ鼭
    �ش� ��ǰ�� ��ġ�ϰ� �ִ� ��ǰ ī�װ��� ��� ���ݵ� ���� ���Ͻÿ�.
    
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















