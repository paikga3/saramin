-- MySQL dump 10.13  Distrib 5.7.9, for Win64 (x86_64)
--
-- Host: share.hoonnn.org    Database: JSPProjects
-- ------------------------------------------------------
-- Server version	5.5.5-10.1.12-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `MEMBER`
--

DROP TABLE IF EXISTS `MEMBER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MEMBER` (
  `member_no` int(11) NOT NULL,
  `member_email` varchar(50) NOT NULL,
  `member_pw` varchar(50) NOT NULL,
  `member_name` varchar(20) NOT NULL,
  `member_joindate` datetime NOT NULL,
  PRIMARY KEY (`member_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MEMBER`
--

LOCK TABLES `MEMBER` WRITE;
/*!40000 ALTER TABLE `MEMBER` DISABLE KEYS */;
INSERT INTO `MEMBER` VALUES (1,'1','1','1','2016-03-28 17:45:14'),(2,'이메일','비밀번호','이름','2016-03-28 17:45:41'),(1000,'admin@admin','admin','관리자','2016-03-29 20:14:04'),(1001,'test@test','test','test','2016-03-30 12:47:06'),(1002,'test@naver.com','test','test','2016-03-30 15:45:45'),(1003,'asdasd@asd.com','asdasdasd','asd','2016-03-30 17:13:50'),(1004,'asdasd@asdasd.com','asdasdasd','asdasdasd','2016-03-30 17:14:12'),(1005,'asdasd@asdasd.com','asdasdasd','asdasd','2016-03-30 17:14:50'),(1006,'123@123.com','00000000','00','2016-03-30 17:17:17'),(1007,'asdasd@asdasd.co','asdasdasda','asdasdasdda','2016-03-30 18:23:06'),(1008,'asdasd@asdasd.coas','asdasasd','a','2016-03-30 19:38:10'),(1009,'123@1.co','12311111','','2016-03-30 20:02:21'),(1010,'111@111.com','11111111','111','2016-03-30 20:18:08'),(1011,'1@naver.com','1234567','바보','2016-03-30 20:42:33'),(1012,'p@naver.com','1111','나는비밀번호4자리','2016-03-30 20:43:21'),(1013,'a@l.co','a','a','2016-03-31 09:53:36'),(1014,'1234@1234.com','asdasdasd','asdasdasd','2016-03-31 09:58:41'),(1015,'12345@asd.com','123123123','123','2016-03-31 20:40:35'),(1016,'qwer86755@naver.com','00000000','박창훈','2016-04-02 09:50:40'),(1017,'paikga3@naver.com','11113333','호랑이','2016-04-03 15:36:16'),(1018,'vampire@naver.com','rkqtlrdl','김갑식','2016-04-05 15:55:01'),(1019,'hoon8675@gmail.com','00000000','박창훈','2016-04-05 17:04:15');
/*!40000 ALTER TABLE `MEMBER` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-04-05 18:10:38
