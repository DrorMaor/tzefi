-- MySQL dump 10.13  Distrib 8.0.26, for Linux (x86_64)
--
-- Host: localhost    Database: tzefi
-- ------------------------------------------------------
-- Server version	8.0.26-0ubuntu0.20.04.2

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `NFLweeks`
--

DROP TABLE IF EXISTS `NFLweeks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `NFLweeks` (
  `id` int NOT NULL AUTO_INCREMENT,
  `season` int NOT NULL,
  `week` tinyint NOT NULL,
  `StartDate` date NOT NULL,
  `EndDate` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `NFLweeks`
--

LOCK TABLES `NFLweeks` WRITE;
/*!40000 ALTER TABLE `NFLweeks` DISABLE KEYS */;
INSERT INTO `NFLweeks` VALUES (18,2021,1,'2021-09-01','2021-09-13'),(19,2021,2,'2021-09-16','2021-09-20'),(20,2021,3,'2021-09-23','2021-09-27'),(21,2021,4,'2021-09-30','2021-10-04'),(22,2021,5,'2021-10-07','2021-10-11'),(23,2021,6,'2021-10-14','2021-10-18'),(24,2021,7,'2021-10-21','2021-10-25'),(25,2021,8,'2021-10-28','2021-11-01'),(26,2021,9,'2021-11-04','2021-11-08'),(27,2021,10,'2021-11-11','2021-11-15'),(28,2021,11,'2021-11-18','2021-11-22'),(29,2021,12,'2021-11-25','2021-11-29'),(30,2021,13,'2021-12-02','2021-12-06'),(31,2021,14,'2021-12-09','2021-12-13'),(32,2021,15,'2021-12-16','2021-12-20'),(33,2021,16,'2021-12-23','2021-12-27'),(34,2021,17,'2022-01-02','2022-01-03'),(35,2021,18,'2022-01-08','2022-01-09');
/*!40000 ALTER TABLE `NFLweeks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `games`
--

DROP TABLE IF EXISTS `games`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `games` (
  `id` int NOT NULL AUTO_INCREMENT,
  `GameDate` date DEFAULT NULL,
  `AwayTeam` varchar(3) DEFAULT NULL,
  `HomeTeam` varchar(3) DEFAULT NULL,
  `AwayScore` int DEFAULT NULL,
  `HomeScore` int DEFAULT NULL,
  `league` varchar(3) DEFAULT NULL,
  `GameType` varchar(3) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6378 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `games`
--

LOCK TABLES `games` WRITE;
/*!40000 ALTER TABLE `games` DISABLE KEYS */;
INSERT INTO `games` VALUES (5915,'2021-09-01','STL','CIN',NULL,NULL,'MLB','RS'),(5916,'2021-09-01','COL','TEX',NULL,NULL,'MLB','RS'),(5917,'2021-09-01','SDP','ARI',NULL,NULL,'MLB','RS'),(5918,'2021-09-01','HOU','SEA',NULL,NULL,'MLB','RS'),(5919,'2021-09-01','STL','CIN',NULL,NULL,'MLB','RS'),(5920,'2021-09-01','PHI','WSN',NULL,NULL,'MLB','RS'),(5921,'2021-09-01','NYY','LAA',NULL,NULL,'MLB','RS'),(5922,'2021-09-01','BAL','TOR',NULL,NULL,'MLB','RS'),(5923,'2021-09-01','OAK','DET',NULL,NULL,'MLB','RS'),(5924,'2021-09-01','BOS','TBR',NULL,NULL,'MLB','RS'),(5925,'2021-09-01','PIT','CHW',NULL,NULL,'MLB','RS'),(5926,'2021-09-01','CLE','KCR',NULL,NULL,'MLB','RS'),(5927,'2021-09-01','CHC','MIN',NULL,NULL,'MLB','RS'),(5928,'2021-09-01','MIL','SFG',NULL,NULL,'MLB','RS'),(5929,'2021-09-01','ATL','LAD',NULL,NULL,'MLB','RS'),(5930,'2021-09-02','OAK','DET',NULL,NULL,'MLB','RS'),(5931,'2021-09-02','MIL','SFG',NULL,NULL,'MLB','RS'),(5932,'2021-09-02','MIA','NYM',NULL,NULL,'MLB','RS'),(5933,'2021-09-02','BOS','TBR',NULL,NULL,'MLB','RS'),(5934,'2021-09-02','PIT','CHC',NULL,NULL,'MLB','RS'),(5935,'2021-09-02','CLE','KCR',NULL,NULL,'MLB','RS'),(5936,'2021-09-02','ATL','COL',NULL,NULL,'MLB','RS'),(5937,'2021-09-03','PIT','CHC',NULL,NULL,'MLB','RS'),(5938,'2021-09-03','BAL','NYY',NULL,NULL,'MLB','RS'),(5939,'2021-09-03','NYM','WSN',NULL,NULL,'MLB','RS'),(5940,'2021-09-03','OAK','TOR',NULL,NULL,'MLB','RS'),(5941,'2021-09-03','CLE','BOS',NULL,NULL,'MLB','RS'),(5942,'2021-09-03','DET','CIN',NULL,NULL,'MLB','RS'),(5943,'2021-09-03','PHI','MIA',NULL,NULL,'MLB','RS'),(5944,'2021-09-03','MIN','TBR',NULL,NULL,'MLB','RS'),(5945,'2021-09-03','CHW','KCR',NULL,NULL,'MLB','RS'),(5946,'2021-09-03','STL','MIL',NULL,NULL,'MLB','RS'),(5947,'2021-09-03','ATL','COL',NULL,NULL,'MLB','RS'),(5948,'2021-09-03','TEX','LAA',NULL,NULL,'MLB','RS'),(5949,'2021-09-03','SEA','ARI',NULL,NULL,'MLB','RS'),(5950,'2021-09-03','LAD','SFG',NULL,NULL,'MLB','RS'),(5951,'2021-09-03','HOU','SDP',NULL,NULL,'MLB','RS'),(5952,'2021-09-04','BAL','NYY',NULL,NULL,'MLB','RS'),(5953,'2021-09-04','NYM','WSN',NULL,NULL,'MLB','RS'),(5954,'2021-09-04','PIT','CHC',NULL,NULL,'MLB','RS'),(5955,'2021-09-04','OAK','TOR',NULL,NULL,'MLB','RS'),(5956,'2021-09-04','MIN','TBR',NULL,NULL,'MLB','RS'),(5957,'2021-09-04','CLE','BOS',NULL,NULL,'MLB','RS'),(5958,'2021-09-04','NYM','WSN',NULL,NULL,'MLB','RS'),(5959,'2021-09-04','PHI','MIA',NULL,NULL,'MLB','RS'),(5960,'2021-09-04','DET','CIN',NULL,NULL,'MLB','RS'),(5961,'2021-09-04','CHW','KCR',NULL,NULL,'MLB','RS'),(5962,'2021-09-04','STL','MIL',NULL,NULL,'MLB','RS'),(5963,'2021-09-04','SEA','ARI',NULL,NULL,'MLB','RS'),(5964,'2021-09-04','ATL','COL',NULL,NULL,'MLB','RS'),(5965,'2021-09-04','HOU','SDP',NULL,NULL,'MLB','RS'),(5966,'2021-09-04','LAD','SFG',NULL,NULL,'MLB','RS'),(5967,'2021-09-04','TEX','LAA',NULL,NULL,'MLB','RS'),(5968,'2021-09-05','BAL','NYY',2,7,'MLB','RS'),(5969,'2021-09-05','NYM','WSN',6,4,'MLB','RS'),(5970,'2021-09-05','OAK','TOR',6,8,'MLB','RS'),(5971,'2021-09-05','CLE','BOS',3,7,'MLB','RS'),(5972,'2021-09-05','DET','CIN',6,7,'MLB','RS'),(5973,'2021-09-05','PHI','MIA',8,2,'MLB','RS'),(5974,'2021-09-05','MIN','TBR',4,5,'MLB','RS'),(5975,'2021-09-05','CHW','KCR',9,2,'MLB','RS'),(5976,'2021-09-05','STL','MIL',5,7,'MLB','RS'),(5977,'2021-09-05','PIT','CHC',2,3,'MLB','RS'),(5978,'2021-09-05','ATL','COL',6,2,'MLB','RS'),(5979,'2021-09-05','TEX','LAA',2,6,'MLB','RS'),(5980,'2021-09-05','SEA','ARI',5,4,'MLB','RS'),(5981,'2021-09-05','HOU','SDP',6,4,'MLB','RS'),(5982,'2021-09-05','LAD','SFG',8,9,'MLB','RS'),(5983,'2021-09-06','KCR','BAL',4,5,'MLB','RS'),(5984,'2021-09-06','TOR','NYY',8,7,'MLB','RS'),(5985,'2021-09-06','NYM','WSN',6,4,'MLB','RS'),(5986,'2021-09-06','TBR','BOS',8,7,'MLB','RS'),(5987,'2021-09-06','DET','PIT',6,4,'MLB','RS'),(5988,'2021-09-06','PHI','MIL',4,5,'MLB','RS'),(5989,'2021-09-06','CIN','CHC',5,4,'MLB','RS'),(5990,'2021-09-06','SFG','COL',6,4,'MLB','RS'),(5991,'2021-09-06','LAD','STL',9,6,'MLB','RS'),(5992,'2021-09-06','MIN','CLE',4,5,'MLB','RS'),(5993,'2021-09-06','SEA','HOU',4,6,'MLB','RS'),(5994,'2021-09-06','TEX','LAA',2,6,'MLB','RS'),(5995,'2021-09-07','MIN','CLE',NULL,NULL,'MLB','RS'),(5996,'2021-09-07','DET','PIT',NULL,NULL,'MLB','RS'),(5997,'2021-09-07','NYM','MIA',NULL,NULL,'MLB','RS'),(5998,'2021-09-07','KCR','BAL',NULL,NULL,'MLB','RS'),(5999,'2021-09-07','TOR','NYY',NULL,NULL,'MLB','RS'),(6000,'2021-09-07','TBR','BOS',NULL,NULL,'MLB','RS'),(6001,'2021-09-07','WSN','ATL',NULL,NULL,'MLB','RS'),(6002,'2021-09-07','CIN','CHC',NULL,NULL,'MLB','RS'),(6003,'2021-09-07','PHI','MIL',NULL,NULL,'MLB','RS'),(6004,'2021-09-07','LAD','STL',NULL,NULL,'MLB','RS'),(6005,'2021-09-07','SEA','HOU',NULL,NULL,'MLB','RS'),(6006,'2021-09-07','SFG','COL',NULL,NULL,'MLB','RS'),(6007,'2021-09-07','TEX','ARI',NULL,NULL,'MLB','RS'),(6008,'2021-09-07','CHW','OAK',NULL,NULL,'MLB','RS'),(6009,'2021-09-07','LAA','SDP',NULL,NULL,'MLB','RS'),(6010,'2021-09-08','SEA','HOU',4,6,'MLB','RS'),(6011,'2021-09-08','SFG','COL',4,3,'MLB','RS'),(6012,'2021-09-08','TEX','ARI',6,4,'MLB','RS'),(6013,'2021-09-08','MIN','CLE',4,7,'MLB','RS'),(6014,'2021-09-08','DET','PIT',7,3,'MLB','RS'),(6015,'2021-09-08','NYM','MIA',5,4,'MLB','RS'),(6016,'2021-09-08','KCR','BAL',5,1,'MLB','RS'),(6017,'2021-09-08','TOR','NYY',9,5,'MLB','RS'),(6018,'2021-09-08','TBR','BOS',9,10,'MLB','RS'),(6019,'2021-09-08','WSN','ATL',5,7,'MLB','RS'),(6020,'2021-09-08','CIN','CHC',6,2,'MLB','RS'),(6021,'2021-09-08','PHI','MIL',4,8,'MLB','RS'),(6022,'2021-09-08','LAD','STL',7,5,'MLB','RS'),(6023,'2021-09-08','LAA','SDP',4,5,'MLB','RS'),(6024,'2021-09-08','CHW','OAK',6,9,'MLB','RS'),(6025,'2021-09-09','LAD','STL',NULL,NULL,'MLB','RS'),(6026,'2021-09-09','CHW','OAK',NULL,NULL,'MLB','RS'),(6027,'2021-09-09','MIN','CLE',NULL,NULL,'MLB','RS'),(6028,'2021-09-09','NYM','MIA',NULL,NULL,'MLB','RS'),(6029,'2021-09-09','KCR','BAL',NULL,NULL,'MLB','RS'),(6030,'2021-09-09','TOR','NYY',NULL,NULL,'MLB','RS'),(6031,'2021-09-09','COL','PHI',NULL,NULL,'MLB','RS'),(6032,'2021-09-09','WSN','ATL',NULL,NULL,'MLB','RS'),(6033,'2021-09-10','SFG','CHC',NULL,NULL,'MLB','RS'),(6034,'2021-09-10','WSN','PIT',NULL,NULL,'MLB','RS'),(6035,'2021-09-10','TOR','BAL',NULL,NULL,'MLB','RS'),(6036,'2021-09-10','COL','PHI',NULL,NULL,'MLB','RS'),(6037,'2021-09-10','MIL','CLE',NULL,NULL,'MLB','RS'),(6038,'2021-09-10','TBR','DET',NULL,NULL,'MLB','RS'),(6039,'2021-09-10','NYY','NYM',NULL,NULL,'MLB','RS'),(6040,'2021-09-10','MIA','ATL',NULL,NULL,'MLB','RS'),(6041,'2021-09-10','BOS','CHW',NULL,NULL,'MLB','RS'),(6042,'2021-09-10','LAA','HOU',NULL,NULL,'MLB','RS'),(6043,'2021-09-10','KCR','MIN',NULL,NULL,'MLB','RS'),(6044,'2021-09-10','CIN','STL',NULL,NULL,'MLB','RS'),(6045,'2021-09-10','TEX','OAK',NULL,NULL,'MLB','RS'),(6046,'2021-09-10','SDP','LAD',NULL,NULL,'MLB','RS'),(6047,'2021-09-10','ARI','SEA',NULL,NULL,'MLB','RS'),(6048,'2021-09-11','SFG','CHC',NULL,NULL,'MLB','RS'),(6049,'2021-09-11','TEX','OAK',NULL,NULL,'MLB','RS'),(6050,'2021-09-11','TOR','BAL',NULL,NULL,'MLB','RS'),(6051,'2021-09-11','COL','PHI',NULL,NULL,'MLB','RS'),(6052,'2021-09-11','MIL','CLE',NULL,NULL,'MLB','RS'),(6053,'2021-09-11','TBR','DET',NULL,NULL,'MLB','RS'),(6054,'2021-09-11','WSN','PIT',NULL,NULL,'MLB','RS'),(6055,'2021-09-11','BOS','CHW',NULL,NULL,'MLB','RS'),(6056,'2021-09-11','LAA','HOU',NULL,NULL,'MLB','RS'),(6057,'2021-09-11','KCR','MIN',NULL,NULL,'MLB','RS'),(6058,'2021-09-11','CIN','STL',NULL,NULL,'MLB','RS'),(6059,'2021-09-11','MIA','ATL',NULL,NULL,'MLB','RS'),(6060,'2021-09-11','NYY','NYM',NULL,NULL,'MLB','RS'),(6061,'2021-09-11','SDP','LAD',NULL,NULL,'MLB','RS'),(6062,'2021-09-11','ARI','SEA',NULL,NULL,'MLB','RS'),(6063,'2021-09-11','TOR','BAL',NULL,NULL,'MLB','RS'),(6064,'2021-09-12','TOR','BAL',NULL,NULL,'MLB','RS'),(6065,'2021-09-12','COL','PHI',NULL,NULL,'MLB','RS'),(6066,'2021-09-12','WSN','PIT',NULL,NULL,'MLB','RS'),(6067,'2021-09-12','MIL','CLE',NULL,NULL,'MLB','RS'),(6068,'2021-09-12','TBR','DET',NULL,NULL,'MLB','RS'),(6069,'2021-09-12','MIA','ATL',NULL,NULL,'MLB','RS'),(6070,'2021-09-12','BOS','CHW',NULL,NULL,'MLB','RS'),(6071,'2021-09-12','LAA','HOU',NULL,NULL,'MLB','RS'),(6072,'2021-09-12','KCR','MIN',NULL,NULL,'MLB','RS'),(6073,'2021-09-12','CIN','STL',NULL,NULL,'MLB','RS'),(6074,'2021-09-12','SFG','CHC',NULL,NULL,'MLB','RS'),(6075,'2021-09-12','TEX','OAK',NULL,NULL,'MLB','RS'),(6076,'2021-09-12','SDP','LAD',NULL,NULL,'MLB','RS'),(6077,'2021-09-12','ARI','SEA',NULL,NULL,'MLB','RS'),(6078,'2021-09-12','NYY','NYM',NULL,NULL,'MLB','RS'),(6079,'2021-09-13','MIN','NYY',NULL,NULL,'MLB','RS'),(6080,'2021-09-13','MIA','WSN',NULL,NULL,'MLB','RS'),(6081,'2021-09-13','TBR','TOR',NULL,NULL,'MLB','RS'),(6082,'2021-09-13','STL','NYM',NULL,NULL,'MLB','RS'),(6083,'2021-09-13','HOU','TEX',NULL,NULL,'MLB','RS'),(6084,'2021-09-13','SDP','SFG',NULL,NULL,'MLB','RS'),(6085,'2021-09-13','ARI','LAD',NULL,NULL,'MLB','RS'),(6086,'2021-09-13','BOS','SEA',NULL,NULL,'MLB','RS'),(6087,'2021-09-14','CLE','MIN',NULL,NULL,'MLB','RS'),(6088,'2021-09-14','CIN','PIT',NULL,NULL,'MLB','RS'),(6089,'2021-09-14','MIL','DET',NULL,NULL,'MLB','RS'),(6090,'2021-09-14','NYY','BAL',NULL,NULL,'MLB','RS'),(6091,'2021-09-14','CHC','PHI',NULL,NULL,'MLB','RS'),(6092,'2021-09-14','MIA','WSN',NULL,NULL,'MLB','RS'),(6093,'2021-09-14','TBR','TOR',NULL,NULL,'MLB','RS'),(6094,'2021-09-14','STL','NYM',NULL,NULL,'MLB','RS'),(6095,'2021-09-14','COL','ATL',NULL,NULL,'MLB','RS'),(6096,'2021-09-14','CLE','MIN',NULL,NULL,'MLB','RS'),(6097,'2021-09-14','HOU','TEX',NULL,NULL,'MLB','RS'),(6098,'2021-09-14','LAA','CHW',NULL,NULL,'MLB','RS'),(6099,'2021-09-14','OAK','KCR',NULL,NULL,'MLB','RS'),(6100,'2021-09-14','SDP','SFG',NULL,NULL,'MLB','RS'),(6101,'2021-09-14','ARI','LAD',NULL,NULL,'MLB','RS'),(6102,'2021-09-14','BOS','SEA',NULL,NULL,'MLB','RS'),(6103,'2021-09-15','MIA','WSN',NULL,NULL,'MLB','RS'),(6104,'2021-09-15','MIL','DET',NULL,NULL,'MLB','RS'),(6105,'2021-09-15','TBR','TOR',NULL,NULL,'MLB','RS'),(6106,'2021-09-15','BOS','SEA',NULL,NULL,'MLB','RS'),(6107,'2021-09-15','CIN','PIT',NULL,NULL,'MLB','RS'),(6108,'2021-09-15','NYY','BAL',NULL,NULL,'MLB','RS'),(6109,'2021-09-15','CHC','PHI',NULL,NULL,'MLB','RS'),(6110,'2021-09-15','STL','NYM',NULL,NULL,'MLB','RS'),(6111,'2021-09-15','COL','ATL',NULL,NULL,'MLB','RS'),(6112,'2021-09-15','CLE','MIN',NULL,NULL,'MLB','RS'),(6113,'2021-09-15','HOU','TEX',NULL,NULL,'MLB','RS'),(6114,'2021-09-15','LAA','CHW',NULL,NULL,'MLB','RS'),(6115,'2021-09-15','OAK','KCR',NULL,NULL,'MLB','RS'),(6116,'2021-09-15','SDP','SFG',NULL,NULL,'MLB','RS'),(6117,'2021-09-15','ARI','LAD',NULL,NULL,'MLB','RS'),(6118,'2021-09-16','COL','ATL',NULL,NULL,'MLB','RS'),(6119,'2021-09-16','CIN','PIT',NULL,NULL,'MLB','RS'),(6120,'2021-09-16','LAA','CHW',NULL,NULL,'MLB','RS'),(6121,'2021-09-16','OAK','KCR',NULL,NULL,'MLB','RS'),(6122,'2021-09-16','SDP','SFG',NULL,NULL,'MLB','RS'),(6123,'2021-09-16','NYY','BAL',NULL,NULL,'MLB','RS'),(6124,'2021-09-16','CHC','PHI',NULL,NULL,'MLB','RS'),(6125,'2021-09-16','DET','TBR',NULL,NULL,'MLB','RS'),(6126,'2021-09-16','HOU','TEX',NULL,NULL,'MLB','RS'),(6127,'2021-09-17','CLE','NYY',NULL,NULL,'MLB','RS'),(6128,'2021-09-17','COL','WSN',NULL,NULL,'MLB','RS'),(6129,'2021-09-17','MIN','TOR',NULL,NULL,'MLB','RS'),(6130,'2021-09-17','BAL','BOS',NULL,NULL,'MLB','RS'),(6131,'2021-09-17','LAD','CIN',NULL,NULL,'MLB','RS'),(6132,'2021-09-17','PIT','MIA',NULL,NULL,'MLB','RS'),(6133,'2021-09-17','PHI','NYM',NULL,NULL,'MLB','RS'),(6134,'2021-09-17','DET','TBR',NULL,NULL,'MLB','RS'),(6135,'2021-09-17','CHW','TEX',NULL,NULL,'MLB','RS'),(6136,'2021-09-17','ARI','HOU',NULL,NULL,'MLB','RS'),(6137,'2021-09-17','SEA','KCR',NULL,NULL,'MLB','RS'),(6138,'2021-09-17','CHC','MIL',NULL,NULL,'MLB','RS'),(6139,'2021-09-17','SDP','STL',NULL,NULL,'MLB','RS'),(6140,'2021-09-17','OAK','LAA',NULL,NULL,'MLB','RS'),(6141,'2021-09-17','ATL','SFG',NULL,NULL,'MLB','RS'),(6142,'2021-09-18','CLE','NYY',NULL,NULL,'MLB','RS'),(6143,'2021-09-18','BAL','BOS',NULL,NULL,'MLB','RS'),(6144,'2021-09-18','LAD','CIN',NULL,NULL,'MLB','RS'),(6145,'2021-09-18','MIN','TOR',NULL,NULL,'MLB','RS'),(6146,'2021-09-18','COL','WSN',NULL,NULL,'MLB','RS'),(6147,'2021-09-18','DET','TBR',NULL,NULL,'MLB','RS'),(6148,'2021-09-18','PIT','MIA',NULL,NULL,'MLB','RS'),(6149,'2021-09-18','CHW','TEX',NULL,NULL,'MLB','RS'),(6150,'2021-09-18','ARI','HOU',NULL,NULL,'MLB','RS'),(6151,'2021-09-18','SEA','KCR',NULL,NULL,'MLB','RS'),(6152,'2021-09-18','CHC','MIL',NULL,NULL,'MLB','RS'),(6153,'2021-09-18','PHI','NYM',NULL,NULL,'MLB','RS'),(6154,'2021-09-18','SDP','STL',NULL,NULL,'MLB','RS'),(6155,'2021-09-18','ATL','SFG',NULL,NULL,'MLB','RS'),(6156,'2021-09-18','OAK','LAA',NULL,NULL,'MLB','RS'),(6157,'2021-09-19','CLE','NYY',NULL,NULL,'MLB','RS'),(6158,'2021-09-19','COL','WSN',NULL,NULL,'MLB','RS'),(6159,'2021-09-19','MIN','TOR',NULL,NULL,'MLB','RS'),(6160,'2021-09-19','BAL','BOS',NULL,NULL,'MLB','RS'),(6161,'2021-09-19','LAD','CIN',NULL,NULL,'MLB','RS'),(6162,'2021-09-19','PIT','MIA',NULL,NULL,'MLB','RS'),(6163,'2021-09-19','PHI','NYM',NULL,NULL,'MLB','RS'),(6164,'2021-09-19','DET','TBR',NULL,NULL,'MLB','RS'),(6165,'2021-09-19','ARI','HOU',NULL,NULL,'MLB','RS'),(6166,'2021-09-19','SEA','KCR',NULL,NULL,'MLB','RS'),(6167,'2021-09-19','CHC','MIL',NULL,NULL,'MLB','RS'),(6168,'2021-09-19','SDP','STL',NULL,NULL,'MLB','RS'),(6169,'2021-09-19','CHW','TEX',NULL,NULL,'MLB','RS'),(6170,'2021-09-19','ATL','SFG',NULL,NULL,'MLB','RS'),(6171,'2021-09-19','OAK','LAA',NULL,NULL,'MLB','RS'),(6172,'2021-09-20','KCR','CLE',NULL,NULL,'MLB','RS'),(6173,'2021-09-20','PIT','CIN',NULL,NULL,'MLB','RS'),(6174,'2021-09-20','CHW','DET',NULL,NULL,'MLB','RS'),(6175,'2021-09-20','WSN','MIA',NULL,NULL,'MLB','RS'),(6176,'2021-09-20','TEX','NYY',NULL,NULL,'MLB','RS'),(6177,'2021-09-20','BAL','PHI',NULL,NULL,'MLB','RS'),(6178,'2021-09-20','TOR','TBR',NULL,NULL,'MLB','RS'),(6179,'2021-09-20','STL','MIL',NULL,NULL,'MLB','RS'),(6180,'2021-09-20','HOU','LAA',NULL,NULL,'MLB','RS'),(6181,'2021-09-20','ATL','ARI',NULL,NULL,'MLB','RS'),(6182,'2021-09-20','SEA','OAK',NULL,NULL,'MLB','RS'),(6183,'2021-09-20','KCR','CLE',NULL,NULL,'MLB','RS'),(6184,'2021-09-21','KCR','CLE',NULL,NULL,'MLB','RS'),(6185,'2021-09-21','PIT','CIN',NULL,NULL,'MLB','RS'),(6186,'2021-09-21','CHW','DET',NULL,NULL,'MLB','RS'),(6187,'2021-09-21','WSN','MIA',NULL,NULL,'MLB','RS'),(6188,'2021-09-21','TEX','NYY',NULL,NULL,'MLB','RS'),(6189,'2021-09-21','BAL','PHI',NULL,NULL,'MLB','RS'),(6190,'2021-09-21','NYM','BOS',NULL,NULL,'MLB','RS'),(6191,'2021-09-21','TOR','TBR',NULL,NULL,'MLB','RS'),(6192,'2021-09-21','MIN','CHC',NULL,NULL,'MLB','RS'),(6193,'2021-09-21','STL','MIL',NULL,NULL,'MLB','RS'),(6194,'2021-09-21','LAD','COL',NULL,NULL,'MLB','RS'),(6195,'2021-09-21','HOU','LAA',NULL,NULL,'MLB','RS'),(6196,'2021-09-21','ATL','ARI',NULL,NULL,'MLB','RS'),(6197,'2021-09-21','SEA','OAK',NULL,NULL,'MLB','RS'),(6198,'2021-09-21','SFG','SDP',NULL,NULL,'MLB','RS'),(6199,'2021-09-22','PIT','CIN',NULL,NULL,'MLB','RS'),(6200,'2021-09-22','CHW','DET',NULL,NULL,'MLB','RS'),(6201,'2021-09-22','TOR','TBR',NULL,NULL,'MLB','RS'),(6202,'2021-09-22','KCR','CLE',NULL,NULL,'MLB','RS'),(6203,'2021-09-22','WSN','MIA',NULL,NULL,'MLB','RS'),(6204,'2021-09-22','TEX','NYY',NULL,NULL,'MLB','RS'),(6205,'2021-09-22','BAL','PHI',NULL,NULL,'MLB','RS'),(6206,'2021-09-22','NYM','BOS',NULL,NULL,'MLB','RS'),(6207,'2021-09-22','MIN','CHC',NULL,NULL,'MLB','RS'),(6208,'2021-09-22','STL','MIL',NULL,NULL,'MLB','RS'),(6209,'2021-09-22','LAD','COL',NULL,NULL,'MLB','RS'),(6210,'2021-09-22','HOU','LAA',NULL,NULL,'MLB','RS'),(6211,'2021-09-22','ATL','ARI',NULL,NULL,'MLB','RS'),(6212,'2021-09-22','SEA','OAK',NULL,NULL,'MLB','RS'),(6213,'2021-09-22','SFG','SDP',NULL,NULL,'MLB','RS'),(6214,'2021-09-23','CHW','CLE',NULL,NULL,'MLB','RS'),(6215,'2021-09-23','STL','MIL',NULL,NULL,'MLB','RS'),(6216,'2021-09-23','LAD','COL',NULL,NULL,'MLB','RS'),(6217,'2021-09-23','SEA','OAK',NULL,NULL,'MLB','RS'),(6218,'2021-09-23','ATL','ARI',NULL,NULL,'MLB','RS'),(6219,'2021-09-23','SFG','SDP',NULL,NULL,'MLB','RS'),(6220,'2021-09-23','CHW','CLE',NULL,NULL,'MLB','RS'),(6221,'2021-09-23','WSN','CIN',NULL,NULL,'MLB','RS'),(6222,'2021-09-23','TEX','BAL',NULL,NULL,'MLB','RS'),(6223,'2021-09-23','PIT','PHI',NULL,NULL,'MLB','RS'),(6224,'2021-09-23','TOR','MIN',NULL,NULL,'MLB','RS'),(6225,'2021-09-23','HOU','LAA',NULL,NULL,'MLB','RS'),(6226,'2021-09-24','STL','CHC',NULL,NULL,'MLB','RS'),(6227,'2021-09-24','TEX','BAL',NULL,NULL,'MLB','RS'),(6228,'2021-09-24','PIT','PHI',NULL,NULL,'MLB','RS'),(6229,'2021-09-24','NYY','BOS',NULL,NULL,'MLB','RS'),(6230,'2021-09-24','WSN','CIN',NULL,NULL,'MLB','RS'),(6231,'2021-09-24','CHW','CLE',NULL,NULL,'MLB','RS'),(6232,'2021-09-24','KCR','DET',NULL,NULL,'MLB','RS'),(6233,'2021-09-24','MIA','TBR',NULL,NULL,'MLB','RS'),(6234,'2021-09-24','STL','CHC',NULL,NULL,'MLB','RS'),(6235,'2021-09-24','SFG','COL',NULL,NULL,'MLB','RS'),(6236,'2021-09-24','NYM','MIL',NULL,NULL,'MLB','RS'),(6237,'2021-09-24','TOR','MIN',NULL,NULL,'MLB','RS'),(6238,'2021-09-24','SEA','LAA',NULL,NULL,'MLB','RS'),(6239,'2021-09-24','LAD','ARI',NULL,NULL,'MLB','RS'),(6240,'2021-09-24','HOU','OAK',NULL,NULL,'MLB','RS'),(6241,'2021-09-24','ATL','SDP',NULL,NULL,'MLB','RS'),(6242,'2021-09-25','STL','CHC',NULL,NULL,'MLB','RS'),(6243,'2021-09-25','PIT','PHI',NULL,NULL,'MLB','RS'),(6244,'2021-09-25','HOU','OAK',NULL,NULL,'MLB','RS'),(6245,'2021-09-25','NYY','BOS',NULL,NULL,'MLB','RS'),(6246,'2021-09-25','KCR','DET',NULL,NULL,'MLB','RS'),(6247,'2021-09-25','MIA','TBR',NULL,NULL,'MLB','RS'),(6248,'2021-09-25','TEX','BAL',NULL,NULL,'MLB','RS'),(6249,'2021-09-25','WSN','CIN',NULL,NULL,'MLB','RS'),(6250,'2021-09-25','NYM','MIL',NULL,NULL,'MLB','RS'),(6251,'2021-09-25','TOR','MIN',NULL,NULL,'MLB','RS'),(6252,'2021-09-25','CHW','CLE',NULL,NULL,'MLB','RS'),(6253,'2021-09-25','ATL','SDP',NULL,NULL,'MLB','RS'),(6254,'2021-09-25','LAD','ARI',NULL,NULL,'MLB','RS'),(6255,'2021-09-25','SFG','COL',NULL,NULL,'MLB','RS'),(6256,'2021-09-25','SEA','LAA',NULL,NULL,'MLB','RS'),(6257,'2021-09-26','NYY','BOS',NULL,NULL,'MLB','RS'),(6258,'2021-09-26','TEX','BAL',NULL,NULL,'MLB','RS'),(6259,'2021-09-26','PIT','PHI',NULL,NULL,'MLB','RS'),(6260,'2021-09-26','WSN','CIN',NULL,NULL,'MLB','RS'),(6261,'2021-09-26','CHW','CLE',NULL,NULL,'MLB','RS'),(6262,'2021-09-26','KCR','DET',NULL,NULL,'MLB','RS'),(6263,'2021-09-26','MIA','TBR',NULL,NULL,'MLB','RS'),(6264,'2021-09-26','NYM','MIL',NULL,NULL,'MLB','RS'),(6265,'2021-09-26','TOR','MIN',NULL,NULL,'MLB','RS'),(6266,'2021-09-26','STL','CHC',NULL,NULL,'MLB','RS'),(6267,'2021-09-26','SFG','COL',NULL,NULL,'MLB','RS'),(6268,'2021-09-26','SEA','LAA',NULL,NULL,'MLB','RS'),(6269,'2021-09-26','HOU','OAK',NULL,NULL,'MLB','RS'),(6270,'2021-09-26','LAD','ARI',NULL,NULL,'MLB','RS'),(6271,'2021-09-26','ATL','SDP',NULL,NULL,'MLB','RS'),(6272,'2021-09-27','WSN','COL',NULL,NULL,'MLB','RS'),(6273,'2021-09-27','OAK','SEA',NULL,NULL,'MLB','RS'),(6274,'2021-09-28','MIA','NYM',NULL,NULL,'MLB','RS'),(6275,'2021-09-28','CHC','PIT',NULL,NULL,'MLB','RS'),(6276,'2021-09-28','BOS','BAL',NULL,NULL,'MLB','RS'),(6277,'2021-09-28','NYY','TOR',NULL,NULL,'MLB','RS'),(6278,'2021-09-28','PHI','ATL',NULL,NULL,'MLB','RS'),(6279,'2021-09-28','DET','MIN',NULL,NULL,'MLB','RS'),(6280,'2021-09-28','MIL','STL',NULL,NULL,'MLB','RS'),(6281,'2021-09-28','LAA','TEX',NULL,NULL,'MLB','RS'),(6282,'2021-09-28','CIN','CHW',NULL,NULL,'MLB','RS'),(6283,'2021-09-28','TBR','HOU',NULL,NULL,'MLB','RS'),(6284,'2021-09-28','CLE','KCR',NULL,NULL,'MLB','RS'),(6285,'2021-09-28','WSN','COL',NULL,NULL,'MLB','RS'),(6286,'2021-09-28','ARI','SFG',NULL,NULL,'MLB','RS'),(6287,'2021-09-28','SDP','LAD',NULL,NULL,'MLB','RS'),(6288,'2021-09-28','OAK','SEA',NULL,NULL,'MLB','RS'),(6289,'2021-09-28','MIA','NYM',NULL,NULL,'MLB','RS'),(6290,'2021-09-29','WSN','COL',NULL,NULL,'MLB','RS'),(6291,'2021-09-29','CHC','PIT',NULL,NULL,'MLB','RS'),(6292,'2021-09-29','BOS','BAL',NULL,NULL,'MLB','RS'),(6293,'2021-09-29','NYY','TOR',NULL,NULL,'MLB','RS'),(6294,'2021-09-29','MIA','NYM',NULL,NULL,'MLB','RS'),(6295,'2021-09-29','PHI','ATL',NULL,NULL,'MLB','RS'),(6296,'2021-09-29','DET','MIN',NULL,NULL,'MLB','RS'),(6297,'2021-09-29','MIL','STL',NULL,NULL,'MLB','RS'),(6298,'2021-09-29','LAA','TEX',NULL,NULL,'MLB','RS'),(6299,'2021-09-29','CIN','CHW',NULL,NULL,'MLB','RS'),(6300,'2021-09-29','TBR','HOU',NULL,NULL,'MLB','RS'),(6301,'2021-09-29','CLE','KCR',NULL,NULL,'MLB','RS'),(6302,'2021-09-29','ARI','SFG',NULL,NULL,'MLB','RS'),(6303,'2021-09-29','SDP','LAD',NULL,NULL,'MLB','RS'),(6304,'2021-09-29','OAK','SEA',NULL,NULL,'MLB','RS'),(6305,'2021-09-30','MIL','STL',NULL,NULL,'MLB','RS'),(6306,'2021-09-30','LAA','TEX',NULL,NULL,'MLB','RS'),(6307,'2021-09-30','CHC','PIT',NULL,NULL,'MLB','RS'),(6308,'2021-09-30','BOS','BAL',NULL,NULL,'MLB','RS'),(6309,'2021-09-30','NYY','TOR',NULL,NULL,'MLB','RS'),(6310,'2021-09-30','TBR','HOU',NULL,NULL,'MLB','RS'),(6311,'2021-09-30','MIA','NYM',NULL,NULL,'MLB','RS'),(6312,'2021-09-30','PHI','ATL',NULL,NULL,'MLB','RS'),(6313,'2021-09-30','DET','MIN',NULL,NULL,'MLB','RS'),(6314,'2021-09-30','CLE','KCR',NULL,NULL,'MLB','RS'),(6315,'2021-09-30','ARI','SFG',NULL,NULL,'MLB','RS'),(6316,'2021-09-30','SDP','LAD',NULL,NULL,'MLB','RS'),(6317,'2021-10-01','CIN','PIT',NULL,NULL,'MLB','RS'),(6318,'2021-10-01','TBR','NYY',NULL,NULL,'MLB','RS'),(6319,'2021-10-01','BOS','WSN',NULL,NULL,'MLB','RS'),(6320,'2021-10-01','BAL','TOR',NULL,NULL,'MLB','RS'),(6321,'2021-10-01','PHI','MIA',NULL,NULL,'MLB','RS'),(6322,'2021-10-01','NYM','ATL',NULL,NULL,'MLB','RS'),(6323,'2021-10-01','CLE','TEX',NULL,NULL,'MLB','RS'),(6324,'2021-10-01','DET','CHW',NULL,NULL,'MLB','RS'),(6325,'2021-10-01','OAK','HOU',NULL,NULL,'MLB','RS'),(6326,'2021-10-01','MIN','KCR',NULL,NULL,'MLB','RS'),(6327,'2021-10-01','CHC','STL',NULL,NULL,'MLB','RS'),(6328,'2021-10-01','COL','ARI',NULL,NULL,'MLB','RS'),(6329,'2021-10-01','SDP','SFG',NULL,NULL,'MLB','RS'),(6330,'2021-10-01','MIL','LAD',NULL,NULL,'MLB','RS'),(6331,'2021-10-01','LAA','SEA',NULL,NULL,'MLB','RS'),(6332,'2021-10-02','TBR','NYY',NULL,NULL,'MLB','RS'),(6333,'2021-10-02','BAL','TOR',NULL,NULL,'MLB','RS'),(6334,'2021-10-02','SDP','SFG',NULL,NULL,'MLB','RS'),(6335,'2021-10-02','BOS','WSN',NULL,NULL,'MLB','RS'),(6336,'2021-10-02','PHI','MIA',NULL,NULL,'MLB','RS'),(6337,'2021-10-02','CIN','PIT',NULL,NULL,'MLB','RS'),(6338,'2021-10-02','CLE','TEX',NULL,NULL,'MLB','RS'),(6339,'2021-10-02','DET','CHW',NULL,NULL,'MLB','RS'),(6340,'2021-10-02','OAK','HOU',NULL,NULL,'MLB','RS'),(6341,'2021-10-02','MIN','KCR',NULL,NULL,'MLB','RS'),(6342,'2021-10-02','CHC','STL',NULL,NULL,'MLB','RS'),(6343,'2021-10-02','NYM','ATL',NULL,NULL,'MLB','RS'),(6344,'2021-10-02','COL','ARI',NULL,NULL,'MLB','RS'),(6345,'2021-10-02','MIL','LAD',NULL,NULL,'MLB','RS'),(6346,'2021-10-02','LAA','SEA',NULL,NULL,'MLB','RS'),(6347,'2021-10-03','TBR','NYY',NULL,NULL,'MLB','RS'),(6348,'2021-10-03','CIN','PIT',NULL,NULL,'MLB','RS'),(6349,'2021-10-03','SDP','SFG',NULL,NULL,'MLB','RS'),(6350,'2021-10-03','CLE','TEX',NULL,NULL,'MLB','RS'),(6351,'2021-10-03','BOS','WSN',NULL,NULL,'MLB','RS'),(6352,'2021-10-03','BAL','TOR',NULL,NULL,'MLB','RS'),(6353,'2021-10-03','COL','ARI',NULL,NULL,'MLB','RS'),(6354,'2021-10-03','DET','CHW',NULL,NULL,'MLB','RS'),(6355,'2021-10-03','OAK','HOU',NULL,NULL,'MLB','RS'),(6356,'2021-10-03','MIN','KCR',NULL,NULL,'MLB','RS'),(6357,'2021-10-03','MIL','LAD',NULL,NULL,'MLB','RS'),(6358,'2021-10-03','PHI','MIA',NULL,NULL,'MLB','RS'),(6359,'2021-10-03','LAA','SEA',NULL,NULL,'MLB','RS'),(6360,'2021-10-03','CHC','STL',NULL,NULL,'MLB','RS'),(6361,'2021-10-03','NYM','ATL',NULL,NULL,'MLB','RS'),(6362,'2021-09-09','DAL','TAM',NULL,NULL,'NFL','RS'),(6363,'2021-09-12','PIT','BUF',NULL,NULL,'NFL','RS'),(6364,'2021-09-12','NYJ','CAR',NULL,NULL,'NFL','RS'),(6365,'2021-09-12','JAX','HOU',NULL,NULL,'NFL','RS'),(6366,'2021-09-12','ARI','TEN',NULL,NULL,'NFL','RS'),(6367,'2021-09-12','LAC','WAS',NULL,NULL,'NFL','RS'),(6368,'2021-09-12','PHI','ATL',NULL,NULL,'NFL','RS'),(6369,'2021-09-12','MIN','CIN',NULL,NULL,'NFL','RS'),(6370,'2021-09-12','SFO','DET',NULL,NULL,'NFL','RS'),(6371,'2021-09-12','SEA','IND',NULL,NULL,'NFL','RS'),(6372,'2021-09-12','MIA','NWE',NULL,NULL,'NFL','RS'),(6373,'2021-09-12','CLE','KAN',NULL,NULL,'NFL','RS'),(6374,'2021-09-12','GNB','NOR',NULL,NULL,'NFL','RS'),(6375,'2021-09-12','DEN','NYG',NULL,NULL,'NFL','RS'),(6376,'2021-09-12','CHI','LAR',NULL,NULL,'NFL','RS'),(6377,'2021-09-13','BAL','LVG',NULL,NULL,'NFL','RS');
/*!40000 ALTER TABLE `games` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teams`
--

DROP TABLE IF EXISTS `teams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teams` (
  `id` int NOT NULL AUTO_INCREMENT,
  `league` varchar(3) NOT NULL,
  `city` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `code` varchar(3) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=124 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teams`
--

LOCK TABLES `teams` WRITE;
/*!40000 ALTER TABLE `teams` DISABLE KEYS */;
INSERT INTO `teams` VALUES (1,'MLB','Milwaukee','Brewers','MIL'),(2,'MLB','Minnesota','Twins','MIN'),(3,'MLB','Arizona','D\'backs','ARI'),(4,'MLB','Atlanta','Braves','ATL'),(5,'MLB','Baltimore','Orioles','BAL'),(6,'MLB','Boston','Red Sox','BOS'),(7,'MLB','Chicago','Cubs','CHC'),(8,'MLB','Chicago','White Sox','CHW'),(9,'MLB','Cincinnati','Reds','CIN'),(10,'MLB','Cleveland','Indians','CLE'),(11,'MLB','Colorado','Rockies','COL'),(12,'MLB','Detroit','Tigers','DET'),(13,'MLB','Houston','Astros','HOU'),(14,'MLB','Kansas City','Royals','KCR'),(15,'MLB','Los Angeles','Angels','LAA'),(16,'MLB','Los Angeles','Dodgers','LAD'),(17,'MLB','Miami','Marlins','MIA'),(18,'MLB','New York','Mets','NYM'),(19,'MLB','New York','Yankees','NYY'),(20,'MLB','Oakland','A\'s','OAK'),(21,'MLB','Philadelphia','Phillies','PHI'),(22,'MLB','Pittsburgh','Pirates','PIT'),(23,'MLB','San Diego','Padres','SDP'),(24,'MLB','San Francisco','Giants','SFG'),(25,'MLB','Seattle','Mariners','SEA'),(26,'MLB','St. Louis','Cardinals','STL'),(27,'MLB','Tampa Bay','Rays','TBR'),(28,'MLB','Texas','Rangers','TEX'),(29,'MLB','Toronto','Blue Jays','TOR'),(30,'MLB','Washington','Nationals','WSN'),(31,'NFL','Arizona','Cardinals','ARI'),(32,'NFL','Atlanta','Falcons','ATL'),(33,'NFL','Baltimore','Ravens','BAL'),(34,'NFL','Buffalo','Bills','BUF'),(35,'NFL','Carolina','Panthers','CAR'),(36,'NFL','Chicago','Bears','CHI'),(37,'NFL','Cincinnati','Bengals','CIN'),(38,'NFL','Cleveland','Browns','CLE'),(39,'NFL','Dallas','Cowboys','DAL'),(40,'NFL','Denver','Broncos','DEN'),(41,'NFL','Detroit','Lions','DET'),(42,'NFL','Green Bay','Packers','GNB'),(43,'NFL','Houston','Texans','HOU'),(44,'NFL','Indianapolis','Colts','IND'),(45,'NFL','Jacksonville','Jaguars','JAX'),(46,'NFL','Kansas City','Chiefs','KAN'),(47,'NFL','Los Angeles','Chargers','LAC'),(48,'NFL','Los Angeles','Rams','LAR'),(49,'NFL','Miami','Dolphins','MIA'),(50,'NFL','Minnesota','Vikings','MIN'),(51,'NFL','New Orleans','Saints','NOR'),(52,'NFL','New England','Patriots','NWE'),(53,'NFL','New York','Giants','NYG'),(54,'NFL','New York','Jets','NYJ'),(55,'NFL','Las Vegas','Raiders','LVG'),(56,'NFL','Philadelphia','Eagles','PHI'),(57,'NFL','Pittsburgh','Steelers','PIT'),(58,'NFL','Seattle','Seahawks','SEA'),(59,'NFL','San Francisco','49ers','SFO'),(60,'NFL','Tampa Bay','Buccaneers','TAM'),(61,'NFL','Tennessee','Titans','TEN'),(62,'NFL','Washington','Footbal Team','WAS'),(63,'NHL','Anaheim','Ducks','ANA'),(64,'NHL','Arizona','Coyotes','ARI'),(65,'NHL','Boston','Bruins','BOS'),(66,'NHL','Buffalo','Sabres','BUF'),(67,'NHL','Calgary','Flames','CGY'),(68,'NHL','Carolina','Hurricanes','CAR'),(69,'NHL','Chicago','Blackhawks','CHI'),(70,'NHL','Colorado','Avalanche','COL'),(71,'NHL','Columbus','Blue Jackets','CBJ'),(72,'NHL','Dallas','Stars','DAL'),(73,'NHL','Detroit','Red Wings','DET'),(74,'NHL','Edmonton','Oilers','EDM'),(75,'NHL','Florida','Panthers','FLA'),(76,'NHL','Los Angeles','Kings','LAK'),(77,'NHL','Minnesota','Wild','MIN'),(78,'NHL','Montreal','Canadiens','MTL'),(79,'NHL','Nashville','Predators','NSH'),(80,'NHL','New Jersey','Devils','NJD'),(81,'NHL','New York','Islanders','NYI'),(82,'NHL','New York','Rangers','NYR'),(83,'NHL','Ottawa','Senators','OTT'),(84,'NHL','Philadelphia','Flyers','PHI'),(85,'NHL','Pittsburgh','Penguins','PIT'),(86,'NHL','San Jose','Sharks','SJS'),(87,'NHL','St. Louis','Blues','STL'),(88,'NHL','Tampa Bay','Lightning','TBL'),(89,'NHL','Toronto','Maple Leafs','TOR'),(90,'NHL','Vancouver','Canucks','VAN'),(91,'NHL','Vegas','Golden Knights','VEG'),(92,'NHL','Washington','Capitals','WSH'),(93,'NHL','Winnipeg','Jets','WPG'),(94,'NBA','Atlanta','Hawks','ATL'),(95,'NBA','Boston','Celtics','BOS'),(96,'NBA','Brooklyn','Nets','BRK'),(97,'NBA','Charlotte','Hornets','CHO'),(98,'NBA','Chicago','Bulls','CHI'),(99,'NBA','Cleveland','Cavaliers','CLE'),(100,'NBA','Dallas','Mavericks','DAL'),(101,'NBA','Denver','Nuggets','DEN'),(102,'NBA','Detroit','Pistons','DET'),(103,'NBA','Golden State','Warriors','GSW'),(104,'NBA','Houston','Rockets','HOU'),(105,'NBA','Indiana','Pacers','IND'),(106,'NBA','Los Angeles','Clippers','LAC'),(107,'NBA','Los Angeles','Lakers','LAL'),(108,'NBA','Memphis','Grizzlies','MEM'),(109,'NBA','Miami','Heat','MIA'),(110,'NBA','Milwaukee','Bucks','MIL'),(111,'NBA','Minnesota','Timberwolves','MIN'),(112,'NBA','New Orleans','Pelicans','NOP'),(113,'NBA','New York','Knicks','NYK'),(114,'NBA','Oklahoma City','Thunder','OKC'),(115,'NBA','Orlando','Magic','ORL'),(116,'NBA','Philadelphia','76ers','PHI'),(117,'NBA','Phoenix','Suns','PHO'),(118,'NBA','Portland','Trail Blazers','POR'),(119,'NBA','Sacramento','Kings','SAC'),(120,'NBA','San Antonio','Spurs','SAS'),(121,'NBA','Toronto','Raptors','TOR'),(122,'NBA','Utah','Jazz','UTA'),(123,'NBA','Washington','Wizards','WAS');
/*!40000 ALTER TABLE `teams` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `terms`
--

DROP TABLE IF EXISTS `terms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `terms` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `code` varchar(10) DEFAULT NULL,
  `type` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `terms`
--

LOCK TABLES `terms` WRITE;
/*!40000 ALTER TABLE `terms` DISABLE KEYS */;
INSERT INTO `terms` VALUES (1,'Major League Baseball','MLB','league'),(2,'National Footbal League','NFL','league'),(3,'National Basketball Association','NBA','league'),(4,'National Hockey League','NHL','league'),(5,'Regular Season','RS','game'),(6,'Playoffs','PO','game'),(7,'Preseason (Exhibition)','EX','game'),(8,'test','--','game'),(9,'Coronavirus','CV','game'),(10,'Dow Jones','DJI','index'),(11,'Russell 2000','RUT','index'),(12,'Nasdaq','IXIC','index'),(13,'S&P 500','GSPC ','index'),(14,'Gold','GC','metal'),(15,'Silver','SI','metal'),(16,'Platinum','PL','metal');
/*!40000 ALTER TABLE `terms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `traffic`
--

DROP TABLE IF EXISTS `traffic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `traffic` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `IP` varchar(30) NOT NULL,
  `theTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `referer` varchar(400) DEFAULT NULL,
  `URL` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1907 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `traffic`
--

LOCK TABLES `traffic` WRITE;
/*!40000 ALTER TABLE `traffic` DISABLE KEYS */;
INSERT INTO `traffic` VALUES (1875,'46.19.86.50','2021-09-01 12:35:06','','/'),(1876,'188.64.207.51','2021-09-08 18:35:23','','/'),(1877,'188.64.207.51','2021-09-08 18:38:41','','/'),(1878,'188.64.207.51','2021-09-08 18:54:53','','/'),(1879,'143.110.246.177','2021-09-08 19:24:33','','/'),(1880,'188.64.207.51','2021-09-08 20:34:39','','/'),(1881,'188.64.207.51','2021-09-08 20:55:48','','/'),(1882,'188.64.207.51','2021-09-08 20:55:59','','/'),(1883,'188.64.207.51','2021-09-08 21:00:19','','/'),(1884,'188.64.207.51','2021-09-08 21:00:47','','/'),(1885,'23.95.204.148','2021-09-08 21:30:55','','/'),(1886,'188.64.207.51','2021-09-08 21:33:49','','/'),(1887,'47.90.219.244','2021-09-08 22:34:05','','/'),(1888,'62.210.202.242','2021-09-08 23:17:42','','/'),(1889,'62.210.202.242','2021-09-08 23:17:42','','/'),(1890,'62.210.202.242','2021-09-08 23:17:43','','/'),(1891,'54.202.33.120','2021-09-09 00:50:03','','/'),(1892,'54.202.33.120','2021-09-09 00:50:03','','/'),(1893,'54.202.33.120','2021-09-09 00:50:03','','/'),(1894,'93.158.90.143','2021-09-09 01:01:47','','/'),(1895,'5.189.168.206','2021-09-09 01:01:51','','/'),(1896,'183.136.225.14','2021-09-09 01:19:35','','/'),(1897,'188.64.207.195','2021-09-09 02:58:45','','/'),(1898,'188.64.207.195','2021-09-09 02:58:49','','/'),(1899,'188.64.207.195','2021-09-09 03:00:23','','/'),(1900,'188.64.207.195','2021-09-09 03:00:26','','/'),(1901,'185.231.182.152','2021-09-09 03:11:10','http://google.com/','/'),(1902,'185.231.182.152','2021-09-09 03:13:15','http://google.com/','/'),(1903,'45.146.164.110','2021-09-09 04:11:48','','/'),(1904,'52.175.232.173','2021-09-09 04:57:43','','/'),(1905,'52.175.232.173','2021-09-09 04:57:43','','/'),(1906,'52.175.232.173','2021-09-09 04:57:43','','/');
/*!40000 ALTER TABLE `traffic` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-09-09  5:06:01
