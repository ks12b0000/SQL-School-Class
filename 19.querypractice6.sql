
SELECT LEVEL LVL
		, LPAD(' ', 4*(LEVEL-1)) || EMP_NO || '(' || EMP_NAME || ')' AS "�����ο�"
		, A.DEPT_CD 
		, B.DEPT_NM 
		, CONNECT_BY_ISLEAF
FROM TB_EMP A, TB_DEPT B
WHERE A.DEPT_CD = B.DEPT_CD
START WITH A.DIRECT_MANAGER_EMP_NO IS NULL 	-- ������ �����ȣ�� ���� ���� ���� ������ ��
CONNECT BY PRIOR A.EMP_NO = A.DIRECT_MANAGER_EMP_NO ;


SELECT 30
	, LPAD(30, 5)
	, LPAD(30, 5, '0')
	, LPAD(30, 5, 'A')
FROM DUAL;


-- ���� ����
-- EMP_NO�� "1000000005"�� ���� ���� ������ ��ȸ�ϴ� SQL���� �ۼ��Ͻÿ�.
-- EMP_NO, EMP_NAME, DEPT_CD
-- ���� �� ���� ����

SELECT EMP_NO 
	, EMP_NAME 
	, DEPT_CD 
FROM TB_EMP 
WHERE DEPT_CD = 
(
	SELECT DEPT_CD 
	FROM TB_EMP 
	WHERE EMP_NO = '1000000005'	
);



-- TB_EMP, TB_SAL_HIS
-- 2020�� 5�� ���� ����̻��� �޿��� �ް� �ִ� �������� ����Ʈ�� ����Ͻÿ�.
-- EMP_NO, EMP_NAME_, PAY_DE, PAY_AMT

SELECT A.EMP_NO 
	, A.EMP_NAME 
	, B.PAY_DE
	, B.PAY_AMT
FROM TB_EMP A, TB_SAL_HIS B
WHERE B.PAY_DE = '20200525'
AND B.PAY_AMT >=
(
	SELECT AVG(C.PAY_AMT) 
	FROM TB_SAL_HIS C
	WHERE C.PAY_DE = '20200525'
)
AND B.EMP_NO = A.EMP_NO ;


-- �ѱ������ͺ��̽���������� �߱��� �ڰ����� ������ �ִ�
-- ��� ��ȣ �� ���� �ڼ� ������ ����Ͻÿ�.
SELECT A.EMP_NO , COUNT(*) CNT 
FROM TB_EMP_CERTI A
WHERE A.CERTI_CD 
IN
(
SELECT K.CERTI_CD 
FROM EZEN.TB_CERTI K
WHERE K.ISSUE_INSTI_NM = '�ѱ������ͺ��̽������'
)
GROUP BY A.EMP_NO 
ORDER BY A.EMP_NO 
;


-- ���� �÷� ��������
-- �� �μ��� 2�� �̻� �ִ� �μ� �߿��� �� �μ��� ���ϱ��� ���̰� ���� ���� ����� ����Ͻÿ�.
-- emp_no, emp_name, dept_cd, dept_na, birth_de
SELECT A.EMP_NO 
	, A.EMP_NAME 
	, A.DEPT_CD
	, B.DEPT_NM 
	, A.BIRTH_DE 
FROM TB_EMP A
	, TB_DEPT B
WHERE (A.DEPT_CD, A.BIRTH_DE)IN
(
	SELECT K.DEPT_CD , MIN(K.BIRTH_DE) AS MIN_BIRTH_DE 
	FROM TB_EMP K
	GROUP BY K.DEPT_CD 
	HAVING COUNT(*) > 1 
)
AND A.DEPT_CD = B.DEPT_CD 
ORDER BY A.EMP_NO ;


-- ������ �� �ּҰ� ������ ������ �Ҽӵ� �μ��ڵ�� �μ����� ����Ͻÿ�.
-- EXISTS�� ��������
SELECT A.DEPT_CD , A.DEPT_NM 
FROM TB_DEPT A
WHERE EXISTS 
(
	SELECT 1
	FROM TB_EMP K
	WHERE K.DEPT_CD = A.DEPT_CD 
	AND K.ADDR LIKE '%����%'
);

-- �ѱ������ͺ��̽���������� �߱��� �ڰ����� ������ �ִ� �����
-- �����ȣ, �����, �ڰ��� �ڵ�, �ڰ������� ����Ͻÿ�.
-- (��Į�� �������� �̿�)
SELECT A.EMP_NO 
	, (SELECT L.EMP_NAME FROM TB_EMP L WHERE L.EMP_NO = A.EMP_NO) AS EMP_NAME 
	, A.CERTI_CD 
	, (SELECT S.CERTI_NM FROM TB_CERTI S WHERE S.CERTI_CD = A.CERTI_CD) AS CERTI_NM
FROM TB_EMP_CERTI A
WHERE A.CERTI_CD IN
(
SELECT K.CERTI_CD 
FROM EZEN.TB_CERTI K
WHERE K.ISSUE_INSTI_NM ='�ѱ������ͺ��̽������'
)
ORDER BY CERTI_NM;


-- �ѱ������ͺ��̽���������� �߱��� �ڰ����� ������ �ִ� �����
-- �����ȣ, �����, �ڰ��� �ڵ�, �ڰ������� ����Ͻÿ�.
-- (�ζ��� �� ���)
SELECT B.EMP_NO
	, (SELECT L.EMP_NAME FROM TB_EMP L WHERE L.EMP_NO = B.EMP_NO) AS EMP_NAME 
	, B.CERTI_CD
	, (SELECT S.CERTI_NM FROM TB_CERTI S WHERE S.CERTI_CD = B.CERTI_CD) AS CERTI_NM
FROM 
(
	SELECT K.CERTI_CD 
	FROM EZEN.TB_CERTI K
	WHERE K.ISSUE_INSTI_NM ='�ѱ������ͺ��̽������'
) A
, TB_EMP_CERTI B
WHERE A.CERTI_CD = B.CERTI_CD
ORDER BY CERTI_NM;


CREATE VIEW V_TB_SAL_HIS_MAX_BY_EMP_NO
AS
SELECT A.EMP_NO 
	, A.EMP_NAME 
	, B.DEPT_CD 
	, B.DEPT_NM 
	, MAX(C.PAY_AMT) AS MAX_PAY_AMT 
FROM TB_EMP A, TB_DEPT B, TB_SAL_HIS C
WHERE A.EMP_NO = C.EMP_NO 
AND A.DEPT_CD = B.DEPT_CD 
GROUP BY A.EMP_NO, A.EMP_NAME, B.DEPT_CD, B.DEPT_NM ; 

SELECT *
FROM V_TB_SAL_HIS_MAX_BY_EMP_NO ;

DROP VIEW V_TB_SAL_HIS_MAX_BY_EMP_NO ;








