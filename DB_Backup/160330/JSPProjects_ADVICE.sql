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
-- Table structure for table `ADVICE`
--

DROP TABLE IF EXISTS `ADVICE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ADVICE` (
  `advice_no` int(11) NOT NULL,
  `member_no` int(11) NOT NULL,
  `advice_type` varchar(50) NOT NULL,
  `advice_content` varchar(2000) NOT NULL,
  `advice_date` datetime NOT NULL,
  `advice_recontent` varchar(2000) NOT NULL,
  `advice_redate` datetime NOT NULL,
  PRIMARY KEY (`advice_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ADVICE`
--

LOCK TABLES `ADVICE` WRITE;
/*!40000 ALTER TABLE `ADVICE` DISABLE KEYS */;
INSERT INTO `ADVICE` VALUES (0,0,'상담종류','신청내용','2016-03-28 19:05:12','답변내용','2016-03-28 19:05:12'),(1,0,'상담종류','신청내용','2016-03-28 19:05:30','답변내용','2016-03-28 19:05:30');
/*!40000 ALTER TABLE `ADVICE` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-03-30 20:36:15
