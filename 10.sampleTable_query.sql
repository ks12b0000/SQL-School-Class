SELECT 
		A.ORDER_ID 
		,B.ITEM_ID 
		,B.PRODUCT_ID 
		,B.QUANTITY 
		,B.UNIT_PRICE 
		,A.STATUS 
		,A.ORDER_DATE 
		,A.SALESMAN_ID 
FROM ORDERS A 
	,ORDER_ITEMS B 
WHERE A.ORDER_ID = B.ORDER_ID 
;

DROP TABLE SALES;
CREATE TABLE SALES AS 
SELECT 
		A.ORDER_ID 
		,B.ITEM_ID 
		,B.PRODUCT_ID 
		,B.QUANTITY 
		,B.UNIT_PRICE 
		,A.STATUS 
		,A.ORDER_DATE 
		,A.SALESMAN_ID 
FROM ORDERS A 
	,ORDER_ITEMS B 
WHERE A.ORDER_ID = B.ORDER_ID 
;
DELETE 
FROM SALES s 
WHERE ORDER_ID = 1
AND ITEM_ID = 1
;
COMMIT;


DELETE 
FROM SALES s 
WHERE ORDER_ID = 1
;
COMMIT;
DELETE 
FROM SALES s 
;
COMMIT;


--INLINE VIEW 
SELECT A.*
FROM (
		SELECT 
			 	NAME 
			 	,CREDIT_LIMIT 
		FROM CUSTOMERS c 					
) A
;


SELECT 
	 	NAME 
	 	,CREDIT_LIMIT 
FROM CUSTOMERS c 
;

SELECT A.*
FROM(
    SELECT A.*
    FROM (
		SELECT 
			 	NAME 
			 	,CREDIT_LIMIT 
		FROM CUSTOMERS c 					
    ) A
)A
;

/*
    ������ �� ���� ���� �ѱݾ��� ���Ͻÿ�.
    ���̸�        ����      �ѱݾ�
    
*/
SELECT 
        c.name  AS CUSTOMER
        ,TO_CHAR(A.ORDER_DATE,'YYYY') AS YEAR
        ,SUM(b.quantity * b.unit_price) SALES_AMOUNT
FROM ORDERS A
    ,ORDER_ITEMS B
    ,CUSTOMERS C
WHERE 1=1
    AND A.STATUS = 'Shipped'
    AND A.ORDER_ID = B.ORDER_ID
    AND A.CUSTOMER_ID = C.CUSTOMER_ID
GROUP BY C.NAME, TO_CHAR(A.ORDER_DATE,'YYYY')
ORDER BY c.name
;


-- �� ���� => �並 �����  SELECT���� �ݺ������� TYPING�� �ʿ���� �ش� �並 SELECT�ϸ� ��.
create or replace view customer_sales as
SELECT 
        c.name  AS CUSTOMER
        ,TO_CHAR(A.ORDER_DATE,'YYYY') AS YEAR
        ,SUM(b.quantity * b.unit_price) SALES_AMOUNT
FROM ORDERS A
    ,ORDER_ITEMS B
    ,CUSTOMERS C
WHERE 1=1
    AND A.STATUS = 'Shipped'
    AND A.ORDER_ID = B.ORDER_ID
    AND A.CUSTOMER_ID = C.CUSTOMER_ID
GROUP BY C.NAME, TO_CHAR(A.ORDER_DATE,'YYYY')
ORDER BY c.name
;

SELECT *
FROM customer_sales;

-- ���� 2017�⵵ ������ ���Ͻÿ�. ���� ���� ���������� ���Ͻÿ�.
-- ���̸�     �Ѹ���

SELECT   
    customer,
    sales_amount
FROM customer_sales
WHERE YEAR = 2017
ORDER BY sales_amount DESC;

-- ���� ��ü ���� �հ踦 ���Ͻÿ�. ���� ������ ���������� ���Ͻÿ�.
SELECT
    customer
    ,SUM(sales_amount) AS SUM_sales_amount 
FROM customer_sales
GROUP BY CUSTOMER
ORDER BY SUM_sales_amount DESC;






