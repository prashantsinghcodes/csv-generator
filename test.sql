-- MySQL dump 10.17  Distrib 10.3.14-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: info
-- ------------------------------------------------------
-- Server version	10.3.14-MariaDB-1:10.3.14+maria~bionic-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `TASK_EXECUTION`
--

DROP TABLE IF EXISTS `TASK_EXECUTION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TASK_EXECUTION` (
  `TASK_EXECUTION_ID` bigint(20) NOT NULL,
  `START_TIME` datetime DEFAULT NULL,
  `END_TIME` datetime DEFAULT NULL,
  `TASK_NAME` varchar(100) DEFAULT NULL,
  `EXIT_CODE` int(11) DEFAULT NULL,
  `EXIT_MESSAGE` varchar(2500) DEFAULT NULL,
  `ERROR_MESSAGE` varchar(2500) DEFAULT NULL,
  `LAST_UPDATED` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `EXTERNAL_EXECUTION_ID` varchar(255) DEFAULT NULL,
  `PARENT_EXECUTION_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`TASK_EXECUTION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TASK_EXECUTION`
--

LOCK TABLES `TASK_EXECUTION` WRITE;
/*!40000 ALTER TABLE `TASK_EXECUTION` DISABLE KEYS */;
INSERT INTO `TASK_EXECUTION` VALUES (1,'2019-04-18 23:51:54','2019-04-18 23:51:55','application',0,NULL,NULL,'2019-04-18 18:21:55',NULL,NULL),(2,'2019-04-18 23:57:02','2019-04-18 23:57:03','application',0,NULL,NULL,'2019-04-18 18:27:03',NULL,NULL),(3,'2019-04-18 23:57:27','2019-04-18 23:57:27','application',0,NULL,NULL,'2019-04-18 18:27:27',NULL,NULL),(4,'2019-04-18 23:57:44','2019-04-18 23:57:44','application',0,NULL,NULL,'2019-04-18 18:27:44',NULL,NULL);
/*!40000 ALTER TABLE `TASK_EXECUTION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TASK_EXECUTION_PARAMS`
--

DROP TABLE IF EXISTS `TASK_EXECUTION_PARAMS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TASK_EXECUTION_PARAMS` (
  `TASK_EXECUTION_ID` bigint(20) NOT NULL,
  `TASK_PARAM` varchar(2500) DEFAULT NULL,
  KEY `TASK_EXEC_PARAMS_FK` (`TASK_EXECUTION_ID`),
  CONSTRAINT `TASK_EXEC_PARAMS_FK` FOREIGN KEY (`TASK_EXECUTION_ID`) REFERENCES `TASK_EXECUTION` (`TASK_EXECUTION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TASK_EXECUTION_PARAMS`
--

LOCK TABLES `TASK_EXECUTION_PARAMS` WRITE;
/*!40000 ALTER TABLE `TASK_EXECUTION_PARAMS` DISABLE KEYS */;
INSERT INTO `TASK_EXECUTION_PARAMS` VALUES (3,'--spring.output.ansi.enabled=always'),(4,'--spring.output.ansi.enabled=always');
/*!40000 ALTER TABLE `TASK_EXECUTION_PARAMS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TASK_LOCK`
--

DROP TABLE IF EXISTS `TASK_LOCK`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TASK_LOCK` (
  `LOCK_KEY` char(36) NOT NULL,
  `REGION` varchar(100) NOT NULL,
  `CLIENT_ID` char(36) DEFAULT NULL,
  `CREATED_DATE` datetime(6) NOT NULL,
  PRIMARY KEY (`LOCK_KEY`,`REGION`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TASK_LOCK`
--

LOCK TABLES `TASK_LOCK` WRITE;
/*!40000 ALTER TABLE `TASK_LOCK` DISABLE KEYS */;
/*!40000 ALTER TABLE `TASK_LOCK` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TASK_SEQ`
--

DROP TABLE IF EXISTS `TASK_SEQ`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TASK_SEQ` (
  `ID` bigint(20) NOT NULL,
  `UNIQUE_KEY` char(1) NOT NULL,
  UNIQUE KEY `UNIQUE_KEY_UN` (`UNIQUE_KEY`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TASK_SEQ`
--

LOCK TABLES `TASK_SEQ` WRITE;
/*!40000 ALTER TABLE `TASK_SEQ` DISABLE KEYS */;
INSERT INTO `TASK_SEQ` VALUES (4,'0');
/*!40000 ALTER TABLE `TASK_SEQ` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TASK_TASK_BATCH`
--

DROP TABLE IF EXISTS `TASK_TASK_BATCH`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TASK_TASK_BATCH` (
  `TASK_EXECUTION_ID` bigint(20) NOT NULL,
  `JOB_EXECUTION_ID` bigint(20) NOT NULL,
  KEY `TASK_EXEC_BATCH_FK` (`TASK_EXECUTION_ID`),
  CONSTRAINT `TASK_EXEC_BATCH_FK` FOREIGN KEY (`TASK_EXECUTION_ID`) REFERENCES `TASK_EXECUTION` (`TASK_EXECUTION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TASK_TASK_BATCH`
--

LOCK TABLES `TASK_TASK_BATCH` WRITE;
/*!40000 ALTER TABLE `TASK_TASK_BATCH` DISABLE KEYS */;
/*!40000 ALTER TABLE `TASK_TASK_BATCH` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hibernate_sequence`
--

DROP TABLE IF EXISTS `hibernate_sequence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hibernate_sequence` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hibernate_sequence`
--

LOCK TABLES `hibernate_sequence` WRITE;
/*!40000 ALTER TABLE `hibernate_sequence` DISABLE KEYS */;
INSERT INTO `hibernate_sequence` VALUES (1);
/*!40000 ALTER TABLE `hibernate_sequence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'raghav@girnarsoft.com','Raghav'),(2,'lakshay@girnarsoft.com','Lakshay');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-04-19  0:27:37
