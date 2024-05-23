-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: portal
-- ------------------------------------------------------
-- Server version	8.0.36

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
-- Table structure for table `appointment`
--

DROP TABLE IF EXISTS `appointment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `appointment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `teacher_id` int NOT NULL,
  `student_id` int NOT NULL,
  `day` date NOT NULL,
  `hour` time DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `foreign_key_appointment_teacherId` (`teacher_id`),
  KEY `foreign_key_appointment_studentId` (`student_id`),
  CONSTRAINT `foreign_key_appointment_studentId` FOREIGN KEY (`student_id`) REFERENCES `user_obj` (`id`),
  CONSTRAINT `foreign_key_appointment_teacherId` FOREIGN KEY (`teacher_id`) REFERENCES `user_obj` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointment`
--

LOCK TABLES `appointment` WRITE;
/*!40000 ALTER TABLE `appointment` DISABLE KEYS */;
/*!40000 ALTER TABLE `appointment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course`
--

DROP TABLE IF EXISTS `course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `course` (
  `id` int NOT NULL AUTO_INCREMENT,
  `course_name` varchar(255) NOT NULL,
  `description` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course`
--

LOCK TABLES `course` WRITE;
/*!40000 ALTER TABLE `course` DISABLE KEYS */;
INSERT INTO `course` VALUES (1,'CFGS Desarrollo de Aplicaciones Multiplataforma','La competencia general de este título consiste en desarrollar, implantar, documentar y mantener aplicaciones informáticas multiplataforma, utilizando tecnologías y entornos de desarrollo específicos, garantizando el acceso a los datos de forma segura y cumpliendo los criterios de «usabilidad» y calidad exigidas en los estándares establecidos.'),(2,'CFGS Desarrollo de Aplicaciones Web','La competencia general de este título consiste en desarrollar, implantar, y mantener aplicaciones web, con independencia del modelo empleado y utilizando tecnologías específicas, garantizando el acceso a los datos de forma segura y cumpliendo los criterios de accesibilidad, usabilidad y calidad exigidas en los estándares establecidos.'),(3,'CFGM Sistemas Microinformáticos y Redes','La competencia general de este título consiste en instalar, configurar y mantener sistemas microinformáticos, aislados o en red, así como redes locales en pequeños entornos, asegurando su funcionalidad y aplicando los protocolos de calidad, seguridad y respeto al medio ambiente establecidos.'),(4,'CFGS Administración de Sistemas Informáticos en Red','La competencia general de este título consiste en configurar, administrar y mantener sistemas informáticos, garantizando la funcionalidad, la integridad de los recursos y servicios del sistema, con la calidad exigida y cumpliendo la reglamentación vigente.'),(5,'CFGM Instalaciones de Telecomunicaciones','La competencia general de este título consiste en montar y mantener instalaciones de telecomunicaciones y audiovisuales, instalaciones de radiocomunicaciones e instalaciones domóticas, aplicando normativa y reglamentación vigente, protocolos de calidad, seguridad y riesgos laborales, asegurando su funcionalidad y respeto al medio ambiente.'),(6,'CFGS Mantenimiento Electrónico','La competencia general de este título consiste en mantener y reparar equipos y sistemas electrónicos, profesionales, industriales y de consumo, así como planificar y organizar los procesos de mantenimiento, aplicando los planes de prevención de riesgos laborales, medioambientales, criterios de calidad y la normativa vigente..'),(7,'CE Desarrollo de Videojuegos y Realidad Virtual','La competencia general de este curso de especialización consiste en diseñar y desarrollar videojuegos para diferentes dispositivos y plataformas, garantizando la experiencia del usuario, utilizando herramientas de última generación que permitan actuar en todas las fases de su desarrollo, así como aplicaciones interactivas de realidad virtual y aumentada.'),(8,'CE Ciberseguridad en Entornos de las Tecnologías de la Información','La competencia general de este curso de especialización consiste en definir e implementar estrategias de seguridad en los sistemas de información realizando diagnósticos de ciberseguridad, identificando vulnerabilidades e implementando las medidas necesarias para mitigarlas aplicando la normativa vigente y estándares del sector, siguiendo los protocolos de calidad, de prevención de riesgos laborales y respeto ambiental.'),(9,'CE Inteligencia Artificial y Big Data','La competencia general de este curso de especialización consiste en programar y aplicar sistemas inteligentes que optimizan la gestión de la información y la explotación de datos masivos, garantizando el acceso a los datos de forma segura y cumpliendo los criterios de accesibilidad, usabilidad y calidad exigidas en los estándares establecidos, así como los principios éticos y legales.');
/*!40000 ALTER TABLE `course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_subject`
--

DROP TABLE IF EXISTS `course_subject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `course_subject` (
  `course` int NOT NULL,
  `subject` int NOT NULL,
  PRIMARY KEY (`course`,`subject`),
  KEY `subject_idx` (`subject`),
  CONSTRAINT `course` FOREIGN KEY (`course`) REFERENCES `course` (`id`),
  CONSTRAINT `subject` FOREIGN KEY (`subject`) REFERENCES `subject` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_subject`
--

LOCK TABLES `course_subject` WRITE;
/*!40000 ALTER TABLE `course_subject` DISABLE KEYS */;
INSERT INTO `course_subject` VALUES (1,1),(2,1),(1,2),(2,2),(1,3),(2,3),(1,4),(2,4),(3,4),(5,4),(6,4),(1,5),(2,5),(1,6),(2,6),(1,7),(1,8),(1,9),(1,10),(1,11),(1,12),(2,12),(3,12),(4,12),(5,12),(6,12),(1,13),(2,13),(3,13),(4,13),(5,13),(6,13),(1,14),(1,15),(2,15),(4,15),(5,15),(6,15),(2,16),(2,17),(2,18),(2,19),(2,20),(4,21),(4,22),(4,23),(4,24),(4,25),(4,26),(4,27),(4,28),(4,29),(4,30),(4,31),(3,32),(3,33),(3,34),(3,35),(3,36),(3,37),(3,38),(3,39),(3,40),(5,41),(5,42),(5,43),(5,44),(5,45),(5,46),(5,47),(5,48),(6,49),(6,50),(6,51),(6,52),(6,53),(6,54),(6,55),(6,56),(6,57),(6,58),(8,59),(8,60),(8,61),(8,62),(8,63),(8,64),(7,65),(7,66),(7,67),(7,68),(7,69),(9,70),(9,71),(9,72),(9,73),(9,74);
/*!40000 ALTER TABLE `course_subject` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `credentials`
--

DROP TABLE IF EXISTS `credentials`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `credentials` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `pass` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `credentials`
--

LOCK TABLES `credentials` WRITE;
/*!40000 ALTER TABLE `credentials` DISABLE KEYS */;
INSERT INTO `credentials` VALUES (1,'jon@gmail.com','Pas1234'),(2,'Laura@gmail.com','Pas1278'),(3,'Tania@gmail.com','Tas12564'),(4,'Francisco@gmail.com','Tas5678'),(5,'eloy@gmail.com','1234'),(8,'barbara@gmail.com','5678'),(9,'sergio@gmail.com','password'),(10,'antonio@gmail.com','1234'),(11,'hector@gmail.com','QWERTy1234'),(12,'cesur@gmail.com','Malaga1'),(13,'pablopicasso@gmail.com','Malaga1'),(15,'franpepe@gmail.com','Pacopepe'),(16,'FranciscoPerezBelen@gmail.com','123'),(17,'cm@gmail.com','QWERTYUIOP1a'),(18,'pacomers@gmail.com','QWERTYUIOP1a'),(20,'gonzalola@gmail.com','QWERTYUIOp1'),(22,'pacodelatorre@gmail.com','QWERTYUIOp1'),(23,'pepemolina@gmail.com','QWERTYUIOp1'),(25,'sergiosanchez1@gmail.com','Sergiosanchez99');
/*!40000 ALTER TABLE `credentials` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `school`
--

DROP TABLE IF EXISTS `school`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `school` (
  `id` int NOT NULL AUTO_INCREMENT,
  `school_name` varchar(100) NOT NULL,
  `tel` char(12) NOT NULL,
  `email` varchar(255) NOT NULL,
  `secretarySchedule` varchar(40) NOT NULL,
  `loc` varchar(50) NOT NULL,
  `image` varchar(255) NOT NULL,
  `mapLink` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `school`
--

LOCK TABLES `school` WRITE;
/*!40000 ALTER TABLE `school` DISABLE KEYS */;
INSERT INTO `school` VALUES (1,'Cesur Málaga Este','+34952598720','info@cesurformacion.com','08:00-14:00','Málaga','./images/logos/LOGOTIPO-CESUR.png','1d10757.374130614628!2d-4.372041717464043!3d36.71808277803187!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0xd7259120bfc4db3%3A0xec0ecedd8dc61902!2sCESUR%20M%C3%A1laga%20Este%20Formaci%C3%B3n%20Profesional!5e0!3m2!1ses!2ses!4v1715334512514'),(2,'IES Pablo Picasso','+34951298666','info@fpiespablopicasso.es','8:30-14:30','Málaga','./images/logos/LOGOTIPO-IES-PABLO-PICASSO.png','1d6395.717928363966!2d-4.455162806420868!3d36.725948300000006!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0xd72f70c3d574e37%3A0x67343146876c734b!2sIES%20Pablo%20Picasso!5e0!3m2!1ses!2ses!4v1715335018709'),(3,'IES Belén','+34951298425','29010201.edu@juntadeandalucia.es','08:15-14:45','Málaga','./images/logos/LOGOTIPO-IES-BELEN.png','1d3199.124902411609!2d-4.459761523439527!3d36.69553637227712!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0xd72f9dee2ea3131%3A0xe00a7d745fb8b2e3!2sIES%20Bel%C3%A9n!5e0!3m2!1ses!2ses!4v1715335056310'),(4,'CPIFP Alan Turing','+34951040449','29020231.info@g.educaand.es','09:00-14:00','Málaga','./images/logos/LOGOTIPO-ALAN-TURING.png','1d3197.2394272377824!2d-4.554430616275409!3d36.740823696739334!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0xd72f10963ce0f3d%3A0x310ae7d4bb2e8f7b!2sCPIFP%20Alan%20Turing!5e0!3m2!1ses!2ses!4v1715335096355'),(5,'IES San José','+34952305100','sanjose@fundacionloyola.es','09:00-13:00','Málaga','./images/logos/LOGOTIPO-IES-SAN-JOSE.png','1d60854.997797710945!2d-4.459410649332534!3d36.715431468654785!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0xd72f711c56e8bed%3A0x6de2361e88593aeb!2sColegio%20Diocesano%20San%20Jos%C3%A9%20Obrero!5e0!3m2!1ses!2ses!4v1715335137121'),(6,'Accenture','0','0','0','Málaga','./images/logos/LOGOTIPO-ACCENTURE.png','0');
/*!40000 ALTER TABLE `school` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `school_course`
--

DROP TABLE IF EXISTS `school_course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `school_course` (
  `school` int NOT NULL,
  `course` int NOT NULL,
  PRIMARY KEY (`school`,`course`),
  KEY `id_idx` (`course`),
  CONSTRAINT `idCourse` FOREIGN KEY (`course`) REFERENCES `course` (`id`),
  CONSTRAINT `idSchool` FOREIGN KEY (`school`) REFERENCES `school` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `school_course`
--

LOCK TABLES `school_course` WRITE;
/*!40000 ALTER TABLE `school_course` DISABLE KEYS */;
INSERT INTO `school_course` VALUES (1,1),(2,1),(3,1),(4,1),(5,1),(1,2),(3,2),(4,2),(1,3),(2,3),(3,3),(4,3),(1,4),(4,4),(1,5),(4,5),(4,6),(5,6),(4,7),(4,8),(4,9);
/*!40000 ALTER TABLE `school_course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subject`
--

DROP TABLE IF EXISTS `subject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subject` (
  `id` int NOT NULL AUTO_INCREMENT,
  `subject_name` varchar(255) NOT NULL,
  `weekly_hours` int DEFAULT NULL,
  `total_hours` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subject`
--

LOCK TABLES `subject` WRITE;
/*!40000 ALTER TABLE `subject` DISABLE KEYS */;
INSERT INTO `subject` VALUES (1,'Programacion',8,256),(2,'Entornos de Desarrollo',3,96),(3,'Bases de Datos',6,192),(4,'Formacion y Orientacion Laboral',3,96),(5,'Lenguaje de Marcas',4,128),(6,'Sistemas Informaticos',6,192),(7,'Acceso a Datos',5,0),(8,'Desarrollo de Interfaces',7,0),(9,'Programación Multimedia y Dispositivos Móviles',4,0),(10,'Programación de Servicios y Procesos',3,0),(11,'Sistemas de Gestión Empresarial',4,0),(12,'Empresa e Iniciativa Emprendedora',4,0),(13,'Horas de Libre Configuración',3,0),(14,'Proyecto de Desarrollo de Aplicaciones Multiplataforma',0,40),(15,'Formación en Centros de Trabajo',0,370),(16,'Desarrollo Web en Entorno Cliente',6,0),(17,'Desarrollo Web en Entorno Servidor',8,0),(18,'Despliegue de Aplicaciones Web',3,0),(19,'Diseño de Interfaces Web',6,0),(20,'Proyecto de Desarrollo de Aplicaciones Web',0,40),(21,'Implantación de Sistemas Operativos',8,0),(22,'Planificación y Administración de Redes',6,0),(23,'Fundamentos de Hardware',3,0),(24,'Gestión de Bases de Datos',6,0),(25,'Lenguaje de marcas y Sistemas de Gestión de la Información',4,0),(26,'Administración de Sistemas Operativos',6,0),(27,'Servicios de Red e Internet',6,0),(28,'Implantación de Aplicaciones Web',4,0),(29,'Administración de Sistemas Gestores de Bases de Datos',3,0),(30,'Seguridad y Alta Disponibilidad',4,0),(31,'Proyecto de Administración de Sistemas Informáticos en Red',0,40),(32,'Aplicaciones Ofimáticas',8,0),(33,'Montaje y Mantenimiento de Equipos',7,0),(34,'Redes Locales',7,0),(35,'Sistemas Operativos Monopuesto',5,0),(36,'Aplicaciones Web',4,0),(37,'Seguridad Informática',5,0),(38,'Servicios en Red',7,0),(39,'Sistemas Operativos en Red',7,0),(40,'Formación en Centros de Trabajo',0,410),(41,'Infraestructuras Comunes de Telecomunicación en Viviendas y Edificios',4,0),(42,'Electrónica Aplicada',6,0),(43,'Equipos Microinformáticos',4,0),(44,'Infraestructuras de Redes de Datos y Sistemas de Telefonía',7,0),(45,'Instalaciones Domóticas',5,0),(46,'Instalaciones de Megafonía y Sonorización',6,0),(47,'Circuito Cerrado de Televisión y Seguridad Electrónica',6,0),(48,'Instalaciones de Radiocomunicaciones',6,0),(49,'Circuitos Electrónicos Analógicos',7,0),(50,'Equipos Programables',6,0),(51,'Mantenimiento de Equipos de Voz y Datos',5,0),(52,'Técnicas y Proceso de Montaje y Mantenimiento de Equipos Electrónicos',6,0),(53,'Infraestructuras y Desarrollo del Mantenimiento Electrónico',3,0),(54,'Mantenimiento de Equipos y Radiocomunicaciones',6,0),(55,'Mantenimiento de Equipos de Electrónica Industrial',7,0),(56,'Mantenimiento de Equipos de Audio',5,0),(57,'Mantenimiento de Equipos de Vídeo',5,0),(58,'Proyecto de Mantenimiento Electrónico',0,40),(59,'Incidentes de Ciberseguridad',5,0),(60,'Bastionado de Redes y Sistemas',5,0),(61,'Puesta en Producción Segura',4,0),(62,'Análisis Forense Informático',4,0),(63,'Hacking Ético',4,0),(64,'Normativa de Ciberseguridad',2,0),(65,'Programación y Motores de Videojuegos',5,0),(66,'Programación en Red e Inteligencia Artificial',3,0),(67,'Diseño Gráfico 2D y 3D',4,0),(68,'Diseño, Gestión, Publicación y Producción',5,0),(69,'Realidad Virtual y Realidad Aumentada',3,0),(70,'Modelos de Inteligencia Artificial',3,0),(71,'Sistemas de Aprendizaje Automático',6,0),(72,'Programación de Inteligencia Artificial',7,0),(73,'Big Data Aplicado',4,0),(74,'Sistemas de Big Data',3,0);
/*!40000 ALTER TABLE `subject` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_obj`
--

DROP TABLE IF EXISTS `user_obj`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_obj` (
  `id` int NOT NULL,
  `user_name` varchar(255) NOT NULL,
  `user_surname` varchar(255) NOT NULL,
  `birthDate` date NOT NULL,
  `dnie` char(9) NOT NULL,
  `user_type` varchar(3) DEFAULT '01',
  `school_id` int DEFAULT NULL,
  `course_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `dnie` (`dnie`),
  KEY `foreign_key_course_id` (`course_id`),
  KEY `foreign_key_school_id` (`school_id`),
  CONSTRAINT `foreign_key_course_id` FOREIGN KEY (`course_id`) REFERENCES `course` (`id`),
  CONSTRAINT `foreign_key_id` FOREIGN KEY (`id`) REFERENCES `credentials` (`id`),
  CONSTRAINT `foreign_key_school_id` FOREIGN KEY (`school_id`) REFERENCES `school` (`id`),
  CONSTRAINT `user_obj_chk_1` CHECK (((char_length(`dnie`) = 9) and regexp_like(`dnie`,_utf8mb4'^[0-9]{8}[A-Z]$')))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_obj`
--

LOCK TABLES `user_obj` WRITE;
/*!40000 ALTER TABLE `user_obj` DISABLE KEYS */;
INSERT INTO `user_obj` VALUES (1,'Jon','Garcia Gimenez','1985-04-29','83745924U','02',1,NULL),(2,'Laura','Gasset Vargas','1990-04-23','12345678A','03',NULL,NULL),(3,'Tania','La Rubia Alvarez','1975-04-29','09876543D','03',NULL,NULL),(4,'Francisco','Perez Trabuco','1982-11-12','98736410L','02',2,NULL),(5,'Eloy','Leiva López','2005-10-11','79361937T','01',4,1),(8,'Barbara','Colomer Palomino','1975-04-29','12345678H','01',4,2),(9,'Sergio','Ramos Alarcón','2024-05-01','87654321Q','01',1,2),(10,'Antonio Manuel','Leiva Istán','1975-06-11','25676311P','01',3,5),(11,'Sergio','Ramos Alarcón','2005-08-02','77956688M','01',4,1),(12,'Jose','Molina Melendez','2024-05-20','26833175H','01',1,1),(13,'Manuel','Mol','2024-05-20','04584321F','01',2,1),(15,'Francisco','Pepe','2024-05-20','64218103X','01',1,1),(16,'Francisco','Perez','2024-05-21','22222222H','01',3,3),(17,'Carmen','Mahave','1999-10-12','45970567F','01',5,6),(20,'Gonzalo','Lazaro','2024-05-22','47270909K','01',3,3),(22,'Paco','de la Torre','2000-09-12','26619205V','01',5,6),(23,'Pepe','Molina Melendez','2001-01-30','47825537G','01',4,8);
/*!40000 ALTER TABLE `user_obj` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-05-23 18:23:01
