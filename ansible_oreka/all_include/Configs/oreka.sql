-- MySQL dump 10.13  Distrib 5.1.73, for redhat-linux-gnu (x86_64)
--
-- Host: localhost    Database: orktest
-- ------------------------------------------------------
-- Server version	5.1.73

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
-- Table structure for table `orkdomain`
--

DROP TABLE IF EXISTS `orkdomain`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orkdomain` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orkdomain`
--

LOCK TABLES `orkdomain` WRITE;
/*!40000 ALTER TABLE `orkdomain` DISABLE KEYS */;
/*!40000 ALTER TABLE `orkdomain` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orkloginstring`
--

DROP TABLE IF EXISTS `orkloginstring`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orkloginstring` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `loginString` varchar(255) DEFAULT NULL,
  `domain_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKE1BDCCD28C2085EB` (`domain_id`),
  KEY `FKE1BDCCD263C94CCB` (`user_id`),
  CONSTRAINT `FKE1BDCCD263C94CCB` FOREIGN KEY (`user_id`) REFERENCES `orkuser` (`id`),
  CONSTRAINT `FKE1BDCCD28C2085EB` FOREIGN KEY (`domain_id`) REFERENCES `orkdomain` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orkloginstring`
--

LOCK TABLES `orkloginstring` WRITE;
/*!40000 ALTER TABLE `orkloginstring` DISABLE KEYS */;
INSERT INTO `orkloginstring` VALUES (1,'admin',NULL,1);
/*!40000 ALTER TABLE `orkloginstring` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orkport`
--

DROP TABLE IF EXISTS `orkport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orkport` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orkport`
--

LOCK TABLES `orkport` WRITE;
/*!40000 ALTER TABLE `orkport` DISABLE KEYS */;
/*!40000 ALTER TABLE `orkport` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orkportface`
--

DROP TABLE IF EXISTS `orkportface`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orkportface` (
  `name` varchar(255) NOT NULL,
  `port_id` int(11) DEFAULT NULL,
  `service_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `FK7BEA8D46552C890B` (`port_id`),
  KEY `FK7BEA8D46E3FED509` (`service_id`),
  CONSTRAINT `FK7BEA8D46E3FED509` FOREIGN KEY (`service_id`) REFERENCES `orkservice` (`id`),
  CONSTRAINT `FK7BEA8D46552C890B` FOREIGN KEY (`port_id`) REFERENCES `orkport` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orkportface`
--

LOCK TABLES `orkportface` WRITE;
/*!40000 ALTER TABLE `orkportface` DISABLE KEYS */;
/*!40000 ALTER TABLE `orkportface` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orkprogram`
--

DROP TABLE IF EXISTS `orkprogram`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orkprogram` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `active` bit(1) NOT NULL,
  `cycle` int(11) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `direction` int(11) DEFAULT NULL,
  `discarded` bit(1) NOT NULL,
  `keepForHours` int(11) NOT NULL,
  `localParty` varchar(255) DEFAULT NULL,
  `maxDuration` int(11) NOT NULL,
  `minDuration` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `randomPercent` double NOT NULL,
  `recPerCycle` int(11) NOT NULL,
  `recordedSoFar` int(11) NOT NULL,
  `remoteParty` varchar(255) DEFAULT NULL,
  `startDay` int(11) DEFAULT NULL,
  `startTime` datetime DEFAULT NULL,
  `stopDay` int(11) DEFAULT NULL,
  `stopTime` datetime DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `creator_id` int(11) DEFAULT NULL,
  `targetPort_id` int(11) DEFAULT NULL,
  `targetUser_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK4AFE5A9C7B47625A` (`targetPort_id`),
  KEY `FK4AFE5A9CBEC550CA` (`creator_id`),
  KEY `FK4AFE5A9C89E4261A` (`targetUser_id`),
  CONSTRAINT `FK4AFE5A9C89E4261A` FOREIGN KEY (`targetUser_id`) REFERENCES `orkuser` (`id`),
  CONSTRAINT `FK4AFE5A9C7B47625A` FOREIGN KEY (`targetPort_id`) REFERENCES `orkport` (`id`),
  CONSTRAINT `FK4AFE5A9CBEC550CA` FOREIGN KEY (`creator_id`) REFERENCES `orkuser` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orkprogram`
--

LOCK TABLES `orkprogram` WRITE;
/*!40000 ALTER TABLE `orkprogram` DISABLE KEYS */;
/*!40000 ALTER TABLE `orkprogram` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orkprogtoseg`
--

DROP TABLE IF EXISTS `orkprogtoseg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orkprogtoseg` (
  `segId` int(11) NOT NULL,
  `progId` int(11) NOT NULL,
  KEY `FK84F4D2F887B13BE8` (`progId`),
  KEY `FK84F4D2F850B182D2` (`segId`),
  CONSTRAINT `FK84F4D2F850B182D2` FOREIGN KEY (`segId`) REFERENCES `orksegment` (`id`),
  CONSTRAINT `FK84F4D2F887B13BE8` FOREIGN KEY (`progId`) REFERENCES `orkprogram` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orkprogtoseg`
--

LOCK TABLES `orkprogtoseg` WRITE;
/*!40000 ALTER TABLE `orkprogtoseg` DISABLE KEYS */;
/*!40000 ALTER TABLE `orkprogtoseg` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orksegment`
--

DROP TABLE IF EXISTS `orksegment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orksegment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `direction` int(11) DEFAULT NULL,
  `duration` bigint(20) NOT NULL,
  `localEntryPoint` varchar(255) DEFAULT NULL,
  `localParty` varchar(255) DEFAULT NULL,
  `loginString` varchar(255) DEFAULT NULL,
  `portName` varchar(255) DEFAULT NULL,
  `remoteParty` varchar(255) DEFAULT NULL,
  `sessionOffset` bigint(20) NOT NULL,
  `tapeOffset` bigint(20) NOT NULL,
  `timestamp` datetime DEFAULT NULL,
  `port_id` int(11) DEFAULT NULL,
  `session_id` int(11) DEFAULT NULL,
  `tape_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKD313DB4B10C0396B` (`tape_id`),
  KEY `FKD313DB4B552C890B` (`port_id`),
  KEY `FKD313DB4B63C94CCB` (`user_id`),
  KEY `FKD313DB4BADE73D69` (`session_id`),
  CONSTRAINT `FKD313DB4BADE73D69` FOREIGN KEY (`session_id`) REFERENCES `orksession` (`id`),
  CONSTRAINT `FKD313DB4B10C0396B` FOREIGN KEY (`tape_id`) REFERENCES `orktape` (`id`),
  CONSTRAINT `FKD313DB4B552C890B` FOREIGN KEY (`port_id`) REFERENCES `orkport` (`id`),
  CONSTRAINT `FKD313DB4B63C94CCB` FOREIGN KEY (`user_id`) REFERENCES `orkuser` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orksegment`
--

LOCK TABLES `orksegment` WRITE;
/*!40000 ALTER TABLE `orksegment` DISABLE KEYS */;
/*!40000 ALTER TABLE `orksegment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orkservice`
--

DROP TABLE IF EXISTS `orkservice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orkservice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `contextPath` varchar(255) DEFAULT NULL,
  `fileServePath` varchar(255) DEFAULT NULL,
  `fileServeProtocol` varchar(255) DEFAULT NULL,
  `fileServeTcpPort` int(11) NOT NULL,
  `hostname` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `recordMaster` bit(1) NOT NULL,
  `serviceClass` int(11) DEFAULT NULL,
  `tcpPort` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orkservice`
--

LOCK TABLES `orkservice` WRITE;
/*!40000 ALTER TABLE `orkservice` DISABLE KEYS */;
/*!40000 ALTER TABLE `orkservice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orksession`
--

DROP TABLE IF EXISTS `orksession`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orksession` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `duration` bigint(20) NOT NULL,
  `timestamp` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orksession`
--

LOCK TABLES `orksession` WRITE;
/*!40000 ALTER TABLE `orksession` DISABLE KEYS */;
/*!40000 ALTER TABLE `orksession` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orktape`
--

DROP TABLE IF EXISTS `orktape`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orktape` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `direction` int(11) DEFAULT NULL,
  `duration` bigint(20) NOT NULL,
  `expiryTimestamp` datetime DEFAULT NULL,
  `filename` varchar(255) DEFAULT NULL,
  `localEntryPoint` varchar(255) DEFAULT NULL,
  `localParty` varchar(255) DEFAULT NULL,
  `portName` varchar(255) DEFAULT NULL,
  `remoteParty` varchar(255) DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `port_id` int(11) DEFAULT NULL,
  `service_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKB876300A552C890B` (`port_id`),
  KEY `FKB876300AE3FED509` (`service_id`),
  CONSTRAINT `FKB876300AE3FED509` FOREIGN KEY (`service_id`) REFERENCES `orkservice` (`id`),
  CONSTRAINT `FKB876300A552C890B` FOREIGN KEY (`port_id`) REFERENCES `orkport` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orktape`
--

LOCK TABLES `orktape` WRITE;
/*!40000 ALTER TABLE `orktape` DISABLE KEYS */;
/*!40000 ALTER TABLE `orktape` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orkuser`
--

DROP TABLE IF EXISTS `orkuser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orkuser` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dateCreated` datetime DEFAULT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `dateDisabled` datetime DEFAULT NULL,
  `deleted` bit(1) NOT NULL,
  `disabled` bit(1) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `firstname` varchar(255) DEFAULT NULL,
  `lastname` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orkuser`
--

LOCK TABLES `orkuser` WRITE;
/*!40000 ALTER TABLE `orkuser` DISABLE KEYS */;
INSERT INTO `orkuser` VALUES (1,'1970-01-01 03:30:00','1970-01-01 03:30:00','1970-01-01 03:30:00','\0','\0','','adminfn','adminln','admin');
/*!40000 ALTER TABLE `orkuser` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-12-24 15:43:10
