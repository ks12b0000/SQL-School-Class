-- �� ���̺��� �� ���̵�,����,�ſ�ī���ѵ����� �������ÿ�.
SELECT  c.CUSTOMER_ID,
		c.NAME,
		c.CREDIT_LIMIT 
FROM CUSTOMERS c 
;


-- �� ���̺��� �����̵�,����,�ּ�,������Ʈ,�ſ�ī���ѵ��ݾ��� �������ÿ�.

SELECT *
FROM CUSTOMERS c ;


-- ����Ŭ���� �����ϴ� dual ���̺��� ��ȸ�Ͻÿ�.
-- dual ���̺��� �̿��Ͽ� SELECT ������ �پ��� ����ó���� �Ҽ� ����.
SELECT *
FROM DUAL ;

SELECT (10+5)/2 AS val
FROM DUAL ; 

SELECT c.NAME, 
	   c.ADDRESS,
	   c.CREDIT_LIMIT 
FROM CUSTOMERS c 
ORDER BY c.NAME DESC;

SELECT c.FIRST_NAME,
	   c.LAST_NAME 
FROM CONTACTS c 
ORDER BY c.FIRST_NAME , c.LAST_NAME DESC ;

SELECT FIRST_NAME 
FROM CONTACTS c 
ORDER BY FIRST_NAME ;

SELECT DISTINCT FIRST_NAME 
FROM CONTACTS c 
ORDER BY FIRST_NAME ;

SELECT DISTINCT PRODUCT_ID ,
	   QUANTITY 
FROM ORDER_ITEMS oi 
ORDER BY PRODUCT_ID ;

SELECT PRODUCT_NAME ,
	   DESCRIPTION ,
	   LIST_PRICE ,
	   CATEGORY_ID 
FROM PRODUCTS p 
WHERE PRODUCT_NAME = 'Kingston';


-- PRODUCT_NAME�� 'Asus'�� �����ϴ� ��(��)�� ����Ͻÿ�.(PRODUCT_NAME,List_price)
SELECT PRODUCT_NAME ,
	   LIST_PRICE 
FROM PRODUCTS p 
WHERE PRODUCT_NAME  LIKE 'Asus%'
ORDER BY LIST_PRICE ;




