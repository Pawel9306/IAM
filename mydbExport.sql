-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: mydb
-- ------------------------------------------------------
-- Server version	5.7.21-log

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
-- Table structure for table `emp_tbl`
--

DROP TABLE IF EXISTS `emp_tbl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `emp_tbl` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `address` varchar(45) NOT NULL,
  `telephone` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emp_tbl`
--

LOCK TABLES `emp_tbl` WRITE;
/*!40000 ALTER TABLE `emp_tbl` DISABLE KEYS */;
/*!40000 ALTER TABLE `emp_tbl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hibernate_sequence`
--

DROP TABLE IF EXISTS `hibernate_sequence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hibernate_sequence` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hibernate_sequence`
--

LOCK TABLES `hibernate_sequence` WRITE;
/*!40000 ALTER TABLE `hibernate_sequence` DISABLE KEYS */;
INSERT INTO `hibernate_sequence` VALUES (1),(1);
/*!40000 ALTER TABLE `hibernate_sequence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `temployee`
--

DROP TABLE IF EXISTS `temployee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `temployee` (
  `EMPLOYEE_ID` int(11) NOT NULL AUTO_INCREMENT,
  `FIRST_NAME` varchar(20) NOT NULL,
  `LAST_NAME` varchar(20) NOT NULL,
  `FULL_NAME` varchar(45) DEFAULT NULL,
  `EMAIL_ADDRESS` varchar(60) DEFAULT NULL,
  `PHONE_NUMBER` varchar(12) DEFAULT NULL,
  `ACCOUNT_TYPE` varchar(45) NOT NULL,
  `ACCOUNT_STATUS` varchar(1) NOT NULL,
  `VALID_FROM` date NOT NULL,
  `VALID_UNTIL` date DEFAULT NULL,
  `IS_MANAGER` varchar(1) NOT NULL,
  `STREET` varchar(100) NOT NULL,
  `HOME_NBR` varchar(45) DEFAULT NULL,
  `CITY` varchar(100) NOT NULL,
  `STATE` varchar(100) NOT NULL,
  `POST_CODE` varchar(10) NOT NULL,
  `BIRTH_DAY` date NOT NULL,
  `BRANCH` varchar(45) NOT NULL,
  `DEPARTMENT` varchar(45) NOT NULL,
  `POSITION` varchar(100) NOT NULL,
  `POSITION_DESC` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`EMPLOYEE_ID`),
  UNIQUE KEY `EMPLOYEE_ID_UNIQUE` (`EMPLOYEE_ID`),
  UNIQUE KEY `EMAIL_ADDRESS_UNIQUE` (`EMAIL_ADDRESS`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `temployee`
--

LOCK TABLES `temployee` WRITE;
/*!40000 ALTER TABLE `temployee` DISABLE KEYS */;
INSERT INTO `temployee` VALUES (2,'Michal','Kudela','Michal Kudela','test@gmail.com','111222333','Administrator','A','2018-10-19','2020-10-19','Y','Zana','1','Lublin','Lubelskie','20-600','1901-10-10','IT','Lublin','IT Specialist','IT SPECIALIST'),(3,'Test','Test','Test Test','test1@gmail.com','111222333','Test','A','2018-10-19','2020-10-19','N','Zana','1','Lublin','Lubelskie','20-600','1901-10-10','IT','Lublin','IT Specialist','IT SPECIALIST'),(7,'Test','User11','Test User11','testuser432@test.com','1444222','Admin','T','2018-10-10','2018-10-10','Y','Zana','1','Zamosc','Lubelskie','22-400','2018-10-10','Test','Test','Test','Test user'),(8,'Marcin','Test','Marcin Test','marcin.test@gmail.com','500222136','Manager','A','2018-10-10','2019-11-10','Y','Zana','487','Zamosc','lubelskie','22-400','2018-10-10','Warszawa','Kadry','Specjalista ds. HR','Obsługa benefitów'),(10,'Jan','Kowalski','Jan Kowalski','jan.kowalski@vp.pl','698563325','Manager','A','2018-10-10','2019-12-01','Y','Lipska','2','Zamość','lubelskie','22-400','1987-01-05','Zamość','Kadry','Manager projektu','Projekt unijny');
/*!40000 ALTER TABLE `temployee` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `mydb`.`TMANAGER_INSERT_TRG` AFTER INSERT ON `TEMPLOYEE` FOR EACH ROW
BEGIN
IF NEW.IS_MANAGER = 'Y'
THEN
INSERT INTO TMANAGER (TEMP_ID) values (NEW.EMPLOYEE_ID);
END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `tentitlement`
--

DROP TABLE IF EXISTS `tentitlement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tentitlement` (
  `ENTITLEMENT_ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(45) DEFAULT NULL,
  `VALID_FROM` date NOT NULL,
  `VALID_UNTIL` date DEFAULT NULL,
  `STATUS` varchar(1) NOT NULL,
  `TEMP_ID` int(11) DEFAULT NULL,
  `ORDER_NUMBER` int(11) NOT NULL,
  PRIMARY KEY (`ENTITLEMENT_ID`),
  UNIQUE KEY `ENTITLEMENT_ID_UNIQUE` (`ENTITLEMENT_ID`),
  KEY `TEMP_PK_idx` (`TEMP_ID`),
  KEY `TORDER_PK_idx` (`ORDER_NUMBER`),
  CONSTRAINT `TEMP_PK` FOREIGN KEY (`TEMP_ID`) REFERENCES `temployee` (`EMPLOYEE_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `TORDER_PK` FOREIGN KEY (`ORDER_NUMBER`) REFERENCES `torder` (`ORDER_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tentitlement`
--

LOCK TABLES `tentitlement` WRITE;
/*!40000 ALTER TABLE `tentitlement` DISABLE KEYS */;
/*!40000 ALTER TABLE `tentitlement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tmanager`
--

DROP TABLE IF EXISTS `tmanager`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tmanager` (
  `MANAGER_ID` int(11) NOT NULL AUTO_INCREMENT,
  `TEMP_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`MANAGER_ID`),
  UNIQUE KEY `MANAGER_ID_UNIQUE` (`MANAGER_ID`),
  KEY `TEMP_ID_idx` (`TEMP_ID`),
  CONSTRAINT `TEMP_ID2` FOREIGN KEY (`TEMP_ID`) REFERENCES `temployee` (`EMPLOYEE_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tmanager`
--

LOCK TABLES `tmanager` WRITE;
/*!40000 ALTER TABLE `tmanager` DISABLE KEYS */;
INSERT INTO `tmanager` VALUES (1,10);
/*!40000 ALTER TABLE `tmanager` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `torder`
--

DROP TABLE IF EXISTS `torder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `torder` (
  `ORDER_ID` int(11) NOT NULL,
  `SYSTEM_ID` int(11) NOT NULL,
  `ORDER_DATE` datetime DEFAULT NULL,
  `STATUS` varchar(12) DEFAULT NULL,
  `COMMENT` varchar(100) DEFAULT NULL,
  `EVENT_TYPE` varchar(45) DEFAULT NULL,
  `APPROVED_BY_MANAGER` date DEFAULT NULL,
  `APPROVED_BY_ADMIN` date DEFAULT NULL,
  `system_name` varchar(255) DEFAULT NULL,
  `ordera_date` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ORDER_ID`),
  UNIQUE KEY `ORDER_ID_UNIQUE` (`ORDER_ID`),
  KEY `SYSTEM_ID_idx` (`SYSTEM_ID`),
  KEY `FKe9ta0gbmor3nasxy8nevaqd2u` (`system_name`),
  CONSTRAINT `FKe9ta0gbmor3nasxy8nevaqd2u` FOREIGN KEY (`system_name`) REFERENCES `tsystem` (`SYSTEM_NAME`),
  CONSTRAINT `FKrt0wa67umg8422b0i2co3patm` FOREIGN KEY (`SYSTEM_ID`) REFERENCES `tsystem` (`SYSTEM_ID`),
  CONSTRAINT `SYSTEM_ID` FOREIGN KEY (`SYSTEM_ID`) REFERENCES `tsystem` (`SYSTEM_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `torder`
--

LOCK TABLES `torder` WRITE;
/*!40000 ALTER TABLE `torder` DISABLE KEYS */;
/*!40000 ALTER TABLE `torder` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `mydb`.`TORDER_STATUS_DEFAULT` BEFORE INSERT ON `TORDER` FOR EACH ROW
BEGIN
IF NEW.STATUS is NULL
THEN
SET NEW.STATUS := 'Aktywne' ;
END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `treference`
--

DROP TABLE IF EXISTS `treference`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `treference` (
  `MANAGER_ID` int(11) NOT NULL AUTO_INCREMENT,
  `TEMP_ID` int(11) NOT NULL,
  UNIQUE KEY `MANAGER_ID_UNIQUE` (`MANAGER_ID`),
  KEY `TEMP_ID_idx` (`TEMP_ID`),
  CONSTRAINT `MANAGER_ID` FOREIGN KEY (`MANAGER_ID`) REFERENCES `tmanager` (`MANAGER_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `TEMP_ID` FOREIGN KEY (`TEMP_ID`) REFERENCES `temployee` (`EMPLOYEE_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `treference`
--

LOCK TABLES `treference` WRITE;
/*!40000 ALTER TABLE `treference` DISABLE KEYS */;
/*!40000 ALTER TABLE `treference` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tsystem`
--

DROP TABLE IF EXISTS `tsystem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tsystem` (
  `SYSTEM_ID` int(11) NOT NULL AUTO_INCREMENT,
  `SYSTEM_NAME` varchar(45) NOT NULL,
  `DESCRIPTION` varchar(100) DEFAULT NULL,
  `GROUP_NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`SYSTEM_ID`),
  UNIQUE KEY `SYSTEM_ID_UNIQUE` (`SYSTEM_ID`),
  UNIQUE KEY `SYSTEM_NAME_UNIQUE` (`SYSTEM_NAME`),
  UNIQUE KEY `UK_iadqlur82vje4x5ubly1vmjj3` (`SYSTEM_NAME`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tsystem`
--

LOCK TABLES `tsystem` WRITE;
/*!40000 ALTER TABLE `tsystem` DISABLE KEYS */;
INSERT INTO `tsystem` VALUES (2,'Płatnik','Dostęp wymagany do korzystania z aplikacji Płatnik','KSIEGOWOSC_PLATNIK_FULL'),(3,'Identyfikator','Uprawnia użytkownika do wejścia do biura','BADGE_USERS'),(4,'SAP PROD','Konto w systemie SAP PROD','SAPPROD_MEMBERS');
/*!40000 ALTER TABLE `tsystem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tuserid`
--

DROP TABLE IF EXISTS `tuserid`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tuserid` (
  `USERID_PK` int(11) NOT NULL AUTO_INCREMENT,
  `USERID` varchar(45) NOT NULL,
  `TEMP_PK` int(11) DEFAULT NULL,
  `password` varchar(150) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  PRIMARY KEY (`USERID_PK`),
  UNIQUE KEY `USERID_PK_UNIQUE` (`USERID_PK`),
  KEY `TEMP_PK_UID_idx` (`TEMP_PK`),
  CONSTRAINT `TEMP_PK_UID` FOREIGN KEY (`TEMP_PK`) REFERENCES `temployee` (`EMPLOYEE_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tuserid`
--

LOCK TABLES `tuserid` WRITE;
/*!40000 ALTER TABLE `tuserid` DISABLE KEYS */;
INSERT INTO `tuserid` VALUES (2,'kudelam',2,'$2a$10$k8PfTcgqzZ6AoNgkKrMObuun6JNAk5PoOiF5MyDmv5H3sFW9Fn.ve',1),(3,'testuser',3,'$2a$10$k8PfTcgqzZ6AoNgkKrMObuun6JNAk5PoOiF5MyDmv5H3sFW9Fn.ve',1);
/*!40000 ALTER TABLE `tuserid` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_roles`
--

DROP TABLE IF EXISTS `user_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_roles` (
  `user_role_id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `role` varchar(45) NOT NULL,
  PRIMARY KEY (`user_role_id`),
  KEY `fk_username_idx` (`userid`),
  CONSTRAINT `fk_userid` FOREIGN KEY (`userid`) REFERENCES `tuserid` (`USERID_PK`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_roles`
--

LOCK TABLES `user_roles` WRITE;
/*!40000 ALTER TABLE `user_roles` DISABLE KEYS */;
INSERT INTO `user_roles` VALUES (1,2,'ROLE_USER'),(2,2,'ROLE_ADMIN'),(3,3,'ROLE_USER');
/*!40000 ALTER TABLE `user_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'mydb'
--

--
-- Dumping routines for database 'mydb'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-11-14 11:51:06
