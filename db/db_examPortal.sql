-- MySQL dump 10.13  Distrib 5.7.24, for Linux (x86_64)
--
-- Host: localhost    Database: ExamPortal
-- ------------------------------------------------------
-- Server version	5.7.24-0ubuntu0.18.04.1

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
-- Table structure for table `ExamResult`
--

DROP TABLE IF EXISTS `ExamResult`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ExamResult` (
  `id` varchar(200) NOT NULL,
  `exam_id` int(11) NOT NULL,
  `student_id` varchar(200) NOT NULL,
  `result` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `student_id` (`student_id`),
  KEY `ExamResult_Exam` (`exam_id`),
  CONSTRAINT `ExamResult_Exam` FOREIGN KEY (`exam_id`) REFERENCES `ExamType` (`exam_id`),
  CONSTRAINT `ExamResult_Student` FOREIGN KEY (`student_id`) REFERENCES `Student` (`email_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ExamResult`
--

LOCK TABLES `ExamResult` WRITE;
/*!40000 ALTER TABLE `ExamResult` DISABLE KEYS */;
INSERT INTO `ExamResult` VALUES ('gazala_b150028cs@nitc.ac.in1',1,'gazala_b150028cs@nitc.ac.in',3),('gazala_b150028cs@nitc.ac.in2',2,'gazala_b150028cs@nitc.ac.in',2);
/*!40000 ALTER TABLE `ExamResult` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ExamType`
--

DROP TABLE IF EXISTS `ExamType`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ExamType` (
  `exam_id` int(11) NOT NULL,
  `exam_name` varchar(200) NOT NULL,
  `time_limit_sec` int(11) NOT NULL,
  `max_score` int(11) NOT NULL,
  PRIMARY KEY (`exam_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ExamType`
--

LOCK TABLES `ExamType` WRITE;
/*!40000 ALTER TABLE `ExamType` DISABLE KEYS */;
INSERT INTO `ExamType` VALUES (1,'LAMP Stack',30000,5),(2,'Biology Quiz - Cell Structure and Function',1000,10);
/*!40000 ALTER TABLE `ExamType` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `QuestionBank`
--

DROP TABLE IF EXISTS `QuestionBank`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `QuestionBank` (
  `exam_id` int(11) NOT NULL,
  `question` varchar(200) NOT NULL,
  `choices` varchar(2000) NOT NULL,
  `correct` int(11) NOT NULL,
  PRIMARY KEY (`question`),
  KEY `QuestionBank_exam` (`exam_id`),
  CONSTRAINT `QuestionBank_exam` FOREIGN KEY (`exam_id`) REFERENCES `ExamType` (`exam_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QuestionBank`
--

LOCK TABLES `QuestionBank` WRITE;
/*!40000 ALTER TABLE `QuestionBank` DISABLE KEYS */;
INSERT INTO `QuestionBank` VALUES (1,'MYSQL comes with a DATE data type. What\'s the format that DATE accepts?','DD-MM-YYYY|MM-DD-YYYY|YYYY-MM-DD|DD/MM/YYYY',3),(2,'The plant cell structure where photosynthesis takes place is called...','chloroplast|chlorophyll|vacuole\r\n',1),(2,'What cell feature contains digestive enzymes which breaks things down?','lysosomes|ribosomes|vacuoles\r\n',1),(2,'What cell feature is responsible for powering the cell?','endoplasmic reticulum|golgi apparatus|mitochondria\r\n',3),(2,'What cell feature is responsible for storing water?','mitochondria|lysosome|vacuole\r\n',3),(2,'What is one major feature that plant cells have that animal cells do not?','lysosome|cell wall|cell membrane\r\n',2),(1,'What is the default port for HTTP and HTTPS?','22,23|80,443|433,80|443,80|80,22',2),(2,'What is the name of the jelly-like substance that is inside the cell?','cytoplasm|ectoplasm|cytokinesis\r\n',1),(1,'What\'s the main difference between mysql_fetch_array and mysql_fetch_object?','Mysql_fetch_array returns an arrya, whereas mysql_fetch_object returns an object.|Mysql_fetch_array will fetch all the matching records, whereas mysql_fetch_object will only fetch the first record that matches the query.',2),(1,'What\'s the output of this PHP code?\r\n$a =  012;\r\necho $a / 4;','3|4|2.5|Error',3),(2,'Where in the cell does DNA replication take place?','ribosomes|nucleus|nucleolus\r\n',2),(2,'Which cell feature is responsible for making proteins?','lysosomes|ribosomes|mitochondria\r\n',2),(2,'Which cell feature processes proteins?','endoplasmic reticulum|chloroplasts|golgi apparatus\r\n',3),(2,'Which cell feature transports ribosomes? ','endoplasmic reticulum|golgi apparatus|mitochondria\r\n',1),(1,'Which of these is incorrect?','A Session is destroyed when the window is closed.| A Session is destroyed based on the session timeout set in your Apache Server.| A Session can be destroyed using session_destroy()',1);
/*!40000 ALTER TABLE `QuestionBank` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Student`
--

DROP TABLE IF EXISTS `Student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Student` (
  `email_id` varchar(200) NOT NULL,
  `password` varchar(200) NOT NULL,
  `first_name` varchar(200) NOT NULL,
  `last_name` varchar(200) DEFAULT NULL,
  `course` varchar(200) NOT NULL,
  `cgpa` decimal(10,2) NOT NULL,
  `dob` date DEFAULT NULL,
  PRIMARY KEY (`email_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Student`
--

LOCK TABLES `Student` WRITE;
/*!40000 ALTER TABLE `Student` DISABLE KEYS */;
INSERT INTO `Student` VALUES ('1@1','$2y$10$oraI4vK1HygovsgQb2blJeNYr.otyEkUF1BCP7LUSUnAo.BapCpRS','a','b','btech',9.20,'1997-06-05'),('34567@1','$2y$10$BT1J9AfuOACSK05i8Sz/A.8rfesUVaksoj4Y53XAjq/aRHeHAzYyi','1234567','2345678','btech',5.90,'1997-06-05'),('456789@1','$2y$10$vy41oDxzcsg.catAyvNSJeZzNiVlGDei41Cmi3kOw79czXArQp6yK','dfv','qdf','btech',1.00,'1997-06-05'),('g@gmail.com','$2y$10$bCvoxVogmk7RB10ly9/h1e8FI7aCVbEOLolVigdf/SNCcOLRURYA2','testname','maef','NITC',10.00,'2019-02-03'),('gaz@gmail.com','$2y$10$1533fLxH0TpNZPy02noHvOttVJaE7Xa9t5S5ieaEMKdprfwfn8qbm','Gazala','Muhamed','mtech',10.00,'1997-06-05'),('gazala_b150028cs@nitc.ac.in','$2y$10$mslglV64gu5u..eORAjbye4JIph/FGYKKbrNlRzbNVUzglcVO9Cxe','Gazala','Muhamed','btech',10.00,'1997-06-05');
/*!40000 ALTER TABLE `Student` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-02-25 12:41:35
