-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
--
-- Host: localhost    Database: horodb
-- ------------------------------------------------------
-- Server version	5.7.15-log

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
-- Table structure for table `account_type`
--

DROP TABLE IF EXISTS `account_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account_type` (
  `acc_tid` int(11) NOT NULL AUTO_INCREMENT,
  `ac_tname` varchar(45) DEFAULT NULL,
  `acc_tdesc` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`acc_tid`),
  UNIQUE KEY `acc_tid_UNIQUE` (`acc_tid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_type`
--

LOCK TABLES `account_type` WRITE;
/*!40000 ALTER TABLE `account_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `account_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category_master`
--

DROP TABLE IF EXISTS `category_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category_master` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category_master`
--

LOCK TABLES `category_master` WRITE;
/*!40000 ALTER TABLE `category_master` DISABLE KEYS */;
INSERT INTO `category_master` VALUES (1,'Electrician'),(2,'Decoration'),(3,'Baking');
/*!40000 ALTER TABLE `category_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_details`
--

DROP TABLE IF EXISTS `course_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course_details` (
  `course_detailsid` int(11) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `course_id` int(11) DEFAULT NULL,
  `course_instid` int(11) DEFAULT NULL,
  `course_startdate` varchar(50) DEFAULT NULL,
  `course_enddate` varchar(50) DEFAULT NULL,
  `course_duration` int(11) DEFAULT NULL,
  `course_language` varchar(45) DEFAULT NULL,
  `course_lectures` int(11) DEFAULT NULL,
  `course_rating` int(11) DEFAULT NULL,
  `course_details` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`course_detailsid`),
  KEY `course_id_idx` (`course_id`),
  KEY `course_instis_idx` (`course_instid`),
  CONSTRAINT `course_id` FOREIGN KEY (`course_id`) REFERENCES `course_master` (`course_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `course_instis` FOREIGN KEY (`course_instid`) REFERENCES `user_master` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_details`
--

LOCK TABLES `course_details` WRITE;
/*!40000 ALTER TABLE `course_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `course_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_master`
--

DROP TABLE IF EXISTS `course_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course_master` (
  `course_id` int(11) NOT NULL AUTO_INCREMENT,
  `course_name` varchar(45) DEFAULT NULL,
  `course_category` int(11) DEFAULT NULL,
  PRIMARY KEY (`course_id`),
  UNIQUE KEY `course_id_UNIQUE` (`course_id`),
  CONSTRAINT `course_category` FOREIGN KEY (`course_id`) REFERENCES `category_master` (`category_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_master`
--

LOCK TABLES `course_master` WRITE;
/*!40000 ALTER TABLE `course_master` DISABLE KEYS */;
/*!40000 ALTER TABLE `course_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_progress`
--

DROP TABLE IF EXISTS `course_progress`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course_progress` (
  `course_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `progress` int(11) DEFAULT NULL,
  `progress_id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`progress_id`),
  KEY `course_id_idx` (`course_id`),
  KEY `user_id_idx` (`user_id`),
  CONSTRAINT `FK_course_id` FOREIGN KEY (`course_id`) REFERENCES `category_master` (`category_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_progress`
--

LOCK TABLES `course_progress` WRITE;
/*!40000 ALTER TABLE `course_progress` DISABLE KEYS */;
/*!40000 ALTER TABLE `course_progress` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ngo_master`
--

DROP TABLE IF EXISTS `ngo_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ngo_master` (
  `ngo_id` int(11) NOT NULL AUTO_INCREMENT,
  `ngo_name` varchar(45) NOT NULL,
  `ngo_description` varchar(200) DEFAULT NULL,
  `ngo_website` varchar(45) DEFAULT NULL,
  `ngo_contactno` longtext,
  `ngo_city` varchar(45) DEFAULT NULL,
  `ngo_addressline1` varchar(45) DEFAULT NULL,
  `ngo_addressline2` varchar(45) DEFAULT NULL,
  `ngo_zipcode` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ngo_id`),
  UNIQUE KEY `ngo_id_UNIQUE` (`ngo_id`),
  UNIQUE KEY `ngo_name_UNIQUE` (`ngo_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ngo_master`
--

LOCK TABLES `ngo_master` WRITE;
/*!40000 ALTER TABLE `ngo_master` DISABLE KEYS */;
/*!40000 ALTER TABLE `ngo_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `session`
--

DROP TABLE IF EXISTS `session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `session` (
  `session_id` int(11) NOT NULL AUTO_INCREMENT,
  `course_id` int(11) DEFAULT NULL,
  `session_title` varchar(45) DEFAULT NULL,
  `session_duration` int(11) DEFAULT NULL,
  `session_date` datetime DEFAULT NULL,
  `session_location` varchar(45) DEFAULT NULL,
  `session_details` text,
  `session_video` varchar(45) DEFAULT NULL,
  `sessioncol` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `session`
--

LOCK TABLES `session` WRITE;
/*!40000 ALTER TABLE `session` DISABLE KEYS */;
/*!40000 ALTER TABLE `session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subcategory`
--

DROP TABLE IF EXISTS `subcategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subcategory` (
  `subcat_id` int(11) NOT NULL AUTO_INCREMENT,
  `subcat_name` varchar(45) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`subcat_id`),
  CONSTRAINT `category_id` FOREIGN KEY (`subcat_id`) REFERENCES `category_master` (`category_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subcategory`
--

LOCK TABLES `subcategory` WRITE;
/*!40000 ALTER TABLE `subcategory` DISABLE KEYS */;
/*!40000 ALTER TABLE `subcategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trips`
--

DROP TABLE IF EXISTS `trips`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trips` (
  `tripId` varchar(255) NOT NULL,
  `tripsequence` int(11) NOT NULL AUTO_INCREMENT,
  `userEmail` varchar(255) DEFAULT NULL,
  `hostEmail` varchar(255) DEFAULT NULL,
  `listId` varchar(255) DEFAULT NULL,
  `fixedPrice` int(11) DEFAULT NULL,
  `totalPrice` int(11) DEFAULT NULL,
  `checkInDate` date DEFAULT NULL,
  `checkOutDate` date DEFAULT NULL,
  `tripStatus` varchar(255) DEFAULT NULL,
  `paymentStatus` varchar(255) DEFAULT NULL,
  `billId` varchar(255) DEFAULT NULL,
  `userComments` varchar(255) DEFAULT NULL,
  `guestsSelected` varchar(255) DEFAULT NULL,
  `hostName` varchar(255) DEFAULT NULL,
  `listingTitle` varchar(255) DEFAULT NULL,
  `listingCity` varchar(255) DEFAULT NULL,
  `userName` varchar(255) DEFAULT NULL,
  `zipCode` varchar(255) DEFAULT NULL,
  `streetAddress` varchar(255) DEFAULT NULL,
  `suiteNum` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`tripsequence`,`tripId`),
  UNIQUE KEY `tripsequence_UNIQUE` (`tripsequence`),
  UNIQUE KEY `tripId_UNIQUE` (`tripId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trips`
--

LOCK TABLES `trips` WRITE;
/*!40000 ALTER TABLE `trips` DISABLE KEYS */;
INSERT INTO `trips` VALUES ('679-07-4177',1,'brad@gmail.com','brad@gmail.com','518-04-1423',245,245,'2016-11-30','2016-12-01','pendingHostApproval','pending','679-07-4177','Book This','2',NULL,'London Palace','London','brad@gmail.com','','91 peterborough road','255'),('423-48-1382',2,'brad@gmail.com','brad@gmail.com','518-04-1423',245,245,'2016-12-15','2016-12-16','pendingHostApproval','pending','423-48-1382','bddrftgyhunjimk','2',NULL,'London Palace','London','brad@gmail.com','','91 peterborough road','255'),('606-63-3162',3,'brad@gmail.com','brad@gmail.com','217-79-2400',211,211,'2016-12-02','2016-12-03','pendingHostApproval','pending','606-63-3162','','2','Brad','Home Place','Santa Clara','brad@gmail.com','85112','1060 Benton Street','1415'),('353-56-6881',4,'brad@gmail.com','brad@gmail.com','750-14-1670',413,413,'2016-11-28','2016-11-29','pendingHostApproval','pending','353-56-6881','Please book this','4','Brad','Sunshine Villa','Santa Clara','brad@gmail.com','95114','1055 Benton St','1315');
/*!40000 ALTER TABLE `trips` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_master`
--

DROP TABLE IF EXISTS `user_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_master` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(45) NOT NULL,
  `account_type` varchar(50) DEFAULT NULL,
  `account_date` varchar(100) DEFAULT NULL,
  `password` varchar(500) NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `user_id_UNIQUE` (`user_id`),
  UNIQUE KEY `username_UNIQUE` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_master`
--

LOCK TABLES `user_master` WRITE;
/*!40000 ALTER TABLE `user_master` DISABLE KEYS */;
INSERT INTO `user_master` VALUES (1,'gaurangmhatre','attendee','Fri Nov 25 2016 21:38:46 GMT-0800 (Pacific Standard Time)','$2a$10$SQkJELAYFwMhRKmiBXmsxe933a0Q.kI4zqObU0jTdGKwaWdNIaHCi'),(2,'jaynir','volunteer','Fri Nov 25 2016 22:27:49 GMT-0800 (Pacific Standard Time)','$2a$10$Orvg6E9qCeOwXNGA6A4ydeO54nx5PgwjmGJ0WrqzxXeLsTZeyQGuK');
/*!40000 ALTER TABLE `user_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_profile`
--

DROP TABLE IF EXISTS `user_profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_profile` (
  `username` varchar(100) NOT NULL,
  `user_firstname` varchar(45) DEFAULT NULL,
  `user_lastname` varchar(45) DEFAULT NULL,
  `user_gender` varchar(45) DEFAULT NULL,
  `user_birthdate` varchar(50) DEFAULT NULL,
  `user_photo` varchar(100) DEFAULT NULL,
  `user_city` varchar(45) DEFAULT NULL,
  UNIQUE KEY `user_fid_UNIQUE` (`username`),
  CONSTRAINT `user_fid` FOREIGN KEY (`username`) REFERENCES `user_master` (`username`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_profile`
--

LOCK TABLES `user_profile` WRITE;
/*!40000 ALTER TABLE `user_profile` DISABLE KEYS */;
INSERT INTO `user_profile` VALUES ('gaurangmhatre','Gaurang','Mhatre','male','1990-01-01T08:00:00.000Z',NULL,'San jose'),('jaynir','Jay','Nirgudkar','male','1990-01-01T08:00:00.000Z',NULL,'San jose');
/*!40000 ALTER TABLE `user_profile` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-11-28  0:31:18
