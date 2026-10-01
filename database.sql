-- MySQL dump 10.13  Distrib 8.0.46, for Win64 (x86_64)
--
-- Host: localhost    Database: pm_db
-- ------------------------------------------------------
-- Server version	8.0.46

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add project',7,'add_project'),(26,'Can change project',7,'change_project'),(27,'Can delete project',7,'delete_project'),(28,'Can view project',7,'view_project'),(29,'Can add milestone',8,'add_milestone'),(30,'Can change milestone',8,'change_milestone'),(31,'Can delete milestone',8,'delete_milestone'),(32,'Can view milestone',8,'view_milestone'),(33,'Can add project activity',9,'add_projectactivity'),(34,'Can change project activity',9,'change_projectactivity'),(35,'Can delete project activity',9,'delete_projectactivity'),(36,'Can view project activity',9,'view_projectactivity'),(37,'Can add project file',10,'add_projectfile'),(38,'Can change project file',10,'change_projectfile'),(39,'Can delete project file',10,'delete_projectfile'),(40,'Can view project file',10,'view_projectfile'),(41,'Can add project invitation',11,'add_projectinvitation'),(42,'Can change project invitation',11,'change_projectinvitation'),(43,'Can delete project invitation',11,'delete_projectinvitation'),(44,'Can view project invitation',11,'view_projectinvitation'),(45,'Can add task',12,'add_task'),(46,'Can change task',12,'change_task'),(47,'Can delete task',12,'delete_task'),(48,'Can view task',12,'view_task'),(49,'Can add task activity',13,'add_taskactivity'),(50,'Can change task activity',13,'change_taskactivity'),(51,'Can delete task activity',13,'delete_taskactivity'),(52,'Can view task activity',13,'view_taskactivity'),(53,'Can add task attachment',14,'add_taskattachment'),(54,'Can change task attachment',14,'change_taskattachment'),(55,'Can delete task attachment',14,'delete_taskattachment'),(56,'Can view task attachment',14,'view_taskattachment'),(57,'Can add task comment',15,'add_taskcomment'),(58,'Can change task comment',15,'change_taskcomment'),(59,'Can delete task comment',15,'delete_taskcomment'),(60,'Can view task comment',15,'view_taskcomment'),(61,'Can add time entry',16,'add_timeentry'),(62,'Can change time entry',16,'change_timeentry'),(63,'Can delete time entry',16,'delete_timeentry'),(64,'Can view time entry',16,'view_timeentry');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$1000000$tx720l59qvJUWjNiE8fvlf$FMpW0Orzuc8CArH33m18lV7ADjpmftV556FNQaqjR0I=','2026-09-27 18:10:16.937041',1,'admin','','','rakshisheety1719@gmail.com',1,1,'2026-09-27 16:59:48.893841'),(2,'pbkdf2_sha256$1000000$V2W6AYZWpBgz6OZXVMyqwk$lzMlhgM/9bx88x82nu/m2ymP3LlNCU8/R8vJcJ9cz7c=',NULL,0,'member1','','','',0,1,'2026-09-27 18:20:07.964195');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2026-09-27 18:20:09.940614','2','member1',1,'[{\"added\": {}}]',4,1),(2,'2026-09-27 18:20:12.872738','1','Student Management System',1,'[{\"added\": {}}]',7,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(8,'projects','milestone'),(7,'projects','project'),(9,'projects','projectactivity'),(10,'projects','projectfile'),(11,'projects','projectinvitation'),(12,'projects','task'),(13,'projects','taskactivity'),(14,'projects','taskattachment'),(15,'projects','taskcomment'),(16,'projects','timeentry'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2026-09-27 16:57:04.981916'),(2,'auth','0001_initial','2026-09-27 16:57:05.420637'),(3,'admin','0001_initial','2026-09-27 16:57:05.523419'),(4,'admin','0002_logentry_remove_auto_add','2026-09-27 16:57:05.530743'),(5,'admin','0003_logentry_add_action_flag_choices','2026-09-27 16:57:05.540170'),(6,'contenttypes','0002_remove_content_type_name','2026-09-27 16:57:05.629529'),(7,'auth','0002_alter_permission_name_max_length','2026-09-27 16:57:05.680654'),(8,'auth','0003_alter_user_email_max_length','2026-09-27 16:57:05.703664'),(9,'auth','0004_alter_user_username_opts','2026-09-27 16:57:05.714107'),(10,'auth','0005_alter_user_last_login_null','2026-09-27 16:57:05.761664'),(11,'auth','0006_require_contenttypes_0002','2026-09-27 16:57:05.763704'),(12,'auth','0007_alter_validators_add_error_messages','2026-09-27 16:57:05.771516'),(13,'auth','0008_alter_user_username_max_length','2026-09-27 16:57:05.958013'),(14,'auth','0009_alter_user_last_name_max_length','2026-09-27 16:57:06.020956'),(15,'auth','0010_alter_group_name_max_length','2026-09-27 16:57:06.038909'),(16,'auth','0011_update_proxy_permissions','2026-09-27 16:57:06.050824'),(17,'auth','0012_alter_user_first_name_max_length','2026-09-27 16:57:06.107186'),(18,'projects','0001_initial','2026-09-27 16:57:07.124250'),(19,'sessions','0001_initial','2026-09-27 16:57:07.159217');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('wlopqslx77ak9psitigsoyaj8m992d76','.eJxVjMEOwiAQRP-FsyG7FJF69N5vIAssUjWQlPZk_Hdp0oMe582beQtH25rd1nhxcxRXgeL0yzyFJ5e9iA8q9ypDLesye7kr8mibnGrk1-1w_w4ytdzXGjQMNgKpCNpAUvaMYOFikkY04L1NCdQ4EiRmxoGYe_Dgg8KOUHy-tHM3fA:1xAtKK:MlslxwaX0SM0bjufszufXB2nYpG2VbBzfy5Lmf1Ia18','2026-10-11 18:10:16.942324');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projects_milestone`
--

DROP TABLE IF EXISTS `projects_milestone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `projects_milestone` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `description` longtext NOT NULL,
  `due_date` date NOT NULL,
  `is_completed` tinyint(1) NOT NULL,
  `completed_at` datetime(6) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `project_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `projects_milestone_project_id_eb7f7808_fk_projects_project_id` (`project_id`),
  CONSTRAINT `projects_milestone_project_id_eb7f7808_fk_projects_project_id` FOREIGN KEY (`project_id`) REFERENCES `projects_project` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projects_milestone`
--

LOCK TABLES `projects_milestone` WRITE;
/*!40000 ALTER TABLE `projects_milestone` DISABLE KEYS */;
/*!40000 ALTER TABLE `projects_milestone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projects_project`
--

DROP TABLE IF EXISTS `projects_project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `projects_project` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `description` longtext NOT NULL,
  `status` varchar(20) NOT NULL,
  `priority` varchar(20) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `budget` decimal(12,2) NOT NULL,
  `progress` int NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `created_by_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `projects_project_created_by_id_c49d7b6d_fk_auth_user_id` (`created_by_id`),
  CONSTRAINT `projects_project_created_by_id_c49d7b6d_fk_auth_user_id` FOREIGN KEY (`created_by_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projects_project`
--

LOCK TABLES `projects_project` WRITE;
/*!40000 ALTER TABLE `projects_project` DISABLE KEYS */;
INSERT INTO `projects_project` VALUES (1,'Student Management System','A project management system for managing student-related tasks and activities','in_progress','high','2026-09-28','2026-09-29',5000.00,20,'2026-09-27 18:20:12.850755','2026-09-27 18:20:12.850811',1);
/*!40000 ALTER TABLE `projects_project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projects_project_team_members`
--

DROP TABLE IF EXISTS `projects_project_team_members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `projects_project_team_members` (
  `id` int NOT NULL AUTO_INCREMENT,
  `project_id` bigint NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `projects_project_team_members_project_id_user_id_f6a4eca1_uniq` (`project_id`,`user_id`),
  KEY `projects_project_team_members_user_id_0f043fba_fk_auth_user_id` (`user_id`),
  CONSTRAINT `projects_project_tea_project_id_b258644c_fk_projects_` FOREIGN KEY (`project_id`) REFERENCES `projects_project` (`id`),
  CONSTRAINT `projects_project_team_members_user_id_0f043fba_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projects_project_team_members`
--

LOCK TABLES `projects_project_team_members` WRITE;
/*!40000 ALTER TABLE `projects_project_team_members` DISABLE KEYS */;
INSERT INTO `projects_project_team_members` VALUES (1,1,1),(2,1,2);
/*!40000 ALTER TABLE `projects_project_team_members` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projects_projectactivity`
--

DROP TABLE IF EXISTS `projects_projectactivity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `projects_projectactivity` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `action` varchar(100) NOT NULL,
  `details` longtext NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `project_id` bigint NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `projects_projectacti_project_id_9e2c6343_fk_projects_` (`project_id`),
  KEY `projects_projectactivity_user_id_1274d412_fk_auth_user_id` (`user_id`),
  CONSTRAINT `projects_projectacti_project_id_9e2c6343_fk_projects_` FOREIGN KEY (`project_id`) REFERENCES `projects_project` (`id`),
  CONSTRAINT `projects_projectactivity_user_id_1274d412_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projects_projectactivity`
--

LOCK TABLES `projects_projectactivity` WRITE;
/*!40000 ALTER TABLE `projects_projectactivity` DISABLE KEYS */;
/*!40000 ALTER TABLE `projects_projectactivity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projects_projectfile`
--

DROP TABLE IF EXISTS `projects_projectfile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `projects_projectfile` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `file` varchar(100) NOT NULL,
  `description` longtext NOT NULL,
  `uploaded_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `project_id` bigint NOT NULL,
  `uploaded_by_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `projects_projectfile_project_id_a623fca3_fk_projects_project_id` (`project_id`),
  KEY `projects_projectfile_uploaded_by_id_ddc70b5c_fk_auth_user_id` (`uploaded_by_id`),
  CONSTRAINT `projects_projectfile_project_id_a623fca3_fk_projects_project_id` FOREIGN KEY (`project_id`) REFERENCES `projects_project` (`id`),
  CONSTRAINT `projects_projectfile_uploaded_by_id_ddc70b5c_fk_auth_user_id` FOREIGN KEY (`uploaded_by_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projects_projectfile`
--

LOCK TABLES `projects_projectfile` WRITE;
/*!40000 ALTER TABLE `projects_projectfile` DISABLE KEYS */;
/*!40000 ALTER TABLE `projects_projectfile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projects_projectinvitation`
--

DROP TABLE IF EXISTS `projects_projectinvitation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `projects_projectinvitation` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `email` varchar(254) NOT NULL,
  `invited_at` datetime(6) NOT NULL,
  `accepted_at` datetime(6) DEFAULT NULL,
  `token` varchar(100) NOT NULL,
  `is_accepted` tinyint(1) NOT NULL,
  `invited_by_id` int NOT NULL,
  `project_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `token` (`token`),
  KEY `projects_projectinvi_invited_by_id_18666dfb_fk_auth_user` (`invited_by_id`),
  KEY `projects_projectinvi_project_id_c5f82e2a_fk_projects_` (`project_id`),
  CONSTRAINT `projects_projectinvi_invited_by_id_18666dfb_fk_auth_user` FOREIGN KEY (`invited_by_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `projects_projectinvi_project_id_c5f82e2a_fk_projects_` FOREIGN KEY (`project_id`) REFERENCES `projects_project` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projects_projectinvitation`
--

LOCK TABLES `projects_projectinvitation` WRITE;
/*!40000 ALTER TABLE `projects_projectinvitation` DISABLE KEYS */;
/*!40000 ALTER TABLE `projects_projectinvitation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projects_task`
--

DROP TABLE IF EXISTS `projects_task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `projects_task` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(200) NOT NULL,
  `description` longtext NOT NULL,
  `status` varchar(20) NOT NULL,
  `priority` varchar(20) NOT NULL,
  `due_date` date NOT NULL,
  `estimated_hours` double NOT NULL,
  `actual_hours` double NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `completed_at` datetime(6) DEFAULT NULL,
  `assigned_to_id` int DEFAULT NULL,
  `created_by_id` int NOT NULL,
  `project_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `projects_task_assigned_to_id_13b0183a_fk_auth_user_id` (`assigned_to_id`),
  KEY `projects_task_created_by_id_3dc419bd_fk_auth_user_id` (`created_by_id`),
  KEY `projects_task_project_id_a1b987d6_fk_projects_project_id` (`project_id`),
  CONSTRAINT `projects_task_assigned_to_id_13b0183a_fk_auth_user_id` FOREIGN KEY (`assigned_to_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `projects_task_created_by_id_3dc419bd_fk_auth_user_id` FOREIGN KEY (`created_by_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `projects_task_project_id_a1b987d6_fk_projects_project_id` FOREIGN KEY (`project_id`) REFERENCES `projects_project` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projects_task`
--

LOCK TABLES `projects_task` WRITE;
/*!40000 ALTER TABLE `projects_task` DISABLE KEYS */;
INSERT INTO `projects_task` VALUES (1,'Design Student Login Page','Create the login page for the student management system','done','high','2026-01-09',10,2,'2026-09-27 18:37:01.813256','2026-09-28 16:32:47.959580',NULL,2,1,1),(2,'Test Login Feature Updated','Test the login functionality of the project management system.','todo','medium','2026-01-10',150,0,'2026-09-28 17:01:44.802408','2026-09-28 17:09:33.462341',NULL,2,1,1),(3,'Student Information Module','A web-based system designed to manage student information, attendance, academic records, and related activities efficiently.','todo','medium','2026-02-08',0,2,'2026-09-29 18:15:01.622870','2026-09-29 18:15:01.622917',NULL,1,1,1);
/*!40000 ALTER TABLE `projects_task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projects_taskactivity`
--

DROP TABLE IF EXISTS `projects_taskactivity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `projects_taskactivity` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `action` varchar(100) NOT NULL,
  `details` longtext NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `task_id` bigint NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `projects_taskactivity_task_id_a034efdb_fk_projects_task_id` (`task_id`),
  KEY `projects_taskactivity_user_id_bd0bb09c_fk_auth_user_id` (`user_id`),
  CONSTRAINT `projects_taskactivity_task_id_a034efdb_fk_projects_task_id` FOREIGN KEY (`task_id`) REFERENCES `projects_task` (`id`),
  CONSTRAINT `projects_taskactivity_user_id_bd0bb09c_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projects_taskactivity`
--

LOCK TABLES `projects_taskactivity` WRITE;
/*!40000 ALTER TABLE `projects_taskactivity` DISABLE KEYS */;
INSERT INTO `projects_taskactivity` VALUES (1,'time logged','Logged 2.0 hours for task \"Design Student Login Page\".','2026-09-29 18:10:38.798077',1,1),(2,'created','Created task \"Student Information Module\".','2026-09-29 18:15:01.632200',3,1),(3,'commented','Added a comment to task \"Student Information Module\".','2026-09-29 18:20:57.005237',3,1),(4,'mentioned','@admin was mentioned in a comment on task \"Student Information Module\".','2026-09-29 18:20:57.019798',3,1),(5,'time logged','Logged 2.0 hours for task \"Student Information Module\".','2026-09-29 18:24:15.353009',3,1);
/*!40000 ALTER TABLE `projects_taskactivity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projects_taskattachment`
--

DROP TABLE IF EXISTS `projects_taskattachment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `projects_taskattachment` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `file` varchar(100) NOT NULL,
  `description` varchar(200) NOT NULL,
  `uploaded_at` datetime(6) NOT NULL,
  `task_id` bigint NOT NULL,
  `uploaded_by_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `projects_taskattachment_task_id_70f581ad_fk_projects_task_id` (`task_id`),
  KEY `projects_taskattachment_uploaded_by_id_57bed9e1_fk_auth_user_id` (`uploaded_by_id`),
  CONSTRAINT `projects_taskattachment_task_id_70f581ad_fk_projects_task_id` FOREIGN KEY (`task_id`) REFERENCES `projects_task` (`id`),
  CONSTRAINT `projects_taskattachment_uploaded_by_id_57bed9e1_fk_auth_user_id` FOREIGN KEY (`uploaded_by_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projects_taskattachment`
--

LOCK TABLES `projects_taskattachment` WRITE;
/*!40000 ALTER TABLE `projects_taskattachment` DISABLE KEYS */;
INSERT INTO `projects_taskattachment` VALUES (1,'task_attachments/workshop_4.jpeg','certificate','2026-09-28 15:20:02.749825',1,1),(2,'task_attachments/aws.jpeg','Test attachment','2026-09-28 17:07:12.177774',2,1);
/*!40000 ALTER TABLE `projects_taskattachment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projects_taskcomment`
--

DROP TABLE IF EXISTS `projects_taskcomment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `projects_taskcomment` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `content` longtext NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `task_id` bigint NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `projects_taskcomment_task_id_3c75a98e_fk_projects_task_id` (`task_id`),
  KEY `projects_taskcomment_user_id_49ad7fc1_fk_auth_user_id` (`user_id`),
  CONSTRAINT `projects_taskcomment_task_id_3c75a98e_fk_projects_task_id` FOREIGN KEY (`task_id`) REFERENCES `projects_task` (`id`),
  CONSTRAINT `projects_taskcomment_user_id_49ad7fc1_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projects_taskcomment`
--

LOCK TABLES `projects_taskcomment` WRITE;
/*!40000 ALTER TABLE `projects_taskcomment` DISABLE KEYS */;
INSERT INTO `projects_taskcomment` VALUES (1,'clear contents and it is high priority and finsh the task early','2026-09-28 15:19:31.272061','2026-09-28 15:19:31.272087',1,1),(2,'Testing task comments functionality.','2026-09-28 17:06:09.714938','2026-09-28 17:06:09.714976',2,1),(3,'@admin Please review this task.','2026-09-29 18:20:56.999429','2026-09-29 18:20:56.999452',3,1);
/*!40000 ALTER TABLE `projects_taskcomment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projects_timeentry`
--

DROP TABLE IF EXISTS `projects_timeentry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `projects_timeentry` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `hours` double NOT NULL,
  `date` date NOT NULL,
  `description` longtext NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `task_id` bigint NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `projects_timeentry_task_id_43bcdef0_fk_projects_task_id` (`task_id`),
  KEY `projects_timeentry_user_id_2f30b103_fk_auth_user_id` (`user_id`),
  CONSTRAINT `projects_timeentry_task_id_43bcdef0_fk_projects_task_id` FOREIGN KEY (`task_id`) REFERENCES `projects_task` (`id`),
  CONSTRAINT `projects_timeentry_user_id_2f30b103_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projects_timeentry`
--

LOCK TABLES `projects_timeentry` WRITE;
/*!40000 ALTER TABLE `projects_timeentry` DISABLE KEYS */;
INSERT INTO `projects_timeentry` VALUES (1,2,'2026-10-28','Worked on the task implementation and testing.','2026-09-29 18:10:38.756730',1,1),(2,2,'2026-09-29','Worked on student information module','2026-09-29 18:24:15.337571',3,1);
/*!40000 ALTER TABLE `projects_timeentry` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-10-01 21:06:23
