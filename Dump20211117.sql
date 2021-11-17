-- MySQL dump 10.13  Distrib 8.0.27, for Win64 (x86_64)
--
-- Host: localhost    Database: train_it
-- ------------------------------------------------------
-- Server version	8.0.27

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `company_supplier`
--

DROP TABLE IF EXISTS `company_supplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `company_supplier` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(21) DEFAULT NULL,
  `total` varchar(21) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company_supplier`
--

LOCK TABLES `company_supplier` WRITE;
/*!40000 ALTER TABLE `company_supplier` DISABLE KEYS */;
INSERT INTO `company_supplier` VALUES (1,'Realm Generation','2000'),(2,'Blackstone JUS','1880'),(3,'GoldRush Pearl','2230');
/*!40000 ALTER TABLE `company_supplier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id` int NOT NULL AUTO_INCREMENT,
  `brand_id` int DEFAULT NULL,
  `product_id` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,1,1),(2,1,2),(3,2,3),(4,3,3);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supplier`
--

DROP TABLE IF EXISTS `supplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `supplier` (
  `supply_id` int NOT NULL,
  `supply_type` varchar(15) DEFAULT NULL,
  `truck_departure` timestamp NULL DEFAULT NULL,
  `truck_arrival` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`supply_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supplier`
--

LOCK TABLES `supplier` WRITE;
/*!40000 ALTER TABLE `supplier` DISABLE KEYS */;
INSERT INTO `supplier` VALUES (1,'Interior items','2021-11-29 23:15:15','2021-12-04 08:10:05'),(2,'Furniture','2021-11-07 16:50:00','2021-11-09 07:15:15'),(3,'Home appliences','2021-11-10 18:30:10','2021-11-14 06:01:10'),(4,'Log','2021-12-23 00:20:15','2021-12-25 08:10:05');
/*!40000 ALTER TABLE `supplier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `truck`
--

DROP TABLE IF EXISTS `truck`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `truck` (
  `truck_id` int NOT NULL,
  `truck_name` varchar(8) DEFAULT NULL,
  `model` varchar(8) DEFAULT NULL,
  `lifting_capacity` decimal(3,2) DEFAULT NULL,
  `truck_mass` decimal(3,2) DEFAULT NULL,
  `country` varchar(15) DEFAULT NULL,
  `supply_id` int DEFAULT NULL,
  PRIMARY KEY (`truck_id`),
  KEY `supply_id` (`supply_id`),
  CONSTRAINT `truck_ibfk_1` FOREIGN KEY (`supply_id`) REFERENCES `supplier` (`supply_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `truck`
--

LOCK TABLES `truck` WRITE;
/*!40000 ALTER TABLE `truck` DISABLE KEYS */;
INSERT INTO `truck` VALUES (100,'Scania','R',9.69,8.31,'Estonia',1),(101,'MAN','TGS',5.25,8.75,'The Netherlands',2),(102,'Mercedes','Actros',9.85,8.15,'Germany',4),(103,'DAF','XF',1.73,8.60,'Denmark',1),(104,'IVECO','Stralis',1.40,7.60,'Slovenia',2),(105,'RENAULT','Magnum',9.92,8.56,'France',3),(107,'VOLVO','FH',9.19,6.09,'Belgium',4);
/*!40000 ALTER TABLE `truck` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `truck_part`
--

DROP TABLE IF EXISTS `truck_part`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `truck_part` (
  `truck_id` int NOT NULL,
  `truck_name` varchar(8) DEFAULT NULL,
  `supply_type` varchar(15) DEFAULT NULL,
  `truck_mass` decimal(3,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `truck_part`
--

LOCK TABLES `truck_part` WRITE;
/*!40000 ALTER TABLE `truck_part` DISABLE KEYS */;
INSERT INTO `truck_part` VALUES (100,'Scania','Furniture',9.60),(107,'Mercedes','Log',5.60),(104,'IVECO','Interior items',7.50),(106,'Foton','Home appliences',8.80);
/*!40000 ALTER TABLE `truck_part` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `works_with`
--

DROP TABLE IF EXISTS `works_with`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `works_with` (
  `truck_id` int NOT NULL,
  `supply_id` int NOT NULL,
  `driver` varchar(15) DEFAULT NULL,
  `overall` int DEFAULT NULL,
  PRIMARY KEY (`truck_id`,`supply_id`),
  KEY `supply_id` (`supply_id`),
  CONSTRAINT `works_with_ibfk_1` FOREIGN KEY (`supply_id`) REFERENCES `supplier` (`supply_id`) ON DELETE CASCADE,
  CONSTRAINT `works_with_ibfk_2` FOREIGN KEY (`truck_id`) REFERENCES `truck` (`truck_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `works_with`
--

LOCK TABLES `works_with` WRITE;
/*!40000 ALTER TABLE `works_with` DISABLE KEYS */;
INSERT INTO `works_with` VALUES (100,4,'Daniel',1400),(101,3,'Lewis',1760),(102,4,'Pierre',1400),(103,3,'Checo',1460),(105,1,'Valtteri',1567),(107,2,'Charles',1870);
/*!40000 ALTER TABLE `works_with` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-11-17 18:22:52
