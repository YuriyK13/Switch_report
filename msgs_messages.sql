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
-- Table structure for table `msgs_messages`
--

DROP TABLE IF EXISTS `msgs_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `msgs_messages` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `par` int(11) unsigned NOT NULL DEFAULT '0',
  `uid` int(11) unsigned NOT NULL DEFAULT '0',
  `chapter` smallint(6) unsigned NOT NULL DEFAULT '0',
  `message` text NOT NULL,
  `reply` text NOT NULL,
  `ip` int(11) unsigned NOT NULL DEFAULT '0',
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `state` tinyint(2) unsigned DEFAULT '0',
  `aid` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT 'Admin ID',
  `subject` varchar(150) NOT NULL DEFAULT '',
  `gid` smallint(4) unsigned NOT NULL DEFAULT '0' COMMENT 'Users gid',
  `priority` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `lock_msg` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `closed_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Close date',
  `done_date` date NOT NULL DEFAULT '0000-00-00' COMMENT 'Msg done date',
  `plan_date` date NOT NULL DEFAULT '0000-00-00' COMMENT 'Planing for execute date',
  `plan_time` time NOT NULL DEFAULT '00:00:00' COMMENT 'Planing for execute time',
  `user_read` datetime NOT NULL,
  `admin_read` datetime NOT NULL,
  `resposible` smallint(6) unsigned DEFAULT '0',
  `inner_msg` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT 'Inner message',
  `phone` varchar(16) NOT NULL DEFAULT '',
  `dispatch_id` int(11) unsigned NOT NULL DEFAULT '0',
  `deligation` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `deligation_level` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `survey_id` smallint(6) unsigned NOT NULL DEFAULT '0',
  `rating` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT 'Message rating',
  `rating_comment` text NOT NULL,
  `location_id` int(11) unsigned NOT NULL DEFAULT '0',
  `domain_id` smallint(6) unsigned NOT NULL DEFAULT '0',
  `plan_interval` smallint(6) unsigned NOT NULL DEFAULT '0',
  `plan_position` smallint(6) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `chapter` (`chapter`),
  KEY `state` (`state`),
  KEY `dispatch_id` (`dispatch_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='Msgs Messages';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `msgs_messages`
--

LOCK TABLES `msgs_messages` WRITE;
/*!40000 ALTER TABLE `msgs_messages` DISABLE KEYS */;
INSERT INTO `msgs_messages` VALUES (1,0,1,1,'Заявка на підключення. Заявка на підключення. Заявка на підключення','',3232235965,'2022-05-10 16:46:19',0,0,'Заявка на підключення',0,2,0,'0000-00-00 00:00:00','0000-00-00','0000-00-00','00:00:00','2022-05-10 17:11:48','2022-05-10 17:11:01',0,0,'',0,0,0,0,0,'',0,0,0,0),(2,0,1,1,'тестовий коментар','',3232235965,'2022-05-10 17:37:10',0,0,'Заявка на підключення',0,2,0,'0000-00-00 00:00:00','0000-00-00','0000-00-00','00:00:00','2022-05-10 17:37:24','2022-05-13 13:44:53',0,0,'',0,0,0,0,0,'',0,0,0,0),(3,0,3,1,'текст текст текст текст текст текст текст текст ','',3232235965,'2022-05-11 15:31:49',0,0,'Тестова тема',0,3,0,'0000-00-00 00:00:00','0000-00-00','0000-00-00','00:00:00','2022-05-11 15:31:52','2022-05-13 13:45:04',0,0,'',0,0,0,0,0,'',0,0,0,0),(4,0,3,1,'Прошу видати мені безплатну квартиру','',3232235965,'2022-05-13 15:40:39',0,0,'Заява в міліцію',0,2,0,'0000-00-00 00:00:00','0000-00-00','0000-00-00','00:00:00','2022-05-13 15:40:43','0000-00-00 00:00:00',0,0,'',0,0,0,0,0,'',0,0,0,0);
/*!40000 ALTER TABLE `msgs_messages` ENABLE KEYS */;
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

-- Dump completed on 2022-05-13 16:31:23
