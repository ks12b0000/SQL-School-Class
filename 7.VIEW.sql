/*
 * �� ���̺��� ����� vip�� ���� �����̵�,���̸�,���̷� ������
 * �並 ������̶�� �̸����� �����Ͻÿ�.
 * �׷� ���� ����� ���� ��� ������ �˻��Ͻÿ�.
 */
DROP VIEW �����;
CREATE VIEW ����� (�����̵�,���̸�,����)
AS SELECT �����̵�,���̸�,����
FROM ��
WHERE ��� = 'vip'
WITH CHECK OPTION;

CREATE VIEW �����
AS SELECT �����̵�,���̸�,����
FROM ��
WHERE ��� = 'vip'
WITH CHECK OPTION;

SELECT *
FROM �����;


/*
 * ��ǰ ���̺��� ������ü�� ��ǰ���� ������ �並 ��ü����ǰ�� ��� �̸����� �����Ͻÿ�.
 * �׷� ���� ��ü����ǰ�� ���� ��� ������ �˻��Ͻÿ�.
 */

DROP VIEW ��ü����ǰ��;
CREATE VIEW ��ü����ǰ�� (������ü,��ǰ��)
AS SELECT ������ü,COUNT(*) 
FROM ��ǰ
GROUP BY ������ü
WITH CHECK OPTION;

SELECT *
FROM ��ü����ǰ��;


-- ����� �信�� ���̰� 25�� �̻��� ���� ���� ��� ������ �˻��Ͻÿ�.

SELECT *
FROM �����
WHERE ���� >= 25;


CREATE VIEW ��ǰ1
AS SELECT ��ǰ��ȣ,���,������ü 
FROM ��ǰ
WITH CHECK OPTION;

SELECT *
FROM ��ǰ1;


CREATE VIEW ��ǰ2
AS SELECT ��ǰ��,���,������ü 
FROM ��ǰ
WITH CHECK OPTION;

SELECT *
FROM ��ǰ2;


/*
 * ��ǰ��ȣ�� p08,����� 1000, ������ü�� �ż���ǰ�� ���ο� ��ǰ�� ������
 * ��ǰ1 �信 �����Ͻÿ�.
 * �׷� ���� ��ǰ1�信 �ִ� ��� ������ �˻��Ͻÿ�
 */


INSERT INTO ��ǰ1
VALUES ('p08',1000,'�ż���ǰ');
COMMIT;

SELECT * FROM ��ǰ1;

--�⺻Ű ��� ���� �ȵ�.
INSERT INTO ��ǰ2
VALUES ('�ÿ��ø�',1000,'�ż���ǰ');






















