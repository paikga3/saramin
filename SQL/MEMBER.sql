CREATE TABLE MEMBER 
(member_no INT NOT NULL PRIMARY KEY, 
member_email VARCHAR(50) NOT NULL, 
member_pw VARCHAR(50) NOT NULL, 
member_name VARCHAR(20) NOT NULL, 
member_joindate DATETIME NOT NULL);

SELECT @@AUTOCOMMIT;
COMMIT;
USE JSPProjects;
SELECT * FROM MEMBER;
SELECT SYSDATE();
INSERT INTO MEMBER VALUES(1000, 'admin@admin', 'admin', '관리자', SYSDATE());
SELECT MAX(member_no)+1 FROM MEMBER;
INSERT INTO MEMBER VALUES((SELECT MAX(member_no)+1 FROM MEMBER mb), 'test@naver.com', 'test', 'test', SYSDATE());

SELECT DATE_FORMAT(member_joindate, '%Y-%m-%d / %H:%i:%s') FROM MEMBER;

SELECT * FROM MEMBER;
SELECT member_no, member_email, member_pw FROM MEMBER WHERE member_email = '이메일';

SELECT member_no FROM MEMBER WHERE member_email = '이메일';