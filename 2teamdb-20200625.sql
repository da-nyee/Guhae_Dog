-- MySQL dump 10.13  Distrib 5.5.62, for Linux (x86_64)
--
-- Host: guhaedogdb.c4ahwor36duc.ap-northeast-2.rds.amazonaws.com    Database: guhaedogDB
-- ------------------------------------------------------
-- Server version	5.5.5-10.2.21-MariaDB-log

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
-- Current Database: `guhaedogDB`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `guhaedogDB` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `guhaedogDB`;

--
-- Table structure for table `SPRING_SESSION`
--

DROP TABLE IF EXISTS `SPRING_SESSION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SPRING_SESSION` (
  `PRIMARY_ID` char(36) NOT NULL,
  `SESSION_ID` char(36) NOT NULL,
  `CREATION_TIME` bigint(20) NOT NULL,
  `LAST_ACCESS_TIME` bigint(20) NOT NULL,
  `MAX_INACTIVE_INTERVAL` int(11) NOT NULL,
  `EXPIRY_TIME` bigint(20) NOT NULL,
  `PRINCIPAL_NAME` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`PRIMARY_ID`),
  UNIQUE KEY `SPRING_SESSION_IX1` (`SESSION_ID`),
  KEY `SPRING_SESSION_IX2` (`EXPIRY_TIME`),
  KEY `SPRING_SESSION_IX3` (`PRINCIPAL_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SPRING_SESSION`
--

LOCK TABLES `SPRING_SESSION` WRITE;
/*!40000 ALTER TABLE `SPRING_SESSION` DISABLE KEYS */;
/*!40000 ALTER TABLE `SPRING_SESSION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SPRING_SESSION_ATTRIBUTES`
--

DROP TABLE IF EXISTS `SPRING_SESSION_ATTRIBUTES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SPRING_SESSION_ATTRIBUTES` (
  `SESSION_PRIMARY_ID` char(36) NOT NULL,
  `ATTRIBUTE_NAME` varchar(200) NOT NULL,
  `ATTRIBUTE_BYTES` blob NOT NULL,
  PRIMARY KEY (`SESSION_PRIMARY_ID`,`ATTRIBUTE_NAME`),
  CONSTRAINT `SPRING_SESSION_ATTRIBUTES_FK` FOREIGN KEY (`SESSION_PRIMARY_ID`) REFERENCES `SPRING_SESSION` (`PRIMARY_ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SPRING_SESSION_ATTRIBUTES`
--

LOCK TABLES `SPRING_SESSION_ATTRIBUTES` WRITE;
/*!40000 ALTER TABLE `SPRING_SESSION_ATTRIBUTES` DISABLE KEYS */;
/*!40000 ALTER TABLE `SPRING_SESSION_ATTRIBUTES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `air`
--

DROP TABLE IF EXISTS `air`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `air` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `percent` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `air`
--

LOCK TABLES `air` WRITE;
/*!40000 ALTER TABLE `air` DISABLE KEYS */;
INSERT INTO `air` VALUES (12,'0.46'),(13,'0.5'),(14,'0.16'),(15,'0.54'),(16,'0.55'),(17,'0.17'),(18,'0.0'),(19,'0.28'),(20,'0.31'),(21,'0.17'),(22,'0.45'),(23,'0.35'),(24,'0.2'),(25,'0.42'),(26,'0.34'),(27,'0.49'),(28,'0.03');
/*!40000 ALTER TABLE `air` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `corna`
--

DROP TABLE IF EXISTS `corna`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `corna` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `percent` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `corna`
--

LOCK TABLES `corna` WRITE;
/*!40000 ALTER TABLE `corna` DISABLE KEYS */;
INSERT INTO `corna` VALUES (12,'0.0'),(13,'0.06'),(14,'0.0'),(15,'0.06'),(16,'0.39'),(17,'0.59'),(18,'0.18'),(19,'0.22'),(20,'0.0'),(21,'0.62'),(22,'0.55'),(23,'0.21'),(24,'0.52'),(25,'0.02'),(26,'0.42'),(27,'0.0'),(28,'0.35');
/*!40000 ALTER TABLE `corna` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `diagnosis`
--

DROP TABLE IF EXISTS `diagnosis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `diagnosis` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `dog` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `air_id` bigint(20) DEFAULT NULL,
  `corna_id` bigint(20) DEFAULT NULL,
  `macak_id` bigint(20) DEFAULT NULL,
  `member_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKf007w1qeu9sxpejgwsuoailyu` (`air_id`),
  KEY `FKhhrlve2id2in716pulimg2ctt` (`corna_id`),
  KEY `FKbm7safjv6fbm15xq670tya85l` (`macak_id`),
  KEY `FKggaas8hghjptadq3vkhpydv9t` (`member_id`),
  CONSTRAINT `FKbm7safjv6fbm15xq670tya85l` FOREIGN KEY (`macak_id`) REFERENCES `macak` (`id`),
  CONSTRAINT `FKf007w1qeu9sxpejgwsuoailyu` FOREIGN KEY (`air_id`) REFERENCES `air` (`id`),
  CONSTRAINT `FKggaas8hghjptadq3vkhpydv9t` FOREIGN KEY (`member_id`) REFERENCES `member` (`member_id`),
  CONSTRAINT `FKhhrlve2id2in716pulimg2ctt` FOREIGN KEY (`corna_id`) REFERENCES `corna` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `diagnosis`
--

LOCK TABLES `diagnosis` WRITE;
/*!40000 ALTER TABLE `diagnosis` DISABLE KEYS */;
INSERT INTO `diagnosis` VALUES (12,'별이','마카다미아너트 중독증',NULL,12,12,12,12),(13,'별이','기관지 확장증',NULL,13,13,13,12),(14,'쪼니','마카다미아너트 중독증',NULL,14,14,14,12),(15,'쪼니','기관지 확장증',NULL,15,15,15,12),(16,'승은','기관지 확장증',NULL,16,16,16,13),(17,'예삐','코로나 바이러스 감염증',NULL,17,17,17,11),(18,'승은','마카다미아너트 중독증',NULL,18,18,18,13),(19,'예삐','마카다미아너트 중독증',NULL,19,19,19,11),(20,'예삐','마카다미아너트 중독증',NULL,20,20,20,11),(21,'별이','코로나 바이러스 감염증',NULL,21,21,21,12),(22,'쫀쪼니','코로나 바이러스 감염증',NULL,22,22,22,22),(23,'쫀쪼니','마카다미아너트 중독증',NULL,23,23,23,22),(24,'코코','코로나 바이러스 감염증',NULL,24,24,24,13),(25,'예삐','마카다미아너트 중독증',NULL,25,25,25,11),(26,'예삐','코로나 바이러스 감염증',NULL,26,26,26,11),(27,'보라','마카다미아너트 중독증',NULL,27,27,27,13),(28,'쪼니','마카다미아너트 중독증',NULL,28,28,28,12);
/*!40000 ALTER TABLE `diagnosis` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `disease`
--

DROP TABLE IF EXISTS `disease`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `disease` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `disease`
--

LOCK TABLES `disease` WRITE;
/*!40000 ALTER TABLE `disease` DISABLE KEYS */;
INSERT INTO `disease` VALUES (1,'상업적으로 가능한 마카다미아너트를 섭취한 경우 나타나며, 증상은 섭취후 12시간 정도에 일어나고 증상은 24시간 지속되는 질병','마카다미아너트 중독증'),(2,'개 코로나 바이러스에 의해 발생하며, 구토와 설사를 수반하는 장염을 유발하는 질병','코로나 바이러스 감염증'),(3,'기관지 분비물의 과잉분비로 인한 기관지 확장을 특징으로 하는 질병','기관지 확장증');
/*!40000 ALTER TABLE `disease` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dog`
--

DROP TABLE IF EXISTS `dog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dog` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `age` varchar(255) DEFAULT NULL,
  `birth` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `member_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKhdpjd6l15cy5li9vatn0jh02x` (`member_id`),
  CONSTRAINT `FKhdpjd6l15cy5li9vatn0jh02x` FOREIGN KEY (`member_id`) REFERENCES `member` (`member_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dog`
--

LOCK TABLES `dog` WRITE;
/*!40000 ALTER TABLE `dog` DISABLE KEYS */;
INSERT INTO `dog` VALUES (5,'3~7세미만','2015-10-14','암컷','별이','치와와',12),(6,'10세이상','2018-12-19','암컷','쪼니','요크셔테리어',12),(8,'3~7세미만','2019-06-11','수컷','예삐','말티즈',11),(9,'3~7세미만','2013-10-21','암컷','코코','요크셔테리어',13),(11,'3~7세미만','2019-10-30','암컷','쫀쪼니','요크셔테리어',22),(12,'7~10세미만','2017-11-17','수컷','보라','요크셔테리어',13);
/*!40000 ALTER TABLE `dog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hospital`
--

DROP TABLE IF EXISTS `hospital`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hospital` (
  `hospital_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `hospital_address` varchar(255) NOT NULL,
  `hospital_name` varchar(255) NOT NULL,
  `hospital_tel` varchar(255) NOT NULL,
  `member_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`hospital_id`),
  KEY `FK1pqmfky6triopw9mxlf3efm74` (`member_id`),
  CONSTRAINT `FK1pqmfky6triopw9mxlf3efm74` FOREIGN KEY (`member_id`) REFERENCES `member` (`member_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hospital`
--

LOCK TABLES `hospital` WRITE;
/*!40000 ALTER TABLE `hospital` DISABLE KEYS */;
INSERT INTO `hospital` VALUES (7,'경기 수원시 권선구 동수원로82번길 7-3','튼튼 동물병원','031-267-8100',14),(12,'경기 고양시 일산서구 경의로 844','조이동물병원','031-919-1175',26),(15,'서울 광진구 광나루로 392-1','피카소동물병원','02-467-3673',29);
/*!40000 ALTER TABLE `hospital` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `macak`
--

DROP TABLE IF EXISTS `macak`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `macak` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `percent` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `macak`
--

LOCK TABLES `macak` WRITE;
/*!40000 ALTER TABLE `macak` DISABLE KEYS */;
INSERT INTO `macak` VALUES (12,'0.54'),(13,'0.44'),(14,'0.84'),(15,'0.4'),(16,'0.06'),(17,'0.24'),(18,'0.82'),(19,'0.5'),(20,'0.69'),(21,'0.21'),(22,'0.0'),(23,'0.44'),(24,'0.28'),(25,'0.56'),(26,'0.24'),(27,'0.51'),(28,'0.62');
/*!40000 ALTER TABLE `macak` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member`
--

DROP TABLE IF EXISTS `member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `member` (
  `member_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_date` datetime DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `street` varchar(255) DEFAULT NULL,
  `zipcode` varchar(255) DEFAULT NULL,
  `birth` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `role` varchar(255) DEFAULT NULL,
  `hospital_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`member_id`),
  KEY `FKenc3mb3qetarul3282iu5dny0` (`hospital_id`),
  CONSTRAINT `FKenc3mb3qetarul3282iu5dny0` FOREIGN KEY (`hospital_id`) REFERENCES `hospital` (`hospital_id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member`
--

LOCK TABLES `member` WRITE;
/*!40000 ALTER TABLE `member` DISABLE KEYS */;
INSERT INTO `member` VALUES (3,'2020-06-21 20:54:25','2020-06-21 20:54:25','서울 성동구 고산자로 261-7','212-305','04709','2020-03-06','admin@gmail.com','관리자','$2a$10$G9wbWoK3AMIiFj8/XWx3duGq4shThsQ4yLCdGDWfY4AhKRCFlM1uO','01034342323','ADMIN',NULL),(11,'2020-06-22 17:19:05','2020-06-24 17:45:05','경기 고양시 일산서구 하이파크3로 61','0039-328','10235','2019-08-22','leede418@gmail.com','이다은','$2a$10$2klxEjpyrYVKhugvsUTvburAIWyxQBCv2ohNSP8RMDJQt3RFlzaX2','01056332902','GUEST',NULL),(12,'2020-06-22 17:19:32','2020-06-22 17:19:32','경기 수원시 권선구 경수대로 89-24','12234','16661','1995-06-14','test@gmail.com','황승환','$2a$10$i7t35a7Xs5VV0AFEYOqbWuRKEEhBgAY4Mi.RavAVNNvV9.MOeJqIC','01034342323','GUEST',NULL),(13,'2020-06-22 17:20:05','2020-06-22 17:20:05','서울 광진구 화양동 530','0039-328','05021','1995-11-15','hyunwu@gmail.com','전현우','$2a$10$QkC/EU4Q2jCaa8.Yuq9hieXU90.u5hon3vI0JkTz.u4o/Z9on2js6','01011113333','GUEST',NULL),(14,'2020-06-22 17:20:40','2020-06-24 15:38:14','서울 강남구 논현로189길 6','1234-5678','06001','2019-09-12','vet@gmail.com','수의사','$2a$10$0nl9iUG/LlZtVj.cEb5c.uBV7ebmgvAZhtgoRFIXixosS0TEsXKCm','01011112222','VET',7),(22,'2020-06-24 15:31:54','2020-06-24 15:33:21','경기 수원시 권선구 경수대로 89-4','212-305','16661','1997-12-12','jhdec12@gmail.com','정종희','$2a$10$AMtTfDOTa5XDIbiG0BipMuplG4HbD1ifKtI942T/hGb1BldYUgElS','01011113333','GUEST',NULL),(26,'2020-06-24 17:37:30','2020-06-24 17:38:30','서울 광진구 능동로 120','212-305','05029','1994-03-17','vet2@gmail.com','이장훈','$2a$10$4G5phavIZunnEMObzq79bu2IbuuGYDRKNPSySZUf7iO7jAAbqPfJO','01038478291','VET',12),(29,'2020-06-24 17:47:31','2020-06-24 17:47:41','경기 용인시 기흥구 갈곡로7번길 7','0039-328','16979','1993-10-14','vet3@gmail.com','황병준','$2a$10$YHYpaS91K.okRTACXsBFcOmoVBmrW9CfRVE5hXsVj5RicFyG0/GQ2','01011112222','VET',15);
/*!40000 ALTER TABLE `member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reserve`
--

DROP TABLE IF EXISTS `reserve`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reserve` (
  `reserve_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `address` varchar(255) DEFAULT NULL,
  `visit_date` varchar(255) NOT NULL,
  `description` longtext DEFAULT NULL,
  `dog` varchar(255) DEFAULT NULL,
  `hospital_name` varchar(255) DEFAULT NULL,
  `tel` varchar(255) NOT NULL,
  `hospital_id` bigint(20) DEFAULT NULL,
  `member_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`reserve_id`),
  KEY `FKfgy8n1drbcm6r8h1x4u7qiioi` (`hospital_id`),
  KEY `FKktaxwc9vryh5v78n280p3fq1o` (`member_id`),
  CONSTRAINT `FKfgy8n1drbcm6r8h1x4u7qiioi` FOREIGN KEY (`hospital_id`) REFERENCES `hospital` (`hospital_id`),
  CONSTRAINT `FKktaxwc9vryh5v78n280p3fq1o` FOREIGN KEY (`member_id`) REFERENCES `member` (`member_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reserve`
--

LOCK TABLES `reserve` WRITE;
/*!40000 ALTER TABLE `reserve` DISABLE KEYS */;
INSERT INTO `reserve` VALUES (6,'경기 수원시 권선구 동수원로82번길 7-3','15:00~16:00','별이가 아파요','별이','튼튼 동물병원','031-267-8100',7,12),(12,'경기 고양시 일산서구 경의로 844','15:00~16:00','예삐가 어제부터 밥을 잘 안 먹습니다','예삐','조이동물병원','031-919-1175',12,11),(13,'서울 광진구 광나루로 392-1','16:00~17:00','아토피가 있어요','보라','피카소동물병원','02-467-3673',15,13);
/*!40000 ALTER TABLE `reserve` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `symptom`
--

DROP TABLE IF EXISTS `symptom`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `symptom` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `symptom`
--

LOCK TABLES `symptom` WRITE;
/*!40000 ALTER TABLE `symptom` DISABLE KEYS */;
INSERT INTO `symptom` VALUES (1,'과호흡'),(2,'급사'),(3,'기침'),(4,'염증'),(5,'구토'),(6,'탈모'),(7,'무기력'),(8,'발열'),(9,'녹내장'),(10,'거리감각불능'),(11,'난청'),(12,'요실금'),(13,'설사'),(14,'식욕부진'),(15,'체중감소'),(17,'흉통');
/*!40000 ALTER TABLE `symptom` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-06-24 18:45:38
