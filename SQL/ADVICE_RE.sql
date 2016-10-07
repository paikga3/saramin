CREATE TABLE ADVICE_RE
(advice_re_no INT NOT NULL PRIMARY KEY,
advice_no INT NOT NULL,
member_no INT NOT NULL, 
advice_content VARCHAR(6000), 
advice_re_date DATETIME NOT NULL
);

SELECT * FROM ADVICE_RE ORDER BY advice_re_date DESC;

INSERT INTO ADVICE_RE VALUES(1, 1, 1000, '내용', SYSDATE());
SELECT MAX(advice_re_no)+1 FROM ADVICE_RE ar;
INSERT INTO ADVICE_RE VALUES((SELECT MAX(advice_re_no)+1 FROM ADVICE_RE ar), 14, 1010, '자주올게요.', SYSDATE());

SELECT advice_re_no, member_no, member_name, advice_content, member_email, DATE_FORMAT(advice_re_date, '%y-%m-%d %H:%i') date FROM ADVICE_RE ar INNER JOIN MEMBER mbr USING (member_no)  WHERE advice_no = 12 ORDER BY advice_re_no;

SELECT MAX(advice_no) FROM ADVICE;
SELECT MAX(advice_re_count)+1 FROM ADVICE WHERE advice_no = 30;

#답변
INSERT INTO ADVICE_RE VALUES((SELECT MAX(advice_re_no)+1 FROM ADVICE_RE ar), advice_no, member_no, advice_content, SYSDATE());
UPDATE ADVICE SET advice_redate = SYSDATE(), advice_re_count = 3 WHERE advice_no = 30;
