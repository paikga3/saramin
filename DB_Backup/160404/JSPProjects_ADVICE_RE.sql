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
-- Table structure for table `ADVICE_RE`
--

DROP TABLE IF EXISTS `ADVICE_RE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ADVICE_RE` (
  `advice_re_no` int(11) NOT NULL,
  `advice_no` int(11) NOT NULL,
  `member_no` int(11) NOT NULL,
  `advice_content` varchar(6000) DEFAULT NULL,
  `advice_re_date` datetime NOT NULL,
  PRIMARY KEY (`advice_re_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ADVICE_RE`
--

LOCK TABLES `ADVICE_RE` WRITE;
/*!40000 ALTER TABLE `ADVICE_RE` DISABLE KEYS */;
INSERT INTO `ADVICE_RE` VALUES (1,12,1000,'내용','2016-04-01 17:54:22'),(2,12,1000,'내용2','2016-04-01 17:54:40'),(3,12,10012,'내용2','2016-04-01 19:53:28'),(4,12,1012,'내용2','2016-04-01 19:54:00'),(5,12,1011,'내용2','2016-04-01 19:54:15'),(6,14,1000,'상담해드릴게요. 상담해드릴게요. 상담해드릴게요. 상담해드릴게요. 상담해드릴게요. 상담해드릴게요. 상담해드릴게요. 상담해드릴게요. 상담해드릴게요. 상담해드릴게요. 상담해드릴게요. 상담해드릴게요. 상담해드릴게요. 상담해드릴게요. ','2016-04-01 19:58:14'),(7,14,1012,'감사합니다.','2016-04-01 19:58:49'),(8,14,1011,'여기 좋은 사이트네요.','2016-04-01 19:58:58'),(9,14,1010,'자주올게요.','2016-04-01 19:59:07'),(10,17,1000,'내용1111','2016-04-01 21:21:48'),(11,18,1003,'bbbbbbb','2016-04-01 21:22:48'),(12,19,1003,'안녕???','2016-04-01 21:42:54'),(13,20,1003,'오늘은 여기까지','2016-04-01 21:44:19'),(14,21,1016,'즐거운 주말 보내세요\r\n월요일에 뵈요 ㅎㅎㅎ','2016-04-02 09:51:50');
/*!40000 ALTER TABLE `ADVICE_RE` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-04-04  8:32:25
