--JDBC �� ���� (USERNAME/PWD) : C##JDBC / JDBC
-- * ���� ����
CREATE USER C##JDBC IDENTIFIED BY JDBC;

-- * ���� �ο�
GRANT CONNECT, RESOURCE TO C##JDBC;

ALTER USER "C##JDBC" DEFAULT TABLESPACE USERS QUOTA UNLIMITED ON USERS;

--������ �������� ���� ���� ����----------------------------------------------------
-- ȸ�� ������ ������ ���̺� (MEMBER)
CREATE TABLE MEMBER (
    USERNO NUMBER PRIMARY KEY,           -- ȸ����ȣ
    USERID VARCHAR2(20) NOT NULL UNIQUE, -- ȸ�����̵�
    USERPW VARCHAR2(20) NOT NULL,        -- ȸ�� ��й�ȣ
    USERNAME VARCHAR2(20) NOT NULL,      -- �̸�
    GENDER CHAR(1) CHECK (GENDER IN('M','F')), -- ���� ('M', 'F')
    AGE NUMBER,                          -- ����            
    EMAIL VARCHAR2(30),                  -- �̸���
    ADDRESS VARCHAR2(100),               -- �ּ�
    PHONE VARCHAR2(13),                  -- ����ó
    HOBBY VARCHAR2(50),                  -- ���
    ENROLLDATE DATE DEFAULT SYSDATE NOT NULL -- ������
);
SELECT * FROM MEMBER ;


-- * ȸ����ȣ�� ����� ������ ����
DROP SEQUENCE SEQ_USERNO;
CREATE SEQUENCE SEQ_USERNO
NOCACHE;

-- * ���õ����� 2�� �߰�
INSERT INTO MEMBER
    VALUES (SEQ_USERNO.NEXTVAL, 'admin','1234','������','M',20, 'admin@kh.or.kr', '����','010-1111-1212', null, '2020-07-30');

INSERT INTO MEMBER
    VALUES (SEQ_USERNO.NEXTVAL, 'user','1234','���ֿ�','F',20, 'jw@kh.or.kr', '����','010-1212-1212', null, '2002-12-10');

COMMIT;

--------------------------------------------------------------------------------

-- �׽�Ʈ�� ���̺� (TEST)
CREATE TABLE TEST (
    TNO NUMBER,
    TNAME VARCHAR2(30),
    TDATE DATE
);

SELECT * FROM TEST;

INSERT INTO TEST VALUES (1, '��ٿ�', SYSDATE);

COMMIT;

--------------------------------------------------------------------------------
-- �̸��� '��'�� ���Ե� ȸ�� ��ȸ
SELECT * FROM MEMBER WHERE USERNAME LIKE '%%';