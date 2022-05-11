
CREATE TABLE employee(
		EMP_NUM 	CHAR(10) NOT NULL,
		EMP_NAME 	VARCHAR(150) NOT NULL,
		BRITH_DE 	CHAR(8) NOT NULL,
		ADDR 		VARCHAR(1000) NOT NULL,
		LUNAR_YN 	CHAR(1) NOT NULL,
		SEX_CD		CHAR(3) NOT NULL,
		FINAL_EDU_SE_CD 	CHAR(3) NOT NULL,
		SAL_TRANS_BANK_CD 	CHAR(3) NOT NULL,
		SAL_TRANS_ACCNT_NO	VARCHAR(20) NOT NULL,
		DIRECT_MANAGER_EMP_NO	CHAR(10),
		DEPT_CD CHAR(6) NOT NULL,		
		PRIMARY key(EMP_NUM),
		FOREIGN key(DIRECT_MANAGER_EMP_NO) REFERENCES EMPLOYEE(EMP_NUM),
		FOREIGN KEY(DEPT_CD) REFERENCES DEPARTMENT(DEPT_CD)		
);

COMMIT;

CREATE TABLE Department(
		DEPT_CD CHAR(6) NOT NULL,
		DEPT_NM VARCHAR(150) NOT NULL,
		UPPER_DEPT_CD CHAR(6),
		PRIMARY KEY(DEPT_CD),
		FOREIGN KEY(UPPER_DEPT_CD) REFERENCES Department(DEPT_CD)
);
COMMIT;

CREATE TABLE CERTI(
		CERTI_CD	CHAR(6) NOT NULL,
		CERTI_NM	VARCHAR(150) NOT NULL,
		ISSUE_INSTI_NM VARCHAR(150) NOT NULL,
		PRIMARY KEY(CERTI_CD)
);

CREATE TABLE EMP_CERTI(
		EMP_NUM CHAR(10) NOT NULL,
		CERTI_SN CHAR(3) NOT NULL,
		CERTI_CD CHAR(6) NOT NULL,
		ACQU_DE CHAR(8) NOT NULL,		
		PRIMARY KEY(CERTI_SN),
		FOREIGN KEY(EMP_NUM) REFERENCES employee(EMP_NUM),
		FOREIGN KEY(CERTI_CD) REFERENCES CERTI(CERTI_CD)
);

COMMIT;

CREATE TABLE SAL_HIS(
		SAL_HIS_NO CHAR(14) NOT NULL,
		PAY_DE CHAR(8) NOT NULL,
		PAY_AMT NUMERIC(15) NOT NULL,
		EMP_NUM CHAR(10) NOT NULL,
		PRIMARY KEY(SAL_HIS_NO),
		FOREIGN KEY(EMP_NUM) REFERENCES employee(EMP_NUM)	
);
COMMIT;

CREATE TABLE SAL(
		SAL_CD CHAR(6) NOT NULL,
		SAL_NM VARCHAR(150) NOT NULL,
		PRIMARY KEY(SAL_CD)
);

CREATE TABLE SAL_HIS_DTL(
		SAL_HIS_NO CHAR(14) NOT NULL,
		EMP_NUM CHAR(10) NOT NULL,
		SAL_CD CHAR(6) NOT NULL,
		DTL_SN CHAR(10) NOT NULL,
		PRIMARY KEY(SAL_HIS_NO),
		FOREIGN KEY(SAL_HIS_NO) REFERENCES SAL_HIS(SAL_HIS_NO),
		FOREIGN KEY(SAL_CD) REFERENCES SAL(SAL_CD)		
);

COMMIT;



