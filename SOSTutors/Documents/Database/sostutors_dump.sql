DROP DATABASE IF EXISTS `sostutors`;
CREATE DATABASE `sostutors`;

USE `sostutors`;

-- MySQL dump 10.13  Distrib 5.7.9, for Win64 (x86_64)
--
-- Host: localhost    Database: sostutors
-- ------------------------------------------------------
-- Server version	5.7.10-log

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
-- Table structure for table `students`
--

DROP TABLE IF EXISTS `students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `students` (
  `studentID` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(45) NOT NULL,
  `password` varchar(32) NOT NULL,
  `fname` varchar(45) DEFAULT NULL,
  `lname` varchar(45) DEFAULT NULL,
  `profile` varchar(200) DEFAULT NULL,
  `language` varchar(10) DEFAULT NULL,
  `date_joined` date DEFAULT NULL,
  PRIMARY KEY (`studentID`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `students`
--

LOCK TABLES `students` WRITE;
/*!40000 ALTER TABLE `students` DISABLE KEYS */;
INSERT INTO `students` (`studentID`, `email`, `password`, `fname`, `lname`, `profile`, `language`, `date_joined`) VALUES (1,'student1@email.com','password','Joe','Jeanyack','Excited to have the oppurtunity to learn new things with the help of this website.','EN','2016-01-16'),(2,'student2@email.com','password','Abou ','Car','I am overjoyed to be able to access dozens of tutors with the click of a mouse, this will definitely help my grades.','FR','2016-01-20'),(3,'student3@email.com','password','Saif','Nasee','Learning a lot about science here and hoping that I will be able to find a tutor for sociology as well eventually.','EN','2016-01-21'),(4,'student4@email.com','password','Harry','Ka','Excited to have the oppurtunity to learn new things with the help of this website.','EN','2016-01-17'),(5,'student5@email.com','password','Muzz','Mirr','I am overjoyed to be able to access dozens of tutors with the click of a mouse, this will definitely help my grades.','EN','2016-01-22');
/*!40000 ALTER TABLE `students` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-03-06 17:25:20


-- MySQL dump 10.13  Distrib 5.7.9, for Win64 (x86_64)
--
-- Host: localhost    Database: sostutors
-- ------------------------------------------------------
-- Server version 5.7.10-log

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
-- Table structure for table `tutors`
--

DROP TABLE IF EXISTS `tutors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tutors` (
  `tutorID` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(45) NOT NULL,
  `password` varchar(32) NOT NULL,
  `fname` varchar(45) DEFAULT NULL,
  `lname` varchar(45) DEFAULT NULL,
  `hourly` varchar(15) DEFAULT NULL,
  `date_joined` date DEFAULT NULL,
  `image` varchar(45) DEFAULT NULL,
  `college` varchar(50) DEFAULT NULL,
  `rating` int(11) DEFAULT NULL,
  `profile` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`tutorID`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=96 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tutors`
--

LOCK TABLES `tutors` WRITE;
/*!40000 ALTER TABLE `tutors` DISABLE KEYS */;
INSERT INTO `tutors` (`tutorID`, `email`, `password`, `fname`, `lname`, `hourly`, `date_joined`, `image`, `college`, `rating`, `profile`) VALUES (1,'sit@egestaslacinia.com','1683101196399','Jonah','Ayala','9','2016-01-28','blank_profile.png','Non Company',3,'pharetra, felis eget varius ultrices, mauris ipsum porta elit, a feugiat tellus lorem eu metus.'),(2,'luctus@tellusAeneanegestas.org','1663020291399','Chelsea','Ewing','15','2015-07-16','blank_profile.png','Commodo Hendrerit Donec Consulting',2,'felis. Nulla tempor augue ac ipsum. Phasellus vitae mauris sit amet lorem semper auctor. Mauris vel turpis.'),(3,'elit.dictum@malesuadaaugueut.ca','1609041912799','Hashim','Cabrera','10','2016-01-11','blank_profile.png','Ornare Libero Foundation',4,'Donec egestas. Aliquam nec enim. Nunc ut erat. Sed nunc est, mollis non, cursus non,'),(4,'cubilia.Curae@iaculisaliquetdiam.co.uk','1639050592799','Yoshi','Wise','9','2015-03-28','blank_profile.png','Varius LLC',5,'malesuada fames ac turpis egestas. Aliquam fringilla cursus purus. Nullam'),(5,'montes@adipiscinglobortis.org','1666122611099','Shay','Foreman','15','2015-06-06','blank_profile.png','Duis Industries',3,'blandit mattis. Cras eget nisi dictum augue malesuada malesuada. Integer id magna et ipsum cursus vestibulum. Mauris magna. Duis'),(6,'Duis.risus.odio@tellusAeneanegestas.org','1602112203599','Nigel','Woodward','15','2015-12-09','blank_profile.png','Nisi Magna Sed Industries',2,'sem magna nec quam. Curabitur vel lectus. Cum sociis natoque penatibus et magnis dis parturient montes,'),(7,'rutrum.non.hendrerit@Nunc.net','1630111723399','Brennan','Calderon','8','2016-01-14','blank_profile.png','Eu Tellus Limited',1,'placerat, augue. Sed molestie. Sed id risus quis diam luctus lobortis. Class aptent taciti sociosqu ad'),(8,'pretium.aliquet@Nullam.edu','1609080819599','Sean','Vega','12','2015-10-26','blank_profile.png','Etiam Gravida Molestie Institute',1,'id nunc interdum feugiat. Sed nec metus facilisis lorem tristique aliquet. Phasellus'),(9,'sollicitudin@Suspendissesagittis.edu','1650092532199','Adrienne','Delaney','14','2015-04-05','blank_profile.png','Nascetur Ridiculus Industries',4,'felis eget varius ultrices, mauris ipsum porta elit, a feugiat tellus lorem eu metus. In lorem. Donec elementum,'),(10,'facilisis@Morbiquis.co.uk','1659011959899','Clare','Hooper','10','2015-10-07','blank_profile.png','Purus Ac Tellus LLC',3,'Quisque libero lacus, varius et, euismod et, commodo at, libero. Morbi accumsan');
/*!40000 ALTER TABLE `tutors` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-03-06 17:25:20


-- MySQL dump 10.13  Distrib 5.7.9, for Win64 (x86_64)
--
-- Host: localhost    Database: sostutors
-- ------------------------------------------------------
-- Server version 5.7.10-log

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
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sessions` (
  `sessionID` int(11) NOT NULL AUTO_INCREMENT,
  `subject` varchar(15) DEFAULT NULL,
  `booking_available` tinyint(1) NOT NULL DEFAULT '1',
  `booking_date` datetime DEFAULT NULL,
  `booking_location` varchar(45) DEFAULT NULL,
  `tutors_tutorID` int(11) DEFAULT NULL,
  `categories_categoryID` int(11) DEFAULT NULL,
  `students_studentID` int(11) DEFAULT NULL,
  PRIMARY KEY (`sessionID`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` (`sessionID`, `subject`, `booking_available`, `booking_date`, `booking_location`, `tutors_tutorID`, `categories_categoryID`, `students_studentID`) VALUES (1,'English',1,'2016-02-22 02:02:14','Algonquin College',4,1,0),(2,'French',1,'2016-01-25 23:10:01','Carleton University',7,2,0),(3,'Mathematics',1,'2015-09-13 20:44:31','Ottawa U',7,3,0),(4,'Science',1,'2015-05-07 09:31:39','Ottawa Library',8,4,0),(5,'Electronics',1,'2016-07-09 23:47:14','Rideau Centre',8,5,0),(6,'English',1,'2015-08-24 15:12:17','Algonquin College',4,1,0),(7,'French',1,'2016-09-05 19:19:56','Carleton University',3,2,0),(8,'Mathematics',1,'2015-11-26 10:12:14','Ottawa U',7,3,0),(9,'Science',1,'2015-06-19 20:41:58','Ottawa Library',5,4,0),(10,'Electronics',1,'2016-05-24 17:13:08','Rideau Centre',7,5,0),(11,'English',1,'2016-09-08 16:35:25','Algonquin College',1,1,0),(12,'French',1,'2016-05-20 12:35:11','Carleton University',4,2,0),(13,'Mathematics',1,'2015-09-12 10:13:40','Ottawa U',2,3,0),(14,'Science',1,'2016-07-05 02:27:05','Ottawa Library',7,4,0),(15,'Electronics',1,'2016-05-19 19:23:33','Rideau Centre',1,5,0),(16,'English',1,'2017-02-22 16:46:36','Algonquin College',3,1,0),(17,'French',1,'2015-12-30 06:04:47','Carleton University',7,2,0),(18,'Mathematics',1,'2015-06-03 21:08:24','Ottawa U',5,3,0),(19,'Science',1,'2015-08-28 02:12:03','Ottawa Library',6,4,0),(20,'Electronics',1,'2016-09-07 07:40:27','Rideau Centre',2,5,0),(21,'English',1,'2015-09-16 12:36:33','Algonquin College',10,1,0),(22,'French',1,'2015-06-26 23:00:08','Carleton University',8,2,0),(23,'Mathematics',1,'2016-05-14 16:50:02','Ottawa U',4,3,0),(24,'Science',1,'2015-07-28 08:38:25','Ottawa Library',7,4,0),(25,'Electronics',1,'2016-03-16 11:30:58','Rideau Centre',10,5,0),(26,'English',1,'2016-06-20 17:29:19','Algonquin College',4,1,0),(27,'French',1,'2016-04-25 01:25:43','Carleton University',3,2,0),(28,'Mathematics',1,'2016-09-26 19:11:54','Ottawa U',4,3,0),(29,'Science',1,'2015-10-07 03:20:46','Ottawa Library',2,4,0),(30,'Electronics',1,'2016-02-26 18:54:50','Rideau Centre',10,5,0);
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-03-06 17:25:20


-- MySQL dump 10.13  Distrib 5.7.9, for Win64 (x86_64)
--
-- Host: localhost    Database: sostutors
-- ------------------------------------------------------
-- Server version 5.7.10-log

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
-- Table structure for table `notifications`
--

DROP TABLE IF EXISTS `notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notifications` (
  `notificationID` int(11) NOT NULL AUTO_INCREMENT,
  `subject` varchar(45) DEFAULT NULL,
  `content` varchar(100) DEFAULT NULL,
  `date_posted` date DEFAULT NULL,
  `tutors_tutorID` int(11) DEFAULT NULL,
  `students_studentID` int(11) DEFAULT NULL,
  `sessions_sessionID` int(11) DEFAULT NULL,
  PRIMARY KEY (`notificationID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notifications`
--

LOCK TABLES `notifications` WRITE;
/*!40000 ALTER TABLE `notifications` DISABLE KEYS */;
/*!40000 ALTER TABLE `notifications` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-03-06 17:25:19


-- MySQL dump 10.13  Distrib 5.7.9, for Win64 (x86_64)
--
-- Host: localhost    Database: sostutors
-- ------------------------------------------------------
-- Server version 5.7.10-log

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
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comments` (
  `commentID` int(11) NOT NULL AUTO_INCREMENT,
  `subject` varchar(45) NOT NULL,
  `content` varchar(100) DEFAULT NULL,
  `date_posted` date DEFAULT NULL,
  `tutors_tutorID` int(11) DEFAULT NULL,
  `students_studentID` int(11) DEFAULT NULL,
  PRIMARY KEY (`commentID`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
INSERT INTO `comments` (`commentID`, `subject`, `content`, `date_posted`, `tutors_tutorID`, `students_studentID`) VALUES (1,'English','fringilla, porttitor vulputate, posuere vulputate,','2016-10-09',1,2),(2,'Mathematics','ullamcorper, nisl arcu iaculis enim, sit amet ornare lectus','2016-08-21',2,4),(3,'Science','congue a, aliquet vel, vulputate eu,','2016-05-11',2,5),(4,'Science','senectus et netus et malesuada','2015-09-27',8,5),(5,'French','dui, semper et, lacinia vitae, sodales at, velit. Pellentesque ultricies','2015-03-21',3,2),(6,'French','nunc risus varius orci, in consequat enim diam','2015-08-03',5,5),(7,'Mathematics','ornare, libero at auctor ullamcorper, nisl arcu iaculis','2016-02-20',10,5),(8,'Science','arcu vel quam dignissim pharetra. Nam','2015-10-18',7,3),(9,'Science','Donec elementum, lorem ut aliquam iaculis, lacus','2017-01-16',4,2),(10,'English','auctor, velit eget laoreet posuere, enim','2016-01-10',7,1),(11,'English','vehicula et, rutrum eu, ultrices sit amet, risus. Donec','2015-09-29',2,2),(12,'French','non arcu. Vivamus sit amet risus. Donec','2016-10-17',7,3),(13,'English','nunc sit amet metus. Aliquam erat volutpat.','2016-09-06',9,3),(14,'Science','orci quis lectus. Nullam suscipit, est ac facilisis','2016-03-25',10,1),(15,'French','et ultrices posuere cubilia Curae;','2016-10-16',1,4),(16,'Mathematics','Aliquam fringilla cursus purus. Nullam scelerisque neque sed','2015-11-24',7,3),(17,'Mathematics','dis parturient montes, nascetur ridiculus mus. Proin vel nisl.','2017-01-20',3,1),(18,'Mathematics','ultrices. Vivamus rhoncus. Donec est.','2015-08-22',6,4),(19,'French','tellus eu augue porttitor interdum. Sed auctor odio','2015-03-15',9,3),(20,'English','lorem lorem, luctus ut, pellentesque eget,','2017-02-02',4,1);
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-03-06 17:25:20

-- MySQL dump 10.13  Distrib 5.7.9, for Win64 (x86_64)
--
-- Host: localhost    Database: sostutors
-- ------------------------------------------------------
-- Server version 5.7.10-log

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
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `categoryID` int(11) NOT NULL AUTO_INCREMENT,
  `subjectEN` varchar(45) DEFAULT NULL,
  `subjectFR` varchar(45) DEFAULT NULL,
  `descriptionEN` varchar(100) DEFAULT NULL,
  `descriptionFR` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`categoryID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` (`categoryID`, `subjectEN`, `subjectFR`, `descriptionEN`, `descriptionFR`) VALUES (1,'English','Anglais','On the subject of writing and literary analysis.','Sur le sujet de l\'écriture et l\'analyse littéraire.'),(2,'French','Francais','On the subject of the french language and grammar.','Sur le sujet de la langue et de la grammaire française.'),(3,'Mathematics','Mathématiques','On the subject of math and it\'s derivatives.','Sur le sujet des mathématiques et il est des dérivés.'),(4,'Science','Science','On the subject of science, biology and chemisty.','Sur le sujet de la science, la biologie et chemistry.'),(5,'Electronics','Électronique','On the subject of electrionics, computers and networking','Sur le sujet de electroniques, des ordinateurs et des réseaux.');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-03-06 17:25:20
