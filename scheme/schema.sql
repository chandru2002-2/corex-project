-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: localhost    Database: corex
-- ------------------------------------------------------
-- Server version	8.0.40

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
-- Table structure for table `audit_logs`
--

DROP TABLE IF EXISTS `audit_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `audit_logs` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `endpoint` varchar(255) DEFAULT NULL,
  `ip_address` varchar(255) DEFAULT NULL,
  `method` varchar(255) DEFAULT NULL,
  `status` int NOT NULL,
  `timestamp` datetime(6) DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  `status_type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=161 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audit_logs`
--

LOCK TABLES `audit_logs` WRITE;
/*!40000 ALTER TABLE `audit_logs` DISABLE KEYS */;
INSERT INTO `audit_logs` VALUES (1,'/api/admin','0:0:0:0:0:0:0:1','GET',200,'2026-04-18 11:08:31.618903',3,NULL),(2,'/api/admin','127.0.0.1','GET',200,'2026-04-18 11:25:53.330461',3,'SUCCESS'),(3,'/admin/metrics','127.0.0.1','POST',403,'2026-04-18 11:46:47.024087',NULL,'ERROR'),(4,'/auth/login','127.0.0.1','POST',200,'2026-04-18 11:49:11.851620',NULL,'SUCCESS'),(5,'/admin/metrics','127.0.0.1','GET',200,'2026-04-18 11:49:34.136307',3,'SUCCESS'),(6,'/index.html','127.0.0.1','GET',403,'2026-04-18 12:11:54.061740',NULL,'ERROR'),(7,'/index.html','127.0.0.1','GET',403,'2026-04-18 12:11:55.485067',NULL,'ERROR'),(8,'/index.html','127.0.0.1','GET',403,'2026-04-18 12:14:41.871493',NULL,'ERROR'),(9,'/index.html','127.0.0.1','GET',403,'2026-04-18 12:14:43.392713',NULL,'ERROR'),(10,'/index.html','127.0.0.1','GET',403,'2026-04-18 12:14:48.795186',NULL,'ERROR'),(11,'/','127.0.0.1','GET',200,'2026-04-18 12:15:43.868385',NULL,'SUCCESS'),(12,'/favicon.ico','127.0.0.1','GET',403,'2026-04-18 12:15:43.900526',NULL,'ERROR'),(13,'/','127.0.0.1','GET',403,'2026-04-18 12:17:02.239018',NULL,'ERROR'),(14,'/swagger-ui/index.html','127.0.0.1','GET',404,'2026-04-18 12:20:02.579898',NULL,'ERROR'),(15,'/swagger-ui/index.html','127.0.0.1','GET',404,'2026-04-18 12:21:00.312891',NULL,'ERROR'),(16,'/swagger-ui/swagger-ui-standalone-preset.js','127.0.0.1','GET',200,'2026-04-18 12:23:47.686917',NULL,'SUCCESS'),(17,'/swagger-ui/index.html','127.0.0.1','GET',200,'2026-04-18 12:23:47.655439',NULL,'SUCCESS'),(18,'/swagger-ui/index.css','127.0.0.1','GET',200,'2026-04-18 12:23:47.681905',NULL,'SUCCESS'),(19,'/swagger-ui/swagger-ui-bundle.js','127.0.0.1','GET',200,'2026-04-18 12:23:47.700133',NULL,'SUCCESS'),(20,'/swagger-ui/swagger-initializer.js','127.0.0.1','GET',200,'2026-04-18 12:23:47.716252',NULL,'SUCCESS'),(21,'/swagger-ui/swagger-ui.css','127.0.0.1','GET',200,'2026-04-18 12:23:47.895291',NULL,'SUCCESS'),(22,'/swagger-ui/favicon-32x32.png','127.0.0.1','GET',200,'2026-04-18 12:23:47.979828',NULL,'SUCCESS'),(23,'/v3/api-docs/swagger-config','127.0.0.1','GET',200,'2026-04-18 12:23:48.021763',NULL,'SUCCESS'),(24,'/v3/api-docs','127.0.0.1','GET',200,'2026-04-18 12:23:48.377906',NULL,'SUCCESS'),(25,'/auth/login','127.0.0.1','POST',200,'2026-04-18 12:24:27.999230',NULL,'SUCCESS'),(26,'/api/user','127.0.0.1','GET',403,'2026-04-18 12:25:57.026970',NULL,'ERROR'),(27,'/swagger-ui/swagger-ui-standalone-preset.js','127.0.0.1','GET',200,'2026-04-18 12:31:24.851064',NULL,'SUCCESS'),(28,'/swagger-ui/index.css','127.0.0.1','GET',200,'2026-04-18 12:31:24.846601',NULL,'SUCCESS'),(29,'/swagger-ui/index.html','127.0.0.1','GET',200,'2026-04-18 12:31:24.823834',NULL,'SUCCESS'),(30,'/swagger-ui/swagger-ui-bundle.js','127.0.0.1','GET',200,'2026-04-18 12:31:24.861535',NULL,'SUCCESS'),(31,'/swagger-ui/swagger-initializer.js','127.0.0.1','GET',200,'2026-04-18 12:31:24.881225',NULL,'SUCCESS'),(32,'/swagger-ui/swagger-ui.css','127.0.0.1','GET',200,'2026-04-18 12:31:25.038615',NULL,'SUCCESS'),(33,'/swagger-ui/favicon-32x32.png','127.0.0.1','GET',200,'2026-04-18 12:31:25.114842',NULL,'SUCCESS'),(34,'/v3/api-docs/swagger-config','127.0.0.1','GET',200,'2026-04-18 12:31:25.158970',NULL,'SUCCESS'),(35,'/v3/api-docs','127.0.0.1','GET',200,'2026-04-18 12:31:25.505956',NULL,'SUCCESS'),(36,'/auth/register','127.0.0.1','OPTIONS',200,'2026-04-18 15:11:12.056221',NULL,'SUCCESS'),(37,'/auth/register','127.0.0.1','POST',403,'2026-04-18 15:11:12.290384',NULL,'ERROR'),(38,'/auth/login','127.0.0.1','OPTIONS',200,'2026-04-18 15:12:04.139416',NULL,'SUCCESS'),(39,'/auth/login','127.0.0.1','POST',200,'2026-04-18 15:12:04.360451',NULL,'SUCCESS'),(40,'/admin/audit','127.0.0.1','OPTIONS',403,'2026-04-18 15:12:33.100553',NULL,'ERROR'),(41,'/admin/metrics','127.0.0.1','OPTIONS',403,'2026-04-18 15:12:36.691594',NULL,'ERROR'),(42,'/auth/logout','127.0.0.1','OPTIONS',200,'2026-04-18 15:13:04.324054',NULL,'SUCCESS'),(43,'/auth/logout','127.0.0.1','POST',401,'2026-04-18 15:13:04.354367',NULL,'ERROR'),(44,'/admin/audit','127.0.0.1','OPTIONS',403,'2026-04-18 18:56:21.083627',NULL,'ERROR'),(45,'/auth/login','127.0.0.1','OPTIONS',200,'2026-04-18 19:08:13.612665',NULL,'SUCCESS'),(46,'/auth/login','127.0.0.1','POST',200,'2026-04-18 19:08:13.927292',NULL,'SUCCESS'),(47,'/admin/audit','127.0.0.1','OPTIONS',403,'2026-04-18 19:08:33.852774',NULL,'ERROR'),(48,'/admin/audit','127.0.0.1','OPTIONS',403,'2026-04-18 19:14:02.446017',NULL,'ERROR'),(49,'/auth/login','127.0.0.1','POST',200,'2026-04-18 19:14:21.801236',NULL,'SUCCESS'),(50,'/admin/metrics','127.0.0.1','OPTIONS',403,'2026-04-18 19:16:50.650707',NULL,'ERROR'),(51,'/auth/logout','127.0.0.1','OPTIONS',200,'2026-04-18 19:16:52.634079',NULL,'SUCCESS'),(52,'/auth/logout','127.0.0.1','POST',400,'2026-04-18 19:16:52.670967',3,'ERROR'),(53,'/admin/audit','127.0.0.1','OPTIONS',403,'2026-04-18 19:17:35.283094',NULL,'ERROR'),(54,'/auth/logout','127.0.0.1','POST',400,'2026-04-18 19:21:41.988209',3,'ERROR'),(55,'/auth/register','127.0.0.1','OPTIONS',200,'2026-04-18 19:37:02.574110',NULL,'SUCCESS'),(56,'/auth/register','127.0.0.1','POST',403,'2026-04-18 19:37:02.843328',NULL,'ERROR'),(57,'/auth/register','127.0.0.1','POST',403,'2026-04-18 19:37:50.513490',NULL,'ERROR'),(58,'/auth/register','127.0.0.1','POST',403,'2026-04-18 19:38:00.581119',NULL,'ERROR'),(59,'/auth/login','127.0.0.1','POST',200,'2026-04-18 19:38:49.086543',NULL,'SUCCESS'),(60,'/auth/register','127.0.0.1','POST',200,'2026-04-18 19:40:46.343382',NULL,'SUCCESS'),(61,'/admin/audit','127.0.0.1','OPTIONS',403,'2026-04-18 19:41:35.281567',NULL,'ERROR'),(62,'/auth/admin/register','127.0.0.1','OPTIONS',200,'2026-04-18 19:44:45.142133',NULL,'SUCCESS'),(63,'/auth/admin/register','127.0.0.1','POST',404,'2026-04-18 19:44:45.198234',3,'ERROR'),(64,'/auth/create-admin','127.0.0.1','POST',404,'2026-04-18 19:47:00.386790',NULL,'ERROR'),(65,'/admin/metrics','127.0.0.1','GET',403,'2026-04-18 19:49:20.790037',3,'ERROR'),(66,'/auth/login','127.0.0.1','POST',200,'2026-04-18 19:49:32.406482',NULL,'SUCCESS'),(67,'/auth/create-admin','127.0.0.1','POST',200,'2026-04-18 19:52:53.619316',NULL,'SUCCESS'),(68,'/auth/admin/register','127.0.0.1','POST',404,'2026-04-18 19:53:15.477226',3,'ERROR'),(69,'/auth/create-admin','127.0.0.1','OPTIONS',200,'2026-04-18 19:54:50.275106',NULL,'SUCCESS'),(70,'/auth/create-admin','127.0.0.1','POST',200,'2026-04-18 19:54:50.393556',3,'SUCCESS'),(71,'/auth/login','127.0.0.1','OPTIONS',200,'2026-04-18 19:55:25.073941',NULL,'SUCCESS'),(72,'/auth/login','127.0.0.1','POST',200,'2026-04-18 19:55:25.219707',NULL,'SUCCESS'),(73,'/admin/audit','127.0.0.1','OPTIONS',403,'2026-04-18 19:55:32.480332',NULL,'ERROR'),(74,'/auth/login','127.0.0.1','POST',200,'2026-04-18 19:56:26.631978',NULL,'SUCCESS'),(75,'/api/admin','127.0.0.1','GET',404,'2026-04-18 19:56:49.759170',5,'ERROR'),(76,'/admin/metrics','127.0.0.1','GET',403,'2026-04-18 19:56:58.163831',5,'ERROR'),(77,'/auth/login','127.0.0.1','POST',200,'2026-04-18 20:06:17.322775',NULL,'SUCCESS'),(78,'/api/admin','127.0.0.1','GET',404,'2026-04-18 20:06:42.071253',5,'ERROR'),(79,'/admin/metrics','127.0.0.1','GET',403,'2026-04-18 20:06:53.224444',5,'ERROR'),(80,'/auth/login','127.0.0.1','POST',200,'2026-04-18 20:07:03.274086',NULL,'SUCCESS'),(81,'/api/admin','127.0.0.1','GET',404,'2026-04-18 20:12:29.359733',5,'ERROR'),(82,'/admin/metrics','127.0.0.1','GET',200,'2026-04-18 20:12:32.085067',5,'SUCCESS'),(83,'/admin/metrics','127.0.0.1','GET',200,'2026-04-18 20:22:54.601926',5,'SUCCESS'),(84,'/auth/logout','127.0.0.1','OPTIONS',200,'2026-04-18 20:23:15.683319',NULL,'SUCCESS'),(85,'/auth/logout','127.0.0.1','POST',200,'2026-04-18 20:23:15.816608',6,'SUCCESS'),(86,'/auth/login','127.0.0.1','POST',200,'2026-04-18 20:24:02.486324',NULL,'SUCCESS'),(87,'/auth/login','127.0.0.1','OPTIONS',200,'2026-04-18 20:29:51.349552',NULL,'SUCCESS'),(88,'/auth/login','127.0.0.1','POST',200,'2026-04-18 20:29:51.602598',3,'SUCCESS'),(89,'/auth/logout','127.0.0.1','POST',200,'2026-04-18 20:30:12.637852',3,'SUCCESS'),(90,'/api/admin','127.0.0.1','GET',404,'2026-04-18 20:30:28.158781',5,'ERROR'),(91,'/api/admin','127.0.0.1','GET',404,'2026-04-18 20:40:53.088490',5,'ERROR'),(92,'/api/test','127.0.0.1','GET',403,'2026-04-18 20:46:30.522872',NULL,'ERROR'),(93,'/auth/login','127.0.0.1','POST',200,'2026-04-18 20:46:40.435319',NULL,'SUCCESS'),(94,'/api/test','127.0.0.1','GET',404,'2026-04-18 20:46:58.420580',3,'ERROR'),(95,'/api/admin','127.0.0.1','GET',404,'2026-04-18 20:47:10.673318',3,'ERROR'),(96,'/api/admin','127.0.0.1','GET',404,'2026-04-18 20:56:53.790066',3,'ERROR'),(97,'/api/test','127.0.0.1','GET',404,'2026-04-18 20:57:00.045673',3,'ERROR'),(98,'/auth/login','127.0.0.1','POST',200,'2026-04-18 20:57:05.416330',NULL,'SUCCESS'),(99,'/api/test','127.0.0.1','GET',404,'2026-04-18 20:57:18.858565',3,'ERROR'),(100,'/api/admin','127.0.0.1','GET',404,'2026-04-18 20:57:27.484331',3,'ERROR'),(101,'/admin/metrics','127.0.0.1','GET',200,'2026-04-18 20:57:38.157077',3,'SUCCESS'),(102,'/api/admin','127.0.0.1','GET',404,'2026-04-18 21:19:00.593076',3,'ERROR'),(103,'/api/test','127.0.0.1','GET',404,'2026-04-18 21:19:06.085238',3,'ERROR'),(104,'/admin/metrics','127.0.0.1','GET',200,'2026-04-18 21:19:10.764337',3,'SUCCESS'),(105,'/api/test','127.0.0.1','GET',404,'2026-04-18 21:29:46.058886',3,'ERROR'),(106,'/api/admin','127.0.0.1','GET',404,'2026-04-18 21:29:51.454883',3,'ERROR'),(107,'/admin/metrics','127.0.0.1','GET',403,'2026-04-18 21:29:55.498676',3,'ERROR'),(108,'/admin/metrics','127.0.0.1','GET',200,'2026-04-18 21:39:14.162095',3,'SUCCESS'),(109,'/api/test','127.0.0.1','GET',404,'2026-04-18 22:52:51.294233',3,'ERROR'),(110,'/api/admin','127.0.0.1','GET',404,'2026-04-18 22:53:03.345239',3,'ERROR'),(111,'/admin/metrics','127.0.0.1','GET',200,'2026-04-18 22:53:23.444187',3,'SUCCESS'),(112,'/auth/register','127.0.0.1','POST',200,'2026-04-18 22:55:03.323078',NULL,'SUCCESS'),(113,'/auth/login','127.0.0.1','POST',200,'2026-04-18 22:55:35.506856',NULL,'SUCCESS'),(114,'/api/test','127.0.0.1','GET',404,'2026-04-18 22:55:56.198169',7,'ERROR'),(115,'/admin/metrics','127.0.0.1','GET',403,'2026-04-18 22:56:15.945725',7,'ERROR'),(116,'/admin/metrics','127.0.0.1','GET',200,'2026-04-18 22:56:22.299346',3,'SUCCESS'),(117,'/auth/login','127.0.0.1','POST',200,'2026-04-18 23:03:23.705686',NULL,'SUCCESS'),(118,'/api/test','127.0.0.1','GET',404,'2026-04-18 23:03:40.145532',3,'ERROR'),(119,'/api/test','127.0.0.1','GET',404,'2026-04-18 23:22:46.368774',3,'ERROR'),(120,'/admin/test','127.0.0.1','GET',200,'2026-04-18 23:22:50.129229',3,'SUCCESS'),(121,'/admin/metrics','127.0.0.1','GET',200,'2026-04-18 23:22:59.240813',3,'SUCCESS'),(122,'/test/api','127.0.0.1','GET',404,'2026-04-18 23:23:20.672106',3,'ERROR'),(123,'/admin/audit','127.0.0.1','GET',200,'2026-04-18 23:24:54.329946',3,'SUCCESS'),(124,'/auth/login','127.0.0.1','OPTIONS',200,'2026-04-18 23:25:51.973587',NULL,'SUCCESS'),(125,'/auth/login','127.0.0.1','POST',200,'2026-04-18 23:25:52.174092',NULL,'SUCCESS'),(126,'/admin/audit','127.0.0.1','OPTIONS',403,'2026-04-18 23:25:57.902334',NULL,'ERROR'),(127,'/admin/metrics','127.0.0.1','OPTIONS',403,'2026-04-18 23:26:02.303739',NULL,'ERROR'),(128,'/admin/audit','127.0.0.1','OPTIONS',403,'2026-04-18 23:26:06.557923',NULL,'ERROR'),(129,'/admin/audit','127.0.0.1','GET',200,'2026-04-18 23:26:23.199001',3,'SUCCESS'),(130,'/auth/logout','127.0.0.1','OPTIONS',200,'2026-04-18 23:35:00.262688',NULL,'SUCCESS'),(131,'/auth/logout','127.0.0.1','POST',200,'2026-04-18 23:35:00.301711',3,'SUCCESS'),(132,'/auth/login','127.0.0.1','OPTIONS',403,'2026-04-18 23:48:20.943483',NULL,'ERROR'),(133,'/auth/login','127.0.0.1','OPTIONS',403,'2026-04-18 23:48:21.908417',NULL,'ERROR'),(134,'/auth/login','127.0.0.1','OPTIONS',403,'2026-04-18 23:48:22.835885',NULL,'ERROR'),(135,'/auth/login','127.0.0.1','OPTIONS',403,'2026-04-18 23:48:40.372343',NULL,'ERROR'),(136,'/auth/login','127.0.0.1','OPTIONS',403,'2026-04-18 23:48:45.645734',NULL,'ERROR'),(137,'/auth/login','127.0.0.1','POST',200,'2026-04-18 23:50:04.977140',NULL,'SUCCESS'),(138,'/admin/audit','127.0.0.1','OPTIONS',403,'2026-04-18 23:50:10.658687',NULL,'ERROR'),(139,'/admin/metrics','127.0.0.1','OPTIONS',403,'2026-04-18 23:50:13.698568',NULL,'ERROR'),(140,'/auth/login','127.0.0.1','OPTIONS',403,'2026-04-18 23:52:58.570699',NULL,'ERROR'),(141,'/auth/login','127.0.0.1','OPTIONS',403,'2026-04-18 23:53:12.140928',NULL,'ERROR'),(142,'/auth/login','127.0.0.1','OPTIONS',403,'2026-04-18 23:53:25.083843',NULL,'ERROR'),(143,'/auth/login','127.0.0.1','GET',405,'2026-04-18 23:55:02.637463',NULL,'ERROR'),(144,'/auth/login','127.0.0.1','GET',405,'2026-04-18 23:55:04.671656',NULL,'ERROR'),(145,'/auth/login','127.0.0.1','GET',405,'2026-04-18 23:56:28.055760',NULL,'ERROR'),(146,'/auth/login','127.0.0.1','GET',405,'2026-04-18 23:56:29.538211',NULL,'ERROR'),(147,'/auth/login','127.0.0.1','GET',405,'2026-04-18 23:57:43.998846',NULL,'ERROR'),(148,'/auth/login','127.0.0.1','GET',405,'2026-04-18 23:58:15.472064',NULL,'ERROR'),(149,'/auth/login','127.0.0.1','GET',405,'2026-04-19 00:02:37.230544',NULL,'ERROR'),(150,'/auth/login','127.0.0.1','GET',405,'2026-04-19 00:02:38.210381',NULL,'ERROR'),(151,'/auth/login','127.0.0.1','POST',200,'2026-04-19 00:02:44.625303',NULL,'SUCCESS'),(152,'/admin/audit','127.0.0.1','GET',200,'2026-04-19 00:02:50.745635',5,'SUCCESS'),(153,'/admin/test','127.0.0.1','GET',200,'2026-04-19 00:03:02.997656',5,'SUCCESS'),(154,'/admin/metrics','127.0.0.1','GET',200,'2026-04-19 00:03:07.022903',5,'SUCCESS'),(155,'/user/test','127.0.0.1','GET',200,'2026-04-19 00:03:09.645247',5,'SUCCESS'),(156,'/auth/logout','127.0.0.1','POST',200,'2026-04-19 00:03:14.623284',5,'SUCCESS'),(157,'/auth/login','127.0.0.1','POST',200,'2026-04-19 00:15:49.078219',NULL,'SUCCESS'),(158,'/admin/audit','127.0.0.1','GET',200,'2026-04-19 00:15:52.233491',5,'SUCCESS'),(159,'/admin/metrics','127.0.0.1','GET',200,'2026-04-19 00:16:14.343500',5,'SUCCESS'),(160,'/admin/audit','127.0.0.1','GET',200,'2026-04-19 00:16:16.308506',5,'SUCCESS');
/*!40000 ALTER TABLE `audit_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `metrics`
--

DROP TABLE IF EXISTS `metrics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `metrics` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `endpoint` varchar(255) DEFAULT NULL,
  `failure_count` bigint NOT NULL,
  `method` varchar(255) DEFAULT NULL,
  `success_count` bigint NOT NULL,
  `total_requests` bigint NOT NULL,
  `total_response_time` bigint NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `metrics`
--

LOCK TABLES `metrics` WRITE;
/*!40000 ALTER TABLE `metrics` DISABLE KEYS */;
INSERT INTO `metrics` VALUES (1,'/admin/metrics',1,'POST',0,1,54),(2,'/auth/login',0,'POST',21,21,5198),(3,'/admin/metrics',5,'GET',11,16,1040),(4,'/index.html',5,'GET',0,5,123),(5,'/',1,'GET',1,2,123),(6,'/favicon.ico',1,'GET',0,1,6),(7,'/swagger-ui/index.html',2,'GET',2,4,275),(8,'/swagger-ui/swagger-ui-standalone-preset.js',0,'GET',2,2,73),(9,'/swagger-ui/index.css',0,'GET',2,2,75),(10,'/swagger-ui/swagger-initializer.js',0,'GET',2,2,89),(11,'/swagger-ui/swagger-ui-bundle.js',0,'GET',2,2,73),(12,'/swagger-ui/swagger-ui.css',0,'GET',2,2,27),(13,'/swagger-ui/favicon-32x32.png',0,'GET',2,2,19),(14,'/v3/api-docs/swagger-config',0,'GET',2,2,102),(15,'/v3/api-docs',0,'GET',2,2,680),(16,'/api/user',1,'GET',0,1,10),(17,'/auth/register',0,'OPTIONS',2,2,159),(18,'/auth/register',4,'POST',2,6,522),(19,'/auth/login',8,'OPTIONS',5,13,274),(20,'/admin/audit',10,'OPTIONS',0,10,176),(21,'/admin/metrics',4,'OPTIONS',0,4,41),(22,'/auth/logout',0,'OPTIONS',4,4,90),(23,'/auth/logout',3,'POST',4,7,248),(24,'/auth/admin/register',0,'OPTIONS',1,1,11),(25,'/auth/admin/register',2,'POST',0,2,124),(26,'/auth/create-admin',1,'POST',2,3,473),(27,'/auth/create-admin',0,'OPTIONS',1,1,17),(28,'/api/admin',11,'GET',0,11,433),(29,'/api/test',10,'GET',0,10,404),(30,'/admin/test',0,'GET',2,2,74),(31,'/test/api',1,'GET',0,1,10),(32,'/admin/audit',0,'GET',5,5,226),(33,'/auth/login',8,'GET',0,8,172),(34,'/user/test',0,'GET',1,1,8);
/*!40000 ALTER TABLE `metrics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sessions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint DEFAULT NULL,
  `token` varchar(1000) DEFAULT NULL,
  `device_info` varchar(255) DEFAULT NULL,
  `expiry_time` datetime DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `token_type` varchar(255) DEFAULT NULL,
  `ip_address` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `last_used_at` datetime DEFAULT NULL,
  `active` bit(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_token` (`token`(255))
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` VALUES (9,3,'eyJhbGciOiJIUzI1NiJ9.eyJyb2xlIjoiQURNSU4iLCJ0eXBlIjoiQUNDRVNTIiwidXNlcklkIjozLCJzdWIiOiJhZG1pbkBnbWFpbC5jb20iLCJpYXQiOjE3NzY1MjEzMjksImV4cCI6MTc3NjYwNzcyOX0.4tKo_v97qOP_MBz4QQCRJLhxA665t9WO2vs7Y_ArZXA','PostmanRuntime/7.53.0 | IP: 0:0:0:0:0:0:0:1','2026-04-19 19:38:49',NULL,NULL,NULL,NULL,'2026-04-18 19:38:49','2026-04-18 19:38:49',_binary ''),(10,3,'eyJhbGciOiJIUzI1NiJ9.eyJyb2xlIjoiQURNSU4iLCJ0eXBlIjoiQUNDRVNTIiwidXNlcklkIjozLCJzdWIiOiJhZG1pbkBnbWFpbC5jb20iLCJpYXQiOjE3NzY1MjE5NzIsImV4cCI6MTc3NjYwODM3Mn0.EGtTAkeTl58YWC7oGruuQVjnnZigiA6prv6ayGtw4C4','PostmanRuntime/7.53.0 | IP: 0:0:0:0:0:0:0:1','2026-04-19 19:49:32',NULL,NULL,NULL,NULL,'2026-04-18 19:49:32','2026-04-18 19:49:32',_binary ''),(12,5,'eyJhbGciOiJIUzI1NiJ9.eyJyb2xlIjoiQURNSU4iLCJ0eXBlIjoiQUNDRVNTIiwidXNlcklkIjo1LCJzdWIiOiJhZG1pbkBjb3JleC5jb20iLCJpYXQiOjE3NzY1MjIzODYsImV4cCI6MTc3NjYwODc4Nn0.tw-lzJvm2vBhOFVACdHo_X6QQzpFtykzSuHYGFW6hOM','PostmanRuntime/7.53.0 | IP: 0:0:0:0:0:0:0:1','2026-04-19 19:56:27',NULL,NULL,NULL,NULL,'2026-04-18 19:56:27','2026-04-18 19:56:27',_binary ''),(13,5,'eyJhbGciOiJIUzI1NiJ9.eyJyb2xlIjoiQURNSU4iLCJ0eXBlIjoiQUNDRVNTIiwidXNlcklkIjo1LCJzdWIiOiJhZG1pbkBjb3JleC5jb20iLCJpYXQiOjE3NzY1MjI5NzcsImV4cCI6MTc3NjYwOTM3N30.Cg4Q4HzGFD8XiDtuJKoUEzOI15TdOdtroJH120Au2y4','PostmanRuntime/7.53.0 | IP: 0:0:0:0:0:0:0:1','2026-04-19 20:06:17',NULL,NULL,NULL,NULL,'2026-04-18 20:06:17','2026-04-18 20:40:53',_binary ''),(14,3,'eyJhbGciOiJIUzI1NiJ9.eyJyb2xlIjoiQURNSU4iLCJ0eXBlIjoiQUNDRVNTIiwidXNlcklkIjozLCJzdWIiOiJhZG1pbkBnbWFpbC5jb20iLCJpYXQiOjE3NzY1MjMwMjMsImV4cCI6MTc3NjYwOTQyM30.fKnVJvxIz67Yh_DVfOqptH3Uf3djgM2UML9HvnL8JA8','PostmanRuntime/7.53.0 | IP: 0:0:0:0:0:0:0:1','2026-04-19 20:07:03',NULL,NULL,NULL,NULL,'2026-04-18 20:07:03','2026-04-18 20:07:03',_binary ''),(15,3,'eyJhbGciOiJIUzI1NiJ9.eyJyb2xlIjoiQURNSU4iLCJ0eXBlIjoiQUNDRVNTIiwidXNlcklkIjozLCJzdWIiOiJhZG1pbkBnbWFpbC5jb20iLCJpYXQiOjE3NzY1MjQwNDIsImV4cCI6MTc3NjYxMDQ0Mn0.Fm2pi4a_5bw79BgRUbgflxqZAZN-9bIz_noGtUEFKsc','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36 | IP: 0:0:0:0:0:0:0:1','2026-04-19 20:24:02',NULL,NULL,NULL,NULL,'2026-04-18 20:24:02','2026-04-18 20:24:02',_binary ''),(17,3,'eyJhbGciOiJIUzI1NiJ9.eyJyb2xlIjoiQURNSU4iLCJ0eXBlIjoiQUNDRVNTIiwidXNlcklkIjozLCJzdWIiOiJhZG1pbkBnbWFpbC5jb20iLCJpYXQiOjE3NzY1MjU0MDAsImV4cCI6MTc3NjYxMTgwMH0.wYrHZuNGwOsprLkQHQVzVl_nsb9Tmlqn4Z6DvljU87o','PostmanRuntime/7.53.0 | IP: 0:0:0:0:0:0:0:1','2026-04-19 20:46:40',NULL,NULL,NULL,NULL,'2026-04-18 20:46:40','2026-04-18 20:57:00',_binary ''),(18,3,'eyJhbGciOiJIUzI1NiJ9.eyJyb2xlIjoiQURNSU4iLCJ0eXBlIjoiQUNDRVNTIiwidXNlcklkIjozLCJzdWIiOiJhZG1pbkBnbWFpbC5jb20iLCJpYXQiOjE3NzY1MjYwMjUsImV4cCI6MTc3NjYxMjQyNX0.cNPR8993Zl3BDEc_hFL1eyrFDMRkYCNa-1OY0lizzvI','PostmanRuntime/7.53.0 | IP: 0:0:0:0:0:0:0:1','2026-04-19 20:57:05',NULL,NULL,NULL,NULL,'2026-04-18 20:57:05','2026-04-18 23:26:23',_binary ''),(19,7,'eyJhbGciOiJIUzI1NiJ9.eyJyb2xlIjoiVVNFUiIsInR5cGUiOiJBQ0NFU1MiLCJ1c2VySWQiOjcsInN1YiI6InVzZXIyMUBnbWFpbC5jb20iLCJpYXQiOjE3NzY1MzMxMzUsImV4cCI6MTc3NjYxOTUzNX0.viLS2xFDIgcInvhj-crvMjixvlLKrpT5jE4D4sAajGs','PostmanRuntime/7.53.0 | IP: 0:0:0:0:0:0:0:1','2026-04-19 22:55:35',NULL,NULL,NULL,NULL,'2026-04-18 22:55:35','2026-04-18 22:56:16',_binary ''),(20,3,'eyJhbGciOiJIUzI1NiJ9.eyJyb2xlIjoiQURNSU4iLCJ0eXBlIjoiQUNDRVNTIiwidXNlcklkIjozLCJzdWIiOiJhZG1pbkBnbWFpbC5jb20iLCJpYXQiOjE3NzY1MzM2MDMsImV4cCI6MTc3NjYyMDAwM30.xU_-8_1Fr1sxD7zWBhdDt07NTRmqcPmyqXKV8I5bpk4','PostmanRuntime/7.53.0 | IP: 0:0:0:0:0:0:0:1','2026-04-19 23:03:24',NULL,NULL,NULL,NULL,'2026-04-18 23:03:24','2026-04-18 23:23:21',_binary ''),(22,3,'eyJhbGciOiJIUzI1NiJ9.eyJyb2xlIjoiQURNSU4iLCJ0eXBlIjoiQUNDRVNTIiwidXNlcklkIjozLCJzdWIiOiJhZG1pbkBnbWFpbC5jb20iLCJpYXQiOjE3NzY1MzY0MDQsImV4cCI6MTc3NjYyMjgwNH0.w56HOzfAS3z-OJrSp326BEV_FwM8S4-TwaTCJhxThVA','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36 | IP: 0:0:0:0:0:0:0:1','2026-04-19 23:50:05',NULL,NULL,NULL,NULL,'2026-04-18 23:50:05','2026-04-18 23:50:05',_binary ''),(23,5,'eyJhbGciOiJIUzI1NiJ9.eyJyb2xlIjoiQURNSU4iLCJ0eXBlIjoiQUNDRVNTIiwidXNlcklkIjo1LCJzdWIiOiJhZG1pbkBjb3JleC5jb20iLCJpYXQiOjE3NzY1MzcxNjQsImV4cCI6MTc3NjYyMzU2NH0.78l4fMBhQ7R3_qJ_p-KWU1UQbIpk0BHS2nKsusay2V0','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36 | IP: 0:0:0:0:0:0:0:1','2026-04-20 00:02:45',NULL,NULL,NULL,NULL,'2026-04-19 00:02:45','2026-04-19 00:03:15',_binary '\0'),(24,5,'eyJhbGciOiJIUzI1NiJ9.eyJyb2xlIjoiQURNSU4iLCJ0eXBlIjoiQUNDRVNTIiwidXNlcklkIjo1LCJzdWIiOiJhZG1pbkBjb3JleC5jb20iLCJpYXQiOjE3NzY1Mzc5NDksImV4cCI6MTc3NjYyNDM0OX0.tggXqzGvR1QarcCkjw5vF8aMgOK4SVTrRMvJhRDwyg8','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36 Edg/147.0.0.0 | IP: 0:0:0:0:0:0:0:1','2026-04-20 00:15:49',NULL,NULL,NULL,NULL,'2026-04-19 00:15:49','2026-04-19 00:16:16',_binary '');
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `is_account_non_locked` tinyint(1) DEFAULT '1',
  `failed_attempts` int DEFAULT '0',
  `role` varchar(255) DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `account_non_locked` bit(1) NOT NULL,
  `lock_time` datetime(6) DEFAULT NULL,
  `enabled` bit(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (3,'admin','admin@gmail.com','$2a$10$rcA2H33rdGuJn6VPiOydp.NjzctSVVAqI.S3vBu/jmKsWc2Y3pAQ6',1,0,'ADMIN','2026-04-18 23:50:05','2026-04-18 10:45:34','2026-04-18 23:50:05',_binary '',NULL,_binary ''),(4,'user1','user@gmail.com','$2a$10$Phkz8KHWAnk8cU2HtJ92uuGGXl8QrR.bQvJmZGAweWCOYWDcx3nFy',1,0,'USER',NULL,'2026-04-18 19:40:46',NULL,_binary '',NULL,_binary ''),(5,'admin','admin@corex.com','$2a$10$OQPI4uQitvJhjEETT9v.NuKJY90UgB4D6OyvLUL7oJCamFbn5w.iS',1,0,'ADMIN','2026-04-19 00:15:49','2026-04-18 19:52:54','2026-04-19 00:15:49',_binary '',NULL,_binary ''),(6,'admin12','admin12@corex.com','$2a$10$9WaZ0S98Y.kfc.vNOpmx0.EdskSO1frhiXobLfFmFr2rMamog605q',1,0,'ADMIN','2026-04-18 19:55:25','2026-04-18 19:54:50','2026-04-18 19:55:25',_binary '',NULL,_binary ''),(7,'user21','user21@gmail.com','$2a$10$b/U4.CFgcefWouG2/P8CluZUZZgQNVRCAxvsWaP.Czyosy5Sb7pla',1,0,'USER','2026-04-18 22:55:35','2026-04-18 22:55:03','2026-04-18 22:55:35',_binary '',NULL,_binary '');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-04-19  0:41:09
