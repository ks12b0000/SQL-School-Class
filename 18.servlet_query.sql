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
INSERT INTO T_MEMBER VALUES ('android', '0826', '안드로이드', 'android@email.com', SYSDATE);

INSERT INTO T_MEMBER (id, pwd, name, email) VALUES ('test', '0824', '테스트', 'test@gmail.com');

UPDATE T_MEMBER
SET PWD = '0825', NAME = '이젠05', EMAIL = 'ezen05@gmail.com'
WHERE ID = 'ezen5';

DELETE FROM T_MEMBER 
WHERE ID = 'ezen5';

ROLLBACK;
COMMIT;

SELECT * FROM T_MEMBER;

SELECT * FROM T_MEMBER ORDER BY JOINDATE DESC;

SELECT NAME FROM T_MEMBER WHERE id = 'android';


DELETE FROM T_MEMBER 
WHERE ID = 'ezen';

SELECT DECODE(COUNT(*),1, 'TRUE', 'FALSE') AS RESULT FROM T_MEMBER 
WHERE ID = 'lee' AND PWD = '0824';




-- 테이블 및 시퀀스 생성
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
VALUES ('ezen', '0824', '이젠');
COMMIT;

INSERT INTO MEMBER (ID, PASS, NAME)
VALUES ('lee', '0824', '이순신');
COMMIT;

SELECT * FROM MEMBER WHERE ID = 'ezen' AND PASS = '0824';

SELECT * FROM MEMBER WHERE ID = 'lee' AND PASS = '0824';

INSERT INTO BOARD VALUES(SEQ_BOARD_NUM.NEXTVAL, '신논현역 분당선 개통', '공사가 다 마무리되어서 인도가 넓어졌으나 ...',
						'ezen',SYSDATE, '0');
INSERT INTO BOARD VALUES(SEQ_BOARD_NUM.NEXTVAL, '에이프로 스퀘어 건물', '간다라ㅏ맘아 ...',
						'ezen',SYSDATE, '0');

COMMIT;
SELECT b.*,
	 	m.NAME 
FROM "MEMBER" m
INNER JOIN BOARD b ON m.ID = b.ID 
WHERE num = 3;


UPDATE BOARD SET VISITCOUNT = VISITCOUNT + 1
WHERE NUM = 1;

COMMIT;

UPDATE BOARD  SET TITLE = '인테리어 변경', CONTENT = '어서 마무리가 되어야될텐데요'
WHERE NUM = 9;

COMMIT;

SELECT * FROM BOARD b ;



DELETE FROM BOARD WHERE NUM = 8;
COMMIT;



SELECT DECODE(COUNT(*),1,'true','false') AS RESULT FROM T_MEMBER 
WHERE ID = 'lee';



DROP TABLE mvcboard CASCADE CONSTRAINTS;
CREATE TABLE mvcboard (
		idx			NUMBER 		PRIMARY KEY,
		name 		VARCHAR2(50) NOT NULL,
		title		VARCHAR2(200) NOT NULL,
		content 	VARCHAR2(2000) NOT NULL,
		postdate 	DATE   DEFAULT sysdate NOT NULL,
		ofile		VARCHAR2(200),
		sfile		VARCHAR2(30),
		download	NUMBER DEFAULT 0 NOT NULL,
		pass		VARCHAR2(50) NOT NULL,
		visitcount  NUMBER DEFAULT 0 NOT NULL
);

INSERT INTO EZEN.MVCBOARD(IDX, NAME, TITLE, CONTENT, PASS)
VALUES(SEQ_BOARD_NUM.NEXTVAL, '이순신', '한산영화', '박해일 주연으로 7월말 상영예정입니다.', '0824');


INSERT INTO EZEN.MVCBOARD(IDX, NAME, TITLE, CONTENT, PASS)
VALUES(SEQ_BOARD_NUM.NEXTVAL, '이순신', '한산영화2', '박해일 주연으로 7월말 상영예정입니다.2', '0824');

INSERT INTO EZEN.MVCBOARD(IDX, NAME, TITLE, CONTENT, PASS)
VALUES(SEQ_BOARD_NUM.NEXTVAL, '이순신', '한산영화3', '박해일 주연으로 7월말 상영예정입니다.3', '0824');

INSERT INTO EZEN.MVCBOARD(IDX, NAME, TITLE, CONTENT, PASS)
VALUES(SEQ_BOARD_NUM.NEXTVAL, '이순신', '한산영화4', '박해일 주연으로 7월말 상영예정입니다.4', '0824');

INSERT INTO EZEN.MVCBOARD(IDX, NAME, TITLE, CONTENT, PASS)
VALUES(SEQ_BOARD_NUM.NEXTVAL, '이순신', '한산영화5', '박해일 주연으로 7월말 상영예정입니다.5', '0824');


INSERT INTO EZEN.MVCBOARD(IDX, NAME, TITLE, CONTENT, PASS)
VALUES(SEQ_BOARD_NUM.NEXTVAL, '이순신', '한산영화6', '박해일 주연으로 7월말 상영예정입니다.6', '0824');


INSERT INTO EZEN.MVCBOARD(IDX, NAME, TITLE, CONTENT, PASS)
VALUES(SEQ_BOARD_NUM.NEXTVAL, '이순신', '한산영화7', '박해일 주연으로 7월말 상영예정입니다.7', '0824');

INSERT INTO EZEN.MVCBOARD(IDX, NAME, TITLE, CONTENT, PASS)
VALUES(SEQ_BOARD_NUM.NEXTVAL, '이순신', '한산영화8', '박해일 주연으로 7월말 상영예정입니다.8', '0824');

INSERT INTO EZEN.MVCBOARD(IDX, NAME, TITLE, CONTENT, PASS)
VALUES(SEQ_BOARD_NUM.NEXTVAL, '이순신', '한산영화9', '박해일 주연으로 7월말 상영예정입니다.9', '0824');

INSERT INTO EZEN.MVCBOARD(IDX, NAME, TITLE, CONTENT, PASS)
VALUES(SEQ_BOARD_NUM.NEXTVAL, '이순신', '한산영화10', '박해일 주연으로 7월말 상영예정입니다.10', '0824');

INSERT INTO EZEN.MVCBOARD(IDX, NAME, TITLE, CONTENT, PASS)
VALUES(SEQ_BOARD_NUM.NEXTVAL, '이순신', '한산영화11', '박해일 주연으로 7월말 상영예정입니다.11', '0824');


INSERT INTO EZEN.MVCBOARD(IDX, NAME, TITLE, CONTENT, PASS)
VALUES(SEQ_BOARD_NUM.NEXTVAL, '이순신', '한산영화12', '박해일 주연으로 7월말 상영예정입니다.12', '0824');

INSERT INTO EZEN.MVCBOARD(IDX, NAME, TITLE, CONTENT, PASS)
VALUES(SEQ_BOARD_NUM.NEXTVAL, '이순신', '한산영화13', '박해일 주연으로 7월말 상영예정입니다.13', '0824');

INSERT INTO EZEN.MVCBOARD(IDX, NAME, TITLE, CONTENT, PASS)
VALUES(SEQ_BOARD_NUM.NEXTVAL, '이순신', '한산영화14', '박해일 주연으로 7월말 상영예정입니다.14', '0824');

INSERT INTO EZEN.MVCBOARD(IDX, NAME, TITLE, CONTENT, PASS)
VALUES(SEQ_BOARD_NUM.NEXTVAL, '이순신', '한산영화15', '박해일 주연으로 7월말 상영예정입니다.15', '0824');
COMMIT;

SELECT ID , PWD , rownum
FROM T_MEMBER;


-- 페이징 처리 쿼리문
SELECT * 
FROM MVCBOARD
ORDER BY IDX DESC ;


SELECT tb.*, rownum rNum FROM (
	SELECT * FROM MVCBOARD ORDER BY IDX DESC
)tb
;


SELECT * FROM (
	SELECT tb.*, rownum rNum FROM (
		SELECT * FROM MVCBOARD ORDER BY IDX DESC
	)tb
)
WHERE rNum BETWEEN 1 AND 5;



-- 파일 업로드와 다운로드용 테이블 생성

DROP TABLE myfile CASCADE CONSTRAINTS;

CREATE TABLE myfile (
	idx			NUMBER PRIMARY KEY,
	name		varchar2(50) NOT NULL,
	title		varchar2(200) NOT NULL,
	cate		varchar2(30),
	ofile		varchar2(100) NOT NULL,
	sfile		varchar2(100) NOT NULL,
	postdate	DATE DEFAULT sysdate NOT NULL 
);

COMMIT;


INSERT INTO EZEN.MYFILE
(IDX, NAME, TITLE, CATE, OFILE, SFILE)
VALUES(SEQ_BOARD_NUM.nextval, '이젠IT', '하지', '사진', 'test.jpg', '20220621.jpg');

ROLLBACK;

SELECT * FROM MYFILE ORDER BY IDX DESC ; 

SELECT * FROM MVCBOARD WHERE IDX = '34';


UPDATE MVCBOARD SET VISITCOUNT = VISITCOUNT + 1
WHERE IDX = '34';
COMMIT;


UPDATE MVCBOARD SET DOWNLOAD  = DOWNLOAD  + 1
WHERE IDX = '34';

COMMIT;


SELECT count(*) FROM MVCBOARD WHERE PASS = 0824 AND IDX = 32;


DELETE FROM MVCBOARD WHERE IDX = '32';


ROLLBACK;


 SELECT COUNT(*) FROM MVCBOARD WHERE PASS = :1  AND IDX = :2;
 OriginalSql = SELECT COUNT(*) FROM MVCBOARD WHERE PASS = ? AND IDX = ?, Error Msg = ORA-01008



 UPDATE MVCBOARD 
 SET TITLE ='이방원2', NAME ='여름비2', CONTENT = '비가 오고 있습니다.2', OFILE ='icon22.png', SFILE =''
 WHERE IDX ='' AND PASS = '';
 
 ROLLBACK;
 
 
 
 
 
 

