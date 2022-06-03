CREATE DATABASE  IF NOT EXISTS `news_project` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `news_project`;
-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: news_project
-- ------------------------------------------------------
-- Server version	8.0.28

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
-- Table structure for table `interaction`
--

DROP TABLE IF EXISTS `interaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `interaction` (
  `news_id` bigint DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  `comments` varchar(800) DEFAULT NULL,
  `commented_date` datetime DEFAULT CURRENT_TIMESTAMP,
  KEY `news_id` (`news_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `interaction_ibfk_1` FOREIGN KEY (`news_id`) REFERENCES `news` (`news_id`) ON DELETE SET NULL,
  CONSTRAINT `interaction_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user_account` (`user_id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `interaction`
--

LOCK TABLES `interaction` WRITE;
/*!40000 ALTER TABLE `interaction` DISABLE KEYS */;
INSERT INTO `interaction` VALUES (14,1,'hello','2022-06-04 01:25:04'),(12,1,'helloasdfasdf','2022-06-04 01:25:04'),(12,2,'Bazinga','2022-06-04 01:25:04'),(12,2,'Bazinga','2022-06-04 01:25:04'),(12,2,'hello','2022-06-04 01:25:04'),(NULL,2,'comment testing\r\n','2022-06-04 01:25:04'),(12,2,'asdfasdf\r\n','2022-06-04 01:25:04'),(14,2,'ssdffdw','2022-06-04 01:25:04'),(20,16,'nice post','2022-06-04 01:40:07'),(20,16,'test','2022-06-04 01:51:41'),(27,16,'testing ','2022-06-04 02:23:45'),(30,16,'asdf','2022-06-04 02:29:08');
/*!40000 ALTER TABLE `interaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `news`
--

DROP TABLE IF EXISTS `news`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `news` (
  `news_id` bigint NOT NULL AUTO_INCREMENT,
  `news_name` varchar(200) DEFAULT NULL,
  `descriptions` varchar(8000) DEFAULT NULL,
  `news_img` varchar(200) DEFAULT NULL,
  `news_location` varchar(200) DEFAULT NULL,
  `news_status` varchar(200) DEFAULT NULL,
  `news_category` int NOT NULL,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_date` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `creator_id` bigint DEFAULT NULL,
  PRIMARY KEY (`news_id`),
  KEY `news_category` (`news_category`),
  KEY `creator_id` (`creator_id`),
  CONSTRAINT `news_ibfk_1` FOREIGN KEY (`news_category`) REFERENCES `news_category` (`news_category_id`),
  CONSTRAINT `news_ibfk_2` FOREIGN KEY (`creator_id`) REFERENCES `user_account` (`user_id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `news`
--

LOCK TABLES `news` WRITE;
/*!40000 ALTER TABLE `news` DISABLE KEYS */;
INSERT INTO `news` VALUES (12,'Testing 1','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin at felis a neque pulvinar dapibus. Suspendisse quis enim sodales, auctor diam ac, hendrerit dolor. Proin suscipit maximus lacus, sit amet blandit enim imperdiet et. Pellentesque ut ligula facilisis, faucibus ipsum id, tempus libero. Etiam a pretium magna. Duis risus nibh, luctus sed nisi semper, tincidunt dictum nibh. Vestibulum eget blandit nisl, in porttitor felis Donec molestie et ante nec molestie. Pellentesque dignissim, ligula quis eleifend lobortis, dui mauris porta risus, vel pulvinar nunc libero quis enim. Nullam ut urna eu justo blandit fermentum cursus ac augue. Fusce euismod elit odio, ac posuere ipsum dictum a. Aliquam congue urna non neque viverra cursus. Suspendisse molestie dictum eros laoreet mattis. Aliquam posuere lorem eget arcu vestibulum venenatis. Pellentesque auctor consequat velit, eget pretium ex. Praesent rutrum orci vel tincidunt venenatis. Vivamus nisl risus, suscipit sed efficitur ut, volutpat sit amet libero','dune.png','Yangon',NULL,3,'2022-06-01 12:00:43','2022-06-03 23:45:10',1),(14,'Testing 3','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin at felis a neque pulvinar dapibus. Suspendisse quis enim sodales, auctor diam ac, hendrerit dolor. Proin suscipit maximus lacus, sit amet blandit enim imperdiet et. Pellentesque ut ligula facilisis, faucibus ipsum id, tempus libero. Etiam a pretium magna. Duis risus nibh, luctus sed nisi semper, tincidunt dictum nibh. Vestibulum eget blandit nisl, in porttitor felis.','lady jessica.jpg','Yangon',NULL,3,'2022-06-01 21:27:32','2022-06-03 23:45:10',1),(15,'Testing 4','asdf23refsvdf','bene_gesserit.jpg','New York',NULL,4,'2022-06-02 14:20:10','2022-06-03 23:45:10',3),(17,'Testing 5','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque commodo magna vitae congue viverra. Maecenas in tincidunt odio, id porttitor purus. Mauris fermentum magna a diam rutrum, vel congue purus commodo. Sed nisi enim, commodo nec lorem nec, laoreet volutpat est. Mauris tincidunt libero dolor, vitae sagittis nunc ultrices pretium. Nunc ultrices rhoncus velit. Sed commodo lectus vel dapibus cursus. Nulla venenatis sagittis tellus eget vehicula.\r\n\r\nVivamus ut viverra nibh. Praesent id augue fermentum, tincidunt massa in, accumsan massa. Phasellus egestas sem velit. Quisque dictum metus a nisi feugiat, sed fermentum urna venenatis. Ut interdum tincidunt felis et sodales. Nullam sodales in neque ut tincidunt. Integer venenatis, magna eu blandit eleifend, lacus lectus luctus risus, et hendrerit nulla enim sed urna. Morbi sagittis scelerisque mattis. Nunc quis lectus malesuada, consequat risus eget, consectetur tortor. Nullam rhoncus scelerisque tincidunt. Vestibulum vel eleifend magna. Maecenas ante erat, ullamcorper non molestie sed, dictum vel metus. Integer vulputate malesuada ex, ac rutrum massa cursus vel. Integer pellentesque quis neque eget blandit.\r\n\r\nSed tristique, velit ut commodo placerat, tellus risus congue lorem, ac fermentum metus quam sit amet libero. Integer et tempor ligula. Quisque eget quam eros. Ut turpis velit, varius eget accumsan ut, mollis ut sem. Praesent sodales neque nulla, sit amet cursus mi dapibus at. Fusce a nisi in neque aliquam fringilla. Mauris efficitur lacus a arcu tincidunt, et feugiat ante molestie. Nunc non faucibus risus. Morbi elementum luctus leo in fermentum. Interdum et malesuada fames ac ante ipsum primis in faucibus. Curabitur tincidunt est a nunc egestas, quis pellentesque risus iaculis.','limmy wake up.jpg','Thailand',NULL,2,'2022-06-04 00:49:28','2022-06-04 00:49:28',2),(20,'Testing 6','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque commodo magna vitae congue viverra. Maecenas in tincidunt odio, id porttitor purus. Mauris fermentum magna a diam rutrum, vel congue purus commodo. Sed nisi enim, commodo nec lorem nec, laoreet volutpat est. Mauris tincidunt libero dolor, vitae sagittis nunc ultrices pretium. Nunc ultrices rhoncus velit. Sed commodo lectus vel dapibus cursus. Nulla venenatis sagittis tellus eget vehicula.\r\n\r\nVivamus ut viverra nibh. Praesent id augue fermentum, tincidunt massa in, accumsan massa. Phasellus egestas sem velit. Quisque dictum metus a nisi feugiat, sed fermentum urna venenatis. Ut interdum tincidunt felis et sodales. Nullam sodales in neque ut tincidunt. Integer venenatis, magna eu blandit eleifend, lacus lectus luctus risus, et hendrerit nulla enim sed urna. Morbi sagittis scelerisque mattis. Nunc quis lectus malesuada, consequat risus eget, consectetur tortor. Nullam rhoncus scelerisque tincidunt. Vestibulum vel eleifend magna. Maecenas ante erat, ullamcorper non molestie sed, dictum vel metus. Integer vulputate malesuada ex, ac rutrum massa cursus vel. Integer pellentesque quis neque eget blandit.\r\n\r\nSed tristique, velit ut commodo placerat, tellus risus congue lorem, ac fermentum metus quam sit amet libero. Integer et tempor ligula. Quisque eget quam eros. Ut turpis velit, varius eget accumsan ut, mollis ut sem. Praesent sodales neque nulla, sit amet cursus mi dapibus at. Fusce a nisi in neque aliquam fringilla. Mauris efficitur lacus a arcu tincidunt, et feugiat ante molestie. Nunc non faucibus risus. Morbi elementum luctus leo in fermentum. Interdum et malesuada fames ac ante ipsum primis in faucibus. Curabitur tincidunt est a nunc egestas, quis pellentesque risus iaculis.','space.jpg','Yangon',NULL,1,'2022-06-04 00:54:09','2022-06-04 00:54:09',16),(25,'Testing 7','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque commodo magna vitae congue viverra. Maecenas in tincidunt odio, id porttitor purus. Mauris fermentum magna a diam rutrum, vel congue purus commodo. Sed nisi enim, commodo nec lorem nec, laoreet volutpat est. Mauris tincidunt libero dolor, vitae sagittis nunc ultrices pretium. Nunc ultrices rhoncus velit. Sed commodo lectus vel dapibus cursus. Nulla venenatis sagittis tellus eget vehicula.\r\n\r\nVivamus ut viverra nibh. Praesent id augue fermentum, tincidunt massa in, accumsan massa. Phasellus egestas sem velit. Quisque dictum metus a nisi feugiat, sed fermentum urna venenatis. Ut interdum tincidunt felis et sodales. Nullam sodales in neque ut tincidunt. Integer venenatis, magna eu blandit eleifend, lacus lectus luctus risus, et hendrerit nulla enim sed urna. Morbi sagittis scelerisque mattis. Nunc quis lectus malesuada, consequat risus eget, consectetur tortor. Nullam rhoncus scelerisque tincidunt. Vestibulum vel eleifend magna. Maecenas ante erat, ullamcorper non molestie sed, dictum vel metus. Integer vulputate malesuada ex, ac rutrum massa cursus vel. Integer pellentesque quis neque eget blandit.\r\n\r\nSed tristique, velit ut commodo placerat, tellus risus congue lorem, ac fermentum metus quam sit amet libero. Integer et tempor ligula. Quisque eget quam eros. Ut turpis velit, varius eget accumsan ut, mollis ut sem. Praesent sodales neque nulla, sit amet cursus mi dapibus at. Fusce a nisi in neque aliquam fringilla. Mauris efficitur lacus a arcu tincidunt, et feugiat ante molestie. Nunc non faucibus risus. Morbi elementum luctus leo in fermentum. Interdum et malesuada fames ac ante ipsum primis in faucibus. Curabitur tincidunt est a nunc egestas, quis pellentesque risus iaculis.','search.PNG','Mandalay',NULL,1,'2022-06-04 00:59:00','2022-06-04 00:59:00',16),(27,'Testing 2 ','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque commodo magna vitae congue viverra. Maecenas in tincidunt odio, id porttitor purus. Mauris fermentum magna a diam rutrum, vel congue purus commodo. Sed nisi enim, commodo nec lorem nec, laoreet volutpat est. Mauris tincidunt libero dolor, vitae sagittis nunc ultrices pretium. Nunc ultrices rhoncus velit. Sed commodo lectus vel dapibus cursus. Nulla venenatis sagittis tellus eget vehicula.\r\n\r\nVivamus ut viverra nibh. Praesent id augue fermentum, tincidunt massa in, accumsan massa. Phasellus egestas sem velit. Quisque dictum metus a nisi feugiat, sed fermentum urna venenatis. Ut interdum tincidunt felis et sodales. Nullam sodales in neque ut tincidunt. Integer venenatis, magna eu blandit eleifend, lacus lectus luctus risus, et hendrerit nulla enim sed urna. Morbi sagittis scelerisque mattis. Nunc quis lectus malesuada, consequat risus eget, consectetur tortor. Nullam rhoncus scelerisque tincidunt. Vestibulum vel eleifend magna. Maecenas ante erat, ullamcorper non molestie sed, dictum vel metus. Integer vulputate malesuada ex, ac rutrum massa cursus vel. Integer pellentesque quis neque eget blandit.\r\n\r\nSed tristique, velit ut commodo placerat, tellus risus congue lorem, ac fermentum metus quam sit amet libero. Integer et tempor ligula. Quisque eget quam eros. Ut turpis velit, varius eget accumsan ut, mollis ut sem. Praesent sodales neque nulla, sit amet cursus mi dapibus at. Fusce a nisi in neque aliquam fringilla. Mauris efficitur lacus a arcu tincidunt, et feugiat ante molestie. Nunc non faucibus risus. Morbi elementum luctus leo in fermentum. Interdum et malesuada fames ac ante ipsum primis in faucibus. Curabitur tincidunt est a nunc egestas, quis pellentesque risus iaculis.','limmy.png','Taunggyi',NULL,2,'2022-06-04 01:01:05','2022-06-04 01:01:05',16),(28,'Testing 8','Ut ultricies tempus odio vel ultricies. Nam rhoncus, lorem nec elementum vestibulum, nisl augue pharetra metus, ac auctor magna arcu at lorem. Nulla ex mi, tincidunt at auctor nec, volutpat consequat magna. Integer id mi ligula. Mauris vitae molestie velit. Morbi ac sem ut mauris posuere facilisis eu sit amet purus. Morbi rhoncus, diam auctor dapibus mollis, neque risus aliquet neque, tincidunt ornare tellus ex nec dolor. Fusce vitae sem tempor, ornare arcu sed, faucibus nunc. Donec at eros quis elit porttitor convallis id eu metus.\r\n\r\nAliquam odio ligula, gravida a eros in, suscipit imperdiet neque. Maecenas rutrum ullamcorper enim in tristique. Nunc ut convallis ex. Pellentesque sem justo, aliquam non neque non, maximus ultricies lorem. Maecenas in ligula neque. Aenean sit amet pharetra nunc, nec tincidunt tellus. Sed cursus cursus eros, et vehicula dolor malesuada vitae. Proin imperdiet sapien lacinia velit consequat pharetra. Nam eget iaculis odio, sed placerat lacus. Nullam non tincidunt diam, aliquam congue mi. In hac habitasse platea dictumst. Praesent luctus, urna sit amet ultricies efficitur, metus magna molestie mauris, ut maximus metus massa ut erat. Aenean ac diam mi.\r\n\r\nAliquam elementum ex eu lorem dignissim, in blandit erat pellentesque. Praesent sed pellentesque mi. In vitae ex neque. Vestibulum congue libero sit amet volutpat fermentum. Praesent lorem sem, dapibus ut rhoncus sit amet, finibus et mauris. Duis porta ipsum dictum sem vulputate, eu mattis turpis molestie. Nunc vel lectus commodo, viverra erat vitae, suscipit nisl. Suspendisse sed finibus leo, in pellentesque ante. Donec at leo tempor, rutrum risus sed, condimentum diam. Duis vitae eleifend nunc, et semper odio. Integer mollis ante eros, ac finibus risus scelerisque at. Cras sed augue nulla. Cras luctus lorem at nibh feugiat lobortis. In sem urna, rutrum eget dapibus in, euismod vehicula ante. Fusce convallis porta erat rhoncus maximus.','commuDoggo.jpg','Yangon',NULL,3,'2022-06-04 02:19:23','2022-06-04 02:19:23',16),(29,'Testing 9','Ut ultricies tempus odio vel ultricies. Nam rhoncus, lorem nec elementum vestibulum, nisl augue pharetra metus, ac auctor magna arcu at lorem. Nulla ex mi, tincidunt at auctor nec, volutpat consequat magna. Integer id mi ligula. Mauris vitae molestie velit. Morbi ac sem ut mauris posuere facilisis eu sit amet purus. Morbi rhoncus, diam auctor dapibus mollis, neque risus aliquet neque, tincidunt ornare tellus ex nec dolor. Fusce vitae sem tempor, ornare arcu sed, faucibus nunc. Donec at eros quis elit porttitor convallis id eu metus.\r\n\r\nAliquam odio ligula, gravida a eros in, suscipit imperdiet neque. Maecenas rutrum ullamcorper enim in tristique. Nunc ut convallis ex. Pellentesque sem justo, aliquam non neque non, maximus ultricies lorem. Maecenas in ligula neque. Aenean sit amet pharetra nunc, nec tincidunt tellus. Sed cursus cursus eros, et vehicula dolor malesuada vitae. Proin imperdiet sapien lacinia velit consequat pharetra. Nam eget iaculis odio, sed placerat lacus. Nullam non tincidunt diam, aliquam congue mi. In hac habitasse platea dictumst. Praesent luctus, urna sit amet ultricies efficitur, metus magna molestie mauris, ut maximus metus massa ut erat. Aenean ac diam mi.\r\n\r\nAliquam elementum ex eu lorem dignissim, in blandit erat pellentesque. Praesent sed pellentesque mi. In vitae ex neque. Vestibulum congue libero sit amet volutpat fermentum. Praesent lorem sem, dapibus ut rhoncus sit amet, finibus et mauris. Duis porta ipsum dictum sem vulputate, eu mattis turpis molestie. Nunc vel lectus commodo, viverra erat vitae, suscipit nisl. Suspendisse sed finibus leo, in pellentesque ante. Donec at leo tempor, rutrum risus sed, condimentum diam. Duis vitae eleifend nunc, et semper odio. Integer mollis ante eros, ac finibus risus scelerisque at. Cras sed augue nulla. Cras luctus lorem at nibh feugiat lobortis. In sem urna, rutrum eget dapibus in, euismod vehicula ante. Fusce convallis porta erat rhoncus maximus.','desktopserver.PNG','Mandalay',NULL,9,'2022-06-04 02:22:55','2022-06-04 02:22:55',16),(30,'adf','Ut ultricies tempus odio vel ultricies. Nam rhoncus, lorem nec elementum vestibulum, nisl augue pharetra metus, ac auctor magna arcu at lorem. Nulla ex mi, tincidunt at auctor nec, volutpat consequat magna. Integer id mi ligula. Mauris vitae molestie velit. Morbi ac sem ut mauris posuere facilisis eu sit amet purus. Morbi rhoncus, diam auctor dapibus mollis, neque risus aliquet neque, tincidunt ornare tellus ex nec dolor. Fusce vitae sem tempor, ornare arcu sed, faucibus nunc. Donec at eros quis elit porttitor convallis id eu metus.\r\n\r\nAliquam odio ligula, gravida a eros in, suscipit imperdiet neque. Maecenas rutrum ullamcorper enim in tristique. Nunc ut convallis ex. Pellentesque sem justo, aliquam non neque non, maximus ultricies lorem. Maecenas in ligula neque. Aenean sit amet pharetra nunc, nec tincidunt tellus. Sed cursus cursus eros, et vehicula dolor malesuada vitae. Proin imperdiet sapien lacinia velit consequat pharetra. Nam eget iaculis odio, sed placerat lacus. Nullam non tincidunt diam, aliquam congue mi. In hac habitasse platea dictumst. Praesent luctus, urna sit amet ultricies efficitur, metus magna molestie mauris, ut maximus metus massa ut erat. Aenean ac diam mi.\r\n\r\nAliquam elementum ex eu lorem dignissim, in blandit erat pellentesque. Praesent sed pellentesque mi. In vitae ex neque. Vestibulum congue libero sit amet volutpat fermentum. Praesent lorem sem, dapibus ut rhoncus sit amet, finibus et mauris. Duis porta ipsum dictum sem vulputate, eu mattis turpis molestie. Nunc vel lectus commodo, viverra erat vitae, suscipit nisl. Suspendisse sed finibus leo, in pellentesque ante. Donec at leo tempor, rutrum risus sed, condimentum diam. Duis vitae eleifend nunc, et semper odio. Integer mollis ante eros, ac finibus risus scelerisque at. Cras sed augue nulla. Cras luctus lorem at nibh feugiat lobortis. In sem urna, rutrum eget dapibus in, euismod vehicula ante. Fusce convallis porta erat rhoncus maximus.','database.PNG','jjj',NULL,2,'2022-06-04 02:28:39','2022-06-04 02:28:39',16);
/*!40000 ALTER TABLE `news` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `news_category`
--

DROP TABLE IF EXISTS `news_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `news_category` (
  `news_category_id` int NOT NULL AUTO_INCREMENT,
  `news_category_name` varchar(200) NOT NULL,
  PRIMARY KEY (`news_category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `news_category`
--

LOCK TABLES `news_category` WRITE;
/*!40000 ALTER TABLE `news_category` DISABLE KEYS */;
INSERT INTO `news_category` VALUES (1,'sports'),(2,'covid'),(3,'weather'),(4,'international news'),(7,'Entertainment'),(8,'Politic'),(9,'Global'),(10,'covid 19');
/*!40000 ALTER TABLE `news_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_account`
--

DROP TABLE IF EXISTS `user_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_account` (
  `user_id` bigint NOT NULL AUTO_INCREMENT,
  `user_name` varchar(100) DEFAULT NULL,
  `user_role` int DEFAULT NULL,
  `user_email` varchar(100) DEFAULT NULL,
  `user_password` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  KEY `user_role` (`user_role`),
  CONSTRAINT `user_account_ibfk_1` FOREIGN KEY (`user_role`) REFERENCES `user_role` (`user_role_id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_account`
--

LOCK TABLES `user_account` WRITE;
/*!40000 ALTER TABLE `user_account` DISABLE KEYS */;
INSERT INTO `user_account` VALUES (1,'joey',3,'joey@gmail.com','iLovePizza'),(2,'sheldon',1,'sheldon@gmail.com','iLovePhysics'),(3,'leonard',3,'leonard@gmail.com','iLovePenny'),(4,'ahkar',2,'ahkar@gmail.com','ahkar'),(10,'gollum',3,'gollum@gmail.com','gollum'),(11,'zoey',3,'zoey@gmail.com','hello'),(12,'toe',3,'toe@gmail.com','toe'),(13,'theingi',3,'theingi@gmail.com','theingi'),(14,'maw',3,'maw@gmail.com','maw'),(16,'asdf',1,'asdf@gmail.com','asdf');
/*!40000 ALTER TABLE `user_account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_role`
--

DROP TABLE IF EXISTS `user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_role` (
  `user_role_id` int NOT NULL AUTO_INCREMENT,
  `user_role_name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`user_role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_role`
--

LOCK TABLES `user_role` WRITE;
/*!40000 ALTER TABLE `user_role` DISABLE KEYS */;
INSERT INTO `user_role` VALUES (1,'admin'),(2,'reporter'),(3,'user');
/*!40000 ALTER TABLE `user_role` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-06-04  2:38:05
