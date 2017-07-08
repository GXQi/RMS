-- MySQL dump 10.13  Distrib 5.7.16, for Linux (x86_64)
--
-- Host: localhost    Database: rms
-- ------------------------------------------------------
-- Server version	5.7.16

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
-- Table structure for table `eductionexperience`
--

DROP TABLE IF EXISTS `eductionexperience`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eductionexperience` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `phonenumber` char(11) DEFAULT NULL,
  `school` varchar(40) DEFAULT NULL,
  `degree` varchar(10) DEFAULT NULL,
  `major` varchar(30) DEFAULT NULL,
  `graduation_time` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `phonenumber` (`phonenumber`),
  CONSTRAINT `eductionexperience_ibfk_1` FOREIGN KEY (`phonenumber`) REFERENCES `resume` (`phonenumber`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eductionexperience`
--

LOCK TABLES `eductionexperience` WRITE;
/*!40000 ALTER TABLE `eductionexperience` DISABLE KEYS */;
INSERT INTO `eductionexperience` VALUES (28,'17629034550','西安邮电','0','软件工程','2017-06-21'),(29,'17629034550','北京邮电','0','软件工程','2021-07-01'),(30,'15829045670','西安邮电大学','1','软件工程','2017-06-30'),(32,'15829035668','西安邮电大学','1','软件工程','2017-06-30'),(33,'17629034551','西安邮电大学','1','软件工程','2017-06-30'),(34,'17629034552','西安邮电大学','1','软件工程','2017-06-30'),(35,'17629034553','西安邮电大学','1','软件工程','2017-06-30'),(36,'17629034554','西安邮电大学','1','软件工程','2017-06-30'),(37,'17629034555','西安邮电大学','1','软件工程','2017-06-30'),(38,'17629034556','西安邮电大学','1','软件工程','2017-06-30'),(39,'17629034557','西安邮电大学','1','软件工程','2017-06-30');
/*!40000 ALTER TABLE `eductionexperience` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employee` (
  `phonenumber` char(11) NOT NULL,
  `password` varchar(20) DEFAULT NULL,
  `nickname` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`phonenumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES ('17629034550','111111','马辉');
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projectexperience`
--

DROP TABLE IF EXISTS `projectexperience`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `projectexperience` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `phonenumber` char(11) DEFAULT NULL,
  `project_name` varchar(50) DEFAULT NULL,
  `project_role` varchar(20) DEFAULT NULL,
  `project_time_start` varchar(40) DEFAULT NULL,
  `work_content` varchar(2000) DEFAULT NULL,
  `project_time_end` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `phonenumber` (`phonenumber`),
  CONSTRAINT `projectexperience_ibfk_1` FOREIGN KEY (`phonenumber`) REFERENCES `resume` (`phonenumber`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projectexperience`
--

LOCK TABLES `projectexperience` WRITE;
/*!40000 ALTER TABLE `projectexperience` DISABLE KEYS */;
INSERT INTO `projectexperience` VALUES (25,'17629034550','xxx','xxx','2017-06-21','xxxxx ','2017-06-30'),(26,'15829045670','xxxx','组长','2017-06-07','这是描述 ','2017-06-30'),(28,'15829035668','xx','组长','2017-06-01','xxxxxx     ','2017-06-29'),(36,'17629034551','xx','组长','2017-06-01','xxxxxx     ','2017-06-29'),(37,'17629034552','xx','组长','2017-06-01','xxxxxx     ','2017-06-29'),(38,'17629034553','xx','组长','2017-06-01','xxxxxx     ','2017-06-29'),(39,'17629034554','xx','组长','2017-06-01','xxxxxx     ','2017-06-29'),(40,'17629034555','xx','组长','2017-06-01','xxxxxx     ','2017-06-29'),(41,'17629034556','xx','组长','2017-06-01','xxxxxx     ','2017-06-29'),(42,'17629034557','xx','组长','2017-06-01','xxxxxx     ','2017-06-29');
/*!40000 ALTER TABLE `projectexperience` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resume`
--

DROP TABLE IF EXISTS `resume`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resume` (
  `phonenumber` char(11) NOT NULL,
  `name` varchar(10) DEFAULT NULL,
  `sex` char(2) DEFAULT NULL,
  `email` varchar(20) DEFAULT NULL,
  `skill` varchar(20) DEFAULT NULL,
  `work_time` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`phonenumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resume`
--

LOCK TABLES `resume` WRITE;
/*!40000 ALTER TABLE `resume` DISABLE KEYS */;
INSERT INTO `resume` VALUES ('15829035668','李佩赏','女','li@163.com','前端','3'),('15829045670','胡婷婷','女','hu@163.com','前端开发','1'),('17629034550','马辉','男','ismahui@163.com','android','5'),('17629034551','张三','女','a@163.com','前端','3'),('17629034552','李四','女','b@163.com','前端开发','1'),('17629034553','王五','男','c@163.com','android','5'),('17629034554','小明','男','c@163.com','前端','5'),('17629034555','小红','男','c@163.com','android','5'),('17629034556','小张','男','c@163.com','前端','4'),('17629034557','小王','男','c@163.com','android','0');
/*!40000 ALTER TABLE `resume` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resumepath`
--

DROP TABLE IF EXISTS `resumepath`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resumepath` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `phonenumber` char(11) DEFAULT NULL,
  `path` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `phonenumber` (`phonenumber`),
  CONSTRAINT `resumepath_ibfk_1` FOREIGN KEY (`phonenumber`) REFERENCES `resume` (`phonenumber`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resumepath`
--

LOCK TABLES `resumepath` WRITE;
/*!40000 ALTER TABLE `resumepath` DISABLE KEYS */;
INSERT INTO `resumepath` VALUES (30,'17629034550','马小辉.pdf');
/*!40000 ALTER TABLE `resumepath` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workexperience`
--

DROP TABLE IF EXISTS `workexperience`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `workexperience` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `phonenumber` char(11) DEFAULT NULL,
  `company` varchar(50) DEFAULT NULL,
  `position` varchar(50) DEFAULT NULL,
  `work_time_start` varchar(40) DEFAULT NULL,
  `work_content` varchar(2000) DEFAULT NULL,
  `work_time_end` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `phonenumber` (`phonenumber`),
  CONSTRAINT `workexperience_ibfk_1` FOREIGN KEY (`phonenumber`) REFERENCES `resume` (`phonenumber`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workexperience`
--

LOCK TABLES `workexperience` WRITE;
/*!40000 ALTER TABLE `workexperience` DISABLE KEYS */;
INSERT INTO `workexperience` VALUES (28,'17629034550','xxx有限公司','安卓开发工程师','2017-06-01','这是内容','2017-06-30'),(29,'17629034550','xxxxx公司','前端开发','2017-06-01','这是内容','2017-06-30'),(30,'15829045670','xx有限公司','前端开发工程师','2017-06-01','这是内容','2017-06-30'),(32,'15829035668','xx有限公司','前端开发工程师','2017-06-01','这是内容','2017-06-30'),(33,'17629034551','xxx有限公司','安卓开发工程师','2017-06-01','这是内容','2017-06-30'),(34,'17629034552','xxxxx公司','前端开发','2017-06-01','这是内容','2017-06-30'),(35,'17629034553','xx有限公司','前端开发工程师','2017-06-01','这是内容','2017-06-30'),(36,'17629034554','xx有限公司','前端开发工程师','2017-06-01','这是内容','2017-06-30'),(37,'17629034555','xx有限公司','前端开发工程师','2017-06-01','这是内容','2017-06-30'),(38,'17629034556','xx有限公司','前端开发工程师','2017-06-01','这是内容','2017-06-30'),(39,'17629034557','xx有限公司','前端开发工程师','2017-06-01','这是内容','2017-06-30');
/*!40000 ALTER TABLE `workexperience` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-07-06 23:42:54
