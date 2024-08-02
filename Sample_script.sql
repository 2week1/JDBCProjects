--JDBC 용 계정 (USERNAME/PWD) : C##JDBC / JDBC
-- * 계정 생성
CREATE USER C##JDBC IDENTIFIED BY JDBC;

-- * 권한 부여
GRANT CONNECT, RESOURCE TO C##JDBC;

ALTER USER "C##JDBC" DEFAULT TABLESPACE USERS QUOTA UNLIMITED ON USERS;

--관리자 계정으로 위의 내용 진행----------------------------------------------------
-- 회원 정보를 저장할 테이블 (MEMBER)
CREATE TABLE MEMBER (
    USERNO NUMBER PRIMARY KEY,           -- 회원번호
    USERID VARCHAR2(20) NOT NULL UNIQUE, -- 회원아이디
    USERPW VARCHAR2(20) NOT NULL,        -- 회원 비밀번호
    USERNAME VARCHAR2(20) NOT NULL,      -- 이름
    GENDER CHAR(1) CHECK (GENDER IN('M','F')), -- 성별 ('M', 'F')
    AGE NUMBER,                          -- 나이            
    EMAIL VARCHAR2(30),                  -- 이메일
    ADDRESS VARCHAR2(100),               -- 주소
    PHONE VARCHAR2(13),                  -- 연락처
    HOBBY VARCHAR2(50),                  -- 취미
    ENROLLDATE DATE DEFAULT SYSDATE NOT NULL -- 가입일
);
SELECT * FROM MEMBER ;


-- * 회원번호로 사용할 시퀀스 생성
DROP SEQUENCE SEQ_USERNO;
CREATE SEQUENCE SEQ_USERNO
NOCACHE;

-- * 샘플데이터 2개 추가
INSERT INTO MEMBER
    VALUES (SEQ_USERNO.NEXTVAL, 'admin','1234','관리자','M',20, 'admin@kh.or.kr', '서울','010-1111-1212', null, '2020-07-30');

INSERT INTO MEMBER
    VALUES (SEQ_USERNO.NEXTVAL, 'user','1234','이주원','F',20, 'jw@kh.or.kr', '서울','010-1212-1212', null, '2002-12-10');

COMMIT;

--------------------------------------------------------------------------------

-- 테스트용 테이블 (TEST)
CREATE TABLE TEST (
    TNO NUMBER,
    TNAME VARCHAR2(30),
    TDATE DATE
);

SELECT * FROM TEST;

INSERT INTO TEST VALUES (1, '기다운', SYSDATE);

COMMIT;

--------------------------------------------------------------------------------
-- 이름에 '리'가 포함된 회원 조회
SELECT * FROM MEMBER WHERE USERNAME LIKE '%%';