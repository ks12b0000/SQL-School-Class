-- ������ �Ϻκи� ���
-- PAY_DE(��������) ������ �����ϴ� ���տ��� 10�Ǹ� ���� ���,
-- �� 10���� ��� ����� PAY_AMT�� �������� ������.

SELECT A.SAL_HIS_NO 
	, A.PAY_DE 
	, A.PAY_AMT 
	, A.EMP_NO 
FROM EZEN.TB_SAL_HIS A 
WHERE A.PAY_DE >= '20200501'
	AND A.PAY_DE <= '20200531'
	AND ROWNUM <= 10
ORDER BY A.PAY_AMT DESC ;





-- PAY_DE ������ �����ϴ� ���տ���
-- PAY_AMT �������� �������� ������ ���� �� ���� 10�Ǹ� �����.

SELECT  A.SAL_HIS_NO 
	, A.PAY_DE 
	, A.PAY_AMT 
	, A.EMP_NO 
FROM 
	(
		SELECT  A.SAL_HIS_NO 
			, A.PAY_DE 
			, A.PAY_AMT 
			, A.EMP_NO 
		FROM EZEN.TB_SAL_HIS A  	
		WHERE A.PAY_DE >= '20200501'
			AND A.PAY_DE <= '20200531'
		ORDER BY A.PAY_AMT DESC 
	)A
WHERE ROWNUM <= 10;
	
	
-- ������ ������ �Լ�

SELECT LOWER('Oracle Server SQL Developer') AS "LOWER('�ҹ��ڷ� ��ȯ')"
	  ,UPPER('Oracle Server SQL Developer') AS "UPPER('�빮�ڷ� ��ȯ')"
	  ,ASCII('a') AS "ASCII('�ƽ�Ű�ڵ尪 ���')" 
	  ,CONCAT('SQL','Developer') AS "CONCAT('���ڿ� ����')"
	  ,SUBSTR('SQL Developer', 1, 3) AS "SUBSTR('���ڿ� �߶󳻱�')" 
	  ,LENGTH('SQL') AS "LENGTH('���ڿ��� ���� ���')"
	  ,LTRIM(' SQL') AS "LTRIM('���� ���� ����')" 
	  ,RTRIM('SQL ') AS "RTRIM('������ ���� ����')"
FROM DUAL;


-- ������ ������ �Լ�
SELECT ABS(-15) AS "ABS('���밪�� ��ȯ')"
	  ,SIGN(10) AS "SIGN('����ϰ�� 1, �����ϰ�� -1, 0�ϰ�� 0 ��ȯ')"
	  ,MOD(8, 3) AS "MOD('������ ��ȯ')"
	  ,CEIL(38.678) AS "CEIL('������ �ø�')"
	  ,FLOOR(38.678) AS "FLOOR('������ ����')" 
	  ,ROUND(38.678, 2) AS "ROUND('�Ҽ��� 2��° �ڸ� �ݿø�')"
	  ,TRUNC(38.678) AS "TRUNC('0�� �ڸ����� ������ �ڸ�')" 
	  ,TRUNC(38.678, 1) AS "TRUNC('1�� �ڸ����� ������ �ڸ�')"
	  ,TRUNC(38.678, 2) AS "TRUNC('2�� �ڸ����� ������ �ڸ�')"
	  ,TRUNC(38.678, 3) AS "TRUNC('3�� �ڸ����� ������ �ڸ�')"
FROM DUAL;


-- ��¥�� ������ ��ȯ �Լ�
SELECT SYSDATE AS "SYSDATE"			-- ���� ����Ͻú��� ���
	  ,EXTRACT(YEAR FROM SYSDATE) AS "EXTRACT(YEAR FROM SYSDATE)"			-- �� ���
	  ,EXTRACT(MONTH FROM SYSDATE) AS "EXTRACT(MONTH FROM SYSDATE)"			-- �� ���
	  ,EXTRACT(DAY FROM SYSDATE) AS "EXTRACT(DAY FROM SYSDATE)" 			-- �� ���
      ,TO_CHAR(SYSDATE, 'YYYY') AS "TO_CHAR(SYSDATE, 'YYYY')"               -- �� ��� (���ڿ�)
      ,TO_CHAR(SYSDATE, 'MM') AS "TO_CHAR(SYSDATE, 'MM')"                   -- �� ��� (���ڿ�)
      ,TO_CHAR(SYSDATE, 'DD') AS "TO_CHAR(SYSDATE, 'DD')"                   -- �� ��� (���ڿ�)
      ,TO_CHAR(SYSDATE, 'HH24') AS "TO_CHAR(SYSDATE, 'HH24')"               -- �� ��� (���ڿ�)
      ,TO_CHAR(SYSDATE, 'MI') AS "TO_CHAR(SYSDATE, 'MI')"                   -- �� ��� (���ڿ�)
      ,TO_CHAR(SYSDATE, 'SS') AS "TO_CHAR(SYSDATE, 'SS')"                   -- �� ��� (���ڿ�)
      ,TO_NUMBER(TO_CHAR(SYSDATE, 'YYYY')) AS "TO_NUMBER(TO_CHAR(SYSDATE, 'YYYY')"      -- �� ���
      ,TO_NUMBER(TO_CHAR(SYSDATE, 'MM'))AS "TO_NUMBER(TO_CHAR(SYSDATE, 'MM'))"          -- �� ���
      ,TO_NUMBER(TO_CHAR(SYSDATE, 'DD'))AS "TO_NUMBER(TO_CHAR(SYSDATE, 'DD'))"          -- �� ���
      ,TO_NUMBER(TO_CHAR(SYSDATE, 'HH24'))AS "TO_NUMBER(TO_CHAR(SYSDATE, 'HH24'))"      -- �� ���
      ,TO_NUMBER(TO_CHAR(SYSDATE, 'MI'))AS "TO_NUMBER(TO_CHAR(SYSDATE, 'MI'))"          -- �� ���
      ,TO_NUMBER(TO_CHAR(SYSDATE, 'SS'))AS "TO_NUMBER(TO_CHAR(SYSDATE, 'SS'))"          -- �� ���
FROM DUAL;


-- ��¥�� ������ ����
SELECT 
    SYSDATE AS "SYSDATE"                         -- ���� ����� �ú���
    ,SYSDATE -1 AS "SYSDATE - 1"                 -- 1�� �� ����� �ú���
    ,SYSDATE - (1/24) AS "SYSDATE - (1/24)"       -- 1�ð��� �� ����� �ú���
    ,SYSDATE - (1/24/60) AS "SYSDATE - (1/24/60)"   -- 1���� �� ����� �ú���
    ,SYSDATE - (1/24/60/60) AS "SYSDATE - (1/24/60/60)"   -- 1�ʸ� �� ����� �ú���
    ,SYSDATE - (1/24/60/60) * 10 AS "SYSDATE - (1/24/60/60) * 10"   -- 10�ʸ� �� ����� �ú���
    ,SYSDATE - (1/24/60/60) * 30 AS "SYSDATE - (1/24/60/60) * 30"   -- 30�ʸ� �� ����� �ú���
FROM DUAL;



-- ������ ��ȯ�� ����
/*
    1) �Ͻ��� �� ��ȯ : DBMS�� �ڵ����� ������ ������ ��ȯ�ϴ� ���
    2) ����� �� ��ȯ : ������ ��ȯ �� �Լ��� ������ ������ ��ȯ�ϵ��� ������ִ� ���
 */

SELECT TO_CHAR(SYSDATE, 'YYYY/MM/DD') "TO_CHAR(SYSDATE, ''YYYY/MM/DD'')"
        ,TO_CHAR(SYSDATE, 'YYYY/MM/DD HH24:MI:SS') "TO_CHAR(SYSDATE, ''YYYY/MM/DD HH24:MI:SS'')"
        ,TO_CHAR(10.25, '$999,999,999.99') "TO_CHAR(10.25, ''$999,999,999.99'')"
        ,TO_CHAR(12500, 'L999,999,999') "TO_CHAR(12500, ''L999,999,999'')"
        ,TO_NUMBER('100') + TO_NUMBER('100') "TO_NUMBER(''100'') + TO_NUMBER(''100'')"
FROM DUAL;


/*
    CASE WHEN ����
        THEN �� Ȥ�� SQL��
        ELSE �� Ȥ�� SQL��
    END

    : ������ ������ THEN�� �����ϰ� �׷��� ������ ELSE���� �����Ѵ�.
 */

SELECT CASE WHEN SAL_CD = '100001' THEN '�⺻��'
            WHEN SAL_CD = '100002' THEN '�󿩱�'
            WHEN SAL_CD = '100003' THEN 'Ư���󿩱�'
            WHEN SAL_CD = '100004' THEN '�߱ټ���'
            WHEN SAL_CD = '100005' THEN '�ָ�����'
            WHEN SAL_CD = '100006' THEN '���ɽĴ�'
            WHEN SAL_CD = '100007' THEN '��������Ʈ'
            ELSE '��ȿ���� ����'
END SAL_NM
FROM EZEN.TB_SAL;

/*
    DECODE(ǥ���� Ȥ�� �����÷�, �񱳰�1, �����1, �񱳰�2, �����2, ����Ʈ ��)

    : ǥ���� Ȥ�� �����÷��� ���Ͽ� �񱳰�1�� ������ �����1�� ����ϰ�,
      ǥ���� Ȥ�� �����÷��� ���Ͽ� �񱳰�2�� ������ �����2�� ����ϰ�, �׷��� ������ ����Ʈ ���� ����� �����.
 */

SELECT DECODE(EZEN.TB_SAL.SAL_CD, '100001', '�⺻��2', '100002', '�󿩱�', '��Ÿ')
FROM EZEN.TB_SAL;


-- �ΰ��� �Լ� ���

SELECT NVL(DIRECT_MANAGER_EMP_NO, '�ֻ�����')       -- ���ӻ�������ȣ�� NULL�̸� "�ֻ�����"�� ���
FROM EZEN.TB_EMP
WHERE DIRECT_MANAGER_EMP_NO IS NULL;

-- �ֻ��� �μ�
SELECT NVL(UPPER_DEPT_CD, '�ֻ����μ�')
FROM EZEN.TB_DEPT
WHERE UPPER_DEPT_CD IS NULL;


SELECT NVL(MAX(EMP_NAME), '�������') AS EMP_NAME
FROM EZEN.TB_EMP
WHERE EMP_NAME = '��ȸ��';

-- MAX�Լ��� ���� �������� ��쿡�� �Ѱ��� ROW�� ����
SELECT NVL(MAX(EMP_NAME), '�������') AS EMP_NAME
FROM EZEN.TB_EMP
WHERE EMP_NAME = '������';

-- ���������� '����ȣ' ����
SELECT NULLIF ('����ȣ', '������') FROM DUAL;

SELECT NULLIF ('����ȣ', '����ȣ') FROM DUAL;

SELECT  NVL(NULLIF('�Ż��Ӵ�', '�Ż��Ӵ�'), '�������') FROM DUAL;

-- COALESCE() : ���� �ƴ� ù��° ����/���� ���� ��.
SELECT COALESCE(NULL, NULL, 0) AS COALESCE_ FROM DUAL;

SELECT COALESCE(5000, NULL, 0) AS COALESCE_ FROM DUAL;

SELECT COALESCE(NULL, 6000, 0) AS COALESCE_ FROM DUAL;























