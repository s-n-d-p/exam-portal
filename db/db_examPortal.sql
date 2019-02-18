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
  `choices` varchar(200) NOT NULL,
  `correct` int(11) NOT NULL,
  KEY `QuestionBank_exam` (`exam_id`),
  CONSTRAINT `QuestionBank_exam` FOREIGN KEY (`exam_id`) REFERENCES `ExamType` (`exam_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QuestionBank`
--

LOCK TABLES `QuestionBank` WRITE;
/*!40000 ALTER TABLE `QuestionBank` DISABLE KEYS */;
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
  `college` varchar(200) NOT NULL,
  `cgpa` decimal(10,0) NOT NULL,
  PRIMARY KEY (`email_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Student`
--

LOCK TABLES `Student` WRITE;
/*!40000 ALTER TABLE `Student` DISABLE KEYS */;
INSERT INTO `Student` VALUES ('$email_id','$hashed','$first_name','$last_name','NITC',10),('g@gmail.com','$2y$10$bCvoxVogmk7RB10ly9/h1e8FI7aCVbEOLolVigdf/SNCcOLRURYA2','testname','maef','NITC',10);
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

-- Dump completed on 2019-02-18 15:14:21
