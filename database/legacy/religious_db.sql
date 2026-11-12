/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19  Distrib 10.11.14-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: religious_db
-- ------------------------------------------------------
-- Server version	10.11.14-MariaDB-0ubuntu0.24.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES latin1 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `ACTIVIDAD_DATO`
--

DROP TABLE IF EXISTS `ACTIVIDAD_DATO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ACTIVIDAD_DATO` (
  `EQUIPOID` int(11) NOT NULL DEFAULT 0,
  `ACTIVIDADID` char(3) NOT NULL DEFAULT '',
  `CARACTERISTICAID` char(3) NOT NULL DEFAULT '',
  `VALOR` double NOT NULL DEFAULT 0,
  PRIMARY KEY (`EQUIPOID`,`ACTIVIDADID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci COMMENT='Datos del equipo.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACTIVIDAD_DATO`
--

LOCK TABLES `ACTIVIDAD_DATO` WRITE;
/*!40000 ALTER TABLE `ACTIVIDAD_DATO` DISABLE KEYS */;
/*!40000 ALTER TABLE `ACTIVIDAD_DATO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CASILLA`
--

DROP TABLE IF EXISTS `CASILLA`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `CASILLA` (
  `X` int(11) NOT NULL DEFAULT 0,
  `Y` int(11) NOT NULL DEFAULT 0,
  `Z` int(11) NOT NULL DEFAULT 0,
  `CASILLA_TIPOID` tinyint(4) DEFAULT NULL,
  `EQUIPOID` int(11) DEFAULT NULL,
  `REGIONID` int(11) DEFAULT NULL,
  `REGION_CLIMAID` int(11) DEFAULT NULL,
  PRIMARY KEY (`X`,`Y`,`Z`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CASILLA`
--

LOCK TABLES `CASILLA` WRITE;
/*!40000 ALTER TABLE `CASILLA` DISABLE KEYS */;
/*!40000 ALTER TABLE `CASILLA` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CONEXION`
--

DROP TABLE IF EXISTS `CONEXION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `CONEXION` (
  `USUARIOID` int(11) NOT NULL DEFAULT 0,
  `FECHA` timestamp /* mariadb-5.3 */ NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `IP` char(15) DEFAULT NULL,
  PRIMARY KEY (`FECHA`,`USUARIOID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CONEXION`
--

LOCK TABLES `CONEXION` WRITE;
/*!40000 ALTER TABLE `CONEXION` DISABLE KEYS */;
INSERT INTO `CONEXION` VALUES
(4412,'2007-11-18 19:08:35','10.10.0.4'),
(4412,'2007-11-18 19:10:53','10.10.0.4'),
(4412,'2007-11-24 10:31:25','10.10.0.4'),
(4412,'2007-11-24 11:20:27','10.10.0.4'),
(4412,'2007-11-24 11:57:11','10.10.0.4');
/*!40000 ALTER TABLE `CONEXION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CORREO`
--

DROP TABLE IF EXISTS `CORREO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `CORREO` (
  `MENSAJEID` bigint(20) NOT NULL AUTO_INCREMENT,
  `USUARIOID` int(11) NOT NULL DEFAULT 0,
  `DESTINATARIO` int(11) NOT NULL DEFAULT 0,
  `FECHA` timestamp /* mariadb-5.3 */ NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `FECHA_RELIGIOUS` int(11) DEFAULT NULL,
  `ASUNTO` varchar(255) DEFAULT NULL,
  `MENSAJE` longtext DEFAULT NULL,
  `LEIDO` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`MENSAJEID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CORREO`
--

LOCK TABLES `CORREO` WRITE;
/*!40000 ALTER TABLE `CORREO` DISABLE KEYS */;
/*!40000 ALTER TABLE `CORREO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EDIFICIO`
--

DROP TABLE IF EXISTS `EDIFICIO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `EDIFICIO` (
  `EDIFICIOID` int(11) NOT NULL AUTO_INCREMENT,
  `EQUIPOID` int(11) NOT NULL DEFAULT 0,
  `TIPOEDIFICIOID` char(3) NOT NULL DEFAULT '',
  `NIVEL` double DEFAULT NULL,
  `FECHA_CONSTRUCCION` int(11) DEFAULT NULL,
  `ESTADO` double DEFAULT NULL,
  `TRABAJANDO` int(11) NOT NULL DEFAULT 0,
  `X` smallint(6) DEFAULT NULL,
  `Y` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`EDIFICIOID`)
) ENGINE=MyISAM AUTO_INCREMENT=25128 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci COMMENT='Edificios o Estructuras del Monasterio';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EDIFICIO`
--

LOCK TABLES `EDIFICIO` WRITE;
/*!40000 ALTER TABLE `EDIFICIO` DISABLE KEYS */;
INSERT INTO `EDIFICIO` VALUES
(25121,3382,'auc',1,9827403,100,0,NULL,NULL),
(25122,3382,'coc',1,9827403,100,0,NULL,NULL),
(25123,3382,'dor',1,9827403,100,0,NULL,NULL),
(25124,3382,'igl',1,9827403,100,0,NULL,NULL),
(25125,3382,'ora',1,9827403,100,0,NULL,NULL),
(25126,3382,'ref',1,9827403,100,0,NULL,NULL),
(25127,3382,'cla',1,9827403,100,0,NULL,NULL);
/*!40000 ALTER TABLE `EDIFICIO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EDIFICIO_DATO`
--

DROP TABLE IF EXISTS `EDIFICIO_DATO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `EDIFICIO_DATO` (
  `EDIFICIOID` int(11) NOT NULL DEFAULT 0,
  `ACTIVIDADID` char(3) NOT NULL DEFAULT '',
  `PRIORIDAD` smallint(6) NOT NULL DEFAULT 0,
  `RECURSOID` char(3) NOT NULL DEFAULT '',
  `CANTIDAD` double NOT NULL DEFAULT 0,
  PRIMARY KEY (`EDIFICIOID`,`ACTIVIDADID`,`PRIORIDAD`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci COMMENT='Tareas por Edificio.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EDIFICIO_DATO`
--

LOCK TABLES `EDIFICIO_DATO` WRITE;
/*!40000 ALTER TABLE `EDIFICIO_DATO` DISABLE KEYS */;
/*!40000 ALTER TABLE `EDIFICIO_DATO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EDIFICIO_GRANJA`
--

DROP TABLE IF EXISTS `EDIFICIO_GRANJA`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `EDIFICIO_GRANJA` (
  `EDIFICIOID` int(11) NOT NULL DEFAULT 0,
  `UNICOID` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`EDIFICIOID`,`UNICOID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci COMMENT='Animales de la Granja o Recursos Unicos de los Edificios.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EDIFICIO_GRANJA`
--

LOCK TABLES `EDIFICIO_GRANJA` WRITE;
/*!40000 ALTER TABLE `EDIFICIO_GRANJA` DISABLE KEYS */;
/*!40000 ALTER TABLE `EDIFICIO_GRANJA` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EDIFICIO_HUERTA`
--

DROP TABLE IF EXISTS `EDIFICIO_HUERTA`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `EDIFICIO_HUERTA` (
  `EDIFICIOID` int(11) NOT NULL DEFAULT 0,
  `ACTIVIDADID` char(3) NOT NULL DEFAULT '',
  `RECURSOID` char(3) NOT NULL DEFAULT '',
  `PORCENTAJE` double NOT NULL DEFAULT 0,
  `ESTADO` double NOT NULL DEFAULT 0,
  PRIMARY KEY (`EDIFICIOID`,`ACTIVIDADID`,`RECURSOID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci COMMENT='Estados de los campos de Cultivo y Otros Edificios.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EDIFICIO_HUERTA`
--

LOCK TABLES `EDIFICIO_HUERTA` WRITE;
/*!40000 ALTER TABLE `EDIFICIO_HUERTA` DISABLE KEYS */;
/*!40000 ALTER TABLE `EDIFICIO_HUERTA` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EDIFICIO_RECURSO`
--

DROP TABLE IF EXISTS `EDIFICIO_RECURSO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `EDIFICIO_RECURSO` (
  `EDIFICIOID` int(11) NOT NULL DEFAULT 0,
  `PUESTO` smallint(6) NOT NULL DEFAULT 0,
  `DIA` smallint(6) NOT NULL DEFAULT 0,
  `RECURSOID` char(3) DEFAULT NULL,
  PRIMARY KEY (`EDIFICIOID`,`PUESTO`,`DIA`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci COMMENT='Recursos a generar por Puesto en el Edificio.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EDIFICIO_RECURSO`
--

LOCK TABLES `EDIFICIO_RECURSO` WRITE;
/*!40000 ALTER TABLE `EDIFICIO_RECURSO` DISABLE KEYS */;
/*!40000 ALTER TABLE `EDIFICIO_RECURSO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EQUIPO`
--

DROP TABLE IF EXISTS `EQUIPO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `EQUIPO` (
  `EQUIPOID` int(11) NOT NULL AUTO_INCREMENT,
  `USUARIOID` int(11) NOT NULL DEFAULT 0,
  `CLANID` char(3) NOT NULL DEFAULT '',
  `REGIONID` int(11) NOT NULL DEFAULT 0,
  `CIUDADID` int(11) DEFAULT NULL,
  `NOMBRE` varchar(64) DEFAULT NULL,
  `FECHA_CONSTRUCCION` int(11) DEFAULT NULL,
  `ARQUITECTO` varchar(64) DEFAULT NULL,
  `CAPACIDAD_MAXIMA` int(11) DEFAULT NULL,
  `ECONOMIA` double NOT NULL DEFAULT 0,
  `ESPIRITU` double NOT NULL DEFAULT 0,
  `TECNOLOGIA` double NOT NULL DEFAULT 0,
  `RANKING` int(11) NOT NULL DEFAULT 99999,
  `SEGUIDORES` int(11) NOT NULL DEFAULT 0,
  `FORMACION` double NOT NULL DEFAULT 0,
  `ULTIMO_FORMACION` double NOT NULL DEFAULT 0,
  `MINIMO_FORMACION` double NOT NULL DEFAULT 0,
  `MEDIA_FORMACION` double NOT NULL DEFAULT 0,
  `MAXIMO_FORMACION` double NOT NULL DEFAULT 0,
  PRIMARY KEY (`EQUIPOID`)
) ENGINE=InnoDB AUTO_INCREMENT=3383 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EQUIPO`
--

LOCK TABLES `EQUIPO` WRITE;
/*!40000 ALTER TABLE `EQUIPO` DISABLE KEYS */;
INSERT INTO `EQUIPO` VALUES
(3382,4412,'car',2,NULL,'Test',9827403,NULL,NULL,0,0,0,99999,0,0,0,0,0,0);
/*!40000 ALTER TABLE `EQUIPO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EVENTO`
--

DROP TABLE IF EXISTS `EVENTO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `EVENTO` (
  `EVENTOID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `EVENTO_TIPOID` char(6) NOT NULL DEFAULT '',
  `DECISION` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `EJECUTADA` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `EQUIPOID` int(10) unsigned NOT NULL DEFAULT 0,
  `ID` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`EVENTOID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci COMMENT='Eventos acontecidos y decisiones tomadas al respecto.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EVENTO`
--

LOCK TABLES `EVENTO` WRITE;
/*!40000 ALTER TABLE `EVENTO` DISABLE KEYS */;
/*!40000 ALTER TABLE `EVENTO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `HOMBRE`
--

DROP TABLE IF EXISTS `HOMBRE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `HOMBRE` (
  `HOMBREID` int(11) NOT NULL AUTO_INCREMENT,
  `UNIDAD_TIPOID` char(3) NOT NULL DEFAULT '',
  `EQUIPOID` int(11) NOT NULL DEFAULT 0,
  `NOMBRE` char(48) DEFAULT NULL,
  `FECHA_NACIMIENTO` int(11) DEFAULT NULL,
  `FECHA_ENTRADA` int(11) DEFAULT NULL,
  `FECHA_FALLECIMIENTO` int(11) DEFAULT NULL,
  PRIMARY KEY (`HOMBREID`)
) ENGINE=MyISAM AUTO_INCREMENT=23533 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `HOMBRE`
--

LOCK TABLES `HOMBRE` WRITE;
/*!40000 ALTER TABLE `HOMBRE` DISABLE KEYS */;
INSERT INTO `HOMBRE` VALUES
(23528,'obe',3382,'Juan Cubria',9507435,9827403,NULL),
(23529,'obe',3382,'Salvador Cardenal',9474597,9827403,NULL),
(23530,'obe',3382,'Jose Ros',9631625,9827403,NULL),
(23531,'obe',3382,'David Arsoriz',9645598,9827403,NULL),
(23532,'nov',3382,'V�ctor Dorartes',9673575,9827403,NULL);
/*!40000 ALTER TABLE `HOMBRE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `HOMBRE_CARACTERISTICA`
--

DROP TABLE IF EXISTS `HOMBRE_CARACTERISTICA`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `HOMBRE_CARACTERISTICA` (
  `CARACTERISTICAID` char(3) NOT NULL DEFAULT '',
  `HOMBREID` int(11) NOT NULL DEFAULT 0,
  `NIVEL` double DEFAULT NULL,
  PRIMARY KEY (`CARACTERISTICAID`,`HOMBREID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `HOMBRE_CARACTERISTICA`
--

LOCK TABLES `HOMBRE_CARACTERISTICA` WRITE;
/*!40000 ALTER TABLE `HOMBRE_CARACTERISTICA` DISABLE KEYS */;
INSERT INTO `HOMBRE_CARACTERISTICA` VALUES
('can',23528,0),
('car',23528,3.68),
('com',23528,6.84),
('des',23528,3.16),
('fe',23528,6.6),
('fue',23528,3.7),
('idi',23528,3.72),
('sal',23528,20),
('sap',23528,3.48),
('tal',23528,5.24),
('can',23529,0),
('car',23529,6.56),
('com',23529,5.92),
('des',23529,7),
('fe',23529,6.72),
('fue',23529,2.85),
('idi',23529,3.6),
('sal',23529,20),
('sap',23529,3.36),
('tal',23529,3.4),
('can',23530,0),
('car',23530,3.28),
('com',23530,4),
('des',23530,6.44),
('fe',23530,6.04),
('fue',23530,4.7),
('idi',23530,3.12),
('sal',23530,20),
('sap',23530,6.96),
('tal',23530,6.72),
('can',23531,0),
('car',23531,5.92),
('com',23531,6.4),
('des',23531,6.64),
('fe',23531,5.2),
('fue',23531,1.35),
('idi',23531,6.16),
('sal',23531,20),
('sap',23531,4.08),
('tal',23531,5.88),
('can',23532,0),
('car',23532,5.12),
('com',23532,4.16),
('des',23532,6.04),
('fe',23532,5.72),
('fue',23532,3.75),
('idi',23532,6.32),
('sal',23532,20),
('sap',23532,5.44),
('tal',23532,5.36);
/*!40000 ALTER TABLE `HOMBRE_CARACTERISTICA` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MENSAJE_SISTEMA`
--

DROP TABLE IF EXISTS `MENSAJE_SISTEMA`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `MENSAJE_SISTEMA` (
  `MENSAJEID` bigint(20) NOT NULL AUTO_INCREMENT,
  `EQUIPOID` int(11) NOT NULL DEFAULT 0,
  `HOMBREID` int(11) DEFAULT NULL,
  `MENSAJE_TIPOID` varchar(6) NOT NULL DEFAULT '',
  `FECHA` int(11) DEFAULT NULL,
  `PARAMETRO1` varchar(32) DEFAULT NULL,
  `PARAMETRO2` varchar(32) DEFAULT NULL,
  `PARAMETRO3` varchar(32) DEFAULT NULL,
  `PARAMETRO4` varchar(32) DEFAULT NULL,
  `LEIDO` tinyint(4) NOT NULL DEFAULT 0,
  PRIMARY KEY (`MENSAJEID`),
  KEY `EQUIPO` (`EQUIPOID`),
  KEY `HOMBRE` (`HOMBREID`,`EQUIPOID`)
) ENGINE=MyISAM AUTO_INCREMENT=3778140 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci COMMENT='Mensajes Autom�ticos Generados por el Sistema para el Monast';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MENSAJE_SISTEMA`
--

LOCK TABLES `MENSAJE_SISTEMA` WRITE;
/*!40000 ALTER TABLE `MENSAJE_SISTEMA` DISABLE KEYS */;
INSERT INTO `MENSAJE_SISTEMA` VALUES
(3778134,3382,NULL,'crequi',9827403,NULL,NULL,NULL,NULL,0),
(3778135,3382,NULL,'crehom',9827403,'23528',NULL,NULL,NULL,0),
(3778136,3382,NULL,'crehom',9827403,'23529',NULL,NULL,NULL,0),
(3778137,3382,NULL,'crehom',9827403,'23530',NULL,NULL,NULL,0),
(3778138,3382,NULL,'crehom',9827403,'23531',NULL,NULL,NULL,0),
(3778139,3382,NULL,'crehom',9827403,'23532',NULL,NULL,NULL,0);
/*!40000 ALTER TABLE `MENSAJE_SISTEMA` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `NOTIFICACION`
--

DROP TABLE IF EXISTS `NOTIFICACION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `NOTIFICACION` (
  `USUARIOID` int(11) NOT NULL DEFAULT 0,
  `TIPO` char(6) NOT NULL DEFAULT '',
  PRIMARY KEY (`USUARIOID`,`TIPO`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci COMMENT='Noficiaciones al usuario.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `NOTIFICACION`
--

LOCK TABLES `NOTIFICACION` WRITE;
/*!40000 ALTER TABLE `NOTIFICACION` DISABLE KEYS */;
/*!40000 ALTER TABLE `NOTIFICACION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ORDEN_MERCADO`
--

DROP TABLE IF EXISTS `ORDEN_MERCADO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ORDEN_MERCADO` (
  `ORDENID` int(11) NOT NULL AUTO_INCREMENT,
  `FECHA` int(11) NOT NULL DEFAULT 0,
  `REGIONID` int(11) NOT NULL DEFAULT 1,
  `EQUIPOID` int(11) DEFAULT NULL,
  `TIPO_ORDEN` char(1) NOT NULL DEFAULT '',
  `RECURSOID` char(3) DEFAULT NULL,
  `CANTIDAD` double DEFAULT NULL,
  `TIPO_PRECIO` smallint(6) DEFAULT NULL,
  `PRECIO` double DEFAULT NULL,
  `EJECUTADA` tinyint(1) NOT NULL DEFAULT 0,
  `CRUZADA_CON` int(11) DEFAULT NULL,
  PRIMARY KEY (`ORDENID`)
) ENGINE=MyISAM AUTO_INCREMENT=5681060 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci COMMENT='Ordenes de Compra y Venta de Mercanc�as';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ORDEN_MERCADO`
--

LOCK TABLES `ORDEN_MERCADO` WRITE;
/*!40000 ALTER TABLE `ORDEN_MERCADO` DISABLE KEYS */;
/*!40000 ALTER TABLE `ORDEN_MERCADO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ORDEN_MERCADOH`
--

DROP TABLE IF EXISTS `ORDEN_MERCADOH`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ORDEN_MERCADOH` (
  `ORDENID` int(11) NOT NULL DEFAULT 0,
  `FECHA` int(11) NOT NULL DEFAULT 0,
  `REGIONID` int(11) NOT NULL DEFAULT 1,
  `EQUIPOID` int(11) DEFAULT NULL,
  `TIPO_ORDEN` char(1) NOT NULL DEFAULT '',
  `RECURSOID` char(3) DEFAULT NULL,
  `CANTIDAD` double DEFAULT NULL,
  `TIPO_PRECIO` smallint(6) DEFAULT NULL,
  `PRECIO` double DEFAULT NULL,
  `EJECUTADA` tinyint(1) NOT NULL DEFAULT 0,
  `CRUZADA_CON` int(11) DEFAULT NULL,
  PRIMARY KEY (`ORDENID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci COMMENT='Ordenes de Compra y Venta de Mercanc�as';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ORDEN_MERCADOH`
--

LOCK TABLES `ORDEN_MERCADOH` WRITE;
/*!40000 ALTER TABLE `ORDEN_MERCADOH` DISABLE KEYS */;
/*!40000 ALTER TABLE `ORDEN_MERCADOH` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PRECIO`
--

DROP TABLE IF EXISTS `PRECIO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `PRECIO` (
  `REGIONID` int(11) NOT NULL DEFAULT 0,
  `RECURSOID` char(3) NOT NULL DEFAULT '0',
  `PRECIO` double NOT NULL DEFAULT 0,
  PRIMARY KEY (`REGIONID`,`RECURSOID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci COMMENT='Ultimos Precios del Mercado por Regi�n.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PRECIO`
--

LOCK TABLES `PRECIO` WRITE;
/*!40000 ALTER TABLE `PRECIO` DISABLE KEYS */;
/*!40000 ALTER TABLE `PRECIO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RECURSO`
--

DROP TABLE IF EXISTS `RECURSO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `RECURSO` (
  `EQUIPOID` int(11) NOT NULL DEFAULT 0,
  `RECURSOID` char(3) NOT NULL DEFAULT '',
  `EDIFICIOID` int(11) NOT NULL DEFAULT 0,
  `UTILIDADID` char(3) NOT NULL DEFAULT 'alm',
  `CADUCIDAD` int(11) NOT NULL DEFAULT 0,
  `CANTIDAD` double DEFAULT NULL,
  `EN_USO` double NOT NULL DEFAULT 0,
  PRIMARY KEY (`EQUIPOID`,`RECURSOID`,`EDIFICIOID`,`UTILIDADID`,`CADUCIDAD`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci COMMENT='Recursos del Monasterio';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RECURSO`
--

LOCK TABLES `RECURSO` WRITE;
/*!40000 ALTER TABLE `RECURSO` DISABLE KEYS */;
/*!40000 ALTER TABLE `RECURSO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RECURSO_UNICO`
--

DROP TABLE IF EXISTS `RECURSO_UNICO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `RECURSO_UNICO` (
  `UNICOID` int(11) NOT NULL AUTO_INCREMENT,
  `NOMBRE` varchar(32) DEFAULT NULL,
  `EQUIPOID` int(11) NOT NULL DEFAULT 0,
  `RECURSOID` char(3) NOT NULL DEFAULT '',
  `EDIFICIOID` int(11) NOT NULL DEFAULT 0,
  `ESTADO` char(3) NOT NULL DEFAULT '100',
  `FECHA_NACIMIENTO` int(11) NOT NULL DEFAULT 0,
  `CANTIDAD` double NOT NULL DEFAULT 0,
  `FECHA_PARTO` int(11) NOT NULL DEFAULT 0,
  `SALUD` double NOT NULL DEFAULT 10,
  PRIMARY KEY (`UNICOID`)
) ENGINE=MyISAM AUTO_INCREMENT=73 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci COMMENT='Recursos �nicos del Monasterio';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RECURSO_UNICO`
--

LOCK TABLES `RECURSO_UNICO` WRITE;
/*!40000 ALTER TABLE `RECURSO_UNICO` DISABLE KEYS */;
/*!40000 ALTER TABLE `RECURSO_UNICO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SQLLOG`
--

DROP TABLE IF EXISTS `SQLLOG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `SQLLOG` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `FECHA` timestamp /* mariadb-5.3 */ NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `TIEMPO` double NOT NULL DEFAULT 0,
  `SQL` longtext NOT NULL,
  `FILAS` int(10) unsigned NOT NULL DEFAULT 0,
  `ERROR` longtext NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SQLLOG`
--

LOCK TABLES `SQLLOG` WRITE;
/*!40000 ALTER TABLE `SQLLOG` DISABLE KEYS */;
/*!40000 ALTER TABLE `SQLLOG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SUBASTA`
--

DROP TABLE IF EXISTS `SUBASTA`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `SUBASTA` (
  `SUBASTAID` int(11) NOT NULL AUTO_INCREMENT,
  `UNICOID` int(11) NOT NULL DEFAULT 0,
  `PRECIO_INICIAL` double NOT NULL DEFAULT 0,
  `EQUIPOID` int(11) DEFAULT NULL,
  `PRECIO` double NOT NULL DEFAULT 0,
  `FECHA_LIMITE` int(11) NOT NULL DEFAULT 0,
  `EJECUTADA` tinyint(4) NOT NULL DEFAULT 0,
  PRIMARY KEY (`SUBASTAID`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SUBASTA`
--

LOCK TABLES `SUBASTA` WRITE;
/*!40000 ALTER TABLE `SUBASTA` DISABLE KEYS */;
/*!40000 ALTER TABLE `SUBASTA` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TAREA_EDIFICIO`
--

DROP TABLE IF EXISTS `TAREA_EDIFICIO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `TAREA_EDIFICIO` (
  `TAREAID` int(11) NOT NULL AUTO_INCREMENT,
  `EDIFICIOID` int(11) NOT NULL DEFAULT 0,
  `ACTIVIDADID` char(3) NOT NULL DEFAULT '',
  `ORIGENID` char(3) DEFAULT NULL,
  `RECURSOID` char(3) DEFAULT NULL,
  `UNICOID` int(11) DEFAULT NULL,
  `PRIORIDAD` tinyint(4) NOT NULL DEFAULT 5,
  `CANTIDAD` double NOT NULL DEFAULT 0,
  `UTILIZAR` char(3) DEFAULT NULL,
  PRIMARY KEY (`TAREAID`)
) ENGINE=MyISAM AUTO_INCREMENT=924 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci COMMENT='Actividades Especificas de los Edificios';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TAREA_EDIFICIO`
--

LOCK TABLES `TAREA_EDIFICIO` WRITE;
/*!40000 ALTER TABLE `TAREA_EDIFICIO` DISABLE KEYS */;
/*!40000 ALTER TABLE `TAREA_EDIFICIO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TAREA_HOMBRE`
--

DROP TABLE IF EXISTS `TAREA_HOMBRE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `TAREA_HOMBRE` (
  `EQUIPOID` int(11) NOT NULL DEFAULT 0,
  `HOMBREID` int(11) NOT NULL DEFAULT 0,
  `DIA` int(11) NOT NULL DEFAULT 0,
  `PERIODOID` int(11) NOT NULL DEFAULT 0,
  `EDIFICIOID` int(11) DEFAULT NULL,
  `ACTIVIDADID` char(3) DEFAULT NULL,
  PRIMARY KEY (`EQUIPOID`,`HOMBREID`,`DIA`,`PERIODOID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TAREA_HOMBRE`
--

LOCK TABLES `TAREA_HOMBRE` WRITE;
/*!40000 ALTER TABLE `TAREA_HOMBRE` DISABLE KEYS */;
/*!40000 ALTER TABLE `TAREA_HOMBRE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TECNOLOGIA_EQUIPO`
--

DROP TABLE IF EXISTS `TECNOLOGIA_EQUIPO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `TECNOLOGIA_EQUIPO` (
  `EQUIPOID` int(11) DEFAULT NULL,
  `TECNOLOGIAID` char(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci COMMENT='Almacena las Tecnologias al alcance del Monasterio.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TECNOLOGIA_EQUIPO`
--

LOCK TABLES `TECNOLOGIA_EQUIPO` WRITE;
/*!40000 ALTER TABLE `TECNOLOGIA_EQUIPO` DISABLE KEYS */;
/*!40000 ALTER TABLE `TECNOLOGIA_EQUIPO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USUARIO`
--

DROP TABLE IF EXISTS `USUARIO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `USUARIO` (
  `USUARIOID` int(11) NOT NULL AUTO_INCREMENT,
  `IDIOMAID` char(2) NOT NULL DEFAULT '',
  `ESTILOID` varchar(32) DEFAULT NULL,
  `NICK` varchar(20) NOT NULL DEFAULT '',
  `CONTRASENA` varchar(15) NOT NULL DEFAULT '',
  `NOMBRE` varchar(60) NOT NULL DEFAULT '',
  `EMAIL` varchar(60) NOT NULL DEFAULT '',
  `CONECTADO` tinyint(1) DEFAULT NULL,
  `WEB` varchar(60) DEFAULT NULL,
  `ICQ` bigint(20) DEFAULT NULL,
  `BLOQUEADO` tinyint(1) DEFAULT NULL,
  `ULTIMA_CONEXION` timestamp /* mariadb-5.3 */ NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `ADMINISTRADOR` tinyint(1) DEFAULT NULL,
  `COLABORADOR` tinyint(1) DEFAULT NULL,
  `ROBOT` tinyint(1) NOT NULL DEFAULT 0,
  `NOTIFICACIONES` tinyint(4) NOT NULL DEFAULT 1,
  `MENSAJES` tinyint(4) NOT NULL DEFAULT 1,
  `NOTICIAS` tinyint(4) NOT NULL DEFAULT 1,
  PRIMARY KEY (`USUARIOID`)
) ENGINE=InnoDB AUTO_INCREMENT=4413 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USUARIO`
--

LOCK TABLES `USUARIO` WRITE;
/*!40000 ALTER TABLE `USUARIO` DISABLE KEYS */;
INSERT INTO `USUARIO` VALUES
(4412,'en','fuego','powerzite','12345','','admin@localhost',0,'',NULL,0,'2007-11-24 12:03:47',0,0,0,1,1,1);
/*!40000 ALTER TABLE `USUARIO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USUARIO_PUBLICIDAD`
--

DROP TABLE IF EXISTS `USUARIO_PUBLICIDAD`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `USUARIO_PUBLICIDAD` (
  `USUARIOID` int(11) NOT NULL DEFAULT 0,
  `PUBLICIDADID` char(3) NOT NULL DEFAULT '',
  PRIMARY KEY (`USUARIOID`,`PUBLICIDADID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci COMMENT='Publicidad Aceptada por el Usuario';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USUARIO_PUBLICIDAD`
--

LOCK TABLES `USUARIO_PUBLICIDAD` WRITE;
/*!40000 ALTER TABLE `USUARIO_PUBLICIDAD` DISABLE KEYS */;
/*!40000 ALTER TABLE `USUARIO_PUBLICIDAD` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `_ACTIVIDAD`
--

DROP TABLE IF EXISTS `_ACTIVIDAD`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `_ACTIVIDAD` (
  `ACTIVIDADID` char(3) NOT NULL DEFAULT '',
  `CATEGORIA` char(3) DEFAULT NULL,
  `RECURSOID1` char(3) DEFAULT NULL,
  `RECURSOID2` char(3) DEFAULT NULL,
  `RECURSOID3` char(3) DEFAULT NULL,
  PRIMARY KEY (`ACTIVIDADID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_ACTIVIDAD`
--

LOCK TABLES `_ACTIVIDAD` WRITE;
/*!40000 ALTER TABLE `_ACTIVIDAD` DISABLE KEYS */;
INSERT INTO `_ACTIVIDAD` VALUES
('ara','cul',NULL,NULL,NULL),
('art',NULL,'oar',NULL,NULL),
('cas','gan',NULL,NULL,NULL),
('caz',NULL,NULL,NULL,NULL),
('cle',NULL,NULL,NULL,NULL),
('coc',NULL,'com',NULL,NULL),
('com',NULL,NULL,NULL,NULL),
('con',NULL,'rop',NULL,NULL),
('cos','cul',NULL,NULL,NULL),
('cul',NULL,NULL,NULL,NULL),
('des',NULL,NULL,NULL,NULL),
('dor',NULL,NULL,NULL,NULL),
('dpl','cul',NULL,NULL,NULL),
('emi',NULL,NULL,NULL,NULL),
('esc',NULL,'lib',NULL,NULL),
('fno',NULL,NULL,NULL,NULL),
('fqu',NULL,'que',NULL,NULL),
('gan',NULL,NULL,NULL,NULL),
('hor','coc',NULL,NULL,NULL),
('lee',NULL,'lib',NULL,NULL),
('med',NULL,NULL,NULL,NULL),
('mis',NULL,NULL,NULL,NULL),
('mol',NULL,'cer',NULL,NULL),
('ord','gan',NULL,NULL,NULL),
('pes',NULL,NULL,NULL,NULL),
('rez',NULL,NULL,NULL,NULL),
('sac','gan',NULL,NULL,NULL),
('san',NULL,NULL,NULL,NULL),
('sem','cul','sem',NULL,NULL);
/*!40000 ALTER TABLE `_ACTIVIDAD` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `_ACTIVIDADT`
--

DROP TABLE IF EXISTS `_ACTIVIDADT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `_ACTIVIDADT` (
  `ACTIVIDADID` char(3) NOT NULL DEFAULT '',
  `IDIOMAID` char(2) NOT NULL DEFAULT '',
  `DESCRIPCION` varchar(32) DEFAULT NULL,
  `COMENTARIOS` longtext DEFAULT NULL,
  PRIMARY KEY (`ACTIVIDADID`,`IDIOMAID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_ACTIVIDADT`
--

LOCK TABLES `_ACTIVIDADT` WRITE;
/*!40000 ALTER TABLE `_ACTIVIDADT` DISABLE KEYS */;
INSERT INTO `_ACTIVIDADT` VALUES
('ara','ca','Llaurar el Camp','Prepara els teus horts perqu� puguin acollir els cultius que desitgis sembrar.'),
('ara','en','Plow the Orchard','Prepares your orchards so that they can welcome the cultures that you wish to seed.'),
('ara','es','Arar el Campo','Prepara tus huertas para que puedan acoger los cultivos que desees sembrar.'),
('art','ca','Crear Artesania','Creaci� d\'objectes de cer�mica i artesans per al seu �s o venda en el mercat.'),
('art','en','Make Crafts','Creation of objects of ceramics and craftsmen for its use or sale in the market. It is important that this activity creates a monk with sufficient skill.'),
('art','es','Crear Artesan�a','Creaci�n de objetos de cer�mica y artesanos para su uso o venta en el mercado.<br>Es importante que esta actividad la cree un monje con suficiente destreza.'),
('cas','ca','Castrar','Pots castrar a certs animals per a destinar-los a determinades tasques.'),
('cas','en','Castrate','You can castrate certain animals to destine them to certain tasks.'),
('cas','es','Castrar','Puedes castrar a ciertos animales para destinarlos a determinadas tareas.'),
('caz','ca','Ca�ar','La ca�a d\'animals permet obtenir carn i pells, per� haur�s de cuidar la poblaci� d\'animals dels teus boscos.<br>De la carn podr�s alimentar als teus monjos i amb les pells els podr�s abrigar.<br>Aquesta activitat requereix certa for�a i resulta una mica cansada i l\'efic�cia de la ca�a, a m�s, resulta afectada pel clima de la teva regi�.<br>Pots millorar la ca�a mitjan�ant la utilitzaci� d\'arc i fletxes i altres utensilis de ca�a.'),
('caz','en','Hunt','The animal hunting allows to obtain meat and skins, but you will have to take care of the animal population of your forests. On the meat you will be able to feed your monks and with the skins you will be able to shelter them. This activity requires certain force and is something tired and the effectiveness of the hunting, in addition, is affected by the climate from your region. You can improve the hunting by means of the use of arc and arrows and other utensils of hunting.'),
('caz','es','Cazar','La caza de animales permite obtener carne y pieles, pero deber�s cuidar la poblaci�n de animales de tus bosques.<br>De la carne podr�s alimentar a tus monjes y con las pieles los podr�s abrigar.<br>Esta actividad requiere cierta fuerza y resulta algo cansada y la eficacia de la caza, adem�s, resulta afectada por el clima de tu region.<br>Puedes mejorar la caza mediante la utilizaci�n de arco y flechas y otros utensilios de caza.'),
('cle','ca','Talar','Talar arbres dels teus boscos et donar� fusta y suro, pero has de cuidar aquest recurs natural que no es inagotable.'),
('cle','en','Destroy Trees','To destroy the trees of your forests will facilitate wood and cork to you, but you must take care of this natural resource that is not inexhaustible. Being one of the tired activities more than they exist, you will have to take care of the rest of the monks who you assign to this task.'),
('cle','es','Talar','Talar los �rboles de tus bosques te facilitar� madera y corcho, pero debes cuidar este recurso natural que no es inagotable.<br>Siendo una de las actividades m�s cansadas que existen, deber�s cuidar el descanso de los monjes que asignes a esta tarea.'),
('coc','ca','Cuinar','Prepara el menjar per que els teus monjos puguin gaudir d\'un bon apat.'),
('coc','en','Cook','It prepares the food so that your monks can eat. Your monks are very scrupulous and they do not want to eat the resources to the natural one, reason why you will have to command to cook to a pair of them. Once prepared the food, this it will last to you just a short time in your monastery, asi that administers well your eatable ones at the time of cooking.'),
('coc','es','Cocinar','Prepara la comida para que tus monjes puedan comer.<br>Tus monjes son muy escrupulosos y no quieren comer los recursos al natural, por lo que tendr�s que mandar a cocinar a un par de ellos.<br>Una vez preparada la comida, esta te durar� poco tiempo en tu monasterio, asi que administra bien tus comestibles a la hora de cocinar.'),
('com','ca','Menjar','Cada vegada que menja, un monjo recupera for�a i salut.'),
('com','en','Eat','Whenever he eats, a monk replenishes force and health.'),
('com','es','Comer','Cada vez que come, un monje recupera su salud, pero asegurate de tener Comida Preparada, que es lo �nico que comen tus monjes.<br>Los monjes tambi�n se recuperan de su cansancio en esta actividad.'),
('con','ca','Confeccionar','La confecci� de les vestimentes dels teus monjos per a l\'abric dels seus cossos.'),
('con','en','Prepare Cloths','The preparation of clothes the shelter and to sell them in the market is an activity that requires certain skill. You must have the resources necessary to generate the clothes, already are skins, wool, etc.'),
('con','es','Confeccionar','La confecci�n de vestimentas para el abrigo y para venderlas en el mercado es una actividad que requiere cierta destreza.<br>Deber�s tener los recursos necesarios para generar la ropa, ya sean pieles, lana, etc.'),
('cos','ca','Recollir','La recollida de la sembra �s fins i tot m�s cansada que la sembra, per� reporta enormes beneficis.'),
('cos','en','Harvest','To harvest is even more tired than seedtime, but it reports enormous benefits'),
('cos','es','Cosechar','La recogida de la siembra es incluso m�s cansada que la siembra, pero reporta enormes beneficios.'),
('cul','ca','Conrear','Conrear agrupa les activitats del camp. Haur�s de informar en cada hort la activitat que vols que els monjos realitzin a cada moment.'),
('cul','en','Cultivate','To cultivate groups the activities of the field. You will have to inform in each orchard the activity that you want that the monks make in every moment.'),
('cul','es','Cultivar','Cultivar agrupa las actividades del campo. Tendr�s que informar en cada huerta la actividad que quieres que los monjes realicen en cada momento. \r\n'),
('des','ca','Descansar','El monjo recupera for�a al descansar.'),
('des','en','Rest','The monk recovers of his fatigue when resting. Specially useful for those monks who make important physical activities like Destroying or Extracting Mineral.'),
('des','es','Descansar','El monje se recupera de su cansancio al descansar. Especialmente �til para aquellos monjes que realizan actividades f�sicas importantes como Talar o Extraer Mineral.'),
('dor','ca','Dormir','Un monjo recupera molta for�a mentre dorm.'),
('dor','en','Sleep','A monk recovers enormously of his fatigue when sleeping.'),
('dor','es','Dormir','Un monje se recupera enormemente de su cansancio mientras duerme.'),
('emi','ca','Extreure Mineral','Extreu mineral de les mines properes a la teva ciutat.'),
('emi','en','Extract Mineral','It extracts the mineral of the mines near your city. Useful if you need natural resources for the creation buildings.'),
('emi','es','Extraer Mineral','Extrae el mineral de las minas cercanas a tu ciudad. �til si necesitas recursos naturales para la creaci�n de edificios'),
('esc','ca','Escriure','Escriptura de llibres amb la finalitat de fer perdurar els coneixements dels monjos.'),
('esc','en','Write','Book Scripture with the purpose of making last the knowledge of the monks.'),
('esc','es','Escribir','Escritura de libros con el fin de hacer perdurar los conocimientos de los monjes.'),
('fno','ca','Formar Novicis','Formar als novicis �s una activitat imprescindible si vols fer cr�ixer a la teva congregaci�, per� pot passar fins a un any abans que obtinguis resultats.'),
('fno','en','Form Novices','To form the novices is an essential activity if you want to make to grow to your congregation, but it can happen up to one year before you obtain turned out.'),
('fno','es','Formar Novicios','Formar a los novicios es una actividad imprescindible si quieres hacer crecer a tu congregacion, pero puede pasar hasta un a�o antes de que obtengas resultados.'),
('fqu','ca','Elaborar Formatges','L\'elaboraci� de formatges es una activitat molt apreciada entre els aldeans y ben portada a terme pot donar renom al teu monestir.'),
('fqu','en','Elaborate Cheeses','The making of cheeses is an activity much appreciated between the villagers and carried out it can give fame to your monastery.'),
('fqu','es','Elaborar Quesos','La elaboraci�n de quesos es una actividad muy apreciada entre los aldeanos y bien llevada a cabo puede dar renombre a tu monasterio.'),
('gan','ca','Criar Bestiar','Cura dels animals de la granja per al seu posterior sacrifici. '),
('gan','en','Raise Cattle','Care of the animals of the farm for his later sacrifice.'),
('gan','es','Criar Ganado','Cuidado de los animales de la granja para su posterior sacrificio.'),
('hor','ca','Fornejar','A la cuina podr�s fornejar pa i d\'altres compostos.'),
('hor','en','Bake','In the kitchen you will be able to bake bread and other compounds if you obtain the necessary elements.'),
('hor','es','Hornear','En la cocina podr�s hornear pan y otros compuestos si consigues los elementos necesarios.'),
('lee','ca','Llegir','Mitjan�ant la lectura dels llibres els monjos milloren els seus coneixements.'),
('lee','en','Read','By means of the reading of the books the monks improve his knowledge.'),
('lee','es','Leer','Mediante la lectura de los libros los monjes mejoran sus conocimientos.'),
('med','ca','Meditar','La meditaci� (que no el r�s) permetr� als teus monjos un m�s gran creixement espiritual.'),
('med','en','Ponder','The meditation (not the prayer) will allow to your monks a major spiritual growth. <br> Guarantees lightly the faith and of more evident form the Knowledge, depending in the latter case of the entire Knowledge of your monks.'),
('med','es','Meditar','La meditaci�n (que no el rezo) permitir� a tus monjes un mayor crecimiento espiritual.<br>Afianza ligeramente la fe y de forma m�s evidente la Sabidur�a, dependiendo en este �ltimo caso de la Sabidur�a total de tus monjes.'),
('mis','ca','Oficiar Misa','L\'ofici de la misa fidelitzar� els aldeans i et reportar� l\'or de les almoines.'),
('mis','en','Celebrate Mass','The office of the mass will make the villagers more faithful to your monastery and gold of the alms will bring you.'),
('mis','es','Oficiar Misa','El oficio de la misa fidelizar� a los aldeanos a tu monasterio y te reportar� oro de las limosnas.<br>Sus resultados depender�n de la Fe y la Sabidur�a del monje designado para Oficiar la Misa.'),
('mol','ca','Moldre Cereals','Moldre els teus cereals t\'aportar� farines per a les diverses necessitats dels teus aldeans i el teu monestir. Requereix cereals i un mol�. \r\n\r\n'),
('mol','en','Grind Cereals','To grind your cereals will contribute you flour for the diverse needs of your villagers and your monastery. It needs cereals and a mill.'),
('mol','es','Moler Cereales','Moler tus cereales te aportar� harinas para las diversas necesidades de tus aldeanos y tu monasterio. Requiere cereales y un molino.'),
('ord','ca','Munyir','El munyiment de vaques i altres animals et donar� llet amb la qual podr�s fer formatges.'),
('ord','en','Milk','The milking of cows and other animals will give you milk with which you will be able to do cheeses.'),
('ord','es','Orde�ar','El orde�o de vacas y otros animales te dar� leche con la que podr�s hacer quesos.'),
('pes','ca','Pescar','Igual que la ca�a, la pesca proveeix als monjos de menjar per al seu �s o la seva venda.'),
('pes','en','Fish','As the hunting, the fishing provides the monks of meal for his use or his selling.'),
('pes','es','Pescar','Al igual que la caza, la pesca provee a los monjes de comida para su uso o su venta.'),
('rez','ca','Resar','Deur�s dedicar una gran quantitat de temps a l\'oraci� si no vols que els teus monjos perdin la fe. La perduda de la fe pot tenir horribles conseq��ncies per al teu monestir.'),
('rez','en','Pray','You will have to dedicate a great quantity of time to the prayer if you do not want that your monks lose the faith. The loss of the faith can have horrible consequences for your monastery.'),
('rez','es','Rezar','Deber�s dedicar una gran cantidad de tiempo a la oraci�n si no quieres que tus monjes pierdan la fe. La perdida de la fe puede tener horribles consecuencias para tu monasterio.'),
('sac','ca','Sacrificar','El sacrifici dels animals et reportar� carn, pells i altres recursos.'),
('sac','en','Sacrifice','The sacrifice of the animals will bring you meat, skins and other resources.'),
('sac','es','Sacrificar','El sacrificio de los animales te reportar� carne, pieles y otros recursos.'),
('san','ca','Sanar','Guarir als pelegrins que s\'apropen al teu monestir �s una tasca que no has de deixar oblidada mai.'),
('san','en','Recover','To treat the pilgrims who approach your monastery is a task that you must never make forgotten since, since the office of the mass will make your villagers more faithful. <br> For against, not to do it, it will make you lose parishioners.'),
('san','es','Sanar','Curar a los peregrinos que se acercan a tu monasterio es una tarea que no debes dejar olvidada nunca ya que, como el oficio de la misa fidelizar� a tus aldeanos. <br>Por contra, no hacerlo, te hara perder feligreses.'),
('sem','ca','Sembrar','La sembra �s indispensable per a recollir, per� �s una activitat molt cansada.'),
('sem','en','Sowing','The sowing is indispensable to gather, but it is a very tired activity.'),
('sem','es','Sembrar','La siembra es indispensable para recoger, pero es una actividad muy cansada');
/*!40000 ALTER TABLE `_ACTIVIDADT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `_ACTIVIDAD_PARAMETRO`
--

DROP TABLE IF EXISTS `_ACTIVIDAD_PARAMETRO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `_ACTIVIDAD_PARAMETRO` (
  `ACTIVIDADID` char(3) NOT NULL DEFAULT '',
  `CARACTERISTICAID` char(3) NOT NULL DEFAULT '',
  `VALOR_INICIAL` double DEFAULT NULL,
  PRIMARY KEY (`ACTIVIDADID`,`CARACTERISTICAID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci COMMENT='Par�metros Especificables por Actividad.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_ACTIVIDAD_PARAMETRO`
--

LOCK TABLES `_ACTIVIDAD_PARAMETRO` WRITE;
/*!40000 ALTER TABLE `_ACTIVIDAD_PARAMETRO` DISABLE KEYS */;
INSERT INTO `_ACTIVIDAD_PARAMETRO` VALUES
('coc','rac',5);
/*!40000 ALTER TABLE `_ACTIVIDAD_PARAMETRO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `_CARACTERISTICA`
--

DROP TABLE IF EXISTS `_CARACTERISTICA`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `_CARACTERISTICA` (
  `CARACTERISTICAID` char(3) NOT NULL DEFAULT '',
  `TIPO_CARACTERISTICA` char(3) DEFAULT NULL,
  `APLICABLE_A` tinyint(4) NOT NULL DEFAULT 1,
  `COLUMNA` char(32) DEFAULT NULL,
  `TIPO` char(3) NOT NULL DEFAULT 'log',
  `INVERSA` tinyint(1) NOT NULL DEFAULT 0,
  `MINIMO` double NOT NULL DEFAULT 16,
  `MENSAJE_MINIMO` char(6) DEFAULT NULL,
  `MAXIMO` double NOT NULL DEFAULT 256,
  `MENSAJE_MAXIMO` char(6) DEFAULT NULL,
  `MINIMO_CREACION` double NOT NULL DEFAULT 3,
  `MAXIMO_CREACION` double NOT NULL DEFAULT 7,
  PRIMARY KEY (`CARACTERISTICAID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_CARACTERISTICA`
--

LOCK TABLES `_CARACTERISTICA` WRITE;
/*!40000 ALTER TABLE `_CARACTERISTICA` DISABLE KEYS */;
INSERT INTO `_CARACTERISTICA` VALUES
('can','vit',4,NULL,'lin',1,16,NULL,256,NULL,0,0),
('car','hab',4,NULL,'exp',0,16,NULL,256,NULL,3,7),
('com','hab',4,NULL,'exp',0,16,NULL,256,NULL,3,7),
('des','hab',4,NULL,'exp',0,16,NULL,256,NULL,3,7),
('fe','hab',4,NULL,'exp',0,16,NULL,256,NULL,3,7),
('fue','vit',4,NULL,'exp',0,16,NULL,256,NULL,0,5),
('hab',NULL,4,NULL,'exp',0,16,NULL,256,NULL,25,49),
('idi','hab',4,NULL,'exp',0,16,NULL,256,NULL,3,7),
('man',NULL,3,'MAXIMO_FORMACION','log',0,16,NULL,256,NULL,25,49),
('men',NULL,3,'MEDIA_FORMACION','log',0,16,NULL,256,NULL,25,49),
('min',NULL,3,'MINIMO_FORMACION','log',0,16,NULL,256,NULL,25,49),
('nov',NULL,3,'FORMACION','log',0,16,NULL,256,NULL,0,0),
('rac',NULL,7,NULL,'log',0,0,NULL,0,NULL,5,5),
('sal','vit',4,NULL,'exp',0,16,NULL,256,NULL,20,20),
('sap','hab',4,NULL,'exp',0,16,NULL,256,NULL,3,7),
('tal','hab',4,NULL,'exp',0,16,NULL,256,NULL,3,7),
('vit',NULL,4,NULL,'exp',0,16,NULL,256,NULL,3,7);
/*!40000 ALTER TABLE `_CARACTERISTICA` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `_CARACTERISTICAT`
--

DROP TABLE IF EXISTS `_CARACTERISTICAT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `_CARACTERISTICAT` (
  `CARACTERISTICAID` char(3) NOT NULL DEFAULT '',
  `IDIOMAID` char(2) NOT NULL DEFAULT '',
  `DESCRIPCION` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`CARACTERISTICAID`,`IDIOMAID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_CARACTERISTICAT`
--

LOCK TABLES `_CARACTERISTICAT` WRITE;
/*!40000 ALTER TABLE `_CARACTERISTICAT` DISABLE KEYS */;
INSERT INTO `_CARACTERISTICAT` VALUES
('can','ca','Cansament'),
('can','en','Fatigue'),
('can','es','Cansancio'),
('car','ca','Carisma'),
('car','en','Charisma'),
('car','es','Carisma'),
('com','ca','Habilitat Comercial'),
('com','en','Business Capability'),
('com','es','Habilidad Comercial'),
('des','ca','Destresa'),
('des','en','Skill'),
('des','es','Destreza'),
('fe','ca','Fe'),
('fe','en','Faith'),
('fe','es','Fe'),
('fue','ca','For�a'),
('fue','en','Force'),
('fue','es','Fuerza'),
('hab','ca','Habilitat'),
('hab','en','Ability'),
('hab','es','Habilidad'),
('idi','ca','Idiomes'),
('idi','en','Languages'),
('idi','es','Idiomas'),
('nov','ca','Formaci� de Novicis'),
('nov','en','Formation of Beginners'),
('nov','es','Formaci�n de Novicios'),
('rac','ca','Racions a preparar'),
('rac','en','A rations to prepare'),
('rac','es','Raciones a preparar'),
('sal','ca','Salut'),
('sal','en','Health'),
('sal','es','Salud'),
('sap','ca','Sabiduria'),
('sap','en','Wisdom'),
('sap','es','Sabidur�a'),
('tal','ca','Talent'),
('tal','en','Talent'),
('tal','es','Talento'),
('vit','ca','Vital'),
('vit','en','Vital'),
('vit','es','Vital');
/*!40000 ALTER TABLE `_CARACTERISTICAT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `_CARACTERISTICA_EDAD`
--

DROP TABLE IF EXISTS `_CARACTERISTICA_EDAD`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `_CARACTERISTICA_EDAD` (
  `CARACTERISTICAID` char(3) NOT NULL DEFAULT '',
  `DESDE` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `HASTA` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `CORRECTOR` double DEFAULT 1,
  PRIMARY KEY (`CARACTERISTICAID`,`DESDE`,`HASTA`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_CARACTERISTICA_EDAD`
--

LOCK TABLES `_CARACTERISTICA_EDAD` WRITE;
/*!40000 ALTER TABLE `_CARACTERISTICA_EDAD` DISABLE KEYS */;
INSERT INTO `_CARACTERISTICA_EDAD` VALUES
('can',0,32,1),
('can',33,38,0.8),
('can',39,44,0.7),
('can',45,50,0.6),
('can',51,56,0.5),
('can',57,62,0.4),
('can',62,255,0.5),
('car',0,20,0.3),
('car',21,26,0.5),
('car',26,32,0.7),
('car',33,38,0.8),
('car',39,44,0.9),
('car',45,255,1),
('des',0,20,0.3),
('des',21,26,0.5),
('des',27,32,0.7),
('des',33,50,0.9),
('des',51,62,0.8),
('des',63,255,0.7),
('fe',0,20,0.2),
('fe',21,26,0.7),
('fe',27,38,0.9),
('fe',39,255,1),
('fue',0,32,1),
('fue',33,38,0.9),
('fue',39,44,0.7),
('fue',45,50,0.5),
('fue',51,56,0.3),
('fue',57,62,0.2),
('fue',63,255,0.1),
('sal',0,26,1),
('sal',27,32,0.9),
('sal',33,38,0.8),
('sal',39,44,0.7),
('sal',45,50,0.6),
('sal',51,56,0.4),
('sal',57,62,0.3),
('sal',63,255,0.15),
('sap',0,20,0.2),
('sap',21,32,0.3),
('sap',33,44,0.9),
('sap',45,255,1);
/*!40000 ALTER TABLE `_CARACTERISTICA_EDAD` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `_CASILLA_TIPO`
--

DROP TABLE IF EXISTS `_CASILLA_TIPO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `_CASILLA_TIPO` (
  `CASILLA_TIPOID` int(11) NOT NULL AUTO_INCREMENT,
  `ICONO` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`CASILLA_TIPOID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci COMMENT='Tile Types.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_CASILLA_TIPO`
--

LOCK TABLES `_CASILLA_TIPO` WRITE;
/*!40000 ALTER TABLE `_CASILLA_TIPO` DISABLE KEYS */;
INSERT INTO `_CASILLA_TIPO` VALUES
(1,'imagenes/casilla/bosque.gif'),
(2,'imagenes/casilla/llano.gif'),
(3,'imagenes/casilla/agua.gif');
/*!40000 ALTER TABLE `_CASILLA_TIPO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `_CASILLA_TIPOT`
--

DROP TABLE IF EXISTS `_CASILLA_TIPOT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `_CASILLA_TIPOT` (
  `CASILLA_TIPOID` tinyint(4) NOT NULL DEFAULT 0,
  `IDIOMAID` char(2) NOT NULL DEFAULT '',
  `DESCRIPCION` char(32) DEFAULT NULL,
  PRIMARY KEY (`CASILLA_TIPOID`,`IDIOMAID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci COMMENT='Textos de Tipos de Casilla.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_CASILLA_TIPOT`
--

LOCK TABLES `_CASILLA_TIPOT` WRITE;
/*!40000 ALTER TABLE `_CASILLA_TIPOT` DISABLE KEYS */;
/*!40000 ALTER TABLE `_CASILLA_TIPOT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `_CIUDAD`
--

DROP TABLE IF EXISTS `_CIUDAD`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `_CIUDAD` (
  `CIUDADID` int(11) NOT NULL AUTO_INCREMENT,
  `REGIONID` int(11) NOT NULL DEFAULT 0,
  `NOMBRE` varchar(64) NOT NULL DEFAULT '',
  `TRIBUTO` double NOT NULL DEFAULT 1,
  PRIMARY KEY (`CIUDADID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci COMMENT='Ciudades.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_CIUDAD`
--

LOCK TABLES `_CIUDAD` WRITE;
/*!40000 ALTER TABLE `_CIUDAD` DISABLE KEYS */;
/*!40000 ALTER TABLE `_CIUDAD` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `_CLAN`
--

DROP TABLE IF EXISTS `_CLAN`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `_CLAN` (
  `CLANID` char(3) NOT NULL DEFAULT '',
  `EMBLEMA` varchar(128) NOT NULL DEFAULT '',
  `INDUMENTARIA` varchar(128) NOT NULL DEFAULT '',
  `RANKING` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`CLANID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_CLAN`
--

LOCK TABLES `_CLAN` WRITE;
/*!40000 ALTER TABLE `_CLAN` DISABLE KEYS */;
INSERT INTO `_CLAN` VALUES
('car','imagenes/EmblemaCartujo.gif','imagenes/HabitoCartujo.gif',2),
('dom','imagenes/EmblemaDominico.gif','imagenes/HabitoDominico.gif',1);
/*!40000 ALTER TABLE `_CLAN` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `_CLANT`
--

DROP TABLE IF EXISTS `_CLANT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `_CLANT` (
  `CLANID` char(3) NOT NULL DEFAULT '',
  `IDIOMAID` char(2) NOT NULL DEFAULT '',
  `NOMBRE` varchar(32) NOT NULL DEFAULT '',
  `HISTORIA` longtext DEFAULT NULL,
  PRIMARY KEY (`CLANID`,`IDIOMAID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_CLANT`
--

LOCK TABLES `_CLANT` WRITE;
/*!40000 ALTER TABLE `_CLANT` DISABLE KEYS */;
INSERT INTO `_CLANT` VALUES
('car','ca','Cartujos','<p>Fundada per San Bruno en l\'any 1098.</p><p>Els valors del cartujo s�n el silenci, el treball, la pobresa, la castedat, l\'obedi�ncia, l\'escolta de la paraula, l\'oraci� i la humilitat.</p><p>La vida del cartujo es caracteritza per una vida solit�ria dedicada a la contemplaci� i a la recerca de D�u en la solitud, per la combinaci� de la vida solit�ria amb una vida comunit�ria i per la lit�rgia cartujana.<p>'),
('car','en','Cartujos','<p>Founded by San Bruno in 1098.</p><p>The values of cartujo are silence, the work, the poverty, the abstention, obedience, the listening of the word, the oration and humility.</p><p>The life of cartujo is characterized by a solitary life dedicated to the contemplation and the search of God in the solitude, by the combination of the solitary life with a communitarian life and by lit�rgia cartujana.</p>'),
('car','es','Cartujos','<p>Fundada por San Bruno en el a�o 1098.</p><p>Los valores del cartujo son el silencio, el trabajo, la pobreza, la castidad, la obediencia, la escucha de la palabra, la oraci�n y la humildad.</p><p>La vida del cartujo se caracteriza por una vida solitaria dedicada a la contemplaci�n y a la b�squeda de Dios en la soledad, por la combinaci�n de la vida solitaria con una vida comunitaria y por la lit�rgia cartujana.<p>'),
('dom','ca','Dominics','<p>Fundada per Santo Domingo de Guzm�n en l\'any 1215.</p><p>S�n frares predicadors, neixen per a la predicaci� de la paraula de D�u i per a la salvaci� de les �nimes.</p><p>Es caracteritzen per dur una vida en comuna, per l\'extensi� de la seva Esgl�sia mitjan�ant Consells Evang�lics i per la seva dedicaci� a l\'Observaci� Regular, que regula la seva vida comunit�ria.</p><p>Tots aquests elements integren la vida dominicana i la regulen mitjan�ant una disciplina comuna; vida de comunitat, celebraci� de la lit�rgia i oraci� privada, compliment dels vots, l\'estudi assidu de la veritat i del misteri apost�lic.</p><p>Sovint eren elegits per a dirigir la Inquisici�.</p>'),
('dom','en','Dominican','<p>Founded by Santo Domingo de Guzm�n in 1215.</p><p>They are preaching friars, they are born for the preaching of the word of God and for the salvation of the souls.</p><p>They are characterized to take a life in common, by the extension of its Church by means of Evangelical Advice and by its dedication to the Regular Observation, that regulates its communitarian life.</p><p>All these elements integrate the Dominican life and they regulate it by means of a common discipline; life of community, celebration of the liturgy and deprived oration, fulfillment of the votes, the assiduous study of the truth and the apostolic mystery.</p><p>Often they were chosen to direct the Inquisici�n.</p>'),
('dom','es','Dominicos','<p>Fundada por Santo Domingo de Guzm�n en el a�o 1215.</p><p>Son frailes predicadores, nacen para la predicaci�n de la palabra de Dios y para la salvaci�n de las almas.</p><p>Se caracterizan por llevar una vida en com�n, por la extensi�n de su Iglesia mediante Consejos Evang�licos y por su dedicaci�n a la Observaci�n Regular, que regula su vida comunitaria</p><p>Todos estos elementos integran la vida dominicana y la regulan mediante una disciplina com�n; vida de comunidad, celebraci�n de la liturgia y oraci�n privada, cumplimiento de los votos, el estudio asiduo de la verdad y del misterio apost�lico.</p><p>A menudo eran elegidos para dirigir la Inquisici�n.</p>');
/*!40000 ALTER TABLE `_CLANT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `_CLIMA`
--

DROP TABLE IF EXISTS `_CLIMA`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `_CLIMA` (
  `REGIONID` int(11) NOT NULL DEFAULT 0,
  `PERIODO` int(11) NOT NULL DEFAULT 0,
  `TEMPERATURA` int(11) DEFAULT NULL,
  `CLIMA` int(11) DEFAULT NULL,
  PRIMARY KEY (`REGIONID`,`PERIODO`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_CLIMA`
--

LOCK TABLES `_CLIMA` WRITE;
/*!40000 ALTER TABLE `_CLIMA` DISABLE KEYS */;
INSERT INTO `_CLIMA` VALUES
(1,1,18,NULL),
(1,2,18,NULL),
(1,3,18,NULL),
(1,4,18,NULL),
(1,5,18,NULL),
(1,6,18,NULL),
(1,7,18,NULL),
(1,8,18,NULL),
(1,9,18,NULL),
(1,10,18,NULL),
(1,11,18,NULL),
(1,12,18,NULL);
/*!40000 ALTER TABLE `_CLIMA` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `_COSTE_EDIFICIO`
--

DROP TABLE IF EXISTS `_COSTE_EDIFICIO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `_COSTE_EDIFICIO` (
  `TIPOEDIFICIOID` char(3) NOT NULL DEFAULT '',
  `RECURSOID` char(3) NOT NULL DEFAULT '',
  `CANTIDAD` double NOT NULL DEFAULT 0,
  PRIMARY KEY (`TIPOEDIFICIOID`,`RECURSOID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_COSTE_EDIFICIO`
--

LOCK TABLES `_COSTE_EDIFICIO` WRITE;
/*!40000 ALTER TABLE `_COSTE_EDIFICIO` DISABLE KEYS */;
INSERT INTO `_COSTE_EDIFICIO` VALUES
('alm','hie',0.1),
('alm','mad',2),
('alm','oro',250),
('auc','hie',0.1),
('auc','mad',0.5),
('auc','oro',5000),
('auc','pie',5),
('bib','hie',0.2),
('bib','mad',1),
('bib','oro',10000),
('bib','pie',10),
('cal','mad',0.5),
('cal','oro',250),
('cal','pie',0.5),
('cla','hie',0.25),
('cla','mad',0.75),
('cla','oro',250),
('cla','pie',10),
('coc','hie',0.5),
('coc','mad',0.5),
('coc','oro',250),
('coc','pie',5),
('cor','hie',0.2),
('cor','mad',0.5),
('cor','oro',2500),
('cor','pie',5),
('cua','hie',0.1),
('cua','mad',1),
('cua','oro',250),
('dor','hie',0.1),
('dor','mad',1.5),
('dor','oro',250),
('dor','pie',5),
('enf','hie',0.2),
('enf','mad',0.5),
('enf','oro',1500),
('enf','pie',2),
('esc','hie',1),
('esc','mad',0.5),
('esc','oro',10000),
('esc','pie',10),
('gra','hie',0.2),
('gra','mad',1),
('gra','oro',500),
('gra','pie',0.5),
('grn','hie',0.1),
('grn','mad',1),
('grn','oro',250),
('hos','hie',0.2),
('hos','mad',0.5),
('hos','oro',5000),
('hos','pie',5),
('hue','hie',0.1),
('hue','mad',0.5),
('hue','oro',250),
('igl','hie',0.2),
('igl','mad',0.2),
('igl','oro',2500),
('igl','pie',10),
('lav','mad',0.5),
('lav','oro',250),
('mol','hie',0.1),
('mol','mad',1),
('mol','oro',500),
('mol','pie',1),
('mur','hie',0.5),
('mur','mad',2),
('mur','oro',2500),
('mur','pie',50),
('nov','hie',0.5),
('nov','mad',0.5),
('nov','oro',2500),
('nov','pie',5),
('or','hie',1),
('ora','hie',0.75),
('ora','mad',0.25),
('ora','oro',250),
('ora','pie',10),
('ref','hie',0.25),
('ref','mad',0.25),
('ref','oro',250),
('ref','pie',10),
('sot','hie',0.1),
('sot','mad',0.2),
('sot','oro',1000),
('sot','pie',2),
('tar','hie',0.1),
('tar','mad',1),
('tar','oro',750),
('tar','pie',0.5),
('tco','hie',0.2),
('tco','mad',0.2),
('tco','oro',750),
('tco','pie',2);
/*!40000 ALTER TABLE `_COSTE_EDIFICIO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `_EDIFICIO_TIPO`
--

DROP TABLE IF EXISTS `_EDIFICIO_TIPO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `_EDIFICIO_TIPO` (
  `TIPOEDIFICIOID` char(3) NOT NULL DEFAULT '',
  `TIEMPO_CONSTRUCCION` int(11) DEFAULT NULL,
  `ICONO` varchar(255) DEFAULT NULL,
  `ESTADOS` tinyint(4) NOT NULL DEFAULT 0,
  `ASIGNACIONES` tinyint(4) NOT NULL DEFAULT 0,
  `SEMANAL` tinyint(4) NOT NULL DEFAULT 0,
  PRIMARY KEY (`TIPOEDIFICIOID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_EDIFICIO_TIPO`
--

LOCK TABLES `_EDIFICIO_TIPO` WRITE;
/*!40000 ALTER TABLE `_EDIFICIO_TIPO` DISABLE KEYS */;
INSERT INTO `_EDIFICIO_TIPO` VALUES
('alm',360,'imagenes/accion/edificios.gif',0,0,0),
('auc',4320,'imagenes/accion/edificios.gif',0,0,0),
('bib',2160,'imagenes/edificio/biblioteca.gif',0,0,0),
('cal',360,'imagenes/accion/edificios.gif',0,0,0),
('cla',2160,'imagenes/edificio/claustro.gif',0,0,0),
('coc',720,'imagenes/edificio/cocina.gif',0,0,1),
('cor',720,'imagenes/edificio/coro.gif',0,0,0),
('cua',360,'imagenes/accion/edificios.gif',0,0,0),
('dor',720,'imagenes/edificio/dormitorio.gif',0,0,0),
('enf',2160,'imagenes/edificio/enfermeria.gif',0,0,0),
('esc',4320,'imagenes/accion/edificios.gif',0,0,0),
('gra',720,'imagenes/accion/edificios.gif',0,0,0),
('grn',360,'imagenes/accion/edificios.gif',0,0,0),
('hos',2160,'imagenes/edificio/hostal.gif',0,0,0),
('hue',360,'imagenes/accion/edificios.gif',1,0,0),
('igl',4320,'imagenes/edificio/iglesia.gif',0,0,0),
('lav',360,'imagenes/edificio/retretes.gif',0,0,0),
('mol',2160,'imagenes/accion/edificios.gif',0,0,0),
('mur',8640,'imagenes/accion/edificios.gif',0,0,0),
('nov',2160,'imagenes/accion/edificios.gif',0,0,0),
('ora',2160,'imagenes/edificio/oratorio.gif',0,0,0),
('ref',720,'imagenes/edificio/refectorio.gif',0,0,0),
('sot',2160,'imagenes/accion/edificios.gif',0,0,1),
('tar',2160,'imagenes/edificio/taller_artesania.gif',0,0,1),
('tco',360,'imagenes/edificio/sastreria.gif',0,0,1);
/*!40000 ALTER TABLE `_EDIFICIO_TIPO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `_EDIFICIO_TIPOT`
--

DROP TABLE IF EXISTS `_EDIFICIO_TIPOT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `_EDIFICIO_TIPOT` (
  `IDIOMAID` char(2) NOT NULL DEFAULT '',
  `TIPOEDIFICIOID` char(3) NOT NULL DEFAULT '',
  `DESCRIPCION` longtext DEFAULT NULL,
  PRIMARY KEY (`IDIOMAID`,`TIPOEDIFICIOID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_EDIFICIO_TIPOT`
--

LOCK TABLES `_EDIFICIO_TIPOT` WRITE;
/*!40000 ALTER TABLE `_EDIFICIO_TIPOT` DISABLE KEYS */;
INSERT INTO `_EDIFICIO_TIPOT` VALUES
('ca','alm','Magatzem'),
('ca','auc','Aula Capitular'),
('ca','bib','Biblioteca'),
('ca','cal','Calefactori'),
('ca','cla','Claustre'),
('ca','coc','Cuina'),
('ca','cor','Cor'),
('ca','cua','Quadra'),
('ca','dor','Dormitoris'),
('ca','enf','Infermeria'),
('ca','esc','Escola'),
('ca','gra','Granja'),
('ca','grn','Graner'),
('ca','hos','Hostal'),
('ca','hue','Hort'),
('ca','igl','Esgl�sia'),
('ca','lav','Lavabos'),
('ca','mol','Mol�'),
('ca','mur','Murs'),
('ca','nov','Noviciat'),
('ca','ora','Oratori'),
('ca','ref','Refetor'),
('ca','sot','Soterranis'),
('ca','tar','Taller d\'artesania'),
('ca','tco','Taller de Costura'),
('en','alm','Warehouse'),
('en','auc','*=*Aula Capitular'),
('en','bib','Library'),
('en','cal','Heating room'),
('en','cla','Cloister'),
('en','coc','Kitchen'),
('en','cor','Choir'),
('en','cua','Stable'),
('en','dor','Dormitories'),
('en','enf','Infirmary'),
('en','esc','School'),
('en','gra','Farm'),
('en','grn','Barn'),
('en','hos','Inn'),
('en','hue','Orchard'),
('en','igl','Church'),
('en','lav','Washbasins'),
('en','mol','Mill'),
('en','mur','Walls'),
('en','nov','Novitiate'),
('en','ora','Oratory'),
('en','ref','Refectory'),
('en','sot','Cellars'),
('en','tar','Factory of Crafts'),
('en','tco','Seam factory'),
('es','alm','Almac�n'),
('es','auc','Aula Capitular'),
('es','bib','Biblioteca'),
('es','cal','Calefactorio'),
('es','cla','Claustro'),
('es','coc','Cocina'),
('es','cor','Coro'),
('es','cua','Cuadra'),
('es','dor','Dormitorios'),
('es','enf','Enfermer�a'),
('es','esc','Escuela'),
('es','gra','Granja'),
('es','grn','Granero'),
('es','hos','Hostal'),
('es','hue','Huerta'),
('es','igl','Iglesia'),
('es','lav','Lavabos'),
('es','mol','Molino'),
('es','mur','Muros'),
('es','nov','Noviciado'),
('es','ora','Oratorio'),
('es','ref','Refectorio'),
('es','sot','S�tanos'),
('es','tar','Taller de Artesan�a'),
('es','tco','Taller de Costura');
/*!40000 ALTER TABLE `_EDIFICIO_TIPOT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `_ESCANDALLO`
--

DROP TABLE IF EXISTS `_ESCANDALLO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `_ESCANDALLO` (
  `RECURSOID` char(3) NOT NULL DEFAULT '',
  `ACTIVIDADID` char(3) NOT NULL DEFAULT '',
  `RECURSO2ID` char(3) NOT NULL DEFAULT '',
  `NECESIDAD_MINIMA` double NOT NULL DEFAULT 0,
  `NECESIDAD_MAXIMA` double NOT NULL DEFAULT 0,
  PRIMARY KEY (`RECURSOID`,`ACTIVIDADID`,`RECURSO2ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci COMMENT='Escandallo de Creaci�n de Recursos';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_ESCANDALLO`
--

LOCK TABLES `_ESCANDALLO` WRITE;
/*!40000 ALTER TABLE `_ESCANDALLO` DISABLE KEYS */;
INSERT INTO `_ESCANDALLO` VALUES
('hab','con','nla',0.5,0.8),
('cru','art','mad',0.0001,0.0002),
('vas','art','mad',0.0000001,0.0000001),
('alf','art','mad',0.0000001,0.0000001),
('m01','coc','cpl',0.25,0.25),
('hcn','mol','ccn',1.02,1.12),
('m05','coc','cja',0.2,0.3),
('m02','coc','cre',0.2,0.35),
('htr','mol','ctg',1.02,1.12),
('m04','coc','cpe',0.15,0.225),
('m03','coc','cli',0.2,0.3),
('pbl','hor','htr',0.5,0.6),
('m06','coc','pes',0.15,0.17),
('m06','coc','mrc',0.21,0.25),
('m07','coc','hug',0.167,0.25),
('qva','fqu','cua',0.01,0.012),
('qva','fqu','lva',1.25,1.5),
('qca','fqu','cua',0.01,0.012),
('qca','fqu','lca',1.25,1.5),
('qov','fqu','cua',0.01,0.012),
('qov','fqu','lov',1,1.2),
('m05','coc','pbl',0.2,0.3),
('m07','coc','pbl',0.2,0.3);
/*!40000 ALTER TABLE `_ESCANDALLO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `_ESTADO`
--

DROP TABLE IF EXISTS `_ESTADO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `_ESTADO` (
  `ESTADOID` char(3) NOT NULL DEFAULT '',
  `ORDEN` tinyint(4) NOT NULL DEFAULT 0,
  `RECURSO` tinyint(4) NOT NULL DEFAULT 0,
  PRIMARY KEY (`ESTADOID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_ESTADO`
--

LOCK TABLES `_ESTADO` WRITE;
/*!40000 ALTER TABLE `_ESTADO` DISABLE KEYS */;
INSERT INTO `_ESTADO` VALUES
('bru',0,0),
('ara',1,0),
('sem',2,1),
('cos',3,1),
('mad',4,1),
('pla',2,1),
('fru',3,1);
/*!40000 ALTER TABLE `_ESTADO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `_ESTADOT`
--

DROP TABLE IF EXISTS `_ESTADOT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `_ESTADOT` (
  `ESTADOID` char(3) NOT NULL DEFAULT '',
  `IDIOMAID` char(2) NOT NULL DEFAULT '',
  `NOMBRE` varchar(32) NOT NULL DEFAULT '',
  PRIMARY KEY (`ESTADOID`,`IDIOMAID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_ESTADOT`
--

LOCK TABLES `_ESTADOT` WRITE;
/*!40000 ALTER TABLE `_ESTADOT` DISABLE KEYS */;
INSERT INTO `_ESTADOT` VALUES
('bru','es','Virgen'),
('ara','es','Arado'),
('sem','es','Sembrado'),
('cos','es','Cosechable'),
('pla','es','Plantado'),
('fru','es','Fructificado'),
('mad','es','Maduro'),
('alm','es','Almacenado');
/*!40000 ALTER TABLE `_ESTADOT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `_ESTADO_RECURSO`
--

DROP TABLE IF EXISTS `_ESTADO_RECURSO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `_ESTADO_RECURSO` (
  `TIPOEDIFICIOID` char(3) NOT NULL DEFAULT '',
  `RECURSOID` char(3) NOT NULL DEFAULT '',
  `ORDEN` tinyint(4) NOT NULL DEFAULT 0,
  `ORIGENID` char(3) NOT NULL DEFAULT '',
  `DESTINOID` char(3) NOT NULL DEFAULT '',
  `ACTIVIDADID` char(3) DEFAULT NULL,
  PRIMARY KEY (`TIPOEDIFICIOID`,`RECURSOID`,`ORIGENID`,`ORDEN`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci COMMENT='Estados por Tipos de Recursos';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_ESTADO_RECURSO`
--

LOCK TABLES `_ESTADO_RECURSO` WRITE;
/*!40000 ALTER TABLE `_ESTADO_RECURSO` DISABLE KEYS */;
INSERT INTO `_ESTADO_RECURSO` VALUES
('hue','pla',4,'cos','bru','cos'),
('hue','',1,'bru','ara','ara'),
('hue','',2,'ara','sem','sem'),
('hue','pla',3,'sem','cos',NULL),
('hue','pla',5,'cos','mad',NULL),
('hue','arb',0,'fru','bru','dpl'),
('hue','',2,'bru','pla','pla'),
('hue','arb',3,'pla','fru',NULL),
('hue','arb',4,'fru','mad',NULL),
('hue','pla',4,'mad','bru','cos'),
('hue','arb',0,'mad','bru','dpl'),
('hue','arb',2,'fru','pla','cos'),
('hue','arb',2,'mad','pla','cos');
/*!40000 ALTER TABLE `_ESTADO_RECURSO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `_ESTILO`
--

DROP TABLE IF EXISTS `_ESTILO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `_ESTILO` (
  `ESTILOID` varchar(32) NOT NULL DEFAULT '',
  `NOMBRE` varchar(32) DEFAULT NULL,
  `FICHERO` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ESTILOID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci COMMENT='Tabla de Estilos Web para el Juego';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_ESTILO`
--

LOCK TABLES `_ESTILO` WRITE;
/*!40000 ALTER TABLE `_ESTILO` DISABLE KEYS */;
INSERT INTO `_ESTILO` VALUES
('fuego','Fuego','css/Fuego.css'),
('blue','SilverBlue','css/Azul.css');
/*!40000 ALTER TABLE `_ESTILO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `_EVENTO_DECISION`
--

DROP TABLE IF EXISTS `_EVENTO_DECISION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `_EVENTO_DECISION` (
  `EVENTO_TIPOID` char(6) NOT NULL DEFAULT '',
  `ORDEN` int(10) unsigned NOT NULL DEFAULT 0,
  `ACCION` char(6) NOT NULL DEFAULT '',
  `CANTIDAD` double NOT NULL DEFAULT 0,
  PRIMARY KEY (`EVENTO_TIPOID`,`ORDEN`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_EVENTO_DECISION`
--

LOCK TABLES `_EVENTO_DECISION` WRITE;
/*!40000 ALTER TABLE `_EVENTO_DECISION` DISABLE KEYS */;
INSERT INTO `_EVENTO_DECISION` VALUES
('cosmal',1,'don',1000),
('cosmal',2,'don',500),
('cosmal',3,'don',0);
/*!40000 ALTER TABLE `_EVENTO_DECISION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `_EVENTO_EFECTO`
--

DROP TABLE IF EXISTS `_EVENTO_EFECTO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `_EVENTO_EFECTO` (
  `EVENTO_TIPOID` char(6) NOT NULL DEFAULT '',
  `ORDEN` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `TIPO` char(3) NOT NULL DEFAULT '',
  `CARACTERISTICAID` char(3) NOT NULL DEFAULT '',
  `CALCULO` char(3) NOT NULL DEFAULT '',
  `PARAMETRO1` double NOT NULL DEFAULT 0,
  `PARAMETRO2` double NOT NULL DEFAULT 0,
  PRIMARY KEY (`EVENTO_TIPOID`,`ORDEN`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_EVENTO_EFECTO`
--

LOCK TABLES `_EVENTO_EFECTO` WRITE;
/*!40000 ALTER TABLE `_EVENTO_EFECTO` DISABLE KEYS */;
/*!40000 ALTER TABLE `_EVENTO_EFECTO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `_EVENTO_TIPO`
--

DROP TABLE IF EXISTS `_EVENTO_TIPO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `_EVENTO_TIPO` (
  `EVENTO_TIPOID` char(6) NOT NULL DEFAULT '',
  `PERIODICIDAD` double NOT NULL DEFAULT 0,
  `MENSAJE_TIPOID` char(6) NOT NULL DEFAULT '',
  `ALCANCE` char(3) NOT NULL DEFAULT '',
  PRIMARY KEY (`EVENTO_TIPOID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_EVENTO_TIPO`
--

LOCK TABLES `_EVENTO_TIPO` WRITE;
/*!40000 ALTER TABLE `_EVENTO_TIPO` DISABLE KEYS */;
INSERT INTO `_EVENTO_TIPO` VALUES
('terrem',17520,'terrem','reg'),
('incedi',720,'incedi','edi'),
('accoci',720,'accoci','edi'),
('peregr',1,'peregr','eqi'),
('homenf',1,'homenf','hom'),
('cosmal',17520,'cosmal','eqi');
/*!40000 ALTER TABLE `_EVENTO_TIPO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `_EVENTO_TIPOT`
--

DROP TABLE IF EXISTS `_EVENTO_TIPOT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `_EVENTO_TIPOT` (
  `EVENTO_TIPOID` varchar(6) NOT NULL DEFAULT '',
  `IDIOMAID` char(2) NOT NULL DEFAULT '',
  `DESCRIPCION` longtext NOT NULL,
  PRIMARY KEY (`EVENTO_TIPOID`,`IDIOMAID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_EVENTO_TIPOT`
--

LOCK TABLES `_EVENTO_TIPOT` WRITE;
/*!40000 ALTER TABLE `_EVENTO_TIPOT` DISABLE KEYS */;
INSERT INTO `_EVENTO_TIPOT` VALUES
('cosmal','es','El mal tiempo ha afectado a las cosechas de tu ciudad. Los aldeanos pasar�n hambre si no los ayudas');
/*!40000 ALTER TABLE `_EVENTO_TIPOT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `_IDIOMA`
--

DROP TABLE IF EXISTS `_IDIOMA`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `_IDIOMA` (
  `IDIOMAID` char(2) NOT NULL DEFAULT '',
  `DESCRIPCION` varchar(32) DEFAULT NULL,
  `FORMATO_FECHA` varchar(20) NOT NULL DEFAULT '',
  `SEPARADOR_DECIMAL` char(1) NOT NULL DEFAULT ',',
  `SEPARADOR_MILES` char(1) NOT NULL DEFAULT '.',
  PRIMARY KEY (`IDIOMAID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci COMMENT='Idiomas aceptados por el sistema';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_IDIOMA`
--

LOCK TABLES `_IDIOMA` WRITE;
/*!40000 ALTER TABLE `_IDIOMA` DISABLE KEYS */;
INSERT INTO `_IDIOMA` VALUES
('es','Castellano','d-M-Y',',','.'),
('ca','Catal�','d-M-Y',',','.'),
('en','English','M-d-Y','.',',');
/*!40000 ALTER TABLE `_IDIOMA` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `_MENSAJE_TIPO`
--

DROP TABLE IF EXISTS `_MENSAJE_TIPO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `_MENSAJE_TIPO` (
  `MENSAJE_TIPOID` varchar(6) NOT NULL DEFAULT '',
  `DURACION` int(11) NOT NULL DEFAULT 2880,
  `TIPO1` char(2) DEFAULT NULL,
  `ENLACE1` varchar(255) DEFAULT NULL,
  `TIPO2` char(2) DEFAULT NULL,
  `ENLACE2` varchar(255) DEFAULT NULL,
  `TIPO3` char(2) DEFAULT NULL,
  `ENLACE3` varchar(255) DEFAULT NULL,
  `TIPO4` char(2) DEFAULT NULL,
  `ENLACE4` varchar(255) DEFAULT NULL,
  `EMAIL` tinyint(4) NOT NULL DEFAULT 0,
  `PRINCIPAL` tinyint(4) NOT NULL DEFAULT 0,
  PRIMARY KEY (`MENSAJE_TIPOID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci COMMENT='Tipos de Mensaje del Sistema.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_MENSAJE_TIPO`
--

LOCK TABLES `_MENSAJE_TIPO` WRITE;
/*!40000 ALTER TABLE `_MENSAJE_TIPO` DISABLE KEYS */;
INSERT INTO `_MENSAJE_TIPO` VALUES
('comefe',168,'cn',NULL,'ur',NULL,'re',NULL,NULL,NULL,0,0),
('conedi',2880,'te',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0),
('crehom',2880,'hm','hombre.php?hombreID=',NULL,NULL,NULL,NULL,NULL,NULL,0,0),
('crequi',2880,'eq',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0),
('faledi',168,'hm','hombre.php?hombreID=','ac',NULL,'te','construirEdificio.php?tipoEdificioID=',NULL,NULL,0,0),
('falrec',168,'hm','hombre.php?hombreID=','ac',NULL,'re',NULL,NULL,NULL,0,0),
('fataco',2880,'hm','hombre.php?hombreID=',NULL,NULL,NULL,NULL,NULL,NULL,0,0),
('homfal',2880,'hm','hombre.php?hombreID=',NULL,NULL,NULL,NULL,NULL,NULL,1,1),
('merbor',168,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0),
('mercom',168,'cn',NULL,'ur',NULL,'re',NULL,NULL,NULL,0,0),
('merven',168,'cn',NULL,'ur',NULL,'re',NULL,NULL,NULL,0,0),
('novfor',2880,'hm','hombre.php?hombreID=',NULL,NULL,NULL,NULL,NULL,NULL,1,0),
('recbau',168,'ru',NULL,'rn',NULL,NULL,NULL,NULL,NULL,0,0),
('reccad',168,'cn',NULL,'um',NULL,'re',NULL,NULL,NULL,0,0),
('recdon',168,'cn',NULL,'ur',NULL,'re',NULL,NULL,NULL,0,0),
('recgen',2880,'hm','hombre.php?hombreID=','cn',NULL,'um',NULL,'re',NULL,0,0),
('subbor',168,'ru',NULL,'rn',NULL,NULL,NULL,NULL,NULL,0,0),
('subcom',168,'ru',NULL,'rn',NULL,'cn',NULL,NULL,NULL,0,0),
('subeje',168,'ru',NULL,'rn',NULL,NULL,NULL,NULL,NULL,0,0),
('tarequ',2880,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0),
('tarhom',2880,'hm','hombre.php?hombreID=',NULL,NULL,NULL,NULL,NULL,NULL,0,0),
('venefe',168,'cn',NULL,'ur',NULL,'re',NULL,NULL,NULL,0,0);
/*!40000 ALTER TABLE `_MENSAJE_TIPO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `_MENSAJE_TIPOT`
--

DROP TABLE IF EXISTS `_MENSAJE_TIPOT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `_MENSAJE_TIPOT` (
  `MENSAJE_TIPOID` varchar(6) NOT NULL DEFAULT '',
  `IDIOMAID` char(2) NOT NULL DEFAULT '',
  `GENERAL` varchar(32) DEFAULT NULL,
  `TEXTO` varchar(255) DEFAULT NULL,
  `EMAIL` longtext DEFAULT NULL,
  PRIMARY KEY (`IDIOMAID`,`MENSAJE_TIPOID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_MENSAJE_TIPOT`
--

LOCK TABLES `_MENSAJE_TIPOT` WRITE;
/*!40000 ALTER TABLE `_MENSAJE_TIPOT` DISABLE KEYS */;
INSERT INTO `_MENSAJE_TIPOT` VALUES
('comefe','ca',NULL,'La compra de &1 &2 de &3 s\'ha dut a terme.',NULL),
('conedi','ca','construcci�','Has construit un &1',NULL),
('crehom','ca','monjo','&1 ha estat enviat a les teves ordres perqu� t\'ajudi...',NULL),
('crequi','ca','monestir','Passes a ser el gestor del monestir &1. <B>NO T\'OBLIDIS D\'ASIGNAR TASQUES ALS TEUS MONJOS</B>',NULL),
('faledi','ca','falta edifici','&1 no ha pogut &2 doncs no hi ha &3 o be es ple.',NULL),
('falrec','ca','falta recurs','&1 no ha pogut &2 perque no hi ha &3.',NULL),
('fataco','ca','falta edifici','&1 renega disgustat: \'i on confecciono les vestimentes, en les meves estances?\'',NULL),
('homfal','ca','mort','Hi ha dol al teu monestir per la mort de &1. Descansi en pau.','Lamentem comunicar-te que el teu monjo &1 ha mort en la data del senyor &f. Els seus amics resar�n una preg�ria per la seva �nima.'),
('merbor','ca','esborrar cv','Has cancel�lat una compravenda.',NULL),
('mercom','ca','mercat compra','Has manat comprar &1 &2 de &3',NULL),
('merven','ca','posar venda','S\'han posat a la venda &1 &2 de &3',NULL),
('novfor','ca','Novici format','Has format al novici &1.',NULL),
('recbau','ca','bateig','Has bateijat al teu &1 com &2.',NULL),
('reccad','ca','recurs caducat','Han caducat &1 &2 de &3.',NULL),
('recdon','ca','Donaci�','Has donat &1 &2 de &3.',NULL),
('recgen','ca','recurs generat','&1 t\'ha generat &2 &3 de &4',NULL),
('tarequ','ca','tasques monestir','Has modificat les tasques setmanals del monestir.','Has modificat les tasques setmanals del monestir.'),
('tarhom','ca','tasques home','Has modificat les tasques setmanals de &1.','Has modificat les tasques setmanals de &1.'),
('venefe','ca',NULL,'La venda de &1 &2 de &3 s\'ha dut a terme.',NULL),
('comefe','en',NULL,'The purchase of &1 &2 of &3 has been carried out.',NULL),
('conedi','en','contruction','You have constructed a &1.',NULL),
('crehom','en','New Monk','&1 has been sent to your orders so that he helps you.',NULL),
('crequi','en','Welcome','Now you are the manager of the monastery &1.',NULL),
('faledi','en',NULL,'&1 has not been able to &2 since there is no &3 or it\'s full.',NULL),
('falrec','en',NULL,'&1 has not been able &2 because they lack &3.',NULL),
('homfal','en',NULL,'Your monastery is in mourning. &1 has passed away. Rest peacefully.',NULL),
('merbor','en',NULL,'You have cancelled a transaction.',NULL),
('mercom','en',NULL,'You have ordered to buy &1 &2 of &3.',NULL),
('merven','en',NULL,'You have put on sale &1 &2 of &3.',NULL),
('novfor','en',NULL,'You have formed to the beginner &1.',NULL),
('recbau','en',NULL,'You have baptized to your &1 like &2.',NULL),
('reccad','en',NULL,'&1 &2 of &3 have expired.',NULL),
('recdon','en',NULL,'You have donated &1 &2 of &3.',NULL),
('recgen','en',NULL,'&1 has generated you &2 &3 of &4.',NULL),
('subbor','en',NULL,'The auction of &1 &2 has not found buying.',NULL),
('subcom','en',NULL,'You have bought el/la &1 &2 in auction by &3.',NULL),
('subeje','en',NULL,'The auction of &1 &2 has been executed by &3.',NULL),
('tarequ','en',NULL,'You have modified the weekly tasks of the monastery.','You have modified the weekly tasks of the monastery.'),
('tarhom','en','Modified Tasks','You have modified the weekly tasks of &1.','You have modified the weekly tasks of &1.'),
('venefe','en',NULL,'The sale of &1 &2 of &3 has been carried out.',NULL),
('comefe','es','Compra efectuada','La compra de &1 &2 de &3 se ha llevado a cabo.',NULL),
('conedi','es','Edificio Construido','Has construido un &1.',NULL),
('crehom','es','Nuevo Monje','&1 ha sido enviado a tus �rdenes para que te ayude.',NULL),
('crequi','es','Bienvenida','Pasas a ser el gestor del monasterio &1. <B>NO TE OLVIDES DE ASIGNAR TAREAS A TUS MONJES</B>',NULL),
('faledi','es','Falta Edificio','&1 no ha podido &2 ya que no hay &3 o esta lleno/a.',NULL),
('falrec','es','Falta Recursos','&1 no ha podido &2 porque faltan &3.',NULL),
('fataco','es','falta edificio','&1 reniega disgustado: \'�y d�nde confecciono las vestimentas, en mis aposentos?\'',NULL),
('homfal','es','Fallecimiento','Tu monasterio esta de luto. &1 ha fallecido. Descanse en paz.','Lamentamos comunicarte que tu monje &1 ha fallecido en la fecha del se�or &f. Sus amigos rezar�n una oraci�n por su alma.'),
('merbor','es','compraventa borrada','Has cancelado una compraventa.',NULL),
('mercom','es','�rdenes compra','Has ordenado comprar &1 &2 de &3',NULL),
('merven','es','�rdenes venta','Se han puesto a la venta &1 &2 de &3.',NULL),
('novfor','es','Novicio formado','Has formado al novicio &1.',NULL),
('recbau','es','bautizo','Has bautizado a tu &1 como &2.',NULL),
('reccad','es','recurso caducado','Han caducado &1 &2 de &3.',NULL),
('recdon','es','Donaci�n','Has donado &1 &2 de &3.',NULL),
('recgen','es','Recursos creados','&1 te ha generado &2 &3 de &4',NULL),
('subbor','es','Subasta cancelada','La subasta del/de la &1 &2 no ha encontrado comprador.',NULL),
('subcom','es','Subasta a tu favor','Has comprado el/la &1 &2 en subasta por &3',NULL),
('subeje','es','Subasta ejecutada','La subasta del/de la &1 &2 ha sido ejecutada por &3.',NULL),
('tarequ','es','tareas monasterio','Has modificado las tareas semanales del monasterio.','Has modificado las tareas semanales del monasterio.'),
('tarhom','es','tareas hombre','Has modificado las tareas semanales de &1.','<html>\r\n<head>\r\n <title></title>\r\n</head>\r\n<body>\r\n<p>Has modificado las tareas semanales de &1.</p>\r\n</body>\r\n</html>'),
('venefe','es','ventas','La venta de &1 &2 de &3 se ha llevado a cabo.',NULL);
/*!40000 ALTER TABLE `_MENSAJE_TIPOT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `_NOMBRE`
--

DROP TABLE IF EXISTS `_NOMBRE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `_NOMBRE` (
  `TIPO` char(1) NOT NULL DEFAULT 'A',
  `NOMBREID` int(11) NOT NULL DEFAULT 0,
  `REGIONID` int(11) NOT NULL DEFAULT 0,
  `NOMBRE` varchar(32) NOT NULL DEFAULT '',
  PRIMARY KEY (`TIPO`,`NOMBREID`,`REGIONID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci COMMENT='Nombres autom�ticos para los monjes';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_NOMBRE`
--

LOCK TABLES `_NOMBRE` WRITE;
/*!40000 ALTER TABLE `_NOMBRE` DISABLE KEYS */;
INSERT INTO `_NOMBRE` VALUES
('A',1,0,'Abaceta'),
('A',2,0,'Abad'),
('A',3,0,'Abadal'),
('A',4,0,'Abadia'),
('A',5,0,'Abaigar'),
('A',6,0,'Abajo'),
('A',7,0,'Abalia'),
('A',8,0,'Abalsn'),
('A',9,0,'Abandames'),
('A',10,0,'Abande'),
('A',11,0,'Abando'),
('A',12,0,'Abandero'),
('A',13,0,'Abanderado'),
('A',14,0,'Abar'),
('A',15,0,'Abarca'),
('A',16,0,'Abaroa'),
('A',17,0,'Abarrategui'),
('A',18,0,'Abas'),
('A',19,0,'Abascal'),
('A',20,0,'Abasolo'),
('A',21,0,'Abastoa'),
('A',22,0,'Abat'),
('A',23,0,'Abaurre'),
('A',24,0,'Abaurrea'),
('A',25,0,'Abbad'),
('A',26,0,'Abecia'),
('A',27,0,'Abedillo'),
('A',28,0,'Abel'),
('A',29,0,'Abelasturi'),
('A',30,0,'Abelda'),
('A',31,0,'Abeli'),
('A',32,0,'Abella'),
('A',33,0,'Abellan'),
('A',34,0,'Abells'),
('A',35,0,'Abengoza'),
('A',36,0,'Abenza'),
('A',37,0,'Aberasturi'),
('A',38,0,'Abermn'),
('A',39,0,'Abia'),
('A',40,0,'Abiego'),
('A',41,0,'Abin'),
('A',42,0,'Abinia'),
('A',43,0,'Abio'),
('A',44,0,'Ablanedo'),
('A',45,0,'Abliu'),
('A',46,0,'Ablitas'),
('A',47,0,'Aboa'),
('A',48,0,'Abomn'),
('A',49,0,'Abraldez'),
('A',50,0,'Abrantes'),
('A',51,0,'Abrebo'),
('A',52,0,'Abregos'),
('A',53,0,'Abriu'),
('A',54,0,'Abriu'),
('A',55,0,'Abri'),
('A',56,0,'Abril'),
('A',57,0,'Abrines'),
('A',58,0,'Acaqo'),
('A',59,0,'Acebal'),
('A',60,0,'Acebedo-azevo'),
('A',61,0,'Acebes'),
('A',62,0,'Acebo'),
('A',63,0,'Acedo'),
('A',64,0,'Acega'),
('A',65,0,'Aceija'),
('A',66,0,'Aceituno'),
('A',67,0,'Acelamn'),
('A',68,0,'Acella'),
('A',69,0,'Acera'),
('A',70,0,'Acerete'),
('A',71,0,'Acero'),
('A',72,0,'Aceval'),
('A',73,0,'Acevedo'),
('A',74,0,'Acevillo'),
('A',75,0,'Acha'),
('A',76,0,'Achanove'),
('A',77,0,'Achega'),
('A',78,0,'Acheros'),
('A',79,0,'Acmbar'),
('A',80,0,'Acilu'),
('A',81,0,'Acitamn'),
('A',82,0,'Aco'),
('A',83,0,'Acoda'),
('A',84,0,'Acorella'),
('A',85,0,'Acosta'),
('A',86,0,'Acre'),
('A',87,0,'Acuavera'),
('A',88,0,'Acuqa'),
('A',89,0,'Acurio'),
('A',90,0,'Adaiz'),
('A',91,0,'Adalid'),
('A',92,0,'Adame'),
('A',93,0,'Adan'),
('A',94,0,'Adana'),
('A',95,0,'Adano'),
('A',96,0,'Adarbe'),
('A',97,0,'Adarrs'),
('A',98,0,'Adaves'),
('A',99,0,'Adebas'),
('A',100,0,'Adeliqo'),
('A',101,0,'Adell'),
('A',102,0,'Adelmsn'),
('A',103,0,'Adena'),
('A',104,0,'Adisn'),
('A',105,0,'Adoamn'),
('A',106,0,'Adorno'),
('A',107,0,'Adrian'),
('A',108,0,'Adurriaga'),
('A',109,0,'Aedo'),
('A',110,0,'Aelle'),
('A',111,0,'Aellos'),
('A',112,0,'Aenlle'),
('A',113,0,'Aenllo'),
('A',114,0,'Aeza'),
('A',115,0,'Afan de ribera'),
('A',116,0,'Afrontes'),
('A',117,0,'Agar'),
('A',118,0,'Agazones'),
('A',119,0,'Agea'),
('A',120,0,'Ager'),
('A',121,0,'Agss'),
('A',122,0,'Agosti'),
('A',123,0,'Agozti'),
('A',124,0,'Agramont'),
('A',125,0,'Agramunt'),
('A',126,0,'Agraz'),
('A',127,0,'Agreda'),
('A',128,0,'Agreda de tejada'),
('A',129,0,'Aguado'),
('A',130,0,'Aguas'),
('A',131,0,'Aguayo'),
('A',132,0,'Agudo'),
('A',133,0,'Agero'),
('A',134,0,'Aguerri'),
('A',135,0,'Aguiar'),
('A',136,0,'Aguiarte'),
('A',137,0,'Aguila'),
('A',138,0,'Aguila'),
('A',139,0,'Aguilar'),
('A',140,0,'Aguilera'),
('A',141,0,'Aguileta'),
('A',142,0,'Aguils'),
('A',143,0,'Aguilsn'),
('A',144,0,'Aguinaga'),
('A',145,0,'Aguinares'),
('A',146,0,'Aguirre'),
('A',147,0,'Aguirrea'),
('A',148,0,'Aguirrebengoa'),
('A',149,0,'Aguirregoitia'),
('A',150,0,'Aguirri'),
('A',151,0,'Aguisardo'),
('A',152,0,'Agulls'),
('A',153,0,'Agzndez'),
('A',154,0,'Agurbide'),
('A',155,0,'Agurto'),
('A',156,0,'Agustm'),
('A',157,0,'Agustmn'),
('A',158,0,'Agustina'),
('A',159,0,'Agusto'),
('A',160,0,'Ahajadas'),
('A',161,0,'Ahi'),
('A',162,0,'Ahsn'),
('A',163,0,'Ahones'),
('A',164,0,'Ahumada'),
('A',165,0,'Aibar'),
('A',166,0,'Aicaroz'),
('A',167,0,'Aicoz'),
('A',168,0,'Aillsn'),
('A',169,0,'Aillones'),
('A',170,0,'Aima'),
('A',171,0,'Aimar'),
('A',172,0,'Aimerich'),
('A',173,0,'Aineto'),
('A',174,0,'Ainsa'),
('A',175,0,'Aiqon'),
('A',176,0,'Aizaga'),
('A',177,0,'Aizpiri'),
('A',178,0,'Aizpuru'),
('A',179,0,'Aizpurza'),
('A',180,0,'Aja'),
('A',181,0,'Ajofrmn'),
('A',182,0,'Alabaina'),
('A',183,0,'Alagsn'),
('A',184,0,'Alaiz'),
('A',185,0,'Alajmn'),
('A',186,0,'Alambra'),
('A',187,0,'Alamo'),
('A',188,0,'Alanis'),
('A',189,0,'Alanzsn'),
('A',190,0,'Alapont'),
('A',191,0,'Alaraz'),
('A',192,0,'Alarcsn'),
('A',193,0,'Alas'),
('A',194,0,'Alava'),
('A',195,0,'Alazan'),
('A',196,0,'Alazsn'),
('A',197,0,'Alba'),
('A',198,0,'Albacete'),
('A',199,0,'Albalat'),
('A',200,0,'Albalate'),
('A',201,0,'Albamonte'),
('A',202,0,'Alban'),
('A',203,0,'Albaredo'),
('A',204,0,'Albarracmn'),
('A',205,0,'Albear'),
('A',206,0,'Alvear'),
('A',207,0,'Albiniz'),
('A',208,0,'Albentosa'),
('A',209,0,'Alberas'),
('A',210,0,'Alberca'),
('A',211,0,'Alberdi'),
('A',212,0,'Albergaria'),
('A',213,0,'Albermn'),
('A',214,0,'Albers'),
('A',215,0,'Alberola'),
('A',216,0,'Alberro'),
('A',217,0,'Albert'),
('A',218,0,'Alberti'),
('A',219,0,'Albertin'),
('A',220,0,'Alberto'),
('A',221,0,'Albiqana'),
('A',222,0,'Albistur'),
('A',223,0,'Albiz'),
('A',224,0,'Albizu'),
('A',225,0,'Albizza'),
('A',226,0,'Albo'),
('A',227,0,'Albocar'),
('A',228,0,'Albornoz'),
('A',229,0,'Albuquequer'),
('A',230,0,'Alburquerque'),
('A',231,0,'Alcamn'),
('A',232,0,'Alcala'),
('A',233,0,'Alcala-galiano'),
('A',234,0,'Alcalde'),
('A',235,0,'Alcanabe'),
('A',236,0,'Alcantara'),
('A',237,0,'Alcaqiz'),
('A',238,0,'Alcaraz'),
('A',239,0,'Alcate'),
('A',240,0,'Alcaudete'),
('A',241,0,'Alcazaba'),
('A',242,0,'Alcazar'),
('A',243,0,'Alcerreca'),
('A',244,0,'Alcmbar'),
('A',245,0,'Alcina'),
('A',246,0,'Alcober'),
('A',247,0,'Alcoberro'),
('A',248,0,'Alcocer'),
('A',249,0,'Alcolea'),
('A',250,0,'Alcoz'),
('A',251,0,'Alcubillo'),
('A',252,0,'Alcuza'),
('A',253,0,'Aldaba'),
('A',254,0,'Aldama'),
('A',255,0,'Aldana'),
('A',256,0,'Aldaola'),
('A',257,0,'Aldava'),
('A',258,0,'Aldazabal'),
('A',259,0,'Aldea'),
('A',260,0,'Aldecoa'),
('A',261,0,'Aldehuela'),
('A',262,0,'Alderete'),
('A',263,0,'Alduncin'),
('A',264,0,'Alea'),
('A',265,0,'Alegre'),
('A',266,0,'Alegrma'),
('A',267,0,'Aleiza'),
('A',268,0,'Alejandro'),
('A',269,0,'Aleman'),
('A',270,0,'Alemany'),
('A',271,0,'Alemparte'),
('A',272,0,'Alentsn'),
('A',273,0,'Alentorn'),
('A',274,0,'Alenzsn'),
('A',275,0,'Alexandre'),
('A',276,0,'Alfaro'),
('A',277,0,'Alfeiran'),
('A',278,0,'Alfirez'),
('A',279,0,'Alfonseca'),
('A',280,0,'Alfonsmn'),
('A',281,0,'Algarbe'),
('A',282,0,'Algarra'),
('A',283,0,'Algora'),
('A',284,0,'Alhaja'),
('A',285,0,'Alhama'),
('A',286,0,'Aliaga'),
('A',287,0,'Alicante'),
('A',288,0,'Alier'),
('A',289,0,'Aliers'),
('A',290,0,'Alija'),
('A',291,0,'Alis'),
('A',292,0,'Allande'),
('A',293,0,'Allende'),
('A',294,0,'Allendesalazar'),
('A',295,0,'Aller'),
('A',296,0,'Allo'),
('A',297,0,'Almagro'),
('A',298,0,'Almansa'),
('A',299,0,'Almanza'),
('A',300,0,'Almaraz'),
('A',301,0,'Almarza'),
('A',302,0,'Almazan'),
('A',303,0,'Almeida'),
('A',304,0,'Almela'),
('A',305,0,'Almena'),
('A',306,0,'Almenar'),
('A',307,0,'Almenara'),
('A',308,0,'Almeri'),
('A',309,0,'Almodsvar'),
('A',310,0,'Almonte'),
('A',311,0,'Almudivar'),
('A',312,0,'Almunia'),
('A',313,0,'Alona'),
('A',314,0,'Alonso'),
('A',315,0,'Alonso de barrasa'),
('A',316,0,'Alonso de hoyos'),
('A',317,0,'Alsriz'),
('A',318,0,'Alss'),
('A',319,0,'Alpedrete'),
('A',320,0,'Alpont'),
('A',321,0,'Alquiza'),
('A',322,0,'Alsamn'),
('A',323,0,'Alsedo'),
('A',324,0,'Alsina'),
('A',325,0,'Altamira'),
('A',326,0,'Altamirano'),
('A',327,0,'Altares'),
('A',328,0,'Altecha'),
('A',329,0,'Alteza'),
('A',330,0,'Alto'),
('A',331,0,'Altube'),
('A',332,0,'Altuna'),
('A',333,0,'Altuza'),
('A',334,0,'Altuya'),
('A',335,0,'Alvarado'),
('A',336,0,'Alvarez'),
('A',337,0,'Alvarez de toledo'),
('A',338,0,'Alvaro'),
('A',339,0,'Alvear'),
('A',340,0,'Alvira'),
('A',341,0,'Alza'),
('A',342,0,'Alzaga'),
('A',343,0,'Alzate'),
('A',344,0,'Alzina'),
('A',345,0,'Alzza'),
('A',346,0,'Alzueta'),
('A',347,0,'Amado'),
('A',348,0,'Amador'),
('A',349,0,'Amallo'),
('A',350,0,'Amar'),
('A',351,0,'Amarelle'),
('A',352,0,'Amarilla'),
('A',353,0,'Amasa'),
('A',354,0,'Amat'),
('A',355,0,'Amaya'),
('A',356,0,'Amaza'),
('A',357,0,'Amazada'),
('A',358,0,'Ambma'),
('A',359,0,'Amescoa'),
('A',360,0,'Amescua'),
('A',361,0,'Amezza'),
('A',362,0,'Amigo'),
('A',363,0,'Amigs'),
('A',364,0,'Amigo'),
('A',365,0,'Amilano'),
('A',366,0,'Amilibia'),
('A',367,0,'Amor'),
('A',368,0,'Amores'),
('A',369,0,'Amormn'),
('A',370,0,'Amorss'),
('A',371,0,'Amoroso'),
('A',372,0,'Ampudia'),
('A',373,0,'Ampuero'),
('A',374,0,'Ampurias'),
('A',375,0,'Anaya'),
('A',376,0,'Anchis'),
('A',377,0,'Anchieta'),
('A',378,0,'Anchsniz'),
('A',379,0,'Anchsriz'),
('A',380,0,'Ancilla'),
('A',381,0,'Anciso'),
('A',382,0,'Andagoya'),
('A',383,0,'Andalucma'),
('A',384,0,'Andaya'),
('A',385,0,'Andelos'),
('A',386,0,'Andma'),
('A',387,0,'Andina'),
('A',388,0,'Andisn'),
('A',389,0,'Andomn'),
('A',390,0,'Andrada'),
('A',391,0,'Andrade'),
('A',392,0,'Andrea'),
('A',393,0,'Andris'),
('A',394,0,'Andriu'),
('A',395,0,'Anduaga'),
('A',396,0,'Andueza'),
('A',397,0,'Anduga'),
('A',398,0,'Anero'),
('A',399,0,'Angel'),
('A',400,0,'Anglada'),
('A',401,0,'Anglis'),
('A',402,0,'Anglesola'),
('A',403,0,'Angos'),
('A',404,0,'Anguiano'),
('A',405,0,'Anguita'),
('A',406,0,'Angulo'),
('A',407,0,'Anieto'),
('A',408,0,'Aniz'),
('A',409,0,'Ansaldo'),
('A',410,0,'Ansoamn'),
('A',411,0,'Ansorena'),
('A',412,0,'Anszrez'),
('A',413,0,'Anta'),
('A',414,0,'Ansa'),
('A',415,0,'Antequera'),
('A',416,0,'Antich'),
('A',417,0,'Antmn'),
('A',418,0,'Antolmnez'),
('A',419,0,'Antsn'),
('A',420,0,'Antona'),
('A',421,0,'Antznez'),
('A',422,0,'Antuqano'),
('A',423,0,'Anyi'),
('A',424,0,'Anzuan'),
('A',425,0,'Aqasco'),
('A',426,0,'Aqsn'),
('A',427,0,'Aqorbe'),
('A',428,0,'Aoiz'),
('A',429,0,'Aparicio'),
('A',430,0,'Aponte'),
('A',431,0,'Ponte'),
('A',432,0,'Aquino'),
('A',433,0,'Arabe'),
('A',434,0,'Araceli'),
('A',435,0,'Araciel'),
('A',436,0,'Aracil'),
('A',437,0,'Arados'),
('A',438,0,'Aragall'),
('A',439,0,'Aragsn'),
('A',440,0,'Aragonis'),
('A',441,0,'Aramn'),
('A',442,0,'Araiz'),
('A',443,0,'Aramburu'),
('A',444,0,'Aramendma'),
('A',445,0,'Arana'),
('A',446,0,'Aranada'),
('A',447,0,'Aranaga'),
('A',448,0,'Arancibia'),
('A',449,0,'Aranda'),
('A',450,0,'Arandia'),
('A',451,0,'Arango'),
('A',452,0,'Aranguren'),
('A',453,0,'Arano'),
('A',454,0,'Aranza'),
('A',455,0,'Aranzadi'),
('A',456,0,'Aranzubia'),
('A',457,0,'Araoz'),
('A',458,0,'Araque'),
('A',459,0,'Ararte'),
('A',460,0,'Aras'),
('A',461,0,'Arauco'),
('A',462,0,'Araucoa'),
('A',463,0,'Arazjo'),
('A',464,0,'Arazu'),
('A',465,0,'Arbaiza'),
('A',466,0,'Arbe'),
('A',467,0,'Arbeiza'),
('A',468,0,'Arbelaez'),
('A',469,0,'Arbelaiz'),
('A',470,0,'Arbizu'),
('A',471,0,'Arbolea'),
('A',472,0,'Arboleda'),
('A',473,0,'Arboleya'),
('A',474,0,'Arbuis'),
('A',475,0,'Arcaine'),
('A',476,0,'Arcales'),
('A',477,0,'Arcas'),
('A',478,0,'De arcas'),
('A',479,0,'Arcaya'),
('A',480,0,'Arce'),
('A',481,0,'Arceo'),
('A',482,0,'Arcilla'),
('A',483,0,'Arcillero'),
('A',484,0,'Arco'),
('A',485,0,'Arcos'),
('A',486,0,'Ardanza'),
('A',487,0,'Ardena'),
('A',488,0,'Ardid'),
('A',489,0,'Arechavaleta'),
('A',490,0,'Areiceta'),
('A',491,0,'Areilza'),
('A',492,0,'Arellano'),
('A',493,0,'Arenal'),
('A',494,0,'Arenas'),
('A',495,0,'Arenillas'),
('A',496,0,'Ares'),
('A',497,0,'Aris'),
('A',498,0,'Arivalo'),
('A',499,0,'Arezo'),
('A',500,0,'Argaiz'),
('A',501,0,'Arganza'),
('A',502,0,'Arganzsn'),
('A',503,0,'Argoamn'),
('A',504,0,'Argomeda'),
('A',505,0,'Argote'),
('A',506,0,'Argudo'),
('A',507,0,'Argelles'),
('A',508,0,'Argello'),
('A',509,0,'Argumosa'),
('A',510,0,'Arias'),
('A',511,0,'Ariqo'),
('A',512,0,'Ariola'),
('A',513,0,'Arista'),
('A',514,0,'Aristi'),
('A',515,0,'Aristiguieta'),
('A',516,0,'Ariza'),
('A',517,0,'Arizabaleta'),
('A',518,0,'Arizmendi'),
('A',519,0,'Arjona'),
('A',520,0,'Armada'),
('A',521,0,'Armas'),
('A',522,0,'Armendariz'),
('A',523,0,'Armengol'),
('A',524,0,'Armenteros'),
('A',525,0,'Armero'),
('A',526,0,'Armijo'),
('A',527,0,'Arnaiz'),
('A',528,0,'Arnal'),
('A',529,0,'Arnao'),
('A',530,0,'Arnau'),
('A',531,0,'Arnaud'),
('A',532,0,'Arnauld'),
('A',533,0,'Arnedo'),
('A',534,0,'Arnero'),
('A',535,0,'Arnuero'),
('A',536,0,'Arquellada'),
('A',537,0,'Arquer'),
('A',538,0,'Arquero'),
('A',539,0,'Arquis'),
('A',540,0,'Arrabal'),
('A',541,0,'Arraiz'),
('A',542,0,'Arrate'),
('A',543,0,'Arrazola'),
('A',544,0,'Arreche'),
('A',545,0,'Arredondo'),
('A',546,0,'Arregui'),
('A',547,0,'Arrese'),
('A',548,0,'Arriaga'),
('A',549,0,'Arribas'),
('A',550,0,'Arrieta'),
('A',551,0,'Arrizabal'),
('A',552,0,'Arrom'),
('A',553,0,'Arroquia'),
('A',554,0,'Arroyo'),
('A',555,0,'Arrze'),
('A',556,0,'Arsoriz'),
('A',557,0,'Artal'),
('A',558,0,'Artasona'),
('A',559,0,'Arteaga'),
('A',560,0,'Arteche'),
('A',561,0,'Arteta'),
('A',562,0,'Artieda'),
('A',563,0,'Artigues'),
('A',564,0,'Artiqano'),
('A',565,0,'Artola'),
('A',566,0,'Artunduaga'),
('A',567,0,'Arturo'),
('A',568,0,'Arzubia'),
('A',569,0,'Ascanio'),
('A',570,0,'Ascaso'),
('A',571,0,'Asenjo'),
('A',572,0,'Asensio'),
('A',573,0,'Asiamn'),
('A',574,0,'Asmn'),
('A',575,0,'Asoaga'),
('A',576,0,'Aspiazu'),
('A',577,0,'Assas'),
('A',578,0,'Astorga'),
('A',579,0,'Asturias'),
('A',580,0,'Asza'),
('A',581,0,'Asuera'),
('A',582,0,'Ataide'),
('A',583,0,'Atalaya'),
('A',584,0,'Ataris'),
('A',585,0,'Atienza'),
('A',586,0,'Atocha'),
('A',587,0,'Atorella'),
('A',588,0,'Attard'),
('A',589,0,'Atxa'),
('A',590,0,'Atxera'),
('A',591,0,'Audivert'),
('A',592,0,'Aulestia'),
('A',593,0,'Auqon'),
('A',594,0,'Austria'),
('A',595,0,'Avalos'),
('A',596,0,'Avecilla'),
('A',597,0,'Avelda'),
('A',598,0,'De avella'),
('A',599,0,'Avellanada'),
('A',600,0,'Avellanal'),
('A',601,0,'Avellaneda'),
('A',602,0,'Avellano'),
('A',603,0,'Avendaqo'),
('A',604,0,'Avero'),
('A',605,0,'Avidave'),
('A',606,0,'Avila'),
('A',607,0,'De avila'),
('A',608,0,'Avilis'),
('A',609,0,'Axartell'),
('A',610,0,'Ayala'),
('A',611,0,'Ayensa'),
('A',612,0,'Ayerbe'),
('A',613,0,'Ayllsn'),
('A',614,0,'Ayma'),
('A',615,0,'Ayma'),
('A',616,0,'Aymar'),
('A',617,0,'Aymat'),
('A',618,0,'Aymerich'),
('A',619,0,'Ayuso'),
('A',620,0,'Aza'),
('A',621,0,'Azagra'),
('A',622,0,'Azaro'),
('A',623,0,'Azcarate'),
('A',624,0,'Azcarraga'),
('A',625,0,'Azcoa'),
('A',626,0,'Azcsn'),
('A',627,0,'Azcona'),
('A',628,0,'Azelm'),
('A',629,0,'Aznar'),
('A',630,0,'Azofra'),
('A',631,0,'Azor'),
('A',632,0,'Azorero'),
('A',633,0,'Azormn'),
('A',634,0,'Azpiazu'),
('A',635,0,'Azpilicueta'),
('A',636,0,'Azza'),
('A',638,0,'Babiano'),
('A',639,0,'Bacara'),
('A',640,0,'Bacazabal'),
('A',641,0,'Bada'),
('A',642,0,'Badais'),
('A',643,0,'Badma'),
('A',644,0,'Badma'),
('A',645,0,'Bado'),
('A',646,0,'Baena'),
('A',647,0,'Baez'),
('A',648,0,'Baeza'),
('A',649,0,'Baga'),
('A',650,0,'Baga'),
('A',651,0,'Bagarma'),
('A',652,0,'Bagos'),
('A',653,0,'Bagur'),
('A',654,0,'Bahamonde'),
('A',655,0,'Bahamonte'),
('A',656,0,'Bailin'),
('A',657,0,'Baillo'),
('A',658,0,'Baio'),
('A',659,0,'Bajuelo'),
('A',660,0,'Balades'),
('A',661,0,'Balaguer'),
('A',662,0,'Balanzs'),
('A',663,0,'Balbmn'),
('A',664,0,'Balboa'),
('A',665,0,'Balbuena'),
('A',666,0,'Baldenaches'),
('A',667,0,'Baldocinos'),
('A',668,0,'Baldor'),
('A',669,0,'Baldovinos'),
('A',670,0,'Balencegui'),
('A',671,0,'Ballastros'),
('A',672,0,'Ballenilla'),
('A',673,0,'Ballero'),
('A',674,0,'Ballester'),
('A',675,0,'Ballester'),
('A',676,0,'Ballestero'),
('A',677,0,'Ballesteros'),
('A',678,0,'Ballesteros'),
('A',679,0,'Ballet'),
('A',680,0,'Ballmn'),
('A',681,0,'Ballina'),
('A',682,0,'Balsa'),
('A',683,0,'Balsera'),
('A',684,0,'Baltodano'),
('A',685,0,'Balzola'),
('A',686,0,'Bances'),
('A',687,0,'Banda'),
('A',688,0,'La banda'),
('A',689,0,'Bandama'),
('A',690,0,'La bandera'),
('A',691,0,'Bandiola'),
('A',692,0,'Bandris'),
('A',693,0,'Bandris'),
('A',694,0,'Bandurraga'),
('A',695,0,'Banyuls'),
('A',696,0,'Baqales'),
('A',697,0,'Baqares'),
('A',698,0,'Baqos'),
('A',699,0,'Baquelos'),
('A',700,0,'Baquls'),
('A',701,0,'Basn'),
('A',702,0,'Baptista'),
('A',703,0,'Baquerma'),
('A',704,0,'Baquermn'),
('A',705,0,'Baquerizo'),
('A',706,0,'Baquero'),
('A',707,0,'Baracaldo'),
('A',708,0,'Barahona'),
('A',709,0,'Barazate'),
('A',710,0,'Barba'),
('A',711,0,'Barbadillo'),
('A',712,0,'Barbado'),
('A',713,0,'Barbaran'),
('A',714,0,'Barber'),
('A',715,0,'Barbera'),
('A',716,0,'Barberena'),
('A',717,0,'Barberma'),
('A',718,0,'Barbis'),
('A',719,0,'Barbier'),
('A',720,0,'Barbo'),
('A',721,0,'Barcaiztegui'),
('A',722,0,'Barcels'),
('A',723,0,'Barcelona'),
('A',724,0,'Barcena'),
('A',725,0,'Barcenilla'),
('A',726,0,'Barco'),
('A',727,0,'Barnuevo'),
('A',728,0,'Bars'),
('A',729,0,'Baroja'),
('A',730,0,'Barsn'),
('A',731,0,'Barquero'),
('A',732,0,'Barquin'),
('A',733,0,'Barquinero'),
('A',734,0,'Barra'),
('A',735,0,'Barrachina'),
('A',736,0,'Barragan'),
('A',737,0,'Barral'),
('A',738,0,'Barranco'),
('A',739,0,'Barrantes'),
('A',740,0,'Barrasa'),
('A',741,0,'Barrat'),
('A',742,0,'Barreda'),
('A',743,0,'Barredon'),
('A',744,0,'Barreira'),
('A',745,0,'Barrena'),
('A',746,0,'Barrenechea'),
('A',747,0,'Barrera'),
('A',748,0,'Barrero'),
('A',749,0,'Barreto'),
('A',750,0,'Barrientos'),
('A',751,0,'Barriga'),
('A',752,0,'Barrio'),
('A',753,0,'Barrionuevo'),
('A',754,0,'Barrios'),
('A',755,0,'Barrsn'),
('A',756,0,'Barros'),
('A',757,0,'Barroso'),
('A',758,0,'Barruelo'),
('A',759,0,'Barrutia'),
('A',760,0,'Bartomiu'),
('A',761,0,'Barver'),
('A',762,0,'Bas'),
('A',763,0,'Basa'),
('A',764,0,'Basacha'),
('A',765,0,'Bascones'),
('A',766,0,'Bascuqan'),
('A',767,0,'Bascuqana'),
('A',768,0,'Baset'),
('A',769,0,'Basoco'),
('A',770,0,'Basora'),
('A',771,0,'Basset'),
('A',772,0,'Bassol'),
('A',773,0,'Bassols'),
('A',774,0,'Bastard de la torre'),
('A',775,0,'Bastardo'),
('A',776,0,'Baster'),
('A',777,0,'Bastida'),
('A',778,0,'La bastida'),
('A',779,0,'Bastoncillo'),
('A',780,0,'Batalla'),
('A',781,0,'Batista'),
('A',782,0,'Batres'),
('A',783,0,'Bautista'),
('A',784,0,'Bayer'),
('A',785,0,'Boyer'),
('A',786,0,'Bayle'),
('A',787,0,'Bayo'),
('A',788,0,'Baysn'),
('A',789,0,'Bayona'),
('A',790,0,'Bazan'),
('A',791,0,'Bazo'),
('A',792,0,'Bea'),
('A',793,0,'Beasoamn'),
('A',794,0,'Beaumont'),
('A',795,0,'Becerra'),
('A',796,0,'Becerril'),
('A',797,0,'Bicquer'),
('A',798,0,'Bedia'),
('A',799,0,'Bedmar'),
('A',800,0,'Bedoya'),
('A',801,0,'Bedua'),
('A',802,0,'Begur'),
('A',803,0,'Beitia'),
('A',804,0,'Bejarano'),
('A',805,0,'Belaochaga'),
('A',806,0,'Belaotxaga'),
('A',807,0,'Belart'),
('A',808,0,'Belda'),
('A',809,0,'Belestegui'),
('A',810,0,'Bellera'),
('A',811,0,'Bellet'),
('A',812,0,'Bellido'),
('A',813,0,'Bell-lloc'),
('A',814,0,'Bello'),
('A',815,0,'Belloch'),
('A',816,0,'Bellocs'),
('A',817,0,'Bellsn'),
('A',818,0,'Belloso'),
('A',819,0,'Bellpuig'),
('A',820,0,'Bellvehi'),
('A',821,0,'Bellver'),
('A',822,0,'Bellvms'),
('A',823,0,'Belmar'),
('A',824,0,'Belmonte'),
('A',825,0,'Beltran'),
('A',826,0,'Beltran de caicedo'),
('A',827,0,'Beltranilla'),
('A',828,0,'Benar'),
('A',829,0,'Benasar'),
('A',830,0,'Benavent'),
('A',831,0,'Benavente'),
('A',832,0,'Benavides'),
('A',833,0,'Beneche'),
('A',834,0,'Benet'),
('A',835,0,'Bengoa'),
('A',836,0,'Bengoechea'),
('A',837,0,'Bengoetxea'),
('A',838,0,'Benmtez'),
('A',839,0,'Benmtez de lugo'),
('A',840,0,'Benito'),
('A',841,0,'Benvengut'),
('A',842,0,'Beranga'),
('A',843,0,'Berard'),
('A',844,0,'Berarde'),
('A',845,0,'Berardo'),
('A',846,0,'Berart'),
('A',847,0,'Berarte'),
('A',848,0,'Beraza'),
('A',849,0,'Berdeja'),
('A',850,0,'Berenguel'),
('A',851,0,'Berenguer'),
('A',852,0,'Berganza'),
('A',853,0,'Berges'),
('A',854,0,'Bermejo'),
('A',855,0,'Bermeo'),
('A',856,0,'Bermzdez'),
('A',857,0,'Bermuiz'),
('A',858,0,'Bermuy'),
('A',859,0,'Berna'),
('A',860,0,'Bernabi'),
('A',861,0,'Bernabiu'),
('A',862,0,'Bernad'),
('A',863,0,'Bernal'),
('A',864,0,'Bernaldo'),
('A',865,0,'Bernales'),
('A',866,0,'Bernar'),
('A',867,0,'Bernat'),
('A',868,0,'Berniz'),
('A',869,0,'Bernuy'),
('A',870,0,'Berraondo'),
('A',871,0,'Berrocal'),
('A',872,0,'Berroeta'),
('A',873,0,'Berroy'),
('A',874,0,'Berruezo'),
('A',875,0,'Bervises'),
('A',876,0,'Berzosa'),
('A',877,0,'Bescss'),
('A',878,0,'Besora'),
('A',879,0,'Betanzos'),
('A',880,0,'Beteta'),
('A',881,0,'Bithencourt'),
('A',882,0,'Betoqo'),
('A',883,0,'Betron'),
('A',884,0,'Beyma'),
('A',885,0,'Bezado'),
('A',886,0,'Bezanilla'),
('A',887,0,'Biamonte'),
('A',888,0,'Bidasola'),
('A',889,0,'Biedma'),
('A',890,0,'Biesma'),
('A',891,0,'Biezma'),
('A',892,0,'Bilbao'),
('A',893,0,'Bisquerra'),
('A',894,0,'Bistui'),
('A',895,0,'Blanca'),
('A',896,0,'Blancas'),
('A',897,0,'Blanch'),
('A',898,0,'Blanco'),
('A',899,0,'Blandmn'),
('A',900,0,'Blanes'),
('A',901,0,'Blasco'),
('A',902,0,'Blay'),
('A',903,0,'Blazquez'),
('A',904,0,'Blecua'),
('A',905,0,'Boada'),
('A',906,0,'Boado'),
('A',907,0,'Boares'),
('A',908,0,'Boatella'),
('A',909,0,'Bobadilla'),
('A',910,0,'Bocos'),
('A',911,0,'Bodega'),
('A',912,0,'Bofill'),
('A',913,0,'Boga'),
('A',914,0,'Boguet'),
('A',915,0,'Bohorque'),
('A',916,0,'Bohorques'),
('A',917,0,'Boja'),
('A',918,0,'Bojedo'),
('A',919,0,'Bolado'),
('A',920,0,'Bolaqo'),
('A',921,0,'Bolaqos'),
('A',922,0,'Bolde'),
('A',923,0,'Bolea'),
('A',924,0,'Bolinaga'),
('A',925,0,'Bolmvar'),
('A',926,0,'Bolo'),
('A',927,0,'Bolss'),
('A',928,0,'Bonal'),
('A',929,0,'Bonapart'),
('A',930,0,'Bonaparte'),
('A',931,0,'Bonart'),
('A',932,0,'Bonet'),
('A',933,0,'Bonifaz'),
('A',934,0,'Bonilla'),
('A',935,0,'Bonmati'),
('A',936,0,'Bomatina'),
('A',937,0,'Boo'),
('A',938,0,'Borau'),
('A',939,0,'Borbolla'),
('A',940,0,'Borbsn'),
('A',941,0,'Bordallo'),
('A',942,0,'Bordmu'),
('A',943,0,'Borges'),
('A',944,0,'Bori'),
('A',945,0,'Borja'),
('A',946,0,'Borolla'),
('A',947,0,'Borrajo'),
('A',948,0,'Borras'),
('A',949,0,'Borrego'),
('A',950,0,'Borrel'),
('A',951,0,'Borrell'),
('A',952,0,'Bosch'),
('A',953,0,'Bote'),
('A',954,0,'Botella'),
('A',955,0,'Botinis'),
('A',956,0,'Bouffard'),
('A',957,0,'Bouffart'),
('A',958,0,'Boyer'),
('A',959,0,'Bracamonte'),
('A',960,0,'Bracho'),
('A',961,0,'Brandi'),
('A',962,0,'Brandis'),
('A',963,0,'Braqas'),
('A',964,0,'Brasco'),
('A',965,0,'Bravo'),
('A',966,0,'Breqa'),
('A',967,0,'Bretsn'),
('A',968,0,'Briceqo'),
('A',969,0,'Bringas'),
('A',970,0,'Briones'),
('A',971,0,'Briz'),
('A',972,0,'Brizuela'),
('A',973,0,'Broton'),
('A',974,0,'Bruguera'),
('A',975,0,'Brugueras'),
('A',976,0,'Bruzon'),
('A',977,0,'Buegas'),
('A',978,0,'Buendma'),
('A',979,0,'Bueno'),
('A',980,0,'Buerdo'),
('A',981,0,'Buitrago'),
('A',982,0,'Bujanda'),
('A',983,0,'Bulnes'),
('A',984,0,'Burbano'),
('A',985,0,'Burgoa'),
('A',986,0,'Burgos'),
('A',987,0,'Burguera'),
('A',988,0,'Burguis'),
('A',989,0,'Burguillo'),
('A',990,0,'Bursn'),
('A',991,0,'Burss'),
('A',992,0,'Burrell'),
('A',993,0,'Busquets'),
('A',994,0,'Bustamante'),
('A',995,0,'Bustillo'),
('A',996,0,'Busto'),
('A',997,0,'Bustos'),
('A',998,0,'Butrsn'),
('A',999,0,'Caba'),
('A',1000,0,'Caballa'),
('A',1001,0,'Caballer'),
('A',1002,0,'Caballera'),
('A',1003,0,'Caballerma'),
('A',1004,0,'De la caballerma'),
('A',1005,0,'Caballero'),
('A',1006,0,'Gaballos'),
('A',1007,0,'Cabanas'),
('A',1008,0,'Cabanillas'),
('A',1009,0,'Cabaqas'),
('A',1010,0,'Cabarcos'),
('A',1011,0,'Cabedo'),
('A',1012,0,'Cabello'),
('A',1013,0,'Cabero'),
('A',1014,0,'Cabeza de vaca'),
('A',1015,0,'Cabezas'),
('A',1016,0,'Cabezsn'),
('A',1017,0,'Cabezudo'),
('A',1018,0,'Cabiedes'),
('A',1019,0,'Cabo'),
('A',1020,0,'Cabra'),
('A',1021,0,'Cabra'),
('A',1022,0,'Cabral'),
('A',1023,0,'Cabrales'),
('A',1024,0,'Cabrales'),
('A',1025,0,'Cabrera'),
('A',1026,0,'Cabrero'),
('A',1027,0,'Cabrmo'),
('A',1028,0,'Caceres'),
('A',1029,0,'Cacho'),
('A',1030,0,'Cachupin'),
('A',1031,0,'Cacos'),
('A',1032,0,'Cadalla'),
('A',1033,0,'Cadalso'),
('A',1034,0,'Cadaval'),
('A',1035,0,'Cadena'),
('A',1036,0,'Cadenas'),
('A',1037,0,'Cadorra'),
('A',1038,0,'Cagiga'),
('A',1039,0,'Cagigal'),
('A',1040,0,'Camn'),
('A',1041,0,'Cajal'),
('A',1042,0,'Cal'),
('A',1043,0,'Calabaza'),
('A',1044,0,'Calahorra'),
('A',1045,0,'Calasanz'),
('A',1046,0,'Calatayud'),
('A',1047,0,'Calatrava'),
('A',1048,0,'Caldas'),
('A',1049,0,'Caldeira'),
('A',1050,0,'Caldelas'),
('A',1051,0,'Caldera'),
('A',1052,0,'Caldersn'),
('A',1053,0,'Caldiran'),
('A',1054,0,'Calella'),
('A',1055,0,'Calera'),
('A',1056,0,'Calero'),
('A',1057,0,'Calleja'),
('A',1058,0,'Callejsn'),
('A',1059,0,'Calles'),
('A',1060,0,'Calvet'),
('A',1061,0,'Calvillo'),
('A',1062,0,'Calvino'),
('A',1063,0,'Calvo'),
('A',1064,0,'Calzada'),
('A',1065,0,'Calzadilla'),
('A',1066,0,'Camacho'),
('A',1067,0,'Camara'),
('A',1068,0,'Camarena'),
('A',1069,0,'Camariqas'),
('A',1070,0,'Camars'),
('A',1071,0,'Camazsn'),
('A',1072,0,'Camba'),
('A',1073,0,'Camero'),
('A',1074,0,'Cameros'),
('A',1075,0,'Caminero'),
('A',1076,0,'Camino'),
('A',1077,0,'Camio'),
('A',1078,0,'Camissn'),
('A',1079,0,'Cammany'),
('A',1080,0,'Campa'),
('A',1081,0,'Campana'),
('A',1082,0,'Campano'),
('A',1083,0,'Campero'),
('A',1084,0,'Campillo'),
('A',1085,0,'Campo'),
('A',1086,0,'Del campo'),
('A',1087,0,'Campoamor'),
('A',1088,0,'Campofrio'),
('A',1089,0,'Campomanes'),
('A',1090,0,'Campoo'),
('A',1091,0,'Campos'),
('A',1092,0,'Campoy'),
('A',1093,0,'Campra'),
('A',1094,0,'Camps'),
('A',1095,0,'Campuzano'),
('A',1096,0,'Camus'),
('A',1097,0,'Canal'),
('A',1098,0,'La canal'),
('A',1099,0,'Canales'),
('A',1100,0,'Canales'),
('A',1101,0,'Canals'),
('A',1102,0,'Canares'),
('A',1103,0,'Canciller'),
('A',1104,0,'Cancino'),
('A',1105,0,'Canedo'),
('A',1106,0,'Canencia'),
('A',1107,0,'Canga'),
('A',1108,0,'Cangas'),
('A',1109,0,'Canillas'),
('A',1110,0,'Cano'),
('A',1111,0,'Canovas'),
('A',1112,0,'Canseco'),
('A',1113,0,'Cansino'),
('A',1114,0,'Cansinos'),
('A',1115,0,'Cancino'),
('A',1116,0,'Cantera'),
('A',1117,0,'Cantillo'),
('A',1118,0,'Cantolla'),
('A',1119,0,'Cantsn'),
('A',1120,0,'Caqas'),
('A',1121,0,'Caqavate'),
('A',1122,0,'Caqellas'),
('A',1123,0,'Caqete'),
('A',1124,0,'Caqizares'),
('A',1125,0,'Caparrss'),
('A',1126,0,'Capdevila'),
('A',1127,0,'Capilla'),
('A',1128,0,'Capmany'),
('A',1129,0,'Caral'),
('A',1130,0,'Caralt'),
('A',1131,0,'Carasa'),
('A',1132,0,'Carbajal'),
('A',1133,0,'Carbajo'),
('A',1134,0,'Carballo'),
('A',1135,0,'Carballo'),
('A',1136,0,'Carbaxal'),
('A',1137,0,'Carboni'),
('A',1138,0,'Carbonell'),
('A',1139,0,'Carcamo'),
('A',1140,0,'Carcedo'),
('A',1141,0,'Carcel'),
('A',1142,0,'Carcoba'),
('A',1143,0,'Carcova'),
('A',1144,0,'Cardenal'),
('A',1145,0,'Cardenas'),
('A',1146,0,'Cardeqa'),
('A',1147,0,'Cardil'),
('A',1148,0,'Cardona'),
('A',1149,0,'Careaga'),
('A',1150,0,'Cariqo'),
('A',1151,0,'Carles'),
('A',1152,0,'Carlos'),
('A',1153,0,'Carmona'),
('A',1154,0,'Carnero'),
('A',1155,0,'Carnicero'),
('A',1156,0,'Caro'),
('A',1157,0,'Carpi'),
('A',1158,0,'Carpio'),
('A',1159,0,'Carral'),
('A',1160,0,'Carralsn'),
('A',1161,0,'Carranga'),
('A',1162,0,'Carranza'),
('A',1163,0,'Carrasco'),
('A',1164,0,'Carrasquilla'),
('A',1165,0,'Carre'),
('A',1166,0,'Carreqo'),
('A',1167,0,'Carrera'),
('A',1168,0,'Carreras'),
('A',1169,0,'Carriazo'),
('A',1170,0,'Carrillo'),
('A',1171,0,'Carrisn'),
('A',1172,0,'Carrizosa'),
('A',1173,0,'Carro'),
('A',1174,0,'Caruana'),
('A',1175,0,'Carvajal'),
('A',1176,0,'Casadevall'),
('A',1177,0,'Casal'),
('A',1178,0,'Casals'),
('A',1179,0,'Casamayor'),
('A',1180,0,'Casanova'),
('A',1181,0,'Casar'),
('A',1182,0,'Casares'),
('A',1183,0,'Casas'),
('A',1184,0,'Cascos'),
('A',1185,0,'Casillas'),
('A',1186,0,'Cassillas'),
('A',1187,0,'Castaqeda'),
('A',1188,0,'Castaqer'),
('A',1189,0,'Castaqos'),
('A',1190,0,'Castejsn'),
('A',1191,0,'Castell'),
('A',1192,0,'Castellanos'),
('A',1193,0,'Castellar'),
('A',1194,0,'Castellblanch'),
('A',1195,0,'Castellblanco'),
('A',1196,0,'Castells'),
('A',1197,0,'Castellsn'),
('A',1198,0,'Castilblanque'),
('A',1199,0,'Castilla'),
('A',1200,0,'De castilla'),
('A',1201,0,'Castillejos'),
('A',1202,0,'Castillo'),
('A',1203,0,'Castresana'),
('A',1204,0,'Castrillo'),
('A',1205,0,'Castro'),
('A',1206,0,'De castro'),
('A',1207,0,'Casuso'),
('A',1208,0,'Catala'),
('A',1209,0,'Catalan'),
('A',1210,0,'Cavada'),
('A',1211,0,'Cavaller'),
('A',1212,0,'Cavallerma'),
('A',1213,0,'Cavallers'),
('A',1214,0,'Cavia'),
('A',1215,0,'Caysn'),
('A',1216,0,'Cazorla'),
('A',1217,0,'Cea'),
('A',1218,0,'Ceballos'),
('A',1219,0,'Cebardilla'),
('A',1220,0,'Cebrian'),
('A',1221,0,'Cejudo'),
('A',1222,0,'Celada'),
('A',1223,0,'Celamn'),
('A',1224,0,'Celis'),
('A',1225,0,'Cendoya'),
('A',1226,0,'Centurisn'),
('A',1227,0,'Cepeda'),
('A',1228,0,'Cerda'),
('A',1229,0,'Cerda'),
('A',1230,0,'Cerdan'),
('A',1231,0,'De la cerda'),
('A',1232,0,'Cerecedo'),
('A',1233,0,'Cererols'),
('A',1234,0,'Cerezo'),
('A',1235,0,'Cernadas'),
('A',1236,0,'Cersn'),
('A',1237,0,'Cerrato'),
('A',1238,0,'Cerro'),
('A',1239,0,'Cerroa'),
('A',1240,0,'Cervantes'),
('A',1241,0,'Cervera'),
('A',1242,0,'Cervers'),
('A',1243,0,'Cervetos'),
('A',1244,0,'Cerviqo'),
('A',1245,0,'Cispedes'),
('A',1246,0,'Cetina-zetina'),
('A',1247,0,'Chacsn'),
('A',1248,0,'Chamorro'),
('A',1249,0,'Chanciller'),
('A',1250,0,'Chaparro'),
('A',1251,0,'Chapmn'),
('A',1252,0,'Charino'),
('A',1253,0,'Chavarri'),
('A',1254,0,'Chaves'),
('A',1255,0,'Checa'),
('A',1256,0,'Chico'),
('A',1257,0,'Chicote'),
('A',1258,0,'Chinarro'),
('A',1259,0,'Chicharro'),
('A',1260,0,'Chinchilla'),
('A',1261,0,'Chino'),
('A',1262,0,'Chiroboga'),
('A',1263,0,'Chuecos'),
('A',1264,0,'Churruca'),
('A',1265,0,'Cianca'),
('A',1266,0,'Cicero'),
('A',1267,0,'Cieza'),
('A',1268,0,'Ciezar'),
('A',1269,0,'Cifontes'),
('A',1270,0,'Cifuentes'),
('A',1271,0,'Cigala'),
('A',1272,0,'Cima'),
('A',1273,0,'Ciruelo'),
('A',1274,0,'Ciscar'),
('A',1275,0,'Cisneros'),
('A',1276,0,'Gisneros'),
('A',1277,0,'Cisternas'),
('A',1278,0,'Ciudadano'),
('A',1279,0,'Ciurana'),
('A',1280,0,'Clar'),
('A',1281,0,'Claramunt'),
('A',1282,0,'Claret'),
('A',1283,0,'Clariana'),
('A',1284,0,'Claver'),
('A',1285,0,'Clavero'),
('A',1286,0,'Clavijo'),
('A',1287,0,'Clavyjo'),
('A',1288,0,'Clemente'),
('A',1289,0,'Clos'),
('A',1290,0,'Del clos'),
('A',1291,0,'Cobanillas'),
('A',1292,0,'Cobillas'),
('A',1293,0,'Cobo'),
('A',1294,0,'Cobos'),
('A',1295,0,'Coca'),
('A',1296,0,'Coch'),
('A',1297,0,'Coche'),
('A',1298,0,'Coello'),
('A',1299,0,'Coenza'),
('A',1300,0,'Colindres'),
('A',1301,0,'Coll'),
('A',1302,0,'Collado'),
('A',1303,0,'Collantes'),
('A',1304,0,'Colmenares'),
('A',1305,0,'Coloma'),
('A',1306,0,'Colomer'),
('A',1307,0,'Colomina'),
('A',1308,0,'Colominas'),
('A',1309,0,'Colomines'),
('A',1310,0,'Colomo'),
('A',1311,0,'Colsn'),
('A',1312,0,'Comas'),
('A',1313,0,'Comellas'),
('A',1314,0,'Company'),
('A',1315,0,'Compaqy'),
('A',1316,0,'Concejo'),
('A',1317,0,'Concha'),
('A',1318,0,'Conde'),
('A',1319,0,'Conesa'),
('A',1320,0,'Conique'),
('A',1321,0,'Conrado'),
('A',1322,0,'Contesti'),
('A',1323,0,'Contreras'),
('A',1324,0,'Coquero'),
('A',1325,0,'Corbacho'),
('A',1326,0,'Corbet'),
('A',1327,0,'Corchado'),
('A',1328,0,'Csrcoles'),
('A',1329,0,'Corcuera'),
('A',1330,0,'Cordero'),
('A',1331,0,'Cordoba'),
('A',1332,0,'De cordoba'),
('A',1333,0,'Csrdova'),
('A',1334,0,'Corella'),
('A',1335,0,'Cornejo'),
('A',1336,0,'Cornejo'),
('A',1337,0,'Corona'),
('A',1338,0,'Coronado'),
('A',1339,0,'Coronel'),
('A',1340,0,'Corono'),
('A',1341,0,'Corral'),
('A',1342,0,'Correa'),
('A',1343,0,'Cortada'),
('A',1344,0,'Cortazar'),
('A',1345,0,'Corte'),
('A',1346,0,'Cortejo'),
('A',1347,0,'Cortis'),
('A',1348,0,'Cortiguera'),
('A',1349,0,'Cortina'),
('A',1350,0,'Corvera'),
('A',1351,0,'Corvinos'),
('A',1352,0,'Cos'),
('A',1353,0,'Cosa'),
('A',1354,0,'Cosgaya'),
('A',1355,0,'Cossio'),
('A',1356,0,'Costa'),
('A',1357,0,'Costales'),
('A',1358,0,'Cota'),
('A',1359,0,'Cotera'),
('A',1360,0,'Covarrubias'),
('A',1361,0,'Cozar'),
('A',1362,0,'Cszar'),
('A',1363,0,'Crespo'),
('A',1364,0,'Creus'),
('A',1365,0,'Criado'),
('A',1366,0,'Cristantes'),
('A',1367,0,'Cruz'),
('A',1368,0,'De la cruz'),
('A',1369,0,'Cuadra'),
('A',1370,0,'Cuadrado'),
('A',1371,0,'Cuadros'),
('A',1372,0,'Cuartango'),
('A',1373,0,'Cuartas'),
('A',1374,0,'Cubas'),
('A',1375,0,'Cubero'),
('A',1376,0,'Cubillas'),
('A',1377,0,'Cubillos'),
('A',1378,0,'Cubillo'),
('A',1379,0,'Cubria'),
('A',1380,0,'Cubrma'),
('A',1381,0,'Cucales'),
('A',1382,0,'Cuebas'),
('A',1383,0,'Cuillar'),
('A',1384,0,'Cuello'),
('A',1385,0,'Cuenca'),
('A',1386,0,'Cuerno'),
('A',1387,0,'Cuervo'),
('A',1388,0,'Cuesta'),
('A',1389,0,'Cueto'),
('A',1390,0,'Cueva'),
('A',1391,0,'Cuevas'),
('A',1392,0,'Cumplido'),
('A',1393,0,'Curiel'),
('A',1394,0,'Cutanda'),
('A',1395,0,'Cysneros'),
('A',1397,0,'D'),
('A',1400,0,'Dalmau'),
('A',1401,0,'Dardalla'),
('A',1402,0,'Dato'),
('A',1403,0,'Davalos'),
('A',1404,0,'Davila'),
('A',1405,0,'Daza'),
('A',1406,0,'Dazne'),
('A',1407,0,'De la corte'),
('A',1408,0,'Dehesa'),
('A',1409,0,'Del barrio'),
('A',1410,0,'Del campo'),
('A',1411,0,'Delcarte'),
('A',1412,0,'Delfmn'),
('A',1413,0,'Delgadillo'),
('A',1414,0,'Delgado'),
('A',1415,0,'Delicado'),
('A',1416,0,'Desboch'),
('A',1417,0,'Desgell'),
('A',1418,0,'Desmont'),
('A',1419,0,'Despm'),
('A',1420,0,'Despuig'),
('A',1421,0,'Despujol'),
('A',1422,0,'Despujols'),
('A',1423,0,'Deza'),
('A',1424,0,'Diago'),
('A',1425,0,'Dmaz'),
('A',1426,0,'Diego'),
('A',1427,0,'Dieste'),
('A',1428,0,'Dmez'),
('A',1429,0,'Diezma'),
('A',1430,0,'Diosdado'),
('A',1431,0,'Diustegui'),
('A',1432,0,'Doblas'),
('A',1433,0,'Doliva'),
('A',1434,0,'Dolz'),
('A',1435,0,'Domecq'),
('A',1436,0,'Dominech'),
('A',1437,0,'Domica'),
('A',1438,0,'Domingo'),
('A',1439,0,'Dommnguez'),
('A',1440,0,'Donaire'),
('A',1441,0,'Donat'),
('A',1442,0,'Doncel'),
('A',1443,0,'Donella'),
('A',1444,0,'Donez'),
('A',1445,0,'Donis'),
('A',1446,0,'Donoso'),
('A',1447,0,'Dorante'),
('A',1448,0,'Dorantes'),
('A',1449,0,'Dorarte'),
('A',1450,0,'Dorartes'),
('A',1451,0,'Dorcas'),
('A',1452,0,'Dorenga'),
('A',1453,0,'Dorma'),
('A',1454,0,'Dsriga'),
('A',1455,0,'Dosal'),
('A',1456,0,'Dosma'),
('A',1457,0,'Dosrmus'),
('A',1458,0,'Dot'),
('A',1459,0,'Dou'),
('A',1460,0,'Duarte'),
('A',1461,0,'Dueqas'),
('A',1462,0,'Duero'),
('A',1463,0,'Dulce'),
('A',1464,0,'Duque'),
('A',1465,0,'Duque de estrada'),
('A',1466,0,'Duran'),
('A',1467,0,'Durango'),
('A',1468,0,'Durban'),
('A',1469,0,'Eceiza'),
('A',1470,0,'Echabarri'),
('A',1471,0,'Echage'),
('A',1472,0,'Echaniz'),
('A',1473,0,'Echaniz'),
('A',1474,0,'Echanove'),
('A',1475,0,'Echarte'),
('A',1476,0,'Echavarri'),
('A',1477,0,'Echave'),
('A',1478,0,'Echebarrma'),
('A',1479,0,'Echeberri'),
('A',1480,0,'Echeberrma'),
('A',1481,0,'Echegaray'),
('A',1482,0,'Echenique'),
('A',1483,0,'Echevarri'),
('A',1484,0,'Echevarrma'),
('A',1485,0,'Icija'),
('A',1486,0,'Edilla'),
('A',1487,0,'Egea'),
('A',1488,0,'Eguma'),
('A',1489,0,'Egurbide'),
('A',1490,0,'Eguren'),
('A',1491,0,'Egurrola'),
('A',1492,0,'Eizaga'),
('A',1493,0,'Elcano'),
('A',1494,0,'Eleizalde'),
('A',1495,0,'Elejalde'),
('A',1496,0,'Elespuru'),
('A',1497,0,'Elgorriaga'),
('A',1498,0,'Elguera'),
('A',1499,0,'Elguero'),
('A',1500,0,'Elguezabal'),
('A',1501,0,'Elma'),
('A',1502,0,'Elmo'),
('A',1503,0,'Eliot'),
('A',1504,0,'Elizalde'),
('A',1505,0,'Elizondo'),
('A',1506,0,'Ellaurri'),
('A',1507,0,'Elordi'),
('A',1508,0,'Elorriaga'),
('A',1509,0,'Elorrieta'),
('A',1510,0,'Elorza'),
('A',1511,0,'Emanuel'),
('A',1512,0,'Empuries'),
('A',1513,0,'Ena'),
('A',1514,0,'Encina'),
('A',1515,0,'Encinas'),
('A',1516,0,'Enciso'),
('A',1517,0,'Endirica'),
('A',1518,0,'Enrmquez'),
('A',1519,0,'Enseqa'),
('A',1520,0,'Entenza'),
('A',1521,0,'Entralgo'),
('A',1522,0,'Epalza'),
('A',1523,0,'Eraso'),
('A',1524,0,'Ercilla'),
('A',1525,0,'Ercille'),
('A',1526,0,'Eril'),
('A',1527,0,'Errea'),
('A',1528,0,'Esamn'),
('A',1529,0,'Escagedo'),
('A',1530,0,'Escajadillo'),
('A',1531,0,'Escalada'),
('A',1532,0,'Escalante'),
('A',1533,0,'Escalera'),
('A',1534,0,'Escalona'),
('A',1535,0,'Escama'),
('A',1536,0,'Escamilla'),
('A',1537,0,'Escandsn'),
('A',1538,0,'Escario'),
('A',1539,0,'Escavias'),
('A',1540,0,'Escobal'),
('A',1541,0,'Escobar'),
('A',1542,0,'Escobedo'),
('A',1543,0,'Escofet'),
('A',1544,0,'Escolano'),
('A',1545,0,'Escornallsn'),
('A',1546,0,'Escriba'),
('A',1547,0,'Escriva'),
('A',1548,0,'Escudero'),
('A',1549,0,'Eslava'),
('A',1550,0,'Espada'),
('A',1551,0,'Espaqa'),
('A',1552,0,'Espaqol'),
('A',1553,0,'Esparza'),
('A',1554,0,'Espasa'),
('A',1555,0,'Espaser'),
('A',1556,0,'Espasm'),
('A',1557,0,'Espejo'),
('A',1558,0,'Espiga'),
('A',1559,0,'Espina'),
('A',1560,0,'Espino'),
('A',1561,0,'Espinosa'),
('A',1562,0,'Esquerdo'),
('A',1563,0,'Esquinas'),
('A',1564,0,'Esquivel'),
('A',1565,0,'Esquivias'),
('A',1566,0,'Esteban'),
('A',1567,0,'Estibanez'),
('A',1568,0,'Estela'),
('A',1569,0,'Estella'),
('A',1570,0,'Estenaga'),
('A',1571,0,'Estenoz'),
('A',1572,0,'Estensoro'),
('A',1573,0,'Esteve'),
('A',1574,0,'Estivez'),
('A',1575,0,'Estrada'),
('A',1576,0,'Estrada'),
('A',1577,0,'Estrader'),
('A',1578,0,'Estragues'),
('A',1579,0,'Estraguis'),
('A',1580,0,'Etxabarri'),
('A',1581,0,'Etxaniz'),
('A',1582,0,'Etxanove'),
('A',1583,0,'Etxebarrma'),
('A',1584,0,'Etxeberrma'),
('A',1585,0,'Etxegaray'),
('A',1586,0,'Etxenique'),
('A',1587,0,'Ezcurra'),
('A',1588,0,'Ezpeleta'),
('A',1589,0,'Ezquerra'),
('A',1590,0,'Ezquerra de rozas'),
('A',1591,0,'Ezquieta'),
('A',1593,0,'F'),
('A',1595,0,'Fabian'),
('A',1596,0,'Fabra'),
('A',1597,0,'Fabregas'),
('A',1598,0,'Fabrer'),
('A',1599,0,'Fages'),
('A',1600,0,'Faguez'),
('A',1601,0,'Fajardo'),
('A',1602,0,'Falceto'),
('A',1603,0,'Falcs'),
('A',1604,0,'Falcsn'),
('A',1605,0,'Falconi'),
('A',1606,0,'Falla'),
('A',1607,0,'Faqez'),
('A',1608,0,'Faria'),
('A',1609,0,'Fariqas'),
('A',1610,0,'Febrer'),
('A',1611,0,'Feijoo'),
('A',1612,0,'Felgoso'),
('A',1613,0,'Felices'),
('A',1614,0,'Felmu'),
('A',1615,0,'Feo'),
('A',1616,0,'Fernandez'),
('A',1617,0,'Ferra'),
('A',1618,0,'Ferraez'),
('A',1619,0,'Ferran'),
('A',1620,0,'Ferrandez'),
('A',1621,0,'Ferrandiz'),
('A',1622,0,'Ferrando'),
('A',1623,0,'Ferrari'),
('A',1624,0,'Ferraz'),
('A',1625,0,'Ferrer'),
('A',1626,0,'Ferrero'),
('A',1627,0,'Fierro'),
('A',1628,0,'Figuera'),
('A',1629,0,'Figueras'),
('A',1630,0,'Figueres'),
('A',1631,0,'Figueroa'),
('A',1632,0,'Filera'),
('A',1633,0,'Fines'),
('A',1634,0,'Fitero'),
('A',1635,0,'Flor'),
('A',1636,0,'Flor'),
('A',1637,0,'Floranes'),
('A',1638,0,'Flores'),
('A',1639,0,'Flsrez'),
('A',1640,0,'Flormn'),
('A',1641,0,'Flos'),
('A',1642,0,'Foncillas'),
('A',1643,0,'Fonfria'),
('A',1644,0,'Fonseca'),
('A',1645,0,'Font'),
('A',1646,0,'Fontana'),
('A',1647,0,'Fontaneda'),
('A',1648,0,'Fonte'),
('A',1649,0,'Fontecha'),
('A',1650,0,'Fontecilla'),
('A',1651,0,'Fontecilla'),
('A',1652,0,'Fontes'),
('A',1653,0,'Fonz'),
('A',1654,0,'Forcas'),
('A',1655,0,'Forner'),
('A',1656,0,'Fornels'),
('A',1657,0,'Fortuny'),
('A',1658,0,'Fortuqo'),
('A',1659,0,'Fragua'),
('A',1660,0,'Fraguas'),
('A',1661,0,'Franca'),
('A',1662,0,'Francis'),
('A',1663,0,'Francia'),
('A',1664,0,'Franco'),
('A',1665,0,'Frechel'),
('A',1666,0,'Frechilla'),
('A',1667,0,'Fresneda'),
('A',1668,0,'Frmas'),
('A',1669,0,'Frutos'),
('A',1670,0,'Fuensalida'),
('A',1671,0,'Fuente'),
('A',1672,0,'Fuentes'),
('A',1673,0,'Fuertes'),
('A',1674,0,'Fullana'),
('A',1675,0,'Funes'),
('A',1676,0,'Fster'),
('A',1677,0,'Gabaldsn'),
('A',1678,0,'Gabea'),
('A',1679,0,'Gabiqo'),
('A',1680,0,'Gabriel'),
('A',1681,0,'Gamnza'),
('A',1682,0,'Gaitan'),
('A',1683,0,'Galamn'),
('A',1684,0,'Galalsn'),
('A',1685,0,'Galan'),
('A',1686,0,'Galasn'),
('A',1687,0,'Galarreta'),
('A',1688,0,'Galaz'),
('A',1689,0,'Galdss'),
('A',1690,0,'Galeano'),
('A',1691,0,'Galeote'),
('A',1692,0,'Galeoto'),
('A',1693,0,'Galiana'),
('A',1694,0,'Galiano'),
('A',1695,0,'Galicia'),
('A',1696,0,'Galmndez'),
('A',1697,0,'Galindo'),
('A',1698,0,'Gallaga'),
('A',1699,0,'Gallardo'),
('A',1700,0,'Gallastegui'),
('A',1701,0,'Gallego'),
('A',1702,0,'Gallegos'),
('A',1703,0,'Gallo'),
('A',1704,0,'Galvan'),
('A',1705,0,'Galvez'),
('A',1706,0,'Gama'),
('A',1707,0,'Gamarra'),
('A',1708,0,'Gamboa'),
('A',1709,0,'Gamez'),
('A',1710,0,'Gamiz'),
('A',1711,0,'Gandara'),
('A',1712,0,'Gandarillas'),
('A',1713,0,'Gaona'),
('A',1714,0,'Garate'),
('A',1715,0,'Garategui'),
('A',1716,0,'Garau'),
('A',1717,0,'Garay'),
('A',1718,0,'Garayo'),
('A',1719,0,'Garcis'),
('A',1720,0,'Garcma'),
('A',1721,0,'Garcifuentes'),
('A',1722,0,'Gardosa'),
('A',1723,0,'Gargallo'),
('A',1724,0,'Gargollo'),
('A',1725,0,'Garmn'),
('A',1726,0,'Garita'),
('A',1727,0,'Garmendia'),
('A',1728,0,'Garmilla'),
('A',1729,0,'Garnica'),
('A',1730,0,'Garrido'),
('A',1731,0,'Garriga'),
('A',1732,0,'Garriz'),
('A',1733,0,'Garro'),
('A',1734,0,'Garza'),
('A',1735,0,'Garzo'),
('A',1736,0,'Garzsn'),
('A',1737,0,'Gascsn'),
('A',1738,0,'Gauna'),
('A',1739,0,'Gavilan'),
('A',1740,0,'Gavilanes'),
('A',1741,0,'Gaviria'),
('A',1742,0,'Gay'),
('A',1743,0,'Gaytan'),
('A',1744,0,'Gaztaqaga'),
('A',1745,0,'Gaztelu'),
('A',1746,0,'Gelabert'),
('A',1747,0,'Gelcem'),
('A',1748,0,'Gelmmrez'),
('A',1749,0,'Ginova'),
('A',1750,0,'Gerardina'),
('A',1751,0,'German'),
('A',1752,0,'Gerona'),
('A',1753,0,'Getino'),
('A',1754,0,'Gijsn'),
('A',1755,0,'Gil'),
('A',1756,0,'Gilabert'),
('A',1757,0,'Gilbert'),
('A',1758,0,'Giminez-rico'),
('A',1759,0,'Giner'),
('A',1760,0,'Giraldo'),
('A',1761,0,'Girsn'),
('A',1762,0,'Gispert'),
('A',1763,0,'Godmnez'),
('A',1764,0,'Godoy'),
('A',1765,0,'Goenechea'),
('A',1766,0,'Goicoechea'),
('A',1767,0,'Goiri'),
('A',1768,0,'Goitisolo'),
('A',1769,0,'Golaez'),
('A',1770,0,'Golfmn'),
('A',1771,0,'Gomar'),
('A',1772,0,'Gombau'),
('A',1773,0,'Gomendradi'),
('A',1774,0,'Gsmez'),
('A',1775,0,'Gomucio'),
('A',1776,0,'Gsngora'),
('A',1777,0,'Gonzaga'),
('A',1778,0,'Gonzalez'),
('A',1779,0,'Gonzalo'),
('A',1780,0,'Goqi'),
('A',1781,0,'Gordejuela'),
('A',1782,0,'Gordo'),
('A',1783,0,'Gordoa'),
('A',1784,0,'Gordsn'),
('A',1785,0,'Gordoncillo'),
('A',1786,0,'Gorospe'),
('A',1787,0,'Gorostazu'),
('A',1788,0,'Gorostidi'),
('A',1789,0,'Gorostiza'),
('A',1790,0,'Gorriti'),
('A',1791,0,'Gortari'),
('A',1792,0,'Govea'),
('A',1793,0,'Goya'),
('A',1794,0,'Goyanes'),
('A',1795,0,'Goyena'),
('A',1796,0,'Goyeneche'),
('A',1797,0,'Gracia'),
('A',1798,0,'Grajales'),
('A',1799,0,'Grajera'),
('A',1800,0,'Gramunt'),
('A',1801,0,'Granada'),
('A',1802,0,'De granada'),
('A',1803,0,'Grande'),
('A',1804,0,'Grandes'),
('A',1805,0,'Granollachs'),
('A',1806,0,'Graqsn'),
('A',1807,0,'Grau'),
('A',1808,0,'Grijalva'),
('A',1809,0,'Grillo'),
('A',1810,0,'Grimalde'),
('A',1811,0,'Grimaldo'),
('A',1812,0,'Grimau'),
('A',1813,0,'Guadalajara'),
('A',1814,0,'Guadalfajara'),
('A',1815,0,'Guajardo-fajardo'),
('A',1816,0,'Guantes'),
('A',1817,0,'Guardia'),
('A',1818,0,'La guardia'),
('A',1819,0,'Guardiola'),
('A',1820,0,'Guaso'),
('A',1821,0,'Guecho'),
('A',1822,0,'Gel'),
('A',1823,0,'Guerra'),
('A',1824,0,'Guerrero'),
('A',1825,0,'Guevara'),
('A',1826,0,'Guijo'),
('A',1827,0,'Guillamas'),
('A',1828,0,'Guillin'),
('A',1829,0,'Guinea'),
('A',1830,0,'Guinzo'),
('A',1831,0,'Guiral'),
('A',1832,0,'Guirao'),
('A',1833,0,'Guirarte'),
('A',1834,0,'Guisasola'),
('A',1835,0,'Guitarra'),
('A',1836,0,'Guixart'),
('A',1837,0,'Guridi'),
('A',1838,0,'Guriezo'),
('A',1839,0,'Gurmendi'),
('A',1840,0,'Gurrea'),
('A',1841,0,'Gurruchaga'),
('A',1842,0,'Guruceta'),
('A',1843,0,'Gustamante'),
('A',1844,0,'Gutiirrez'),
('A',1845,0,'Guzman'),
('A',1846,0,'Haro'),
('A',1847,0,'Haya'),
('A',1848,0,'Hedilla'),
('A',1849,0,'Henrmquez'),
('A',1850,0,'Hera'),
('A',1851,0,'Heras'),
('A',1852,0,'Heredia'),
('A',1853,0,'Hermosa'),
('A',1854,0,'Hermoso'),
('A',1855,0,'Hermosilla'),
('A',1856,0,'Hernandez'),
('A',1857,0,'Hernando'),
('A',1858,0,'Hernani'),
('A',1859,0,'Herran'),
('A',1860,0,'Herrera'),
('A',1861,0,'Herrermas'),
('A',1862,0,'Herrero'),
('A',1863,0,'Herreros'),
('A',1864,0,'Hervas'),
('A',1865,0,'Hevia'),
('A',1866,0,'Hidalgo'),
('A',1867,0,'Hierro'),
('A',1868,0,'Higuera'),
('A',1869,0,'Higueras'),
('A',1870,0,'Higuero'),
('A',1871,0,'Hinestrosa'),
('A',1872,0,'Hiniesta'),
('A',1873,0,'Hinojosa'),
('A',1874,0,'Hita'),
('A',1875,0,'Holgado'),
('A',1876,0,'Holgumn'),
('A',1877,0,'Hontaqon'),
('A',1878,0,'Horcasitas'),
('A',1879,0,'Hormaza'),
('A',1880,0,'Horna'),
('A',1881,0,'Hoya'),
('A',1882,0,'Hoyo'),
('A',1883,0,'Hoyos'),
('A',1884,0,'Hoz'),
('A',1885,0,'Huarte'),
('A',1886,0,'Huelves'),
('A',1887,0,'Huerta'),
('A',1888,0,'Huete'),
('A',1889,0,'Huidobro'),
('A',1890,0,'Hurmenta'),
('A',1891,0,'Hurmeneta'),
('A',1892,0,'Hurtado'),
('A',1893,0,'Ibaqez'),
('A',1894,0,'Ibar'),
('A',1895,0,'Ibarra'),
('A',1896,0,'Ibarreta'),
('A',1897,0,'Ibarrieta'),
('A',1898,0,'Ibero'),
('A',1899,0,'Idigoras'),
('A',1900,0,'Iermo'),
('A',1901,0,'Iglesia'),
('A',1902,0,'Iglesias'),
('A',1903,0,'Igual'),
('A',1904,0,'Illan'),
('A',1905,0,'Illanes'),
('A',1906,0,'Illescas'),
('A',1907,0,'Incera'),
('A',1908,0,'Inclan'),
('A',1909,0,'Infantas'),
('A',1910,0,'Infante'),
('A',1911,0,'Infanzsn'),
('A',1912,0,'Mqigo'),
('A',1913,0,'Mqiguez'),
('A',1914,0,'Iranzo'),
('A',1915,0,'Iraurgui'),
('A',1916,0,'Iraurqui'),
('A',1917,0,'Iriarte'),
('A',1918,0,'Irias'),
('A',1919,0,'Iribar'),
('A',1920,0,'Iribarne'),
('A',1921,0,'Iribe'),
('A',1922,0,'Iribias'),
('A',1923,0,'Irigoyen'),
('A',1924,0,'Irizar'),
('A',1925,0,'Irujo'),
('A',1926,0,'Irureta'),
('A',1927,0,'Isasi'),
('A',1928,0,'Isla'),
('A',1929,0,'Isurieta'),
('A',1930,0,'Iturbe'),
('A',1931,0,'Iturmendi'),
('A',1932,0,'Iturralde'),
('A',1933,0,'Iturregui'),
('A',1934,0,'Iturriaga'),
('A',1935,0,'Izmendi'),
('A',1936,0,'Izquierdo'),
('A',1937,0,'Jaca'),
('A',1938,0,'Jado'),
('A',1939,0,'Jain'),
('A',1940,0,'Jaime'),
('A',1941,0,'Jamar'),
('A',1942,0,'Jara'),
('A',1943,0,'Jaraba'),
('A',1944,0,'Jaramillo'),
('A',1945,0,'Jardin'),
('A',1946,0,'Jaumar'),
('A',1947,0,'Jauregui'),
('A',1948,0,'Javat'),
('A',1949,0,'Javier'),
('A',1950,0,'Jerez'),
('A',1951,0,'Jiminez'),
('A',1952,0,'Jimeno'),
('A',1953,0,'Jorda'),
('A',1954,0,'Jorganes'),
('A',1955,0,'Jove'),
('A',1956,0,'Jovellanos'),
('A',1957,0,'Juanes'),
('A',1958,0,'Juansoro'),
('A',1959,0,'Juarez'),
('A',1960,0,'Julia'),
('A',1961,0,'Jumilla'),
('A',1962,0,'Junco'),
('A',1963,0,'Junta'),
('A',1964,0,'Jurado'),
('A',1965,0,'Juste'),
('A',1966,0,'Justiniani'),
('A',1967,0,'Justiniano'),
('A',1968,0,'Kent'),
('A',1969,0,'Kindelan'),
('A',1970,0,'Kirkpatrick'),
('A',1971,0,'Klett'),
('A',1972,0,'La casa'),
('A',1973,0,'La peqa'),
('A',1974,0,'Labadma'),
('A',1975,0,'Labanda'),
('A',1976,0,'Labandera'),
('A',1977,0,'Labastida'),
('A',1978,0,'Laborda'),
('A',1979,0,'Labra'),
('A',1980,0,'Ladrsn'),
('A',1981,0,'Lago'),
('A',1982,0,'Lagos'),
('A',1983,0,'Laguna'),
('A',1984,0,'Laiseca'),
('A',1985,0,'Laiz'),
('A',1986,0,'Lama'),
('A',1987,0,'Lamadrid'),
('A',1988,0,'Lamas'),
('A',1989,0,'Lambarri'),
('A',1990,0,'Lana'),
('A',1991,0,'Landa'),
('A',1992,0,'Landaluce'),
('A',1993,0,'Landeras'),
('A',1994,0,'Landeta'),
('A',1995,0,'Lanuza'),
('A',1996,0,'Lanza'),
('A',1997,0,'Lara'),
('A',1998,0,'Larra'),
('A',1999,0,'Larraga'),
('A',2000,0,'Larragoiti'),
('A',2001,0,'Larramendma'),
('A',2002,0,'Larrandi'),
('A',2003,0,'Larraqaga'),
('A',2004,0,'Larrasa'),
('A',2005,0,'Larrauri'),
('A',2006,0,'Larrea'),
('A',2007,0,'Larreta'),
('A',2008,0,'Larrinaga'),
('A',2009,0,'Larrondo'),
('A',2010,0,'Lasa'),
('A',2011,0,'Lasarte'),
('A',2012,0,'Lastra'),
('A',2013,0,'Latasa'),
('A',2014,0,'Latorre'),
('A',2015,0,'Lavin'),
('A',2016,0,'Leal'),
('A',2017,0,'Lechuga'),
('A',2018,0,'Lecumberri'),
('A',2019,0,'Lecuona'),
('A',2020,0,'Ledesma'),
('A',2021,0,'Ledos'),
('A',2022,0,'Legazpi'),
('A',2023,0,'Leguina'),
('A',2024,0,'Leiva'),
('A',2025,0,'Leizaola'),
('A',2026,0,'Lejarazu'),
('A',2027,0,'Lema'),
('A',2028,0,'Lemona'),
('A',2029,0,'Lemos'),
('A',2030,0,'Lencero'),
('A',2031,0,'Lesn'),
('A',2032,0,'Leoz'),
('A',2033,0,'Lera'),
('A',2034,0,'Lerma'),
('A',2035,0,'Lesaca'),
('A',2036,0,'Leste'),
('A',2037,0,'Letona'),
('A',2038,0,'Leturiondo'),
('A',2039,0,'Liaqo'),
('A',2040,0,'Liebana'),
('A',2041,0,'Liermo'),
('A',2042,0,'Lillo'),
('A',2043,0,'Limpias'),
('A',2044,0,'Linares'),
('A',2045,0,'Linde'),
('A',2046,0,'Liqan'),
('A',2047,0,'Lira'),
('A',2048,0,'Lizarazu'),
('A',2049,0,'Lizarralde'),
('A',2050,0,'Llach'),
('A',2051,0,'Llaguno'),
('A',2052,0,'Llama'),
('A',2053,0,'Llamas'),
('A',2054,0,'Llanas'),
('A',2055,0,'Llanes'),
('A',2056,0,'Llano'),
('A',2057,0,'Llanos'),
('A',2058,0,'Llantada'),
('A',2059,0,'Llarumbe'),
('A',2060,0,'Llate'),
('A',2061,0,'Llave'),
('A',2062,0,'Llerana'),
('A',2063,0,'Llobregat'),
('A',2064,0,'Llopis'),
('A',2065,0,'Lloreda'),
('A',2066,0,'Llorins'),
('A',2067,0,'Llorente'),
('A',2068,0,'Lloret'),
('A',2069,0,'Lluch'),
('A',2070,0,'Llull'),
('A',2071,0,'Loarte'),
('A',2072,0,'Lobato'),
('A',2073,0,'Lobatsn'),
('A',2074,0,'Lobera'),
('A',2075,0,'Lobo'),
('A',2076,0,'Lomba'),
('A',2077,0,'Lombana'),
('A',2078,0,'Lombera'),
('A',2079,0,'Londoqo'),
('A',2080,0,'Lspez'),
('A',2081,0,'Lopez-doriga'),
('A',2082,0,'Lorca'),
('A',2083,0,'Loredo'),
('A',2084,0,'Lorenzo'),
('A',2085,0,'Losa'),
('A',2086,0,'Losada'),
('A',2087,0,'Loyola'),
('A',2088,0,'Lozana'),
('A',2089,0,'Lozano'),
('A',2090,0,'Lucas'),
('A',2091,0,'Lucena'),
('A',2092,0,'Lucio'),
('A',2093,0,'Lugo'),
('A',2094,0,'Luis'),
('A',2095,0,'Lujan'),
('A',2096,0,'Lumbreras'),
('A',2097,0,'Luna'),
('A',2098,0,'Luque'),
('A',2099,0,'Luz'),
('A',2100,0,'Luzsn'),
('A',2101,0,'Maceda'),
('A',2102,0,'Machado'),
('A',2103,0,'Machamn'),
('A',2104,0,'Machmn'),
('A',2105,0,'Macias'),
('A',2106,0,'Macmas'),
('A',2107,0,'Madariaga'),
('A',2108,0,'Madera'),
('A',2109,0,'Madero'),
('A',2110,0,'Madrazo'),
('A',2111,0,'Madrid'),
('A',2112,0,'Madrigal'),
('A',2113,0,'Maestre'),
('A',2114,0,'Maeztu'),
('A',2115,0,'Magallanes'),
('A',2116,0,'Maldonado'),
('A',2117,0,'Malet'),
('A',2118,0,'Mancebo'),
('A',2119,0,'Mancha'),
('A',2120,0,'Manero'),
('A',2121,0,'Manglano'),
('A',2122,0,'Manjsn'),
('A',2123,0,'Manrique'),
('A',2124,0,'Manrique de lara'),
('A',2125,0,'Manso'),
('A',2126,0,'Mantecsn'),
('A',2127,0,'Mantilla'),
('A',2128,0,'Manuel'),
('A',2129,0,'Manzanares'),
('A',2130,0,'Manzano'),
('A',2131,0,'Maquillsn'),
('A',2132,0,'Maraqsn'),
('A',2133,0,'Marco'),
('A',2134,0,'Marcos'),
('A',2135,0,'Marcs'),
('A',2136,0,'Marco'),
('A',2137,0,'Marichalar'),
('A',2138,0,'Marmn'),
('A',2139,0,'Marinas'),
('A',2140,0,'Mariqas'),
('A',2141,0,'Mariqo'),
('A',2142,0,'Mariqos'),
('A',2143,0,'Mariscal'),
('A',2144,0,'Marmol'),
('A',2145,0,'Marquis'),
('A',2146,0,'Marquez'),
('A',2147,0,'Marquina'),
('A',2148,0,'Marrsn'),
('A',2149,0,'Marroquin'),
('A',2150,0,'Martm'),
('A',2151,0,'Martmn'),
('A',2152,0,'Martmnez'),
('A',2153,0,'Martorell'),
('A',2154,0,'Martos'),
('A',2155,0,'Mas'),
('A',2156,0,'Mascareqas'),
('A',2157,0,'Mascs'),
('A',2158,0,'Mata'),
('A',2159,0,'Matallana'),
('A',2160,0,'Matars'),
('A',2161,0,'Matarrsn'),
('A',2162,0,'Matas'),
('A',2163,0,'Mate'),
('A',2164,0,'Mateos'),
('A',2165,0,'Mateo'),
('A',2166,0,'Matiu'),
('A',2167,0,'Matienzo'),
('A',2168,0,'Maturana'),
('A',2169,0,'Matute'),
('A',2170,0,'Mayo'),
('A',2171,0,'Mayoral'),
('A',2172,0,'Maza'),
('A',2173,0,'Mazarrasa'),
('A',2174,0,'Mazarredo'),
('A',2175,0,'Mazas'),
('A',2176,0,'Mazo'),
('A',2177,0,'Mazorra'),
('A',2178,0,'Mazueco'),
('A',2179,0,'Meca'),
('A',2180,0,'Medel'),
('A',2181,0,'Mediavilla'),
('A',2182,0,'Medina'),
('A',2183,0,'Medrano'),
('A',2184,0,'Mejma'),
('A',2185,0,'Mejmas'),
('A',2186,0,'Melindez'),
('A',2187,0,'Melero'),
('A',2188,0,'Melia'),
('A',2189,0,'Mellado'),
('A',2190,0,'Mena'),
('A',2191,0,'Menchaca'),
('A',2192,0,'Mencma'),
('A',2193,0,'Mindez'),
('A',2194,0,'Mendi'),
('A',2195,0,'Mendma'),
('A',2196,0,'Mendieta'),
('A',2197,0,'Mendiguren'),
('A',2198,0,'Mendiola'),
('A',2199,0,'Mendoza'),
('A',2200,0,'Menindez'),
('A',2201,0,'Meneses'),
('A',2202,0,'Mercadillo'),
('A',2203,0,'Mercer'),
('A',2204,0,'Merino'),
('A',2205,0,'Merlo'),
('A',2206,0,'Merodio'),
('A',2207,0,'Mesa'),
('A',2208,0,'Mesones'),
('A',2209,0,'Mexmas'),
('A',2210,0,'Mezqumriz'),
('A',2211,0,'Mezquita'),
('A',2212,0,'Micientes'),
('A',2213,0,'Mier'),
('A',2214,0,'Miera'),
('A',2215,0,'Miguel'),
('A',2216,0,'Mijares'),
('A',2217,0,'Mila'),
('A',2218,0,'Milan'),
('A',2219,0,'Milanis'),
('A',2220,0,'Milans'),
('A',2221,0,'Milla'),
('A',2222,0,'Millan'),
('A',2223,0,'Minguela'),
('A',2224,0,'Mmnguez'),
('A',2225,0,'Mioqo'),
('A',2226,0,'Mirabal'),
('A',2227,0,'Miralles'),
('A',2228,0,'Miranda'),
('A',2229,0,'Mirs'),
('A',2230,0,'Mirones'),
('A',2231,0,'Mogrovejo'),
('A',2232,0,'Msjica'),
('A',2233,0,'Mola'),
('A',2234,0,'Molero'),
('A',2235,0,'Molina'),
('A',2236,0,'Moliner'),
('A',2237,0,'Molinero'),
('A',2238,0,'Molinet'),
('A',2239,0,'Molinillo'),
('A',2240,0,'Molmns'),
('A',2241,0,'Molleda'),
('A',2242,0,'Mollet'),
('A',2243,0,'Momps'),
('A',2244,0,'Monasterio'),
('A',2245,0,'Moncada'),
('A',2246,0,'Mondragsn'),
('A',2247,0,'Monreal'),
('A',2248,0,'Monsalve'),
('A',2249,0,'Monserrat'),
('A',2250,0,'Montalban'),
('A',2251,0,'Montaner'),
('A',2252,0,'Montaqa'),
('A',2253,0,'Montaqes'),
('A',2254,0,'Montaqo'),
('A',2255,0,'Montejo'),
('A',2256,0,'Montenegro'),
('A',2257,0,'Montero'),
('A',2258,0,'Montes'),
('A',2259,0,'Montesinos'),
('A',2260,0,'Montijo'),
('A',2261,0,'Montoro'),
('A',2262,0,'Montoya'),
('A',2263,0,'Mora'),
('A',2264,0,'Moragas'),
('A',2265,0,'Moral'),
('A',2266,0,'Moraleda'),
('A',2267,0,'Morales'),
('A',2268,0,'Moran'),
('A',2269,0,'Morante'),
('A',2270,0,'Morata'),
('A',2271,0,'Morcillo'),
('A',2272,0,'Morelos'),
('A',2273,0,'Moreno'),
('A',2274,0,'Moreta'),
('A',2275,0,'Morillo'),
('A',2276,0,'Morquecho'),
('A',2277,0,'Morro'),
('A',2278,0,'Mortera'),
('A',2279,0,'Moscoso'),
('A',2280,0,'Mosquera'),
('A',2281,0,'Motila'),
('A',2282,0,'Motilla'),
('A',2283,0,'Movellan'),
('A',2284,0,'Moya'),
('A',2285,0,'Muela'),
('A',2286,0,'Mzgica'),
('A',2287,0,'Muguera'),
('A',2288,0,'Mzjica'),
('A',2289,0,'Munar'),
('A',2290,0,'Munarriz'),
('A',2291,0,'Muqiz'),
('A',2292,0,'Muqsn'),
('A',2293,0,'Muqoz'),
('A',2294,0,'Murcia'),
('A',2295,0,'Murguma'),
('A',2296,0,'Muriedas'),
('A',2297,0,'Murillo'),
('A',2298,0,'Muros'),
('A',2299,0,'Muruzabal'),
('A',2300,0,'Mut'),
('A',2301,0,'Nadal'),
('A',2302,0,'Naranajo'),
('A',2303,0,'Narbona'),
('A',2304,0,'Narvaez'),
('A',2305,0,'Narvarte'),
('A',2306,0,'Nates'),
('A',2307,0,'Nava'),
('A',2308,0,'Navaja'),
('A',2309,0,'Navamuel'),
('A',2310,0,'Navarrete'),
('A',2311,0,'Navarro'),
('A',2312,0,'Navascuis'),
('A',2313,0,'Navedas'),
('A',2314,0,'Naves'),
('A',2315,0,'Negrete'),
('A',2316,0,'Neira'),
('A',2317,0,'Neyra'),
('A',2318,0,'Nieto'),
('A',2319,0,'Nieva'),
('A',2320,0,'Nieves-ravelo'),
('A',2321,0,'Niqo'),
('A',2322,0,'Nogales'),
('A',2323,0,'Nogueira'),
('A',2324,0,'Noguer'),
('A',2325,0,'Noguera'),
('A',2326,0,'Noguero'),
('A',2327,0,'Noguis'),
('A',2328,0,'Noreqa'),
('A',2329,0,'Noriega'),
('A',2330,0,'Notario'),
('A',2331,0,'Novales'),
('A',2332,0,'Novis'),
('A',2333,0,'Novoa'),
('A',2334,0,'Nuez'),
('A',2335,0,'Nzqez'),
('A',2336,0,'O4donnell'),
('A',2337,0,'O4donojz'),
('A',2338,0,'Obiano'),
('A',2339,0,'Obra'),
('A',2340,0,'Obregsn'),
('A',2341,0,'Oca'),
('A',2342,0,'Ocampo'),
('A',2343,0,'Ocaqa'),
('A',2344,0,'Ocejo'),
('A',2345,0,'Ocerin'),
('A',2346,0,'Ochando'),
('A',2347,0,'Ocharan'),
('A',2348,0,'Ochoa'),
('A',2349,0,'Ochoarmn'),
('A',2350,0,'Ochotorena'),
('A',2351,0,'Ocsn'),
('A',2352,0,'Odena'),
('A',2353,0,'Odsn'),
('A',2354,0,'Ojeda'),
('A',2355,0,'Ojinaga'),
('A',2356,0,'Ojo'),
('A',2357,0,'Ojuelos'),
('A',2358,0,'Olabarrma'),
('A',2359,0,'Olabezar'),
('A',2360,0,'Olaiz'),
('A',2361,0,'Olaizola'),
('A',2362,0,'Olano'),
('A',2363,0,'Olarra'),
('A',2364,0,'Olarte'),
('A',2365,0,'Olaso'),
('A',2366,0,'Olea'),
('A',2367,0,'Oleta'),
('A',2368,0,'Olid'),
('A',2369,0,'Oliva'),
('A',2370,0,'Olivares'),
('A',2371,0,'Olivas'),
('A',2372,0,'Oliver'),
('A',2373,0,'Olivera'),
('A',2374,0,'Olivo'),
('A',2375,0,'Oller'),
('A',2376,0,'Olmedilla'),
('A',2377,0,'Olmedo'),
('A',2378,0,'Olmo'),
('A',2379,0,'Oloqo'),
('A',2380,0,'Omar'),
('A',2381,0,'Ondiz'),
('A',2382,0,'Ondorica'),
('A',2383,0,'Ontaneda'),
('A',2384,0,'Ontaqsn'),
('A',2385,0,'Ontiveros'),
('A',2386,0,'Oqate'),
('A',2387,0,'Oqate'),
('A',2388,0,'Oraa'),
('A',2389,0,'Orbe'),
('A',2390,0,'Orbea'),
('A',2391,0,'Orbegozo'),
('A',2392,0,'Orbejsn'),
('A',2393,0,'Orden'),
('A',2394,0,'Srdenes'),
('A',2395,0,'Ordsqez'),
('A',2396,0,'Orduqa'),
('A',2397,0,'Orejo'),
('A',2398,0,'Orejsn'),
('A',2399,0,'Orellana'),
('A',2400,0,'Oreqa'),
('A',2401,0,'Orfila'),
('A',2402,0,'Oria'),
('A',2403,0,'Orieta'),
('A',2404,0,'Orihuela'),
('A',2405,0,'Oriol'),
('A',2406,0,'Oriola'),
('A',2407,0,'Ormaechea'),
('A',2408,0,'Ornelas'),
('A',2409,0,'Ornellas'),
('A',2410,0,'Orozco'),
('A',2411,0,'Orta'),
('A',2412,0,'Ortaza'),
('A',2413,0,'Ortega'),
('A',2414,0,'Ortegsn'),
('A',2415,0,'Ortiz'),
('A',2416,0,'Ortolano'),
('A',2417,0,'Ortuqo'),
('A',2418,0,'Ortzzar'),
('A',2419,0,'Oruqa'),
('A',2420,0,'Oseguera'),
('A',2421,0,'Osinaga'),
('A',2422,0,'Osma'),
('A',2423,0,'Osorio'),
('A',2424,0,'Osuna'),
('A',2425,0,'Otamendi'),
('A',2426,0,'Otaqes'),
('A',2427,0,'Otero'),
('A',2428,0,'Ovalle'),
('A',2429,0,'Ovejas'),
('A',2430,0,'Ovejero'),
('A',2431,0,'Oviedo'),
('A',2432,0,'Ozaeta'),
('A',2433,0,'Oznayo'),
('A',2434,0,'Ozores'),
('A',2435,0,'Pablo'),
('A',2436,0,'Pacheco'),
('A',2437,0,'Pachsn'),
('A',2438,0,'Padilla'),
('A',2439,0,'Padura'),
('A',2440,0,'Paez'),
('A',2441,0,'Pagoada'),
('A',2442,0,'Paje'),
('A',2443,0,'Palacio'),
('A',2444,0,'Palacios'),
('A',2445,0,'Palafox'),
('A',2446,0,'Palazsn'),
('A',2447,0,'Palazuelos'),
('A',2448,0,'Palencia'),
('A',2449,0,'Pallas'),
('A',2450,0,'Palma'),
('A',2451,0,'Palmas'),
('A',2452,0,'Palmer'),
('A',2453,0,'Palomar'),
('A',2454,0,'Palomares'),
('A',2455,0,'Palomeque'),
('A',2456,0,'Palomino'),
('A',2457,0,'Palomo'),
('A',2458,0,'Pamames'),
('A',2459,0,'Pancorbo'),
('A',2460,0,'Pando'),
('A',2461,0,'Paniagua'),
('A',2462,0,'Pantoja'),
('A',2463,0,'Paramso'),
('A',2464,0,'Parapertusa'),
('A',2465,0,'Parbayon'),
('A',2466,0,'Pardo'),
('A',2467,0,'Paredes'),
('A',2468,0,'Pareja'),
('A',2469,0,'Parejo'),
('A',2470,0,'Parra'),
('A',2471,0,'Parreqo'),
('A',2472,0,'Pascual'),
('A',2473,0,'Pastor'),
('A',2474,0,'Pastrana'),
('A',2475,0,'Paternina'),
('A',2476,0,'Patiqo'),
('A',2477,0,'Pazl'),
('A',2478,0,'Pava'),
('A',2479,0,'Pavma'),
('A',2480,0,'Pavsn'),
('A',2481,0,'Paz'),
('A',2482,0,'Pazos'),
('A',2483,0,'Pedraja'),
('A',2484,0,'Pedraza'),
('A',2485,0,'Pedregal'),
('A',2486,0,'Pedrero'),
('A',2487,0,'Pedro'),
('A',2488,0,'Pedrola'),
('A',2489,0,'Pedrosa'),
('A',2490,0,'Pedroso'),
('A',2491,0,'Peinado'),
('A',2492,0,'Peirs'),
('A',2493,0,'Pelaez'),
('A',2494,0,'Pelayo'),
('A',2495,0,'Pelegrin'),
('A',2496,0,'Pellicer'),
('A',2497,0,'Pellsn'),
('A',2498,0,'Penagos'),
('A',2499,0,'Penilla'),
('A',2500,0,'Penyafort'),
('A',2501,0,'Peqa'),
('A',2502,0,'De la peqa'),
('A',2503,0,'Peqafiel'),
('A',2504,0,'Peqalver'),
('A',2505,0,'Peqaranda'),
('A',2506,0,'Peqas'),
('A',2507,0,'Peqasco'),
('A',2508,0,'Pequela'),
('A',2509,0,'Pera'),
('A',2510,0,'Peral'),
('A',2511,0,'Peraleda'),
('A',2512,0,'Perales'),
('A',2513,0,'Peralta'),
('A',2514,0,'Perdigsn'),
('A',2515,0,'Perea'),
('A',2516,0,'Pirea de la torre'),
('A',2517,0,'Pereda'),
('A',2518,0,'Peredo'),
('A',2519,0,'Perellss'),
('A',2520,0,'Perera'),
('A',2521,0,'Pereyra'),
('A',2522,0,'Pirez'),
('A',2523,0,'Peribaqez'),
('A',2524,0,'Perpiqan'),
('A',2525,0,'Pesquera'),
('A',2526,0,'Pezuela'),
('A',2527,0,'Picavea'),
('A',2528,0,'Picazo'),
('A',2529,0,'Pico'),
('A',2530,0,'Pidal'),
('A',2531,0,'Piedra'),
('A',2532,0,'Piedrabuena'),
('A',2533,0,'Piedras'),
('A',2534,0,'Pieragullano'),
('A',2535,0,'Pilares'),
('A',2536,0,'Pimentel'),
('A',2537,0,'Pina'),
('A',2538,0,'Pinar'),
('A',2539,0,'Pineda'),
('A',2540,0,'Pinedo'),
('A',2541,0,'Pinets'),
('A',2542,0,'Pinilla'),
('A',2543,0,'Pino'),
('A',2544,0,'Pinto'),
('A',2545,0,'Pintor'),
('A',2546,0,'Pinzsn'),
('A',2547,0,'Piqa'),
('A',2548,0,'Piqal'),
('A',2549,0,'Piqango'),
('A',2550,0,'Piqeiro'),
('A',2551,0,'Piqera'),
('A',2552,0,'Piquer'),
('A',2553,0,'Pissn'),
('A',2554,0,'Pizarro'),
('A',2555,0,'Plana'),
('A',2556,0,'De la plana'),
('A',2557,0,'Planas'),
('A',2558,0,'Plano'),
('A',2559,0,'Plaza'),
('A',2560,0,'De la plaza'),
('A',2561,0,'Polanco'),
('A',2562,0,'Polit'),
('A',2563,0,'Polo'),
('A',2564,0,'Pomar'),
('A',2565,0,'Pomares'),
('A',2566,0,'Pombo'),
('A',2567,0,'Ponce'),
('A',2568,0,'Pons'),
('A',2569,0,'Ponte'),
('A',2570,0,'Pontejos'),
('A',2571,0,'Pontsn'),
('A',2572,0,'Pontsnes'),
('A',2573,0,'Porcejana'),
('A',2574,0,'Porcel'),
('A',2575,0,'Porcell'),
('A',2576,0,'Porlier'),
('A',2577,0,'Porquera'),
('A',2578,0,'Porquero'),
('A',2579,0,'Porras'),
('A',2580,0,'Porres'),
('A',2581,0,'Portales'),
('A',2582,0,'Porter'),
('A',2583,0,'Portero'),
('A',2584,0,'Portilla'),
('A',2585,0,'De la portilla'),
('A',2586,0,'Portillo'),
('A',2587,0,'Portz'),
('A',2588,0,'Portugal'),
('A',2589,0,'Posada'),
('A',2590,0,'Posadas'),
('A',2591,0,'Posadilla'),
('A',2592,0,'Poza'),
('A',2593,0,'Pozas'),
('A',2594,0,'Pozo'),
('A',2595,0,'Del pozo'),
('A',2596,0,'Pozuelo'),
('A',2597,0,'Prada'),
('A',2598,0,'Pradera'),
('A',2599,0,'Prado'),
('A',2600,0,'Prat'),
('A',2601,0,'Prats'),
('A',2602,0,'Prego'),
('A',2603,0,'Prellezo'),
('A',2604,0,'Presa'),
('A',2605,0,'Priego'),
('A',2606,0,'Prieto'),
('A',2607,0,'Primo'),
('A',2608,0,'Prior'),
('A',2609,0,'Priorio'),
('A',2610,0,'Puebla'),
('A',2611,0,'Puente'),
('A',2612,0,'Puerta'),
('A',2613,0,'Puerto'),
('A',2614,0,'Puga'),
('A',2615,0,'Puig'),
('A',2616,0,'Puignau'),
('A',2617,0,'Puigvert'),
('A',2618,0,'Pujol'),
('A',2619,0,'Pulgar'),
('A',2620,0,'Pulido'),
('A',2621,0,'Purroy'),
('A',2622,0,'Puyol'),
('A',2623,0,'Quadra'),
('A',2624,0,'Quadrado'),
('A',2625,0,'Quadros'),
('A',2626,0,'Quartero'),
('A',2627,0,'Queipo'),
('A',2628,0,'Queipo de llano'),
('A',2629,0,'Quejada'),
('A',2630,0,'Quero'),
('A',2631,0,'Cuero'),
('A',2632,0,'Quesada'),
('A',2633,0,'Quevedo'),
('A',2634,0,'Quijada'),
('A',2635,0,'Quijano'),
('A',2636,0,'Quincoces'),
('A',2637,0,'Quindss'),
('A',2638,0,'Quintal'),
('A',2639,0,'Quintana'),
('A',2640,0,'Quintanal'),
('A',2641,0,'Quintanilla'),
('A',2642,0,'Quintano'),
('A',2643,0,'Quintero'),
('A',2644,0,'Quinto'),
('A',2645,0,'Quiqones'),
('A',2646,0,'Quiroga'),
('A',2647,0,'Quirss'),
('A',2648,0,'Quituera'),
('A',2649,0,'Quiza'),
('A',2650,0,'Rabago'),
('A',2651,0,'Rabal'),
('A',2652,0,'Rabasa'),
('A',2653,0,'Rada'),
('A',2654,0,'Radillo'),
('A',2655,0,'Raizabal'),
('A',2656,0,'Rajoy'),
('A',2657,0,'Ralas'),
('A',2658,0,'Ramales'),
('A',2659,0,'Rammrez'),
('A',2660,0,'Ramiro'),
('A',2661,0,'Ramsn'),
('A',2662,0,'Ramos'),
('A',2663,0,'Randa'),
('A',2664,0,'Raqada'),
('A',2665,0,'Rapado'),
('A',2666,0,'Raposo'),
('A',2667,0,'Rascsn'),
('A',2668,0,'Rasilla'),
('A',2669,0,'Rasines'),
('A',2670,0,'Rastia'),
('A',2671,0,'Raya'),
('A',2672,0,'Rayado'),
('A',2673,0,'Raysn'),
('A',2674,0,'Razabal'),
('A',2675,0,'Real'),
('A',2676,0,'Reales'),
('A',2677,0,'Rebollar'),
('A',2678,0,'Rebolledo'),
('A',2679,0,'Rebollo'),
('A',2680,0,'Recamn'),
('A',2681,0,'Recalde'),
('A',2682,0,'Recaqo'),
('A',2683,0,'Recarte'),
('A',2684,0,'Recio'),
('A',2685,0,'Recondo'),
('A',2686,0,'Redondo'),
('A',2687,0,'Regalado'),
('A',2688,0,'Regas'),
('A',2689,0,'Regui'),
('A',2690,0,'Reguera'),
('A',2691,0,'Reguero'),
('A',2692,0,'Reigada'),
('A',2693,0,'Reina'),
('A',2694,0,'Reinoso'),
('A',2695,0,'Remesal'),
('A',2696,0,'Remmrez'),
('A',2697,0,'Rendsn'),
('A',2698,0,'Renero'),
('A',2699,0,'Renovales'),
('A',2700,0,'Renterma'),
('A',2701,0,'Reolm'),
('A',2702,0,'Requema'),
('A',2703,0,'Requena'),
('A',2704,0,'Resines'),
('A',2705,0,'Retana'),
('A',2706,0,'Retuerto'),
('A',2707,0,'Returbio'),
('A',2708,0,'Reverter'),
('A',2709,0,'Revilla'),
('A',2710,0,'Rey'),
('A',2711,0,'Reyero'),
('A',2712,0,'Reyes'),
('A',2713,0,'Riancho'),
('A',2714,0,'Riaqo'),
('A',2715,0,'Riaran'),
('A',2716,0,'Riaza'),
('A',2717,0,'Riba'),
('A',2718,0,'Ribalta'),
('A',2719,0,'Ribas'),
('A',2720,0,'Ribelles'),
('A',2721,0,'Ribera'),
('A',2722,0,'Ribes'),
('A',2723,0,'Rica'),
('A',2724,0,'Ricardo'),
('A',2725,0,'Ricardos'),
('A',2726,0,'Rico'),
('A',2727,0,'Ricote'),
('A',2728,0,'Riego'),
('A',2729,0,'Riera'),
('A',2730,0,'Rincsn'),
('A',2731,0,'Rmo'),
('A',2732,0,'Riofrmo'),
('A',2733,0,'Rioja'),
('A',2734,0,'Riojas'),
('A',2735,0,'Riomayor'),
('A',2736,0,'Rmos'),
('A',2737,0,'Rmos'),
('A',2738,0,'Ripol'),
('A',2739,0,'Ripoll'),
('A',2740,0,'Ripollis'),
('A',2741,0,'Riquelme'),
('A',2742,0,'Riquer'),
('A',2743,0,'Rmus'),
('A',2744,0,'Riva'),
('A',2745,0,'Rivacoba'),
('A',2746,0,'Rivamontan'),
('A',2747,0,'Rivas'),
('A',2748,0,'Rivelles'),
('A',2749,0,'Rivero'),
('A',2750,0,'Rizo'),
('A',2751,0,'Roa'),
('A',2752,0,'Robledo'),
('A',2753,0,'Robles'),
('A',2754,0,'Robredo'),
('A',2755,0,'Roca'),
('A',2756,0,'Rocadilla'),
('A',2757,0,'Rocamora'),
('A',2758,0,'Rocha'),
('A',2759,0,'De la rocha'),
('A',2760,0,'Rochel'),
('A',2761,0,'Roco'),
('A',2762,0,'Roda o rodas'),
('A',2763,0,'Rodelas'),
('A',2764,0,'Rsdenas'),
('A',2765,0,'Rodero'),
('A',2766,0,'Rodolfo'),
('A',2767,0,'Rodovallo'),
('A',2768,0,'Rodrigaqez'),
('A',2769,0,'Rodrigo'),
('A',2770,0,'Rodrmguez'),
('A',2771,0,'Roelas'),
('A',2772,0,'Roiz'),
('A',2773,0,'Rojas'),
('A',2774,0,'Roji'),
('A',2775,0,'Rojo'),
('A',2776,0,'Roldan'),
('A',2777,0,'Rollizo'),
('A',2778,0,'Roma'),
('A',2779,0,'Romaguera'),
('A',2780,0,'Roman'),
('A',2781,0,'Romanm'),
('A',2782,0,'Romano'),
('A',2783,0,'Romay'),
('A',2784,0,'Romen'),
('A',2785,0,'Romeo'),
('A',2786,0,'Romero'),
('A',2787,0,'Romiu'),
('A',2788,0,'Ropero'),
('A',2789,0,'Ros'),
('A',2790,0,'Rosa'),
('A',2791,0,'Rosas'),
('A',2792,0,'Rosado'),
('A',2793,0,'Rosales'),
('A',2794,0,'Rosell'),
('A',2795,0,'Rosillo'),
('A',2796,0,'Rosique'),
('A',2797,0,'Rovira'),
('A',2798,0,'Royo'),
('A',2799,0,'Roza'),
('A',2800,0,'Rozas'),
('A',2801,0,'Rozadilla'),
('A',2802,0,'Ruano'),
('A',2803,0,'Rubalcava'),
('A',2804,0,'Rubayo'),
('A',2805,0,'Rubens'),
('A',2806,0,'Rubert'),
('A',2807,0,'Rubm'),
('A',2808,0,'Rubiales'),
('A',2809,0,'Rubin'),
('A',2810,0,'Rubio'),
('A',2811,0,'Rubira'),
('A',2812,0,'Rucabado'),
('A',2813,0,'Rucoba'),
('A',2814,0,'Rueda'),
('A',2815,0,'Ruenes'),
('A',2816,0,'Rugama'),
('A',2817,0,'Ruiloba'),
('A',2818,0,'Ruiz'),
('A',2819,0,'Rujido'),
('A',2820,0,'Rullan'),
('A',2821,0,'Rulle'),
('A',2822,0,'Rumaga'),
('A',2823,0,'Rumayor'),
('A',2824,0,'Ruperto'),
('A',2825,0,'Rutia'),
('A',2826,0,'Saavedra'),
('A',2827,0,'Sabando'),
('A',2828,0,'Sabanza'),
('A',2829,0,'Sabater'),
('A',2830,0,'Sabogal'),
('A',2831,0,'Sacosta'),
('A',2832,0,'Sacristan'),
('A',2833,0,'Sadaba'),
('A',2834,0,'Sadurnm'),
('A',2835,0,'Saenz'),
('A',2836,0,'Saez'),
('A',2837,0,'Sainz'),
('A',2838,0,'Saga'),
('A',2839,0,'Sagarra'),
('A',2840,0,'Sagarraga'),
('A',2841,0,'Sagaseta'),
('A',2842,0,'Sagasta'),
('A',2843,0,'Sagasti'),
('A',2844,0,'Sagastizabal'),
('A',2845,0,'Sagredo'),
('A',2846,0,'Sala'),
('A',2847,0,'Salaberry'),
('A',2848,0,'Salamanca'),
('A',2849,0,'Salanova'),
('A',2850,0,'Salar'),
('A',2851,0,'Salas'),
('A',2852,0,'Salazar'),
('A',2853,0,'Salceda'),
('A',2854,0,'Salcedo'),
('A',2855,0,'Salces'),
('A',2856,0,'Salcines'),
('A',2857,0,'Saldaqa'),
('A',2858,0,'Sales'),
('A',2859,0,'Sales'),
('A',2860,0,'Salgado'),
('A',2861,0,'Salguero'),
('A',2862,0,'Salinas'),
('A',2863,0,'Salmersn'),
('A',2864,0,'Salmsn'),
('A',2865,0,'Saloaga'),
('A',2866,0,'Salva'),
('A',2867,0,'Salvador'),
('A',2868,0,'Salvat'),
('A',2869,0,'Salvate'),
('A',2870,0,'Salvatierra'),
('A',2871,0,'Samaniego'),
('A',2872,0,'Samano'),
('A',2873,0,'Samboyo'),
('A',2874,0,'Samper'),
('A',2875,0,'Samperio'),
('A',2876,0,'San juan'),
('A',2877,0,'San martin'),
('A',2878,0,'San pedro'),
('A',2879,0,'San roman'),
('A',2880,0,'San vicente'),
('A',2881,0,'Sanabria'),
('A',2882,0,'Sanchez'),
('A',2883,0,'Sanchiz'),
('A',2884,0,'Sancho'),
('A',2885,0,'Sancibrian'),
('A',2886,0,'Sandoval'),
('A',2887,0,'Sangesa'),
('A',2888,0,'Sanjurjo'),
('A',2889,0,'Sans'),
('A',2890,0,'Santa ana'),
('A',2891,0,'Santa clara'),
('A',2892,0,'Santa marma'),
('A',2893,0,'Santa marina'),
('A',2894,0,'Santacruz'),
('A',2895,0,'Santander'),
('A',2896,0,'Santaolalla'),
('A',2897,0,'Santarin'),
('A',2898,0,'Santayana'),
('A',2899,0,'Santecilla'),
('A',2900,0,'Santelices'),
('A',2901,0,'Santiago'),
('A',2902,0,'Santibaqez'),
('A',2903,0,'Santillan'),
('A',2904,0,'Santillana'),
('A',2905,0,'Santillana'),
('A',2906,0,'Santisteban'),
('A',2907,0,'Santiuste'),
('A',2908,0,'Santo'),
('A',2909,0,'Santu'),
('A',2910,0,'Santos'),
('A',2911,0,'Sants'),
('A',2912,0,'Santurce'),
('A',2913,0,'Sanz'),
('A',2914,0,'Saqudo'),
('A',2915,0,'Sarabia'),
('A',2916,0,'Sarachaga'),
('A',2917,0,'Saralegui'),
('A',2918,0,'Sarasa'),
('A',2919,0,'Saravia'),
('A',2920,0,'Sarda'),
('A',2921,0,'Sardina'),
('A',2922,0,'Sariego'),
('A',2923,0,'Sarmiento'),
('A',2924,0,'Sarnes'),
('A',2925,0,'Saro'),
('A',2926,0,'Saroya'),
('A',2927,0,'Sarralde'),
('A',2928,0,'Sarralde'),
('A',2929,0,'Sarria'),
('A',2930,0,'Sartorius'),
('A',2931,0,'Sasiola'),
('A',2932,0,'Sasoamn'),
('A',2933,0,'Sastre'),
('A',2934,0,'Saurmn'),
('A',2935,0,'Savallos'),
('A',2936,0,'Savalls'),
('A',2937,0,'Schnieper'),
('A',2938,0,'Sebastian'),
('A',2939,0,'Secadura'),
('A',2940,0,'Secanellas'),
('A',2941,0,'Secanillas'),
('A',2942,0,'Seco'),
('A',2943,0,'Sedano'),
('A',2944,0,'Sedeqo'),
('A',2945,0,'Sedillo'),
('A',2946,0,'Segador'),
('A',2947,0,'Segarra'),
('A',2948,0,'Segovia'),
('A',2949,0,'Segum'),
('A',2950,0,'Segura'),
('A',2951,0,'Seguro'),
('A',2952,0,'Segurola'),
('A',2953,0,'Sein'),
('A',2954,0,'Sejo'),
('A',2955,0,'Semper'),
('A',2956,0,'Senderos'),
('A',2957,0,'Sendmn'),
('A',2958,0,'Senillosa'),
('A',2959,0,'Sentis'),
('A',2960,0,'Seqorino'),
('A',2961,0,'Sepzlveda'),
('A',2962,0,'Sequeiro'),
('A',2963,0,'Sequeiros'),
('A',2964,0,'Sequilla'),
('A',2965,0,'Serna'),
('A',2966,0,'Serra'),
('A',2967,0,'Serrada'),
('A',2968,0,'Serrador'),
('A',2969,0,'Serralta'),
('A',2970,0,'Serrano'),
('A',2971,0,'Serras'),
('A',2972,0,'Servent'),
('A',2973,0,'Servma'),
('A',2974,0,'Setiin'),
('A',2975,0,'Sevilla'),
('A',2976,0,'Sevillano'),
('A',2977,0,'Sicart'),
('A',2978,0,'Sierra'),
('A',2979,0,'Sierralta'),
('A',2980,0,'Siguero'),
('A',2981,0,'Siller'),
('A',2982,0,'Sillero'),
('A',2983,0,'Silva'),
('A',2984,0,'Da silva'),
('A',2985,0,'Silvano'),
('A',2986,0,'Silveira'),
('A',2987,0,'Silvela'),
('A',2988,0,'Silvestre'),
('A',2989,0,'Sims'),
('A',2990,0,'Soarez'),
('A',2991,0,'Soba'),
('A',2992,0,'Soberon'),
('A',2993,0,'Sobradillo'),
('A',2994,0,'Sobrado'),
('A',2995,0,'Sobrecasa'),
('A',2996,0,'Sobresoto'),
('A',2997,0,'Sobrino'),
('A',2998,0,'Sobroso'),
('A',2999,0,'Socueva'),
('A',3000,0,'Sojo'),
('A',3001,0,'Sola'),
('A',3002,0,'Solana'),
('A',3003,0,'Solano'),
('A',3004,0,'Solar'),
('A',3005,0,'Solarana'),
('A',3006,0,'Solares'),
('A',3007,0,'Solchaga'),
('A',3008,0,'Soldevilla'),
('A',3009,0,'Soler'),
('A',3010,0,'Soli'),
('A',3011,0,'Solera'),
('A',3012,0,'Solis'),
('A',3013,0,'Solorzano'),
('A',3014,0,'Solozabal'),
('A',3015,0,'Somarriba'),
('A',3016,0,'Somonte'),
('A',3017,0,'Somoza'),
('A',3018,0,'Sopelana'),
('A',3019,0,'Sopeqa'),
('A',3020,0,'Soraluce'),
('A',3021,0,'Sordo'),
('A',3022,0,'Soria'),
('A',3023,0,'Soriano'),
('A',3024,0,'Soro'),
('A',3025,0,'Sorolla'),
('A',3026,0,'Sorozabal'),
('A',3027,0,'Sorribas'),
('A',3028,0,'Sos'),
('A',3029,0,'Sosa'),
('A',3030,0,'Sota'),
('A',3031,0,'Sotelo'),
('A',3032,0,'Sotillo'),
('A',3033,0,'Soto'),
('A',3034,0,'Sotomayor'),
('A',3035,0,'Soutelo'),
('A',3036,0,'Spinello'),
('A',3037,0,'Suarez'),
('A',3038,0,'Subiri'),
('A',3039,0,'Suelves'),
('A',3040,0,'Suesa'),
('A',3041,0,'Suescun'),
('A',3042,0,'Suescura'),
('A',3043,0,'Suinaga'),
('A',3044,0,'Sulzabar'),
('A',3045,0,'Sunier'),
('A',3046,0,'Sunyer'),
('A',3047,0,'Suquma'),
('A',3048,0,'Suquiza'),
('A',3049,0,'Suso'),
('A',3050,0,'Suzola'),
('A',3051,0,'Tabar'),
('A',3052,0,'Tabera'),
('A',3053,0,'Taberner'),
('A',3054,0,'Tabernia'),
('A',3055,0,'Tablada'),
('A',3056,0,'Taboada'),
('A',3057,0,'Tagle'),
('A',3058,0,'Talamanca'),
('A',3059,0,'Talavera'),
('A',3060,0,'Talavero'),
('A',3061,0,'Tallada'),
('A',3062,0,'Tallado'),
('A',3063,0,'Talledo'),
('A',3064,0,'Tamargo'),
('A',3065,0,'Tamarit'),
('A',3066,0,'Tamariz'),
('A',3067,0,'Tamayo'),
('A',3068,0,'Tanago'),
('A',3069,0,'Tapia'),
('A',3070,0,'Taranco'),
('A',3071,0,'Tarazona'),
('A',3072,0,'Tarde'),
('A',3073,0,'Tarragona'),
('A',3074,0,'Tarrasa'),
('A',3075,0,'Tarrega'),
('A',3076,0,'Tavora'),
('A',3077,0,'Tegaliano'),
('A',3078,0,'Teja'),
('A',3079,0,'Tejada'),
('A',3080,0,'Tejedor'),
('A',3081,0,'Tejeiro'),
('A',3082,0,'Tejera'),
('A',3083,0,'Tejerina'),
('A',3084,0,'Tejero'),
('A',3085,0,'Tillez'),
('A',3086,0,'Tello'),
('A',3087,0,'Tena'),
('A',3088,0,'Tenorio'),
('A',3089,0,'Teran'),
('A',3090,0,'Tercero'),
('A',3091,0,'Teresano'),
('A',3092,0,'Terol'),
('A',3093,0,'Terraza'),
('A',3094,0,'Terrazas'),
('A',3095,0,'Terrazo'),
('A',3096,0,'Terreros'),
('A',3097,0,'Terreros'),
('A',3098,0,'Terrsn'),
('A',3099,0,'Teruel'),
('A',3100,0,'Testal'),
('A',3101,0,'Testales'),
('A',3102,0,'Testua'),
('A',3103,0,'Testa'),
('A',3104,0,'Texeira'),
('A',3105,0,'Tezanos'),
('A',3106,0,'Tiburcio'),
('A',3107,0,'Tierranueva'),
('A',3108,0,'Tijero'),
('A',3109,0,'Tinaja'),
('A',3110,0,'Tio'),
('A',3111,0,'Tirado'),
('A',3112,0,'Tizsn'),
('A',3113,0,'Toca'),
('A',3114,0,'Toledo'),
('A',3115,0,'Tomas'),
('A',3116,0,'Tomi'),
('A',3117,0,'Tomillo'),
('A',3118,0,'Topete'),
('A',3119,0,'Toral'),
('A',3120,0,'Toranzo'),
('A',3121,0,'Toraya'),
('A',3122,0,'Torcida'),
('A',3123,0,'Tordesillas'),
('A',3124,0,'Torella'),
('A',3125,0,'Torells'),
('A',3126,0,'Tormo'),
('A',3127,0,'Torner'),
('A',3128,0,'Tornera'),
('A',3129,0,'Toro'),
('A',3130,0,'Torquemada'),
('A',3131,0,'Torquillo'),
('A',3132,0,'Torrado'),
('A',3133,0,'Torralba'),
('A',3134,0,'Torre'),
('A',3135,0,'Torre'),
('A',3136,0,'De la torre'),
('A',3137,0,'Torrecilla'),
('A',3138,0,'Torrent'),
('A',3139,0,'Torrero'),
('A',3140,0,'Torero'),
('A',3141,0,'Torres'),
('A',3142,0,'Torriente'),
('A',3143,0,'Torrijos'),
('A',3144,0,'Torroja'),
('A',3145,0,'Torrontegui'),
('A',3146,0,'Tosca'),
('A',3147,0,'Tostado'),
('A',3148,0,'Tous'),
('A',3149,0,'Tovar'),
('A',3150,0,'Tovilla'),
('A',3151,0,'Trapaga'),
('A',3152,0,'Trapera'),
('A',3153,0,'Traspuesto'),
('A',3154,0,'Trebejo'),
('A',3155,0,'Trechuelo'),
('A',3156,0,'Trejo'),
('A',3157,0,'Trespalacios'),
('A',3158,0,'Treviqo'),
('A',3159,0,'Trmas'),
('A',3160,0,'Trigueiro'),
('A',3161,0,'Trigueros'),
('A',3162,0,'Trillo'),
('A',3163,0,'Trincado'),
('A',3164,0,'Trocsniz'),
('A',3165,0,'Troncoso'),
('A',3166,0,'Trueba'),
('A',3167,0,'Trujillo'),
('A',3168,0,'Trujillo'),
('A',3169,0,'Tudela'),
('A',3170,0,'Turell'),
('A',3171,0,'Turpin'),
('A',3172,0,'Turrido'),
('A',3173,0,'Tutor'),
('A',3174,0,'Txabarri'),
('A',3175,0,'Txurruca'),
('A',3176,0,'Ubach'),
('A',3177,0,'Ubaldma'),
('A',3178,0,'Ubierna'),
('A',3179,0,'Ubina'),
('A',3180,0,'Uceda'),
('A',3181,0,'Ucedo'),
('A',3182,0,'Ugalde'),
('A',3183,0,'Ugarriza'),
('A',3184,0,'Ugarte'),
('A',3185,0,'Uguet'),
('A',3186,0,'Ullauri'),
('A',3187,0,'Ulloa'),
('A',3188,0,'Unanze'),
('A',3189,0,'Unceta'),
('A',3190,0,'Undarza'),
('A',3191,0,'Ungo de velasco'),
('A',3192,0,'Ungrma'),
('A',3193,0,'Unzaga'),
('A',3194,0,'Unzueta'),
('A',3195,0,'Uralde'),
('A',3196,0,'Uranga'),
('A',3197,0,'Urbieta'),
('A',3198,0,'Urbina'),
('A',3199,0,'Urbizu'),
('A',3200,0,'Urcelay'),
('A',3201,0,'Urdangarmn'),
('A',3202,0,'Ureqa'),
('A',3203,0,'Ureta'),
('A',3204,0,'Uriarte'),
('A',3205,0,'Uribarren'),
('A',3206,0,'Uribarri'),
('A',3207,0,'Uribe'),
('A',3208,0,'Uribia'),
('A',3209,0,'Urieta'),
('A',3210,0,'Uriondo'),
('A',3211,0,'Urive'),
('A',3212,0,'Urmzar'),
('A',3213,0,'Urmeneta'),
('A',3214,0,'Urosa'),
('A',3215,0,'Urquijo'),
('A',3216,0,'Urquiola'),
('A',3217,0,'Urquiza'),
('A',3218,0,'Urquizo'),
('A',3219,0,'Urquizu'),
('A',3220,0,'Urra'),
('A',3221,0,'Urraca'),
('A',3222,0,'Urraza'),
('A',3223,0,'Urrea'),
('A',3224,0,'Urribarrena'),
('A',3225,0,'Urrizola'),
('A',3226,0,'Urroz'),
('A',3227,0,'Urrueta'),
('A',3228,0,'Urruti'),
('A',3229,0,'Urrutia'),
('A',3230,0,'Urtaza'),
('A',3231,0,'Urzaiz'),
('A',3232,0,'Usaola'),
('A',3233,0,'Usatorres'),
('A',3234,0,'Usli'),
('A',3235,0,'Usza'),
('A',3236,0,'Vaamonde'),
('A',3237,0,'Vaca'),
('A',3238,0,'Baca'),
('A',3239,0,'Vadillo'),
('A',3240,0,'Valbuena'),
('A',3241,0,'Valbueno'),
('A',3242,0,'Valcarce'),
('A',3243,0,'Valcarcel'),
('A',3244,0,'Valdecilla'),
('A',3245,0,'Valdeloma'),
('A',3246,0,'Valderrama'),
('A',3247,0,'Valdis'),
('A',3248,0,'Valdivieso'),
('A',3249,0,'Valdivieso'),
('A',3250,0,'Valencia'),
('A',3251,0,'Valenciano'),
('A',3252,0,'Valentm'),
('A',3253,0,'Valentmn'),
('A',3254,0,'Valenzuela'),
('A',3255,0,'Valera'),
('A',3256,0,'Valero'),
('A',3257,0,'Valersn'),
('A',3258,0,'Vall'),
('A',3259,0,'Valladares'),
('A',3260,0,'Valladolid'),
('A',3261,0,'Vallarta'),
('A',3262,0,'Valle'),
('A',3263,0,'Del valle'),
('A',3264,0,'Vallejo'),
('A',3265,0,'Vallis'),
('A',3266,0,'Vallines'),
('A',3267,0,'Valls'),
('A',3268,0,'Vallterra'),
('A',3269,0,'Valtanas'),
('A',3270,0,'Valterra'),
('A',3271,0,'Valtierra'),
('A',3272,0,'Valverde'),
('A',3273,0,'Van den heede'),
('A',3274,0,'Vaquer'),
('A',3275,0,'Vaquerie'),
('A',3276,0,'Vaquero'),
('A',3277,0,'Vara'),
('A',3278,0,'Varcarcel'),
('A',3279,0,'Varela'),
('A',3280,0,'Vargas'),
('A',3281,0,'Vasco'),
('A',3282,0,'Vazquez'),
('A',3283,0,'Vega'),
('A',3284,0,'De la vega'),
('A',3285,0,'Veiga'),
('A',3286,0,'Vela'),
('A',3287,0,'Velada'),
('A',3288,0,'Velarde'),
('A',3289,0,'Velasco'),
('A',3290,0,'Velazquez'),
('A',3291,0,'Veleta'),
('A',3292,0,'Vilez'),
('A',3293,0,'Velluti'),
('A',3294,0,'Venegas'),
('A',3295,0,'Venero'),
('A',3296,0,'Veneroso'),
('A',3297,0,'Ventosa'),
('A',3298,0,'Vera'),
('A',3299,0,'Verdejo'),
('A',3300,0,'Verdz'),
('A',3301,0,'Verdugo'),
('A',3302,0,'Vergara'),
('A',3303,0,'Vma'),
('A',3304,0,'Viana'),
('A',3305,0,'Vidal'),
('A',3306,0,'Vidaurreta'),
('A',3307,0,'Viedma'),
('A',3308,0,'Vigil'),
('A',3309,0,'Vilaplana'),
('A',3310,0,'Vilar'),
('A',3311,0,'Villa'),
('A',3312,0,'Villacampa'),
('A',3313,0,'Villadiego'),
('A',3314,0,'Villafranca'),
('A',3315,0,'Villalba'),
('A',3316,0,'Villalobos'),
('A',3317,0,'Villalonga'),
('A',3318,0,'Villalpando'),
('A',3319,0,'Villalta'),
('A',3320,0,'Villanueva'),
('A',3321,0,'Villanova'),
('A',3322,0,'Villar'),
('A',3323,0,'Villarejo'),
('A',3324,0,'Villaseqor'),
('A',3325,0,'Villatorta'),
('A',3326,0,'Villaverde'),
('A',3327,0,'Villegas'),
('A',3328,0,'Villena'),
('A',3329,0,'Viqa'),
('A',3330,0,'Viqas'),
('A',3331,0,'Vitoria'),
('A',3332,0,'Vivar'),
('A',3333,0,'Vizcamno'),
('A',3334,0,'Vizcarrondo'),
('A',3335,0,'Wandenhede'),
('A',3336,0,'Weiler'),
('A',3337,0,'Wernstemn'),
('A',3338,0,'Wolf'),
('A',3339,0,'Xachsn'),
('A',3340,0,'Xamar'),
('A',3341,0,'Xamer'),
('A',3342,0,'Xemar'),
('A',3343,0,'Xifra'),
('A',3344,0,'Ximinez-enciso'),
('A',3345,0,'Xuarau'),
('A',3346,0,'Xuarra'),
('A',3347,0,'Yaqez'),
('A',3348,0,'Yarnoz'),
('A',3349,0,'Yarramn'),
('A',3350,0,'Ybarra'),
('A',3351,0,'Yibana'),
('A',3352,0,'Yebra'),
('A',3353,0,'Yilez'),
('A',3354,0,'Yepes'),
('A',3355,0,'Yermo'),
('A',3356,0,'Yerobi'),
('A',3357,0,'Yerro'),
('A',3358,0,'Yoldi'),
('A',3359,0,'Yuso'),
('A',3360,0,'Yuste'),
('A',3361,0,'Zabala'),
('A',3362,0,'Zabaleta'),
('A',3363,0,'Zaballos'),
('A',3364,0,'Zabalza'),
('A',3365,0,'Zaldmvar'),
('A',3366,0,'Zambrana'),
('A',3367,0,'Zambrano'),
('A',3368,0,'Zamora'),
('A',3369,0,'Zamorano'),
('A',3370,0,'Zapata'),
('A',3371,0,'Zara'),
('A',3372,0,'Zaragoza'),
('A',3373,0,'Zarate'),
('A',3374,0,'Zarauz'),
('A',3375,0,'Zarco'),
('A',3376,0,'Zarza'),
('A',3377,0,'Zavala'),
('A',3378,0,'Zavallos'),
('A',3379,0,'Zayas'),
('A',3380,0,'Zerda'),
('A',3381,0,'Zifuentes'),
('A',3382,0,'Zilla'),
('A',3383,0,'Ziordia'),
('A',3384,0,'Zorrilla'),
('A',3385,0,'Zuaza'),
('A',3386,0,'Zubero'),
('A',3387,0,'Zubiaur'),
('A',3388,0,'Zubieta'),
('A',3389,0,'Zubiri'),
('A',3390,0,'Zubirma'),
('A',3391,0,'Zubizarreta'),
('A',3392,0,'Zuloaga'),
('A',3393,0,'Zulueta'),
('A',3394,0,'Zumarraga'),
('A',3395,0,'Zumave'),
('A',3396,0,'Zumaya'),
('A',3397,0,'Zzqiga'),
('A',3398,0,'Zurbano'),
('A',3399,0,'Zurbaran'),
('A',3400,0,'Zurco'),
('A',3401,0,'Zurita'),
('A',3402,0,'Zuza'),
('N',1,0,'Enrique'),
('N',2,0,'Juan'),
('N',3,0,'Jes�s'),
('N',4,0,'Jorge'),
('N',5,0,'David'),
('N',6,0,'�ngel'),
('N',7,0,'Lu�s'),
('N',8,0,'Manuel'),
('n',9,0,'Salvador'),
('N',10,0,'V�ctor'),
('N',11,0,'Jos�');
/*!40000 ALTER TABLE `_NOMBRE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `_NOTICIA`
--

DROP TABLE IF EXISTS `_NOTICIA`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `_NOTICIA` (
  `NOTICIAID` int(11) NOT NULL AUTO_INCREMENT,
  `FECHA` date DEFAULT NULL,
  `AUTOR` varchar(64) DEFAULT NULL,
  `ENVIADO` tinyint(4) NOT NULL DEFAULT 0,
  PRIMARY KEY (`NOTICIAID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci COMMENT='Noticias del Sistema';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_NOTICIA`
--

LOCK TABLES `_NOTICIA` WRITE;
/*!40000 ALTER TABLE `_NOTICIA` DISABLE KEYS */;
/*!40000 ALTER TABLE `_NOTICIA` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `_NOTICIAT`
--

DROP TABLE IF EXISTS `_NOTICIAT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `_NOTICIAT` (
  `NOTICIAID` int(11) NOT NULL DEFAULT 0,
  `IDIOMAID` char(2) NOT NULL DEFAULT '',
  `ASUNTO` varchar(255) DEFAULT NULL,
  `TEXTO` longtext DEFAULT NULL,
  PRIMARY KEY (`NOTICIAID`,`IDIOMAID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci COMMENT='Textos de la Noticia';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_NOTICIAT`
--

LOCK TABLES `_NOTICIAT` WRITE;
/*!40000 ALTER TABLE `_NOTICIAT` DISABLE KEYS */;
/*!40000 ALTER TABLE `_NOTICIAT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `_PAGINAT`
--

DROP TABLE IF EXISTS `_PAGINAT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `_PAGINAT` (
  `TEXTOID` varchar(64) NOT NULL DEFAULT '',
  `IDIOMAID` char(2) NOT NULL DEFAULT '',
  `TEXTO` longtext DEFAULT NULL,
  PRIMARY KEY (`TEXTOID`,`IDIOMAID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci COMMENT='Textos mayoritariamente est�ticos de las p�ginas (titulos, p';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_PAGINAT`
--

LOCK TABLES `_PAGINAT` WRITE;
/*!40000 ALTER TABLE `_PAGINAT` DISABLE KEYS */;
INSERT INTO `_PAGINAT` VALUES
('','ca',NULL),
('','en',''),
('','es',''),
('.comprar','ca','Comprar'),
('.comprar','en','Buy'),
('.comprar','es','Comprar'),
('.dias','ca','Dies'),
('.dias','en','Days'),
('.dias','es','D�as'),
('.funciones','ca','Funcions'),
('.funciones','en','Functions'),
('.funciones','es','Funciones'),
('.meses','ca','Mesos'),
('.meses','en','Months'),
('.meses','es','Meses'),
('.vender','ca','Vendre'),
('.vender','en','Sell'),
('.vender','es','Vender'),
('.volver','ca','Tornar'),
('.volver','en','Return to Top'),
('.volver','es','Volver'),
('101','ca','Tipus de Recurs'),
('accion.correo','ca','Missatges Pendents'),
('accion.correo','en','Pending Messages'),
('accion.correo','es','Mensajes Pendientes'),
('accion.correoEntrante','ca','Missatges Rebuts'),
('accion.correoEntrante','en','Received Messages'),
('accion.correoEntrante','es','Mensajes Recibidos'),
('accion.correoSaliente','ca','Missatges Enviats'),
('accion.correoSaliente','en','Messages Sent'),
('accion.correoSaliente','es','Mensajes Enviados'),
('accion.escribirMensaje','ca','Escriure un Missatge Nou'),
('accion.escribirMensaje','en','New Message'),
('accion.escribirMensaje','es','Escribir un Nuevo Mensaje'),
('accion.funcionesCorreo','ca','Funcions de Correu'),
('accion.funcionesCorreo','en','Mail Functions'),
('accion.funcionesCorreo','es','Funciones de Correo'),
('actividad.comentarios','ca','Descripci� de la Activitat'),
('actividad.comentarios','en','Activity Description'),
('actividad.comentarios','es','Descripci�n de la Actividad'),
('actividad.descripcion','ca','Nom de l\'Activitat'),
('actividad.descripcion','en','Activity Name'),
('actividad.descripcion','es','Nombre de la Actividad'),
('actividad.informacion','ca','Ajuda d\'Activitats'),
('actividad.informacion','en','Activities Help'),
('actividad.informacion','es','Ayuda de Actividades'),
('actividad.title','ca','Ajuda d\'Activitats'),
('actividad.title','en','Activities Help'),
('actividad.title','es','Ayuda de Actividades'),
('ayuda.005.desc','ca',''),
('ayuda.005.desc','en',''),
('ayuda.005.desc','es','El mercado es la forma de obtener los recursos de la forma m�s r�pida en Religious, aunque tambi�n puede ser la m�s cara. Te puede ir bien sobretodo al principio para localizar los objetos m�s inveros�miles o bien para alimentar a tus monjes, ya que al inicio no dispondr�s de comida.'),
('ayuda.temas','ca','Temes d\'ajuda'),
('ayuda.temas','en','Help Chapters'),
('ayuda.temas','es','Temas de ayuda'),
('ayuda.title','ca','Ayuda de Religious'),
('ayuda.title','en','Religious Help'),
('ayuda.title','es','Ayuda de Religious'),
('ayuda.volver','ca','Tornar'),
('ayuda.volver','en','Return to Top'),
('ayuda.volver','es','Volver'),
('ayudas.010.desc','ca','<p>Religious es un juego de simulaci�n y estrategia que en el cual asumes la gesti�n monasterio y todos sus recursos en la Alta Edad Media, con el objeto de llevar la gloria a tu monasterio y a tu orden religiosa.</p><p>Como gestor de tu monasterio, deber�s asignar las tareas de tus monjes seg�n sus caracter�sticas, comprar y vender los recursos necesarios, y hacer que la evoluci�n del mismo sea equilibrada.</p><p>Un exceso de dinero en tu monasterio puede hacer peligrar la forma en que tus feligreses te vean y el �xito de tu monasterio estar� ligado a los mismos, pero no contar con las monedas suficientes te hara pasar por incontables penurias</p>'),
('ayudas.010.desc','en','<p>Religious is a game of simulation and strategy that in which you assume the management monastery and all its resources in the High Average Age, with the intention of taking the glory to your monastery and to your religious order.</p><p>Like manager of your monastery, you will have to assign the tasks of your monks according to its characteristics, of buying and of selling the resources necessary, and to cause that the evolution of the same one is balanced.</p><p>An excess of money in your monastery can make be in danger the form in which your feligreses see you and the success of your monastery will be bound to such, but not to count on the currencies sufficient hara to happen to you through countless shortages</p>'),
('ayudas.010.desc','es','<p>Religious es un juego de simulaci�n y estrategia que en el cual asumes la gesti�n monasterio y todos sus recursos en la Alta Edad Media, con el objeto de llevar la gloria a tu monasterio y a tu orden religiosa.</p><p>Como gestor de tu monasterio, deber�s asignar las tareas de tus monjes seg�n sus caracter�sticas, comprar y vender los recursos necesarios, y hacer que la evoluci�n del mismo sea equilibrada.</p><p>Un exceso de dinero en tu monasterio puede hacer peligrar la forma en que tus feligreses te vean y el �xito de tu monasterio estar� ligado a los mismos, pero no contar con las monedas suficientes te hara pasar por incontables penurias</p>'),
('ayudas.010.titulo','ca','Introducci�n'),
('ayudas.010.titulo','en','Introduction'),
('ayudas.010.titulo','es','Introducci�n'),
('ayudas.020.desc','ca',''),
('ayudas.020.desc','en',''),
('ayudas.020.desc','es','Ser escogido <b>Abad Primado</b> es tal vez el objetivo m�s deseado en Religious, aunque tu primer objetivo deber�a ser hacer crecer tu �rden Religiosa hasta lo m�s alto.\r\nComo miembro de religious compartes el objetivo con multitud de monasterios de conseguir llevar a tu �rden religiosa a lo m�s alto del escalaf�n eclesi�stico.\r\nComo Abad Primado asumes la gesti�n de tu orden, dictando los caminos a seguir y asumiendo la responsabilidad, entre otras, de echar aquellos monasterios de tu �rden que no sigan tus dictados.\r\nComo Prior de tu monasterio, asumes el reto personal de conseguir ser nombrado el Abad Primado de tu �rden y el reto a�adido de seguir los dictados de tu Abad Primado.'),
('ayudas.020.titulo','ca','Objectius del Joc'),
('ayudas.020.titulo','en',''),
('ayudas.020.titulo','es','Objetivos del Juego'),
('ayudas.030.desc','ca','<p>Mediante la inscripci�n se te solicitan tus datos de contacto y es un paso necesario para que puedas tener tu monasterio.</p><p>El proceso es simple y ha sido dividido en dos partes; tus datos de contacto y los del tu monasterio.</p><p>Entre tus datos personales debes especificar tu nick o nombre que se dar� a conocer, tu nombre real, la contrase�a de acceso, y tu direcci�n de correo electr�nico como datos imprescindibles.</p><p>No hay normas establecidas (al menos de momento) sobre el hecho de tener multicuentas, lo que quiere decir que est� permitido. El motivo de que est� permitido es que por ahora dudamos que tenga una ventaja real el hecho de tenerlas.</p><p>Otros datos que deber�s seleccionar son el idioma y el estilo. Religious nace con 2 idiomas (Castellano y Catal�n), pero esperamos tenerlo en pocos d�as en Ingles, y estamos buscando colaboradores que nos ayuden a la traducci�n a otras lenguas del territorio espa�ol (en especial al Euskera y Gallego). Por este motivo estas lenguas pueden tardar un poco m�s, aunque nos hace m�s ilusi�n que el Ingl�s.</p><p>En cuanto al estilo, Religious implementa tambi�n tecnolog�a para m�ltiples estilos gr�ficos. En estos momentos hay 2 estilos (SilverBlue y Fuego) con colores fr�os y c�lidos que est�n parcialmente implementados pero que se pueden utilizar. Esperamos implantar m�s en breve.</p><p>Una vez introducidos y enviados tus datos de contacto, se te solicitar�n los datos de tu monasterio, que son muy simples; el nombre que le vas a dar, la regi�n en la que debe ser construido y la orden religiosa a la que quieres pertenecer.</p><p>Una vez enviados estos datos ser�s miembro de pleno derecho de la comunidad Religious</p>'),
('ayudas.030.desc','en',''),
('ayudas.030.desc','es','<p>Mediante la inscripci�n se te solicitan tus datos de contacto y es un paso necesario para que puedas tener tu monasterio.</p><p>El proceso es simple y ha sido dividido en dos partes; tus datos de contacto y los del tu monasterio.</p><p>Entre tus datos personales debes especificar tu nick o nombre que se dar� a conocer, tu nombre real, la contrase�a de acceso, y tu direcci�n de correo electr�nico como datos imprescindibles.</p><p>No hay normas establecidas (al menos de momento) sobre el hecho de tener multicuentas, lo que quiere decir que est� permitido. El motivo de que est� permitido es que por ahora dudamos que tenga una ventaja real el hecho de tenerlas.</p><p>Otros datos que deber�s seleccionar son el idioma y el estilo. Religious nace con 2 idiomas (Castellano y Catal�n), pero esperamos tenerlo en pocos d�as en Ingles, y estamos buscando colaboradores que nos ayuden a la traducci�n a otras lenguas del territorio espa�ol (en especial al Euskera y Gallego). Por este motivo estas lenguas pueden tardar un poco m�s, aunque nos hace m�s ilusi�n que el Ingl�s.</p><p>En cuanto al estilo, Religious implementa tambi�n tecnolog�a para m�ltiples estilos gr�ficos. En estos momentos hay 2 estilos (SilverBlue y Fuego) con colores fr�os y c�lidos que est�n parcialmente implementados pero que se pueden utilizar. Esperamos implantar m�s en breve.</p><p>Una vez introducidos y enviados tus datos de contacto, se te solicitar�n los datos de tu monasterio, que son muy simples; el nombre que le vas a dar, la regi�n en la que debe ser construido y la orden religiosa a la que quieres pertenecer.</p><p>Una vez enviados estos datos ser�s miembro de pleno derecho de la comunidad Religious</p>'),
('ayudas.030.titulo','ca','Inscripci�n'),
('ayudas.030.titulo','en',''),
('ayudas.030.titulo','es','Inscripci�n'),
('ayudas.040.desc','ca','<p>Como ya se ha comentado con anterioridad, Religious posee varios estilos gr�ficos y cada uno de ellos tiene una organizaci�n distinta de las p�ginas, lo que complica un poco explicar como encontrar las cosas. De todas formas, vamos a intentarlo.</p><p>En la parte superior encontrar�s el logo del juego, que tendr� dos formatos.</p><p>Cuando estes desconectado, el logo estar� limpio y las opciones se te presentar�n en la pantalla principal.</p><p>Sin embargo, una vez identificado, vislumbrar�s las opciones del juego, que explicaremos a continuaci�n.</p><p>Tambien en cuanto estes identificado, visualizar�s los datos de tu orden en el lado izquierdo de la p�gina, y en la barra inferior dispondr�s de informaci�n general de tu monasterio, orden religiosa y regi�n.</p>'),
('ayudas.040.desc','en',''),
('ayudas.040.desc','es','<p>Como ya se ha comentado con anterioridad, Religious posee varios estilos gr�ficos y cada uno de ellos tiene una organizaci�n distinta de las p�ginas, lo que complica un poco explicar como encontrar las cosas. De todas formas, vamos a intentarlo.</p><p>En la parte superior encontrar�s el logo del juego, que tendr� dos formatos.</p><p>Cuando estes desconectado, el logo estar� limpio y las opciones se te presentar�n en la pantalla principal. Sin embargo, una vez identificado, vislumbrar�s las opciones del juego, que explicaremos a continuaci�n.</p><p>Tambien en cuanto estes identificado, visualizar�s los datos de tu orden en el lado izquierdo de la p�gina, y en la barra inferior dispondr�s de informaci�n general de tu monasterio, orden religiosa y regi�n.</p>'),
('ayudas.040.titulo','ca','Como encontrar cada cosa'),
('ayudas.040.titulo','en',''),
('ayudas.040.titulo','es','Como encontrar cada cosa'),
('ayudas.050.desc','ca',''),
('ayudas.050.desc','en',''),
('ayudas.050.desc','es','<p>Una vez inscrito, pasar�s a ser el gestor de tu monasterio y se te asignar�n no menos de 5 monjes, con caracter�sticas distintas cada uno de ellos.</p><p>Tu primer objetivo deber�a ser asegurar la supervivencia de los mismos, para lo que deber�s buscar comida.\r\nPuedes encontrar comida en el mercado y ser� una opci�n f�cil , ya que inicialmente cuentas tambi�n con una cantidad de monedas que te servir�n.</p><p>Otra de las opciones es la caza o pesca. En estos casos el resultado depende en gran medida de lo poblado de tus bosques y/o r�os. Si te dedicas en demas�a a estas actividades ver�s como paulatinamente desciende su efectividad.</p><p>Las otras posibilidades como la siembra y cosecha por un lado y la cr�a de ganado precisan de un edificio para su consecuci�n, y la creaci�n del mismo necesita un tiempo del que en principio no dispones.</p><p>Hay algo importante que no debes olvidar: En Religious no basta con tener comida, hay que cocinarla. Tus monjes no podr�n comer hasta que tengas comida preparada en tu cocina, as� que no descuides este aspecto.</p>'),
('ayudas.050.titulo','ca','Despr�s de l\'Inscripci�'),
('ayudas.050.titulo','en','After Register'),
('ayudas.050.titulo','es','Despu�s de la Inscripc��n'),
('ayudas.060.desc','ca',''),
('ayudas.060.desc','en',''),
('ayudas.060.desc','es','En <b>Religious</b> es muy importante la coordinaci�n de las tareas de los monjes. Para ello dispones de dos procesos para conseguir este fin. El primero es la asignaci�n de tareas del monasterio, donde puedes gobernar de forma generica a todos tus monjes. De esta forma, puedes asignar las tareas de todos ellos a un tiempo, cosa que ser� muy importante hacer al inicio del juego. Las actividades te ayudar�n a hacer crecer tu monasterio, pero deber�s buscar tu equilibrio, ya que puedes perder a tus monjes tanto por falta de recursos como por falta de fe como por un accidente.'),
('ayudas.060.titulo','ca','Les tasques'),
('ayudas.060.titulo','en',''),
('ayudas.060.titulo','es','Las tareas'),
('ayudas.070.desc','ca',''),
('ayudas.070.desc','en',''),
('ayudas.070.desc','es','Deber�s conocer a tus monjes si deseas ser elegido <b>Abad Primado</b>. Cada monje es una entidad totalmente distinta de las dem�s en Religious, as� que es muy importante utilizar a cada monje para las actividades que mejor sabe realizar. Algunas caracter�sticas como la salud, el cansancio, la fe y otras afectan, aunque no por igual, a todos las actividades. Es por este motivo que deber�s vigilar en todo momento la evoluci�n de las mismas.'),
('ayudas.070.titulo','ca','Els monjos'),
('ayudas.070.titulo','en',''),
('ayudas.070.titulo','es','Los monjes'),
('borrarMercadoAction.noExiste','ca','No s\'ha pogut eliminar la compravenda (�s possible que ja hagi estat executada)'),
('borrarMercadoAction.noExiste','en','It has not been possible to eliminate the transaction (it is possible that it has been executed already)'),
('borrarMercadoAction.noExiste','es','No se ha podido eliminar la compraventa (es posible que ya haya sido ejecutada)'),
('clan.economia','ca','Economia'),
('clan.economia','en','Economy'),
('clan.economia','es','Econom�a'),
('clan.espiritu','ca','Espiritualitat'),
('clan.espiritu','en','Spirituality'),
('clan.espiritu','es','Espiritualidad'),
('clan.info','ca','Informaci� de l\'�rdre Religiosa'),
('clan.info','en','Information of the Religious Order'),
('clan.info','es','Informaci�n de la �rden Religiosa'),
('clan.informacion','ca','Informaci�'),
('clan.informacion','en','Information'),
('clan.informacion','es','Informaci�n'),
('clan.monasterios','ca','Monestirs'),
('clan.monasterios','en','Monasteries'),
('clan.monasterios','es','Monasterios'),
('clan.nombreEquipo','ca','Monestir'),
('clan.nombreEquipo','en','Monastery'),
('clan.nombreEquipo','es','Monasterio'),
('clan.otros','ca','Altres Monestirs'),
('clan.otros','en','Other Monasteries'),
('clan.otros','es','Otros Monasterios'),
('clan.ranking','ca','Posici�'),
('clan.ranking','en','Ranking'),
('clan.ranking','es','Posici�n'),
('clan.tecnologia','ca','Tecnologia'),
('clan.tecnologia','en','Technology'),
('clan.tecnologia','es','Tecnolog�a'),
('clan.title','ca','Religious: Informaci� de l\'�rdre Religiosa'),
('clan.title','en','The Religious Game: Information of the Religious Order'),
('clan.title','es','Religious: Informaci�n de la �rden Religiosa'),
('construirEdificio.accion','ca','Acci�'),
('construirEdificio.accion','en','Action'),
('construirEdificio.accion','es','Acci�n'),
('construirEdificio.construir','ca','Construir'),
('construirEdificio.construir','en','Build'),
('construirEdificio.construir','es','Construir'),
('construirEdificio.costeConstruccion','ca','Costes de Construcci�n'),
('construirEdificio.costeConstruccion','en','Building Costs'),
('construirEdificio.costeConstruccion','es','Costes de Construcci�n'),
('construirEdificio.tiempoConstruccion','ca','Temps de Construcci�'),
('construirEdificio.tiempoConstruccion','en','Time to Build'),
('construirEdificio.tiempoConstruccion','es','Tiempo de Construcci�n'),
('construirEdificio.tipoEdificio','ca','Tipus d\'Edifici'),
('construirEdificio.tipoEdificio','en','Building Type'),
('construirEdificio.tipoEdificio','es','Tipo de Edificio'),
('construirEdificio.tiposDeEdificio','ca','Pots Construir els Seg�ents Edificis'),
('construirEdificio.tiposDeEdificio','en','You can Construct the Following Buildings'),
('construirEdificio.tiposDeEdificio','es','Puedes Construir los Siguientes Edificios'),
('construirEdificio.title','ca','The Religious Game: Construcci� d\'Edificis'),
('construirEdificio.title','en','The Religious Game: Construction of Buildings'),
('construirEdificio.title','es','The Religious Game: Construcci�n de Edificios'),
('construirEdificio.tusEdificios','ca','Els Teus Edificis'),
('construirEdificio.tusEdificios','en','Your Buildings'),
('construirEdificio.tusEdificios','es','Tus Edificios'),
('construirEdificio.utilidadEdificio','ca','Utilidad del Edificio'),
('construirEdificio.utilidadEdificio','en','Building Utility'),
('construirEdificio.utilidadEdificio','es','Utilidad del Edificio'),
('construirEdificioAction.faltanRecursos','ca','No s\'ha pogut constuir l\'edifici per manca de recursos'),
('construirEdificioAction.faltanRecursos','en','It has not been possible to construct the building by lack of resources'),
('construirEdificioAction.faltanRecursos','es','No se ha podido construir el edificio por falta de recursos'),
('correo.asunto','ca','Asunto'),
('correo.asunto','en','Subject'),
('correo.asunto','es','Asunto'),
('correo.de','ca','De'),
('correo.de','en','From'),
('correo.de','es','De'),
('correo.escribir','ca','Escribir un Nuevo Mensaje'),
('correo.escribir','en','Write a New Message'),
('correo.escribir','es','Escribir un Nuevo Mensaje'),
('correo.fecha','ca','Fechas'),
('correo.fecha','en','Dates'),
('correo.fecha','es','Fechas'),
('correo.mensaje','ca','Missatge'),
('correo.mensaje','en','Message'),
('correo.mensaje','es','Mensaje'),
('correo.mensajesEnviados','ca','Ver los Mensajes Enviados por Mi'),
('correo.mensajesEnviados','en','See Messages Sent by Me'),
('correo.mensajesEnviados','es','Ver los Mensajes Enviados por Mi'),
('correo.mensajesRecibidos','ca','Mensajes Recibidos'),
('correo.mensajesRecibidos','en','Received messages'),
('correo.mensajesRecibidos','es','Mensajes Recibidos'),
('correo.para','ca','Per a'),
('correo.para','en','To'),
('correo.para','es','Para'),
('correo.title','ca','Correo'),
('correo.title','en','The Religious Game: Mail'),
('correo.title','es','Correo'),
('correoEntrante.mensajesRecibidos','ca','Missatges Rebuts'),
('correoEntrante.mensajesRecibidos','en','Received messages'),
('correoEntrante.mensajesRecibidos','es','Mensajes Recibidos'),
('correoSaliente.asunto','ca','Asunto'),
('correoSaliente.asunto','en','Subject'),
('correoSaliente.asunto','es','Asunto'),
('correoSaliente.escribir','ca','Escribir un Nuevo Mensaje'),
('correoSaliente.escribir','en','Write a New Message'),
('correoSaliente.escribir','es','Escribir un Nuevo Mensaje'),
('correoSaliente.fecha','ca','Fechas'),
('correoSaliente.fecha','en','Dates'),
('correoSaliente.fecha','es','Fechas'),
('correoSaliente.mensajesEnviados','ca','Mensajes Enviados'),
('correoSaliente.mensajesEnviados','en','Sent messages'),
('correoSaliente.mensajesEnviados','es','Mensajes Enviados'),
('correoSaliente.mensajesRecibidos','ca','Ver los Mensajes Recibidos'),
('correoSaliente.mensajesRecibidos','en','See the Received Messages'),
('correoSaliente.mensajesRecibidos','es','Ver los Mensajes Recibidos'),
('correoSaliente.para','ca','Para'),
('correoSaliente.para','en','To'),
('correoSaliente.para','es','Para'),
('donar.donar','ca','Donar'),
('donar.donar','en','Donate'),
('donar.donar','es','Donar'),
('donar.puestoVenta','ca','Has posat a la venda'),
('donar.puestoVenta','en','You have put on sale'),
('donar.puestoVenta','es','Has puesto a la venta'),
('donar.recurso','ca','Recurs'),
('donar.recurso','en','Resource'),
('donar.recurso','es','Recurso'),
('donar.tienes','ca','Ara tens'),
('donar.tienes','en','Now you have'),
('donar.tienes','es','Ahora tienes'),
('donar.title','ca','Donar Recursos'),
('donar.title','en','The Religious Game: Donate Resources'),
('donar.title','es','Donar Recursos'),
('edificio.anos','ca','anys'),
('edificio.anos','en','years old'),
('edificio.anos','es','a�os'),
('edificio.asignacion','ca','�Que vols que facin els monjos en aquest edifici?'),
('edificio.asignacion','en','What you want that they do mones in this building?'),
('edificio.asignacion','es','�Que quieres que hagan los mones en este edificio?'),
('edificio.caducaEn','ca','Caduca en'),
('edificio.caducaEn','en','It expires in'),
('edificio.caducaEn','es','Caduca en'),
('edificio.cantidad','ca','Quantitat'),
('edificio.cantidad','en','Quantity'),
('edificio.cantidad','es','Cantidad'),
('edificio.derribar','ca','Derribar Edificio'),
('edificio.derribar','en','Demolish Building'),
('edificio.derribar','es','Derribar Edificio'),
('edificio.edad','ca','Edat'),
('edificio.edad','en','Age'),
('edificio.edad','es','Edad'),
('edificio.enviar','ca','Confirmar Asignacions'),
('edificio.enviar','en','Confirm Tasks'),
('edificio.enviar','es','Confirmar Asignaciones'),
('edificio.estado','ca','Estat'),
('edificio.estado','en','Status'),
('edificio.estado','es','Estado'),
('edificio.fechaConstruccion','ca','Data Construcci�'),
('edificio.fechaConstruccion','en','Construction Date'),
('edificio.fechaConstruccion','es','Fecha Construcci�n'),
('edificio.horas','ca','Hores'),
('edificio.horas','en','Hours'),
('edificio.horas','es','Horas'),
('edificio.info','ca','Informaci� del Edifici'),
('edificio.info','en','Building Information'),
('edificio.info','es','Informaci�n del Edificio'),
('edificio.mejorar','ca','Millorar Edifici'),
('edificio.mejorar','en','Improve Building'),
('edificio.mejorar','es','Mejorar Edificio'),
('edificio.nacimiento','ca','Data de Naixement'),
('edificio.nacimiento','en','Birth Date'),
('edificio.nacimiento','es','Fecha de Nacimiento'),
('edificio.nivel','ca','Nivell'),
('edificio.nivel','en','Level'),
('edificio.nivel','es','Nivel'),
('edificio.nombre','ca','Nom'),
('edificio.nombre','en','Name'),
('edificio.nombre','es','Nombre'),
('edificio.otros','ca','Altres Edificis'),
('edificio.otros','en','Other Buildings'),
('edificio.otros','es','Otros Edificios'),
('edificio.peso','ca','Pes'),
('edificio.peso','en','Weight'),
('edificio.peso','es','Peso'),
('edificio.recursos','ca','Recursos Enmagatzemats a l\'Edifici'),
('edificio.recursos','en','Resources Stored in the Building'),
('edificio.recursos','es','Recursos Almacenados en el Edificio'),
('edificio.subastar','ca','Subastar'),
('edificio.subastar','en','Auction'),
('edificio.subastar','es','Subastar'),
('edificio.tipoEdificio','ca','Tipus d\'Edifici'),
('edificio.tipoEdificio','en','Building Type'),
('edificio.tipoEdificio','es','Tipo de Edificio'),
('edificio.tipoRecurso','ca','Tipo de Recurso'),
('edificio.tipoRecurso','en','Resource Type'),
('edificio.tipoRecurso','es','Tipo de Recurso'),
('edificio.unicos','ca','Recursos �nics de l\'edifici'),
('edificio.unicos','en','Unique Resources of the Building'),
('edificio.unicos','es','Recursos �nicos del Edificio'),
('edificio.utilidad','ca','Utilitat de l\'Edifici'),
('edificio.utilidad','en','Building Utility'),
('edificio.utilidad','es','Utilidad del Edificio'),
('edificioActividad.actividad','ca','Tasca'),
('edificioActividad.actividad','en','Task'),
('edificioActividad.actividad','es','Tarea'),
('edificioActividad.alta','ca','Alta'),
('edificioActividad.alta','en','High'),
('edificioActividad.alta','es','Alta'),
('edificioActividad.asignacion','ca','Asignaci� actual'),
('edificioActividad.asignacion','en','Current task'),
('edificioActividad.asignacion','es','Asignaci�n actual'),
('edificioActividad.asignaciones','ca','Asignacions actuals de l\'edifici'),
('edificioActividad.asignaciones','en','Current tasks of the building'),
('edificioActividad.asignaciones','es','Asignaciones actuales del edificio'),
('edificioActividad.baja','ca','Baixa'),
('edificioActividad.baja','en','Low'),
('edificioActividad.baja','es','Baja'),
('edificioActividad.borrar','ca','Esborrar'),
('edificioActividad.borrar','en','Delete'),
('edificioActividad.borrar','es','Borrar'),
('edificioActividad.cantidad','ca','Quantitat'),
('edificioActividad.cantidad','en','Quantity'),
('edificioActividad.cantidad','es','Cantidad'),
('edificioActividad.enviar','ca','Guardar asignaci�'),
('edificioActividad.enviar','en','Save'),
('edificioActividad.enviar','es','Guardar asignaci�n'),
('edificioActividad.estado','ca','Estat'),
('edificioActividad.estado','en','Status'),
('edificioActividad.estado','es','Estado'),
('edificioActividad.fechaConstruccion','ca','Data de construcci�'),
('edificioActividad.fechaConstruccion','en','Building Date'),
('edificioActividad.fechaConstruccion','es','Fecha de construcci�n'),
('edificioActividad.info','ca','Informaci� de l\'edifici'),
('edificioActividad.info','en','Building Information'),
('edificioActividad.info','es','Informaci�n del edificio'),
('edificioActividad.maximo','ca','d\'un m�xim de '),
('edificioActividad.maximo','en','of a maximum of'),
('edificioActividad.maximo','es','de un m�ximo de '),
('edificioActividad.media','ca','Mitja'),
('edificioActividad.media','en','Medium'),
('edificioActividad.media','es','Media'),
('edificioActividad.prioridad','ca','Prioritat'),
('edificioActividad.prioridad','en','Priority'),
('edificioActividad.prioridad','es','Prioridad'),
('edificioActividad.recurso','ca','Tipus de recurs'),
('edificioActividad.recurso','en','Resource type'),
('edificioActividad.recurso','es','Tipo de recurso'),
('edificioActividad.tipoEdificio','ca','Tipus d\'edifici'),
('edificioActividad.tipoEdificio','en','Building type'),
('edificioActividad.tipoEdificio','es','Tipo de Edificio'),
('edificios.accion','ca','Acci�n'),
('edificios.accion','en','Action'),
('edificios.accion','es','Acci�n'),
('edificios.construidos','ca','Construits'),
('edificios.construidos','en','Built'),
('edificios.construidos','es','Construidos'),
('edificios.construir','ca','Construir Nous Edificis'),
('edificios.construir','en','Construct New Buildings'),
('edificios.construir','es','Construir Nuevos Edificios'),
('edificios.derribar','ca','Derribar'),
('edificios.derribar','en','Demolish'),
('edificios.derribar','es','Derribar'),
('edificios.edificiosConstruidos','ca','Edificios Construidos en tu Monasterio'),
('edificios.edificiosConstruidos','en','Buildings Constructed in your Monastery'),
('edificios.edificiosConstruidos','es','Edificios Construidos en tu Monasterio'),
('edificios.enCons','ca','En Construcci�'),
('edificios.enCons','en','In Construction'),
('edificios.enCons','es','En Construcci�n'),
('edificios.enConstruccion','ca','Edificios en Construcci�n en tu Monasterio'),
('edificios.enConstruccion','en','Buildings in Construction in your Monastery'),
('edificios.enConstruccion','es','Edificios en Construcci�n en tu Monasterio'),
('edificios.fechaConstruccion','ca','Fecha de Construcci�n'),
('edificios.fechaConstruccion','en','Construction Date'),
('edificios.fechaConstruccion','es','Fecha de Construcci�n'),
('edificios.tipoEdificio','ca','Tipo de Edificio'),
('edificios.tipoEdificio','en','Building Type'),
('edificios.tipoEdificio','es','Tipo de Edificio'),
('edificios.title','ca','Edificios de tu Monasterio'),
('edificios.title','en','Buildings of your Monastery'),
('edificios.title','es','Edificios de tu Monasterio'),
('edificios.tusEdificios','ca','Els Teus Edificis'),
('edificios.tusEdificios','en','Your Buildings'),
('edificios.tusEdificios','es','Tus Edificios'),
('edificios.utilidad','ca','Utilidad'),
('edificios.utilidad','en','Utility'),
('edificios.utilidad','es','Utilidad'),
('equipo.clima0','ca','Avui llueix un sol espl�ndid'),
('equipo.clima0','en','Today it illuminates the splendid Sun'),
('equipo.clima0','es','Hoy luce un sol espl�ndido'),
('equipo.clima1','ca','Avui llueix un sol amb alguns n�vols en la teva regi�'),
('equipo.clima1','en','Today it illuminates the Sun with some clouds in your region'),
('equipo.clima1','es','Hoy luce un sol con algunas nubes en tu regi�n'),
('equipo.clima2','ca','La pluja envaeix la teva regi� en el dia d\'avui'),
('equipo.clima2','en','The rain invades your region today'),
('equipo.clima2','es','La lluvia invade tu regi�n en el d�a de hoy'),
('equipo.clima3','ca','La teva regi� ha clarejat nevada'),
('equipo.clima3','en','Your region has dawned snowed'),
('equipo.clima3','es','Tu regi�n ha amanecido nevada'),
('equipo.clima4','ca','Hi ha una poderosa tempesta sobre la teva regi� en el dia d\'avui'),
('equipo.clima4','en','A powerful thunderstorm hovers on your region in today'),
('equipo.clima4','es','Una poderosa tormenta se cierne sobre tu regi�n en el d�a de hoy'),
('equipo.clima5','ca','La calamarsa que cau en la teva regi� amena�a els cultius i quelcom m�s'),
('equipo.clima5','en','The hail that falls down in your region threatens the cultures and something more'),
('equipo.clima5','es','El granizo que cae en tu regi�n amenaza los cultivos y algo m�s'),
('equipo.fecha','ca','Data'),
('equipo.fecha','en','Date'),
('equipo.fecha','es','Fecha'),
('equipo.grados','ca','�C'),
('equipo.grados','en','�C'),
('equipo.grados','es','�C'),
('equipo.habitantes','ca','habitants'),
('equipo.habitantes','en','inhabitants'),
('equipo.habitantes','es','habitantes'),
('equipo.hoy_es','ca','Avui �s '),
('equipo.hoy_es','en','Hoy es '),
('equipo.hoy_es','es','Hoy es '),
('equipo.mensaje','ca','Missatge'),
('equipo.mensaje','en','Message'),
('equipo.mensaje','es','Mensaje'),
('equipo.poblacion','ca','Poblaci�:'),
('equipo.poblacion','en','Population:'),
('equipo.poblacion','es','Poblaci�n:'),
('equipo.recursos','ca','Recursos'),
('equipo.recursos','en','Resources'),
('equipo.recursos','es','Recursos'),
('equipo.temperatura','ca','La temperatura �s de '),
('equipo.temperatura','en','The temperature is '),
('equipo.temperatura','es','La temperatura es de '),
('equipo.tiempoRegion','ca','El temps a la teva regi�'),
('equipo.tiempoRegion','en','The climate in your region'),
('equipo.tiempoRegion','es','El tiempo en tu regi�n'),
('equipo.title','ca','The Religious Game: Informaci� del Monestir'),
('equipo.title','en','The Religious Game: Information of the Monastery'),
('equipo.title','es','The Religious Game: Informaci�n del Monasterio'),
('error.faltaEmail','ca','Ha d\'indicar una adre�a de correu electr�nic.'),
('error.faltaEmail','en','You must indicate an e-mail address.'),
('error.faltaEmail','es','Debe indicar una direcci�n de correo electr�nico.'),
('error.faltaNick','ca','Ha d\'indicar un nick.'),
('error.faltaNick','en','You must indicate a nick.'),
('error.faltaNick','es','Debe indicar un nick.'),
('error.faltaNickEmail','ca','Ha de informar el nick o be l\'adre�a de correu electr�nic.'),
('error.faltaNickEmail','en','You must inform nick or the account of e-mail.'),
('error.faltaNickEmail','es','Debe informar el nick o bien la cuenta de e-mail.'),
('error.faltaNombre','ca','Ha d\'indicar un nom.'),
('error.faltaNombre','en','You must indicate a name.'),
('error.faltaNombre','es','Debe indicar un nombre.'),
('error.faltaOrden','ca','Ha de seleccionar una Ordre Religiosa.'),
('error.faltaOrden','en','You must select a Religious Order.'),
('error.faltaOrden','es','Debe seleccionar una Orden Religiosa.'),
('error.faltaPW','ca','Ha d\'indicar una paraula d\'access.'),
('error.faltaPW','en','You must indicate a password.'),
('error.faltaPW','es','Debe indicar una contrase�a.'),
('error.faltaRegion','ca','Ha de seleccionar una Regi�.'),
('error.faltaRegion','en','It must select a Region.'),
('error.faltaRegion','es','Debe seleccionar una Regi�n.'),
('error.nickBloqueado','ca','Aquest nick esta bloquejat.'),
('error.nickBloqueado','en','Nick is blocked.'),
('error.nickBloqueado','es','El nick esta bloqueado.'),
('error.nickUsado','ca','Aquest nick l\'esta fent servir un altre usuari.'),
('error.nickUsado','en','Nick is being used by another user.'),
('error.nickUsado','es','El nick esta siendo usado por otro usuario.'),
('error.nombreMonasterio','ca','Ha d\'indicar un nom de monestir.'),
('error.nombreMonasterio','en','You must indicate a name of monastery.'),
('error.nombreMonasterio','es','Debe indicar un nombre de monasterio.'),
('error.PWDistintas','ca','Les paraules d\'access no coincideixen.'),
('error.PWDistintas','en','The passwords do not coincide.'),
('error.PWDistintas','es','Las contrase�as no coinciden.'),
('error.usuarioNoEncontrado','ca','L\'usuari assenyalat no ha estat registrat a Religious'),
('error.usuarioNoEncontrado','en','The stated user has not been registered in Religious.'),
('error.usuarioNoEncontrado','es','El usuario indicado no ha sido registrado en Religious.'),
('escribirMensaje.asunto','ca','Asunto'),
('escribirMensaje.asunto','en','Subject'),
('escribirMensaje.asunto','es','Asunto'),
('escribirMensaje.de','ca','De'),
('escribirMensaje.de','en','From'),
('escribirMensaje.de','es','De'),
('escribirMensaje.enviar','ca','Enviar Mensaje'),
('escribirMensaje.enviar','en','Send Message'),
('escribirMensaje.enviar','es','Enviar Mensaje'),
('escribirMensaje.mensaje','ca','Mensaje'),
('escribirMensaje.mensaje','en','Message'),
('escribirMensaje.mensaje','es','Mensaje'),
('escribirMensaje.nuevoMensaje','ca','Nuevo Mensaje'),
('escribirMensaje.nuevoMensaje','en','New Message'),
('escribirMensaje.nuevoMensaje','es','Nuevo Mensaje'),
('escribirMensaje.para','ca','Para'),
('escribirMensaje.para','en','To'),
('escribirMensaje.para','es','Para'),
('escribirMensajeAction.faltaAsunto','ca','Ha d\'indicar un assumpte .'),
('escribirMensajeAction.faltaAsunto','en','You must indicate a subject.'),
('escribirMensajeAction.faltaAsunto','es','Debe indicar un asunto.'),
('escribirMensajeAction.faltaDestinatario','ca','Ha d\'indicar un destinatari.'),
('escribirMensajeAction.faltaDestinatario','en','You must indicate a recipient.'),
('escribirMensajeAction.faltaDestinatario','es','Debe indicar un destinatario.'),
('escribirMensajeAction.nickNoExiste','ca','No hi ha cap usuari amb aquest Nick.'),
('escribirMensajeAction.nickNoExiste','en','There is no user with this Nick.'),
('escribirMensajeAction.nickNoExiste','es','No hay ning�n usuario con ese Nick.'),
('hombre.ayudaActividad','ca','Ajuda d\'Activitats'),
('hombre.ayudaActividad','en','Activities Help'),
('hombre.ayudaActividad','es','Ayuda de Actividades'),
('hombre.caracteristicas','ca','Caracter�stiques'),
('hombre.caracteristicas','en','Capabilities'),
('hombre.caracteristicas','es','Caracter�sticas'),
('hombre.edad','ca','Edat'),
('hombre.edad','en','Age'),
('hombre.edad','es','Edad'),
('hombre.enviar','ca','Guardar canvis'),
('hombre.enviar','en','Send'),
('hombre.enviar','es','Guardar cambios'),
('hombre.fechaEntrada','ca','Data d\'Ingr�s'),
('hombre.fechaEntrada','en','Date of Entrance'),
('hombre.fechaEntrada','es','Fecha de Ingreso'),
('hombre.fechaFallecimiento','ca','Data de la Mort'),
('hombre.fechaFallecimiento','en','Date of Death'),
('hombre.fechaFallecimiento','es','Fecha de Fallecimiento'),
('hombre.fechaNacimiento','ca','Data de Naixement'),
('hombre.fechaNacimiento','en','Birth Date'),
('hombre.fechaNacimiento','es','Fecha de Nacimiento'),
('hombre.habilidades','ca','Habilitats'),
('hombre.habilidades','en','Habilities'),
('hombre.habilidades','es','Habilidades'),
('hombre.informacion','ca','Informaci� del Monjo'),
('hombre.informacion','en','Monk Information'),
('hombre.informacion','es','Informaci�n del Monje'),
('hombre.jerarquia','ca','Jerarquia'),
('hombre.jerarquia','en','Hierarchy'),
('hombre.jerarquia','es','Jerarqu�a'),
('hombre.mensajes','ca','Missatjes'),
('hombre.mensajes','en','Messages'),
('hombre.mensajes','es','Mensajes'),
('hombre.nombre','ca','Nom'),
('hombre.nombre','en','Name'),
('hombre.nombre','es','Nombre'),
('hombre.otros','ca','Altres Monjos'),
('hombre.otros','en','Other Monks'),
('hombre.otros','es','Otros Monjes'),
('hombre.tareas','ca','Tasques'),
('hombre.tareas','en','Tasks'),
('hombre.tareas','es','Tareas'),
('hombre.tareasMonje','ca','Tasques setmanals de '),
('hombre.tareasMonje','en','Weekly Tasks of '),
('hombre.tareasMonje','es','Tareas semanales de '),
('hombre.vitales','ca','Caracter�stiques<br>Vitals'),
('hombre.vitales','en','Vital<br>Capabilities'),
('hombre.vitales','es','Caracter�sticas<br>Vitales'),
('hombres.anos','ca','anys'),
('hombres.anos','en','years old'),
('hombres.anos','es','a�os'),
('hombres.edad','ca','Edat'),
('hombres.edad','en','Age'),
('hombres.edad','es','Edad'),
('hombres.habilidades','ca','Habilitats'),
('hombres.habilidades','en','Habilities'),
('hombres.habilidades','es','Habilidades'),
('hombres.mensajes','ca','Not�cies'),
('hombres.mensajes','en','News'),
('hombres.mensajes','es','Not�cias'),
('hombres.monjes','ca','Monjos del teu Monestir'),
('hombres.monjes','en','Monks in you Monastery'),
('hombres.monjes','es','Monjes de tu Monasterio'),
('hombres.nombre','ca','Nom'),
('hombres.nombre','en','Name'),
('hombres.nombre','es','Nombre'),
('hombres.vitales','ca','Caracter�stiques<br>Vitals'),
('hombres.vitales','en','Vital<br>Capabilities'),
('hombres.vitales','es','Caracter�sticas Vitales'),
('index.title','ca','The Religious Game'),
('index.title','en','The Religious Game'),
('index.title','es','The Religious Game'),
('index_bottom.ahora','ca','Ara a Religious'),
('index_bottom.ahora','en','Now in Religious'),
('index_bottom.ahora','es','Ahora en Religious'),
('index_bottom.comunicados','ca','�LTIMS COMUNICATS'),
('index_bottom.comunicados','en','LAST OFFICIAL NOTICES'),
('index_bottom.comunicados','es','�LTIMOS COMUNICADOS'),
('index_bottom.monasterio','ca','El teu Monestir'),
('index_bottom.monasterio','en','Your Monastery'),
('index_bottom.monasterio','es','Tu Monasterio'),
('index_bottom.orden','ca','La Ordre'),
('index_bottom.orden','en','Your Order'),
('index_bottom.orden','es','Tu Orden'),
('index_bottom.region','ca','La teva Regi�'),
('index_bottom.region','en','Your Region'),
('index_bottom.region','es','Tu Regi�n'),
('index_bottom.ultimoComunicado','ca',''),
('index_bottom.ultimoComunicado','en',''),
('index_bottom.ultimoComunicado','es',''),
('index_bottom.usuarios','ca','Usuaris'),
('index_bottom.usuarios','en','Users'),
('index_bottom.usuarios','es','Usuarios'),
('index_left.correo','ca','Correu'),
('index_left.correo','en','Mail'),
('index_left.correo','es','Correo'),
('index_left.desconectar','ca','Desconnectar'),
('index_left.desconectar','en','Disconnect'),
('index_left.desconectar','es','Desconectar'),
('index_left.edificios','ca','Edificis'),
('index_left.edificios','en','Buildings'),
('index_left.edificios','es','Edificios'),
('index_left.jugandoennet','ca','Jugando en .NET'),
('index_left.jugandoennet','en','Jugando en .NET'),
('index_left.jugandoennet','es','Jugando en .NET'),
('index_left.mercado','ca','Mercat'),
('index_left.mercado','en','Market'),
('index_left.mercado','es','Mercado'),
('index_left.monasterio','ca','Monestir'),
('index_left.monasterio','en','Monastery'),
('index_left.monasterio','es','Monasterio'),
('index_left.monjes','ca','Monjos'),
('index_left.monjes','en','Monks'),
('index_left.monjes','es','Monjes'),
('index_left.preferencias','ca','Prefer�ncies'),
('index_left.preferencias','en','Preferences'),
('index_left.preferencias','es','Preferencias'),
('index_left.tareas','ca','Tasques del Monestir'),
('index_left.tareas','en','Monastery Tasks'),
('index_left.tareas','es','Tareas del Monasterio'),
('inscripcion.email','ca','Correu Electr�nic'),
('inscripcion.email','en','E-mail'),
('inscripcion.email','es','Correo Electr�nico '),
('inscripcion.emailDesc','ca','La teva adre�a de correu electr�nic (important per estar informat dels canvis en el joc)'),
('inscripcion.emailDesc','en','Your e-mail address (importantly to be informed about the changes in the game)'),
('inscripcion.emailDesc','es','Tu direcci�n de correo electr�nico (importante para estar informado de los cambios en el juego)'),
('inscripcion.enviar','ca','Enviar'),
('inscripcion.enviar','en','Send'),
('inscripcion.enviar','es','Enviar'),
('inscripcion.estilo','ca','Estil'),
('inscripcion.estilo','en','Style'),
('inscripcion.estilo','es','Estilo'),
('inscripcion.estiloDesc','ca','Escull l\'estil que m�s t\'agradi per a visualitzar les p�gines del joc'),
('inscripcion.estiloDesc','en','Choose the style that more you like to visualize the pages of the game.'),
('inscripcion.estiloDesc','es','Escoge el estilo que m�s te guste para visualizar las p�ginas del juego.'),
('inscripcion.idioma','ca','Idioma '),
('inscripcion.idioma','en','Language'),
('inscripcion.idioma','es','Idioma '),
('inscripcion.idiomaDesc','ca','L\'idioma amb el qual vols que ens comuniquem amb tu'),
('inscripcion.idiomaDesc','en','The language with which you want that we communicate with you'),
('inscripcion.idiomaDesc','es','El idioma con el que quieres que nos comuniquemos contigo'),
('inscripcion.nick','ca','Nick'),
('inscripcion.nick','en','Nick'),
('inscripcion.nick','es','Nick'),
('inscripcion.nickDesc','ca','Nom pel qual et coneixeran els altres jugadors'),
('inscripcion.nickDesc','en','Name for which other players will meet you'),
('inscripcion.nickDesc','es','Nombre por el que te conocer�n los dem�s jugadores '),
('inscripcion.nombre','ca','Nom complet'),
('inscripcion.nombre','en','Complete Name'),
('inscripcion.nombre','es','Nombre completo'),
('inscripcion.nombreDesc','ca','El teu nom i cognoms (opcional)'),
('inscripcion.nombreDesc','en','Your first and last names (optional)'),
('inscripcion.nombreDesc','es','Tu nombre y apellidos  (opcional)'),
('inscripcion.password','ca','Paraula d\'acc�s'),
('inscripcion.password','en','Password'),
('inscripcion.password','es','Contrase�a'),
('inscripcion.password2','ca','Repeteix la paraula d\'acc�s'),
('inscripcion.password2','en','Repeat your password'),
('inscripcion.password2','es','Repite la contrase�a'),
('inscripcion.password2Desc','ca','Repeteix la paraula d\'acc�s per a major seguretat'),
('inscripcion.password2Desc','en','You repeat the password for major safety'),
('inscripcion.password2Desc','es','Repite la contrase�a para mayor seguridad '),
('inscripcion.passwordDesc','ca','Paraula d\'acc�s que nom�s tu deus con�ixer per a accedir al joc'),
('inscripcion.passwordDesc','en','Password that only you must know to accede to the game'),
('inscripcion.passwordDesc','es','Palabra de acceso que s�lo tu debes conocer para acceder al juego '),
('inscripcion.region','ca','Elegeix una Regi�'),
('inscripcion.region','en','You choose a Region'),
('inscripcion.region','es','Elige una Regi�n'),
('inscripcion.title','ca','The Religious Game: Inscripci� en el Joc (Pas 1 de 2)'),
('inscripcion.title','en','Religious Game: Inscription in the Game (1 of 2)'),
('inscripcion.title','es','The Religious Game: Inscripci�n en el Juego (Paso 1 de 2)'),
('inscripcion.tusDatos','ca','Les Teves Dades'),
('inscripcion.tusDatos','en','Your information'),
('inscripcion.tusDatos','es','Tus datos'),
('inscripcion.web','ca','P�gina Web'),
('inscripcion.web','en','Web site'),
('inscripcion.web','es','P�gina Web'),
('inscripcion.webDesc','ca','La teva p�gina web (opcional)'),
('inscripcion.webDesc','en','Your web site (optional) '),
('inscripcion.webDesc','es','Tu p�gina web (opcional)'),
('inscripcion2.actualmente','ca','Nom o pertinen�a actual'),
('inscripcion2.actualmente','en','Name or current belonging'),
('inscripcion2.actualmente','es','Nombre o pertenencia actual'),
('inscripcion2.emblema','ca','Emblema'),
('inscripcion2.emblema','en','Emblem'),
('inscripcion2.emblema','es','Emblema'),
('inscripcion2.enviar','ca','Enviar'),
('inscripcion2.enviar','en','Send'),
('inscripcion2.enviar','es','Enviar'),
('inscripcion2.habito','ca','H�bit'),
('inscripcion2.habito','en','Habit'),
('inscripcion2.habito','es','H�bito'),
('inscripcion2.historiaOrden','ca','Hist�ria de l\'Ordre'),
('inscripcion2.historiaOrden','en','History of the Order'),
('inscripcion2.historiaOrden','es','Historia de la Orden'),
('inscripcion2.mapa','ca','Mapa'),
('inscripcion2.mapa','en','Map'),
('inscripcion2.mapa','es','Mapa'),
('inscripcion2.nombreMonasterio','ca','Nom del teu monestir'),
('inscripcion2.nombreMonasterio','en','Name of your monastery'),
('inscripcion2.nombreMonasterio','es','Nombre de tu monasterio'),
('inscripcion2.orden','ca','Ordre'),
('inscripcion2.orden','en','Order'),
('inscripcion2.orden','es','Orden'),
('inscripcion2.poblacion','ca','Poblaci�'),
('inscripcion2.poblacion','en','Population'),
('inscripcion2.poblacion','es','Poblaci�n'),
('inscripcion2.region','ca','Regi�'),
('inscripcion2.region','en','Region'),
('inscripcion2.region','es','Regi�n'),
('inscripcion2.regiones','ca','Regions'),
('inscripcion2.regiones','en','Regions'),
('inscripcion2.regiones','es','Regiones'),
('inscripcion2.title','ca','The Religious Game: Inscripci� en el Joc (Pas 2 de 2)'),
('inscripcion2.title','en','The Religious Game: Inscription in the Game (2 of 2)'),
('inscripcion2.title','es','The Religious Game: Inscripci�n en el Juego (Paso 2 de 2)'),
('inscripcion2.tusPreferencias','ca','Les teves prefer�ncies'),
('inscripcion2.tusPreferencias','en','Your preferences'),
('inscripcion2.tusPreferencias','es','Tus preferencias'),
('inscripcion2.tusPreferenciasDesc','ca','<p>Escull un nom per al teu monestir i tot seguit, l\'ordre i la regi� a les quals desitges pert�nyer.</p><p>El teu monestir ser� constru�t la regi� que seleccionis. El seu clima, relacions comercials, poblaci� i multitud de caracter�stiques m�s afectaran a l\'evoluci� del teu monestir, aix� com la teva evoluci� afectar� a la regi�.</p>De forma an�loga, la forma de viure de l\'Ordre Religiosa de la teva elecci� determinar� i condicionar� la teva evoluci�.</p>\r\n\r\n'),
('inscripcion2.tusPreferenciasDesc','en','<p> You choose a name for your monastery and forthwith, the order and the region to that you want to belong. </> <p> Your monastery there will be constructed the region that you select. His climate, commercial relations, population and multitude of characteristics more will concern the evolution of your monastery, as well as your evolution will affect to the region. </p> <p> Of analogous form, the way of living of the Religious Order of your election will determine and determine your evolution. <p>'),
('inscripcion2.tusPreferenciasDesc','es','<p>Escoge un nombre para tu monasterio y acto seguido, la orden y la regi�n a las que deseas pertenecer.</><p>Tu monasterio ser� construido la regi�n que selecciones. Su clima, relaciones comerciales, poblaci�n y multitud de caracter�sticas m�s afectar�n a la evoluci�n de tu monasterio, as� como tu evoluci�n afectar� a la regi�n.</p><p>De forma an�loga, la forma de vivir de la Orden Religiosa de tu elecci�n determinar� y condicionar� tu evoluci�n.<p>'),
('loginAction.erroneo','ca','ERRONI'),
('loginAction.erroneo','en','WRONG'),
('loginAction.erroneo','es','ERR�NEO'),
('mercado.accion','ca','Acci�'),
('mercado.accion','en','Action'),
('mercado.accion','es','Acci�n'),
('mercado.alaventa','ca','A la venda a la teva ciutat'),
('mercado.alaventa','en','On sale in your city'),
('mercado.alaventa','es','A la venta en tu ciudad'),
('mercado.aMercado','ca','A Mercat'),
('mercado.aMercado','en','At Market Price'),
('mercado.aMercado','es','A Mercado'),
('mercado.borrar','ca','Esborrar'),
('mercado.borrar','en','Delete'),
('mercado.borrar','es','Borrar'),
('mercado.cantidad','ca','Quantitat'),
('mercado.cantidad','en','Quantity'),
('mercado.cantidad','es','Cantidad'),
('mercado.compra','ca','Compra'),
('mercado.compra','en','Buy'),
('mercado.compra','es','Compra'),
('mercado.compraventas','ca','Compres i Vendes'),
('mercado.compraventas','en','Transactions'),
('mercado.compraventas','es','Compras y Ventas'),
('mercado.funciones','ca','Funcions del Mercat'),
('mercado.funciones','en','Market Functions'),
('mercado.funciones','es','Funciones de Mercado'),
('mercado.modificar','ca','Modificar'),
('mercado.modificar','en','Modify'),
('mercado.modificar','es','Modificar'),
('mercado.monedasOro','ca','Monedes d\'Or'),
('mercado.monedasOro','en','Golden Pieces'),
('mercado.monedasOro','es','Monedas de Oro'),
('mercado.ordenadas','ca','Compres y Vendes Ordenades'),
('mercado.ordenadas','en','Ordered Transactions'),
('mercado.ordenadas','es','Compras y Ventas Ordenadas'),
('mercado.precio','ca','Preu'),
('mercado.precio','en','Price'),
('mercado.precio','es','Precio'),
('mercado.recurso','ca','Recurs'),
('mercado.recurso','en','Resource'),
('mercado.recurso','es','Recurso'),
('mercado.subastas','ca','Subastes'),
('mercado.subastas','en','Auctions'),
('mercado.subastas','es','Subastas'),
('mercado.tipo','ca','Tipus'),
('mercado.tipo','en','Type'),
('mercado.tipo','es','Tipo'),
('mercado.tusRecursos','ca','Pots Vendre'),
('mercado.tusRecursos','en','You can sell'),
('mercado.tusRecursos','es','Puedes Vender'),
('mercado.venta','ca','Venda'),
('mercado.venta','en','Sell'),
('mercado.venta','es','Venta'),
('mercado.verRecurso','ca','Veure Informaci� del Recurs'),
('mercado.verRecurso','en','Display Resource Information'),
('mercado.verRecurso','es','Ver Informaci�n del Recurso'),
('mercadoCompra.ahoraTienes','ca','Ara Tens'),
('mercadoCompra.ahoraTienes','en','Now you have'),
('mercadoCompra.ahoraTienes','es','Ahora tienes'),
('mercadoCompra.aPorcentaje','ca','Al preu de mercat  (+/-)'),
('mercadoCompra.aPorcentaje','en','At Market Price (+/-)'),
('mercadoCompra.aPorcentaje','es','Al precio de mercado (+/-)'),
('mercadoCompra.aPrecioFijo','ca','A preu fix'),
('mercadoCompra.aPrecioFijo','en','At Fixed Price'),
('mercadoCompra.aPrecioFijo','es','A precio fijo'),
('mercadoCompra.aPrecioMercado','ca','A preu de mercat'),
('mercadoCompra.aPrecioMercado','en','At Market Price'),
('mercadoCompra.aPrecioMercado','es','A precio de mercado'),
('mercadoCompra.cantidadCompra','ca','Quantitat Compra'),
('mercadoCompra.cantidadCompra','en','Quantity to Buy'),
('mercadoCompra.cantidadCompra','es','Cantidad Compra'),
('mercadoCompra.cantidadVenta','ca','Quantitat Venda'),
('mercadoCompra.cantidadVenta','en','Quantity to Sell'),
('mercadoCompra.cantidadVenta','es','Cantidad Venta'),
('mercadoCompra.comprar','ca','Comprar'),
('mercadoCompra.comprar','en','Buy'),
('mercadoCompra.comprar','es','Comprar'),
('mercadoCompra.enviar','ca','Comprar'),
('mercadoCompra.enviar','en','Buy'),
('mercadoCompra.enviar','es','Comprar'),
('mercadoCompra.estado','ca','Estat del Mercat'),
('mercadoCompra.estado','en','Market Status'),
('mercadoCompra.estado','es','Estado del Mercado'),
('mercadoCompra.estadoMercado','ca','Estat del Mercat per al Recurs Seleccionat'),
('mercadoCompra.estadoMercado','en','Market Status for the Selected Resource'),
('mercadoCompra.estadoMercado','es','Estado del Mercado para el Recurso Seleccionado'),
('mercadoCompra.funciones','ca','Funcions de Compra'),
('mercadoCompra.funciones','en','Buy Functions'),
('mercadoCompra.funciones','es','Funciones de Compra'),
('mercadoCompra.hasComprado','ca','Has Ordenat Comprar'),
('mercadoCompra.hasComprado','en','You have ordered to buy'),
('mercadoCompra.hasComprado','es','Has ordenado comprar'),
('mercadoCompra.monedasOro','ca','Monedes d\'Or'),
('mercadoCompra.monedasOro','en','Golden Pieces'),
('mercadoCompra.monedasOro','es','Monedas de Oro'),
('mercadoCompra.precio','ca','Preu'),
('mercadoCompra.precio','en','Price'),
('mercadoCompra.precio','es','Precio'),
('mercadoCompra.precioMercado','ca','Preu Actual del Mercat'),
('mercadoCompra.precioMercado','en','Current Market Price'),
('mercadoCompra.precioMercado','es','Precio Actual del Mercado'),
('mercadoCompra.recurso','ca','Recurs'),
('mercadoCompra.recurso','en','Resource'),
('mercadoCompra.recurso','es','Recurso'),
('mercadoCompra.tuCompra','ca','La Teva Compra'),
('mercadoCompra.tuCompra','en','Your purchase'),
('mercadoCompra.tuCompra','es','Tu Compra'),
('mercadoCompraAction.faltaEspacio','ca','No hi ha espai per enmagatzemar la posible compra.'),
('mercadoCompraAction.faltaEspacio','en','There is no space to store the possible purchase.'),
('mercadoCompraAction.faltaEspacio','es','No hay espacio para almacenar la posible compra.'),
('mercadoCompraAction.faltanMonedas','ca','No hi ha prou monedes d\'or per la compra.'),
('mercadoCompraAction.faltanMonedas','en','There are no sufficient gold pieces for the purchase.'),
('mercadoCompraAction.faltanMonedas','es','No hay suficientes monedas de oro para la compra.'),
('mercadoCompraAction.faltaPrecio','ca','Ha d\'indicar un preu correcte.'),
('mercadoCompraAction.faltaPrecio','en','You must indicate a correct price.'),
('mercadoCompraAction.faltaPrecio','es','Debe indicar un precio correcto.'),
('mercadoCompraAction.faltaRecurso','ca','No s\'ha indicat cap Recurs a Comprar.'),
('mercadoCompraAction.faltaRecurso','en','You have not indicated any Resource To buy.'),
('mercadoCompraAction.faltaRecurso','es','No se ha indicado ning�n Recurso a Comprar.'),
('mercadoVenta.aPorcentaje','ca','Al preu de mercat  (+/-)'),
('mercadoVenta.aPorcentaje','en','At Market Price (+/-)'),
('mercadoVenta.aPorcentaje','es','Al precio de mercado (+/-)'),
('mercadoVenta.aPrecioFijo','ca','A preu fix'),
('mercadoVenta.aPrecioFijo','en','At Fixed Price'),
('mercadoVenta.aPrecioFijo','es','A precio fijo'),
('mercadoVenta.aPrecioMercado','ca','Al preu del mercat'),
('mercadoVenta.aPrecioMercado','en','At Market Price'),
('mercadoVenta.aPrecioMercado','es','Al precio del mercado'),
('mercadoVenta.cantidadCompra','ca','Quantitat Compra'),
('mercadoVenta.cantidadCompra','en','Quantity to Buy'),
('mercadoVenta.cantidadCompra','es','Cantidad Compra'),
('mercadoVenta.cantidadVenta','ca','Quantitat Venda'),
('mercadoVenta.cantidadVenta','en','Quantity to Sell'),
('mercadoVenta.cantidadVenta','es','Cantidad Venta'),
('mercadoVenta.estadoMercado','ca','Estat del Mercat per al Recurs Seleccionat'),
('mercadoVenta.estadoMercado','en','State of the Market for the Chosen Resource'),
('mercadoVenta.estadoMercado','es','Estado del Mercado para el Recurso Seleccionado'),
('mercadoVenta.monedasOro','ca','Monedes d\'Or'),
('mercadoVenta.monedasOro','en','Golden Pieces'),
('mercadoVenta.monedasOro','es','Monedas de Oro'),
('mercadoVenta.ponerVenta','ca','Posar a la Venda:'),
('mercadoVenta.ponerVenta','en','Put on Sale:'),
('mercadoVenta.ponerVenta','es','Poner a la Venta:'),
('mercadoVenta.precio','ca','Preu'),
('mercadoVenta.precio','en','Price'),
('mercadoVenta.precio','es','Precio'),
('mercadoVenta.precioMercado','ca','Preu Actual del Mercat:'),
('mercadoVenta.precioMercado','en','Current Market Price:'),
('mercadoVenta.precioMercado','es','Precio Actual del Mercado:'),
('mercadoVenta.puestoVenta','ca','Posat ja a la venda:'),
('mercadoVenta.puestoVenta','en','Put already on sale:'),
('mercadoVenta.puestoVenta','es','Puesto ya a la venta:'),
('mercadoVenta.recurso','ca','Recurs'),
('mercadoVenta.recurso','en','Resource'),
('mercadoVenta.recurso','es','Recurso'),
('mercadoVenta.recursos','ca','Recursos per a vendre'),
('mercadoVenta.recursos','en','Resources to sell'),
('mercadoVenta.recursos','es','Recursos para vender'),
('mercadoVentaAction.faltanRecursos','ca','La quantitat &1 �s m�s gran que la disponible &2 per al recurs &3.'),
('mercadoVentaAction.faltanRecursos','en','The quantity &1 is major than the available &2 for the resource &3.'),
('mercadoVentaAction.faltanRecursos','es','La cantidad &1 es mayor que la disponible &2 para el recurso &3.'),
('mercadoVentaAction.faltaPrecio','ca','Ha d\'indicar un preu correcte per &1.'),
('mercadoVentaAction.faltaPrecio','en','You must indicate a correct price for &1.'),
('mercadoVentaAction.faltaPrecio','es','Debe indicar un precio correcto para &1.'),
('principal.asunto','ca','Asunto'),
('principal.asunto','en','Subject'),
('principal.asunto','es','Asunto'),
('principal.autor','ca','Autor'),
('principal.autor','en','Author'),
('principal.autor','es','Autor'),
('principal.breveDescripcion','ca','Breu Descripci�'),
('principal.breveDescripcion','en','Brief Description'),
('principal.breveDescripcion','es','Breve Descripci�n'),
('principal.breveDescripcionDesc','ca','<p><b>Religious</b> �s un joc en xarxa amb el qual es pot jugar, <b>de forma gratu�ta</b>, amb altres jugadors de la xarxa i posar a prova les teves capacitats d\'organitzaci� i estrat�gia mentre passes una bona estona.</p>\r\n<p><b>Religious</b> es o ser� <b>Open Source</b>, el que vol dir que en breus s\'alliberar� el codi del joc oer que cadasc� el pugui utilitzar i modificar sota les condicions de l\'esmentada llic�ncia.</p>'),
('principal.breveDescripcionDesc','en','<p><b>Religious</b> is a massive online game which it is possible to be played, for free, with other players and to on approval put your capacities of organization and strategy while you spend a good short while.</p><p><b>Religious</b> is or will be Open Source, which means that shortly the code of the game will be released so that everyone can use it and modify it under the conditions of this license.</p>'),
('principal.breveDescripcionDesc','es','<p><b>Religious</b> es un juego en red con el que se puede jugar, <b>de forma gratu�ta</b>, con otros jugadores de red y poner a prueba tus capacidades de organizaci�n y estrateg�a mientras pasas un buen rato.</p>\r\n<p><b>Religious</b> es o ser� <b>Open Source</b>, lo que significa que en breve se liberar� el c�digo del juego para que cada cual pueda utilizarlo y modificarlo bajo las condiciones de dicha licencia.</p>'),
('principal.eljuego','ca','El joc'),
('principal.eljuego','en','The game'),
('principal.eljuego','es','El juego'),
('principal.enviar','ca','Vull entrar al meu monestir'),
('principal.enviar','en','I want to enter into my monastery'),
('principal.enviar','es','Quiero entrar a mi monasterio'),
('principal.estadoActual','ca','Estat Actual del Joc'),
('principal.estadoActual','en','Current Status'),
('principal.estadoActual','es','Estado Actual del Juego'),
('principal.estadoActualDesc','ca','<p><b>Religious</b> ja �s plenament jugable, encara que esperem que el joc no es quedi aqui i evolucioni en base a les vostres suger�ncies. No oblideu comentar en els f�rums qualsevol millora que se us acudeixi.</p>'),
('principal.estadoActualDesc','en','<p><b>Religious</b> is totally playable, although we hoped that the game does not remain here and evolves on the basis of your suggestions. Don\'t forget to comment in the forums any improvement that is happened to you.</p>'),
('principal.estadoActualDesc','es','<p><b>Religious</b> ya es plenamente jugable, aunque esperamos que el juego no se quede aqu� y evolucione en base a vuestras sugerencias. No olvideis comentar en los foros cualquier mejora que se os ocurra.</p>'),
('principal.fecha','ca','Fecha'),
('principal.fecha','en','Date'),
('principal.fecha','es','Fecha'),
('principal.foros','ca','Accedir a les Discussions del Joc'),
('principal.foros','en','Access to the Forums of the Game'),
('principal.foros','es','Acceder a los Foros del Juego'),
('principal.identificacion','ca','Identificaci�'),
('principal.identificacion','en','Nick'),
('principal.identificacion','es','Identificaci�n'),
('principal.inscribir','ca','Inscriure el meu monestir i comen�ar a jugar'),
('principal.inscribir','en','Register my monastery and begin to play'),
('principal.inscribir','es','Inscribir mi monasterio y empezar a jugar'),
('principal.noticias','ca','Novedades'),
('principal.noticias','en','News'),
('principal.noticias','es','Novedades'),
('principal.objetivos','ca','Objectius del joc'),
('principal.objetivos','en','Objectives of the game'),
('principal.objetivos','es','Objetivos del juego'),
('principal.objetivosDesc','ca','<p>Els objectius del joc s�n fer cr�ixer la teva Ordre Religiosa al mateix temps que gestiones i fas cr�ixer el teu monestir.</p>\r\n      <p>Per a aix�, et seran assignats uns monjos a l\'inici del joc i tindr�s que generar els recursos necessaris per a subsistir, organitzar als monjos per a aconseguir portar a terme tasques com collir, resar, llegir i escriure llibres, etc.</p>\r\n      <p>No pensis que et resultar� senzill; les tasques hauran de realitzar-se en el moment adequat perqu� siguin fruct�feres; recollir quan no has sembrat �s una inutilitat.</p>\r\n      <p>Evidentment, quants m�s monjos tinguis al teu c�rrec, m�s tasques podr�s dur a terme, pel que deur�s prestar especial inter�s a la formaci� religiosa dels aldeans, construint escoles que puguin aportar novicis al teu monestir.</p>\r\n      <p>Presta especial atenci� als mercats quan l\'objectiu sigui comprar o vendre recursos. El mercat local (la ciutat m�s pr�xima) est� disponible per a tot el m�n, per� per a accedir a altres ciutats de la teva regi� haur�s de establir vincles comercials.</p>\r\n      <p>El mercat interregional et permetr� comprar i vendre mercaderies que no existeixen en la teva regi�, per� per a aix� deur�s demanar-li al teu abat primat que obri relacions comercials amb altres regions.</p>'),
('principal.objetivosDesc','en','<p>The objectives of the game are to let grow your Religious Order at the same time that you manage and beams to grow your monastery.</p><p>monks will be assigned to you to the beginning of the game and you will have to generate the resources necessary to subsist, to organize the monks to be able to carry out tasks like harvesting, saying, to read and to write books, etc.</p><p>You do not think that he is going to you to be simple; the tasks will have to be made in their suitable moment so that they are fruitful; to gather when you have not seeded is a uselessness.</p><p>Evidently, whatever more monks you have, more tasks you will be able to carry out, reason why you will have to lend special interest to the religious formation of the villagers, being constructed schools that can contribute beginners to your monastery.</p><p>It pays special attention to the markets when the objective is to buy or to sell resources. The local market (the next city) is available for everybody, but to accede to other cities of your region you will have to establish commercial vinculos.</p><p>The interregional market will allow you to buy and to sell merchandise that do not exist in your region, but for it you will have to ask your abbot primate to him who opens commercial relations with other regions.</p>'),
('principal.objetivosDesc','es','<p>Los objetivos del juego son hacer crecer tu Orden Religiosa al mismo tiempo que gestionas y haces crecer tu monasterio.</p>\r\n      <p>Para ello, te ser�n asignados unos monjes al inicio del juego y tendras que generar los recursos necesarios para subsistir, organizar a los monjes para conseguir llevar a cabo tareas como cosechar, rezar, leer y escribir libros, etc.</p>\r\n      <p>No pienses que te va a resultar sencillo; las tareas deber�n realizarse en su momento adecuado para que sean fruct�feras; recoger cuando no has sembrado es una inutilidad.</p>\r\n      <p>Evidentemente, cuantos m�s monjes poseas, m�s tareas podr�s llevar a cabo, por lo que deber�s prestar especial inter�s a la formaci�n religiosa de los aldeanos, construyendo escuelas que puedan aportar novicios a tu monasterio.</p>\r\n      <p>Presta especial atenci�n a los mercados cuando el objetivo sea comprar o vender recursos. El mercado local (la ciudad m�s pr�xima) est� disponible para todo el mundo, pero para acceder a otras ciudades de tu regi�n deber�s establecer vinculos comerciales.</p>\r\n      <p>El mercado interregional te permitir� comprar y vender mercanc�as que no existen en tu regi�n, pero para ello deber�s pedirle a tu abad primado que abra relaciones comerciales con otras regiones.</p>'),
('principal.olvido','ca','He oblidat la meva paraula d\'acc�s'),
('principal.olvido','en','I forgot my password'),
('principal.olvido','es','Olvid� mi contrase�a'),
('principal.password','ca','Paraula d\'acc�s'),
('principal.password','en','Password'),
('principal.password','es','Contrase�a'),
('principal.title','ca','The Religious Game'),
('principal.title','en','The Religious Game'),
('principal.title','es','The Religious Game'),
('principal.usuario','ca','Usuari'),
('principal.usuario','en','User'),
('principal.usuario','es','Usuario'),
('pujar.anos','ca','anys'),
('pujar.anos','en','years old'),
('pujar.anos','es','A�os'),
('pujar.cantidad','ca','Pes'),
('pujar.cantidad','en','Weight'),
('pujar.cantidad','es','Peso'),
('pujar.fechaNacimiento','ca','Data de Naixement'),
('pujar.fechaNacimiento','en','Birth Date'),
('pujar.fechaNacimiento','es','Fecha de Nacimiento'),
('pujar.monasterio','ca','Monestir'),
('pujar.monasterio','en','Monastery'),
('pujar.monasterio','es','Monasterio'),
('pujar.monedasOro','ca','Monedes d\'Or'),
('pujar.monedasOro','en','Golden Pieces'),
('pujar.monedasOro','es','Monedas de Oro'),
('pujar.nombre','ca','Nom'),
('pujar.nombre','en','Name'),
('pujar.nombre','es','Nombre'),
('pujar.precio','ca','Preu Actual'),
('pujar.precio','en','Current Price'),
('pujar.precio','es','Precio Actual'),
('pujar.puja','ca','Puja'),
('pujar.puja','en','Bidding'),
('pujar.puja','es','Puja'),
('pujar.pujar','ca','Pujar'),
('pujar.pujar','en','Bid'),
('pujar.pujar','es','Pujar'),
('pujar.recursoEnSubasta','ca','Pujar per un Recurs en Subasta'),
('pujar.recursoEnSubasta','en','Bid for a Resource in Auction'),
('pujar.recursoEnSubasta','es','Pujar por un Recurso en Subasta'),
('pujar.tipoRecurso','ca','Tipus de Recurs'),
('pujar.tipoRecurso','en','Type of Resource'),
('pujar.tipoRecurso','es','Tipo de Recurso'),
('pujar.title','ca','Puja per una subasta'),
('pujar.title','en','The Religious Games: Bid in an auction'),
('pujar.title','es','Pujar por una subasta'),
('pujarAction.propiaPuja','ca','No pots millorar la teva propia puja.'),
('pujarAction.propiaPuja','en','You cannot improve your own bidding.'),
('pujarAction.propiaPuja','es','No puedes mejorar tu propia puja.'),
('pujarAction.pujaMinima','ca','Has de respecta la puja m�nima (1% sobre l\'anterior).'),
('pujarAction.pujaMinima','en','You must respect the minimal bidding (1 % on the previous one).'),
('pujarAction.pujaMinima','es','Debes respetar la puja m�nima (1% sobre la anterior).'),
('pujarAction.subastaEjecutada','ca','La subasta ja ha estat executada.'),
('pujarAction.subastaEjecutada','en','The auction has been already executed.'),
('pujarAction.subastaEjecutada','es','La subasta ya ha sido ejecutada.'),
('recordar.email','ca','e-mail'),
('recordar.email','en','e-mail'),
('recordar.email','es','e-mail'),
('recordar.enviar','ca','Enviar'),
('recordar.enviar','en','Send'),
('recordar.enviar','es','Enviar'),
('recordar.identificacion','ca','Identificaci�'),
('recordar.identificacion','en','Identification'),
('recordar.identificacion','es','Identificaci�n'),
('recordar.password','ca','Paraula d\'acc�s'),
('recordar.password','en','Password'),
('recordar.password','es','Contrase�a'),
('recordar.recordar','ca','Recordar la Paraula d\'acc�s'),
('recordar.recordar','en','Remember the Password'),
('recordar.recordar','es','Recordar la Contrase�a'),
('recordar.recordarDesc','ca','<p>Tant si has oblidat la teva paraula d\'acc�s com si has oblidat el teu nick pots solicitar que et sigui enviat al teu compte de correu electr�nic sencillament informant el teu nick o be la teva adre�a de correu electr�nic.</p><p>Omple doncs una de les dues dades que se\'t soliciten tot seguit i et ser� enviat un mail a l\'adre�a de correu que vares registrar el seu dia.</p>'),
('recordar.recordarDesc','en','<p> So much if you have forgotten your password as if you have forgotten your nick you can request that is sent to you to your account of e-mail simply informing your nick or your e-mail address. </p> <p> Refills so one of two information that later are requested and a mail will be sent to you to the e-mail address that you registered in his day. </p>'),
('recordar.recordarDesc','es','<p>Tanto si has olvidado tu contrase�a como si has olvidado tu nick puedes solicitar que te sea enviado a tu cuenta de correo electr�nico simplemente informando tu nick o bien tu direcci�n de correo electr�nico.</p><p>Rellena pues uno de los dos datos que a continuaci�n se solicitan y te ser� enviado un mail a la direcci�n de correo electr�nico que registraste en su d�a.</p>'),
('recordar.usuario','ca','Usuari'),
('recordar.usuario','en','User'),
('recordar.usuario','es','Usuario'),
('recurso.actividad','ca','Activitat'),
('recurso.actividad','en','Activity'),
('recurso.actividad','es','Actividad'),
('recurso.caducaEn','ca','El recurs caduca en'),
('recurso.caducaEn','en','The resource expires in'),
('recurso.caducaEn','es','El recurso caduca en'),
('recurso.cantidad','ca','Quantitat Necesaria per 1 '),
('recurso.cantidad','en','Necessary quantity for 1'),
('recurso.cantidad','es','Cantidad Necesaria por 1 '),
('recurso.cantidadActividad','ca','Quantitat'),
('recurso.cantidadActividad','en','Quantity'),
('recurso.cantidadActividad','es','Cantidad'),
('recurso.de','ca','de'),
('recurso.de','en','of'),
('recurso.de','es','de'),
('recurso.dias','ca','dies aproximadament'),
('recurso.dias','en','days approximately'),
('recurso.dias','es','d�as aproximadamente'),
('recurso.informacion','ca','Informaci� del Recurs'),
('recurso.informacion','en','Information of the Resource'),
('recurso.informacion','es','Informaci�n del Recurso'),
('recurso.mejora','ca','Millora la activitat en un...'),
('recurso.mejora','en','It improves the activity in one...'),
('recurso.mejora','es','Mejora la actividad en un...'),
('recurso.necesario','ca','Aquest Recurs es Necesari per Obtenir...'),
('recurso.necesario','en','This Resource is Necessary To obtain...'),
('recurso.necesario','es','Este Recurso es Necesario para Obtener...'),
('recurso.necesidades','ca','Recursos Necesaris per Obtenir '),
('recurso.necesidades','en','Necessary resources To obtain...'),
('recurso.necesidades','es','Recursos Necesarios para Obtener '),
('recurso.nombre','ca','Nom'),
('recurso.nombre','en','Name'),
('recurso.nombre','es','Nombre'),
('recurso.precisa','ca','Per el seu �s precisa d\'un dels seg�ents elements'),
('recurso.precisa','en','For his use he is necessary one of the following elements'),
('recurso.precisa','es','Para su uso precisa de uno de los siguientes elementos'),
('recurso.recurso','ca','Tipus de Recurs'),
('recurso.recurso','en','Type of Resource'),
('recurso.recurso','es','Tipo de Recurso'),
('recurso.utilPara','ca','Eina �til per a...'),
('recurso.utilPara','en','Useful tool for...'),
('recurso.utilPara','es','Herramienta �til para...'),
('region.aldeanos','ca','Aldeans'),
('region.aldeanos','en','Villagers'),
('region.aldeanos','es','Aldeanos'),
('region.economia','ca','Economia'),
('region.economia','en','Economy'),
('region.economia','es','Econom�a'),
('region.espiritu','ca','Espiritualitat'),
('region.espiritu','en','Spirituality'),
('region.espiritu','es','Espiritualidad'),
('region.informacion','ca','Informaci�'),
('region.informacion','en','Information'),
('region.informacion','es','Informaci�n'),
('region.nombreEquipo','ca','Monestir'),
('region.nombreEquipo','en','Monastery'),
('region.nombreEquipo','es','Monasterio'),
('region.otros','ca','Altres Regions'),
('region.otros','en','Other Regions'),
('region.otros','es','Otras Regiones'),
('region.poblacion','ca','Poblaci�'),
('region.poblacion','en','Population'),
('region.poblacion','es','Poblaci�n'),
('region.ranking','ca','Posici�'),
('region.ranking','en','Ranking'),
('region.ranking','es','Posici�n'),
('region.tecnologia','ca','Tecnologia'),
('region.tecnologia','en','Technology'),
('region.tecnologia','es','Tecnolog�a'),
('region.title','ca','The Religious Game: Informaci� de la Regi�'),
('region.title','en','Information of the Region'),
('region.title','es','The Religious Game: Informaci�n de la Regi�n'),
('semana.0','ca','Dilluns'),
('semana.0','en','Monday'),
('semana.0','es','Lunes'),
('semana.1','ca','Dimarts'),
('semana.1','en','Tuesday'),
('semana.1','es','Martes'),
('semana.2','ca','Dimecres'),
('semana.2','en','Wednesday'),
('semana.2','es','Mi�rcoles'),
('semana.3','ca','Dijous'),
('semana.3','en','Thursday'),
('semana.3','es','Jueves'),
('semana.4','ca','Divendres'),
('semana.4','en','Friday'),
('semana.4','es','Viernes'),
('semana.5','ca','Dissabte'),
('semana.5','en','Saturday'),
('semana.5','es','S�bado'),
('semana.6','ca','Duimenge'),
('semana.6','en','Sunday'),
('semana.6','es','Domingo'),
('semana.domingo','ca','Diumenge'),
('semana.domingo','en','Sunday'),
('semana.domingo','es','Domingo'),
('semana.jueves','ca','Dijous'),
('semana.jueves','en','Thursday'),
('semana.jueves','es','Jueves'),
('semana.lunes','ca','Dilluns'),
('semana.lunes','en','Monday'),
('semana.lunes','es','Lunes'),
('semana.martes','ca','Dimarts'),
('semana.martes','en','Tuesday'),
('semana.martes','es','Martes'),
('semana.miercoles','ca','Dimecres'),
('semana.miercoles','en','Wednesday'),
('semana.miercoles','es','Mi�rcoles'),
('semana.sabado','ca','Dissabte'),
('semana.sabado','en','Saturday'),
('semana.sabado','es','S�bado'),
('semana.viernes','ca','Divendres'),
('semana.viernes','en','Friday'),
('semana.viernes','es','Viernes'),
('subastar.cantidad','ca','Quantitat/Pes'),
('subastar.cantidad','en','Quantity/Weight'),
('subastar.cantidad','es','Cantidad/Peso'),
('subastar.monedasOro','ca','Monedes d\'Or'),
('subastar.monedasOro','en','Golden Pieces'),
('subastar.monedasOro','es','Monedas de Oro'),
('subastar.nombre','ca','Nom'),
('subastar.nombre','en','Name'),
('subastar.nombre','es','Nombre'),
('subastar.precioSalida','ca','Preu de Sortida'),
('subastar.precioSalida','en','Initial Price'),
('subastar.precioSalida','es','Precio de Salida'),
('subastar.subastar','ca','Enviar a la Subasta'),
('subastar.subastar','en','Send to the Auction'),
('subastar.subastar','es','Enviar a la Subasta'),
('subastar.tipoRecurso','ca','Tipus de Recurs'),
('subastar.tipoRecurso','en','Type of Resource'),
('subastar.tipoRecurso','es','Tipo de Recurso'),
('subastas.anos','ca','anys'),
('subastas.anos','en','years old'),
('subastas.anos','es','a�os'),
('subastas.edad','ca','Edat'),
('subastas.edad','en','Age'),
('subastas.edad','es','Edad'),
('subastas.fechaLimite','ca','Data L�mit'),
('subastas.fechaLimite','en','Deadline'),
('subastas.fechaLimite','es','Fecha L�mite'),
('subastas.fechaNacimiento','ca','Data de Naixement'),
('subastas.fechaNacimiento','en','Birth Date'),
('subastas.fechaNacimiento','es','Fecha de Nacimiento'),
('subastas.monasterio','ca','Monestir'),
('subastas.monasterio','en','Monastery'),
('subastas.monasterio','es','Monasterio'),
('subastas.monedasOro','ca','Monedes Or'),
('subastas.monedasOro','en','Golden Pieces'),
('subastas.monedasOro','es','Monedas Oro'),
('subastas.nombre','ca','Nom'),
('subastas.nombre','en','Name'),
('subastas.nombre','es','Nombre'),
('subastas.peso','ca','Pes'),
('subastas.peso','en','Weight'),
('subastas.peso','es','Peso'),
('subastas.precio','ca','Preu'),
('subastas.precio','en','Price'),
('subastas.precio','es','Precio'),
('subastas.recursosSubastados','ca','Recursos Subastats'),
('subastas.recursosSubastados','en','Auctioned resources'),
('subastas.recursosSubastados','es','Recursos Subastados'),
('subastas.title','ca','Subastes'),
('subastas.title','en','Auctions'),
('subastas.title','es','Subastas'),
('tareas.enviar','ca','Guardar Canvis'),
('tareas.enviar','en','Send'),
('tareas.enviar','es','Guardar cambios'),
('tareas.habitual','ca','Habitual'),
('tareas.habitual','en','Habitual'),
('tareas.habitual','es','Habitual'),
('tareas.tareasMonasterio','ca','Tasques Setmanals del Monestir'),
('tareas.tareasMonasterio','en','Weekly tasks of the Monastery'),
('tareas.tareasMonasterio','es','Tareas Semanales del Monasterio');
/*!40000 ALTER TABLE `_PAGINAT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `_PARAMETROS`
--

DROP TABLE IF EXISTS `_PARAMETROS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `_PARAMETROS` (
  `CLAVE` int(11) NOT NULL DEFAULT 0,
  `FECHA_RELIGIOUS` int(11) DEFAULT NULL,
  `RELACION_TEMPORAL` int(11) DEFAULT NULL,
  `MONJES_INICIALES` int(11) DEFAULT 5,
  `FECHA_TAREAS` int(11) DEFAULT NULL,
  `CONECTADOS` varchar(72) NOT NULL DEFAULT '',
  `CADUCIDAD_MERCADO` int(11) NOT NULL DEFAULT 72,
  PRIMARY KEY (`CLAVE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_PARAMETROS`
--

LOCK TABLES `_PARAMETROS` WRITE;
/*!40000 ALTER TABLE `_PARAMETROS` DISABLE KEYS */;
INSERT INTO `_PARAMETROS` VALUES
(1,9827403,4,5,9827400,'01;01;02;02;01;01;02;03;05;04;05;06;07;07;08;06;08;06;04;02;01;00;00;00;',72);
/*!40000 ALTER TABLE `_PARAMETROS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `_PERIODO`
--

DROP TABLE IF EXISTS `_PERIODO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `_PERIODO` (
  `PERIODOID` int(11) NOT NULL DEFAULT 0,
  `ACTIVIDADID` char(3) DEFAULT NULL,
  `ASIGNABLE` tinyint(1) DEFAULT NULL,
  `INICIO` int(11) DEFAULT NULL,
  PRIMARY KEY (`PERIODOID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_PERIODO`
--

LOCK TABLES `_PERIODO` WRITE;
/*!40000 ALTER TABLE `_PERIODO` DISABLE KEYS */;
INSERT INTO `_PERIODO` VALUES
(0,NULL,1,0),
(1,NULL,1,2),
(2,NULL,1,7),
(3,NULL,1,10),
(4,NULL,1,12),
(5,NULL,1,14),
(6,NULL,1,16),
(7,NULL,1,19),
(8,'dor',0,21);
/*!40000 ALTER TABLE `_PERIODO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `_PERIODOT`
--

DROP TABLE IF EXISTS `_PERIODOT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `_PERIODOT` (
  `PERIODOID` int(11) NOT NULL DEFAULT 0,
  `IDIOMAID` char(2) NOT NULL DEFAULT '',
  `DESCRIPCION` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`IDIOMAID`,`PERIODOID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_PERIODOT`
--

LOCK TABLES `_PERIODOT` WRITE;
/*!40000 ALTER TABLE `_PERIODOT` DISABLE KEYS */;
INSERT INTO `_PERIODOT` VALUES
(0,'ca','Maitines'),
(1,'ca','Laudes'),
(2,'ca','Prima'),
(3,'ca','Tercia'),
(4,'ca','Sexta'),
(5,'ca','Nona'),
(6,'ca','V�speras'),
(7,'ca','Angelus'),
(8,'ca',''),
(0,'en','Maitines'),
(1,'en','Laudes'),
(2,'en','Prima'),
(3,'en','Tercia'),
(4,'en','Sexta'),
(5,'en','Nona'),
(6,'en','V�speras'),
(7,'en','Angelus'),
(8,'en',''),
(0,'es','Maitines'),
(1,'es','Laudes'),
(2,'es','Prima'),
(3,'es','Tercia'),
(4,'es','Sexta'),
(5,'es','Nona'),
(6,'es','V�speras'),
(7,'es','Angelus'),
(8,'es','');
/*!40000 ALTER TABLE `_PERIODOT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `_PROCESO`
--

DROP TABLE IF EXISTS `_PROCESO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `_PROCESO` (
  `PROCESOID` int(11) NOT NULL AUTO_INCREMENT,
  `NOMBRE` varchar(32) DEFAULT NULL,
  `FUNCION` varchar(255) DEFAULT NULL,
  `ULTIMA_EJECUCION` datetime /* mariadb-5.3 */ DEFAULT NULL,
  `FRECUENCIA` int(11) DEFAULT NULL,
  PRIMARY KEY (`PROCESOID`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci COMMENT='Batch Processes';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_PROCESO`
--

LOCK TABLES `_PROCESO` WRITE;
/*!40000 ALTER TABLE `_PROCESO` DISABLE KEYS */;
INSERT INTO `_PROCESO` VALUES
(1,'Actividades','batchActividad','0000-00-00 00:00:00',900000);
/*!40000 ALTER TABLE `_PROCESO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `_PROCESO_ACTIVIDAD`
--

DROP TABLE IF EXISTS `_PROCESO_ACTIVIDAD`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `_PROCESO_ACTIVIDAD` (
  `ACTIVIDADID` char(3) NOT NULL DEFAULT '',
  `ORDEN` int(11) NOT NULL DEFAULT 0,
  `TIPO` char(3) NOT NULL DEFAULT '',
  `TIPOEDIFICIOID` char(3) DEFAULT NULL,
  `CARACTERISTICAID` char(3) DEFAULT NULL,
  `RECURSOID` char(3) DEFAULT NULL,
  `CALCULO` char(3) DEFAULT NULL,
  `PARAMETRO1` double DEFAULT NULL,
  `PARAMETRO2` double DEFAULT NULL,
  `MENSAJE_TIPOID` char(6) DEFAULT NULL,
  `MENSAJE_GLOBAL` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`ACTIVIDADID`,`ORDEN`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_PROCESO_ACTIVIDAD`
--

LOCK TABLES `_PROCESO_ACTIVIDAD` WRITE;
/*!40000 ALTER TABLE `_PROCESO_ACTIVIDAD` DISABLE KEYS */;
INSERT INTO `_PROCESO_ACTIVIDAD` VALUES
('',10,'ac4','','sal','','dec',2,3,'',0),
('',20,'ac4','','fe','','dec',1,2,'',0),
('ara',10,'efi','','','','',10,0,'',0),
('ara',20,'cli','','','','ape',2,80,'',0),
('ara',21,'cli','','','','ape',3,60,'',0),
('ara',22,'cli','','','','ape',4,60,'',0),
('ara',23,'cli','','','','ape',5,40,'',0),
('ara',30,'cc4','','fue','','afe',0,2000,'',0),
('ara',40,'ayr','','','hco','afe',1,9000,'',0),
('ara',41,'ayr','','','har','afe',1,5000,'',0),
('ara',42,'ayr','','','haz','afe',1,2500,'',0),
('ara',50,'est',NULL,'ara',NULL,NULL,20,40,NULL,NULL),
('art',10,'ned','tar','','','',0,0,'faledi',0),
('art',20,'cc4','','des','','afe',20,0,NULL,NULL),
('art',30,'cc4','','can','','ape',100,0,NULL,NULL),
('art',40,'esc','','','','',6,8,'',0),
('caz',1,'efi','','','','',10,0,'',0),
('caz',10,'cli','','','','ape',2,80,'',0),
('caz',11,'cli','','','','ape',3,60,'',0),
('caz',12,'cli','','','','ape',4,60,'',0),
('caz',13,'cli','','','','ape',5,40,'',0),
('caz',21,'ayr','','','fle','afe',1,10000,'',0),
('caz',30,'cc4','','can','','ape',100,0,'',0),
('caz',40,'cc4','','fue','','afe',20,0,'',0),
('caz',50,'ire','','','cas','',2,20,'',0),
('caz',60,'ire','','','pls','',1,2,'',0),
('caz',70,'dre','','','fle','dee',1,0,'',0),
('cle',1,'efi','','','','',10,0,'',0),
('cle',10,'ayr','','','hha','afe',1,4500,'',0),
('cle',11,'ayr','','','hhd','afe',1,4500,'',0),
('cle',20,'cc4','','can','','ape',100,0,'',0),
('cle',30,'cc4','','fue','','afe',20,0,'',0),
('cle',40,'ac4','','can','','inc',5,10,'',0),
('cle',50,'ac4','','fue','','inc',1,0,'',0),
('cle',60,'ire','','','mad','ine',3,5,'',0),
('coc',10,'ned','coc','','','',0,0,'faledi',0),
('coc',20,'cc4','','can','','ape',100,0,'',0),
('coc',40,'esc','','','','',1,5,'',0),
('com',10,'ned','ref','','','',0,0,'faledi',0),
('com',20,'nre','','','com','',1,0,'falrec',0),
('com',30,'ac4','','sal','','ine',30,40,'',0),
('com',40,'ac4','','can','','dec',5,8,'',0),
('com',50,'dre','','','com','dee',1,0,'',1),
('con',10,'ned','tco','','','',0,0,'fataco',0),
('con',20,'cc4','','des','','afe',20,0,'',0),
('con',30,'cc4','','can','','ape',100,0,'',0),
('con',40,'nre','','','pls','',1,5,'',0),
('con',50,'dre','','','pls','',1,5,'',0),
('con',60,'ire','','','','',1,5,'',0),
('cos',10,'efi','','','','',100,0,'',0),
('cos',31,'cli','','','','ape',2,80,'',0),
('cos',32,'cli','','','','ape',3,60,'',0),
('cos',33,'cli','','','','ape',4,60,'',0),
('cos',34,'cli','','','','ape',5,60,'',0),
('cos',41,'cc4','','can','','ape',100,0,'',0),
('cos',42,'cc4','','fue','','afe',20,0,'',0),
('cos',50,'est','','','','',20,40,'',0),
('cos',61,'ac4','','can','','inc',5,10,'',0),
('cos',62,'ac4','','fue','','inc',1.5,0,'',0),
('des',10,'ac4','','can','','dec',10,15,'',0),
('dor',10,'ned','dor','','','',0,0,'faledi',0),
('dor',20,'ac4','','can','','dec',10,20,'',0),
('emi',1,'efi','','','','',0,0,'',0),
('emi',10,'ayr','','','hpi','afe',1,5000,'',0),
('emi',20,'cc4','','can','','ape',100,0,'',0),
('emi',30,'cc4','','fue','','afe',20,0,'',0),
('emi',40,'ac4','','can','','inc',5,10,'',0),
('emi',50,'ac4','','fue','','inc',2,0,'',0),
('emi',60,'ire','','','min','',1,2,'',0),
('esc',10,'ned','bib',NULL,NULL,NULL,NULL,NULL,'faledi',0),
('fno',10,'ned','nov','','','',0,0,'faledi',0),
('fno',20,'cc4','','sap','','ape',100,100,'',0),
('fno',21,'cc4','','fe','','ape',100,100,'',0),
('fno',22,'cc4','','can','','afe',-20,-20,'',0),
('fno',30,'ano','','','','ine',0,0.5,'',0),
('fno',31,'for','','nov','','ine',1,180,'',0),
('fqu',1,'ned','sot','','','',0,0,'faledi',0),
('fqu',10,'efi','','','','',100,0,'',0),
('fqu',20,'cc4','','can','','ape',100,0,'',0),
('fqu',30,'esc','','','','',10,15,'',0),
('lee',10,'ned','bib','','','',0,0,'faledi',0),
('lee',20,'cc4','','can','','ape',100,0,NULL,NULL),
('lee',30,'ac4','','sap','','inc',10,0,NULL,NULL),
('med',10,'ned','cla','','','',0,0,'faledi',0),
('med',20,'ac4','','fe','','inc',4,6,'',0),
('med',30,'ac4','','sap','','inc',2,3,'',0),
('mis',10,'ned','igl','','','',0,0,'faledi',0),
('mis',20,'cc4','','car','','afe',20,0,'',0),
('mis',30,'cc4','','fe','','afe',20,0,'',0),
('mis',40,'cc4','','can','','ape',100,0,'',0),
('mis',50,'ac3','','','','ine',0,10,'',0),
('mis',60,'ire','','','oro','ine',0,25,'',0),
('mol',1,'efi','','','','',100,0,'',0),
('mol',10,'ned','mol','','','',0,0,'faledi',0),
('mol',20,'cc4','','can','','ape',100,0,'',0),
('mol',30,'esc','','','','',1,5,'',0),
('mol',40,'ac4','','can','','inc',3,6,'',0),
('pes',10,'cli','','','','ape',2,80,NULL,NULL),
('pes',20,'cli','','','','ape',3,20,NULL,NULL),
('pes',30,'cli','','','','ape',4,20,NULL,NULL),
('pes',40,'cli','','','','ape',5,5,NULL,NULL),
('pes',50,'cc4','','can','','ape',100,0,NULL,NULL),
('pes',60,'cc4','','fue','','afe',10,0,NULL,NULL),
('pes',70,'ire','','','mar','',2,20,NULL,NULL),
('rez',10,'ned','ora','','','',0,0,'faledi',0),
('rez',20,'ac4','','fe','','inc',8,16,'',0),
('sac',10,'est','','','','',0,0,'',0),
('san',10,'ned','enf','','','',0,0,'faledi',0),
('san',20,'ac3','','','','ine',2,15,'',0),
('san',30,'ire','','','oro','ine',2,5,'',0),
('sem',10,'efi','','','','',50,0,'',0),
('sem',20,'cli','','','','ape',2,80,'',0),
('sem',21,'cli','','','','ape',3,60,'',0),
('sem',22,'cli','','','','ape',4,60,'',0),
('sem',23,'cli','','','','ape',5,40,'',0),
('sem',30,'cc4','','can','','ape',100,0,'',0),
('sem',31,'cc4','','fue','','afe',20,0,'',0),
('sem',40,'ayr','','','hco','afe',1,5000,'',0),
('sem',50,'est','','','','',20,40,'',0),
('sem',60,'ac4','','can','','inc',5,10,'',0),
('sem',61,'ac4','','fue','','inc',1,0,'',0);
/*!40000 ALTER TABLE `_PROCESO_ACTIVIDAD` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `_PROCESO_EVENTO`
--

DROP TABLE IF EXISTS `_PROCESO_EVENTO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `_PROCESO_EVENTO` (
  `EVENTO_TIPOID` char(6) NOT NULL DEFAULT '',
  `ORDEN` int(11) NOT NULL DEFAULT 0,
  `TIPO` char(3) NOT NULL DEFAULT '',
  `TIPOEDIFICIOID` char(3) DEFAULT NULL,
  `CARACTERISTICAID` char(3) DEFAULT NULL,
  `RECURSOID` char(3) DEFAULT NULL,
  `CALCULO` char(3) DEFAULT NULL,
  `PARAMETRO1` double DEFAULT NULL,
  `PARAMETRO2` double DEFAULT NULL,
  `MENSAJE_TIPOID` char(6) DEFAULT NULL,
  `MENSAJE_GLOBAL` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`EVENTO_TIPOID`,`ORDEN`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_PROCESO_EVENTO`
--

LOCK TABLES `_PROCESO_EVENTO` WRITE;
/*!40000 ALTER TABLE `_PROCESO_EVENTO` DISABLE KEYS */;
/*!40000 ALTER TABLE `_PROCESO_EVENTO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `_PUBLICIDAD`
--

DROP TABLE IF EXISTS `_PUBLICIDAD`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `_PUBLICIDAD` (
  `PUBLICIDADID` char(3) NOT NULL DEFAULT '',
  PRIMARY KEY (`PUBLICIDADID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_PUBLICIDAD`
--

LOCK TABLES `_PUBLICIDAD` WRITE;
/*!40000 ALTER TABLE `_PUBLICIDAD` DISABLE KEYS */;
INSERT INTO `_PUBLICIDAD` VALUES
('ace'),
('com'),
('dep'),
('din'),
('emp'),
('hog'),
('inm'),
('mot'),
('oci'),
('sal'),
('sol'),
('tec'),
('tur');
/*!40000 ALTER TABLE `_PUBLICIDAD` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `_PUBLICIDADT`
--

DROP TABLE IF EXISTS `_PUBLICIDADT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `_PUBLICIDADT` (
  `PUBLICIDADID` char(3) NOT NULL DEFAULT '',
  `IDIOMAID` char(2) NOT NULL DEFAULT '',
  `DESCRIPCION` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`PUBLICIDADID`,`IDIOMAID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_PUBLICIDADT`
--

LOCK TABLES `_PUBLICIDADT` WRITE;
/*!40000 ALTER TABLE `_PUBLICIDADT` DISABLE KEYS */;
INSERT INTO `_PUBLICIDADT` VALUES
('ace','es','Actualidad econ�mica'),
('com','es','Compras'),
('dep','es','Deportes'),
('din','es','Dinero'),
('emp','es','Empleo'),
('hog','es','Hogar'),
('inm','es','Inmobiliario'),
('mot','es','Motor'),
('oci','es','Ocio'),
('sal','es','Salud'),
('sol','es','Solidaridad'),
('tec','es','Tecnolog�a'),
('tur','es','Turismo');
/*!40000 ALTER TABLE `_PUBLICIDADT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `_RECURSO_MES`
--

DROP TABLE IF EXISTS `_RECURSO_MES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `_RECURSO_MES` (
  `RECURSOID` char(3) NOT NULL DEFAULT '',
  `MES` tinyint(4) NOT NULL DEFAULT 0,
  `EFECTIVIDAD` double NOT NULL DEFAULT 0,
  PRIMARY KEY (`RECURSOID`,`MES`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_RECURSO_MES`
--

LOCK TABLES `_RECURSO_MES` WRITE;
/*!40000 ALTER TABLE `_RECURSO_MES` DISABLE KEYS */;
/*!40000 ALTER TABLE `_RECURSO_MES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `_RECURSO_TIPO`
--

DROP TABLE IF EXISTS `_RECURSO_TIPO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `_RECURSO_TIPO` (
  `RECURSOID` char(3) NOT NULL DEFAULT '',
  `TIPO_RECURSO` char(3) DEFAULT NULL,
  `CATEGORIA` char(3) DEFAULT NULL,
  `CATEGORIA2` char(3) DEFAULT NULL,
  `UNIDADID` char(3) DEFAULT NULL,
  `EQUIVALENTEID` char(3) NOT NULL DEFAULT '',
  `ICONO` varchar(255) DEFAULT NULL,
  `ASIGNABLE` tinyint(1) DEFAULT NULL,
  `DECIMALES` tinyint(4) NOT NULL DEFAULT 1,
  `CADUCIDAD` int(11) NOT NULL DEFAULT 0,
  `REPRODUCIBLE` tinyint(1) DEFAULT NULL,
  `NECESITA_REPRO` char(3) NOT NULL DEFAULT '',
  `MONEDA_MERCADO` tinyint(1) DEFAULT NULL,
  `UNICO` tinyint(4) NOT NULL DEFAULT 0,
  `VELOCIDAD` double NOT NULL DEFAULT 1,
  `TRANSFORMA_ENM` char(3) DEFAULT NULL,
  `TRANSFORMA_ENH` char(3) DEFAULT NULL,
  `TIEMPO_TRANS` int(11) NOT NULL DEFAULT 0,
  `TIEMPO_PUDRE` int(11) NOT NULL DEFAULT 0,
  `CANTIDAD` double NOT NULL DEFAULT 0,
  `REPRODUCIR_CADA` int(11) NOT NULL DEFAULT 0,
  `MINIMO_CRIAS` int(11) NOT NULL DEFAULT 0,
  `MAXIMO_CRIAS` int(11) NOT NULL DEFAULT 0,
  `TIEMPO_GESTACION` int(11) NOT NULL DEFAULT 0,
  `TIEMPO_REPRO` int(11) NOT NULL DEFAULT 0,
  `TIEMPO_VITAL` int(11) NOT NULL DEFAULT 0,
  `NECESIDAD_HABITANTE` double NOT NULL DEFAULT 0,
  `PRECISAID1` char(3) DEFAULT NULL,
  `CANTIDAD1` double NOT NULL DEFAULT 0,
  `PRECISAID2` char(3) DEFAULT NULL,
  `CANTIDAD2` double NOT NULL DEFAULT 0,
  `PRECISAID3` char(3) DEFAULT NULL,
  `CANTIDAD3` double NOT NULL DEFAULT 0,
  PRIMARY KEY (`RECURSOID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_RECURSO_TIPO`
--

LOCK TABLES `_RECURSO_TIPO` WRITE;
/*!40000 ALTER TABLE `_RECURSO_TIPO` DISABLE KEYS */;
INSERT INTO `_RECURSO_TIPO` VALUES
('',NULL,NULL,NULL,NULL,'',NULL,NULL,1,0,NULL,'',NULL,0,1,NULL,NULL,0,0,0,0,0,0,0,0,0,0,NULL,0,NULL,0,NULL,0),
('abr','ang',NULL,NULL,'eje','kgs','',1,0,0,1,'',0,1,1,NULL,NULL,0,0,0,8760,0,0,0,0,0,0.2,'',0,NULL,0,NULL,0),
('abu','ang',NULL,NULL,'eje','kgs',NULL,1,1,0,1,'',NULL,1,1,'cbu',NULL,0,0,0,8760,0,0,0,122640,175200,0.01,'',0,NULL,0,NULL,0),
('aca','ang',NULL,NULL,'eje','kgs','',1,0,0,0,'',0,1,1,NULL,NULL,0,0,0,0,0,0,0,0,0,0,NULL,0,NULL,0,NULL,0),
('ace','ang',NULL,NULL,'eje','kgs','imagenes/recurso/animal.gif',1,0,0,1,'',0,1,1,NULL,NULL,0,0,0,8760,0,0,0,0,0,0.03,'',0,NULL,0,NULL,0),
('acr','ang',NULL,NULL,'eje','kgs',NULL,1,0,0,1,'',NULL,0,1,NULL,NULL,0,0,0,8760,0,0,0,0,0,0.2,'',0,NULL,0,NULL,0),
('agh','ang',NULL,NULL,'eje','kgs','',0,0,0,1,'agm',0,1,1,'hug','hug',0,0,0,720,2,10,360,720,43800,0,NULL,0,NULL,0,NULL,0),
('agm','ang',NULL,NULL,'eje','kgs','gallo',0,0,0,0,'',0,1,1,NULL,NULL,0,0,0,0,0,0,0,0,0,0,NULL,0,NULL,0,NULL,0),
('alf','oar',NULL,NULL,'uni','','',1,1,0,0,'',0,0,1,NULL,NULL,0,0,0,0,0,0,0,0,0,0.03,NULL,0,NULL,0,NULL,0),
('ang',NULL,NULL,NULL,'eje','',NULL,0,1,0,1,'',0,0,1,NULL,NULL,0,0,0,8760,0,0,0,0,0,0,'',0,NULL,0,NULL,0),
('arb',NULL,NULL,NULL,'uni','','',0,0,0,0,'',0,0,1,NULL,NULL,0,0,0,0,0,0,0,0,0,0,NULL,0,NULL,0,NULL,0),
('arc','her',NULL,NULL,'uni','','',1,0,0,0,'',0,0,1,NULL,NULL,0,0,0,0,0,0,0,0,0,-0.01,'fle',5,NULL,0,NULL,0),
('atm','ang',NULL,NULL,'eje','kgs',NULL,0,0,0,0,'',0,1,1,'ato',NULL,8000,0,0,0,0,0,0,0,0,0,NULL,0,NULL,0,NULL,0),
('ato','ang',NULL,NULL,'eje','kgs','',0,0,0,0,'',0,1,1,'',NULL,0,0,15,8000,1,1,6480,10800,100000,0,NULL,0,NULL,0,NULL,0),
('ava','ang','ord',NULL,'eje','kgs','',0,0,0,1,'ato',0,1,1,'atm',NULL,0,0,0,0,1,1,6480,8000,262800,0,NULL,0,NULL,0,NULL,0),
('aye','ang',NULL,NULL,'eje','kgs','',1,0,0,1,'aca',0,1,1,'aca','aye',0,0,0,0,0,0,0,0,0,0,NULL,0,NULL,0,NULL,0),
('car',NULL,'cmt',NULL,'kgs','',NULL,0,1,0,NULL,'',NULL,0,1,NULL,NULL,0,0,0,0,0,0,0,0,0,0,'',0,NULL,0,NULL,0),
('cas',NULL,'cmt',NULL,'kgs','',NULL,0,1,168,0,'',0,0,1,NULL,NULL,0,0,0,0,0,0,0,0,0,0,'',0,NULL,0,NULL,0),
('cav','cer','cmt',NULL,'kgs','','',1,1,336,0,'',0,0,1,NULL,NULL,0,336,0,0,0,0,0,0,0,0.007,NULL,0,NULL,0,NULL,0),
('caz','cer','cmt','pla','kgs','','',1,1,336,0,'',0,0,1,NULL,NULL,0,336,0,0,0,0,0,0,0,0.00215,NULL,0,NULL,0,NULL,0),
('cbr','car','cmt',NULL,'kgs','','',1,1,168,0,'',0,0,1,NULL,NULL,0,0,0,0,0,0,0,0,0,-0.2,'',0,NULL,0,NULL,0),
('cc2','car','cmt',NULL,'kgs','',NULL,1,2,168,0,'',0,0,1,NULL,NULL,0,0,0,0,0,0,0,0,0,-0.015,'',0,NULL,0,NULL,0),
('ccb','cer','cmt',NULL,'kgs','','',1,1,336,0,'',0,0,1,NULL,NULL,0,336,0,0,0,0,0,0,0,0.003,NULL,0,NULL,0,NULL,0),
('cce','car','cmt',NULL,'kgs','','imagenes/recurso/carne.gif',1,2,168,0,'',0,0,1,NULL,NULL,0,0,0,0,0,0,0,0,0,-0.03,'',0,NULL,0,NULL,0),
('ccn','cer','cmt',NULL,'kgs','','',1,2,168,0,'',0,0,1,NULL,NULL,0,168,0,0,0,0,0,0,0,0.00152,NULL,0,NULL,0,NULL,0),
('cco','car','cmt',NULL,'kgs','','imagenes/recurso/carne.gif',1,2,168,0,'',0,0,1,NULL,NULL,0,0,0,0,0,0,0,0,0,-0.2,'',0,NULL,0,NULL,0),
('ccr','car','cmt',NULL,'kgs','',NULL,1,2,168,0,'',0,0,1,NULL,NULL,0,0,0,0,0,0,0,0,0,-0.015,'',0,NULL,0,NULL,0),
('cct','cer','cmt',NULL,'kgs','',NULL,1,1,336,0,'',0,0,1,NULL,NULL,0,336,0,0,0,0,0,0,0,-0.2,'',0,NULL,0,NULL,0),
('cer',NULL,NULL,NULL,'kgs','',NULL,0,1,0,0,'',0,0,1,NULL,NULL,0,0,0,0,0,0,0,0,0,0,'',0,NULL,0,NULL,0),
('cja','cas','cmt',NULL,'kgs','','imagenes/recurso/carne.gif',1,1,168,0,'',0,0,1,NULL,NULL,0,0,0,0,0,0,0,0,0,0.2,'',0,NULL,0,NULL,0),
('cli','cas','cmt',NULL,'kgs','',NULL,1,1,168,0,'',0,0,1,NULL,NULL,0,0,0,0,0,0,0,0,0,0.2,'',0,NULL,0,NULL,0),
('cmt',NULL,NULL,NULL,'kgs','',NULL,0,1,0,0,'',0,0,1,NULL,NULL,0,0,0,0,0,0,0,0,0,0,'',0,NULL,0,NULL,0),
('com',NULL,NULL,NULL,'rac','','',0,1,24,0,'',0,0,1,NULL,NULL,0,0,0,0,0,0,0,0,0,0,NULL,0,NULL,0,NULL,0),
('cov','car','cmt',NULL,'kgs','','imagenes/recurso/carne.gif',1,2,0,0,'',0,0,1,NULL,NULL,0,0,0,0,0,0,0,0,0,-0.2,'',0,NULL,0,NULL,0),
('cpe','cas','cmt',NULL,'kgs','',NULL,1,2,168,0,'',0,0,1,NULL,NULL,0,0,0,0,0,0,0,0,0,0.011,'',0,NULL,0,NULL,0),
('cpl','car','cmt',NULL,'kgs','',NULL,1,1,168,0,'',0,0,1,NULL,NULL,0,168,0,0,0,0,0,0,0,-0.2,'',0,NULL,0,NULL,0),
('cpr','com',NULL,NULL,'rac','',NULL,0,1,24,0,'',0,0,1,NULL,NULL,0,0,0,0,0,0,0,0,0,0,'',0,NULL,0,NULL,0),
('cre','cas','cmt',NULL,'kgs','',NULL,1,1,168,0,'',0,0,1,NULL,NULL,0,0,0,0,0,0,0,0,0,0.2,'',0,NULL,0,NULL,0),
('cru','oar',NULL,NULL,'uni','','',1,0,0,0,'',0,0,1,NULL,NULL,0,0,0,0,0,0,0,0,0,-0.02,NULL,0,NULL,0,NULL,0),
('cse','cer','cmt',NULL,'kgs','',NULL,1,1,336,0,'',0,0,1,NULL,NULL,0,336,0,0,0,0,0,0,0,-0.2,'',0,NULL,0,NULL,0),
('ctg','cer',NULL,NULL,'kgs','',NULL,1,2,0,0,'',0,0,1,NULL,NULL,0,0,0,0,0,0,0,0,0,-0.257,'',0,NULL,0,NULL,0),
('cto','car','cmt',NULL,'kgs','','',1,1,168,0,'',0,0,1,NULL,NULL,0,0,0,0,0,0,0,0,0,-0.2,'',0,NULL,0,NULL,0),
('ctr','car','cmt',NULL,'kgs','',NULL,1,2,168,0,'',0,0,1,NULL,NULL,0,0,0,0,0,0,0,0,0,-0.009,'',0,NULL,0,NULL,0),
('cua','nat',NULL,NULL,'l','','',1,3,0,0,'',0,0,1,NULL,NULL,0,0,0,0,0,0,0,0,0,-0.01,NULL,0,NULL,0,NULL,0),
('cvc','car','cmt',NULL,'kgs','',NULL,1,1,168,0,'',0,0,1,NULL,NULL,0,168,0,0,0,0,0,0,0,-0.2,'',0,NULL,0,NULL,0),
('din',NULL,NULL,NULL,'mon','',NULL,0,1,0,0,'',0,0,1,NULL,NULL,0,0,0,0,0,0,0,0,0,0,'',0,NULL,0,NULL,0),
('fhi','fru','cmt','arb','kgs','','',1,1,168,0,'',0,0,1,NULL,NULL,0,168,0,0,0,0,0,0,0,0.025,NULL,0,NULL,0,NULL,0),
('fle','her',NULL,NULL,'uni','','',1,0,0,0,'',0,0,1,NULL,NULL,0,0,0,0,0,0,0,0,0,-0.01,NULL,0,NULL,0,NULL,0),
('fma','fru','cmt',NULL,'kgs','','',1,1,168,0,'',0,0,1,NULL,NULL,0,168,0,0,0,0,0,0,0,0.2,NULL,0,NULL,0,NULL,0),
('fna','fru','cmt','arb','kgs','','',1,1,168,0,'',0,0,1,NULL,NULL,0,168,0,0,0,0,0,0,0,0.2,NULL,0,NULL,0,NULL,0),
('fru',NULL,NULL,NULL,'kgs','',NULL,0,1,0,0,'',0,0,1,NULL,NULL,0,0,0,0,0,0,0,0,0,0,'',0,NULL,0,NULL,0),
('fsa','fru','cmt',NULL,'kgs','','',1,1,168,0,'',0,0,1,NULL,NULL,0,168,0,0,0,0,0,0,0,0.2,NULL,0,NULL,0,NULL,0),
('hab','rop',NULL,NULL,'pre','','imagenes/recurso/ropa.gif',1,0,0,0,'',0,0,1,NULL,NULL,0,0,0,0,0,0,0,0,0,0,NULL,0,NULL,0,NULL,0),
('har','her',NULL,NULL,'uni','','',1,0,0,0,'',0,0,1,NULL,NULL,0,0,0,0,0,0,0,0,0,-0.1,'abu',1,NULL,0,NULL,0),
('haz','her',NULL,NULL,'uni','','',1,0,0,0,'',0,0,1,NULL,NULL,0,0,0,0,0,0,0,0,0,-0.2,'',0,NULL,0,NULL,0),
('hcn','hrn','cmt',NULL,'kgs','','',1,1,2920,0,'',0,0,1,NULL,NULL,0,0,0,0,0,0,0,0,0,0.2,'',0,NULL,0,NULL,0),
('hco','her',NULL,NULL,NULL,'','imagenes/recurso/herramienta.gif',1,0,0,0,'',0,0,1,NULL,NULL,0,0,0,0,0,0,0,0,0,-0.2,'aca',1,'har',1,NULL,0),
('her',NULL,NULL,NULL,'uni','','',1,1,0,0,'',0,0,1,NULL,NULL,0,0,0,0,0,0,0,0,0,0.2,'',0,NULL,0,NULL,0),
('hha','her',NULL,NULL,'uni','','',1,0,0,0,'',0,0,1,NULL,NULL,0,0,0,0,0,0,0,0,0,-0.2,'',0,NULL,0,NULL,0),
('hhd','her',NULL,NULL,'uni','','imagenes/recurso/herramienta.gif',1,0,0,0,'',0,0,1,NULL,NULL,0,0,0,0,0,0,0,0,0,-0.2,'',0,NULL,0,NULL,0),
('hie','nat','min',NULL,'ton','','imagenes/recHierro.gif',1,1,0,0,'',0,0,1,NULL,NULL,0,0,0,0,0,0,0,0,0,0.2,'',0,NULL,0,NULL,0),
('hpi','her',NULL,NULL,'uni','','',1,0,0,0,'',0,0,1,NULL,NULL,0,0,0,0,0,0,0,0,0,-0.2,'',0,NULL,0,NULL,0),
('hrn',NULL,NULL,NULL,'kgs','','',0,1,2920,0,'',0,0,1,NULL,NULL,0,0,0,0,0,0,0,0,0,0,'',0,NULL,0,NULL,0),
('hte','her',NULL,NULL,'uni','','imagenes/recurso/herramienta.gif',1,0,0,0,'',0,0,1,NULL,NULL,0,0,0,0,0,0,0,0,0,-0.2,'',0,NULL,0,NULL,0),
('htr','hrn','cmt',NULL,'kgs','','',1,1,2920,0,'',0,0,10,NULL,NULL,0,0,0,0,0,0,0,0,0,-0.2,NULL,0,NULL,0,NULL,0),
('hue',NULL,NULL,NULL,NULL,'','imagenes/recurso/huevos.gif',0,0,0,0,'',0,0,1,NULL,NULL,0,0,0,0,0,0,0,0,0,0,'',0,NULL,0,NULL,0),
('hug','hue','cmt',NULL,'doc','','imagenes/recurso/huevos.gif',1,0,168,0,'',0,0,1,'cpl',NULL,0,0,0,0,0,0,0,0,0,-0.2,'',0,NULL,0,NULL,0),
('lca','lec','cmt',NULL,'l','',NULL,1,1,72,0,'',0,0,1,NULL,NULL,0,0,0,0,0,0,0,0,0,-0.2,'',0,NULL,0,NULL,0),
('lec',NULL,NULL,NULL,'l','',NULL,0,1,0,0,'',0,0,1,NULL,NULL,0,0,0,0,0,0,0,0,0,0,'',0,NULL,0,NULL,0),
('leg',NULL,'cmt',NULL,'kgs','',NULL,0,1,0,0,'',0,0,1,NULL,NULL,0,0,0,0,0,0,0,0,0,0,'',0,NULL,0,NULL,0),
('lga','leg','cmt',NULL,'kgs','',NULL,1,1,336,0,'',0,0,1,NULL,NULL,0,336,0,0,0,0,0,0,0,0.2,'',0,NULL,0,NULL,0),
('lib',NULL,NULL,NULL,'eje','',NULL,0,1,0,0,'',0,0,1,NULL,NULL,0,0,0,0,0,0,0,0,0,0,'',0,NULL,0,NULL,0),
('lju','leg','cmt',NULL,'kgs','',NULL,1,1,336,0,'',0,0,1,NULL,NULL,0,336,0,0,0,0,0,0,0,0.2,'',0,NULL,0,NULL,0),
('lle','leg','cmt',NULL,'kgs','',NULL,1,1,336,0,'',0,0,1,NULL,NULL,0,336,0,0,0,0,0,0,0,0.2,'',0,NULL,0,NULL,0),
('lov','lec','cmt',NULL,'l','','',1,1,72,0,'',0,0,1,NULL,NULL,0,0,0,0,0,0,0,0,0,-0.2,'',0,NULL,0,NULL,0),
('lva','lec','cmt',NULL,'l','',NULL,1,1,72,0,'',0,0,1,NULL,NULL,0,0,0,0,0,0,0,0,0,-0.2,'',0,NULL,0,NULL,0),
('m01','com',NULL,NULL,'rac','',NULL,1,0,48,0,'',0,0,5,NULL,NULL,0,0,0,0,0,0,0,0,0,0.1,'',0,NULL,0,NULL,0),
('m02','com',NULL,NULL,'rac','',NULL,1,0,48,0,'',0,0,5,NULL,NULL,0,0,0,0,0,0,0,0,0,0.1,'',0,NULL,0,NULL,0),
('m03','com',NULL,NULL,'rac','','',1,0,48,0,'',0,0,1,NULL,NULL,0,0,0,0,0,0,0,0,0,0.1,'',0,NULL,0,NULL,0),
('m04','com',NULL,NULL,'rac','','',1,0,48,0,'',0,0,1,NULL,NULL,0,0,0,0,0,0,0,0,0,0.1,'',0,NULL,0,NULL,0),
('m05','com',NULL,NULL,'rac','','',1,0,48,0,'',0,0,1,NULL,NULL,0,0,0,0,0,0,0,0,0,0.1,NULL,0,NULL,0,NULL,0),
('m06','com',NULL,NULL,'rac','','',1,0,48,0,'',0,0,1,NULL,NULL,0,0,0,0,0,0,0,0,0,0.012,NULL,0,NULL,0,NULL,0),
('m07','com',NULL,NULL,'rac','','',1,0,24,0,'',0,0,1,NULL,NULL,0,0,0,0,0,0,0,0,0,0,NULL,0,NULL,0,NULL,0),
('mad','nat',NULL,NULL,'ton','','imagenes/recMadera.gif',1,1,0,0,'',0,0,1,NULL,NULL,0,0,0,0,0,0,0,0,0,0.2,'',0,NULL,0,NULL,0),
('mar',NULL,NULL,NULL,'kgs','',NULL,0,1,168,0,'',0,0,1,NULL,NULL,0,0,0,0,0,0,0,0,0,0,'',0,NULL,0,NULL,0),
('min',NULL,NULL,NULL,'ton','',NULL,0,2,0,0,'',0,0,1,NULL,NULL,0,0,0,0,0,0,0,0,0,0,'',0,NULL,0,NULL,0),
('mrc','mar','cmt',NULL,'kgs','',NULL,1,1,168,0,'',0,0,1,NULL,NULL,0,0,0,0,0,0,0,0,0,0.2,'',0,NULL,0,NULL,0),
('nat',NULL,NULL,NULL,'kgs','',NULL,0,1,0,0,'',0,0,1,NULL,NULL,0,0,0,0,0,0,0,0,0,0,'',0,NULL,0,NULL,0),
('nla','nat',NULL,NULL,'kgs','','',1,2,0,0,'',0,0,1,NULL,NULL,0,0,0,0,0,0,0,0,0,-0.1,NULL,0,NULL,0,NULL,0),
('oar',NULL,NULL,NULL,'uni','',NULL,0,1,0,0,'',0,0,1,NULL,NULL,0,0,0,0,0,0,0,0,0,0,'',0,NULL,0,NULL,0),
('ord',NULL,NULL,NULL,NULL,'','',0,1,0,0,'',0,0,1,NULL,NULL,0,0,0,0,0,0,0,0,0,0,NULL,0,NULL,0,NULL,0),
('oro','din',NULL,NULL,'mon','','imagenes/recOro.gif',1,2,0,0,'',1,0,1,NULL,NULL,0,0,0,0,0,0,0,0,0,0,'',0,NULL,0,NULL,0),
('pan',NULL,NULL,NULL,'kgs','',NULL,0,1,0,0,'',0,0,1,NULL,NULL,0,0,0,0,0,0,0,0,0,0,'',0,NULL,0,NULL,0),
('pbl','pan','cmt',NULL,'kgs','','',1,1,168,0,'',0,0,1,NULL,NULL,0,168,0,0,0,0,0,0,0,-0.0125,NULL,0,NULL,0,NULL,0),
('pes','mar','cmt',NULL,'kgs','',NULL,1,1,168,0,'',0,0,1,NULL,NULL,0,0,0,0,0,0,0,0,0,0.2,'',0,NULL,0,NULL,0),
('pie','nat','min',NULL,'ton','',NULL,1,2,0,0,'',0,0,1,NULL,NULL,0,0,0,0,0,0,0,0,0,0.2,'',0,NULL,0,NULL,0),
('pla',NULL,NULL,NULL,'kgs','','',0,2,0,0,'',0,0,1,NULL,NULL,0,0,0,0,0,0,0,0,0,0,NULL,0,NULL,0,NULL,0),
('pls',NULL,NULL,NULL,'uni','','imagenes/recurso/piel.gif',0,0,0,0,'',0,0,1,NULL,NULL,0,0,0,0,0,0,0,0,0,0,'',0,NULL,0,NULL,0),
('pre','pls',NULL,NULL,'uni','','imagenes/recurso/piel.gif',1,0,0,0,'',0,0,1,NULL,NULL,0,0,0,0,0,0,0,0,0,0.2,'',0,NULL,0,NULL,0),
('pva','pls',NULL,NULL,'uni','','imagenes/recurso/piel.gif',1,0,0,0,'',0,0,1,NULL,NULL,0,0,0,0,0,0,0,0,0,0.2,'',0,NULL,0,NULL,0),
('qca','que',NULL,NULL,'uni','','',1,0,336,0,'',0,0,7,NULL,NULL,0,0,0,0,0,0,0,0,0,0.05,NULL,0,NULL,0,NULL,0),
('qov','que',NULL,NULL,'uni','','',1,0,336,0,'',0,0,7,NULL,NULL,0,0,0,0,0,0,0,0,0,0.03,NULL,0,NULL,0,NULL,0),
('que',NULL,NULL,NULL,'uni','','',0,0,336,0,'',0,0,1,NULL,NULL,0,0,0,0,0,0,0,0,0,0,NULL,0,NULL,0,NULL,0),
('qva','que',NULL,NULL,'uni','','',1,0,336,0,'',0,0,7,NULL,NULL,0,0,0,0,0,0,0,0,0,0.05,NULL,0,NULL,0,NULL,0),
('r01','rel','oar',NULL,'eje','','',1,0,0,0,'',0,1,0.01,NULL,NULL,0,0,0,0,0,0,0,0,0,0,NULL,0,NULL,0,NULL,0),
('r02','rel','oar',NULL,'eje','','',1,0,0,0,'',0,1,0.005,NULL,NULL,0,0,0,0,0,0,0,0,0,0,NULL,0,NULL,0,NULL,0),
('rel',NULL,NULL,NULL,'eje','','',0,0,0,0,'',0,1,0.01,NULL,NULL,0,0,0,0,0,0,0,0,0,0,NULL,0,NULL,0,NULL,0),
('rop',NULL,NULL,NULL,'pre','','imagenes/recurso/ropa.gif',0,0,0,0,'',0,0,1,NULL,NULL,0,0,0,0,0,0,0,0,0,0,'',0,NULL,0,NULL,0),
('sar','sem',NULL,NULL,'sac','','',1,0,2920,0,'',0,0,1,'caz',NULL,720,168,100,0,0,0,0,0,0,-0.001,NULL,0,NULL,0,NULL,0),
('sav','sem',NULL,NULL,'sac','','',1,0,2920,0,'',0,0,1,'cav',NULL,720,168,100,0,0,0,0,0,0,-0.0016,NULL,0,NULL,0,NULL,0),
('scb','sem',NULL,NULL,'sac','','',1,0,2920,0,'',0,0,1,'vcb',NULL,720,168,100,0,0,0,0,0,0,-0.001,NULL,0,NULL,0,NULL,0),
('sce','sem',NULL,NULL,'sac','','',1,0,2920,0,'',0,0,1,'ccb',NULL,720,168,100,0,0,0,0,0,0,-0.00085,NULL,0,NULL,0,NULL,0),
('scn','sem',NULL,NULL,'sac','','',1,0,2920,0,'',0,0,1,'ccn',NULL,720,168,100,0,0,0,0,0,0,-0.2,NULL,0,NULL,0,NULL,0),
('sem',NULL,NULL,NULL,'sac','',NULL,0,1,0,NULL,'',0,0,1,NULL,NULL,0,0,0,0,0,0,0,0,0,0,'',0,NULL,0,NULL,0),
('shi','sem','arb',NULL,'sac','','',1,0,2920,0,'',0,0,1,'fhi',NULL,720,168,100,0,0,0,0,0,0,-0.025,NULL,0,NULL,0,NULL,0),
('sma','sem','arb',NULL,'sac','','',1,1,2920,0,'',0,0,1,'fma',NULL,720,168,100,0,0,0,0,0,0,-0.2,NULL,0,NULL,0,NULL,0),
('sna','sem',NULL,NULL,'sac','','',1,1,2920,0,'',0,0,1,'fna',NULL,720,168,100,0,0,0,0,0,0,-0.0015,NULL,0,NULL,0,NULL,0),
('ssa','sem',NULL,NULL,'sac','','',1,1,2920,0,'',0,0,1,'fsa',NULL,720,168,100,0,0,0,0,0,0,-0.00097,NULL,0,NULL,0,NULL,0),
('vas','oar',NULL,NULL,'uni','','',1,1,0,0,'',0,0,1,NULL,NULL,0,0,0,0,0,0,0,0,0,0.2,NULL,0,NULL,0,NULL,0),
('vcb','ver','cmt',NULL,'kgs','','',1,1,168,0,'',0,0,1,NULL,NULL,0,0,0,0,0,0,0,0,0,0.2,NULL,0,NULL,0,NULL,0),
('ver',NULL,NULL,NULL,'kgs','','',0,2,0,0,'',0,0,1,NULL,NULL,0,0,0,0,0,0,0,0,0,0,NULL,0,NULL,0,NULL,0);
/*!40000 ALTER TABLE `_RECURSO_TIPO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `_RECURSO_TIPOT`
--

DROP TABLE IF EXISTS `_RECURSO_TIPOT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `_RECURSO_TIPOT` (
  `IDIOMAID` char(2) NOT NULL DEFAULT '',
  `RECURSOID` char(3) NOT NULL DEFAULT '',
  `NOMBRE` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`IDIOMAID`,`RECURSOID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_RECURSO_TIPOT`
--

LOCK TABLES `_RECURSO_TIPOT` WRITE;
/*!40000 ALTER TABLE `_RECURSO_TIPOT` DISABLE KEYS */;
INSERT INTO `_RECURSO_TIPOT` VALUES
('ca','abr','Cabra'),
('ca','abu','Bou'),
('ca','aca','Cavall'),
('ca','ace','Porc'),
('ca','agh','Gallina'),
('ca','agm','Gall'),
('ca','alf','Terrisseria'),
('ca','ang','Animal de Granja'),
('ca','arc','Arc de Ca�era'),
('ca','ath','Vedella'),
('ca','atm','Vedell'),
('ca','ato','Toro'),
('ca','ava','Vaca'),
('ca','aye','Egua'),
('ca','car','Carn'),
('ca','cas','Carn d\'Animal Salvatje'),
('ca','cav','Civada'),
('ca','caz','Arr�s'),
('ca','cbr','Carn de Cabra'),
('ca','ccb','Ordi'),
('ca','cce','Carn de Porc'),
('ca','ccn','S�gol'),
('ca','cco','Carn de Conill'),
('ca','ccr','Carne de Anyell'),
('ca','cer','Cereals'),
('ca','cja','Carn de Porc Senglar'),
('ca','cli','Carn de Llebre'),
('ca','cmt','Comestible'),
('ca','com','Menjar'),
('ca','cov','Carn d\'Ovella'),
('ca','cpe','Carn de Perdiu'),
('ca','cpl','Carn de Pollastre'),
('ca','cpr','Menjar Preparat'),
('ca','cre','Carn de Ren'),
('ca','cru','Crucifixos'),
('ca','cse','S�sam'),
('ca','ctg','Ordi'),
('ca','cto','Carn de Toro'),
('ca','ctr','Carn de Vedella'),
('ca','cua','Quallo Animal'),
('ca','cvc','Carn de Bov�'),
('ca','din','Diners'),
('ca','fhi','Figues'),
('ca','fle','Fletxes'),
('ca','fma','Pomes'),
('ca','fna','Taronges'),
('ca','fru','Fruita'),
('ca','fsa','S�ndries'),
('ca','hab','H�bits'),
('ca','har','Arada'),
('ca','haz','Azada'),
('ca','hcn','Farina de S�gol'),
('ca','hco','Collera'),
('ca','her','Eines'),
('ca','hha','Destral'),
('ca','hhd','Destral de Doble Fil'),
('ca','hie','Ferro'),
('ca','hor','Hortalisses'),
('ca','hpa','Patates'),
('ca','hpi','Pic'),
('ca','hrn','Farines'),
('ca','hte','Teler'),
('ca','htr','Farina de Blat'),
('ca','hue','Ous'),
('ca','hug','Ous de Gallina'),
('ca','lca','Llet de Cabra'),
('ca','lec','Llet'),
('ca','leg','Llegums'),
('ca','lga','Cigrons'),
('ca','lib','Llibres'),
('ca','lju','Mongetes'),
('ca','lle','Llentilles'),
('ca','lov','Llet d\'Ovella'),
('ca','lva','Llet de Vaca'),
('ca','m01','Pollastre amb Verdures'),
('ca','m02','Ren Estofat'),
('ca','m03','Llebre amb Verdures'),
('ca','m04','Perdius al Forn'),
('ca','m05','Senglar Rostit'),
('ca','m06','Peix i Marisc'),
('ca','m07','Truita'),
('ca','mad','Fusta'),
('ca','mar','Fruits del Mar'),
('ca','min','Minerales'),
('ca','mrc','Marisc'),
('ca','nat','Naturals'),
('ca','nla','Llana'),
('ca','oar','Objectes Artesans'),
('ca','oro','Or'),
('ca','pan','Pa'),
('ca','pbl','Pa Blanc'),
('ca','pes','Peix'),
('ca','pie','Pedra'),
('ca','pla','Plantable'),
('ca','pls','Pells'),
('ca','pre','Pells de Ren'),
('ca','pva','Pells de Vaca'),
('ca','qca','Formatge de Cabra'),
('ca','qov','Formatge d\'Ovella'),
('ca','que','Formatges'),
('ca','qva','Formatge de Vaca'),
('ca','rop','Roba'),
('ca','sar','Llavors de d\'Arroz'),
('ca','sav','Llavors de Civada'),
('ca','scb','Llavors de Carbassons'),
('ca','sce','Llavors d\'Ordi'),
('ca','scn','Llavors de S�gol'),
('ca','sem','Llavors'),
('ca','shi','Llavors de Figues'),
('ca','sma','Llavors de Poma'),
('ca','sna','Llavors de Taronja'),
('ca','ssa','Llavors de Sindria'),
('ca','vas','Atuells'),
('ca','vcb','Carbassons'),
('en','',''),
('en','abr','Goat'),
('en','abu','Ox'),
('en','aca','Horse'),
('en','ace','Pig'),
('en','agh','Hen'),
('en','agm','Rooster'),
('en','alf','Pottery'),
('en','ang','Animal'),
('en','arb','Tree'),
('en','arc','Arc of Hunting'),
('en','ath','Calf'),
('en','atm','Bull calf'),
('en','ato','Bull'),
('en','ava','Cow'),
('en','aye','Mare'),
('en','car','Meat'),
('en','cas','Wild Animal Meat'),
('en','cav','Oats'),
('en','caz','Rice'),
('en','cbr','Meat of Goat'),
('en','ccb','Barley'),
('en','cce','Meat of Pig'),
('en','ccn','Rye'),
('en','cco','Meat of Rabbit'),
('en','ccr','Meat of Lamb'),
('en','cer','Cereals'),
('en','cja','Meat of Wild boar'),
('en','cli','Meat of Hare'),
('en','cmt','Eatable'),
('en','com','Food'),
('en','cov','Meat of Ewe'),
('en','cpe','Carne de Perdiz'),
('en','cpl','Meat of Chicken'),
('en','cpr','Prepared Food'),
('en','cre','Meat of Reindeer'),
('en','cru','Crossings'),
('en','cse','*=*S�samo'),
('en','ctg','Wheat'),
('en','cto','Meat of Bull'),
('en','ctr','Meat of Calf'),
('en','cua','Animal Curdle'),
('en','cvc','Meat of Cow'),
('en','din','Money'),
('en','fhi','Higos'),
('en','fle','Arrows'),
('en','fma','Apples'),
('en','fna','Oranges'),
('en','fru','Fruit'),
('en','fsa','Watermelons'),
('en','hab','Habits'),
('en','har','Plow'),
('en','haz','Hoe'),
('en','hcn','Flour of Rye'),
('en','hco','Necklace?'),
('en','her','Tools'),
('en','hha','Axe'),
('en','hhd','Dobre Edged Axe'),
('en','hie','Iron'),
('en','hor','Vegetables'),
('en','hpa','Potatoes'),
('en','hpi','Tip'),
('en','hrn','Flours'),
('en','hte','Loom'),
('en','htr','Flour of Wheat'),
('en','hue','Eggs'),
('en','hug','Eggs of Hen'),
('en','lca','Milk of Goat'),
('en','lec','Milk'),
('en','leg','Vegetables'),
('en','lga','Chick-peas'),
('en','lib','Books'),
('en','lju','Beans'),
('en','lle','Lentils'),
('en','lov','Milk of Ewe'),
('en','lva','Milk of Cow'),
('en','m01','Chicken with Vegetables'),
('en','m02','Cooked Reindeer'),
('en','m03','Hare with Vegetables'),
('en','m04','*=*Perdices Horneadas'),
('en','m05','Roasted Wild boar'),
('en','m06','Fish and Seafood'),
('en','m07','*=*Tortilla'),
('en','mad','Wood'),
('en','mar','Fruits of the Sea'),
('en','min','Minerals'),
('en','mrc','Seafood'),
('en','nat','Naturals'),
('en','nla','Wool'),
('en','oar','Hand-made articles'),
('en','ord','Milkable'),
('en','oro','Gold'),
('en','pan','Bread'),
('en','pbl','White Bread'),
('en','pes','Fish'),
('en','pie','Stone'),
('en','pla','Plantable'),
('en','pls','Skins'),
('en','pre','Skins of Reindeer'),
('en','pva','Skins of Cow'),
('en','qca','Cheese of Goat'),
('en','qov','Cheese of Ewe'),
('en','que','Cheeses'),
('en','qva','Cheese of Cow'),
('en','r01','Chalice'),
('en','r02','Altar'),
('en','rel','Relics'),
('en','rop','Clothes'),
('en','sar','Seeds of Rice'),
('en','sav','Oats seeds'),
('en','scb','Seeds of Marrows'),
('en','sce','Seeds of Barley'),
('en','scn','Seeds of Rye'),
('en','sem','Seeds'),
('en','shi','*=*Semillas de Higos'),
('en','sma','Seeds of Apples'),
('en','sna','Seeds of Oranges'),
('en','ssa','Seeds of Watermellons'),
('en','vas','*=*Vasijas'),
('en','vcb','Marrows'),
('en','ver','Vegetables'),
('es','',NULL),
('es','abr','Cabra'),
('es','abu','Buey'),
('es','aca','Caballo'),
('es','ace','Cerdo'),
('es','agh','Gallina'),
('es','agm','Gallo'),
('es','alf','Alfarer�a'),
('es','ang','Animal de Granja'),
('es','arb','�rbol'),
('es','arc','Arco de Caza'),
('es','ath','Ternera'),
('es','atm','Ternero'),
('es','ato','Toro'),
('es','ava','Vaca'),
('es','aye','Yegua'),
('es','car','Carne'),
('es','cas','Carne de Animal Salvaje'),
('es','cav','Avena'),
('es','caz','Arroz'),
('es','cbr','Carne de Cabra'),
('es','ccb','Cebada'),
('es','cce','Carne de Cerdo'),
('es','ccn','Centeno'),
('es','cco','Carne de Conejo'),
('es','ccr','Carne de Cordero'),
('es','cer','Cereales'),
('es','cja','Carne de Jabal�'),
('es','cli','Carne de Liebre'),
('es','cmt','Comestible'),
('es','com','Comida'),
('es','cov','Carne de Oveja'),
('es','cpe','Carne de Perdiz'),
('es','cpl','Carne de Pollo'),
('es','cpr','Comida Preparada'),
('es','cre','Carne de Reno'),
('es','cru','Crucifijos'),
('es','cse','S�samo'),
('es','ctg','Trigo'),
('es','cto','Carne de Toro'),
('es','ctr','Carne de Ternera'),
('es','cua','Cuajo Animal'),
('es','cvc','Carne de Vaca'),
('es','din','Dinero'),
('es','fhi','Higos'),
('es','fle','Flechas'),
('es','fma','Manzanas'),
('es','fna','Naranjas'),
('es','fru','Fruta'),
('es','fsa','Sand�as'),
('es','hab','H�bitos'),
('es','har','Arado'),
('es','haz','Azada'),
('es','hcn','Harina de Centeno'),
('es','hco','Collera'),
('es','her','Herramientas'),
('es','hha','Hacha'),
('es','hhd','Hacha de Dobre Filo'),
('es','hie','Hierro'),
('es','hor','Hortalizas'),
('es','hpa','Patatas'),
('es','hpi','Pico'),
('es','hrn','Harinas'),
('es','hte','Telar'),
('es','htr','Harina de Trigo'),
('es','hue','Huevos'),
('es','hug','Huevos de Gallina'),
('es','lca','Leche de Cabra'),
('es','lec','Leche'),
('es','leg','Legumbres'),
('es','lga','Garbanzos'),
('es','lib','Libros'),
('es','lju','Jud�as'),
('es','lle','Lentejas'),
('es','lov','Leche de Oveja'),
('es','lva','Leche de Vaca'),
('es','m01','Pollo con Verduras'),
('es','m02','Reno Estofado'),
('es','m03','Liebre con Verduras'),
('es','m04','Perdices Horneadas :-D'),
('es','m05','Jabal� Asado'),
('es','m06','Pescado y Marisco'),
('es','m07','Tortilla'),
('es','mad','Madera'),
('es','mar','Frutos del Mar'),
('es','min','Minerales'),
('es','mrc','Marisco'),
('es','nat','Naturales'),
('es','nla','Lana'),
('es','oar','Objetos Artesanos'),
('es','ord','Orde�able'),
('es','oro','Oro'),
('es','pan','Pan'),
('es','pbl','Pan Blanco'),
('es','pes','Pescado'),
('es','pie','Piedra'),
('es','pla','Plantable'),
('es','pls','Pieles'),
('es','pre','Pieles de Reno'),
('es','pva','Pieles de Vaca'),
('es','qca','Queso de Cabra'),
('es','qov','Queso de Oveja'),
('es','que','Quesos'),
('es','qva','Queso de Vaca'),
('es','r01','C�liz'),
('es','r02','Altar'),
('es','rel','Reliquias'),
('es','rop','Ropa'),
('es','sar','Semillas de Arroz'),
('es','sav','Semillas de Avena'),
('es','scb','Semillas de Calabacines'),
('es','sce','Semillas de Cebada'),
('es','scn','Semillas de Centeno'),
('es','sem','Semillas'),
('es','shi','Semillas de Higos'),
('es','sma','Semillas de Manzana'),
('es','sna','Semillas de Naranja'),
('es','ssa','Semillas de Sand�a'),
('es','vas','Vasijas'),
('es','vcb','Calabacines'),
('es','ver','Verduras');
/*!40000 ALTER TABLE `_RECURSO_TIPOT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `_REGION`
--

DROP TABLE IF EXISTS `_REGION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `_REGION` (
  `REGIONID` int(11) NOT NULL AUTO_INCREMENT,
  `X` int(11) DEFAULT NULL,
  `Y` int(11) DEFAULT NULL,
  `POBLACION` bigint(20) DEFAULT NULL,
  `CLIMA` int(11) DEFAULT NULL,
  `TEMPERATURA` int(11) DEFAULT NULL,
  `MAPA` varchar(128) DEFAULT NULL,
  `TRIBUTO` double NOT NULL DEFAULT 1,
  `ECONOMIA` double NOT NULL DEFAULT 0,
  `ESPIRITU` double NOT NULL DEFAULT 0,
  `TECNOLOGIA` double NOT NULL DEFAULT 0,
  `RANKING` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`REGIONID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci COMMENT='Regiones donde se ubican las abad�as';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_REGION`
--

LOCK TABLES `_REGION` WRITE;
/*!40000 ALTER TABLE `_REGION` DISABLE KEYS */;
INSERT INTO `_REGION` VALUES
(1,176,566,500000,2,18,'imagenes/regNavarra.gif',1,68696860.2719392,9.2871920734921,0,2),
(2,474,411,2000000,1,19,'imagenes/regCastillaLeon.gif',1,128925355.526764,8.3970656413888,0,1);
/*!40000 ALTER TABLE `_REGION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `_REGIONT`
--

DROP TABLE IF EXISTS `_REGIONT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `_REGIONT` (
  `REGIONID` int(11) NOT NULL DEFAULT 0,
  `IDIOMAID` char(2) NOT NULL DEFAULT '',
  `NOMBRE` varchar(32) NOT NULL DEFAULT '',
  `ACTUALMENTE` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`REGIONID`,`IDIOMAID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_REGIONT`
--

LOCK TABLES `_REGIONT` WRITE;
/*!40000 ALTER TABLE `_REGIONT` DISABLE KEYS */;
INSERT INTO `_REGIONT` VALUES
(1,'ca','Navarra','Espanya'),
(1,'en','Navarra','Spain'),
(1,'es','Navarra','Espa�a'),
(2,'ca','Regne de Castella I Lle�','Espanya'),
(2,'en','Kingdom of Castile and Leon','Spain'),
(2,'es','Reino de Castilla y Le�n','Espa�a');
/*!40000 ALTER TABLE `_REGIONT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `_TECNOLOGIA`
--

DROP TABLE IF EXISTS `_TECNOLOGIA`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `_TECNOLOGIA` (
  `TECNOLOGIAID` char(3) NOT NULL DEFAULT '',
  `NECESARIA` char(3) DEFAULT NULL,
  `ICONO` char(255) DEFAULT NULL,
  PRIMARY KEY (`TECNOLOGIAID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_TECNOLOGIA`
--

LOCK TABLES `_TECNOLOGIA` WRITE;
/*!40000 ALTER TABLE `_TECNOLOGIA` DISABLE KEYS */;
/*!40000 ALTER TABLE `_TECNOLOGIA` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `_TECNOLOGIAT`
--

DROP TABLE IF EXISTS `_TECNOLOGIAT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `_TECNOLOGIAT` (
  `TECNOLOGIAID` char(3) NOT NULL DEFAULT '',
  `IDIOMAID` char(2) NOT NULL DEFAULT '',
  `NOMBRE` varchar(32) DEFAULT NULL,
  `COMENTARIOS` longtext DEFAULT NULL,
  PRIMARY KEY (`TECNOLOGIAID`,`IDIOMAID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_TECNOLOGIAT`
--

LOCK TABLES `_TECNOLOGIAT` WRITE;
/*!40000 ALTER TABLE `_TECNOLOGIAT` DISABLE KEYS */;
/*!40000 ALTER TABLE `_TECNOLOGIAT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `_TRANSFORMACION`
--

DROP TABLE IF EXISTS `_TRANSFORMACION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `_TRANSFORMACION` (
  `RECURSOID` char(3) NOT NULL DEFAULT '',
  `ORIGENID` char(3) NOT NULL DEFAULT '',
  `ACTIVIDADID` char(3) DEFAULT NULL,
  `DESTINOID` char(3) NOT NULL DEFAULT '',
  `TRANSFORMA_EN` char(3) NOT NULL DEFAULT '',
  `CADUCIDAD_MINIMA` int(11) NOT NULL DEFAULT 0,
  `CADUCIDAD_MAXIMA` int(11) NOT NULL DEFAULT 0,
  `CANTIDAD` double NOT NULL DEFAULT 0,
  `MENSAJE_TIPOID` char(6) DEFAULT NULL,
  `SUSTITUIR` tinyint(3) unsigned NOT NULL DEFAULT 1,
  PRIMARY KEY (`RECURSOID`,`ORIGENID`,`DESTINOID`,`TRANSFORMA_EN`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_TRANSFORMACION`
--

LOCK TABLES `_TRANSFORMACION` WRITE;
/*!40000 ALTER TABLE `_TRANSFORMACION` DISABLE KEYS */;
INSERT INTO `_TRANSFORMACION` VALUES
('sma','sem',NULL,'pla','fma',12,12,1,NULL,1),
('fma','fru',NULL,'mad','fma',168,336,1,NULL,1),
('fma','fru','cos','alm','fma',168,336,100,NULL,1),
('fma','mad','cos','alm','sma',8760,10950,1,NULL,1),
('sma','alm','sem','sem','sma',12,12,1,NULL,1),
('caz','cos','cos','alm','caz',2160,4320,1,NULL,1),
('sar','alm','sem','sem','sar',1440,2160,0.01,NULL,1),
('sar','sem',NULL,'cos','caz',336,504,1,NULL,1),
('caz','cos',NULL,'mad','caz',168,336,1,NULL,1),
('caz','mad','cos','alm','sar',8760,10950,0.04,NULL,1),
('fma','fru','cos','pla','fma',8760,8760,1,NULL,1),
('sav','alm','sem','sem','sav',1440,2160,1,NULL,1),
('sav','sem',NULL,'cos','cav',336,504,1,NULL,1),
('cav','cos','cos','alm','cav',2160,4320,1,NULL,1),
('vcb','cos',NULL,'mad','vcb',168,336,1,NULL,1),
('cav','cos',NULL,'mad','cav',168,336,1,NULL,1),
('cav','mad','cos','alm','sav',8760,10950,1,NULL,1),
('scb','alm','sem','sem','scb',1440,2160,1,NULL,1),
('scb','sem',NULL,'cos','vcb',336,504,1,NULL,1),
('vcb','cos','cos','alm','vcb',168,336,1,NULL,1),
('vcb','mad','cos','alm','scb',8760,10950,1,NULL,1),
('sce','alm','sem','sem','sce',1440,2160,1,NULL,1),
('sce','sem',NULL,'cos','ccb',336,504,1,NULL,1),
('ccb','cos','cos','alm','ccb',2160,4320,15,NULL,1),
('ccb','cos',NULL,'mad','ccb',168,336,1,NULL,1),
('ccb','mad','cos','alm','sce',8760,10950,1,NULL,1),
('scn','alm','sem','sem','scn',1440,2160,1,NULL,1),
('scn','sem',NULL,'cos','ccn',336,504,1,NULL,1),
('ccn','cos','cos','alm','ccn',2160,4320,1,NULL,1),
('ccn','cos',NULL,'mad','ccn',168,336,1,NULL,1),
('ccn','mad','cos','alm','scn',8760,10950,1,NULL,1),
('shi','alm','sem','sem','shi',8760,8760,0.01,NULL,1),
('shi','sem',NULL,'pla','fhi',8760,8760,1,NULL,1),
('fhi','fru','cos','alm','fhi',168,336,1,NULL,1),
('fhi','fru','cos','pla','fhi',8492,8256,1,NULL,1),
('fhi','fru',NULL,'mad','fhi',168,336,1,NULL,1),
('fhi','mad','cos','alm','shi',8760,10950,0.04,NULL,1),
('fhi','mad','cos','pla','fhi',7920,8088,1,NULL,1),
('fhi','pla',NULL,'fru','fhi',168,336,1,NULL,1),
('ssa','alm','sem','sem','ssa',8760,8760,0.01,NULL,1),
('ssa','sem',NULL,'pla','fsa',8760,8760,1,NULL,1),
('fsa','pla',NULL,'fru','fsa',168,336,1,NULL,1),
('fsa','fru','cos','alm','fsa',168,336,10,NULL,1),
('fsa','fru','cos','pla','fsa',8256,8492,1,NULL,1),
('fsa','fru',NULL,'mad','fsa',168,336,1,NULL,1),
('fsa','mad','cos','alm','ssa',8760,10950,0.04,NULL,1),
('fsa','mad','cos','pla','fsa',7920,8088,1,NULL,1),
('sna','alm','sem','sem','sna',8760,8760,0.01,NULL,1),
('sna','sem',NULL,'pla','fna',8760,8760,1,NULL,1),
('fna','pla',NULL,'fru','fna',168,336,1,NULL,1),
('fna','fru',NULL,'mad','fna',168,336,1,NULL,1),
('fna','mad',NULL,'pla','fna',7920,8088,1,NULL,1),
('fna','fru','cos','alm','fna',168,336,4,NULL,1),
('fna','fru','cos','pla','fna',8256,8492,1,NULL,1),
('fna','mad','cos','alm','sna',168,336,0.04,NULL,1),
('','bru','ara','ara','',0,0,1,NULL,1),
('ava','alm','ord','alm','lva',72,96,5,NULL,0),
('ava','alm','sac','alm','cvc',168,336,1,NULL,1),
('','ara','sem','sem','',0,0,0,NULL,1);
/*!40000 ALTER TABLE `_TRANSFORMACION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `_UNIDAD_MEDIDA`
--

DROP TABLE IF EXISTS `_UNIDAD_MEDIDA`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `_UNIDAD_MEDIDA` (
  `UNIDADID` char(3) NOT NULL DEFAULT '',
  PRIMARY KEY (`UNIDADID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_UNIDAD_MEDIDA`
--

LOCK TABLES `_UNIDAD_MEDIDA` WRITE;
/*!40000 ALTER TABLE `_UNIDAD_MEDIDA` DISABLE KEYS */;
INSERT INTO `_UNIDAD_MEDIDA` VALUES
('doc'),
('eje'),
('kgs'),
('l'),
('m'),
('m2'),
('mon'),
('pre'),
('rac'),
('sac'),
('ton'),
('uni');
/*!40000 ALTER TABLE `_UNIDAD_MEDIDA` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `_UNIDAD_MEDIDAT`
--

DROP TABLE IF EXISTS `_UNIDAD_MEDIDAT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `_UNIDAD_MEDIDAT` (
  `UNIDADID` char(3) NOT NULL DEFAULT '',
  `IDIOMAID` char(2) NOT NULL DEFAULT '',
  `NOMBRE` varchar(32) DEFAULT NULL,
  `ABREVIACION` char(3) DEFAULT NULL,
  PRIMARY KEY (`UNIDADID`,`IDIOMAID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_UNIDAD_MEDIDAT`
--

LOCK TABLES `_UNIDAD_MEDIDAT` WRITE;
/*!40000 ALTER TABLE `_UNIDAD_MEDIDAT` DISABLE KEYS */;
INSERT INTO `_UNIDAD_MEDIDAT` VALUES
('doc','ca','Dotzenes','12u'),
('doc','en','Dozens','12u'),
('doc','es','Docenas','12u'),
('eje','ca','Exemplars','Eje'),
('eje','en','Units','Uni'),
('eje','es','Ejemplares','Eje'),
('kgs','ca','Kilograms','Kgs'),
('kgs','en','Kilograms','Kgs'),
('kgs','es','Kilogramos','Kgs'),
('l','ca','Litres','l'),
('l','en','Liters','l'),
('l','es','Litros','l'),
('m','ca','Metres','m'),
('m','en','Meters','m'),
('m','es','Metros','m'),
('m2','ca','Metres Quadrats','m2'),
('m2','en','Square Meters','m2'),
('m2','es','Metros Cuadrados','m2'),
('mon','ca','Monedes','Mon'),
('mon','en','Currencies','Cur'),
('mon','es','Monedas','Mon'),
('pre','ca','Peces','pcs'),
('pre','en','Articles','Art'),
('pre','es','Prendas','pr.'),
('rac','ca','Racions','rac'),
('rac','en','Rations','Rat'),
('rac','es','Raciones','rac'),
('sac','ca','Sacs','Scs'),
('sac','en','Coats','Cts'),
('sac','es','Sacos','Scs'),
('ton','ca','Tonelades','ton'),
('ton','en','Tons','Ton'),
('ton','es','Toneladas','Ton'),
('uni','ca','Unitats','Uni'),
('uni','en','Units','Uni'),
('uni','es','Unidades','Uni');
/*!40000 ALTER TABLE `_UNIDAD_MEDIDAT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `_UNIDAD_TIPO`
--

DROP TABLE IF EXISTS `_UNIDAD_TIPO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `_UNIDAD_TIPO` (
  `UNIDAD_TIPOID` char(3) NOT NULL DEFAULT '',
  `JERARCA_SUPERIOR` char(3) DEFAULT NULL,
  `ACTIVO` tinyint(4) NOT NULL DEFAULT 1,
  `ICONO` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`UNIDAD_TIPOID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci COMMENT='Jerarquia Eclesi�stica';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_UNIDAD_TIPO`
--

LOCK TABLES `_UNIDAD_TIPO` WRITE;
/*!40000 ALTER TABLE `_UNIDAD_TIPO` DISABLE KEYS */;
INSERT INTO `_UNIDAD_TIPO` VALUES
('aba','abp',1,''),
('ald','nov',0,''),
('nov','obe',1,''),
('obe','pri',1,''),
('pri','aba',1,'');
/*!40000 ALTER TABLE `_UNIDAD_TIPO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `_UNIDAD_TIPOT`
--

DROP TABLE IF EXISTS `_UNIDAD_TIPOT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `_UNIDAD_TIPOT` (
  `UNIDAD_TIPOID` char(3) NOT NULL DEFAULT '',
  `IDIOMAID` char(2) NOT NULL DEFAULT '',
  `NOMBRE` varchar(32) DEFAULT NULL,
  `OBJETIVOS` longtext DEFAULT NULL,
  PRIMARY KEY (`UNIDAD_TIPOID`,`IDIOMAID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_UNIDAD_TIPOT`
--

LOCK TABLES `_UNIDAD_TIPOT` WRITE;
/*!40000 ALTER TABLE `_UNIDAD_TIPOT` DISABLE KEYS */;
INSERT INTO `_UNIDAD_TIPOT` VALUES
('aba','ca','Abat','Gestionar l\'abadia encomanada i sol�licitar a l\'Abat Primat les necessitats a nivell regional.'),
('aba','en','Abbot','To manage the entrusted abbey and to ask for to Abbot Primado the necessities at regional level.'),
('aba','es','Abad','Gestionar la abad�a encomendada y solicitar al Abad Primado las necesidades a nivel regional.'),
('abp','ca','Abat Primat','Cuidar dels monestirs de la regi�.'),
('abp','en','Abbot Primado','To take care of of the monasteries of the region'),
('abp','es','Abad Primado','Cuidar de los monasterios de la regi�n'),
('nov','ca','Novici','Arribar a obedenciari'),
('nov','en','Novice','To arrive at monk'),
('nov','es','Novicio','Llegar a obedenciario'),
('obe','ca','Obedenciari','Realitzar les tasques encomanades sense oblidar el seu creixement espiritual.'),
('obe','en','Monk','To make the tasks entrusted without forgetting its spiritual growth.'),
('obe','es','Obedenciario','Realizar las tareas encomendadas sin olvidar su crecimiento espiritual.'),
('pri','ca','Prior','Gestionar el monestir encomanat i sol�licitar als Abats Prevalguts les necessitats a nivell regional.'),
('pri','en','Prior','To manage the entrusted monastery and to ask for to Abbots Primados the necessities at regional level.'),
('pri','es','Prior','Gestionar el monasterio encomendado y solicitar a los Abades Primados las necesidades a nivel regional.');
/*!40000 ALTER TABLE `_UNIDAD_TIPOT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `_UNIDAD_TIPO_ACTIVIDAD`
--

DROP TABLE IF EXISTS `_UNIDAD_TIPO_ACTIVIDAD`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `_UNIDAD_TIPO_ACTIVIDAD` (
  `UNIDAD_TIPOID` char(3) DEFAULT NULL,
  `ACTIVIDADID` char(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci COMMENT='Activities Executed by Unit Types';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_UNIDAD_TIPO_ACTIVIDAD`
--

LOCK TABLES `_UNIDAD_TIPO_ACTIVIDAD` WRITE;
/*!40000 ALTER TABLE `_UNIDAD_TIPO_ACTIVIDAD` DISABLE KEYS */;
INSERT INTO `_UNIDAD_TIPO_ACTIVIDAD` VALUES
('aba',''),
('',''),
('','');
/*!40000 ALTER TABLE `_UNIDAD_TIPO_ACTIVIDAD` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `_UTILIDAD`
--

DROP TABLE IF EXISTS `_UTILIDAD`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `_UTILIDAD` (
  `UTILIDADID` char(3) NOT NULL DEFAULT '',
  `TEMPORAL` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`UTILIDADID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci COMMENT='Utilidad de los Edificios';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_UTILIDAD`
--

LOCK TABLES `_UTILIDAD` WRITE;
/*!40000 ALTER TABLE `_UTILIDAD` DISABLE KEYS */;
INSERT INTO `_UTILIDAD` VALUES
('alm',0),
('com',1),
('cos',0),
('mec',1),
('prc',0),
('rea',1),
('sem',0),
('ten',0);
/*!40000 ALTER TABLE `_UTILIDAD` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `_UTILIDADT`
--

DROP TABLE IF EXISTS `_UTILIDADT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `_UTILIDADT` (
  `IDIOMAID` char(2) NOT NULL DEFAULT '',
  `UTILIDADID` char(3) NOT NULL DEFAULT '',
  `DESCRIPCION` varchar(64) DEFAULT NULL,
  `PARTICIPIO` varchar(32) NOT NULL DEFAULT '',
  PRIMARY KEY (`IDIOMAID`,`UTILIDADID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci COMMENT='Descripci�n de las Utilidades de los Tipos de Edificio';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_UTILIDADT`
--

LOCK TABLES `_UTILIDADT` WRITE;
/*!40000 ALTER TABLE `_UTILIDADT` DISABLE KEYS */;
INSERT INTO `_UTILIDADT` VALUES
('ca','alm','Emmagatzema &a &u de &r.','Emmagatzemat'),
('ca','com','Permet menjar a &p monjos.','Menjat'),
('ca','mec','Millora la &c dels teus monjos.','Millorat'),
('ca','prc','Preparar el menjar','Preparat'),
('ca','rea','Permet &a a &p monjos.','Permes'),
('ca','ten','Hi pots posar un &r per millorar l\'Ofici de la Misa.',''),
('en','alm','It stores &c &u of &r.','Stored'),
('en','com','It allows to eat to &p monks.','Allowed'),
('en','cos','It allows to harvest to &p monks.',''),
('en','mec','It improves &m of your monks','Improved'),
('en','prc','To prepare the food.','Prepared'),
('en','rea','Allows &a to &p monks.','Allowed'),
('en','sem','To seed Vegetables, Vegetables, Fruit, etc. to &p monks.',''),
('en','ten','In it you can locate &r to improve the Office of the Mass.',''),
('es','alm','Almacena &c &u de &r','Almacenado'),
('es','com','Permite comer a &p monjes.','Comido'),
('es','cos','Cosechar a &p monjes.','Cosechado'),
('es','mec','Mejora la &m de tus monjes','Mejorado'),
('es','prc','Preparar la comida.','Preparado'),
('es','rea','Permite &a a &p monjes','Permitido'),
('es','sem','Sembrar Verduras, Legumbres, Fruta, etc. a &p monjes.','Sembrado'),
('es','ten','En �l puedes situar un &r para mejorar el Oficio del la Misa.','');
/*!40000 ALTER TABLE `_UTILIDADT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `_UTILIDAD_TIPO_EDIFICIO`
--

DROP TABLE IF EXISTS `_UTILIDAD_TIPO_EDIFICIO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `_UTILIDAD_TIPO_EDIFICIO` (
  `TIPOEDIFICIOID` char(3) NOT NULL DEFAULT '',
  `UTILIDADID` char(3) NOT NULL DEFAULT '',
  `ORDEN` smallint(6) NOT NULL DEFAULT 0,
  `CARACTERISTICAID` char(3) DEFAULT NULL,
  `RECURSOID` char(3) DEFAULT NULL,
  `ALMACENAJE` double DEFAULT NULL,
  `ACTIVIDADID` char(3) DEFAULT NULL,
  `PERSONAS` int(11) DEFAULT NULL,
  `UTILIDAD_ORIGEN` char(3) NOT NULL DEFAULT '',
  PRIMARY KEY (`TIPOEDIFICIOID`,`UTILIDADID`,`ORDEN`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_UTILIDAD_TIPO_EDIFICIO`
--

LOCK TABLES `_UTILIDAD_TIPO_EDIFICIO` WRITE;
/*!40000 ALTER TABLE `_UTILIDAD_TIPO_EDIFICIO` DISABLE KEYS */;
INSERT INTO `_UTILIDAD_TIPO_EDIFICIO` VALUES
('alm','alm',0,NULL,'her',200,NULL,NULL,''),
('alm','alm',1,NULL,'rop',200,NULL,NULL,''),
('alm','alm',2,NULL,'nat',200,NULL,NULL,''),
('auc','alm',0,NULL,'din',10000000,NULL,NULL,''),
('auc','alm',1,NULL,'nat',100000,NULL,NULL,''),
('auc','mec',0,'sap',NULL,NULL,NULL,NULL,''),
('bib','alm',0,NULL,'lib',5000,NULL,NULL,''),
('bib','rea',0,NULL,NULL,NULL,'lee',5,''),
('bib','rea',1,NULL,NULL,NULL,'esc',2,''),
('cla','rea',0,NULL,NULL,NULL,'med',10,''),
('coc','alm',0,NULL,'com',10,NULL,NULL,''),
('coc','alm',1,NULL,'cmt',500,NULL,NULL,''),
('coc','rea',0,NULL,'com',NULL,'coc',2,''),
('dor','alm',0,NULL,'rop',10,NULL,NULL,''),
('dor','alm',1,NULL,'her',10,NULL,NULL,''),
('dor','rea',0,NULL,NULL,NULL,'dor',10,''),
('enf','mec',0,'sal',NULL,NULL,NULL,NULL,''),
('gra','alm',0,NULL,'car',1000,NULL,NULL,''),
('gra','alm',1,NULL,'ang',1000,NULL,NULL,''),
('gra','rea',0,NULL,NULL,NULL,'gan',5,''),
('grn','alm',0,NULL,'cer',500,NULL,NULL,''),
('grn','alm',1,NULL,'sem',50,NULL,NULL,''),
('hue','alm',0,NULL,'sem',10,NULL,NULL,''),
('hue','alm',1,NULL,'cul',500,NULL,NULL,''),
('hue','est',0,NULL,NULL,100,'bru',NULL,'cos'),
('hue','est',1,NULL,NULL,100,'ara',NULL,'bru'),
('hue','est',2,NULL,'sem',100,'sem',2,'ara'),
('hue','est',3,NULL,NULL,100,'cos',NULL,'sem'),
('hue','rea',0,NULL,'sem',NULL,'cul',5,''),
('hue','tra',0,NULL,NULL,NULL,'sem',10,''),
('igl','rea',0,NULL,NULL,NULL,'mis',1,''),
('igl','ten',0,NULL,'r01',2,NULL,NULL,''),
('igl','ten',1,NULL,'r02',1,NULL,NULL,''),
('lav','mec',0,'sal',NULL,10,NULL,NULL,''),
('mol','alm',0,NULL,'hrn',500,NULL,NULL,''),
('mol','rea',0,NULL,'hrn',NULL,'mol',2,''),
('nov','rea',0,NULL,NULL,NULL,'fno',1,''),
('ora','rea',0,NULL,NULL,NULL,'rez',5,''),
('ref','rea',0,NULL,NULL,NULL,'com',5,''),
('sot','alm',0,NULL,'vin',1000,NULL,NULL,''),
('sot','alm',1,NULL,'que',200,NULL,NULL,''),
('sot','rea',0,NULL,'que',NULL,'fqu',1,''),
('tar','alm',0,NULL,'oar',1000,NULL,NULL,''),
('tar','rea',0,NULL,'oar',NULL,'art',2,''),
('tco','alm',0,NULL,'rop',25,NULL,NULL,''),
('tco','alm',1,NULL,'pls',25,NULL,NULL,''),
('tco','rea',0,NULL,'rop',NULL,'con',2,''),
('tra','esc',0,NULL,NULL,NULL,'esc',10,'');
/*!40000 ALTER TABLE `_UTILIDAD_TIPO_EDIFICIO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'religious_db'
--

--
-- Dumping routines for database 'religious_db'
--
