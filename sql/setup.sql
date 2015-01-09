CREATE DATABASE  IF NOT EXISTS `shortener` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `shortener`;
-- MySQL dump 10.13  Distrib 5.6.17, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: shortener
-- ------------------------------------------------------
-- Server version	5.6.21

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
-- Table structure for table `links`
--

DROP TABLE IF EXISTS `links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `links` (
  `url` varchar(100) NOT NULL,
  `shorturl` varchar(15) NOT NULL,
  `created` int(11) NOT NULL,
  PRIMARY KEY (`shorturl`),
  UNIQUE KEY `shorturl_UNIQUE` (`shorturl`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `links`
--

LOCK TABLES `links` WRITE;
/*!40000 ALTER TABLE `links` DISABLE KEYS */;
INSERT INTO `links` VALUES ('http://www.google.com/','google',0),('https://github.com/stretchprojects','github',0),('http://www.twitter.com/StretchProjects','twitter',0),('http://www.youtube.com/StretchProjects','youtube',0);
/*!40000 ALTER TABLE `links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `track`
--

DROP TABLE IF EXISTS `track`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `track` (
  `SHORTURL` varchar(15) NOT NULL,
  `REQUEST_TIME` int(11) NOT NULL,
  `REMOTE_ADDR` varchar(15) DEFAULT NULL,
  `SERVER_PROTOCOL` varchar(10) DEFAULT NULL,
  `HTTPS` varchar(45) DEFAULT NULL,
  `HTTP_USER_AGENT` varchar(250) DEFAULT NULL,
  `HTTP_REFERER` varchar(45) DEFAULT NULL,
  `REMOTE_CITY` varchar(45) DEFAULT NULL,
  `REMOTE_COUNTRY` varchar(45) DEFAULT NULL,
  KEY `SHORTURL_idx` (`SHORTURL`),
  CONSTRAINT `SHORTURL_FK` FOREIGN KEY (`SHORTURL`) REFERENCES `links` (`shorturl`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `track`
--

/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-01-04 15:08:42
