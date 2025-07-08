-- MySQL dump 10.13  Distrib 8.0.42, for Linux (x86_64)
--
-- Host: localhost    Database: resto
-- ------------------------------------------------------
-- Server version	8.0.42-0ubuntu0.24.04.1

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
-- Current Database: `resto`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `resto` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `resto`;

--
-- Table structure for table `COMMANDE`
--

DROP TABLE IF EXISTS `COMMANDE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `COMMANDE` (
  `id_commande` int NOT NULL,
  `date_heure` datetime DEFAULT NULL,
  `type` enum('sur_place','à_emporter','livraison') DEFAULT NULL,
  `id_client` int DEFAULT NULL,
  `id_serveur` int DEFAULT NULL,
  `num_table` int DEFAULT NULL,
  PRIMARY KEY (`id_commande`),
  KEY `id_client` (`id_client`),
  KEY `id_serveur` (`id_serveur`),
  KEY `num_table` (`num_table`),
  CONSTRAINT `COMMANDE_ibfk_1` FOREIGN KEY (`id_client`) REFERENCES `client` (`id_client`),
  CONSTRAINT `COMMANDE_ibfk_2` FOREIGN KEY (`id_serveur`) REFERENCES `EMPLOYE` (`id_employe`),
  CONSTRAINT `COMMANDE_ibfk_3` FOREIGN KEY (`num_table`) REFERENCES `TABLE_RESTO` (`num_table`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `COMMANDE`
--

LOCK TABLES `COMMANDE` WRITE;
/*!40000 ALTER TABLE `COMMANDE` DISABLE KEYS */;
INSERT INTO `COMMANDE` VALUES (1,'2025-06-02 14:42:09','sur_place',1,1,1);
/*!40000 ALTER TABLE `COMMANDE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EMPLOYE`
--

DROP TABLE IF EXISTS `EMPLOYE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `EMPLOYE` (
  `id_employe` int NOT NULL,
  `nom` varchar(50) DEFAULT NULL,
  `prenom` varchar(50) DEFAULT NULL,
  `telephone` varchar(20) DEFAULT NULL,
  `adresse` varchar(100) DEFAULT NULL,
  `poste` varchar(30) DEFAULT NULL,
  `salaire` decimal(10,2) DEFAULT NULL,
  `date_embauche` date DEFAULT NULL,
  PRIMARY KEY (`id_employe`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EMPLOYE`
--

LOCK TABLES `EMPLOYE` WRITE;
/*!40000 ALTER TABLE `EMPLOYE` DISABLE KEYS */;
INSERT INTO `EMPLOYE` VALUES (1,'Diarra','Amina','612345678','Abeché - Kargo','serveur',100000.00,'2024-01-01'),(2,'oumar','chabaka','62965533','Abeché - Darassalam','directeur',200000.00,'2025-01-01'),(3,'taha','chabaka','60025737','Abeché - Bitéha','vendeur',200000.00,'2023-08-21'),(4,'Traoré','Fatoumata','615432109','Moundou - Centre','serveur',95000.00,'2024-03-15'),(5,'Kone','Abdoulaye','622789456','Bongor - Kouno','vendeur',110000.00,'2023-12-01'),(6,'Sissoko','Moussa','618765432','Doba - Dombao','directeur',210000.00,'2025-02-01');
/*!40000 ALTER TABLE `EMPLOYE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FACTURE`
--

DROP TABLE IF EXISTS `FACTURE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FACTURE` (
  `id_facture` int NOT NULL,
  `date` date DEFAULT NULL,
  `montant_ht` decimal(10,2) DEFAULT NULL,
  `taxes` decimal(10,2) DEFAULT NULL,
  `montant_ttc` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id_facture`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FACTURE`
--

LOCK TABLES `FACTURE` WRITE;
/*!40000 ALTER TABLE `FACTURE` DISABLE KEYS */;
INSERT INTO `FACTURE` VALUES (1,'2025-05-01',7000.00,1260.00,8260.00),(2,'2025-05-05',4500.00,810.00,5310.00),(3,'2025-05-10',12000.00,2160.00,14160.00),(4,'2025-05-15',3000.00,540.00,3540.00),(5,'2025-05-20',8200.00,1476.00,9676.00),(6,'2025-05-25',1500.00,270.00,1770.00);
/*!40000 ALTER TABLE `FACTURE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FOURNISSEUR`
--

DROP TABLE IF EXISTS `FOURNISSEUR`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FOURNISSEUR` (
  `id_fournisseur` int NOT NULL,
  `nom` varchar(50) DEFAULT NULL,
  `contact` varchar(50) DEFAULT NULL,
  `specialite` varchar(50) DEFAULT NULL,
  `conditions_paiement` text,
  PRIMARY KEY (`id_fournisseur`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FOURNISSEUR`
--

LOCK TABLES `FOURNISSEUR` WRITE;
/*!40000 ALTER TABLE `FOURNISSEUR` DISABLE KEYS */;
INSERT INTO `FOURNISSEUR` VALUES (2,'Fruits Exquis','633333333','Fruits','Paiement sous 24h'),(3,'Boucherie Fine','644444444','Viandes','Paiement sous 48h'),(4,'Poissonnerie Océan','655555555','Poissons','Paiement à la réception'),(5,'Épicerie Fine','666666666','Épices','Paiement sous 7 jours');
/*!40000 ALTER TABLE `FOURNISSEUR` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `INGREDIENT`
--

DROP TABLE IF EXISTS `INGREDIENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `INGREDIENT` (
  `id_ingredient` int NOT NULL,
  `nom` varchar(50) DEFAULT NULL,
  `unite` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id_ingredient`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `INGREDIENT`
--

LOCK TABLES `INGREDIENT` WRITE;
/*!40000 ALTER TABLE `INGREDIENT` DISABLE KEYS */;
/*!40000 ALTER TABLE `INGREDIENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TABLE_RESTO`
--

DROP TABLE IF EXISTS `TABLE_RESTO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `TABLE_RESTO` (
  `num_table` int NOT NULL,
  `capacite` int DEFAULT NULL,
  `zone` varchar(30) DEFAULT NULL,
  `etat` enum('libre','occupée','réservée') DEFAULT NULL,
  PRIMARY KEY (`num_table`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TABLE_RESTO`
--

LOCK TABLES `TABLE_RESTO` WRITE;
/*!40000 ALTER TABLE `TABLE_RESTO` DISABLE KEYS */;
INSERT INTO `TABLE_RESTO` VALUES (1,4,'Zone A','libre'),(2,4,'Zone A','libre'),(3,4,'Zone A','libre'),(4,4,'Zone A','libre'),(11,14,'Zone B','libre'),(21,4,'Zone A','libre'),(31,14,'Zone B','occupée');
/*!40000 ALTER TABLE `TABLE_RESTO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client`
--

DROP TABLE IF EXISTS `client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `client` (
  `id_client` int NOT NULL,
  `nom` varchar(100) DEFAULT NULL,
  `telephone` varchar(200) DEFAULT NULL,
  `adresse` varchar(100) DEFAULT NULL,
  `preferences` text,
  PRIMARY KEY (`id_client`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client`
--

LOCK TABLES `client` WRITE;
/*!40000 ALTER TABLE `client` DISABLE KEYS */;
INSERT INTO `client` VALUES (1,'Mahamat','620000000','Abeché - Sabangali','Plat végétarien'),(2,'abakar','62056656','Abeché - Bitéha','Riz au gras'),(3,'Moussa','62044433','Abeché - Koundoul','Haricot'),(4,'Fatime','620111222','Abeché - Darassalam','Poisson grillé'),(5,'Zakaria','620333444','Abeché - Madina','Poulet braisé'),(6,'Halima','620555666','Abeché - Habena','Tô à la sauce arachide'),(7,'Idriss','620777888','Abeché - Abena','Salade verte'),(8,'Amina','620999000','Abeché - Kargo','Pâte de maïs'),(9,'Hassan','621123456','Abeché - Sabangali','Soupe de légumes'),(10,'Salma','621654321','Abeché - Madina','Ragoût de bœuf');
/*!40000 ALTER TABLE `client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plat`
--

DROP TABLE IF EXISTS `plat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `plat` (
  `id_plat` int NOT NULL,
  `nom` varchar(100) DEFAULT NULL,
  `prix` decimal(10,0) DEFAULT NULL,
  `categorie` varchar(100) DEFAULT NULL,
  `description` text,
  `temps_preparation` time DEFAULT NULL,
  PRIMARY KEY (`id_plat`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plat`
--

LOCK TABLES `plat` WRITE;
/*!40000 ALTER TABLE `plat` DISABLE KEYS */;
INSERT INTO `plat` VALUES (1,'Poulet DG',3500,'plat principal','Poulet braisé et légumes','00:30:00'),(2,'jeu',3000,'catégorie 2','jeu banane','00:25:00'),(4,'maccroni',2500,'catégorie','Description ici','00:20:00'),(6,'paix',3000,'catégorie','paix pondre','00:25:00'),(8,'haricot',2800,'plat principal','haricot blanc sucree','00:30:00'),(9,'riz',2200,'entrée','riz jaune','00:15:00');
/*!40000 ALTER TABLE `plat` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-07-08  8:31:21
