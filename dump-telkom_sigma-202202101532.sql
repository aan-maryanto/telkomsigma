-- MySQL dump 10.13  Distrib 5.5.62, for Win64 (AMD64)
--
-- Host: 127.0.0.1    Database: telkom_sigma
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.17-MariaDB

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
-- Table structure for table `tbl_aplikasi`
--

DROP TABLE IF EXISTS `tbl_aplikasi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_aplikasi` (
  `id_aplikasi` int(11) NOT NULL AUTO_INCREMENT,
  `nama_aplikasi` varchar(100) NOT NULL,
  `create_date` datetime DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id_aplikasi`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_aplikasi`
--

LOCK TABLES `tbl_aplikasi` WRITE;
/*!40000 ALTER TABLE `tbl_aplikasi` DISABLE KEYS */;
INSERT INTO `tbl_aplikasi` VALUES (1,'Great Human Resources','2022-02-10 09:42:58','2022-02-10 09:42:58'),(2,'Employee Finance','2022-02-10 09:42:58','2022-02-10 09:42:58');
/*!40000 ALTER TABLE `tbl_aplikasi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_pegawai`
--

DROP TABLE IF EXISTS `tbl_pegawai`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_pegawai` (
  `id_pegawai` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) NOT NULL,
  `fullname` varchar(100) NOT NULL,
  `create_date` datetime DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id_pegawai`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_pegawai`
--

LOCK TABLES `tbl_pegawai` WRITE;
/*!40000 ALTER TABLE `tbl_pegawai` DISABLE KEYS */;
INSERT INTO `tbl_pegawai` VALUES (1,'19992008','Jonathan James','2022-02-10 09:44:47','2022-02-10 09:44:47');
/*!40000 ALTER TABLE `tbl_pegawai` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_pegawai_role`
--

DROP TABLE IF EXISTS `tbl_pegawai_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_pegawai_role` (
  `id_pegawai_role` int(11) NOT NULL AUTO_INCREMENT,
  `pegawai_id` int(11) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_pegawai_role`),
  KEY `pegawai_id` (`pegawai_id`),
  KEY `role_id` (`role_id`),
  CONSTRAINT `tbl_pegawai_role_ibfk_1` FOREIGN KEY (`pegawai_id`) REFERENCES `tbl_pegawai` (`id_pegawai`),
  CONSTRAINT `tbl_pegawai_role_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `tbl_roles` (`id_role`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_pegawai_role`
--

LOCK TABLES `tbl_pegawai_role` WRITE;
/*!40000 ALTER TABLE `tbl_pegawai_role` DISABLE KEYS */;
INSERT INTO `tbl_pegawai_role` VALUES (1,1,1),(2,1,2),(3,1,3);
/*!40000 ALTER TABLE `tbl_pegawai_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_roles`
--

DROP TABLE IF EXISTS `tbl_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_roles` (
  `id_role` int(11) NOT NULL AUTO_INCREMENT,
  `nama_role` varchar(50) NOT NULL,
  `aplikasi` int(11) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id_role`),
  KEY `aplikasi` (`aplikasi`),
  CONSTRAINT `tbl_roles_ibfk_1` FOREIGN KEY (`aplikasi`) REFERENCES `tbl_aplikasi` (`id_aplikasi`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_roles`
--

LOCK TABLES `tbl_roles` WRITE;
/*!40000 ALTER TABLE `tbl_roles` DISABLE KEYS */;
INSERT INTO `tbl_roles` VALUES (1,'admin',1,'2022-02-10 10:49:54','2022-02-10 10:49:54'),(2,'user',1,'2022-02-10 10:49:54','2022-02-10 10:49:54'),(3,'employee',2,'2022-02-10 10:49:54','2022-02-10 10:49:54');
/*!40000 ALTER TABLE `tbl_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'telkom_sigma'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-02-10 15:32:28
