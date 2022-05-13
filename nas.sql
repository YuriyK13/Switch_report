-- MySQL dump 10.13  Distrib 5.7.37-40, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: abills
-- ------------------------------------------------------
-- Server version	5.7.37-40

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
/*!50717 SELECT COUNT(*) INTO @rocksdb_has_p_s_session_variables FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'performance_schema' AND TABLE_NAME = 'session_variables' */;
/*!50717 SET @rocksdb_get_is_supported = IF (@rocksdb_has_p_s_session_variables, 'SELECT COUNT(*) INTO @rocksdb_is_supported FROM performance_schema.session_variables WHERE VARIABLE_NAME=\'rocksdb_bulk_load\'', 'SELECT 0') */;
/*!50717 PREPARE s FROM @rocksdb_get_is_supported */;
/*!50717 EXECUTE s */;
/*!50717 DEALLOCATE PREPARE s */;
/*!50717 SET @rocksdb_enable_bulk_load = IF (@rocksdb_is_supported, 'SET SESSION rocksdb_bulk_load = 1', 'SET @rocksdb_dummy_bulk_load = 0') */;
/*!50717 PREPARE s FROM @rocksdb_enable_bulk_load */;
/*!50717 EXECUTE s */;
/*!50717 DEALLOCATE PREPARE s */;

--
-- Table structure for table `nas`
--

DROP TABLE IF EXISTS `nas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nas` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) DEFAULT NULL,
  `nas_identifier` varchar(20) NOT NULL DEFAULT '',
  `descr` varchar(250) DEFAULT NULL,
  `ip` int(11) unsigned NOT NULL DEFAULT '0',
  `nas_type` varchar(20) DEFAULT NULL,
  `auth_type` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `mng_host_port` varchar(28) NOT NULL DEFAULT '',
  `mng_user` varchar(20) DEFAULT NULL,
  `mng_password` blob NOT NULL,
  `rad_pairs` text NOT NULL,
  `alive` smallint(6) unsigned NOT NULL DEFAULT '0',
  `disable` tinyint(6) unsigned NOT NULL DEFAULT '0',
  `ext_acct` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `domain_id` smallint(6) unsigned NOT NULL DEFAULT '0',
  `address_street` varchar(100) NOT NULL DEFAULT '',
  `address_build` varchar(10) NOT NULL DEFAULT '',
  `address_flat` varchar(10) NOT NULL DEFAULT '',
  `zip` varchar(7) NOT NULL DEFAULT '',
  `city` varchar(20) NOT NULL DEFAULT '',
  `country` tinyint(6) unsigned NOT NULL DEFAULT '0',
  `gid` smallint(6) unsigned NOT NULL DEFAULT '0',
  `mac` varchar(17) NOT NULL DEFAULT '',
  `changed` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `location_id` int(11) unsigned NOT NULL DEFAULT '0',
  `floor` varchar(10) NOT NULL DEFAULT '',
  `entrance` varchar(10) NOT NULL DEFAULT '',
  `zabbix_hostid` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `domain_id` (`domain_id`,`ip`,`nas_identifier`),
  KEY `mac` (`mac`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='Nas servers list';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nas`
--

LOCK TABLES `nas` WRITE;
/*!40000 ALTER TABLE `nas` DISABLE KEYS */;
INSERT INTO `nas` VALUES (1,'NAS_Server','','NAS_Server',2130706433,'mpd5',0,'127.0.0.1:3799:5005','admin',_binary 'Km3��\�s8\\','',300,0,0,0,'','','','','',0,0,'','2022-05-04 13:50:51',0,'','',0),(2,'Test_Server_2','','тестовий комутатор',3233857728,'nortel_bs',0,':::',NULL,'','',0,0,0,0,'','','','','',0,0,'','2022-05-13 11:43:55',0,'1','1',0);
/*!40000 ALTER TABLE `nas` ENABLE KEYS */;
UNLOCK TABLES;
/*!50112 SET @disable_bulk_load = IF (@is_rocksdb_supported, 'SET SESSION rocksdb_bulk_load = @old_rocksdb_bulk_load', 'SET @dummy_rocksdb_bulk_load = 0') */;
/*!50112 PREPARE s FROM @disable_bulk_load */;
/*!50112 EXECUTE s */;
/*!50112 DEALLOCATE PREPARE s */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-05-13 16:29:03
