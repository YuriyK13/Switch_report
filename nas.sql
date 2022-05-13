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
-- Table structure for table `internet_main`
--

DROP TABLE IF EXISTS `internet_main`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `internet_main` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL DEFAULT '0',
  `tp_id` smallint(6) NOT NULL DEFAULT '0',
  `logins` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `registration` date DEFAULT '0000-00-00',
  `ip` int(10) unsigned NOT NULL DEFAULT '0',
  `ipv6` varbinary(16) NOT NULL DEFAULT '',
  `ipv6_prefix` varbinary(16) NOT NULL DEFAULT '',
  `ipv6_mask` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `ipv6_prefix_mask` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `netmask` int(10) unsigned NOT NULL DEFAULT '4294967295',
  `filter_id` varchar(150) NOT NULL DEFAULT '',
  `speed` int(10) unsigned NOT NULL DEFAULT '0',
  `cid` varchar(200) NOT NULL DEFAULT '',
  `password` blob NOT NULL,
  `disable` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `join_service` int(10) unsigned NOT NULL DEFAULT '0',
  `turbo_mode` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `free_turbo_mode` smallint(6) unsigned NOT NULL DEFAULT '0',
  `activate` date NOT NULL DEFAULT '0000-00-00',
  `expire` date NOT NULL DEFAULT '0000-00-00',
  `login` varchar(24) NOT NULL DEFAULT '',
  `detail_stats` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `personal_tp` double(14,2) unsigned NOT NULL DEFAULT '0.00',
  `cpe_mac` varchar(200) NOT NULL DEFAULT '',
  `comments` varchar(250) NOT NULL DEFAULT '',
  `port` varchar(100) NOT NULL DEFAULT '',
  `vlan` smallint(6) NOT NULL DEFAULT '0',
  `nas_id` smallint(6) unsigned NOT NULL DEFAULT '0',
  `server_vlan` smallint(6) unsigned NOT NULL DEFAULT '0',
  `ipn_activate` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `port` (`port`),
  KEY `nas_id` (`nas_id`),
  KEY `tp_id` (`tp_id`),
  KEY `cid` (`cid`),
  KEY `cpe_mac` (`cpe_mac`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='Internet users';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `internet_main`
--

LOCK TABLES `internet_main` WRITE;
/*!40000 ALTER TABLE `internet_main` DISABLE KEYS */;
INSERT INTO `internet_main` VALUES (1,1,1,0,'2022-05-04',0,'','',32,32,4294967295,'',0,'','',0,0,0,0,'0000-00-00','0000-00-00','',0,0.00,'','','',0,1,0,0),(2,3,3,0,'2022-05-11',0,'','',32,32,4294967295,'',0,'','',0,0,0,0,'0000-00-00','0000-00-00','',0,0.00,'','','',0,1,0,0),(3,2,2,0,'2022-05-11',0,'','',32,32,4294967295,'',0,'','',1,0,0,0,'0000-00-00','0000-00-00','',0,0.00,'','','',0,1,0,0),(4,4,4,0,'2022-05-11',0,'','',32,32,4294967295,'',0,'','',0,0,0,0,'0000-00-00','0000-00-00','',0,0.00,'','','',0,2,0,0),(5,5,2,0,'2022-05-11',0,'','',32,32,4294967295,'',0,'','',0,0,0,0,'0000-00-00','0000-00-00','',0,0.00,'','','255.255.255.255',0,2,0,0);
/*!40000 ALTER TABLE `internet_main` ENABLE KEYS */;
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

-- Dump completed on 2022-05-13 16:21:55
