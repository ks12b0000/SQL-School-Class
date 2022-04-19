/*
	* sql�� �̿��� ������ ����
	* ���� ���̺�
	* 
	* ���� ���̺��� �������̵�, �����̸�, ����, ���, ����, ������ �Ӽ����� �����ǰ�,
	* �������̵� �Ӽ��� �⺻Ű�̴�.
	* �����̸��� ��� �Ӽ��� ���� �ݵ�� �Է��ؾ� �ϰ�,
	* ������ �Ӽ��� ���� �Է����� ������ 0�� �⺻���� �Էµǵ��� ���� ���̺��� �����Ͻÿ�.
*/
CREATE TABLE ���� (
	�������̵�		VARCHAR(20) NOT NULL
	,�����̸� 		VARCHAR(10) NOT NULL
	,����			INT
	,��� 		VARCHAR(10) NOT NULL
	,����			VARCHAR(20)
	,������		INT		DEFAULT 0
	,PRIMARY KEY(�������̵�)
);

DROP TABLE ����; 

 /*
  * ��ǰ ���̺��� ��ǰ��ȣ, ��ǰ��, �����, �ܰ�, ������ü �Ӽ����� �����ǰ�,
  * ��ǰ��ȣ �Ӽ��� �⺻Ű�̴�.
  * ������� �׻� 0�� �̻� 10,000�� ���ϸ� �����ϵ��� ��ǰ ���̺��� �����Ͻÿ�.
  */
 
CREATE TABLE ��ǰ (
	��ǰ��ȣ	char(3)  NOT NULL 
	,��ǰ��	varchar(20)
	,�����	int
	,�ܰ�		int
	,������ü	varchar(20)
	,PRIMARY key(��ǰ��ȣ)
	,CHECK(����� >= 0 AND ����� <= 10000)
);

/*
 * �ֹ� ���̺��� �ֹ���ȣ, �ֹ�����, �ֹ���ǰ, ����, �����, �ֹ����� �Ӽ����� �����ǰ�,
 * �ֹ���ȣ �Ӽ��� �⺻Ű��.
 * �ֹ����� �Ӽ��� ���� ���̺��� �������̵� �Ӽ��� �����ϴ� �ܷ�Ű�̰�,
 * �ֹ���ǰ �Ӽ��� ��ǰ ���̺��� ��ǰ��ȣ �Ӽ��� �����ϴ� �ܷ�Ű�� �ǵ���
 * �ֹ� ���̺��� �����Ͻÿ�.
 */

CREATE TABLE �ֹ� (
	�ֹ���ȣ	char(3) NOT NULL
	,�ֹ�����	varchar(20)
	,�ֹ���ǰ	char(3)
	,����		int
	,�����	varchar(30)
	,�ֹ�����	DATE
	,PRIMARY key(�ֹ���ȣ)
	,FOREIGN key(�ֹ�����) REFERENCES ����(�������̵�)
	,FOREIGN key(�ֹ���ǰ) REFERENCES ��ǰ(��ǰ��ȣ)
);

/*
 * ��۾�ü ���̺��� ��ü��ȣ, ��ü��, �ּ�, ��ȭ��ȣ �Ӽ����� �����ǰ�,
 * ��ü��ȣ �Ӽ��� �⺻Ű��.
 * ��۾�ü ���̺��� �����Ͻÿ�.
 */

CREATE TABLE ��۾�ü(
	��ü��ȣ	char(3) NOT NULL
	,��ü��	varchar(20)
	,�ּ�		varchar(30)
	,��ȭ��ȣ	varchar(20)
	,PRIMARY KEY(��ü��ȣ)	
);





