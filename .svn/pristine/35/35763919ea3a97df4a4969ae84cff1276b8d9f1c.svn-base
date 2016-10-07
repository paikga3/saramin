CREATE TABLE ADVICE 
(advice_no INT NOT NULL PRIMARY KEY,
member_no INT NOT NULL, 
advice_type VARCHAR(50) NOT NULL, 
advice_content VARCHAR(6000) NOT NULL, 
advice_date DATETIME NOT NULL, 
advice_redate DATETIME,
advice_count INT NOT NULL,
advice_re_count INT NOT NULL);

alter table ADVICE modify column advice_redate DATETIME;
DESC ADVICE;

USE JSPProjects;
SELECT * FROM ADVICE;
INSERT INTO ADVICE VALUES(1, 1000, '관리자', '관리자', SYSDATE(), NULL, 0, 0);
SELECT MAX(advice_no)+1 FROM ADVICE;
INSERT INTO ADVICE VALUES((SELECT MAX(advice_no)+1 FROM ADVICE ad), 1000, '상담종류13', '신청내용13', SYSDATE(), SYSDATE(), 0, 0);

SET @ROWNUM := 0;

SELECT * FROM ADVICE adv INNER JOIN MEMBER mbr USING (member_no) ORDER BY adv.advice_no DESC;

SELECT (@ROWNUM := @ROWNUM + 1) AS ro, advlist.*
FROM (SELECT * FROM ADVICE adv INNER JOIN MEMBER mbr USING (member_no) ORDER BY adv.advice_no DESC) AS advlist;

SET @ROWNUM := 0;
SELECT * FROM (
SELECT (@ROWNUM := @ROWNUM + 1) AS ro, advlist.* 
FROM (SELECT * FROM ADVICE adv INNER JOIN MEMBER mbr USING (member_no)) AS advlist ORDER BY advlist.advice_no DESC) AS advlistordered
WHERE ro BETWEEN 3 AND 5;

SELECT * FROM (SELECT (@ROWNUM := @ROWNUM + 1) AS ro, advlist.* FROM (SELECT * FROM ADVICE adv INNER JOIN MEMBER mbr USING (member_no)) AS advlist ORDER BY advlist.advice_no DESC) AS advlistordered WHERE ro BETWEEN 3 AND 5;

SELECT * FROM (SELECT (@ROWNUM := @ROWNUM + 1) AS ro, advlist.* FROM (SELECT * FROM ADVICE adv INNER JOIN MEMBER mbr USING (member_no)) AS advlist ORDER BY advlist.advice_no DESC) AS advlistordered;

SELECT DATE_FORMAT(member_joindate, '%y-%m-%d %H:%i') FROM MEMBER;

#최종
#컬럼 : 
# ro, member_no, advice_no, advice_type, advice_content, advice_date_s, advice_redate_s,
# advice_count, advice_re_count, member_email, member_pw, member_name
SET @ROWNUM := 0;
SELECT ro, member_no, advice_no, advice_type, advice_content, 
DATE_FORMAT(advice_date, '%y-%m-%d %H:%i') advice_date_s, 
DATE_FORMAT(advice_redate, '%y-%m-%d %H:%i') advice_redate_s, 
advice_count, advice_re_count, member_email, member_pw, member_name FROM (
SELECT (@ROWNUM := @ROWNUM + 1) AS ro, advlist.* 
FROM (SELECT * FROM ADVICE adv INNER JOIN MEMBER mbr USING (member_no)) AS advlist ORDER BY advlist.advice_no DESC) AS advlistordered
WHERE ro BETWEEN 3 AND 5;

#복사용 한줄 표기
SELECT ro, member_no, advice_no, advice_type, advice_content, DATE_FORMAT(advice_date, '%y-%m-%d %H:%i') advice_date_s, DATE_FORMAT(advice_redate, '%y-%m-%d %H:%i') advice_redate_s, advice_count, advice_re_count, member_email, member_pw, member_name FROM (SELECT (@ROWNUM := @ROWNUM + 1) AS ro, advlist.* FROM (SELECT * FROM ADVICE adv INNER JOIN MEMBER mbr USING (member_no)) AS advlist ORDER BY advlist.advice_no DESC) AS advlistordered WHERE ro BETWEEN 3 AND 5;

SELECT COUNT(advice_no) FROM ADVICE adv;

#입력
INSERT INTO ADVICE VALUES((SELECT MAX(advice_no)+1 FROM ADVICE ad), 1000, '상담종류', '제목', SYSDATE(), NULL, 0, 0);

SELECT * FROM ADVICE ORDER BY advice_date DESC;

#조회수 증가
SELECT MAX(advice_count)+1 FROM ADVICE adv;
UPDATE ADVICE SET advice_count = 20 WHERE advice_no = 10;


