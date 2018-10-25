-- MySQL dump 10.13  Distrib 8.0.12, for macos10.13 (x86_64)
--
-- Host: localhost    Database: tania
-- ------------------------------------------------------
-- Server version	8.0.12

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `area_event`
--

DROP TABLE IF EXISTS `area_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `area_event` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `AREA_UID` binary(16) DEFAULT NULL,
  `VERSION` int(11) DEFAULT NULL,
  `CREATED_DATE` datetime DEFAULT NULL,
  `EVENT` json DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FARM_EVENT_AREA_UID_INDEX` (`AREA_UID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `area_event`
--

LOCK TABLES `area_event` WRITE;
/*!40000 ALTER TABLE `area_event` DISABLE KEYS */;
/*!40000 ALTER TABLE `area_event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `area_read`
--

DROP TABLE IF EXISTS `area_read`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `area_read` (
  `UID` binary(16) NOT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `SIZE_UNIT` varchar(255) DEFAULT NULL,
  `SIZE` float DEFAULT NULL,
  `TYPE` varchar(255) DEFAULT NULL,
  `LOCATION` varchar(255) DEFAULT NULL,
  `PHOTO_FILENAME` varchar(255) DEFAULT NULL,
  `PHOTO_MIMETYPE` varchar(255) DEFAULT NULL,
  `PHOTO_SIZE` int(11) DEFAULT NULL,
  `PHOTO_WIDTH` int(11) DEFAULT NULL,
  `PHOTO_HEIGHT` int(11) DEFAULT NULL,
  `CREATED_DATE` datetime DEFAULT NULL,
  `RESERVOIR_UID` binary(16) DEFAULT NULL,
  `RESERVOIR_NAME` varchar(255) DEFAULT NULL,
  `FARM_UID` binary(16) DEFAULT NULL,
  `FARM_NAME` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`UID`),
  UNIQUE KEY `AREA_READ_UID_UNIQUE_INDEX` (`UID`),
  KEY `AREA_READ_RESERVOIR_UID_INDEX` (`RESERVOIR_UID`),
  KEY `AREA_READ_FARM_UID_INDEX` (`FARM_UID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `area_read`
--

LOCK TABLES `area_read` WRITE;
/*!40000 ALTER TABLE `area_read` DISABLE KEYS */;
/*!40000 ALTER TABLE `area_read` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `area_read_notes`
--

DROP TABLE IF EXISTS `area_read_notes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `area_read_notes` (
  `UID` binary(16) NOT NULL,
  `AREA_UID` binary(16) DEFAULT NULL,
  `CONTENT` text,
  `CREATED_DATE` datetime DEFAULT NULL,
  PRIMARY KEY (`UID`),
  UNIQUE KEY `AREA_READ_NOTES_UID_UNIQUE_INDEX` (`UID`),
  KEY `AREA_READ_NOTES_AREA_UID_INDEX` (`AREA_UID`),
  CONSTRAINT `area_read_notes_ibfk_1` FOREIGN KEY (`AREA_UID`) REFERENCES `area_read` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `area_read_notes`
--

LOCK TABLES `area_read_notes` WRITE;
/*!40000 ALTER TABLE `area_read_notes` DISABLE KEYS */;
/*!40000 ALTER TABLE `area_read_notes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `areas`
--

DROP TABLE IF EXISTS `areas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `areas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `height` int(11) DEFAULT NULL,
  `width` int(11) DEFAULT NULL,
  `image` varchar(200) DEFAULT NULL,
  `field_id` int(11) DEFAULT NULL,
  `unit` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `areas`
--

LOCK TABLES `areas` WRITE;
/*!40000 ALTER TABLE `areas` DISABLE KEYS */;
INSERT INTO `areas` VALUES (1,'My Area',500,500,'uploads/mainareas/102420180944431043.png',1,'Hectare'),(2,'My new area',500,500,'uploads/mainareas/102420180920491049.png',1,'Meters');
/*!40000 ALTER TABLE `areas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `areasdevices`
--

DROP TABLE IF EXISTS `areasdevices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `areasdevices` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `area_id` int(11) DEFAULT NULL,
  `device_id` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_BC0E507EBD0F409C` (`area_id`),
  KEY `IDX_BC0E507E94A4C7D4` (`device_id`),
  CONSTRAINT `FK_BC0E507E94A4C7D4` FOREIGN KEY (`device_id`) REFERENCES `devices` (`id`),
  CONSTRAINT `FK_BC0E507EBD0F409C` FOREIGN KEY (`area_id`) REFERENCES `zones` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `areasdevices`
--

LOCK TABLES `areasdevices` WRITE;
/*!40000 ALTER TABLE `areasdevices` DISABLE KEYS */;
/*!40000 ALTER TABLE `areasdevices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `crop_activity`
--

DROP TABLE IF EXISTS `crop_activity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `crop_activity` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `CROP_UID` binary(16) DEFAULT NULL,
  `BATCH_ID` varchar(255) DEFAULT NULL,
  `CONTAINER_TYPE` varchar(255) DEFAULT NULL,
  `ACTIVITY_TYPE` json DEFAULT NULL,
  `ACTIVITY_TYPE_CODE` varchar(255) DEFAULT NULL,
  `CREATED_DATE` datetime DEFAULT NULL,
  `DESCRIPTION` text,
  PRIMARY KEY (`ID`),
  KEY `CROP_UID` (`CROP_UID`),
  CONSTRAINT `crop_activity_ibfk_1` FOREIGN KEY (`CROP_UID`) REFERENCES `crop_read` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `crop_activity`
--

LOCK TABLES `crop_activity` WRITE;
/*!40000 ALTER TABLE `crop_activity` DISABLE KEYS */;
/*!40000 ALTER TABLE `crop_activity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `crop_event`
--

DROP TABLE IF EXISTS `crop_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `crop_event` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `CROP_UID` binary(16) DEFAULT NULL,
  `VERSION` int(11) DEFAULT NULL,
  `CREATED_DATE` datetime DEFAULT NULL,
  `EVENT` json DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `CROP_EVENT_CROP_UID_INDEX` (`CROP_UID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `crop_event`
--

LOCK TABLES `crop_event` WRITE;
/*!40000 ALTER TABLE `crop_event` DISABLE KEYS */;
/*!40000 ALTER TABLE `crop_event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `crop_read`
--

DROP TABLE IF EXISTS `crop_read`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `crop_read` (
  `UID` binary(16) NOT NULL,
  `BATCH_ID` varchar(255) DEFAULT NULL,
  `STATUS` varchar(255) DEFAULT NULL,
  `TYPE` varchar(255) DEFAULT NULL,
  `CONTAINER_QUANTITY` int(11) DEFAULT NULL,
  `CONTAINER_TYPE` varchar(255) DEFAULT NULL,
  `CONTAINER_CELL` int(11) DEFAULT NULL,
  `INVENTORY_UID` binary(16) DEFAULT NULL,
  `INVENTORY_TYPE` varchar(255) DEFAULT NULL,
  `INVENTORY_PLANT_TYPE` varchar(255) DEFAULT NULL,
  `INVENTORY_NAME` varchar(255) DEFAULT NULL,
  `AREA_STATUS_SEEDING` int(11) DEFAULT NULL,
  `AREA_STATUS_GROWING` int(11) DEFAULT NULL,
  `AREA_STATUS_DUMPED` int(11) DEFAULT NULL,
  `FARM_UID` binary(16) DEFAULT NULL,
  `INITIAL_AREA_UID` binary(16) DEFAULT NULL,
  `INITIAL_AREA_NAME` varchar(255) DEFAULT NULL,
  `INITIAL_AREA_INITIAL_QUANTITY` int(11) DEFAULT NULL,
  `INITIAL_AREA_CURRENT_QUANTITY` int(11) DEFAULT NULL,
  `INITIAL_AREA_LAST_WATERED` datetime DEFAULT NULL,
  `INITIAL_AREA_LAST_FERTILIZED` datetime DEFAULT NULL,
  `INITIAL_AREA_LAST_PESTICIDED` datetime DEFAULT NULL,
  `INITIAL_AREA_LAST_PRUNED` datetime DEFAULT NULL,
  `INITIAL_AREA_CREATED_DATE` datetime DEFAULT NULL,
  `INITIAL_AREA_LAST_UPDATED` datetime DEFAULT NULL,
  PRIMARY KEY (`UID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `crop_read`
--

LOCK TABLES `crop_read` WRITE;
/*!40000 ALTER TABLE `crop_read` DISABLE KEYS */;
/*!40000 ALTER TABLE `crop_read` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `crop_read_harvested_storage`
--

DROP TABLE IF EXISTS `crop_read_harvested_storage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `crop_read_harvested_storage` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `CROP_UID` binary(16) DEFAULT NULL,
  `QUANTITY` int(11) DEFAULT NULL,
  `PRODUCED_GRAM_QUANTITY` float DEFAULT NULL,
  `SOURCE_AREA_UID` binary(16) DEFAULT NULL,
  `SOURCE_AREA_NAME` varchar(255) DEFAULT NULL,
  `CREATED_DATE` datetime DEFAULT NULL,
  `LAST_UPDATED` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `CROP_UID` (`CROP_UID`),
  CONSTRAINT `crop_read_harvested_storage_ibfk_1` FOREIGN KEY (`CROP_UID`) REFERENCES `crop_read` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `crop_read_harvested_storage`
--

LOCK TABLES `crop_read_harvested_storage` WRITE;
/*!40000 ALTER TABLE `crop_read_harvested_storage` DISABLE KEYS */;
/*!40000 ALTER TABLE `crop_read_harvested_storage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `crop_read_moved_area`
--

DROP TABLE IF EXISTS `crop_read_moved_area`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `crop_read_moved_area` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `CROP_UID` binary(16) DEFAULT NULL,
  `AREA_UID` binary(16) DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `INITIAL_QUANTITY` int(11) DEFAULT NULL,
  `CURRENT_QUANTITY` int(11) DEFAULT NULL,
  `LAST_WATERED` datetime DEFAULT NULL,
  `LAST_FERTILIZED` datetime DEFAULT NULL,
  `LAST_PESTICIDED` datetime DEFAULT NULL,
  `LAST_PRUNED` datetime DEFAULT NULL,
  `CREATED_DATE` datetime DEFAULT NULL,
  `LAST_UPDATED` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `CROP_UID` (`CROP_UID`),
  CONSTRAINT `crop_read_moved_area_ibfk_1` FOREIGN KEY (`CROP_UID`) REFERENCES `crop_read` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `crop_read_moved_area`
--

LOCK TABLES `crop_read_moved_area` WRITE;
/*!40000 ALTER TABLE `crop_read_moved_area` DISABLE KEYS */;
/*!40000 ALTER TABLE `crop_read_moved_area` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `crop_read_notes`
--

DROP TABLE IF EXISTS `crop_read_notes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `crop_read_notes` (
  `UID` binary(16) NOT NULL,
  `CROP_UID` binary(16) DEFAULT NULL,
  `CONTENT` text,
  `CREATED_DATE` datetime DEFAULT NULL,
  PRIMARY KEY (`UID`),
  UNIQUE KEY `CROP_READ_NOTES_UID_UNIQUE_INDEX` (`UID`),
  KEY `CROP_READ_NOTES_CROP_UID_INDEX` (`CROP_UID`),
  CONSTRAINT `crop_read_notes_ibfk_1` FOREIGN KEY (`CROP_UID`) REFERENCES `crop_read` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `crop_read_notes`
--

LOCK TABLES `crop_read_notes` WRITE;
/*!40000 ALTER TABLE `crop_read_notes` DISABLE KEYS */;
/*!40000 ALTER TABLE `crop_read_notes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `crop_read_photo`
--

DROP TABLE IF EXISTS `crop_read_photo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `crop_read_photo` (
  `UID` binary(16) NOT NULL,
  `CROP_UID` binary(16) DEFAULT NULL,
  `FILENAME` varchar(255) DEFAULT NULL,
  `MIMETYPE` varchar(255) DEFAULT NULL,
  `SIZE` int(11) DEFAULT NULL,
  `WIDTH` int(11) DEFAULT NULL,
  `HEIGHT` int(11) DEFAULT NULL,
  `DESCRIPTION` text,
  PRIMARY KEY (`UID`),
  KEY `CROP_UID` (`CROP_UID`),
  CONSTRAINT `crop_read_photo_ibfk_1` FOREIGN KEY (`CROP_UID`) REFERENCES `crop_read` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `crop_read_photo`
--

LOCK TABLES `crop_read_photo` WRITE;
/*!40000 ALTER TABLE `crop_read_photo` DISABLE KEYS */;
/*!40000 ALTER TABLE `crop_read_photo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `crop_read_trash`
--

DROP TABLE IF EXISTS `crop_read_trash`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `crop_read_trash` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `CROP_UID` binary(16) DEFAULT NULL,
  `QUANTITY` int(11) DEFAULT NULL,
  `SOURCE_AREA_UID` binary(16) DEFAULT NULL,
  `SOURCE_AREA_NAME` varchar(255) DEFAULT NULL,
  `CREATED_DATE` datetime DEFAULT NULL,
  `LAST_UPDATED` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `CROP_UID` (`CROP_UID`),
  CONSTRAINT `crop_read_trash_ibfk_1` FOREIGN KEY (`CROP_UID`) REFERENCES `crop_read` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `crop_read_trash`
--

LOCK TABLES `crop_read_trash` WRITE;
/*!40000 ALTER TABLE `crop_read_trash` DISABLE KEYS */;
/*!40000 ALTER TABLE `crop_read_trash` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `devices`
--

DROP TABLE IF EXISTS `devices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `devices` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `field_id` int(11) DEFAULT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `device_type` int(11) NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_11074E9A443707B0` (`field_id`),
  CONSTRAINT `FK_11074E9A443707B0` FOREIGN KEY (`field_id`) REFERENCES `fields` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `devices`
--

LOCK TABLES `devices` WRITE;
/*!40000 ALTER TABLE `devices` DISABLE KEYS */;
INSERT INTO `devices` VALUES (1,1,'VEG 0110','asjdfhsjf fjhas fjsf',3,NULL,'2018-10-17 09:24:00');
/*!40000 ALTER TABLE `devices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `farm_event`
--

DROP TABLE IF EXISTS `farm_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `farm_event` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `FARM_UID` binary(16) DEFAULT NULL,
  `VERSION` int(11) DEFAULT NULL,
  `CREATED_DATE` datetime DEFAULT NULL,
  `EVENT` json DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FARM_EVENT_FARM_UID_INDEX` (`FARM_UID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `farm_event`
--

LOCK TABLES `farm_event` WRITE;
/*!40000 ALTER TABLE `farm_event` DISABLE KEYS */;
/*!40000 ALTER TABLE `farm_event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `farm_read`
--

DROP TABLE IF EXISTS `farm_read`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `farm_read` (
  `UID` binary(16) NOT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `LATITUDE` varchar(255) DEFAULT NULL,
  `LONGITUDE` varchar(255) DEFAULT NULL,
  `TYPE` varchar(255) DEFAULT NULL,
  `COUNTRY` varchar(255) DEFAULT NULL,
  `CITY` varchar(255) DEFAULT NULL,
  `IS_ACTIVE` int(11) DEFAULT NULL,
  `CREATED_DATE` datetime DEFAULT NULL,
  PRIMARY KEY (`UID`),
  UNIQUE KEY `FARM_READ_UID_UNIQUE_INDEX` (`UID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `farm_read`
--

LOCK TABLES `farm_read` WRITE;
/*!40000 ALTER TABLE `farm_read` DISABLE KEYS */;
/*!40000 ALTER TABLE `farm_read` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fields`
--

DROP TABLE IF EXISTS `fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `fields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `lat` decimal(10,8) DEFAULT NULL,
  `lng` decimal(11,8) DEFAULT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `updated_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `image_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image_original_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image_mime_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image_size` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fields`
--

LOCK TABLES `fields` WRITE;
/*!40000 ALTER TABLE `fields` DISABLE KEYS */;
INSERT INTO `fields` VALUES (1,'My Farm',31.40873120,73.10048220,'hsdfhjskfhasdfsf','2018-10-17 09:19:58','2018-10-17 09:19:58','5bc6febea05a4461484187.png','1_jlaHbAvVztOsTBUQLWu3rQ.png','image/png',50462),(2,'My Farm 2',31.40873120,73.10048220,'hsdfhjskfhasdfsf','2018-10-17 09:19:58','2018-10-17 09:19:58','5bc6febea05a4461484187.png','1_jlaHbAvVztOsTBUQLWu3rQ.png','image/png',50462);
/*!40000 ALTER TABLE `fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `material_event`
--

DROP TABLE IF EXISTS `material_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `material_event` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `MATERIAL_UID` binary(16) DEFAULT NULL,
  `VERSION` int(11) DEFAULT NULL,
  `CREATED_DATE` datetime DEFAULT NULL,
  `EVENT` json DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `MATERIAL_EVENT_MATERIAL_UID_INDEX` (`MATERIAL_UID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `material_event`
--

LOCK TABLES `material_event` WRITE;
/*!40000 ALTER TABLE `material_event` DISABLE KEYS */;
/*!40000 ALTER TABLE `material_event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `material_read`
--

DROP TABLE IF EXISTS `material_read`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `material_read` (
  `UID` binary(16) NOT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `PRICE_PER_UNIT` varchar(255) DEFAULT NULL,
  `CURRENCY_CODE` varchar(255) DEFAULT NULL,
  `TYPE` varchar(255) DEFAULT NULL,
  `TYPE_DATA` varchar(255) DEFAULT NULL,
  `QUANTITY` float DEFAULT NULL,
  `QUANTITY_UNIT` varchar(255) DEFAULT NULL,
  `EXPIRATION_DATE` varchar(255) DEFAULT NULL,
  `NOTES` varchar(255) DEFAULT NULL,
  `PRODUCED_BY` varchar(255) DEFAULT NULL,
  `CREATED_DATE` datetime DEFAULT NULL,
  PRIMARY KEY (`UID`),
  KEY `MATERIAL_READ_UID_UNIQUE_INDEX` (`UID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `material_read`
--

LOCK TABLES `material_read` WRITE;
/*!40000 ALTER TABLE `material_read` DISABLE KEYS */;
/*!40000 ALTER TABLE `material_read` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migration_versions`
--

DROP TABLE IF EXISTS `migration_versions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `migration_versions` (
  `version` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migration_versions`
--

LOCK TABLES `migration_versions` WRITE;
/*!40000 ALTER TABLE `migration_versions` DISABLE KEYS */;
/*!40000 ALTER TABLE `migration_versions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plants`
--

DROP TABLE IF EXISTS `plants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `plants` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `area_id` int(11) NOT NULL,
  `seed_id` int(11) NOT NULL,
  `seedling_date` date DEFAULT NULL,
  `area_capacity` int(11) NOT NULL,
  `harvesting_date` date DEFAULT NULL,
  `disposing_date` date DEFAULT NULL,
  `note` longtext COLLATE utf8_unicode_ci,
  `action` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_A5AEDC16BD0F409C` (`area_id`),
  KEY `IDX_A5AEDC1664430F6A` (`seed_id`),
  CONSTRAINT `FK_A5AEDC1664430F6A` FOREIGN KEY (`seed_id`) REFERENCES `seeds` (`id`),
  CONSTRAINT `FK_A5AEDC16BD0F409C` FOREIGN KEY (`area_id`) REFERENCES `zones` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plants`
--

LOCK TABLES `plants` WRITE;
/*!40000 ALTER TABLE `plants` DISABLE KEYS */;
INSERT INTO `plants` VALUES (1,1,1,'2018-10-26',80,NULL,NULL,NULL,NULL,NULL,'2018-10-23 22:03:28'),(2,3,1,'2018-10-25',100,NULL,NULL,NULL,NULL,NULL,'2018-10-23 22:30:58');
/*!40000 ALTER TABLE `plants` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservoir_event`
--

DROP TABLE IF EXISTS `reservoir_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `reservoir_event` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RESERVOIR_UID` binary(16) DEFAULT NULL,
  `VERSION` int(11) DEFAULT NULL,
  `CREATED_DATE` datetime DEFAULT NULL,
  `EVENT` json DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `RESERVOIR_EVENT_RESERVOIR_UID_INDEX` (`RESERVOIR_UID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservoir_event`
--

LOCK TABLES `reservoir_event` WRITE;
/*!40000 ALTER TABLE `reservoir_event` DISABLE KEYS */;
/*!40000 ALTER TABLE `reservoir_event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservoir_read`
--

DROP TABLE IF EXISTS `reservoir_read`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `reservoir_read` (
  `UID` binary(16) NOT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `WATERSOURCE_TYPE` varchar(255) DEFAULT NULL,
  `WATERSOURCE_CAPACITY` float DEFAULT NULL,
  `FARM_UID` binary(16) DEFAULT NULL,
  `FARM_NAME` varchar(255) DEFAULT NULL,
  `CREATED_DATE` datetime DEFAULT NULL,
  PRIMARY KEY (`UID`),
  KEY `RESERVOIR_READ_UID_UNIQUE_INDEX` (`UID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservoir_read`
--

LOCK TABLES `reservoir_read` WRITE;
/*!40000 ALTER TABLE `reservoir_read` DISABLE KEYS */;
/*!40000 ALTER TABLE `reservoir_read` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservoir_read_notes`
--

DROP TABLE IF EXISTS `reservoir_read_notes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `reservoir_read_notes` (
  `UID` binary(16) NOT NULL,
  `RESERVOIR_UID` binary(16) DEFAULT NULL,
  `CONTENT` text,
  `CREATED_DATE` datetime DEFAULT NULL,
  PRIMARY KEY (`UID`),
  UNIQUE KEY `RESERVOIR_READ_NOTES_UID_UNIQUE_INDEX` (`UID`),
  KEY `RESERVOIR_READ_NOTES_RESERVOIR_UID_INDEX` (`RESERVOIR_UID`),
  CONSTRAINT `reservoir_read_notes_ibfk_1` FOREIGN KEY (`RESERVOIR_UID`) REFERENCES `reservoir_read` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservoir_read_notes`
--

LOCK TABLES `reservoir_read_notes` WRITE;
/*!40000 ALTER TABLE `reservoir_read_notes` DISABLE KEYS */;
/*!40000 ALTER TABLE `reservoir_read_notes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservoirs`
--

DROP TABLE IF EXISTS `reservoirs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `reservoirs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `field_id` int(11) DEFAULT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `capacity` decimal(10,2) NOT NULL,
  `measurement_unit` int(11) NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_3CAD99A4443707B0` (`field_id`),
  CONSTRAINT `FK_3CAD99A4443707B0` FOREIGN KEY (`field_id`) REFERENCES `fields` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservoirs`
--

LOCK TABLES `reservoirs` WRITE;
/*!40000 ALTER TABLE `reservoirs` DISABLE KEYS */;
INSERT INTO `reservoirs` VALUES (1,NULL,'My Reservoir',89.00,1,NULL,'2018-10-17 09:19:05'),(2,1,'My Reservoir',123.00,2,NULL,'2018-10-17 09:20:35'),(3,2,'jhgsadjfh',12.00,2,NULL,'2018-10-23 11:58:27'),(4,1,'sdasd',23.00,1,NULL,'2018-10-23 11:58:34');
/*!40000 ALTER TABLE `reservoirs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resources`
--

DROP TABLE IF EXISTS `resources`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `resources` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resources`
--

LOCK TABLES `resources` WRITE;
/*!40000 ALTER TABLE `resources` DISABLE KEYS */;
INSERT INTO `resources` VALUES (1,'Temperature',NULL,'2018-10-16 13:13:20'),(2,'Humidity',NULL,'2018-10-16 13:13:20'),(3,'Light',NULL,'2018-10-16 13:13:20'),(4,'Nutrition',NULL,'2018-10-16 13:13:20'),(5,'Moisture',NULL,'2018-10-16 13:13:20'),(6,'pH',NULL,'2018-10-16 13:13:20'),(7,'On/Off State',NULL,'2018-10-16 13:13:20'),(8,'Custom',NULL,'2018-10-16 13:13:20');
/*!40000 ALTER TABLE `resources` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resourcesdevices`
--

DROP TABLE IF EXISTS `resourcesdevices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `resourcesdevices` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `device_id` int(11) DEFAULT NULL,
  `resource_id` int(11) DEFAULT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `rid` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `data_type` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `unit` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_E27EDE6B94A4C7D4` (`device_id`),
  KEY `IDX_E27EDE6B89329D25` (`resource_id`),
  CONSTRAINT `FK_E27EDE6B89329D25` FOREIGN KEY (`resource_id`) REFERENCES `resources` (`id`),
  CONSTRAINT `FK_E27EDE6B94A4C7D4` FOREIGN KEY (`device_id`) REFERENCES `devices` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resourcesdevices`
--

LOCK TABLES `resourcesdevices` WRITE;
/*!40000 ALTER TABLE `resourcesdevices` DISABLE KEYS */;
/*!40000 ALTER TABLE `resourcesdevices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seed_categories`
--

DROP TABLE IF EXISTS `seed_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `seed_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `updated_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seed_categories`
--

LOCK TABLES `seed_categories` WRITE;
/*!40000 ALTER TABLE `seed_categories` DISABLE KEYS */;
INSERT INTO `seed_categories` VALUES (1,'Herb','herb',NULL,NULL,'2018-10-16 13:13:20'),(2,'Vegetable','vegetable',NULL,NULL,'2018-10-16 13:13:20'),(3,'Sprout/Microgreens','sprout-microgreens',NULL,NULL,'2018-10-16 13:13:20'),(4,'Fruit','fruit',NULL,NULL,'2018-10-16 13:13:20'),(5,'Tubber','tubber',NULL,NULL,'2018-10-16 13:13:20'),(6,'Flower','flower',NULL,NULL,'2018-10-16 13:13:20'),(7,'Other','other',NULL,NULL,'2018-10-16 13:13:20');
/*!40000 ALTER TABLE `seed_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seeds`
--

DROP TABLE IF EXISTS `seeds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `seeds` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `seedcategory_id` int(11) DEFAULT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `quantity` int(11) NOT NULL,
  `measurement_unit` int(11) NOT NULL,
  `producer_name` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `origin_country` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `note` longtext COLLATE utf8_unicode_ci,
  `expiration_month` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `expiration_year` int(11) NOT NULL,
  `germination_rate` decimal(5,2) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `image_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image_original_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image_mime_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image_size` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_F229EDDD89C54042` (`seedcategory_id`),
  CONSTRAINT `FK_F229EDDD89C54042` FOREIGN KEY (`seedcategory_id`) REFERENCES `seed_categories` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seeds`
--

LOCK TABLES `seeds` WRITE;
/*!40000 ALTER TABLE `seeds` DISABLE KEYS */;
INSERT INTO `seeds` VALUES (1,2,'my seed',2300,1,'Abuzar','Afghanistan','jhasjdhfjkhsdf12','January',2018,12.00,'2018-10-23 22:28:23','2018-10-17 09:23:13','5bc6ff819db5f090302867.png','1_jlaHbAvVztOsTBUQLWu3rQ.png','image/png',50462);
/*!40000 ALTER TABLE `seeds` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `value` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings`
--

LOCK TABLES `settings` WRITE;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
INSERT INTO `settings` VALUES (1,'mqtt_host','broker.mqttdashboard.com',NULL),(2,'mqtt_port','8000',NULL);
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task_event`
--

DROP TABLE IF EXISTS `task_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `task_event` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TASK_UID` binary(16) DEFAULT NULL,
  `VERSION` int(11) DEFAULT NULL,
  `CREATED_DATE` datetime DEFAULT NULL,
  `EVENT` json DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `TASK_EVENT_TASK_UID_INDEX` (`TASK_UID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task_event`
--

LOCK TABLES `task_event` WRITE;
/*!40000 ALTER TABLE `task_event` DISABLE KEYS */;
/*!40000 ALTER TABLE `task_event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task_read`
--

DROP TABLE IF EXISTS `task_read`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `task_read` (
  `UID` binary(16) NOT NULL,
  `TITLE` varchar(255) DEFAULT NULL,
  `DESCRIPTION` text,
  `CREATED_DATE` datetime DEFAULT NULL,
  `DUE_DATE` datetime DEFAULT NULL,
  `COMPLETED_DATE` datetime DEFAULT NULL,
  `CANCELLED_DATE` datetime DEFAULT NULL,
  `PRIORITY` varchar(255) DEFAULT NULL,
  `STATUS` varchar(255) DEFAULT NULL,
  `DOMAIN_CODE` varchar(255) DEFAULT NULL,
  `DOMAIN_DATA_MATERIAL_ID` binary(16) DEFAULT NULL,
  `DOMAIN_DATA_AREA_ID` binary(16) DEFAULT NULL,
  `DOMAIN_DATA_CROP_ID` binary(16) DEFAULT NULL,
  `CATEGORY` varchar(255) DEFAULT NULL,
  `IS_DUE` tinyint(1) DEFAULT NULL,
  `ASSET_ID` binary(16) DEFAULT NULL,
  PRIMARY KEY (`UID`),
  KEY `TASK_READ_UID_UNIQUE_INDEX` (`UID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task_read`
--

LOCK TABLES `task_read` WRITE;
/*!40000 ALTER TABLE `task_read` DISABLE KEYS */;
/*!40000 ALTER TABLE `task_read` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tasks`
--

DROP TABLE IF EXISTS `tasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tasks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `notes` longtext COLLATE utf8_unicode_ci,
  `category` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `due_date` datetime NOT NULL,
  `urgency_level` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `is_done` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `field_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_50586597443707B0` (`field_id`),
  CONSTRAINT `FK_50586597443707B0` FOREIGN KEY (`field_id`) REFERENCES `fields` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tasks`
--

LOCK TABLES `tasks` WRITE;
/*!40000 ALTER TABLE `tasks` DISABLE KEYS */;
INSERT INTO `tasks` VALUES (1,'you have to do this task asap','jkhasdjkfh sdhf sajkf','area','2018-10-20 14:24:00','high',0,NULL,'2018-10-17 09:25:08',1);
/*!40000 ALTER TABLE `tasks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_auth`
--

DROP TABLE IF EXISTS `user_auth`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `user_auth` (
  `USER_UID` binary(16) NOT NULL,
  `ACCESS_TOKEN` varchar(255) DEFAULT NULL,
  `TOKEN_EXPIRES` int(11) DEFAULT NULL,
  `CREATED_DATE` datetime DEFAULT NULL,
  `LAST_UPDATED` datetime DEFAULT NULL,
  PRIMARY KEY (`USER_UID`),
  UNIQUE KEY `USER_AUTH_USER_UID_UNIQUE_INDEX` (`USER_UID`),
  UNIQUE KEY `USER_AUTH_ACCESS_TOKEN_UNIQUE_INDEX` (`ACCESS_TOKEN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_auth`
--

LOCK TABLES `user_auth` WRITE;
/*!40000 ALTER TABLE `user_auth` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_auth` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_event`
--

DROP TABLE IF EXISTS `user_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `user_event` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `USER_UID` binary(16) DEFAULT NULL,
  `VERSION` int(11) DEFAULT NULL,
  `CREATED_DATE` datetime DEFAULT NULL,
  `EVENT` json DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `USER_EVENT_USER_UID_INDEX` (`USER_UID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_event`
--

LOCK TABLES `user_event` WRITE;
/*!40000 ALTER TABLE `user_event` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_read`
--

DROP TABLE IF EXISTS `user_read`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `user_read` (
  `UID` binary(16) NOT NULL,
  `USERNAME` varchar(255) DEFAULT NULL,
  `PASSWORD` text,
  `CREATED_DATE` datetime DEFAULT NULL,
  `LAST_UPDATED` datetime DEFAULT NULL,
  PRIMARY KEY (`UID`),
  KEY `USER_READ_UID_UNIQUE_INDEX` (`UID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_read`
--

LOCK TABLES `user_read` WRITE;
/*!40000 ALTER TABLE `user_read` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_read` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(180) COLLATE utf8_unicode_ci NOT NULL,
  `username_canonical` varchar(180) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(180) COLLATE utf8_unicode_ci NOT NULL,
  `email_canonical` varchar(180) COLLATE utf8_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `salt` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `confirmation_token` varchar(180) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password_requested_at` datetime DEFAULT NULL,
  `roles` longtext COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Type:array)',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_1483A5E992FC23A8` (`username_canonical`),
  UNIQUE KEY `UNIQ_1483A5E9A0D96FBF` (`email_canonical`),
  UNIQUE KEY `UNIQ_1483A5E9C05FB297` (`confirmation_token`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'abuzar1047','abuzar1047','abuzar2407@gmail.com','abuzar2407@gmail.com',1,NULL,'$2y$13$m5N3Qx.nnPw3pOAGreiKeOgcIZBpoIITM2nLFkpS4rWqtHQub7.pW','2018-10-23 19:57:16',NULL,NULL,'a:0:{}');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zones`
--

DROP TABLE IF EXISTS `zones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `zones` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `reservoir_id` int(11) DEFAULT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `growing_method` int(11) NOT NULL,
  `capacity` int(11) NOT NULL,
  `measurement_unit` int(11) NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `image_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image_original_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image_mime_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image_size` int(11) DEFAULT NULL,
  `mainarea_id` int(11) DEFAULT NULL,
  `height` int(11) DEFAULT NULL,
  `width` int(11) DEFAULT NULL,
  `unit` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `field_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_58B0B25CCDD6B674` (`reservoir_id`),
  KEY `FK_58B0B25C443707B0_idx` (`mainarea_id`),
  KEY `FK_field_zone_idx` (`field_id`),
  CONSTRAINT `FK_58B0B25C443707B0` FOREIGN KEY (`mainarea_id`) REFERENCES `areas` (`id`),
  CONSTRAINT `FK_58B0B25CCDD6B674` FOREIGN KEY (`reservoir_id`) REFERENCES `reservoirs` (`id`),
  CONSTRAINT `FK_field_zone` FOREIGN KEY (`field_id`) REFERENCES `fields` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zones`
--

LOCK TABLES `zones` WRITE;
/*!40000 ALTER TABLE `zones` DISABLE KEYS */;
INSERT INTO `zones` VALUES (1,2,'hsjdfhjasfdjsajf',3,123,2,'2018-10-23 22:02:58','2018-10-17 09:22:15','5bc6ff475c382450317751.png','1_jlaHbAvVztOsTBUQLWu3rQ.png','image/png',50462,1,200,100,'Meters',1),(3,1,'My New Zone',2,122,1,'2018-10-23 22:32:42','2018-10-23 21:27:49','5bcf7635ae534693987020.png','1_jlaHbAvVztOsTBUQLWu3rQ.png','image/png',50462,1,100,300,'Meters',1),(4,2,'Another Zone',2,30,1,'2018-10-24 10:41:29','2018-10-23 21:29:30','5bcf769a15fe8412984790.png','1_jlaHbAvVztOsTBUQLWu3rQ.png','image/png',50462,1,100,100,'Hectare',1),(5,1,'My fav zone',2,100,1,'2018-10-24 09:45:26','2018-10-24 09:45:26','5bd0231661b5b355195705.png','377528-PC0EN2-407.png','image/png',26651,2,200,400,'Meters',1),(6,1,'jkgasdfhjh',3,400,2,'2018-10-24 15:30:43','2018-10-24 15:13:47','5bd0700babf1d350714257.png','377528-PC0EN2-407.png','image/png',26651,1,400,100,'Hectare',1);
/*!40000 ALTER TABLE `zones` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-10-25 19:37:39
