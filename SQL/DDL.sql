show variables like 'c%';
show databases;

# DB 생성시 캐릭터 셋 지정 utf8mb4
CREATE DATABASE test02 DEFAULT CHARACTER SET utf8mb4;

# 대소문자 구분 함
use test02;
show tables;
CREATE TABLE AAAAA (a int);

SELECT * FROM aaaaa;
SELECT * FROM AAAAA;

# 테스트
INSERT INTO AAAAA VALUES(111);
SELECT * FROM AAAAA;

use test;
show tables;
SELECT * FROM tab_important;

# 프로젝트 DB 및 사용자 계정 생성
CREATE DATABASE JSPProjects DEFAULT CHARACTER SET utf8mb4;
CREATE USER 'user01'@'%' identified by '1234';
GRANT ALL PRIVILEGES ON JSPProjects.* TO 'user01'@'%';
FLUSH PRIVILEGES;