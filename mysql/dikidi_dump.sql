CREATE DATABASE  IF NOT EXISTS `dikidi` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `dikidi`;
-- MySQL dump 10.13  Distrib 5.7.29, for Linux (x86_64)
--
-- Host: localhost    Database: dikidi
-- ------------------------------------------------------
-- Server version	5.7.29-0ubuntu0.18.04.1

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
-- Table structure for table `motorcycles`
--

DROP TABLE IF EXISTS `motorcycles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `motorcycles` (
  `id` int(11) NOT NULL,
  `type_id` int(11) NOT NULL,
  `in_production` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `motorcycles`
--

LOCK TABLES `motorcycles` WRITE;
/*!40000 ALTER TABLE `motorcycles` DISABLE KEYS */;
INSERT INTO `motorcycles` VALUES (1,5,0),(2,3,0),(3,4,0),(4,4,1),(5,8,1),(6,8,0),(7,8,1),(8,7,1),(9,1,0),(10,7,0),(11,7,1),(12,2,1),(13,3,0),(14,4,1),(15,6,0),(16,6,0),(17,8,1),(18,2,1),(19,8,0),(20,5,1),(21,6,1),(22,4,1),(23,2,0),(24,4,1),(25,4,1),(26,6,0),(27,1,1),(28,4,1),(29,2,1),(30,8,0),(31,6,0),(32,6,1),(33,8,1),(34,1,1),(35,2,0),(36,7,1),(37,6,1),(38,5,1),(39,6,1),(40,5,1),(41,5,1),(42,3,0),(43,6,1),(44,3,1),(45,2,1),(46,4,0),(47,6,0),(48,1,1),(49,7,0),(50,3,0),(51,6,1),(52,4,0),(53,7,1),(54,5,1),(55,4,0),(56,2,0),(57,3,0),(58,8,1),(59,7,0),(60,5,0),(61,3,1),(62,2,1),(63,2,1),(64,8,0),(65,2,0),(66,2,1),(67,2,1),(68,1,1),(69,4,1),(70,6,0),(71,3,1),(72,5,1),(73,6,1),(74,2,1),(75,8,1),(76,5,1),(77,6,1),(78,4,0),(79,3,1),(80,5,1),(81,5,0),(82,7,0),(83,6,1),(84,2,0),(85,4,0),(86,5,0),(87,5,1),(88,7,1),(89,7,0),(90,8,0),(91,8,1),(92,1,1),(93,2,0),(94,4,0),(95,2,0),(96,4,0),(97,4,0),(98,7,0),(99,2,1),(100,7,0);
/*!40000 ALTER TABLE `motorcycles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `types`
--

DROP TABLE IF EXISTS `types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `types` (
  `id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `types`
--

LOCK TABLES `types` WRITE;
/*!40000 ALTER TABLE `types` DISABLE KEYS */;
INSERT INTO `types` VALUES (1,'Classic'),(2,'Cruiser'),(3,'Sport bike'),(4,'Touring'),(5,'Sport touring'),(6,'Dual-sport'),(7,'Enduro'),(8,'Motocross');
/*!40000 ALTER TABLE `types` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-08-12 10:25:19
