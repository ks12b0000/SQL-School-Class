SELECT * FROM topic;

INSERT INTO TOPIC 
		(id,title,DESCRIPTION,CREATED)
		VALUES (
				SEQ_TOPIC.NEXTVAL,
				'SQL Server',
				'SQL Server is...',
				SYSDATE
				);
			
INSERT INTO TOPIC 
		(id,title,DESCRIPTION,CREATED)
		VALUES (
				SEQ_TOPIC.NEXTVAL,
				'SQL Server1',
				'SQL Server is1...',
				SYSDATE
				);
COMMIT;

INSERT INTO TOPIC 
		(id,title,DESCRIPTION,CREATED)
		VALUES (
				SEQ_TOPIC.NEXTVAL,
				'SQL Server2',
				'SQL Server is2...',
				SYSDATE
				);
COMMIT;
DELETE topic;

SELECT id,title,CREATED 
FROM TOPIC t ;

SELECT *
FROM TOPIC t 
WHERE id = 1;


UPDATE topic 
		SET 
			title = 'MSSQL',
			DESCRIPTION = 'MSSQL is...'
		WHERE 
		  id = 3;
COMMIT;
SELECT * FROM TOPIC t ;

DELETE 
FROM TOPIC t 
WHERE id = 3;


DROP TABLE topic;


CREATE TABLE topic(
			id NUMBER NOT NULL,
			title varchar2(50) NOT NULL,
			description VARCHAR2(4000),
			created DATE NOT NULL,
			CONSTRAINT PK_TOPIC PRIMARY KEY(id)
);


SELECT  id,title
FROM topic
WHERE id = 2;


CREATE SEQUENCE SEQ_TOPIC;
INSERT INTO TOPIC 
		(id,title,DESCRIPTION,CREATED)
		VALUES (
				SEQ_TOPIC.NEXTVAL,
				'MongoDB',
				'MongoDB is ...',
				SYSDATE
				);

DELETE FROM TOPIC t ;
COMMIT;



SELECT SEQ_TOPIC.CURRVAL FROM DUAL ;



