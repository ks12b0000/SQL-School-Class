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
COMMIT;

SELECT * FROM T_MEMBER;





















