-- ����� �� ���� ������ ���� ����� ���� ����� ������� �׸��� �� ������� ǥ���Ͻÿ�.

SELECT MAX(BIRTH_DE)
	, MIN(BIRTH_DE)
	, COUNT(*)
FROM TB_EMP;


-- ����� �� �μ� �ڵ� �� ���� ���� ����, ���� ���� ����, ���� ���� ����Ͻÿ�.
-- DEPT_CD, DEPT_NM, ���� ���� �������, ���� ���� �������, ������


SELECT A.DEPT_CD 
	, (SELECT B.DEPT_NM FROM TB_DEPT B WHERE B.DEPT_CD = A.DEPT_CD) AS DEPT_NM 
	, MAX(A.BIRTH_DE) AS "���� ���� �������"
	, MIN(A.BIRTH_DE) AS "���� ���� �������"
	, COUNT(*) AS "������"
FROM TB_EMP A
GROUP BY A.DEPT_CD
ORDER BY A.DEPT_CD ;


-- ����� �� �μ� �ڵ� �� ���� ���� ����, ���� ���� ����, ���� ���� ����Ͻÿ�.
-- �� �μ��� �� �������� 3���� �ʰ��ϴ� �μ� 
-- DEPT_CD, DEPT_NM, ���� ���� �������, ���� ���� �������, ������

SELECT A.DEPT_CD 
	, (SELECT B.DEPT_NM FROM TB_DEPT B WHERE B.DEPT_CD = A.DEPT_CD) AS DEPT_NM 
	, MAX(A.BIRTH_DE) AS "���� ���� �������"
	, MIN(A.BIRTH_DE) AS "���� ���� �������"
	, COUNT(*) AS "������"
FROM TB_EMP A
GROUP BY A.DEPT_CD
HAVING (COUNT(*)) > 3
ORDER BY A.DEPT_CD ;


-- 2019�⵵ �޿� ���� �߿��� ���� ���� ��� �޿����� 470���� �̻��� ��������
-- ������ȣ, ������, �ִ�޿��׼�, �ּұ޿��׼�, ��� �޿� �׼��� ����Ͻÿ�.

SELECT A.EMP_NO 
	, (SELECT B.EMP_NAME  FROM TB_EMP B WHERE B.EMP_NO = A.EMP_NO) AS EMP_NAME 
	, MAX(A.PAY_AMT) AS MAX_PAY_AMT
	, MIN(A.PAY_AMT) AS MIN_PAY_AMT
	, ROUND(AVG(A.PAY_AMT),2) AS AVG_PAY_AMT
FROM TB_SAL_HIS A
WHERE A.PAY_DE  BETWEEN '20190101' AND '20191231'
GROUP BY A.EMP_NO 
HAVING ROUND(AVG(A.PAY_AMT),2) >= 4700000
ORDER BY A.EMP_NO ;



-- 2019�⵵�� �޿� ���� �� �޿��� �հ�(����)�� 5500������ �ʰ��ϴ� ������
-- ������ȣ, ������, �հ�޿��׼��� ����Ͻÿ�.


SELECT A.EMP_NO 
	, (SELECT B.EMP_NAME  FROM TB_EMP B WHERE B.EMP_NO = A.EMP_NO) AS EMP_NAME
	, SUM(A.PAY_AMT) AS SUM_PAY_AMT
FROM TB_SAL_HIS A
WHERE A.PAY_DE BETWEEN '20190101' AND '20191231'
GROUP BY A.EMP_NO 
HAVING SUM(A.PAY_AMT) > 55000000
ORDER BY SUM_PAY_AMT DESC ;



-- CASE WHEN
SELECT 
		SUM(CASE WHEN BIRTH_DE LIKE '195%' THEN 1 ELSE 0 END) AS "1950����"
		, SUM(CASE WHEN BIRTH_DE LIKE '196%' THEN 1 ELSE 0 END) AS "1960����"
		, SUM(CASE WHEN BIRTH_DE LIKE '197%' THEN 1 ELSE 0 END) AS "1970����"
		, SUM(CASE WHEN BIRTH_DE LIKE '198%' THEN 1 ELSE 0 END) AS "1980����"
		, SUM(CASE WHEN BIRTH_DE LIKE '199%' THEN 1 ELSE 0 END) AS "1990����"
		, COUNT(*) CNT 
FROM TB_EMP A;



-- �μ����� �������� �� �ʳ��������� ���� ī��Ʈ�� ǥ���Ͻÿ�.
-- �μ���ȣ, �μ���, 1950���� , , , ,  CNT


SELECT A.DEPT_CD 
	, (SELECT B.DEPT_NM  FROM TB_DEPT B WHERE B.DEPT_CD  = A.DEPT_CD) AS DEPT_NM 
	, SUM(CASE WHEN BIRTH_DE LIKE '195%' THEN 1 ELSE 0 END) AS "1950����"
	, SUM(CASE WHEN BIRTH_DE LIKE '196%' THEN 1 ELSE 0 END) AS "1960����"
	, SUM(CASE WHEN BIRTH_DE LIKE '197%' THEN 1 ELSE 0 END) AS "1970����"
	, SUM(CASE WHEN BIRTH_DE LIKE '198%' THEN 1 ELSE 0 END) AS "1980����"
	, SUM(CASE WHEN BIRTH_DE LIKE '199%' THEN 1 ELSE 0 END) AS "1990����"
	, COUNT(*) CNT
FROM TB_EMP A
GROUP BY A.DEPT_CD 
ORDER BY A.DEPT_CD ;


-- �ڰ������� �������� �����Ͻÿ�.

SELECT A.CERTI_CD 
	, A.CERTI_NM 
	, A.ISSUE_INSTI_NM 
FROM TB_CERTI A
ORDER BY A.CERTI_NM DESC ;


SELECT A.CERTI_CD 
	, A.CERTI_NM 
	, A.ISSUE_INSTI_NM 
FROM TB_CERTI A
ORDER BY 2 DESC ;



SELECT A.CERTI_CD 
	, A.CERTI_NM  AS CERTI_NAME
	, A.ISSUE_INSTI_NM 
FROM TB_CERTI A
ORDER BY CERTI_NAME DESC ;

-- SELECT ���� �������� �ʴ� �÷����� ���� ����
SELECT A.CERTI_CD 
	, A.ISSUE_INSTI_NM 
FROM TB_CERTI A
ORDER BY A.CERTI_NM DESC ;




















