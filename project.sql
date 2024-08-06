-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: localhost    Database: pharmaconnect
-- ------------------------------------------------------
-- Server version	8.0.33

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
-- Table structure for table `contact`
--

DROP TABLE IF EXISTS `contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contact` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `tel` varchar(45) NOT NULL,
  `message` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact`
--

LOCK TABLES `contact` WRITE;
/*!40000 ALTER TABLE `contact` DISABLE KEYS */;
INSERT INTO `contact` VALUES (1,'Dinitha Fernando','dinithatharuka@outlook.com','0788132034','test'),(3,'Dinitha Fernando','dinithatharuka@outlook.com','0788132034','Hello'),(4,'Dinitha Fernando','dinithatharuka@outlook.com','0788132034','Hello');
/*!40000 ALTER TABLE `contact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fname` varchar(45) NOT NULL,
  `lname` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `age` int DEFAULT NULL,
  `gender` varchar(10) DEFAULT 'Not Set',
  `tel` char(10) DEFAULT 'Not Set',
  `address` varchar(200) DEFAULT 'Not Set',
  PRIMARY KEY (`id`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (16,'Admin','Admin','admin@admin.com','admin',22,'Not Set',NULL,NULL),(19,'Dinitha','Fernando','dinithatharuka@outlook.com','123',22,'Male','0788132034','No : 77/32 Thalpitiya North\r\nCentral Road, Wadduwa 12560'),(21,'Dinitha','Fernando','amara@gmail.com','123',22,'Male','','No : 77/32 Thalpitiya North\r\nCentral Road'),(25,'Vinuka','Perera','vinuka@gmail.com','123',23,'Male','056235400','Panadura'),(26,'Dinuka','Chamara','dinuka@gmail.com','123',30,'Male','0714470543','Wadduwa'),(30,'Isuru','Danuddara','isuru@gmail.com','123',22,'Male','079561234','Hirana Panadura'),(32,'sads','sdc','as@gmail.com','123',234,'Not Set','Not Set','Not Set');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `drugs`
--

DROP TABLE IF EXISTS `drugs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `drugs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `photo` varchar(300) DEFAULT NULL,
  `name` varchar(30) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `drugs`
--

LOCK TABLES `drugs` WRITE;
/*!40000 ALTER TABLE `drugs` DISABLE KEYS */;
INSERT INTO `drugs` VALUES (1,'https://unionchemistspharmacy.lk/wp-content/uploads/2022/11/Panadol-Tablets.jpg','Panadol',100.00,'Panadol Original Tablets is a mild analgesic and antipyretic, and is recommended for the treatment of most painful and febrile conditions, for example, headache including migraine and tension headaches, toothache, backache, rheumatic and muscle pains, dysmenorrhoea, sore throat, and for relieving the fever'),(2,'https://5.imimg.com/data5/LP/XU/GZ/SELLER-5959211/vitamin-c-d3-zinc-500x500.jpg','Vitamin C',20.00,'A nutrient that the body needs in small amounts to function and stay healthy. Vitamin C helps fight infections, heal wounds, and keep tissues healthy. It is an antioxidant that helps prevent cell damage caused by free radicals'),(3,'https://spmc.gov.lk/?w=630&h=630&src=resources/221/p.jpg','Tramadol Capsule ',500.00,'Descriptions. Tramadol is used to relieve moderate to moderately severe pain, including pain after surgery. It is also used to treat pain severe enough to require opioid treatment and when other pain medicines did not work well enough or cannot be tolerated'),(4,'https://m.media-amazon.com/images/I/61UA8+7e7KL.SS700.jpg','Plaster',200.50,'Plasters help to control bleeding for minor wounds, by holding your blood platelets in place to build on each other and form a clot. Plasters reduce the chance of your wound becoming infected by creating a barrier to bacteria.'),(5,'https://5.imimg.com/data5/SELLER/Default/2023/7/330506870/UM/GZ/QO/135658020/aspirin-dispersible-tablets-500x500.jpg','Aspirin',100.25,'Aspirin is in a group of medications called salicylates. It works by stopping the production of certain natural substances that cause fever, pain, swelling, and blood clots. Aspirin is also available in combination with other medications such as antacids, pain relievers, and cough and cold medications.'),(6,'https://5.imimg.com/data5/SELLER/Default/2023/4/301540770/DX/RS/AD/7034457/ibuprofen-tablets-250x250.jpg','Ibuprofen Table',240.00,'Descriptions. Ibuprofen is a nonsteroidal anti-inflammatory drug (NSAID) used to treat mild to moderate pain, and helps to relieve symptoms of arthritis (osteoarthritis, rheumatoid arthritis, or juvenile arthritis), such as inflammation, swelling, stiffness, and joint pain.'),(7,'https://5.imimg.com/data5/GLADMIN/Default/2022/6/JV/EM/RL/43668/antacid-tablets-250x250.jpg','Antacid Tablets',120.00,'Antacids are a medicine that relieves heartburn and indigestion by reducing the amount of acid in your stomach. Antacids neutralize the acid in your stomach by stopping an enzyme that creates acid to break down food for digestion (pepsin). You can purchase antacids over-the-counter without a prescription.'),(8,'https://cdn-icdmj.nitrocdn.com/GutKUNIyAcwzRpHKhaZtOaQphiXwIPgT/assets/images/optimized/rev-e69a362/www.biobrickpharma.com/wp-content/uploads/2018/01/BRORAB-LS-5.jpg','BRORAB-LS',225.00,'Brorab-LS Capsule SR is a prescription medicine which is used in the treatment of gastroesophageal reflux disease (acid reflux), intestinal ulcers, and irritable bowel syndrome. It reduces excess acid production in the stomach and prevents the reflux of stomach acid into the food pipe.'),(9,'https://cdn-icdmj.nitrocdn.com/GutKUNIyAcwzRpHKhaZtOaQphiXwIPgT/assets/images/optimized/rev-e69a362/www.biobrickpharma.com/wp-content/uploads/2018/01/HALPAN-DSR-3.jpg','HALPAN-DSR',80.00,'Ulpan-DSR Capsule is a condition where the acid in the stomach flows back up into the food pipe (esophagus). It is also used to treat gastric and duodenal ulcers.'),(10,'https://spmc.gov.lk/?w=630&h=630&src=resources/147/p.jpg','Amoxicillin Capsules ',55.00,'Amoxicillin is a penicillin antibiotic. It is used to treat bacterial infections, such as chest infections (including pneumonia) and dental abscesses. It can also be used together with other antibiotics and medicines to treat stomach ulcers.');
/*!40000 ALTER TABLE `drugs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fname` varchar(45) DEFAULT NULL,
  `lname` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  `tel` char(10) DEFAULT NULL,
  `pname` varchar(45) DEFAULT NULL,
  `qty` varchar(45) DEFAULT NULL,
  `payment` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (6,'Dinitha','Fernando','dinithatharuka@outlook.com',' No : 77/32 Thalpitiya North\r\nCentral Road ','0788132034','Panadol','5','Bank Transfer'),(12,'Dinitha','Fernando','amara@gmail.com','No : 77/32 Thalpitiya North\r\nCentral Road','0788132034','Panadol','2','Bank Transfer'),(13,'Dinuka','Chamara','dinuka@gmail.com',' Wadduwa ','0714470543','Panadol','3','Bank Transfer'),(16,'Isuru','Danuddara','isuru@gmail.com','Hirana','0385623','Panadol','3','Bank Transfer'),(17,'Isuru','Danuddara','isuru@gmail.com','Hirana','07856235','Panadol','3','Frimi'),(18,'Dinitha','Fernando','dinithatharuka@outlook.com',' No : 77/32 Thalpitiya North\r\nCentral Road, Wadduwa 12560 ','0788132034','Plaster','2','Frimi'),(23,'Isuru','Danuddara','isuru@gmail.com',' Hirana Panadura ','079561234','Panadol','2','Genie');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prescription`
--

DROP TABLE IF EXISTS `prescription`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prescription` (
  `id` int NOT NULL AUTO_INCREMENT,
  `description` varchar(45) DEFAULT NULL,
  `prescription` longblob,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;


/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-05-24 13:56:14
