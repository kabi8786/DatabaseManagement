CREATE DATABASE  IF NOT EXISTS `healthconnect` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `healthconnect`;
-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
--
-- Host: localhost    Database: healthconnect
-- ------------------------------------------------------
-- Server version	5.7.17-log

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
-- Table structure for table `healthpractitioners`
--

DROP TABLE IF EXISTS `healthpractitioners`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `healthpractitioners` (
  `healthPracID` int(11) NOT NULL,
  `firstName` varchar(50) NOT NULL,
  `surname` varchar(50) NOT NULL,
  `streetNumber` varchar(20) DEFAULT NULL,
  `street` varchar(50) DEFAULT NULL,
  `suburb` varchar(50) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `postcode` char(4) DEFAULT NULL,
  `type` enum('doctor','physio','dietician') DEFAULT NULL,
  PRIMARY KEY (`healthPracID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `healthpractitioners`
--

LOCK TABLES `healthpractitioners` WRITE;
/*!40000 ALTER TABLE `healthpractitioners` DISABLE KEYS */;
INSERT INTO `healthpractitioners` VALUES (1,'John','Daley','2A','Arana Park','Spring Hill','Brisbane','4000','doctor'),(2,'Laurianne','Smith','2/899','Belconnan Drive','Sydney South','Sydney','2000','dietician'),(3,'Nikki','Peever','979','Brighton Lane','Docklands','Melbourne','3008','physio'),(4,'Wayne','Wood','333','Green Street','Wembley','Perth','6014','physio'),(5,'Jake','Bradford','217','Zelda Street','Linkburb','Hobart','7000','doctor'),(6,'Jack','Stuart','86','Rain Road','Kilkenny','Adelaide','5009','physio'),(7,'Riva','Mendoza','180','Mains Road','Oxenford','Gold Coast','4207','doctor'),(8,'Joshua','Smith','180','Zelda Street','Linkburb','Brisbane','4053','dietician'),(9,'Shavrah','Singh','7','South Street','Underwood','Brisbane','4199','doctor');
/*!40000 ALTER TABLE `healthpractitioners` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `illness`
--

DROP TABLE IF EXISTS `illness`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `illness` (
  `illnessID` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` varchar(255) NOT NULL,
  PRIMARY KEY (`illnessID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `illness`
--

LOCK TABLES `illness` WRITE;
/*!40000 ALTER TABLE `illness` DISABLE KEYS */;
INSERT INTO `illness` VALUES (1,'Meningococcal disease','A a serious illness caused by a bacterium which infects the brain and spinal cord.'),(2,'Crohn\'s disease','Liife long gastrointestinal disorders that commonly present themselves in children, adolescents and adulthood.'),(3,'Cerebral palsy','The word cerebral means having to do with the brain. The word palsy means a weakness or problem in the way a person moves or positions his or her body.'),(4,'Celiac disease','A disorder that makes peoples bodies react to gluten.'),(5,'Brain injury','A traumatic brain injury happens when someone\'s head is suddenly hit or shaken really hard.'),(6,'Multiple sclerosis','Condition of the central nervous system');
/*!40000 ALTER TABLE `illness` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phonenumber`
--

DROP TABLE IF EXISTS `phonenumber`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `phonenumber` (
  `healthPracID` int(11) NOT NULL,
  `phoneNumber` char(10) NOT NULL,
  PRIMARY KEY (`healthPracID`,`phoneNumber`),
  CONSTRAINT `healthPracIDPN` FOREIGN KEY (`healthPracID`) REFERENCES `healthpractitioners` (`healthPracID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phonenumber`
--

LOCK TABLES `phonenumber` WRITE;
/*!40000 ALTER TABLE `phonenumber` DISABLE KEYS */;
INSERT INTO `phonenumber` VALUES (1,'0733004466'),(1,'0733584651'),(1,'1800456789'),(2,'0466123789'),(3,'0400123456'),(5,'0478945645'),(6,'0456123987'),(6,'1800789456'),(8,'0411112348'),(9,'0477889132'),(9,'0738597821'),(9,'1800223345');
/*!40000 ALTER TABLE `phonenumber` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `postauthors`
--

DROP TABLE IF EXISTS `postauthors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `postauthors` (
  `nickname` varchar(255) NOT NULL,
  `postID` int(11) NOT NULL,
  PRIMARY KEY (`nickname`,`postID`),
  KEY `postIDPA` (`postID`),
  CONSTRAINT `nicknamePA` FOREIGN KEY (`nickname`) REFERENCES `users` (`nickname`),
  CONSTRAINT `postIDPA` FOREIGN KEY (`postID`) REFERENCES `posts` (`postID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `postauthors`
--

LOCK TABLES `postauthors` WRITE;
/*!40000 ALTER TABLE `postauthors` DISABLE KEYS */;
INSERT INTO `postauthors` VALUES ('EBebe',1),('joey',2),('ricko',3),('ricko',4),('smithz',5),('EBebe',6),('ricko',7);
/*!40000 ALTER TABLE `postauthors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `postcomments`
--

DROP TABLE IF EXISTS `postcomments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `postcomments` (
  `nickname` varchar(255) NOT NULL,
  `postID` int(11) NOT NULL,
  `datetime` datetime NOT NULL,
  `content` varchar(1000) NOT NULL,
  PRIMARY KEY (`nickname`,`postID`,`datetime`),
  KEY `postIDPC` (`postID`),
  CONSTRAINT `nicknamePC` FOREIGN KEY (`nickname`) REFERENCES `users` (`nickname`),
  CONSTRAINT `postIDPC` FOREIGN KEY (`postID`) REFERENCES `posts` (`postID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `postcomments`
--

LOCK TABLES `postcomments` WRITE;
/*!40000 ALTER TABLE `postcomments` DISABLE KEYS */;
INSERT INTO `postcomments` VALUES ('barbs',2,'2018-09-10 07:50:12','Working :('),('EBebe',2,'2018-09-10 10:02:20','Day off - so I\'ll probably sleep all day!'),('EBebe',5,'2018-09-11 16:06:02','Weightlifting!'),('GC',5,'2018-09-11 18:45:39','I like to walk with my dog'),('j75',2,'2018-09-10 07:51:00','Studying :('),('jerry',3,'2018-09-10 14:50:10','Food is the best!!!!!'),('kdog',6,'2018-09-12 09:10:14','The Bunnies!'),('niknik',6,'2018-09-12 08:30:30','Storm or Roosters');
/*!40000 ALTER TABLE `postcomments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `posts` (
  `postID` int(11) NOT NULL,
  `datetime` datetime NOT NULL,
  `content` varchar(1000) NOT NULL,
  PRIMARY KEY (`postID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` VALUES (1,'2018-09-10 00:01:30','Hi, nice to meet everyone!'),(2,'2018-09-10 07:45:00','What is everyone doing today?'),(3,'2018-09-10 13:20:49','How amazing is food!!! Had the best lunch!'),(4,'2018-09-11 09:03:11','Feeling better today than yesterday'),(5,'2018-09-11 14:12:23','How do you like to get exercise?'),(6,'2018-09-11 23:45:30','Who do you think will win the NRL grand final?'),(7,'2018-09-12 07:02:12','Today was a great day :)');
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `treatmentrecords`
--

DROP TABLE IF EXISTS `treatmentrecords`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `treatmentrecords` (
  `nickname` varchar(255) NOT NULL,
  `healthPracID` int(11) NOT NULL,
  `illnessID` int(11) NOT NULL,
  `datestarted` datetime NOT NULL,
  `degree` int(1) DEFAULT NULL,
  PRIMARY KEY (`nickname`,`healthPracID`,`illnessID`,`datestarted`),
  KEY `healthPracIDTR` (`healthPracID`),
  KEY `illnessIDTR` (`illnessID`),
  CONSTRAINT `healthPracIDTR` FOREIGN KEY (`healthPracID`) REFERENCES `healthpractitioners` (`healthPracID`),
  CONSTRAINT `illnessIDTR` FOREIGN KEY (`illnessID`) REFERENCES `illness` (`illnessID`),
  CONSTRAINT `nicknameTR` FOREIGN KEY (`nickname`) REFERENCES `users` (`nickname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `treatmentrecords`
--

LOCK TABLES `treatmentrecords` WRITE;
/*!40000 ALTER TABLE `treatmentrecords` DISABLE KEYS */;
INSERT INTO `treatmentrecords` VALUES ('barbs',1,1,'2018-04-11 00:00:00',1),('drizzy',7,2,'2017-06-27 00:00:00',1),('EBebe',2,3,'2014-12-13 00:00:00',3),('GC',3,2,'2013-03-10 00:00:00',3),('jerry',3,3,'2016-12-10 00:00:00',3),('joey',4,3,'2017-02-11 00:00:00',1),('jsar',5,1,'2011-01-01 00:00:00',3),('kdog',6,4,'2016-12-01 00:00:00',1),('nathy',9,5,'2017-03-11 00:00:00',4),('niknik',9,5,'2018-02-05 00:00:00',2),('ricko',8,5,'2017-10-11 00:00:00',4),('sam',3,1,'2018-02-06 00:00:00',2),('sp2002',7,6,'2017-04-11 00:00:00',5);
/*!40000 ALTER TABLE `treatmentrecords` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `nickname` varchar(255) NOT NULL,
  `firstName` varchar(50) NOT NULL,
  `surname` varchar(50) NOT NULL,
  `birthyear` int(4) NOT NULL,
  `city` varchar(50) DEFAULT NULL,
  `suburb` varchar(50) DEFAULT NULL,
  `job` varchar(100) DEFAULT NULL,
  `family` varchar(100) DEFAULT NULL,
  `TV` varchar(100) DEFAULT NULL,
  `videoID` int(11) DEFAULT NULL,
  `mentorNickname` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`nickname`),
  KEY `videoIDU` (`videoID`),
  CONSTRAINT `videoIDU` FOREIGN KEY (`videoID`) REFERENCES `video` (`videoID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('barbs','barb','Streisand',1997,'Brisbane','Stafford Heights','Consultant','Big family!','Drama or news',3,'smithz'),('drizzy','Drake','Shakur',1971,'Perth','North Fremantle','Carer','I live with my sister and look after her.','We like telenovelas',NULL,NULL),('EBebe','Elaine','Benes',2004,'Brisbane','Stafford','Manager','Single!',NULL,4,NULL),('GC','George','Costanza',1986,'Brisbane','Stafford','Coach','Just me and my dog.',NULL,5,NULL),('j75','John','Smith',1999,'Perth','Perth city','Student','My dad and I live together with 2 birds.',NULL,1,'joey'),('jerry','Jerry','seinfield',1957,'Sydney','Parramatta','Manager','Mum and dad and me','Anything comedy',2,'niknik'),('joey','Joey','Tribbiana',2005,'Darwin','Bayview','Unemployed','Nonna, mama and me. Oh and my dog!',NULL,NULL,NULL),('jsar','Joel','Sarah',1993,'Hobart','Mount Stuart','Student',NULL,'Game of Thrones',NULL,'smithz'),('kdog','Kanye','West',2003,'Brisbane','Sunnybank Hills','Sales','Married with 2 children','I like movies',NULL,'j75'),('nathy','Nathan','Drake',2001,'Adelaide','Mawson Lakes','Instagram famous',NULL,NULL,7,'niknik'),('niknik','Niko','Bellic',2001,'Gold Coast','Burleigh Waters','Student',NULL,'I like watching sport or documentaries.',NULL,'j75'),('ricko','Rick','Ross',1963,'Melbourne','Docklands','Software Engineer',NULL,NULL,NULL,'barbs'),('sam','Samus','ARAN',1975,'Canberra','Barton','Network Engineer','My cat, 2 brothers and mum.','Stranger Things, The Good Place and Making a Murderer are my favourite shows.',NULL,'joey'),('smithz','Nigel','SMITHERS',1996,'Sydney','Allambie Heights','Unemployed','Lots of kids :)',NULL,6,NULL),('sp2002','Sam','peters',2002,'Adelaide','Seacombe Heights','Database Administrator',NULL,'I don\'t watch TV',NULL,NULL),('winnie','Oprah','Winfrey',1982,'Melbourne','Flemington','Blogger','My friends are my family!','I like reality TV shows',NULL,'niknik');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `video`
--

DROP TABLE IF EXISTS `video`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `video` (
  `videoID` int(11) NOT NULL,
  `title` varchar(50) NOT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `duration` int(11) NOT NULL,
  `filetype` enum('AVI','MOV','MP4','WAV','FLV') DEFAULT NULL,
  PRIMARY KEY (`videoID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `video`
--

LOCK TABLES `video` WRITE;
/*!40000 ALTER TABLE `video` DISABLE KEYS */;
INSERT INTO `video` VALUES (1,'Just a little video about me :)',NULL,300,'WAV'),(2,'My video',NULL,721,'MP4'),(3,'Healthy life',NULL,958,'FLV'),(4,'Elaine\'s story',NULL,58,'AVI'),(5,'Hi world!!',NULL,221,'MOV'),(6,'Introduction',NULL,830,'FLV'),(7,'Me',NULL,20,'AVI');
/*!40000 ALTER TABLE `video` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-09-13 23:01:31
