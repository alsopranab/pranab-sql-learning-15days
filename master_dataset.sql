-- MySQL dump 10.13  Distrib 8.0.36, for macos14 (x86_64)
--
-- Host: 127.0.0.1    Database: pranab_learning
-- ------------------------------------------------------
-- Server version	9.4.0

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
-- Table structure for table `customer_data`
--

DROP TABLE IF EXISTS `customer_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_data` (
  `cust_id` int NOT NULL,
  `cust_name` varchar(100) DEFAULT NULL,
  `country` varchar(50) DEFAULT NULL,
  `state_code` varchar(10) DEFAULT NULL,
  `credit_limit` int DEFAULT NULL,
  PRIMARY KEY (`cust_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_data`
--

LOCK TABLES `customer_data` WRITE;
/*!40000 ALTER TABLE `customer_data` DISABLE KEYS */;
INSERT INTO `customer_data` VALUES (101,'Rohit','India','KA',45000),(102,'Meena','India','MH',120000),(103,'Sameer','USA','CA',90000),(104,'Priya','USA','NY',23000),(105,'Aisha','France',NULL,70000),(106,'Arvind','Spain','MD',82000),(107,'Sonali','Norway',NULL,54000),(108,'Karan','Austria','TS',25000),(109,'Nikita','Australia','SY',61000);
/*!40000 ALTER TABLE `customer_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deletion_log`
--

DROP TABLE IF EXISTS `deletion_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `deletion_log` (
  `log_id` int NOT NULL AUTO_INCREMENT,
  `deleted_cust_id` int DEFAULT NULL,
  `deleted_on` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deletion_log`
--

LOCK TABLES `deletion_log` WRITE;
/*!40000 ALTER TABLE `deletion_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `deletion_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee_master`
--

DROP TABLE IF EXISTS `employee_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee_master` (
  `emp_id` varchar(20) NOT NULL,
  `referral_code` varchar(20) DEFAULT NULL,
  `emp_name` varchar(100) NOT NULL,
  `emp_age` int DEFAULT NULL,
  `join_date` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`emp_id`),
  UNIQUE KEY `referral_code` (`referral_code`),
  CONSTRAINT `employee_master_chk_1` CHECK ((`emp_age` between 21 and 55))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_master`
--

LOCK TABLES `employee_master` WRITE;
/*!40000 ALTER TABLE `employee_master` DISABLE KEYS */;
INSERT INTO `employee_master` VALUES ('E1001','REF101','Arjun',29,'2025-12-06 00:54:50'),('E1002','REF102','Neha',34,'2025-12-06 00:54:50'),('E1003','REF103','Rishi',41,'2025-12-06 00:54:50'),('E1004','REF104','Meera',27,'2025-12-06 00:54:50');
/*!40000 ALTER TABLE `employee_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_items`
--

DROP TABLE IF EXISTS `order_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_items` (
  `order_id` int NOT NULL,
  `product_code` varchar(20) NOT NULL,
  `quantity` int DEFAULT NULL,
  PRIMARY KEY (`order_id`,`product_code`),
  KEY `product_code` (`product_code`),
  CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `order_records` (`order_id`),
  CONSTRAINT `order_items_ibfk_2` FOREIGN KEY (`product_code`) REFERENCES `product_catalog` (`product_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_items`
--

LOCK TABLES `order_items` WRITE;
/*!40000 ALTER TABLE `order_items` DISABLE KEYS */;
INSERT INTO `order_items` VALUES (5001,'P101',2),(5001,'P104',1),(5002,'P103',1),(5003,'P102',3),(5004,'P104',2);
/*!40000 ALTER TABLE `order_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_records`
--

DROP TABLE IF EXISTS `order_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_records` (
  `order_id` int NOT NULL,
  `cust_id` int DEFAULT NULL,
  `order_date` date DEFAULT NULL,
  `order_status` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`order_id`),
  KEY `cust_id` (`cust_id`),
  CONSTRAINT `order_records_ibfk_1` FOREIGN KEY (`cust_id`) REFERENCES `customer_data` (`cust_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_records`
--

LOCK TABLES `order_records` WRITE;
/*!40000 ALTER TABLE `order_records` DISABLE KEYS */;
INSERT INTO `order_records` VALUES (5001,101,'2023-01-11','Confirmed'),(5002,102,'2023-02-15','Shipped'),(5003,103,'2023-03-17','Cancelled'),(5004,103,'2023-04-01','Delivered'),(5005,105,'2023-05-25','Shipped');
/*!40000 ALTER TABLE `order_records` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_history`
--

DROP TABLE IF EXISTS `payment_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment_history` (
  `payment_id` int NOT NULL,
  `cust_id` int DEFAULT NULL,
  `amount` int DEFAULT NULL,
  `payment_date` date DEFAULT NULL,
  PRIMARY KEY (`payment_id`),
  KEY `cust_id` (`cust_id`),
  CONSTRAINT `payment_history_ibfk_1` FOREIGN KEY (`cust_id`) REFERENCES `customer_data` (`cust_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_history`
--

LOCK TABLES `payment_history` WRITE;
/*!40000 ALTER TABLE `payment_history` DISABLE KEYS */;
INSERT INTO `payment_history` VALUES (9001,101,3000,'2023-01-20'),(9002,102,7000,'2023-02-17'),(9003,103,12000,'2023-03-25'),(9004,105,5000,'2023-06-15'),(9005,103,8000,'2023-09-11');
/*!40000 ALTER TABLE `payment_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_catalog`
--

DROP TABLE IF EXISTS `product_catalog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_catalog` (
  `product_code` varchar(20) NOT NULL,
  `product_name` varchar(100) DEFAULT NULL,
  `price` int DEFAULT NULL,
  PRIMARY KEY (`product_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_catalog`
--

LOCK TABLES `product_catalog` WRITE;
/*!40000 ALTER TABLE `product_catalog` DISABLE KEYS */;
INSERT INTO `product_catalog` VALUES ('P101','Wireless Keyboard',1500),('P102','Bluetooth Speaker',2400),('P103','USB Microphone',3500),('P104','Gaming Mouse',2200);
/*!40000 ALTER TABLE `product_catalog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `referral_log`
--

DROP TABLE IF EXISTS `referral_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `referral_log` (
  `ref_id` varchar(20) NOT NULL,
  `ref_emp_id` varchar(20) DEFAULT NULL,
  `ref_name` varchar(100) DEFAULT NULL,
  `ref_date` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ref_id`),
  KEY `ref_emp_id` (`ref_emp_id`),
  CONSTRAINT `referral_log_ibfk_1` FOREIGN KEY (`ref_emp_id`) REFERENCES `employee_master` (`emp_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `referral_log`
--

LOCK TABLES `referral_log` WRITE;
/*!40000 ALTER TABLE `referral_log` DISABLE KEYS */;
INSERT INTO `referral_log` VALUES ('R1','E1001','Lalit','2025-12-06 00:54:50'),('R2','E1002','Anita','2025-12-06 00:54:50'),('R3','E1001','Dev','2025-12-06 00:54:50');
/*!40000 ALTER TABLE `referral_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_report`
--

DROP TABLE IF EXISTS `sales_report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sales_report` (
  `sales_id` int NOT NULL,
  `sales_person` varchar(100) DEFAULT NULL,
  `sales_year` int DEFAULT NULL,
  `amount` int DEFAULT NULL,
  PRIMARY KEY (`sales_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_report`
--

LOCK TABLES `sales_report` WRITE;
/*!40000 ALTER TABLE `sales_report` DISABLE KEYS */;
INSERT INTO `sales_report` VALUES (1,'Arjun',2021,50000),(2,'Arjun',2022,80000),(3,'Neha',2021,45000),(4,'Neha',2022,60000),(5,'Rishi',2021,70000),(6,'Rishi',2022,75000);
/*!40000 ALTER TABLE `sales_report` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-12-06  1:42:06
