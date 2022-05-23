-- 회원 테이블 생성

DROP TABLE t_member CASCADE CONSTRAINT;

CREATE TABLE t_member 
(
	id		VARCHAR2(10)		PRIMARY KEY,
	pwd     VARCHAR2(10),
	name	VARCHAR2(50),
	email 	VARCHAR2(50),
	joinDate	DATE DEFAULT SYSDATE 
);

-- 회원 정보 추가
INSERT INTO T_MEMBER VALUES ('lee', '0824', '이순신', 'lee@email.com', SYSDATE);
INSERT INTO T_MEMBER VALUES ('hong', '0824', '홍길동' , 'hong@email.com', SYSDATE);
INSERT INTO T_MEMBER VALUES ('shin', '0824', '신사임당', 'shin@email.com', SYSDATE);
COMMIT;

SELECT * FROM T_MEMBER;





















