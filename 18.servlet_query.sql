-- ȸ�� ���̺� ����

DROP TABLE t_member CASCADE CONSTRAINT;

CREATE TABLE t_member 
(
	id		VARCHAR2(10)		PRIMARY KEY,
	pwd     VARCHAR2(10),
	name	VARCHAR2(50),
	email 	VARCHAR2(50),
	joinDate	DATE DEFAULT SYSDATE 
);

-- ȸ�� ���� �߰�
INSERT INTO T_MEMBER VALUES ('lee', '0824', '�̼���', 'lee@email.com', SYSDATE);
INSERT INTO T_MEMBER VALUES ('hong', '0824', 'ȫ�浿' , 'hong@email.com', SYSDATE);
INSERT INTO T_MEMBER VALUES ('shin', '0824', '�Ż��Ӵ�', 'shin@email.com', SYSDATE);

INSERT INTO T_MEMBER (id, pwd, name, email) 
VALUES ('test', '0824', '�׽�Ʈ', 'test@gmail.com');

ROLLBACK;
COMMIT;

SELECT * FROM T_MEMBER;

DELETE FROM T_MEMBER 
WHERE ID = 'ezen';



-- ���̺� �� ������ ����
DROP TABLE MEMBER CASCADE CONSTRAINT;
CREATE TABLE MEMBER 
(
	ID			VARCHAR2(10) NOT NULL,
	PASS		VARCHAR2(10) NOT NULL,
	NAME		VARCHAR2(30) NOT NULL,
	REGIDATE		DATE	DEFAULT SYSDATE NOT NULL,
	PRIMARY KEY(ID)
);

INSERT INTO MEMBER (ID, PASS, NAME)
VALUES ('ezen', '0824', '����');
COMMIT;


SELECT * FROM MEMBER WHERE ID = 'ezen' AND PASS = '0824';







