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
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` varchar(20) NOT NULL DEFAULT '',
  `activate` date NOT NULL DEFAULT '0000-00-00',
  `expire` date NOT NULL DEFAULT '0000-00-00',
  `credit` double(10,2) NOT NULL DEFAULT '0.00',
  `reduction` double(6,2) NOT NULL DEFAULT '0.00',
  `reduction_date` date NOT NULL DEFAULT '0000-00-00',
  `registration` date DEFAULT '0000-00-00',
  `password` blob NOT NULL,
  `uid` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `gid` smallint(6) unsigned NOT NULL DEFAULT '0',
  `disable` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `company_id` int(11) unsigned NOT NULL DEFAULT '0',
  `bill_id` int(11) unsigned NOT NULL DEFAULT '0',
  `ext_bill_id` int(10) unsigned NOT NULL DEFAULT '0',
  `credit_date` date DEFAULT '0000-00-00',
  `domain_id` smallint(6) unsigned NOT NULL DEFAULT '0',
  `deleted` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`uid`),
  UNIQUE KEY `id` (`domain_id`,`id`),
  KEY `bill_id` (`bill_id`),
  KEY `gid` (`gid`),
  KEY `company_id` (`company_id`),
  KEY `deleted` (`deleted`),
  KEY `login` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='Users list';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('test','0000-00-00','0000-00-00',0.00,0.00,'0000-00-00','2009-08-03',_binary 'NiŒò¢˜',1,0,0,0,1,0,'0000-00-00',0,0),('tech','2022-05-09','2022-05-14',200.00,10.00,'2022-05-12','2022-05-11',_binary 'NiŒò¢˜',2,0,1,0,2,0,'2022-05-12',0,0),('denis','0000-00-00','0000-00-00',0.00,0.00,'0000-00-00','2022-05-11',_binary 'NiŒò¢˜',3,0,0,0,3,0,'0000-00-00',0,0),('katya','0000-00-00','0000-00-00',0.00,0.00,'0000-00-00','2022-05-11',_binary 'NiŒò¢˜',4,0,0,0,4,0,'0000-00-00',0,0),('lesya','0000-00-00','0000-00-00',0.00,0.00,'0000-00-00','2022-05-11',_binary 'NiŒò¢˜',5,0,0,0,5,0,'0000-00-00',0,0);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
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

-- Dump completed on 2022-05-13 16:32:32
