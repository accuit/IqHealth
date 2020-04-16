-- MySQL dump 10.13  Distrib 5.7.29, for Win64 (x86_64)
--
-- Host: 182.50.133.89    Database: HealthIQ_Dev
-- ------------------------------------------------------
-- Server version	5.5.51-38.1-log

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

--
-- Table structure for table `BookingMaster`
--

DROP TABLE IF EXISTS `BookingMaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BookingMaster` (
  `ID` int(9) NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(45) NOT NULL,
  `LastName` varchar(45) NOT NULL,
  `Age` int(3) DEFAULT '0',
  `Mobile` varchar(15) NOT NULL DEFAULT '+91',
  `Email` varchar(150) DEFAULT NULL,
  `Sex` int(1) DEFAULT NULL,
  `BookingDate` datetime DEFAULT NULL,
  `CollectionType` int(1) DEFAULT NULL,
  `Address` varchar(250) DEFAULT NULL,
  `City` varchar(50) DEFAULT NULL,
  `Landmark` varchar(250) DEFAULT NULL,
  `PinCode` varchar(10) DEFAULT NULL,
  `CreatedDate` datetime NOT NULL,
  `IsDeleted` int(1) NOT NULL,
  `Status` int(1) NOT NULL,
  `PackageID` int(5) DEFAULT NULL,
  `TestID` int(9) DEFAULT NULL,
  `CompanyID` int(2) NOT NULL DEFAULT '99',
  `BookingTime` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_Booking_Package_ID_idx` (`PackageID`),
  KEY `FK_Booking_Test_ID_idx` (`TestID`),
  KEY `FK_Booking_Company_idx` (`CompanyID`),
  CONSTRAINT `FK_Booking_Company` FOREIGN KEY (`CompanyID`) REFERENCES `CompanyMaster` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_Booking_Package_ID` FOREIGN KEY (`PackageID`) REFERENCES `PackageMaster` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_Booking_Test_ID` FOREIGN KEY (`TestID`) REFERENCES `TestMaster` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BookingMaster`
--

LOCK TABLES `BookingMaster` WRITE;
/*!40000 ALTER TABLE `BookingMaster` DISABLE KEYS */;
INSERT INTO `BookingMaster` VALUES (35,'Neeraj','Singh',12,'09599660409','neer19ultimate@gmail.com',2,'2019-09-28 00:00:00',1,'D- 302 Apex Golf Avenue, Sector 1, Greater Noida West','Darjeeling','h','201301','2019-09-26 20:36:24',0,0,6,NULL,1,'6 pm'),(36,'neera','j',45,'09599660409','neer.s@outlook.com',2,'2020-01-10 00:00:00',2,'D- 302 Apex Golf Avenue, Sector 1, Greater Noida West','Haldia','rdtcfghv','201301','2020-01-29 19:04:55',0,0,11,NULL,1,'4'),(37,'Neeraj','Singh',54,'09599660409','neer19ultimate@gmail.com',1,'2020-02-21 00:00:00',2,'G 202 Skytech Mattrot','Noida','rd6ftuv','201301','2020-02-05 17:38:20',0,0,5,NULL,2,'10:00 AM - 11:00 AM'),(38,'Neerag','Singh',54,'09599660409','neer19ultimate@gmail.com',1,'2020-02-14 00:00:00',1,'G 202 Skytech Mattrot','Noida','76rfuyvjh','201301','2020-02-05 17:41:02',0,0,2,NULL,2,'12:00 AM - 01:00 PM'),(39,'Neeraj','Singh',23,'09599660409','neer.s@outlook.com',1,'2020-02-21 00:00:00',1,'D- 302 Apex Golf Avenue, Sector 1, Greater Noida West','Noida','tcyghv','201301','2020-02-05 17:45:00',0,0,4,NULL,2,'11:00 AM - 12:00 PM'),(40,'Neeraj','Singh',68,'09599660409','neer19ultimate@gmail.com',2,'2020-02-14 00:00:00',2,'G 202 Skytech Mattrot','Noida','tyfgb','201301','2020-02-05 17:50:02',0,0,4,NULL,2,'11:00 AM - 12:00 PM'),(41,'stgdfs dfg dfg dfg ','dfg dfg dfgdf gd',43,'09599660409','neer.s@outlook.com',2,'2020-02-22 00:00:00',1,'D- 302 Apex Golf Avenue, Sector 1, Greater Noida West','Noida','34534ewfsd','201301','2020-02-05 17:53:42',0,0,4,NULL,2,'11:00 AM - 12:00 PM'),(42,'Neeraj','Singh',24,'08527818810','singh.neer@ymail.com',1,'2020-03-19 00:00:00',1,'G 202 Skytech Mattrot','Durgapur','werwer','201301','2020-03-20 06:49:32',0,0,8,NULL,1,'12'),(43,'Neera','Singh',21,'08527818810','singh.neer@ymail.com',1,'2020-03-31 00:00:00',1,'G 202 Skytech Mattrot','Howrah','wdsf','201301','2020-03-29 10:30:35',0,0,7,NULL,1,'');
/*!40000 ALTER TABLE `BookingMaster` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CommonSetup`
--

DROP TABLE IF EXISTS `CommonSetup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CommonSetup` (
  `ID` int(9) NOT NULL AUTO_INCREMENT,
  `MainType` varchar(50) NOT NULL,
  `SubType` varchar(50) DEFAULT NULL,
  `DisplayText` varchar(150) DEFAULT NULL,
  `DisplayValue` int(9) DEFAULT NULL,
  `ParentID` int(9) DEFAULT NULL,
  `isDeleted` int(1) DEFAULT NULL,
  `CompanyID` int(2) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CommonSetup`
--

LOCK TABLES `CommonSetup` WRITE;
/*!40000 ALTER TABLE `CommonSetup` DISABLE KEYS */;
INSERT INTO `CommonSetup` VALUES (1,'User','Type','Customer',1,NULL,0,2),(2,'User','Type','Employee',2,NULL,0,2),(3,'User','Type','Student',3,NULL,0,2);
/*!40000 ALTER TABLE `CommonSetup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CompanyMaster`
--

DROP TABLE IF EXISTS `CompanyMaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CompanyMaster` (
  `ID` int(2) NOT NULL AUTO_INCREMENT,
  `Name` varchar(145) NOT NULL,
  `LogoUrl` varchar(1000) DEFAULT NULL,
  `SecondryEmail` varchar(150) NOT NULL,
  `PrimaryEmail` varchar(150) NOT NULL,
  `Address` varchar(500) DEFAULT NULL,
  `BannerUrl` varchar(1000) DEFAULT NULL,
  `About` varchar(1000) DEFAULT NULL,
  `MapUrl` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CompanyMaster`
--

LOCK TABLES `CompanyMaster` WRITE;
/*!40000 ALTER TABLE `CompanyMaster` DISABLE KEYS */;
INSERT INTO `CompanyMaster` VALUES (1,'Leela Health Care','https://leelahealthcare.com/assets/img/leelahealthcare/LeelaHealthcare-logo.png','','info@leelahealthcare.com',NULL,NULL,NULL,NULL),(2,'Health IQ','https://health-iq.in/assets/images/logo.jpg','','info@health-iq.in',NULL,NULL,NULL,NULL),(99,'Anonymous',NULL,'','',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `CompanyMaster` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ContactUsEnquiry`
--

DROP TABLE IF EXISTS `ContactUsEnquiry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ContactUsEnquiry` (
  `ID` int(9) NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) NOT NULL,
  `Mobile` varchar(15) NOT NULL,
  `Email` varchar(150) NOT NULL,
  `Message` varchar(1000) DEFAULT NULL,
  `CreatedDate` datetime NOT NULL,
  `IsDeleted` int(1) NOT NULL,
  `Status` int(1) NOT NULL,
  `CompanyID` int(2) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ContactUsEnquiry`
--

LOCK TABLES `ContactUsEnquiry` WRITE;
/*!40000 ALTER TABLE `ContactUsEnquiry` DISABLE KEYS */;
INSERT INTO `ContactUsEnquiry` VALUES (69,'Neeraj Singh','8527818810','singh.neer@ymail.com','ddfd','2020-04-04 15:40:30',0,0,2),(70,'Neeraj Singh','0852781881','singh.neer@ymail.com','gxfcbn ','2020-04-04 15:42:29',0,0,2);
/*!40000 ALTER TABLE `ContactUsEnquiry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CorporateTieUpEnquiry`
--

DROP TABLE IF EXISTS `CorporateTieUpEnquiry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CorporateTieUpEnquiry` (
  `ID` int(9) NOT NULL AUTO_INCREMENT,
  `Name` varchar(45) NOT NULL,
  `Mobile` varchar(15) NOT NULL,
  `Email` varchar(150) NOT NULL,
  `CompanyName` varchar(100) NOT NULL,
  `Designation` int(2) DEFAULT NULL,
  `Address` varchar(500) DEFAULT NULL,
  `City` int(3) DEFAULT NULL,
  `State` int(2) DEFAULT NULL,
  `Message` varchar(1000) NOT NULL,
  `CreatedDate` datetime NOT NULL,
  `IsDeleted` int(1) NOT NULL,
  `Status` int(1) NOT NULL,
  `CompanyID` int(2) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CorporateTieUpEnquiry`
--

LOCK TABLES `CorporateTieUpEnquiry` WRITE;
/*!40000 ALTER TABLE `CorporateTieUpEnquiry` DISABLE KEYS */;
INSERT INTO `CorporateTieUpEnquiry` VALUES (67,'Neeraj Singh','08527818810','singh.neer@ymail.com','CAP Global',3,NULL,0,0,'nmnb mfb mnsb msdnb msnbg sdbfsdmn bsdfs','2020-03-28 20:20:00',0,0,2),(68,'Neeraj Singh','09599660409','neer19ultimate@gmail.com','CAP Global',4,NULL,0,0,'sdwd','2020-04-11 00:35:07',0,0,2),(69,'Neeraj Singh','08527818810','singh.neer@ymail.com','CAP Global',1,NULL,0,0,'chgvjhbknlm;lnbh gygjh klj','2020-04-11 01:02:56',0,0,2),(70,'Neeraj Singh','09599660409','neer.s@outlook.com','CAP Global',1,NULL,0,0,'h vvh jbjbjhb ','2020-04-11 01:12:00',0,0,2),(71,'Neeraj Singh','08527818810','singh.neer@ymail.com','MERCER',2,NULL,0,0,'hghg j jb','2020-04-10 13:45:16',0,0,2),(72,'Neeraj Singh','08527818810','neer.s@outlook.com','MERCER',5,NULL,0,0,'vdfg dfgdfg fd g','2020-04-10 13:57:43',0,0,2),(73,'Neeraj Singh','08527818810','singh.neer@ymail.com','CAP Global',2,NULL,0,0,'retxcfhgvj ,m','2020-04-10 14:37:28',0,0,2);
/*!40000 ALTER TABLE `CorporateTieUpEnquiry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CourseCurriculum`
--

DROP TABLE IF EXISTS `CourseCurriculum`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CourseCurriculum` (
  `ID` int(9) NOT NULL AUTO_INCREMENT,
  `Name` varchar(250) NOT NULL,
  `CourseMasterID` int(9) NOT NULL,
  `SubCourcesID` int(9) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_Curriculam_CourseMaster_ID_idx` (`CourseMasterID`),
  CONSTRAINT `FK_Curriculam_CourseMaster_ID` FOREIGN KEY (`CourseMasterID`) REFERENCES `CourseMaster` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CourseCurriculum`
--

LOCK TABLES `CourseCurriculum` WRITE;
/*!40000 ALTER TABLE `CourseCurriculum` DISABLE KEYS */;
INSERT INTO `CourseCurriculum` VALUES (1,'Introduction to patient care, lab technology & equipment.',1,NULL),(2,'Role of Medical Lab Technician',1,NULL),(3,'Basic pathology & diagnostic techniques',1,NULL),(4,'Introduction to patient care, physiotherapy',2,NULL),(5,'Role of Physiotherapist',2,NULL),(6,'Basic anatomy & physiology',3,NULL),(7,'Understanding body mechanics',4,NULL),(8,'Introduction to nutrition',5,NULL),(9,'Basic & clinical biochemistry',1,NULL),(10,'Basic & systemic medical microbiology',1,NULL),(11,'Basic hematology, immunology, parasitology, histology, &',1,NULL),(12,'Blood banking, phlebotomy and handling special samples',1,NULL),(13,'Fine needle aspiration technique',1,NULL),(14,'Storage & transportation of samples',1,NULL),(15,'Lab information management system',1,NULL),(16,'Biomedical waste management',1,NULL),(17,'Infection control',1,NULL),(18,'Maintenance & cleaning of lab equipment',1,NULL),(19,'Personnel Hygiene and Safety & First Aid',1,NULL),(20,'Patient\'s Rights & Responsibilities',1,NULL),(21,'Professional Behavior in Healthcare Setting',1,NULL),(22,'Human Anatomy',2,NULL),(23,'Human Physiology',2,NULL),(24,'Pathology',2,NULL),(25,'Pharmacology',2,NULL),(26,'Psychology',2,NULL),(27,'Medical and Surgical Conditions',2,NULL),(28,'Biomechanics',2,NULL),(29,'Kineseology',2,NULL),(30,'Disability prevention',2,NULL),(31,'Rehabilitation',2,NULL),(32,'Personnel Hygiene and Safety & First Aid',2,NULL),(33,'Patient\'s Rights & Responsibilities',2,NULL),(34,'Professional Behaviour in Healthcare Setting',2,NULL),(35,'General health & hygiene',3,NULL),(36,'Understanding hospitals & the healthcare system',3,NULL),(37,'Special skin care for radiotherapy, pressure sores',3,NULL),(38,'Caring for the visually impaired',3,NULL),(39,'Role of a patient care assistant',3,NULL),(40,'Daily care for a patient',3,NULL),(41,'Administering drugs as per prescriptions',3,NULL),(42,'Basic nursing skills',3,NULL),(43,'Disposal of medical waste',3,NULL),(44,'Understanding body mechanics',3,NULL),(45,'Patient handling, lifting, and moving patients',3,NULL),(46,'Fall prevention care and restraints',3,NULL),(47,'Emergency first aid and CPR',3,NULL),(48,'Macronutrients',5,NULL),(49,'Micronutrients',5,NULL),(50,'Nutritional Assessment',5,NULL);
/*!40000 ALTER TABLE `CourseCurriculum` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CourseEligibility`
--

DROP TABLE IF EXISTS `CourseEligibility`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CourseEligibility` (
  `ID` int(9) NOT NULL AUTO_INCREMENT,
  `Qualification` varchar(500) NOT NULL DEFAULT '10th',
  `MinAge` int(2) NOT NULL DEFAULT '15',
  `MaxAge` int(2) NOT NULL DEFAULT '99',
  `Duration` int(2) DEFAULT '0',
  `Certification` varchar(500) DEFAULT NULL,
  `InternshipDuration` int(2) DEFAULT NULL,
  `CourseMasterID` int(9) DEFAULT NULL,
  `IsDeleted` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `FK_Eligibility_Course_ID_idx` (`CourseMasterID`),
  CONSTRAINT `FK_Eligibility_Course_ID` FOREIGN KEY (`CourseMasterID`) REFERENCES `CourseMaster` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CourseEligibility`
--

LOCK TABLES `CourseEligibility` WRITE;
/*!40000 ALTER TABLE `CourseEligibility` DISABLE KEYS */;
/*!40000 ALTER TABLE `CourseEligibility` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CourseMaster`
--

DROP TABLE IF EXISTS `CourseMaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CourseMaster` (
  `ID` int(9) NOT NULL AUTO_INCREMENT,
  `Name` varchar(150) NOT NULL,
  `About` varchar(1500) NOT NULL,
  `IsDeleted` int(1) NOT NULL DEFAULT '0',
  `CompanyID` int(3) NOT NULL DEFAULT '0',
  `Qualification` varchar(500) NOT NULL DEFAULT '10th',
  `MinAge` int(2) NOT NULL DEFAULT '15',
  `MaxAge` int(2) NOT NULL DEFAULT '99',
  `Duration` int(2) DEFAULT '0',
  `Certification` varchar(500) DEFAULT NULL,
  `InternshipDuration` int(2) DEFAULT NULL,
  `ImageUrl` varchar(1000) NOT NULL DEFAULT 'assets/images/academy/courses/courses.jpg',
  PRIMARY KEY (`ID`),
  KEY `FK_Course_Company_ID_idx` (`CompanyID`),
  CONSTRAINT `FK_Course_Company_ID` FOREIGN KEY (`CompanyID`) REFERENCES `CompanyMaster` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CourseMaster`
--

LOCK TABLES `CourseMaster` WRITE;
/*!40000 ALTER TABLE `CourseMaster` DISABLE KEYS */;
INSERT INTO `CourseMaster` VALUES (1,'Medical Lab Technician','Medical Lab Technicians are important members of any clinical laboratory team. Medical Lab Technicians analyze fluid, tissues and blood samples to perform a variety of diagnoses. Additionally, students from this course are trained to clean and maintain lab equipment, manage biomedical waste and adhere to quality control standards as per the NABL regulations. They generally work under the supervision of a pathologist.',0,2,'10th / Madhyamik passed. 10+2 pass is preferable',17,99,2,'Bharat Sevak Samaj (promoted by Planning Commission, GOI)',6,'assets/images/academy/courses/1.jpg'),(2,'Physiotherapy','Physiotherapists are trained professionals working in health care. They are trained to restore mobility, alleviate pain and suffering and work to prevent permanent disability in patients. The job of a physical therapist is preventive, restorative and rehabilitative.',0,2,'10th / Madhyamik passed. 10+2 pass is preferable.',17,99,2,'Bharat Sevak Samaj (promoted by Planning Commission, GOI)',NULL,'assets/images/academy/courses/2.jpg'),(3,'General Duty Assistant (Nursing)','This course trains students to work as nursing aides in hospitals and home care scenarios and they can also provide basic nursing care. They are taught to support nurses and also directly handle ill patients who are unable to look after themselves in both hospital and home care settings.',0,2,'10th / Madhyamik passed. 10+2 pass is preferable.',17,30,2,'Bharat Sevak Samaj (promoted by Planning Commission, GOI)',6,'assets/images/academy/courses/3.jpg'),(4,'E.C.G. Technician','This course trains students in Emergency situation to detect whether the illness is due to Cardiac problem or else, Use of E.C.G. Machine of different makes & Models- Manual, Semi-Auto & Fully Auto, To carry out E.C.G. on pacemaker patient, Determination of heart beats, Axis, Cardiac Arrhythmias, Ventricular status, Interpretation of normal and abnormal E.C.G, Indication of E.C.G. recording, Requirement of Halter Study & Doppler study, TMT etc.',0,2,'10th / Matric / Madhyamik passed',18,99,1,'Bharat Sevak Samaj (promoted by Planning Commission, GOI)',NULL,'assets/images/academy/courses/4.jpg'),(5,'Diet & Nutrition','The focus of the programme is to enable you to make the best possible choice for meeting the nutritional needs of your family. The student will learn various concepts in nutrition, the role of nutrients such as carbohydrates, lipids, proteins, vitamins, and minerals, including their sources, requirements, functions, and roles in health. It also includes guidelines for nutrition, dietary reference intakes, dietary guidelines for Indians, and basics of nutritional assessment methods.',0,2,'10th / Madhyamik passed. 10+2 pass is preferable.',18,99,1,'Bharat Sevak Samaj (promoted by Planning Commission, GOI)',NULL,'assets/images/academy/courses/5.jpg');
/*!40000 ALTER TABLE `CourseMaster` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DoctorAppointment`
--

DROP TABLE IF EXISTS `DoctorAppointment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DoctorAppointment` (
  `ID` int(9) NOT NULL AUTO_INCREMENT,
  `Name` varchar(45) NOT NULL,
  `Age` int(3) NOT NULL DEFAULT '0',
  `Mobile` varchar(15) NOT NULL DEFAULT '+91',
  `Email` varchar(150) DEFAULT NULL,
  `Sex` int(1) NOT NULL,
  `BookingDate` datetime DEFAULT NULL,
  `BookingTime` varchar(50) DEFAULT NULL,
  `DoctorID` int(9) DEFAULT NULL,
  `CreatedDate` datetime NOT NULL,
  `IsDeleted` int(1) NOT NULL,
  `Status` int(1) NOT NULL,
  `HospitalID` int(9) DEFAULT NULL,
  `CompanyID` int(2) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_Appointment_Doctor` (`DoctorID`),
  KEY `FK_Appointment_Hospital_idx` (`HospitalID`),
  KEY `FK_DoctorAppointment_Company_idx` (`CompanyID`),
  CONSTRAINT `FK_Appointment_Doctor` FOREIGN KEY (`DoctorID`) REFERENCES `DoctorMaster` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_DoctorAppointment_Company_ID` FOREIGN KEY (`CompanyID`) REFERENCES `CompanyMaster` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=80 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DoctorAppointment`
--

LOCK TABLES `DoctorAppointment` WRITE;
/*!40000 ALTER TABLE `DoctorAppointment` DISABLE KEYS */;
INSERT INTO `DoctorAppointment` VALUES (35,'Neeraj Singh',21,'09599660409','neer19ultimate@gmail.com',1,'2019-09-28 00:00:00','2 pm',9,'2019-09-26 20:53:27',0,1,NULL,1),(36,'Neeraj Singh',43,'09599660409','neer19ultimate@gmail.com',1,'2019-09-28 00:00:00','12:00 AM - 01:00 PM',4,'2019-09-27 23:30:23',0,1,NULL,NULL),(37,'Neeraj Singh',12,'08527818810','singh.neer@ymail.com',1,'2020-01-09 00:00:00','10:00 AM - 11:00 AM',6,'2020-01-17 21:35:50',0,1,NULL,2),(38,'Neeraj Singh',34,'08527818810','singh.neer@ymail.com',1,'2020-01-24 00:00:00','10:00 AM - 11:00 AM',5,'2020-01-17 22:11:20',0,1,NULL,2),(39,'Neeraj Singh',32,'iwuegriuy29384y','neer19ultimate@gmail.com',1,'2020-01-30 00:00:00','11:00 AM - 12:00 PM',4,'2020-01-20 23:01:34',0,1,NULL,2),(40,'Neeraj Singh',32,'9834y892y35','neer19@ugma.com',1,'2011-09-29 00:00:00','12:00 AM - 01:00 PM',12,'2020-01-20 23:03:24',0,1,NULL,NULL),(41,'Neeraj Singh',43,'3425435345345','neer19@gmail.com',1,'2020-01-17 00:00:00','10:00 AM - 11:00 AM',12,'2020-01-20 23:12:06',0,1,NULL,2),(42,'neeraj',46,'9823923863','neer19ultimate@gmailcion',1,'2020-01-24 00:00:00','12:00 AM - 01:00 PM',6,'2020-01-20 23:27:58',0,1,NULL,NULL),(43,'Neeraj',54,'8392983823','kbsdfksbdfk@kjaf.com',1,'2020-01-24 00:00:00','10:00 AM - 11:00 AM',6,'2020-01-20 23:29:06',0,1,NULL,NULL),(44,'Neeraj Singh',54,'8283482323','neer@hmail.com',1,'2020-02-07 00:00:00','11:00 AM - 12:00 PM',12,'2020-01-20 23:37:53',0,1,NULL,2),(45,'Neeraj Singh',43,'9393727837','neer@gmail.com',1,'2020-01-22 00:00:00','01:00 PM - 02:00 PM',4,'2020-01-20 23:40:08',0,1,NULL,NULL),(46,'Neeraj Singh',43,'84862384686','neer@gmail.om',1,'2020-01-16 00:00:00','10:00 AM - 11:00 AM',5,'2020-01-20 23:54:38',0,1,NULL,2),(47,'Neeraj Singh',23,'09599660409','neer.s@outlook.com',1,'2020-01-02 00:00:00','12',12,'2020-01-29 14:39:16',0,1,NULL,1),(48,'Neeraj Singh',23,'09599660409','neer.s@outlook.com',1,'2020-01-02 00:00:00','12',12,'2020-01-29 14:51:35',0,1,NULL,1),(49,'Neeraj Singh',99,'08527818810','singh.neer@ymail.com',1,'2020-02-05 00:00:00','11:00 AM - 12:00 PM',5,'2020-02-03 19:22:30',0,1,NULL,NULL),(50,'Neeraj Singh',65,'08527818810','singh.neer@ymail.com',1,'2020-02-13 00:00:00','10:00 AM - 11:00 AM',12,'2020-02-03 19:25:47',0,1,NULL,NULL),(51,'Neeraj Singh',23,'08527818810','singh.neer@ymail.com',2,'2020-02-11 00:00:00','01:00 PM - 02:00 PM',12,'2020-02-05 12:11:36',0,1,NULL,2),(52,'Neeraj Singh',56,'08527818810','singh.neer@ymail.com',1,'2020-02-12 00:00:00','10:00 AM - 11:00 AM',5,'2020-02-05 12:15:44',0,1,NULL,2),(53,'Neeraj Singh',45,'08527818810','singh.neer@ymail.com',1,'2020-02-21 00:00:00','12:00 AM - 01:00 PM',12,'2020-02-05 14:49:39',0,1,NULL,2),(54,'Neeraj Singh',54,'08527818810','singh.neer@ymail.com',1,'2020-02-05 00:00:00','09:00 AM - 10:00 AM',7,'2020-02-05 17:21:52',0,1,NULL,2),(55,'Neeraj Singh',12,'08527818810','singh.neer@ymail.com',2,'2020-02-13 00:00:00','12:00 AM - 01:00 PM',10,'2020-02-05 17:24:07',0,1,NULL,2),(56,'Neeraj Singh',65,'08527818810','singh.neer@ymail.com',1,'2020-02-20 00:00:00','01:00 PM - 02:00 PM',10,'2020-02-05 17:31:03',0,1,NULL,2),(57,'Neeraj Singh',21,'09599660409','neer19ultimate@gmail.com',1,'2020-02-10 00:00:00','12:00 AM - 01:00 PM',12,'2020-02-05 18:56:17',0,1,NULL,2),(58,'Neeraj Singh',23,'08527818810','singh.neer@ymail.com',1,'2020-02-11 00:00:00','01:00 PM - 02:00 PM',10,'2020-02-05 18:57:09',0,1,NULL,2),(59,'Neeraj Singh',23,'08527818810','singh.neer@ymail.com',1,'2020-02-26 00:00:00','02:00 PM - 03:00 PM',12,'2020-02-05 18:58:34',0,1,NULL,2),(60,'Neeraj Singh',65,'09599660409','neer19ultimate@gmail.com',2,'2020-01-29 00:00:00','01:00 PM - 02:00 PM',7,'2020-02-05 19:00:01',0,1,NULL,2),(61,'Neeraj Singh',65,'09599660409','neer19ultimate@gmail.com',2,'2020-01-29 00:00:00','01:00 PM - 02:00 PM',7,'2020-02-05 19:00:25',0,1,NULL,2),(62,'Neeraj Singh',65,'09599660409','neer19ultimate@gmail.com',2,'2020-01-29 00:00:00','01:00 PM - 02:00 PM',7,'2020-02-05 19:00:42',0,1,NULL,2),(63,'Neeraj Singh',54,'08527818810','singh.neer@ymail.com',1,'2020-02-19 00:00:00','10:00 AM - 11:00 AM',5,'2020-02-05 19:02:47',0,1,NULL,2),(64,'Neeraj Singh',65,'08527818810','singh.neer@ymail.com',1,'2020-02-20 00:00:00','11:00 AM - 12:00 PM',12,'2020-02-05 19:10:32',0,1,NULL,2),(65,'Neeraj Singh',76,'08527818810','singh.neer@ymail.com',2,'2020-02-20 00:00:00','01:00 PM - 02:00 PM',12,'2020-02-05 19:12:02',0,1,NULL,2),(66,'dtygu',12,'07696085020','parmanandsingh469@gmail.com',1,'2019-12-12 00:00:00','drg',10,'2020-03-15 04:11:36',0,1,NULL,1),(67,'Neeraj Singh',0,'09599660409','neer.s@outlook.com',0,NULL,NULL,NULL,'2020-03-28 08:44:40',0,1,NULL,2),(68,'Neeraj Singh',0,'08527818810','singh.neer@ymail.com',0,NULL,NULL,NULL,'2020-03-28 08:48:46',0,1,NULL,2),(69,'Neeraj Singh',0,'09599660409','neer19ultimate@gmail.com',0,NULL,NULL,NULL,'2020-03-28 08:59:31',0,1,NULL,2),(70,'Neeraj Singh',0,'08527818810','singh.neer@ymail.com',0,NULL,NULL,NULL,'2020-03-28 09:00:03',0,1,NULL,NULL),(71,'Neeraj Singh',0,'09599660409','neer19ultimate@gmail.com',0,NULL,NULL,NULL,'2020-03-28 09:03:41',0,1,NULL,2),(72,'Neeraj Singh',0,'09599660409','neer.s@outlook.com',0,NULL,NULL,NULL,'2020-03-28 09:03:59',0,1,NULL,NULL),(73,'Neeraj Singh',0,'08527818810','singh.neer@ymail.com',0,NULL,NULL,NULL,'2020-03-28 09:04:14',0,1,NULL,NULL),(74,'Neeraj Singh',21,'08527818810','singh.neer@ymail.com',1,'2020-03-30 00:00:00','123',4,'2020-03-29 10:34:51',0,1,NULL,1),(75,'Neeraj Singh',21,'08527818810','neer.s@outlook.com',1,'2020-03-30 00:00:00','123',4,'2020-03-29 10:35:09',0,1,NULL,1),(76,'Neeraj Singh',12,'08527818810','singh.neer@ymail.com',2,'2020-03-27 00:00:00','12',10,'2020-03-30 23:01:21',0,1,NULL,1),(77,'Neeraj Singh',44,'08527818810','singh.neer@ymail.com',1,'2020-03-21 00:00:00','tfffg',12,'2020-03-30 23:06:35',0,1,NULL,1),(78,'Neeraj Singh',21,'09599660409','neer.s@outlook.com',1,'2020-03-30 00:00:00','212',8,'2020-03-30 10:46:36',0,1,NULL,1),(79,'Neeraj Singh',21,'09599660409','neer.s@outlook.com',1,'2020-03-30 00:00:00','212',8,'2020-03-30 10:49:57',0,1,NULL,1);
/*!40000 ALTER TABLE `DoctorAppointment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DoctorMaster`
--

DROP TABLE IF EXISTS `DoctorMaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DoctorMaster` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(50) NOT NULL,
  `LastName` varchar(50) NOT NULL,
  `DateOfBirth` datetime DEFAULT NULL,
  `Experience` int(2) NOT NULL,
  `Specialist` varchar(250) DEFAULT NULL,
  `ImageUrl` varchar(1000) DEFAULT NULL,
  `Hospital` varchar(150) DEFAULT NULL,
  `Designation` varchar(250) DEFAULT NULL,
  `Sequence` int(3) NOT NULL DEFAULT '999',
  `About` varchar(500) DEFAULT NULL,
  `LogoUrl` varchar(1000) DEFAULT NULL,
  `IsDeleted` int(1) NOT NULL DEFAULT '0',
  `CreatedDate` datetime NOT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `Mobile` varchar(15) NOT NULL,
  `Email` varchar(250) DEFAULT NULL,
  `RegistrationNo` varchar(45) DEFAULT NULL,
  `SpecialityID` int(9) NOT NULL DEFAULT '1',
  `HospitalID` int(9) DEFAULT NULL,
  `CompanyID` int(2) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_Doctor_Speciality_ID_idx` (`SpecialityID`),
  KEY `FK_HealthServiceMaster_Company_ID_idx` (`CompanyID`),
  KEY `FK_PackageCategory_Company_ID_idx` (`CompanyID`),
  KEY `FK_PackageMaster_Company_ID_idx` (`CompanyID`),
  CONSTRAINT `FK_DoctorMaster_Company_ID` FOREIGN KEY (`CompanyID`) REFERENCES `CompanyMaster` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_Speciality_Doctor_ID` FOREIGN KEY (`SpecialityID`) REFERENCES `SpecialityMaster` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DoctorMaster`
--

LOCK TABLES `DoctorMaster` WRITE;
/*!40000 ALTER TABLE `DoctorMaster` DISABLE KEYS */;
INSERT INTO `DoctorMaster` VALUES (1,'Trinath','Sarkar','2019-07-28 00:00:00',10,'Cardiology','../../assets/img/Doctors images/Dr.Trinath Sarkar.jpg','Calcutta Medical College Paramount Nursing Home','M.B.B.S. (Cal), M.D. (Cal), CCEBDM (IDF) ',999,'Member: - European Society of Cardiology','lnr-heart-pulse',1,'2019-07-28 00:00:00','2019-08-03 01:40:14','9051672875','trinath_sarkar2004@yahoo.co.in',NULL,4,NULL,1),(2,'Jayanta','Raja',NULL,0,'Cardiology','https://png.pngtree.com/element_origin_min_pic/16/09/13/2157d8062925150.jpg',' BM Birla Heart Research Centre Hindustan Health Point','M.B.B.S, D.CARD (CAL), DC.CM.A.F.I.C.A (USA)',999,'','lnr-Users',1,'2019-07-28 00:00:00',NULL,'033-2475 5390',' drjrajani@yahoo.co.in',NULL,4,NULL,1),(3,'Amit','Gupta',NULL,0,'Diabetese and Endocrinology','../../assets/img/Doctors images/Dr.Amit.jpg','Fellow Observer Critical Care & Chest Medicine(Johns Hopkins Hospital(USA)',' M.D.,MRCP, FCGP, DFM(UK)  Dip. Diabetology (Chennai)',999,'','lnr-rocket',1,'2019-07-28 00:00:00',NULL,'9830075316','',NULL,8,NULL,1),(4,'Poulomi','Saha',NULL,0,'ENT Specialist','../../assets/img/Doctors images/Dr.Poulimi Sarkar.jpg','Faculty of WBMES','MBBS, MS',4,NULL,NULL,0,'2019-08-08 00:00:00',NULL,'8727072555','drpoulomisaha@gmail.com',NULL,7,NULL,1),(5,'Ranajit','Bari',NULL,0,'Diabetes & Endocrinology Consultant','../../assets/img/Doctors images/DR.Ranajit Bari.jpg','Asst. Prof. R.G.Kar Medical College & Hospital','MBBS,MD,DM',2,NULL,NULL,0,'2019-08-08 00:00:00',NULL,'9433360027','dr.ranajit@gmail.com',NULL,8,NULL,1),(6,'Md Rahiul','Islam',NULL,0,'Physician,Child Specialist,Neonatalogist & Paedtric Intensivist','../../assets/img/Doctors images/Dr.R Islam.jpg','                                                                                                  Chittaranjan Seva Sadan          ','MBBS,MD(CAL)',1,NULL,NULL,0,'2019-08-08 00:00:00',NULL,'7003258132','rahcnmc@gmail.com',NULL,9,NULL,1),(7,'Tapas','Das',NULL,0,'Consultant Physiotherapist','../../assets/img/Doctors images/Dr.Tapas Das.jpg','Medicine(Apollo Hospital),Physiotherapist,Acupunture and Yoga And Naturopathy Physician(Govt. of Wb)','Phd,M.Sc, Sports and Allied Science,',6,NULL,NULL,0,'2019-08-08 00:00:00',NULL,'9831020106','tapasdas76@yahoo.co.in',NULL,12,NULL,1),(8,'Soumyendra Nath','Mitra',NULL,0,'General Physician','https://png.pngtree.com/element_origin_min_pic/16/09/13/2157d8062925150.jpg','Ex-Resident Surgeon Marwari Relief Society Hospital,Kolkata	                                Medical Superitendent Apollo Nursing Home,Kolkata','Bsc.(Hons.),M.B.B.S',999,NULL,NULL,0,'2019-08-08 00:00:00',NULL,'9830243153',NULL,NULL,1,NULL,1),(9,'Nilima','Tudu',NULL,0,'Gynaecologist','../../assets/img/Doctors images/Dr.Nilima Tudu.jpg','                                                                                                                 Belle Vue Clinic        ','MBBS(Cal), Dgo(Cal)',999,NULL,NULL,1,'2019-08-08 00:00:00',NULL,'9883118528','nilima.tudu14@gmail.com',NULL,11,NULL,1),(10,'Paushali','Sanyal',NULL,0,'Consultant Gynaecologist & Obstetrician','../../assets/img/Doctors images/Dr.Paushali Sanyal.jpg',' SSKM Hospital                                                                                        Fellow in Minimal Access Surgery   ','MBBS,MS ( G&O), Gold Medalist, DNB(Delhi), MRCOG(London), FMAS',5,NULL,NULL,0,'2019-08-08 00:00:00',NULL,'9830279680','poushali.sanyal@yahoo.co.in',NULL,11,NULL,1),(12,'Sajeev','Shekhar',NULL,0,'Consultant Orthopaedic Surgeon','../../assets/img/Doctors images/Sajeeve.jpg','IPGMER & SSKM Hospital','MBBS,MS',3,NULL,NULL,0,'2019-08-08 00:00:00',NULL,'8197420121','sajshekh@hotmail.com',NULL,10,NULL,1),(13,'Robin','Kumar',NULL,0,'Consultant Chest Physician','https://png.pngtree.com/element_origin_min_pic/16/09/13/2157d8062925150.jpg','MBBS,MRCHCH(I)','MBBS,MRCHCH(I)',999,NULL,NULL,0,'0000-00-00 00:00:00',NULL,'',NULL,NULL,1,NULL,1),(14,'Pallabi','Chatterjee',NULL,0,'Nutrition Dietitian','https://png.pngtree.com/element_origin_min_pic/16/09/13/2157d8062925150.jpg',NULL,'M.Sc. In Applied Nutrition( All India Institute of Hygeine & PublicHealth),',999,NULL,NULL,0,'0000-00-00 00:00:00',NULL,'',NULL,NULL,13,NULL,1),(15,'OPD','',NULL,0,'OPD',NULL,'OPD',NULL,999,NULL,NULL,1,'2019-08-08 00:00:00',NULL,'',NULL,NULL,1,NULL,1),(16,'Sabyasachi','Sarkar',NULL,0,'Consultant Gynaecologist & Obstetrician','../../assets/img/Doctors images/Dr.R Islam.jpg','                                                                                                  Chittaranjan Seva Sadan          ','MBBS,MS(G &O)',6,NULL,NULL,0,'2019-08-08 00:00:00',NULL,'7003258132','rahcnmc@gmail.com',NULL,9,NULL,2),(17,'Suvendu','Maji',NULL,0,'General Surgery & Oncology Consultant','../../assets/img/Doctors images/DR.Ranajit Bari.jpg','Asst. Prof. R.G.Kar Medical College & Hospital','MBBS,MS(GEN SURG),DNB(Onco)',2,NULL,NULL,0,'2019-08-08 00:00:00',NULL,'9433360027','dr.ranajit@gmail.com',NULL,8,NULL,2),(18,'Poulomi','Saha',NULL,0,'ENT Specialist','../../assets/img/Doctors images/Dr.Poulimi Sarkar.jpg','Faculty of WBMES','MBBS, MS',4,NULL,NULL,0,'2019-08-08 00:00:00',NULL,'8727072555','drpoulomisaha@gmail.com',NULL,7,NULL,2),(19,'Ranajit ','Bari',NULL,0,'Diabetes & Endocrinology Consultant','../../assets/img/Doctors images/DR.Ranajit Bari.jpg','Asst. Prof. R.G.Kar Medical College & Hospital','MBBS,MD,DM',2,NULL,NULL,0,'2019-08-08 00:00:00',NULL,'9433360027','dr.ranajit@gmail.com',NULL,8,NULL,2),(20,'Md Rahiul ','Islam',NULL,0,'Physician,Child Specialist,Neonatalogist & Paedtric Intensivist','../../assets/img/Doctors images/Dr.R Islam.jpg','                                                                                                  Chittaranjan Seva Sadan          ','MBBS,MD(CAL)',1,NULL,NULL,0,'2019-08-08 00:00:00',NULL,'7003258132','rahcnmc@gmail.com',NULL,9,NULL,2),(21,'Tapas ','Das',NULL,0,'Consultant Physiotherapist','../../assets/img/Doctors images/Dr.Tapas Das.jpg','Medicine(Apollo Hospital),Physiotherapist,Acupunture and Yoga And Naturopathy Physician(Govt. of Wb)','Phd, M.Sc, Sports and Allied Science,',6,NULL,NULL,0,'2019-08-08 00:00:00',NULL,'9831020106','tapasdas76@yahoo.co.in',NULL,12,NULL,2),(22,'Paushali ','Sanyal',NULL,0,'Consultant Gynaecologist & Obstetrician','../../assets/img/Doctors images/Dr.Paushali Sanyal.jpg',' SSKM Hospital                                                                                        Fellow in Minimal Access Surgery   ','MBBS, MS ( G&O), Gold Medalist, DNB(Delhi), MRCOG (London),  FMAS',5,NULL,NULL,0,'2019-08-08 00:00:00',NULL,'9830279680','poushali.sanyal@yahoo.co.in',NULL,11,NULL,2),(23,'Pallabi','Chatterjee',NULL,0,'Nutrition Dietitian','https://png.pngtree.com/element_origin_min_pic/16/09/13/2157d8062925150.jpg',NULL,'M.Sc. In Applied Nutrition( All India Institute of Hygeine & PublicHealth),',999,NULL,NULL,1,'0000-00-00 00:00:00',NULL,'',NULL,NULL,13,NULL,1);
/*!40000 ALTER TABLE `DoctorMaster` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DoctorSpecialities`
--

DROP TABLE IF EXISTS `DoctorSpecialities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DoctorSpecialities` (
  `ID` int(9) NOT NULL AUTO_INCREMENT,
  `DoctorID` int(9) NOT NULL,
  `SpecialityID` int(9) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_Docotr_Specialities_ID_idx` (`DoctorID`),
  KEY `FK_Specialites+Doctor_ID_idx` (`SpecialityID`),
  CONSTRAINT `FK_Docotr_Specialities_ID` FOREIGN KEY (`DoctorID`) REFERENCES `DoctorMaster` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_Specialites+Doctor_ID` FOREIGN KEY (`SpecialityID`) REFERENCES `SpecialityMaster` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DoctorSpecialities`
--

LOCK TABLES `DoctorSpecialities` WRITE;
/*!40000 ALTER TABLE `DoctorSpecialities` DISABLE KEYS */;
INSERT INTO `DoctorSpecialities` VALUES (1,1,1),(2,1,4),(3,2,1),(4,2,4),(5,3,6),(6,4,7),(7,5,8),(8,6,9);
/*!40000 ALTER TABLE `DoctorSpecialities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `HealthServiceMaster`
--

DROP TABLE IF EXISTS `HealthServiceMaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `HealthServiceMaster` (
  `ID` int(9) NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) NOT NULL,
  `Description` varchar(5000) DEFAULT NULL,
  `ImageUrl` varchar(1000) DEFAULT NULL,
  `PageUrl` varchar(1000) DEFAULT NULL,
  `CreatedDate` datetime NOT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `IsDeleted` int(1) NOT NULL DEFAULT '0',
  `Type` int(2) NOT NULL DEFAULT '0',
  `ServicesIncluded` varchar(1000) DEFAULT NULL,
  `CompanyID` int(2) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `HealthServiceMaster`
--

LOCK TABLES `HealthServiceMaster` WRITE;
/*!40000 ALTER TABLE `HealthServiceMaster` DISABLE KEYS */;
INSERT INTO `HealthServiceMaster` VALUES (1,'Pathology','Health IQ basically aims at improving life’s of others. In terms of pathology, it is a medical specialty that determines the cause and nature of diseases by examining and testing body tissues (from biopsies and pap smears, for example) and bodily fluids (from samples including blood and urine). The results from these pathology tests help Doctors diagnose and treat patients correctly. Basically, an integral part of clinical diagnosis','../../assets/img/services images/pathology .jpg','page3 url (if any)','2016-03-22 09:27:52','2019-08-03 12:17:18',0,0,'Biochemistry,Clinical Pathology,Cytopathology,Haematology, Immunology, Molecular Biology, Molecular Genetics, Serology',NULL),(2,'Cardiology','Cardiology is a medical specialty and a branch of internal medicine concerned with disorders of the heart. It deals with the diagnosis and treatment of such conditions as congenital heart defects, coronary artery disease, electrophysiology, heart failure and heart disease. Subspecialties of the cardiology field include cardiac electrophysiology, echocardiography, interventional cardiology and nuclear cardiology','../../assets/img/services images/cardiology.jpg','page3 url (if any)','2019-07-29 09:27:52','2019-08-03 12:16:24',0,0,'ECG, Holter monitoring, BP monitoring',NULL),(3,'Spirometry','Spirometry (spy-ROM-uh-tree) is a common office test used to assess how well your lungs work by measuring how much air you inhale, how much you exhale and how quickly you exhale.Spirometry is used to diagnose asthma, chronic obstructive pulmonary disease (COPD) and other conditions that affect breathing. Spirometry may also be used periodically to monitor your lung condition and check whether a treatment for a chronic lung condition is helping you breathe better.','../../assets/img/services images/spirometry.jpg','page3 url (if any)','2019-07-29 09:27:52',NULL,0,0,NULL,NULL),(4,'Neurology','Neurology is a branch of medicine dealing with disorders of the nervous system. Neurology deals with the diagnosis and treatment of all categories of conditions and disease involving the central and peripheral nervous systems, including their coverings, blood vessels, and all effector tissue, such as muscle.','../../assets/img/services images/Neurology.jpg',NULL,'2019-08-08 09:27:52',NULL,0,0,'NCV Study,  EMG Study , EEG ,BLINK REFLEX    ,VEP Study ,BAER Study  ,SSEP Study  ',NULL),(5,'Gynae Care','Gynaecare clinic offers a comprehensive range of treatments with complete scientific solutions for infertility and sexual disfunctions. Our dedicated team of doctors personally interact with the patients , answer their queries and decide on the treatment accordingly. We offer the best services in fertility and reproductive medicine. Some of the services offered at our clinic are:','../../assets/img/services images/gynae-clinic.jpg',NULL,'2019-08-08 09:27:52',NULL,0,0,'Pre & post-natal check up,Laproscopic surgeries, Hysterectomy,Measures for Family Planning, Abnormal bleeding problems, Treatment for Hormonal Imbalance, Blood Tests, IVF or In Vitro Fertilization, Infertility work up, IUI or Intrauterine Insemination,\r Safe medical termination of pregnancy (abortion).\r',NULL),(6,'Child Care Clinic','Childcare clinic offers a comprehensive range of treatments with complete solutions for Child. Our experienced team of Paediatricians caters to the Medical Needs of Newborns, Toddlers, Teenagers and Adolescents., answer their queries and decide on the treatment accordingly. We offer the best services in Paedtrics. Some of the services offered at our clinic are','../../assets/img/services images/child-care-clinic.jpg',NULL,'2019-08-08 09:27:52',NULL,0,0,'Neonatology\r,Paedtric Intensivist',NULL),(7,'Diabetes Care Clinic','Diabetes is a hassle-some disease. At Health IQ, we take the stress out of diabetes. We provide everything a diabetic might need, under one roof. Right from diagnosis to speaking to a dietician, educator, diabetologist. As a patient, you don’t have to keep going from pillar to post. We help patients manage Type 1, 2, gestational or prediabetes. Our evaluations, physical exams and treatments are geared to detect and prevent complications brought on by the disease. Our medical team can help you create routines for nutrition and exercise to prevent diabetes if you are prediabetes. For some type 2 patients, we may be able to control diabetes without medication through weight loss, diet and exercise. Our goal is to provide the best possible solution for your particular diagnosis. There are many ways to treat diabetes. Our doctors gives you options and works with you to design a plan that fits your lifestyle so you can successfully live with diabetes. Along with diet, exercise, oral medications, insulin and non-insulin injections, we also have expertise in insulin pump and continuous glucose monitoring.','../../assets/img/services images/diabetes-.jpg',NULL,'2019-08-08 09:27:52',NULL,0,0,NULL,NULL),(8,'Endrocrinology','The department of endocrinology at  Health IQ offers the best treatment modalities available for endocrine disorders to provide accurate and comprehensive care for its patients suffering from various endocrine diseases.\r','../../assets/img/services images/endrocrinology.jpg',NULL,'2019-08-08 09:27:52',NULL,0,0,NULL,NULL),(9,'Ortho Clinic','The department of orthopaedic at Health IQ offers the best treatment modalities available for ortho ailments to provide accurate and comprehensive care for its patients suffering from various ortho problems. In addition, efficient occupational therapists, physiotherapists and pain management experts work towards the quick rehabilitation of the patient leading to a better quality of life','../../assets/img/services images/ortho-clinic.jpg',NULL,'2019-08-08 09:27:52',NULL,0,0,NULL,NULL),(10,'Physiotherapy','Physiotherapy is a health science that aims in rehabilitation and enhance individuals with movement chaos by utilizing evidence-based, natural process like motivation, exercise, education, advocacy and adapted tools. Physiotherapists study subjects like neuroscience,physiology and anatomy for developing attitudes and skills that are very much required for health prevention, education, rehabilitation and treatment of the patients with disabilities and physical ailments.It is sad to say that there are still many educated people in India who think that physiotherapy is only related to a few exercises. Physiotherapy is a science in itself. One might be suffering from cardiopulmonary ,orthopaedic, paediatric, neurology, sports injury, congenital abnormality, to name a few, where physical management becomes as a essential part of the rehabilitation process and some times is the only process. Why physiotherapy at Leela HealthCare? At Leela HealthCare our clinic run by experienced team of doctors and paramedics.  We have all type modern Electrotherapy equipments,exercise Theraphy,Manual Theraphy,here patient can get Acupuncture Treatment facility also apart with these. We basically try to alleviate the pain through various modern techniques or tools that can be used by the experience team of doctors and paramedics.\r \"','../../assets/img/services images/physiotherapy.jpg',NULL,'2019-08-08 09:27:52',NULL,0,0,NULL,NULL),(11,'Pain Clinic','We provide pain management services for diagnosis and treatment for painful conditions.We treat back pain, knee pain, headache, neck pain and cancer pain etc.... due to slipped disc, migraine, Cluster Headache﻿, trigeminal neuralgia, arthritis, spondylitis, cancer etc. We use most advanced interventional pain management methods...like radio-frequency ablation, spinal cord stimulation, Percutaneous Discectomy, vertebroplasty, Epidural steroid injections, Epiduroscopy, Ozone Necleolysis, Platelet Rich Plasma (PRP)﻿ Therapy etc.','../../assets/img/services images/pain-clinic.jpg',NULL,'2019-08-08 09:27:52',NULL,0,0,'IFT,Laser Therapy,Tens,Acupuncture/Dry Needling,Electro acupuncture,Ultrasonic therapy,Diapulse /SWD,Electro stimulators,Neuromuscular stimulations,Electronic tractions,Manual Therapy/Manupulataion,Taping Techniques\r \"',NULL),(12,'Sports Medicine','Sports Medicine is an integral part of modern medicine. Sports Medicine practitioners deal with human fitness and conditioning related to performance, different types of injuries including sports injuries, rehabilitation, pain and weaknesses arising out of different kinds of injuries and diseases The GOAL of Sports Medicine is to prevent injuries, to improve bodily functions and movements and to treat pain in the shortest possible time and with minimum use of medicines. Sports Medicine Therapy requires specific infrastructure including modern Physiotherapy and modern gadgets and also a team of qualified and dedicated experts from different branches of sports sciences. ','../../assets/img/services images/Sports-Medicine.jpg',NULL,'2019-08-08 09:27:52',NULL,0,0,NULL,NULL),(13,'Nutrition / Dietician','Dietetics is about healthy eating practices which act as a preventive and curative means and pave the foundation for a healthier life. At  Health IQ, we regularly counsel our patients about a nutritious, balanced diet that consists of carbohydrates, fats, proteins, minerals, vitamins and electrolytes for their general well-being. Good nutrition is essential for normal organ development and function, normal reproduction, growth and maintenance of muscles and tissue, optimum activity and working efficiency, building resistance to infection and in repairing body damage or injury. The Nutrition and Dietetics team at Leela HealthCare aims to improve the clinical, biochemical, cellular and psychological status of individuals experiencing complications or side effects of various treatments by providing adequate nutrition and related information.','../../assets/img/services images/nutrition-dietician.jpg',NULL,'2019-08-08 09:27:52',NULL,0,0,NULL,NULL);
/*!40000 ALTER TABLE `HealthServiceMaster` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `HospitalMaster`
--

DROP TABLE IF EXISTS `HospitalMaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `HospitalMaster` (
  `ID` int(9) NOT NULL AUTO_INCREMENT,
  `Name` varchar(245) NOT NULL,
  `Type` int(1) NOT NULL DEFAULT '1',
  `Address` varchar(245) DEFAULT NULL,
  `City` int(3) NOT NULL,
  `State` int(2) DEFAULT NULL,
  `PinCode` varchar(10) DEFAULT NULL,
  `IsDeleted` int(1) NOT NULL DEFAULT '1',
  `Status` int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `HospitalMaster`
--

LOCK TABLES `HospitalMaster` WRITE;
/*!40000 ALTER TABLE `HospitalMaster` DISABLE KEYS */;
/*!40000 ALTER TABLE `HospitalMaster` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `JobApplication`
--

DROP TABLE IF EXISTS `JobApplication`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `JobApplication` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(50) NOT NULL,
  `LastName` varchar(50) NOT NULL,
  `Email` varchar(250) NOT NULL,
  `Phone` varchar(10) NOT NULL,
  `Address` varchar(500) DEFAULT NULL,
  `City` varchar(50) DEFAULT NULL,
  `ZipCode` varchar(10) DEFAULT NULL,
  `ResumeText` varchar(5000) DEFAULT NULL,
  `ResumePath` varchar(1500) DEFAULT NULL COMMENT 'file location',
  `CreatedDate` datetime NOT NULL,
  `CompanyID` int(2) NOT NULL DEFAULT '99',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `Email_UNIQUE` (`Email`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `JobApplication`
--

LOCK TABLES `JobApplication` WRITE;
/*!40000 ALTER TABLE `JobApplication` DISABLE KEYS */;
INSERT INTO `JobApplication` VALUES (14,'Neeraj','Singh','neer.s@outlook.com','9599660409',NULL,'Noida',NULL,'f hgvhabjhbajhbanaanan aghab jab','C:\\PROJECTS\\IQHealth\\IqHealth\\IqHealth.WebApi\\Content\\Resumes\\9599660409_neer.s@outlook.com.pdf','2020-04-11 01:15:47',2),(15,'Neeraj','Singh','neemate@ymail.com','9599660409',NULL,'Noida',NULL,' gfjrsfsdjhf bsdkf sd nsdg sdkgd gksfdk.gnfds.g sdf.gmsfdg.,dfmg.,sd gfd.,hsdhdgnhsd nhk.jsfn dfkshdfgl hdsfh sdfh df cgh \ndgf hdfg\nh dfg \nhdfgh\n dghdfgh gdfj dfg','G:\\PleskVhosts\\health-iq.in\\health-iq.in\\Content\\Resumes\\9599660409_neemate@ymail.com.pdf','2020-04-10 07:34:59',2),(12,'Neeraj','Singh','neer19ultimate@gmail.com','9599660409',NULL,'Noida',NULL,NULL,'C:\\PROJECTS\\IQHealth\\IqHealth\\IqHealth.WebApi\\Content\\Resumes\\9599660409_neer19ultimate@gmail.com.pdf','2020-04-10 19:35:43',2),(13,'Neeraj','Singh','singh.neer@ymail.com','8527818810',NULL,'New Delhi',NULL,NULL,'G:\\PleskVhosts\\health-iq.in\\health-iq.in\\Content\\Resumes\\8527818810_singh.neer@ymail.com.pdf','2020-04-10 14:01:02',2);
/*!40000 ALTER TABLE `JobApplication` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Login`
--

DROP TABLE IF EXISTS `Login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Login` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `UserID` int(9) DEFAULT NULL,
  `Password` varchar(20) NOT NULL,
  `LastLoginDate` datetime DEFAULT NULL,
  `LastLoginStatus` int(1) DEFAULT NULL,
  `LoginDate` datetime DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_ID_Login_User` (`UserID`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Login`
--

LOCK TABLES `Login` WRITE;
/*!40000 ALTER TABLE `Login` DISABLE KEYS */;
INSERT INTO `Login` VALUES (1,1,'Krishna_2012','2019-07-25 00:00:00',1,'2019-07-25 00:00:00');
/*!40000 ALTER TABLE `Login` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OnlineEnquiry`
--

DROP TABLE IF EXISTS `OnlineEnquiry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `OnlineEnquiry` (
  `ID` int(9) NOT NULL AUTO_INCREMENT,
  `Type` int(1) NOT NULL DEFAULT '1' COMMENT '1 - GeneralEnquiry\n2 - Course\n3 - Doctor (Enquiry for Doctor)',
  `TypeValue` int(9) DEFAULT NULL COMMENT 'Value of the selected type i.e. for type course CouseID is the TypeValue, For type Doctor DoctorID is TypeValue, null for general',
  `Name` varchar(150) NOT NULL,
  `Email` varchar(250) NOT NULL,
  `Phone` varchar(15) NOT NULL DEFAULT '+91',
  `AltPhone` varchar(15) DEFAULT NULL,
  `Subject` varchar(500) DEFAULT NULL,
  `Message` varchar(1500) DEFAULT NULL,
  `Status` int(1) NOT NULL DEFAULT '1' COMMENT '1- Pending\n2-InProcess\n3-Completed\n4-Resolved\n5-UnResolved',
  `Address` varchar(250) DEFAULT NULL,
  `Place` varchar(150) DEFAULT NULL,
  `City` varchar(100) DEFAULT NULL,
  `State` varchar(45) DEFAULT NULL,
  `Country` int(3) NOT NULL DEFAULT '1' COMMENT '1- India',
  `CaptchaText` varchar(10) DEFAULT NULL,
  `CaptchaVerified` int(1) NOT NULL DEFAULT '0' COMMENT '0 - False\n1 - True',
  `CompanyID` int(2) NOT NULL DEFAULT '99',
  `CreatedDate` datetime NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=43 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OnlineEnquiry`
--

LOCK TABLES `OnlineEnquiry` WRITE;
/*!40000 ALTER TABLE `OnlineEnquiry` DISABLE KEYS */;
INSERT INTO `OnlineEnquiry` VALUES (42,2,1,'Akash','akash.shil15@nshm.edu.in','7908181407',NULL,'Enquiry For Courses.','I ',0,'','','','',1,'',0,2,'2020-03-31 07:29:49'),(41,2,3,'Neeraj Singh','singh.neer@ymail.com','08527818810',NULL,'Enquiry For Courses.','hhgj',0,'','ftyg','','',1,'',0,2,'2020-02-05 17:36:45'),(40,2,5,'Neeraj Singh','singh.neer@ymail.com','08527818810',NULL,'Enquiry For Courses.','chgvjhvhm',0,'','ertgy','','',1,'',0,2,'2020-02-05 17:32:49'),(39,2,4,'Neeraj Singh','neer.s@outlook.com','09599660409',NULL,'Enquiry For Courses.','jg jbk kk  k',0,'','Yt','','',1,'',0,2,'2020-02-05 14:47:30'),(38,2,4,'Neeraj Singh','neer.s@outlook.com','09599660409',NULL,'Enquiry For Courses.','fgcghchn',0,'','dxfc b','','',1,'',0,2,'2020-02-05 14:38:55'),(37,2,4,'Neeraj Singh','neer.s@outlook.com','09599660409',NULL,'Enquiry For Courses.','fgcghchn',0,'','dxfc b','','',1,'',0,2,'2020-02-05 14:35:00'),(36,2,4,'Neeraj Singh','neer.s@outlook.com','09599660409',NULL,'Enquiry For Courses.','fgcghchn',0,'','dxfc b','','',1,'',0,2,'2020-02-05 14:34:20'),(35,2,4,'Neeraj Singh','neer.s@outlook.com','09599660409',NULL,'Enquiry For Courses.','fgcghchn',0,'','dxfc b','','',1,'',0,2,'2020-02-05 14:32:46'),(34,2,4,'Neeraj Singh','singh.neer@ymail.com','08527818810',NULL,'Enquiry For Courses.','chgchchhg',0,'','','','',1,'',0,2,'2020-02-05 12:44:08'),(33,2,2,'Neeraj Singh','singh.neer@ymail.com','08527818810',NULL,'Enquiry For Courses.','edtrfytgjb',0,'','fgh','','',1,'',0,2,'2020-02-05 12:30:28'),(32,2,4,'Neeraj Singh','singh.neer@ymail.com','08527818810',NULL,'Enquiry For Courses.','dfxgfchvb ',0,'','','','',1,'',0,2,'2020-02-05 11:27:29'),(31,2,4,'Neeraj Singh','singh.neer@ymail.com','08527818810',NULL,'Enquiry For Courses.','dfxgfchvb ',0,'','','','',1,'',0,2,'2020-02-05 11:27:17'),(30,2,3,'Neeraj Singh','singh.neer@ymail.com','08527818810',NULL,'Enquiry For Courses.','ertfyghvjb',0,'','45erd6yftv','','',1,'',0,2,'2020-02-05 11:24:53'),(29,2,6,'Neeraj Singh','neer.s@outlook.com','09599660409',NULL,'Enquiry For Courses.','bvm ',0,'','noida','','',1,'',0,2,'2020-02-05 11:17:35'),(28,2,7,'Neeraj Singh','neer19ultimate@gmail.com','09599660409',NULL,'Enquiry For Courses.','gdg',0,'','unn','','',1,'',0,2,'2020-02-05 01:39:31'),(27,2,4,'Neeraj Singh','neer.s@outlook.com','09599660409',NULL,'Enquiry For Courses.','hhhh',0,'','jh','','',1,'',0,2,'2020-02-05 01:13:58'),(26,2,5,'Neeraj Singh','singh.neer@ymail.com','08527818810',NULL,'Enquiry For Courses.','hhgv',0,'','','','',1,'',0,2,'2020-02-05 01:12:27'),(25,2,2,'Neeraj Singh','neer.s@outlook.com','09599660409',NULL,'Enquiry For Courses.','edrgv',0,'','','','',1,'',0,2,'2020-02-05 01:09:40');
/*!40000 ALTER TABLE `OnlineEnquiry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OrganizeCampEnquiry`
--

DROP TABLE IF EXISTS `OrganizeCampEnquiry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `OrganizeCampEnquiry` (
  `ID` int(9) NOT NULL AUTO_INCREMENT,
  `Name` varchar(45) NOT NULL,
  `Mobile` varchar(15) NOT NULL,
  `Email` varchar(150) NOT NULL,
  `ExpectedCount` int(5) NOT NULL,
  `Address` varchar(500) DEFAULT NULL,
  `City` int(3) DEFAULT NULL,
  `State` int(2) DEFAULT NULL,
  `Message` varchar(1000) DEFAULT NULL,
  `CreatedDate` datetime NOT NULL,
  `IsDeleted` int(1) NOT NULL,
  `Status` int(1) NOT NULL,
  `CompanyID` int(2) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OrganizeCampEnquiry`
--

LOCK TABLES `OrganizeCampEnquiry` WRITE;
/*!40000 ALTER TABLE `OrganizeCampEnquiry` DISABLE KEYS */;
INSERT INTO `OrganizeCampEnquiry` VALUES (67,'Neeraj Singh','08527818810','singh.neer@ymail.com',89,'CAP Global',7,0,NULL,'2020-03-28 20:21:16',0,0,2),(68,'Neeraj Singh','09599660409','neer19ultimate@gmail.com',12,'CAP Global',2,0,NULL,'2020-04-10 14:29:37',0,0,2),(69,'Neeraj Singh','08527818810','singh.neer@ymail.com',3,'',2,0,NULL,'2020-04-10 14:37:00',0,0,2);
/*!40000 ALTER TABLE `OrganizeCampEnquiry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PackageCategory`
--

DROP TABLE IF EXISTS `PackageCategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PackageCategory` (
  `ID` int(3) NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) NOT NULL,
  `Title` varchar(255) NOT NULL,
  `SubTitle` varchar(500) DEFAULT NULL,
  `ImageUrl` varchar(1005) DEFAULT NULL,
  `About` varchar(1500) DEFAULT NULL,
  `IsDeleted` int(1) NOT NULL DEFAULT '0',
  `CompanyID` int(2) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `Catg_Name_UNIQUE` (`Name`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PackageCategory`
--

LOCK TABLES `PackageCategory` WRITE;
/*!40000 ALTER TABLE `PackageCategory` DISABLE KEYS */;
INSERT INTO `PackageCategory` VALUES (1,'Basic','Basic',NULL,'../../assets/img/h-packages/basic.jpg',NULL,0,NULL),(2,'Diabetes','Diabetes',NULL,'../../assets/img/h-packages/diabetese.jpg',NULL,0,NULL),(3,'Cardiac','Cardiac',NULL,'../../assets/img/h-packages/cardiac.jpg',NULL,0,NULL),(4,'Full Body','Full Body',NULL,'../../assets/img/h-packages/full-body.jpg',NULL,0,NULL),(5,'Wellness','Wellness',NULL,'../../assets/img/h-packages/wellness.jpg',NULL,0,NULL),(6,'Pre Marital check','Pre Marital check',NULL,'../../assets/img/h-packages/pre-marital.jpg',NULL,0,NULL),(7,'Senior Citizen','Senior Citizen',NULL,'../../assets/img/h-packages/senior-citizen.jpg',NULL,0,NULL),(8,'Executive Pack','Executive Pack',NULL,'../../assets/img/h-packages/executive-pack.jpg',NULL,0,NULL);
/*!40000 ALTER TABLE `PackageCategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PackageMaster`
--

DROP TABLE IF EXISTS `PackageMaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PackageMaster` (
  `ID` int(5) NOT NULL AUTO_INCREMENT,
  `Name` varchar(250) NOT NULL,
  `Title` varchar(255) DEFAULT NULL,
  `SubTitle` varchar(500) DEFAULT NULL,
  `About` varchar(1000) DEFAULT NULL,
  `Cost` decimal(9,2) NOT NULL DEFAULT '0.00',
  `Status` int(1) DEFAULT NULL,
  `CatgID` int(3) NOT NULL DEFAULT '1',
  `CreatedDate` datetime NOT NULL,
  `IsDeleted` int(1) NOT NULL DEFAULT '0',
  `UpdatedDate` datetime DEFAULT NULL,
  `ImageUrl` varchar(1005) DEFAULT NULL,
  `CompanyID` int(2) NOT NULL DEFAULT '99',
  `Sequence` int(3) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `Name_UNIQUE` (`Name`),
  KEY `fk_package_catg_ID_idx` (`CatgID`),
  KEY `FK_Package_Comapny_ID_idx` (`CompanyID`),
  CONSTRAINT `fk_package_catg_ID` FOREIGN KEY (`CatgID`) REFERENCES `PackageCategory` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_Package_Comapny_ID` FOREIGN KEY (`CompanyID`) REFERENCES `CompanyMaster` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PackageMaster`
--

LOCK TABLES `PackageMaster` WRITE;
/*!40000 ALTER TABLE `PackageMaster` DISABLE KEYS */;
INSERT INTO `PackageMaster` VALUES (1,'MINI BODY CHECK MALE','MINI BODY CHECK MALE',NULL,'COMPLETE BLOOD COUNT (CBC),\r\nCOMPLETE URINE, EXAMINATION,\r\nCHOLESTEROL - SERUM,\r\nGLUCOSE FASTING',600.00,1,1,'2019-07-28 00:00:00',0,'2019-07-28 00:00:00',NULL,99,NULL),(2,'MINI BODY CHECK FEMALE','MINI BODY CHECK FEMALE',NULL,'MINI BODY CHECK FEMALE',850.00,1,1,'2019-07-28 00:00:00',0,'2019-07-28 00:00:00',NULL,99,NULL),(3,'DIABETIC CHECK','DIABETIC CHECK',NULL,'DIABETIC CHECK',499.00,1,2,'2019-07-28 00:00:00',0,'2019-07-28 00:00:00',NULL,99,NULL),(4,'DIABETIC PANEL','DIABETIC PANEL',NULL,'DIABETIC PANEL',699.00,1,2,'2019-07-28 00:00:00',0,'2019-07-28 00:00:00',NULL,99,NULL),(5,'DIABETES MONITORING PANEL','DIABETES MONITORING PANEL',NULL,'DIABETES MONITORING PANEL',950.00,1,2,'2019-07-28 00:00:00',0,'2019-07-28 00:00:00',NULL,99,NULL),(6,'Diabetes Check Gold','Diabetes Check Gold',NULL,NULL,1100.00,1,2,'2019-07-28 00:00:00',0,'2019-07-28 00:00:00',NULL,99,NULL),(7,'MASTER CHECK DIABETES','MASTER CHECK DIABETES',NULL,NULL,1590.00,1,2,'2019-07-28 00:00:00',0,'2019-07-28 00:00:00',NULL,99,NULL),(8,'EXECUTIVE PACK -II',NULL,'DIABETIC CHECK UP',NULL,1700.00,1,2,'2019-07-28 00:00:00',0,'2019-07-28 00:00:00',NULL,99,NULL),(9,'HEALTHY HEART','HEALTHY HEART',NULL,NULL,799.00,1,3,'2019-07-28 00:00:00',0,'2019-07-28 00:00:00',NULL,99,NULL),(10,'HEALTHY HEART EXTENDED','HEALTHY HEART EXTENDED',NULL,NULL,1299.00,1,3,'2019-07-28 00:00:00',0,'2019-07-28 00:00:00',NULL,99,NULL),(11,'BASIC CARDIAC CHECK UP','BASIC CARDIAC CHECK UP',NULL,NULL,1400.00,1,3,'2019-07-28 00:00:00',0,'2019-07-28 00:00:00',NULL,99,NULL),(12,'EXECUTIVE PACK -III CARDIAC CHECK UP','EXECUTIVE PACK -III CARDIAC CHECK UP',NULL,NULL,3200.00,1,3,'2019-07-28 00:00:00',0,'2019-07-28 00:00:00',NULL,99,NULL),(13,'MASTER CHECK BASIC','MASTER CHECK BASIC',NULL,NULL,1990.00,1,1,'2019-07-28 00:00:00',0,'2019-07-28 00:00:00',NULL,99,NULL),(14,'AYUSH SMART 1  ','AYUSH SMART 1  ',NULL,NULL,899.00,1,1,'2019-07-28 00:00:00',0,'2019-07-28 00:00:00',NULL,99,NULL),(15,'AYUSH SMART 2','AYUSH SMART 2',NULL,NULL,1199.00,1,1,'2019-07-28 00:00:00',0,'2019-07-28 00:00:00',NULL,99,NULL),(16,'AYUSH SMART 3','AYUSH SMART 3',NULL,NULL,1899.00,1,1,'2019-07-28 00:00:00',0,'2019-07-28 00:00:00',NULL,99,NULL),(17,'MASTER CHECK LITE','MASTER CHECK LITE',NULL,NULL,2490.00,1,4,'2019-07-28 00:00:00',0,'2019-07-28 00:00:00',NULL,99,NULL),(18,'MASTER CHECK SILVER','MASTER CHECK SILVER',NULL,NULL,2890.00,1,4,'2019-07-28 00:00:00',0,'2019-07-28 00:00:00',NULL,99,NULL),(19,'MASTER CHECK GOLD','MASTER CHECK GOLD',NULL,NULL,4150.00,1,4,'2019-07-28 00:00:00',0,'2019-07-28 00:00:00',NULL,99,NULL),(20,'MASTER CHECK DIAMOND','MASTER CHECK DIAMOND',NULL,NULL,5490.00,1,4,'2019-07-28 00:00:00',0,'2019-07-28 00:00:00',NULL,99,NULL),(21,'MASTER CHECK PLATINUM','MASTER CHECK PLATINUM',NULL,NULL,6990.00,1,4,'2019-07-28 00:00:00',0,'2019-07-28 00:00:00',NULL,99,NULL),(22,'THYROID PANEL','THYROID PANEL',NULL,NULL,899.00,1,5,'2019-07-28 00:00:00',0,'2019-07-28 00:00:00',NULL,99,NULL),(23,'VITAMIN CHECK','VITAMIN CHECK',NULL,NULL,1299.00,1,5,'2019-07-28 00:00:00',0,'2019-07-28 00:00:00',NULL,99,NULL),(24,'PAIN CHECK','PAIN CHECK','Body check',NULL,1999.00,1,5,'2019-07-28 00:00:00',0,'2019-07-28 00:00:00',NULL,99,NULL),(25,'BONE PROFILE','BONE PROFILE',NULL,NULL,2999.00,1,5,'2019-07-28 00:00:00',0,'2019-07-28 00:00:00',NULL,99,NULL),(26,'PRE MARITAL HEALTH CHECKUP1 (MALE)','PRE MARITAL HEALTH CHECKUP1 (MALE)',NULL,NULL,4859.00,1,6,'2019-07-28 00:00:00',0,'2019-07-28 00:00:00',NULL,99,NULL),(27,'PRE MARITAL HEALTH CHECKUP 1(FEMALE)','PRE MARITAL HEALTH CHECKUP 1(FEMALE)',NULL,NULL,1829.00,1,6,'2019-07-28 00:00:00',0,'2019-07-28 00:00:00',NULL,99,NULL),(28,'PRE MARITAL HEALTH CHECKUP 3(FEMALE)','PRE MARITAL HEALTH CHECKUP 3(FEMALE)',NULL,NULL,3279.00,1,6,'2019-07-28 00:00:00',0,'2019-07-28 00:00:00',NULL,99,NULL),(29,'PRE MARITAL HEALTH CHECKUP 2 (MALE)','PRE MARITAL HEALTH CHECKUP (MALE)',NULL,NULL,3279.00,1,6,'2019-07-28 00:00:00',0,'2019-07-28 00:00:00',NULL,99,NULL),(30,'PRE MARITAL HEALTH CHECKUP2(FEMALE)','PRE MARITAL HEALTH CHECKUP2(FEMALE)',NULL,NULL,4859.00,1,6,'2019-07-28 00:00:00',0,'2019-07-28 00:00:00',NULL,99,NULL),(31,'For MEN','For MEN',NULL,NULL,3190.00,1,7,'2019-07-28 00:00:00',0,'2019-07-28 00:00:00',NULL,99,NULL),(32,'For  WOMEN','For  WOMEN',NULL,NULL,3090.00,1,7,'2019-07-28 00:00:00',0,'2019-07-28 00:00:00',NULL,99,NULL),(33,'EXECUTIVE PACK 1','EXECUTIVE PACK 1',NULL,NULL,2950.00,1,8,'2019-07-28 00:00:00',0,'2019-07-28 00:00:00',NULL,99,NULL),(34,'EXECUTIVE PACK II','EXECUTIVE PACK II',NULL,NULL,1700.00,1,8,'2019-07-28 00:00:00',0,'2019-07-28 00:00:00',NULL,99,NULL);
/*!40000 ALTER TABLE `PackageMaster` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PartnerEnquiry`
--

DROP TABLE IF EXISTS `PartnerEnquiry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PartnerEnquiry` (
  `ID` int(9) NOT NULL AUTO_INCREMENT,
  `Name` varchar(45) NOT NULL,
  `Mobile` varchar(15) NOT NULL,
  `Email` varchar(150) NOT NULL,
  `Address` varchar(500) DEFAULT NULL,
  `City` int(3) DEFAULT NULL,
  `State` int(2) DEFAULT NULL,
  `Message` varchar(1000) DEFAULT NULL,
  `CreatedDate` datetime NOT NULL,
  `IsDeleted` int(1) NOT NULL,
  `Status` int(1) NOT NULL,
  `CompanyID` int(2) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PartnerEnquiry`
--

LOCK TABLES `PartnerEnquiry` WRITE;
/*!40000 ALTER TABLE `PartnerEnquiry` DISABLE KEYS */;
INSERT INTO `PartnerEnquiry` VALUES (67,'Neeraj Singh','09599660409','neer.s@outlook.com','D- 302 Apex Golf Avenue, Sector 1, Greater Noida West',2,0,NULL,'2020-03-28 20:15:06',0,0,2),(68,'Neeraj Singh','09599660409','neer19ultimate@gmail.com','G 202 Skytech Mattrot',7,0,NULL,'2020-03-28 09:43:58',0,0,2),(69,'Neeraj Singh','08527818810','singh.neer@ymail.com','K-93, 2nd Floor,',2,NULL,NULL,'2020-04-10 14:27:06',0,0,2),(70,'Neeraj Singh','08527818810','singh.neer@ymail.com','K-93, 2nd Floor,',4,NULL,NULL,'2020-04-10 14:38:27',0,0,2),(71,'Neeraj Singh','08527818810','singh.neer@ymail.com','K-93, 2nd Floor,',3,NULL,NULL,'2020-04-10 14:40:25',0,0,2);
/*!40000 ALTER TABLE `PartnerEnquiry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SpecialityMaster`
--

DROP TABLE IF EXISTS `SpecialityMaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SpecialityMaster` (
  `ID` int(9) NOT NULL AUTO_INCREMENT,
  `Speciality` varchar(145) NOT NULL,
  `Title` varchar(245) DEFAULT NULL,
  `IsDeleted` int(1) NOT NULL DEFAULT '0',
  `ImageUrl` varchar(1000) NOT NULL DEFAULT '../../assets/img/h-packages/cardiac.jpg',
  `LogoUrl` varchar(1000) DEFAULT NULL,
  `CompanyID` int(2) NOT NULL DEFAULT '99',
  PRIMARY KEY (`ID`),
  KEY `FK_Speciality_Company_ID_idx` (`CompanyID`),
  CONSTRAINT `FK_Speciality_Company_ID` FOREIGN KEY (`CompanyID`) REFERENCES `CompanyMaster` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SpecialityMaster`
--

LOCK TABLES `SpecialityMaster` WRITE;
/*!40000 ALTER TABLE `SpecialityMaster` DISABLE KEYS */;
INSERT INTO `SpecialityMaster` VALUES (1,'General Physician','General Physician',0,'http://www.fakingnews.firstpost.com/wp-content/uploads/2018/01/Best-Hopsital-For-Surgical-Care-India-11-300x224.png',NULL,99),(2,'Laproscopic Surgery','Laproscopic Surgery',1,'https://k4q7g7n2.stackpathcdn.com/wp-content/uploads/2017/02/laparoscopic-surgery.jpg',NULL,99),(3,'Audiology and Speech Therepy','Audiology and Speech Therepy',1,'../../assets/img/h-packages/cardiac.jpg',NULL,99),(4,'Cardiology','Cardiology (Heart)',0,'http://www.fakingnews.firstpost.com/wp-content/uploads/2018/01/Best-Hopsital-For-Surgical-Care-India-11-300x224.png',NULL,99),(5,'Cardiac Surgery','Cardiac Surgery (Heart)',1,'../../assets/img/h-packages/cardiac.jpg',NULL,99),(6,'Endocrinologist','Endocrinologist',1,'https://k4q7g7n2.stackpathcdn.com/wp-content/uploads/2017/02/laparoscopic-surgery.jpg',NULL,99),(7,'ENT','Ear Nose Tounge',0,'../../assets/img/h-packages/cardiac.jpg',NULL,99),(8,'Diabetes and Endocrinology','Diabetes & Endocrinology',0,'https://downloads.healthcatalyst.com/wp-content/uploads/2016/12/diabetes-care.jpg',NULL,99),(9,'Pediatrics/Paediatric Cardiology','Paediatric/Paediatric Intensivist',0,'../../assets/img/h-packages/cardiac.jpg',NULL,99),(10,'Orthopaedic','Orthopaedic',0,'https://media.istockphoto.com/photos/radiologist-doctor-with-digital-tablet-checking-xray-healthcare-and-picture-id649856016?k=6&m=649856016&s=612x612&w=0&h=kzoxnRizg4drZo0ns47rB45QbgErsUBrSh-ZfGIjs3A=',NULL,99),(11,'Gynaecologist','Gynaecologist & Obstetrician',0,'https://www.mdoctorshub.com/wp-content/uploads/2017/04/1.jpg',NULL,99),(12,'Physiotherapist','Physiotherapist',0,'https://thumbs.dreamstime.com/b/young-woman-wearing-brace-rehabilitation-her-physiotherapist-women-horizontal-view-129652970.jpg',NULL,99),(13,'Nutrition/ Dietitian','Nutrition/ Dietitian',0,'https://image.shutterstock.com/image-photo/young-asian-dietician-nutritionist-holding-260nw-1311225152.jpg',NULL,99);
/*!40000 ALTER TABLE `SpecialityMaster` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SubCourses`
--

DROP TABLE IF EXISTS `SubCourses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SubCourses` (
  `ID` int(9) NOT NULL AUTO_INCREMENT,
  `Name` varchar(250) NOT NULL,
  `Duration` int(2) NOT NULL DEFAULT '0',
  `MinQualification` varchar(250) DEFAULT NULL,
  `MinAge` int(2) NOT NULL DEFAULT '15',
  `MaxAge` int(2) DEFAULT '99',
  `IndianAdmissionFee` decimal(9,2) NOT NULL DEFAULT '0.00',
  `ForeignAdmissionFee` decimal(9,2) NOT NULL DEFAULT '0.00',
  `IndianOtherFee` decimal(9,2) DEFAULT NULL,
  `ForeignOtherFee` decimal(9,2) DEFAULT NULL,
  `CourseMasterID` int(9) NOT NULL DEFAULT '1',
  `CompanyID` int(3) NOT NULL DEFAULT '999',
  PRIMARY KEY (`ID`),
  KEY `FK_SubCourses_Course_ID_idx` (`CourseMasterID`),
  KEY `FK_SubCources_Company_ID_idx` (`CompanyID`),
  CONSTRAINT `FK_SubCources_Company_ID` FOREIGN KEY (`CompanyID`) REFERENCES `CompanyMaster` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_SubCourses_Course_ID` FOREIGN KEY (`CourseMasterID`) REFERENCES `CourseMaster` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SubCourses`
--

LOCK TABLES `SubCourses` WRITE;
/*!40000 ALTER TABLE `SubCourses` DISABLE KEYS */;
INSERT INTO `SubCourses` VALUES (1,'DMLT(Diploma In Medical Laboratory Technician)',24,'12th - Arts/Commerce',17,99,30000.00,40000.00,40000.00,40000.00,1,2),(2,'CMLT(Certificate in In Medical Laboratory Technician)',12,'12th - Arts/Commerce',17,99,15000.00,20000.00,20000.00,20000.00,1,2),(3,'DPT(Diploma In Physiotherapy)',24,'12th - Arts/Commerce',17,99,30000.00,40000.00,40000.00,40000.00,2,2),(4,'CPT(Certificate In Physiotherapy)',12,'12th - Arts/Commerce',17,99,15000.00,20000.00,20000.00,20000.00,2,2),(5,'DPC(Diploma In Patient Care)',24,'12th - Arts/Commerce',17,99,30000.00,40000.00,40000.00,40000.00,3,2),(6,'CPC(Certificate In Patient Care)',12,'12th - Arts/Commerce',17,99,15000.00,20000.00,20000.00,20000.00,3,2),(7,'Diploma In ECG Technicia',12,'12th - Arts/Commerce',17,99,5000.00,20000.00,10000.00,20000.00,4,2),(8,'Certificate In Diet & Nutrition',12,'12th - Arts/Commerce',17,99,5000.00,20000.00,10000.00,20000.00,5,2);
/*!40000 ALTER TABLE `SubCourses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TestMaster`
--

DROP TABLE IF EXISTS `TestMaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TestMaster` (
  `ID` int(7) NOT NULL AUTO_INCREMENT,
  `Name` varchar(150) NOT NULL,
  `Type` int(2) NOT NULL DEFAULT '1',
  `PreTestInfo` varchar(500) DEFAULT NULL,
  `ResultInHours` int(3) NOT NULL DEFAULT '24',
  `Components` varchar(150) DEFAULT NULL,
  `Cost` decimal(9,2) NOT NULL DEFAULT '0.00',
  `CreatedDate` datetime NOT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `IsDeleted` int(1) NOT NULL DEFAULT '0',
  `PackageID` int(5) DEFAULT NULL,
  `CompanyID` int(2) NOT NULL DEFAULT '99',
  PRIMARY KEY (`ID`),
  KEY `fk_tests_packages_ID_idx` (`PackageID`),
  KEY `FK_TestMaster_Company_ID_idx` (`CompanyID`),
  CONSTRAINT `FK_Test_Company_ID` FOREIGN KEY (`CompanyID`) REFERENCES `CompanyMaster` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_Test_Package_ID` FOREIGN KEY (`PackageID`) REFERENCES `PackageMaster` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=219226 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TestMaster`
--

LOCK TABLES `TestMaster` WRITE;
/*!40000 ALTER TABLE `TestMaster` DISABLE KEYS */;
INSERT INTO `TestMaster` VALUES (1,'COMPLETE BLOOD COUNT (CBC)',1,'',24,'',0.00,'2019-07-28 00:00:00','2019-07-28 00:00:00',0,1,99),(2,'COMPLETE URINE EXAMINATION',2,'',24,'',0.00,'2019-07-28 00:00:00','2019-07-28 00:00:00',0,1,99),(3,'CHOLESTEROL - SERUM',1,NULL,24,NULL,0.00,'2019-07-28 00:00:00',NULL,0,1,99),(4,'GLUCOSE FASTING',1,NULL,24,NULL,0.00,'2019-07-28 00:00:00',NULL,0,1,99),(6,'COMPLETE BLOOD COUNT (CBC) - FEMALE',1,NULL,24,NULL,0.00,'2019-07-28 00:00:00','2019-07-28 00:00:00',0,2,99),(7,'COMPLETE URINE EXAMINATION',2,NULL,24,NULL,0.00,'2019-07-28 00:00:00',NULL,0,2,99),(8,'CHOLESTEROL - SERUM',1,NULL,24,NULL,0.00,'2019-07-28 00:00:00',NULL,0,2,99),(9,'GLUCOSE FASTING',1,NULL,24,NULL,0.00,'2019-07-28 00:00:00',NULL,0,2,99),(10,'THYROID STIMULATING HORMONE (TSH) SERUM',1,NULL,24,NULL,0.00,'2019-07-28 00:00:00',NULL,0,2,99),(11,'GLUCOSE FASTING',1,NULL,24,NULL,0.00,'2019-07-28 00:00:00',NULL,0,14,99),(12,'CHOLESTEROL - SERUM',1,NULL,24,NULL,0.00,'2019-07-28 00:00:00',NULL,0,14,99),(13,'ASPARTATE AMINOTRANSFERASE (AST/SGOT)',1,NULL,24,NULL,0.00,'2019-07-28 00:00:00',NULL,0,14,99),(14,'ALANINE AMINOTRANSFERASE (ALT/SGPT)',1,NULL,24,NULL,0.00,'2019-07-28 00:00:00',NULL,0,14,99),(15,'UREA - SERUM',1,NULL,24,NULL,0.00,'2019-07-28 00:00:00',NULL,0,14,99),(16,'CREATININE SERUM',1,NULL,24,NULL,0.00,'2019-07-28 00:00:00',NULL,0,14,99),(17,'THYROID STIMULATING HORMONE (TSH)',1,NULL,24,NULL,0.00,'2019-07-28 00:00:00',NULL,0,14,99),(18,'CALCIUM	SERUM',1,NULL,24,NULL,0.00,'2019-07-28 00:00:00',NULL,0,14,99),(19,'HEMOGLOBIN',1,NULL,24,NULL,0.00,'2019-07-28 00:00:00',NULL,0,14,99),(20,'GLUCOSE FASTING',1,NULL,24,NULL,0.00,'2019-07-28 00:00:00',NULL,0,15,99),(21,'CHOLESTEROL - SERUM',1,NULL,24,NULL,0.00,'2019-07-28 00:00:00',NULL,0,15,99),(22,'ASPARTATE AMINOTRANSFERASE (AST/SGOT) SERUM',1,NULL,24,NULL,0.00,'2019-07-28 00:00:00',NULL,0,15,99),(23,'ALANINE AMINOTRANSFERASE (ALT/SGPT) SERUM',1,NULL,24,NULL,0.00,'2019-07-28 00:00:00',NULL,0,15,99),(24,'UREA - SERUM',1,NULL,24,NULL,0.00,'2019-07-28 00:00:00',NULL,0,15,99),(25,'CREATININE SERUM',1,NULL,24,NULL,0.00,'2019-07-28 00:00:00',NULL,0,15,99),(26,'THYROID STIMULATING HORMONE (TSH) SERUM',1,NULL,24,NULL,0.00,'2019-07-28 00:00:00',NULL,0,15,99),(27,'CALCIUM SERUM',1,NULL,24,NULL,0.00,'2019-07-28 00:00:00',NULL,0,15,99),(28,'COMPLETE BLOOD COUNT (CBC)',1,NULL,24,NULL,0.00,'2019-07-28 00:00:00',NULL,0,15,99),(29,'TRIGLYCERIDES - SERUM',1,NULL,24,NULL,0.00,'2019-07-28 00:00:00',NULL,0,15,99),(30,'BILIRUBIN SERUM - TOTAL/DIRECT/INDIRECT',1,NULL,24,NULL,0.00,'2019-07-28 00:00:00',NULL,0,15,99),(31,'HBA1C GLYCATED HEMOGLOBIN',1,NULL,24,NULL,0.00,'2019-07-28 00:00:00',NULL,0,15,99),(32,'GLUCOSE FASTING',1,NULL,24,NULL,0.00,'2019-07-28 00:00:00',NULL,0,16,99),(33,'CHOLESTEROL - SERUM',1,NULL,24,NULL,0.00,'2019-07-28 00:00:00',NULL,0,16,99),(34,'ASPARTATE AMINOTRANSFERASE (AST/SGOT) SERUM',1,NULL,24,NULL,0.00,'2019-07-28 00:00:00',NULL,0,16,99),(35,'ALANINE AMINOTRANSFERASE (ALT/SGPT) SERUM',1,NULL,24,NULL,0.00,'2019-07-28 00:00:00',NULL,0,16,99),(36,'UREA - SERUM',1,NULL,24,NULL,0.00,'2019-07-28 00:00:00',NULL,0,16,99),(37,'CREATININE SERUM',1,NULL,24,NULL,0.00,'2019-07-28 00:00:00',NULL,0,16,99),(38,'THYROID STIMULATING HORMONE (TSH) SERUM',1,NULL,24,NULL,0.00,'2019-07-28 00:00:00',NULL,0,16,99),(39,'TRIGLYCERIDES - SERUM',1,NULL,24,NULL,0.00,'2019-07-28 00:00:00',NULL,0,16,99),(40,'BILIRUBIN SERUM - TOTAL/DIRECT/INDIRECT',1,NULL,24,NULL,0.00,'2019-07-28 00:00:00',NULL,0,16,99),(41,'COMPLETE BLOOD COUNT (CBC)',1,NULL,24,NULL,0.00,'2019-07-28 00:00:00',NULL,0,16,99),(42,'VITAMIN D - 25 HYDROXY (D2+D3)',1,NULL,24,NULL,0.00,'2019-07-28 00:00:00',NULL,0,16,99),(43,'CALCIUM SERUM',1,NULL,24,NULL,0.00,'2019-07-28 00:00:00',NULL,0,16,99),(44,'COMPLETE URINE EXAMINATION',1,NULL,24,NULL,0.00,'2019-07-28 00:00:00',NULL,0,3,99),(45,'GLUCOSE  FASTING',1,NULL,24,NULL,0.00,'2019-07-28 00:00:00',NULL,0,3,99),(46,'HBA1C GLYCATED HEMOGLOBIN',1,NULL,24,NULL,0.00,'2019-07-28 00:00:00',NULL,0,3,99),(47,'GLUCOSE	 FASTING',1,NULL,24,NULL,0.00,'2019-07-28 00:00:00',NULL,0,4,99),(48,'HBA1C GLYCATED HEMOGLOBIN',1,NULL,24,NULL,0.00,'2019-07-28 00:00:00',NULL,0,4,99),(49,'GLUCOSE	 POST PRANDIAL (PP) 2 HOURS (POST MEAL)',1,NULL,24,NULL,0.00,'2019-07-28 00:00:00',NULL,0,4,99),(50,'CHOLESTEROL - SERUM',1,NULL,24,NULL,0.00,'2019-07-28 00:00:00',NULL,0,4,99),(51,'TRIGLYCERIDES - SERUM',1,NULL,24,NULL,0.00,'2019-07-28 00:00:00',NULL,0,4,99),(52,'UREA - SERUM',1,NULL,24,NULL,0.00,'2019-07-28 00:00:00',NULL,0,4,99),(53,'CREATININE SERUM',1,NULL,24,NULL,0.00,'2019-07-28 00:00:00',NULL,0,4,99),(54,'COMPLETE URINE EXAMINATION',2,NULL,24,NULL,0.00,'2019-07-28 00:00:00',NULL,0,4,99),(55,'GLUCOSE	 FASTING',1,NULL,24,NULL,0.00,'2019-07-28 00:00:00',NULL,0,5,99),(56,'HBA1C GLYCATED HEMOGLOBIN',1,NULL,24,NULL,0.00,'2019-07-28 00:00:00',NULL,0,5,99),(57,'GLUCOSE	 POST PRANDIAL (PP) 2 HOURS (POST MEAL)',1,NULL,24,NULL,0.00,'2019-07-28 00:00:00',NULL,0,5,99),(58,'MICROALBUMIN ( MAU)- SPOT URINE',2,NULL,24,NULL,0.00,'2019-07-28 00:00:00',NULL,0,5,99),(59,'LIPID PROFILE',1,NULL,24,NULL,0.00,'2019-07-28 00:00:00',NULL,0,6,99),(60,'HBA1C GLYCATED HEMOGLOBIN',1,NULL,24,NULL,0.00,'2019-07-28 00:00:00',NULL,0,6,99),(61,'GLUCOSE	 FASTING',1,NULL,24,NULL,0.00,'2019-07-28 00:00:00',NULL,0,6,99),(62,'COMPLETE URINE EXAMINATION',2,NULL,24,NULL,0.00,'2019-07-28 00:00:00',NULL,0,6,99),(63,'GLUCOSE	 FASTING',1,NULL,24,NULL,0.00,'2019-07-28 00:00:00',NULL,0,7,99),(64,'HBA1C GLYCATED HEMOGLOBIN',1,NULL,24,NULL,0.00,'2019-07-28 00:00:00',NULL,0,7,99),(65,'GLUCOSE	 POST PRANDIAL (PP) 2 HOURS (POST MEAL)',1,NULL,24,NULL,0.00,'2019-07-28 00:00:00',NULL,0,7,99),(66,'RENAL PROFILE/RENAL FUNCTION TEST (RFT/KFT)',1,NULL,24,NULL,0.00,'2019-07-28 00:00:00',NULL,0,7,99),(67,'MICROALBUMIN ( MAU)- SPOT URINE',1,NULL,24,NULL,0.00,'2019-07-28 00:00:00',NULL,0,7,99),(68,'COMPLETE BLOOD COUNT (CBC)',1,NULL,24,NULL,0.00,'2019-07-28 00:00:00',NULL,0,8,99),(69,'GLUCOSE	 FASTING',1,NULL,24,NULL,0.00,'2019-07-28 00:00:00',NULL,0,8,99),(70,'GLUCOSE	 POST PRANDIAL (PP) 2 HOURS (POST MEAL)',1,NULL,24,NULL,0.00,'2019-07-28 00:00:00',NULL,0,8,99),(71,'UREA - SERUM',1,NULL,24,NULL,0.00,'2019-07-28 00:00:00',NULL,0,8,99),(72,'CREATININE SERUM',1,NULL,24,NULL,0.00,'2019-07-28 00:00:00',NULL,0,8,99),(73,'LIPID PROFILE',1,NULL,24,NULL,0.00,'2019-07-28 00:00:00',NULL,0,8,99),(74,'BLOOD GROUP ABO AND RH FACTOR',1,NULL,24,NULL,0.00,'2019-07-28 00:00:00',NULL,0,8,99),(75,'HBA1C GLYCATED HEMOGLOBIN',1,NULL,24,NULL,0.00,'2019-07-28 00:00:00',NULL,0,8,99),(76,'GLUCOSE	 FASTING',1,NULL,24,NULL,0.00,'2019-07-28 00:00:00',NULL,0,9,99),(77,'LIPID PROFILE',1,NULL,24,NULL,0.00,'2019-07-28 00:00:00',NULL,0,9,99),(78,'UREA - SERUM',1,NULL,24,NULL,0.00,'2019-07-28 00:00:00',NULL,0,9,99),(79,'CREATININE SERUM',1,NULL,24,NULL,0.00,'2019-07-28 00:00:00',NULL,0,9,99),(80,'GLUCOSE	 FASTING',1,NULL,24,NULL,0.00,'2019-07-28 00:00:00',NULL,0,10,99),(81,'HS-CRP (HIGH SENSITIVITY C-REACTIVE PROTEIN)',1,NULL,24,NULL,0.00,'2019-07-28 00:00:00',NULL,0,10,99),(82,'LIPID PROFILE',1,NULL,24,NULL,0.00,'2019-07-28 00:00:00',NULL,0,10,99),(83,'UREA - SERUM',1,NULL,24,NULL,0.00,'2019-07-28 00:00:00',NULL,0,10,99),(84,'CREATININE SERUM',1,NULL,24,NULL,0.00,'2019-07-28 00:00:00',NULL,0,10,99),(85,'COMPLETE BLOOD COUNT (CBC)',1,NULL,24,NULL,0.00,'2019-07-28 00:00:00',NULL,0,11,99),(86,'GLUCOSE	 FASTING',1,NULL,24,NULL,0.00,'2019-07-28 00:00:00',NULL,0,11,99),(87,'LIPID PROFILE',1,NULL,24,NULL,0.00,'2019-07-28 00:00:00',NULL,0,11,99),(88,'GLUCOSE	 POST PRANDIAL (PP) 2 HOURS (POST MEAL)',1,NULL,24,NULL,0.00,'2019-07-28 00:00:00',NULL,0,11,99),(89,'UREA - SERUM',1,NULL,24,NULL,0.00,'2019-07-28 00:00:00',NULL,0,11,99),(90,'CREATININE SERUM',1,NULL,24,NULL,0.00,'2019-07-28 00:00:00',NULL,0,11,99),(91,'THYROID STIMULATING HORMONE (TSH) SERUM',1,NULL,24,NULL,0.00,'2019-07-28 00:00:00',NULL,0,11,99),(92,'COMPLETE BLOOD COUNT (CBC)',1,NULL,24,NULL,0.00,'2019-07-28 00:00:00',NULL,0,12,99),(93,'GLUCOSE	 FASTING',1,NULL,24,NULL,0.00,'2019-07-28 00:00:00',NULL,0,12,99),(94,'GLUCOSE	 POST PRANDIAL (PP) 2 HOURS (POST MEAL)',1,NULL,24,NULL,0.00,'2019-07-28 00:00:00',NULL,0,12,99),(95,'UREA - SERUM',1,NULL,24,NULL,0.00,'2019-07-28 00:00:00',NULL,0,12,99),(96,'CREATININE SERUM',1,NULL,24,NULL,0.00,'2019-07-28 00:00:00',NULL,0,12,99),(97,'LIPID PROFILE',1,NULL,24,NULL,0.00,'2019-07-28 00:00:00',NULL,0,12,99),(98,'BLOOD GROUP ABO AND RH FACTOR',1,NULL,24,NULL,0.00,'2019-07-28 00:00:00',NULL,0,12,99),(99,'HBA1C GLYCATED HEMOGLOBIN',1,NULL,24,NULL,0.00,'2019-07-28 00:00:00',NULL,0,12,99),(100,'ELECTROLYTES - SERUM',1,NULL,24,NULL,0.00,'2019-07-28 00:00:00',NULL,0,12,99),(101,'THYROID PROFILE (TOTAL T3 TOTAL T4 TSH)',1,NULL,24,NULL,0.00,'2019-07-28 00:00:00',NULL,0,12,99),(102,'LIVER FUNCTION TEST (LFT) WITH GGT',1,NULL,24,NULL,0.00,'2019-07-28 00:00:00',NULL,0,12,99),(103,'HBA1C GLYCATED HEMOGLOBIN',1,NULL,24,NULL,0.00,'2019-07-28 00:00:00',NULL,0,13,99),(104,'LIPID PROFILE',1,NULL,24,NULL,0.00,'2019-07-28 00:00:00',NULL,0,13,99),(105,'LIVER FUNCTION TEST (LFT)',1,NULL,24,NULL,0.00,'2019-07-28 00:00:00',NULL,0,13,99),(106,'RENAL PROFILE/RENAL FUNCTION TEST (RFT/KFT)',1,NULL,24,NULL,0.00,'2019-07-28 00:00:00',NULL,0,13,99),(107,'COMPLETE BLOOD COUNT (CBC)',1,NULL,24,NULL,0.00,'2019-07-28 00:00:00',NULL,0,17,99),(108,'COMPLETE URINE EXAMINATION',2,NULL,24,NULL,0.00,'2019-07-28 00:00:00',NULL,0,17,99),(109,'GLUCOSE	 FASTING',1,NULL,24,NULL,0.00,'2019-07-28 00:00:00',NULL,0,17,99),(110,'GLUCOSE	 POST PRANDIAL (PP) 2 HOURS (POST MEAL)',1,NULL,24,NULL,0.00,'2019-07-28 00:00:00',NULL,0,17,99),(111,'HBA1C GLYCATED HEMOGLOBIN',1,NULL,24,NULL,0.00,'2019-07-28 00:00:00',NULL,0,17,99),(112,'RENAL PROFILE/RENAL FUNCTION TEST (RFT/KFT)',1,NULL,24,NULL,0.00,'2019-07-28 00:00:00',NULL,0,17,99),(113,'LIPID PROFILE',1,NULL,24,NULL,0.00,'2019-07-28 00:00:00',NULL,0,17,99),(114,'LIVER FUNCTION TEST (LFT) WITH GGT',1,NULL,24,NULL,0.00,'2019-07-28 00:00:00',NULL,0,17,99),(115,'COMPLETE BLOOD COUNT (CBC)',1,NULL,24,NULL,0.00,'2019-07-28 00:00:00',NULL,0,18,99),(116,'COMPLETE URINE EXAMINATION',2,NULL,24,NULL,0.00,'2019-07-28 00:00:00',NULL,0,18,99),(117,'GLUCOSE	 FASTING',1,NULL,24,NULL,0.00,'2019-07-28 00:00:00',NULL,0,18,99),(118,'GLUCOSE	 POST PRANDIAL (PP) 2 HOURS (POST MEAL)',1,NULL,24,NULL,0.00,'2019-07-28 00:00:00',NULL,0,18,99),(119,'HBA1C GLYCATED HEMOGLOBIN',1,NULL,24,NULL,0.00,'2019-07-28 00:00:00',NULL,0,18,99),(120,'RENAL PROFILE/RENAL FUNCTION TEST (RFT/KFT)',1,NULL,24,NULL,0.00,'2019-07-28 00:00:00',NULL,0,18,99),(121,'LIPID PROFILE',1,NULL,24,NULL,0.00,'2019-07-28 00:00:00',NULL,0,18,99),(122,'LIVER FUNCTION TEST (LFT) WITH GGT',1,NULL,24,NULL,0.00,'2019-07-28 00:00:00',NULL,0,18,99),(123,'THYROID PROFILE (TOTAL T3 TOTAL T4 TSH)',1,NULL,24,NULL,0.00,'2019-07-28 00:00:00',NULL,0,18,99),(124,'COMPLETE BLOOD COUNT (CBC)',1,NULL,24,NULL,0.00,'2019-07-28 00:00:00',NULL,0,19,99),(125,'COMPLETE URINE EXAMINATION',2,NULL,24,NULL,0.00,'2019-07-28 00:00:00',NULL,0,19,99),(126,'GLUCOSE	 FASTING',1,NULL,24,NULL,0.00,'2019-07-28 00:00:00',NULL,0,19,99),(127,'GLUCOSE	 POST PRANDIAL (PP) 2 HOURS (POST MEAL)',1,NULL,24,NULL,0.00,'2019-07-28 00:00:00',NULL,0,19,99),(128,'HBA1C GLYCATED HEMOGLOBIN',1,NULL,24,NULL,0.00,'2019-07-28 00:00:00',NULL,0,19,99),(129,'RENAL PROFILE/RENAL FUNCTION TEST (RFT/KFT)',1,NULL,24,NULL,0.00,'2019-07-28 00:00:00',NULL,0,19,99),(130,'LIPID PROFILE',1,NULL,24,NULL,0.00,'2019-07-28 00:00:00',NULL,0,19,99),(131,'LIVER FUNCTION TEST (LFT) WITH GGT',1,NULL,24,NULL,0.00,'2019-07-28 00:00:00',NULL,0,19,99),(132,'THYROID PROFILE (TOTAL T3 TOTAL T4 TSH)',1,NULL,24,NULL,0.00,'2019-07-28 00:00:00',NULL,0,19,99),(134,'VITAMIN B12',3,NULL,24,NULL,0.00,'2019-07-28 00:00:00',NULL,0,19,99),(135,'VITAMIN D - 25 HYDROXY (D2+D3)',3,NULL,24,NULL,0.00,'2019-07-28 00:00:00',NULL,0,19,99),(136,'COMPLETE BLOOD COUNT (CBC)',1,NULL,24,NULL,0.00,'2019-07-28 00:00:00',NULL,0,20,99),(137,'COMPLETE URINE EXAMINATION',2,NULL,24,NULL,0.00,'2019-07-28 00:00:00',NULL,0,20,99),(138,'GLUCOSE	 FASTING',1,NULL,24,NULL,0.00,'2019-07-28 00:00:00',NULL,0,20,99),(139,'GLUCOSE	 POST PRANDIAL (PP) 2 HOURS (POST MEAL)',1,NULL,24,NULL,0.00,'2019-07-28 00:00:00',NULL,0,20,99),(140,'HBA1C GLYCATED HEMOGLOBIN',1,NULL,24,NULL,0.00,'2019-07-28 00:00:00',NULL,0,20,99),(141,'RENAL PROFILE/RENAL FUNCTION TEST (RFT/KFT)',1,NULL,24,NULL,0.00,'2019-07-28 00:00:00',NULL,0,20,99),(142,'LIPID PROFILE',1,NULL,24,NULL,0.00,'2019-07-28 00:00:00',NULL,0,20,99),(143,'LIVER FUNCTION TEST (LFT) WITH GGT',1,NULL,24,NULL,0.00,'2019-07-28 00:00:00',NULL,0,20,99),(144,'THYROID PROFILE (TOTAL T3 TOTAL T4 TSH)',1,NULL,24,NULL,0.00,'2019-07-28 00:00:00',NULL,0,20,99),(145,'VITAMIN B12',3,NULL,24,NULL,0.00,'2019-07-28 00:00:00',NULL,0,20,99),(146,'VITAMIN D - 25 HYDROXY (D2+D3)',3,NULL,24,NULL,0.00,'2019-07-28 00:00:00',NULL,0,20,99),(147,'BLOOD GROUP ABO AND RH FACTOR',1,NULL,24,NULL,0.00,'2019-07-28 00:00:00',NULL,0,20,99),(148,'IMMUNOCAP PHADITOP ADULT SCREENING',1,NULL,24,NULL,0.00,'2019-07-28 00:00:00',NULL,0,20,99),(149,'COMPLETE BLOOD COUNT (CBC)',1,NULL,24,NULL,0.00,'2019-07-28 00:00:00',NULL,0,21,99),(150,'COMPLETE URINE EXAMINATION',2,NULL,24,NULL,0.00,'2019-07-28 00:00:00',NULL,0,21,99),(151,'GLUCOSE	 FASTING',1,NULL,24,NULL,0.00,'2019-07-28 00:00:00',NULL,0,21,99),(152,'GLUCOSE	 POST PRANDIAL (PP) 2 HOURS (POST MEAL)',1,NULL,24,NULL,0.00,'2019-07-28 00:00:00',NULL,0,21,99),(153,'HBA1C GLYCATED HEMOGLOBIN',1,NULL,24,NULL,0.00,'2019-07-28 00:00:00',NULL,0,21,99),(154,'RENAL PROFILE/RENAL FUNCTION TEST (RFT/KFT)',1,NULL,24,NULL,0.00,'2019-07-28 00:00:00',NULL,0,21,99),(155,'LIPID PROFILE',1,NULL,24,NULL,0.00,'2019-07-28 00:00:00',NULL,0,21,99),(156,'LIVER FUNCTION TEST (LFT) WITH GGT',1,NULL,24,NULL,0.00,'2019-07-28 00:00:00',NULL,0,21,99),(157,'THYROID PROFILE (TOTAL T3 TOTAL T4 TSH)',1,NULL,24,NULL,0.00,'2019-07-28 00:00:00',NULL,0,21,99),(158,'VITAMIN B12',1,NULL,24,NULL,0.00,'2019-07-28 00:00:00',NULL,0,21,99),(159,'VITAMIN D - 25 HYDROXY (D2+D3)',1,NULL,24,NULL,0.00,'2019-07-28 00:00:00',NULL,0,21,99),(160,'BLOOD GROUP ABO AND RH FACTOR',1,NULL,24,NULL,0.00,'2019-07-28 00:00:00',NULL,0,21,99),(161,'IMMUNOCAP PHADITOP ADULT SCREENING',1,NULL,24,NULL,0.00,'2019-07-28 00:00:00',NULL,0,21,99),(162,'IRON - SERUM',1,NULL,24,NULL,0.00,'2019-07-28 00:00:00',NULL,0,21,99),(163,'TOTAL IRON BINDING CAPACITY ( TIBC) - SERUM',1,NULL,24,NULL,0.00,'2019-07-28 00:00:00',NULL,0,21,99),(164,'ERYTHROCYTE SEDIMENTATION RATE (ESR)',1,NULL,24,NULL,0.00,'2019-07-28 00:00:00',NULL,0,21,99),(165,'MICROALBUMIN ( MAU)- SPOT URINE',2,NULL,24,NULL,0.00,'2019-07-28 00:00:00',NULL,0,21,99),(166,'THYROID PROFILE TOTAL(T3,T4,TSH)',1,NULL,24,NULL,0.00,'2019-07-28 00:00:00',NULL,0,22,99),(167,'FREE T3 (FT3)',1,NULL,24,NULL,0.00,'2019-07-28 00:00:00',NULL,0,22,99),(168,'FREE T4 (FT4)',1,NULL,24,NULL,0.00,'2019-07-28 00:00:00',NULL,0,22,99),(169,'CALCIUM SERUM',1,NULL,24,NULL,0.00,'2019-07-28 00:00:00',NULL,0,22,99),(170,'VITAMIN D - 25 HYDROXY (D2+D3)',3,NULL,24,NULL,0.00,'2019-07-28 00:00:00',NULL,0,23,99),(171,'VITAMIN B12',3,NULL,24,NULL,0.00,'2019-07-28 00:00:00',NULL,0,23,99),(172,'CALCIUM SERUM',1,NULL,24,NULL,0.00,'2019-07-28 00:00:00',NULL,0,23,99),(173,'COMPLETE BLOOD COUNT (CBC)',1,NULL,24,NULL,0.00,'2019-07-28 00:00:00',NULL,0,24,99),(174,'VITAMIN D - 25 HYDROXY (D2+D3)',3,NULL,24,NULL,0.00,'2019-07-28 00:00:00',NULL,0,24,99),(175,'CALCIUM SERUM',1,NULL,24,NULL,0.00,'2019-07-28 00:00:00',NULL,0,24,99),(176,'PHOSPHORUS INORGANIC - SERUM',1,NULL,24,NULL,0.00,'2019-07-28 00:00:00',NULL,0,24,99),(177,'ALKALINE PHOSPHATASE - SERUM',1,NULL,24,NULL,0.00,'2019-07-28 00:00:00',NULL,0,24,99),(178,'ALKALINE PHOSPHATASE - SERUM',1,NULL,24,NULL,0.00,'2019-07-28 00:00:00',NULL,0,25,99),(179,'VITAMIN D - 25 HYDROXY (D2+D3)',1,NULL,24,NULL,0.00,'2019-07-28 00:00:00',NULL,0,25,99),(180,'CALCIUM SERUM',1,NULL,24,NULL,0.00,'2019-07-28 00:00:00',NULL,0,25,99),(181,'PARATHYROID HORMONE [PTH]',1,NULL,24,NULL,0.00,'2019-07-28 00:00:00',NULL,0,25,99),(182,'THYROXINE (T4 TOTAL) SERUM',1,NULL,24,NULL,0.00,'2019-07-28 00:00:00',NULL,0,25,99),(183,'THYROID STIMULATING HORMONE (TSH) SERUM',1,NULL,24,NULL,0.00,'2019-07-28 00:00:00',NULL,0,25,99),(184,'Glucose Fasting',1,NULL,24,NULL,0.00,'2019-07-28 00:00:00',NULL,0,26,99),(185,'URINE R/E',1,NULL,24,NULL,0.00,'2019-07-28 00:00:00',NULL,0,26,99),(186,'BLOOD GROUP ABO AND RH FACTOR',1,NULL,24,NULL,0.00,'2019-07-28 00:00:00',NULL,0,26,99),(187,'HIV I & II',1,NULL,24,NULL,0.00,'2019-07-28 00:00:00',NULL,0,26,99),(188,'HBSAG / AUSTRALIA ANTIGEN',1,NULL,24,NULL,0.00,'2019-07-28 00:00:00',NULL,0,26,99),(189,'ANTI HCV',1,NULL,24,NULL,0.00,'2019-07-28 00:00:00',NULL,0,26,99),(190,'VDRL',1,NULL,24,NULL,0.00,'2019-07-28 00:00:00',NULL,0,26,99),(191,'THALASSEMIA PROFILE',1,NULL,24,NULL,0.00,'2019-07-28 00:00:00',NULL,0,26,99),(192,'CBC',1,NULL,24,NULL,0.00,'2019-07-28 00:00:00',NULL,0,27,99),(193,'BLOOD GROUP ABO AND RH FACTOR',1,NULL,24,NULL,0.00,'2019-07-28 00:00:00',NULL,0,27,99),(194,'HIV I & II',1,NULL,24,NULL,0.00,'2019-07-28 00:00:00',NULL,0,27,99),(195,'HBSAG ',1,NULL,24,NULL,0.00,'2019-07-28 00:00:00',NULL,0,27,99),(196,'VDRL',1,NULL,24,NULL,0.00,'2019-07-28 00:00:00',NULL,0,27,99),(197,'RBS',1,NULL,24,NULL,0.00,'2019-07-28 00:00:00',NULL,0,27,99),(198,'URINE R/E',1,NULL,24,NULL,0.00,'2019-07-28 00:00:00',NULL,0,27,99),(199,'GLUCOSE	 FASTING',1,NULL,24,NULL,0.00,'2019-07-28 00:00:00',NULL,0,28,99),(200,'CBC',1,NULL,24,NULL,0.00,'2019-07-28 00:00:00',NULL,0,28,99),(201,'URINE R/E',1,NULL,24,NULL,0.00,'2019-07-28 00:00:00',NULL,0,28,99),(202,'BLOOD GROUP ABO AND RH FACTOR',1,NULL,24,NULL,0.00,'2019-07-28 00:00:00',NULL,0,28,99),(203,'HIV I & II',1,NULL,24,NULL,0.00,'2019-07-28 00:00:00',NULL,0,28,99),(204,'HBSAG ',1,NULL,24,NULL,0.00,'2019-07-28 00:00:00',NULL,0,28,99),(205,'ANTI HCV',1,NULL,24,NULL,0.00,'2019-07-28 00:00:00',NULL,0,28,99),(206,'VDRL',1,NULL,24,NULL,0.00,'2019-07-28 00:00:00',NULL,0,28,99),(207,'GLUCOSE	 FASTING',1,NULL,24,NULL,0.00,'2019-07-28 00:00:00',NULL,0,29,99),(208,'URINE R/E',1,NULL,24,NULL,0.00,'2019-07-28 00:00:00',NULL,0,29,99),(209,'BLOOD GROUP ABO AND RH FACTOR',1,NULL,24,NULL,0.00,'2019-07-28 00:00:00',NULL,0,29,99),(210,'HIV I & II',1,NULL,24,NULL,0.00,'2019-07-28 00:00:00',NULL,0,29,99),(212,'HBSAG ',1,NULL,24,NULL,0.00,'2019-07-28 00:00:00',NULL,0,29,99),(213,'ANTI HCV',1,NULL,24,NULL,0.00,'2019-07-28 00:00:00',NULL,0,29,99),(214,'VDRL',1,NULL,24,NULL,0.00,'2019-07-28 00:00:00',NULL,0,29,99),(215,'CBC',1,NULL,24,NULL,0.00,'2019-07-28 00:00:00',NULL,0,29,99),(216,'GLUCOSE	 FASTING',1,NULL,24,NULL,0.00,'2019-07-28 00:00:00',NULL,0,30,99),(217,'CBC',1,NULL,24,NULL,0.00,'2019-07-28 00:00:00',NULL,0,30,99),(218,'URINE R/E',2,NULL,24,NULL,0.00,'2019-07-28 00:00:00',NULL,0,30,99),(221,'HIV I & II',1,NULL,24,NULL,0.00,'2019-07-28 00:00:00',NULL,0,30,99),(222,'HBSAG ',1,NULL,24,NULL,0.00,'2019-07-28 00:00:00',NULL,0,30,99),(223,'ANTI HCV',1,NULL,24,NULL,0.00,'2019-07-28 00:00:00',NULL,0,30,99),(224,'VDRL',1,NULL,24,NULL,0.00,'2019-07-28 00:00:00',NULL,0,30,99),(225,'THALASSEMIA PROFILE',1,NULL,24,NULL,0.00,'2019-07-28 00:00:00',NULL,0,30,99),(226,'COMPLETE BLOOD COUNT (CBC)',1,NULL,24,NULL,0.00,'2019-07-28 00:00:00',NULL,0,31,99),(227,'ERYTHROCYTE SEDIMENTATION RATE (ESR)',1,NULL,24,NULL,0.00,'2019-07-28 00:00:00',NULL,0,31,99),(228,'BLOOD GROUP ABO AND RH FACTOR',1,NULL,24,NULL,0.00,'2019-07-28 00:00:00',NULL,0,31,99),(229,'GLUCOSE	 FASTING',1,NULL,24,NULL,0.00,'2019-07-28 00:00:00',NULL,0,31,99),(230,'LIPID PROFILE',1,NULL,24,NULL,0.00,'2019-07-28 00:00:00',NULL,0,31,99),(231,'GLUCOSE	 POST PRANDIAL (PP) 2 HOURS (POST MEAL)',1,NULL,24,NULL,0.00,'2019-07-28 00:00:00',NULL,0,31,99),(232,'HBA1C GLYCATED HEMOGLOBIN',1,NULL,24,NULL,0.00,'2019-07-28 00:00:00',NULL,0,31,99),(233,'RENAL PROFILE/RENAL FUNCTION TEST (RFT/KFT)',1,NULL,24,NULL,0.00,'2019-07-28 00:00:00',NULL,0,31,99),(234,'LIVER FUNCTION TEST (LFT) WITH GGT',1,NULL,24,NULL,0.00,'2019-07-28 00:00:00',NULL,0,31,99),(235,'PROSTATIC SPECIFIC ANTIGEN (PSA TOTAL)',1,NULL,24,NULL,0.00,'2019-07-28 00:00:00',NULL,0,31,99),(236,'COMPLETE URINE EXAMINATION',2,NULL,24,NULL,0.00,'2019-07-28 00:00:00',NULL,0,31,99),(237,'COMPLETE BLOOD COUNT (CBC)',1,NULL,24,NULL,0.00,'2019-07-28 00:00:00',NULL,0,32,99),(238,'ERYTHROCYTE SEDIMENTATION RATE (ESR)',1,NULL,24,NULL,0.00,'2019-07-28 00:00:00',NULL,0,32,99),(239,'BLOOD GROUP ABO AND RH FACTOR',1,NULL,24,NULL,0.00,'2019-07-28 00:00:00',NULL,0,32,99),(240,'LIPID PROFILE',1,NULL,24,NULL,0.00,'2019-07-28 00:00:00',NULL,0,32,99),(241,'GLUCOSE	 FASTING',1,NULL,24,NULL,0.00,'2019-07-28 00:00:00',NULL,0,32,99),(242,'GLUCOSE	 POST PRANDIAL (PP) 2 HOURS (POST MEAL)',1,NULL,24,NULL,0.00,'2019-07-28 00:00:00',NULL,0,32,99),(243,'VITAMIN B12',3,NULL,24,NULL,0.00,'2019-07-28 00:00:00',NULL,0,32,99),(244,'THYROID STIMULATING HORMONE (TSH)',1,NULL,24,NULL,0.00,'2019-07-28 00:00:00',NULL,0,32,99),(245,'VITAMIN D - 25 HYDROXY (D2+D3)',3,NULL,24,NULL,0.00,'2019-07-28 00:00:00',NULL,0,32,99),(247,'COMPLETE URINE EXAMINATION',2,NULL,24,NULL,0.00,'2019-07-28 00:00:00',NULL,0,32,99),(248,'COMPLETE BLOOD COUNT (CBC)',1,NULL,24,NULL,0.00,'2019-07-28 00:00:00',NULL,0,33,99),(249,'COMPLETE URINE EXAMINATION',1,NULL,24,NULL,0.00,'2019-07-28 00:00:00',NULL,0,33,99),(250,'GLUCOSE	 FASTING',1,NULL,24,NULL,0.00,'2019-07-28 00:00:00',NULL,0,33,99),(251,'GLUCOSE	 POST PRANDIAL (PP) 2 HOURS (POST MEAL)',1,NULL,24,NULL,0.00,'2019-07-28 00:00:00',NULL,0,33,99),(252,'UREA - SERUM',1,NULL,24,NULL,0.00,'2019-07-28 00:00:00',NULL,0,33,99),(253,'LIPID PROFILE',1,NULL,24,NULL,0.00,'2019-07-28 00:00:00',NULL,0,33,99),(254,'LIVER FUNCTION TEST (LFT) WITH GGT',1,NULL,24,NULL,0.00,'2019-07-28 00:00:00',NULL,0,33,99),(255,'HBS AG SCREENING(RAPID)',1,NULL,24,NULL,0.00,'2019-07-28 00:00:00',NULL,0,33,99),(256,'URIC ACID - SERUM',1,NULL,24,NULL,0.00,'2019-07-28 00:00:00',NULL,0,33,99),(257,'CREATININE SERUM',1,NULL,24,NULL,0.00,'2019-07-28 00:00:00',NULL,0,33,99),(258,'COMPLETE BLOOD COUNT (CBC)',1,NULL,24,NULL,0.00,'2019-07-28 00:00:00',NULL,0,34,99),(259,'GLUCOSE	 FASTING',1,NULL,24,NULL,0.00,'2019-07-28 00:00:00',NULL,0,34,99),(260,'GLUCOSE	 POST PRANDIAL (PP) 2 HOURS (POST MEAL)',1,NULL,24,NULL,0.00,'2019-07-28 00:00:00',NULL,0,34,99),(261,'LIPID PROFILE',1,NULL,24,NULL,0.00,'2019-07-28 00:00:00',NULL,0,34,99),(262,'UREA - SERUM',1,NULL,24,NULL,0.00,'2019-07-28 00:00:00',NULL,0,34,99),(263,'CREATININE SERUM',1,NULL,24,NULL,0.00,'2019-07-28 00:00:00',NULL,0,34,99),(264,'BLOOD GROUP ABO AND RH FACTOR',1,NULL,24,NULL,0.00,'2019-07-28 00:00:00',NULL,0,34,99),(265,'HBA1C',1,NULL,24,NULL,0.00,'2019-07-28 00:00:00',NULL,0,34,99),(266,'GLYCATED HEMOGLOBIN',1,NULL,24,NULL,0.00,'2019-07-28 00:00:00',NULL,0,34,99),(267,'ELECTROLYTES - SERUM',1,NULL,24,NULL,0.00,'2019-07-28 00:00:00',NULL,0,34,99),(268,'THYROID PROFILE(T3,T4,TSH)',1,NULL,24,NULL,0.00,'2019-07-28 00:00:00',NULL,0,34,99),(269,'LIVER FUNCTION TEST (LFT) WITH GGT',1,NULL,24,NULL,0.00,'2019-07-28 00:00:00',NULL,0,34,99),(219220,'BLOOD GROUP ABO AND RH FACTOR',1,NULL,24,NULL,0.00,'2019-07-28 00:00:00',NULL,0,30,99),(219221,'',1,NULL,0,NULL,0.00,'0000-00-00 00:00:00',NULL,0,NULL,99),(219222,'',1,NULL,0,NULL,0.00,'0000-00-00 00:00:00',NULL,0,NULL,99),(219223,'',1,NULL,0,NULL,0.00,'0000-00-00 00:00:00',NULL,0,NULL,99),(219224,'',1,NULL,0,NULL,0.00,'0000-00-00 00:00:00',NULL,0,NULL,99),(219225,'',1,NULL,0,NULL,0.00,'0000-00-00 00:00:00',NULL,0,NULL,99);
/*!40000 ALTER TABLE `TestMaster` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `UploadedReports`
--

DROP TABLE IF EXISTS `UploadedReports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `UploadedReports` (
  `ID` int(9) NOT NULL AUTO_INCREMENT,
  `UserID` int(9) NOT NULL COMMENT 'UserId of type customer (type =1)',
  `FileName` varchar(50) NOT NULL,
  `FilePath` varchar(1000) DEFAULT NULL,
  `FileType` int(1) DEFAULT '1' COMMENT '1 Medical Report\\n2 Exam Report\\n3 Course Document\\n4 Invoice',
  `UploadedDate` datetime NOT NULL,
  `UploadedBy` int(9) NOT NULL DEFAULT '1' COMMENT 'Employee who uploaded - USERID of type = 3 (employee)',
  `IsDeleted` int(1) NOT NULL DEFAULT '0',
  `CompanyID` int(2) NOT NULL DEFAULT '99',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `FileName_UNIQUE` (`FileName`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `UploadedReports`
--

LOCK TABLES `UploadedReports` WRITE;
/*!40000 ALTER TABLE `UploadedReports` DISABLE KEYS */;
INSERT INTO `UploadedReports` VALUES (1,2,'adharx.pdf','C:\\PROJECTS\\IQHealth\\IqHealth\\IqHealth.WebApi\\Content\\DiagnosticReports\\2/adharx.pdf',1,'2020-02-27 21:54:55',1,0,2),(2,2,'Appoitent.pdf','C:\\PROJECTS\\IQHealth\\IqHealth\\IqHealth.WebApi\\Content\\DiagnosticReports\\2/Appoitent.pdf',1,'2020-02-27 21:57:21',1,0,2),(3,2,'getPolicyCopB.pdf','getPolicyCopB.pdf',1,'2020-02-27 10:42:02',1,0,2),(4,2,'adharx (1).pdf','adharx (1).pdf',1,'2020-02-27 10:42:44',1,0,2),(5,2,'0_01042008-AnnexureI.pdf','0_01042008-AnnexureI.pdf',1,'2020-04-09 23:43:41',1,0,2),(6,2,'1042008-AnnexureI.pdf','1042008-AnnexureI.pdf',1,'2020-04-09 23:51:15',1,0,2);
/*!40000 ALTER TABLE `UploadedReports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `UserMaster`
--

DROP TABLE IF EXISTS `UserMaster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `UserMaster` (
  `ID` int(9) NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(50) NOT NULL,
  `LastName` varchar(50) NOT NULL,
  `UserName` varchar(50) DEFAULT NULL,
  `Email` varchar(150) NOT NULL,
  `DateOfBirth` date DEFAULT NULL,
  `BloodGroup` int(2) DEFAULT NULL,
  `Address` varchar(250) DEFAULT NULL,
  `City` varchar(50) DEFAULT NULL,
  `State` int(2) DEFAULT NULL,
  `UserStatus` int(1) NOT NULL,
  `CreatedDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `UpdatedDate` datetime DEFAULT NULL,
  `IsDeleted` int(1) NOT NULL DEFAULT '0',
  `Password` varchar(20) NOT NULL DEFAULT 'Password123',
  `Mobile` varchar(15) DEFAULT NULL,
  `UserType` int(1) NOT NULL DEFAULT '1',
  `CompanyID` int(2) NOT NULL DEFAULT '99',
  PRIMARY KEY (`ID`),
  KEY `FK_User_Company_ID_idx` (`CompanyID`),
  CONSTRAINT `FK_User_Company_ID` FOREIGN KEY (`CompanyID`) REFERENCES `CompanyMaster` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `UserMaster`
--

LOCK TABLES `UserMaster` WRITE;
/*!40000 ALTER TABLE `UserMaster` DISABLE KEYS */;
INSERT INTO `UserMaster` VALUES (1,'Neeraj','Singh',NULL,'employee@gmail.com',NULL,NULL,'K-93, 2nd Floor, y fyu gjgg j','New Delhi',20,0,'2020-02-28 01:52:13',NULL,0,'Krishna_2012','54354254545354',3,2),(2,'Customer','Singh',NULL,'customer@gmail.com',NULL,NULL,'K-93, 2nd Floor,','New Delhi',29,0,'2020-02-28 01:54:40',NULL,0,'123456','9898987675',1,2);
/*!40000 ALTER TABLE `UserMaster` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'HealthIQ_Dev'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-04-14  6:27:09
