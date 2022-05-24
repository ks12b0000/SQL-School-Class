
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























































