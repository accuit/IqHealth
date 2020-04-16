-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 182.50.133.89:3306
-- Generation Time: Apr 14, 2020 at 07:21 AM
-- Server version: 5.5.51-38.1-log
-- PHP Version: 7.1.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `HealthIQ_Dev`
--

-- --------------------------------------------------------

--
-- Table structure for table `BookingMaster`
--

CREATE TABLE `BookingMaster` (
  `ID` int(9) NOT NULL,
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
  `BookingTime` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `BookingMaster`
--

INSERT INTO `BookingMaster` (`ID`, `FirstName`, `LastName`, `Age`, `Mobile`, `Email`, `Sex`, `BookingDate`, `CollectionType`, `Address`, `City`, `Landmark`, `PinCode`, `CreatedDate`, `IsDeleted`, `Status`, `PackageID`, `TestID`, `CompanyID`, `BookingTime`) VALUES(35, 'Neeraj', 'Singh', 12, '09599660409', 'neer19ultimate@gmail.com', 2, '2019-09-28 00:00:00', 1, 'D- 302 Apex Golf Avenue, Sector 1, Greater Noida West', 'Darjeeling', 'h', '201301', '2019-09-26 20:36:24', 0, 0, 6, NULL, 1, '6 pm');
INSERT INTO `BookingMaster` (`ID`, `FirstName`, `LastName`, `Age`, `Mobile`, `Email`, `Sex`, `BookingDate`, `CollectionType`, `Address`, `City`, `Landmark`, `PinCode`, `CreatedDate`, `IsDeleted`, `Status`, `PackageID`, `TestID`, `CompanyID`, `BookingTime`) VALUES(36, 'neera', 'j', 45, '09599660409', 'neer.s@outlook.com', 2, '2020-01-10 00:00:00', 2, 'D- 302 Apex Golf Avenue, Sector 1, Greater Noida West', 'Haldia', 'rdtcfghv', '201301', '2020-01-29 19:04:55', 0, 0, 11, NULL, 1, '4');
INSERT INTO `BookingMaster` (`ID`, `FirstName`, `LastName`, `Age`, `Mobile`, `Email`, `Sex`, `BookingDate`, `CollectionType`, `Address`, `City`, `Landmark`, `PinCode`, `CreatedDate`, `IsDeleted`, `Status`, `PackageID`, `TestID`, `CompanyID`, `BookingTime`) VALUES(37, 'Neeraj', 'Singh', 54, '09599660409', 'neer19ultimate@gmail.com', 1, '2020-02-21 00:00:00', 2, 'G 202 Skytech Mattrot', 'Noida', 'rd6ftuv', '201301', '2020-02-05 17:38:20', 0, 0, 5, NULL, 2, '10:00 AM - 11:00 AM');
INSERT INTO `BookingMaster` (`ID`, `FirstName`, `LastName`, `Age`, `Mobile`, `Email`, `Sex`, `BookingDate`, `CollectionType`, `Address`, `City`, `Landmark`, `PinCode`, `CreatedDate`, `IsDeleted`, `Status`, `PackageID`, `TestID`, `CompanyID`, `BookingTime`) VALUES(38, 'Neerag', 'Singh', 54, '09599660409', 'neer19ultimate@gmail.com', 1, '2020-02-14 00:00:00', 1, 'G 202 Skytech Mattrot', 'Noida', '76rfuyvjh', '201301', '2020-02-05 17:41:02', 0, 0, 2, NULL, 2, '12:00 AM - 01:00 PM');
INSERT INTO `BookingMaster` (`ID`, `FirstName`, `LastName`, `Age`, `Mobile`, `Email`, `Sex`, `BookingDate`, `CollectionType`, `Address`, `City`, `Landmark`, `PinCode`, `CreatedDate`, `IsDeleted`, `Status`, `PackageID`, `TestID`, `CompanyID`, `BookingTime`) VALUES(39, 'Neeraj', 'Singh', 23, '09599660409', 'neer.s@outlook.com', 1, '2020-02-21 00:00:00', 1, 'D- 302 Apex Golf Avenue, Sector 1, Greater Noida West', 'Noida', 'tcyghv', '201301', '2020-02-05 17:45:00', 0, 0, 4, NULL, 2, '11:00 AM - 12:00 PM');
INSERT INTO `BookingMaster` (`ID`, `FirstName`, `LastName`, `Age`, `Mobile`, `Email`, `Sex`, `BookingDate`, `CollectionType`, `Address`, `City`, `Landmark`, `PinCode`, `CreatedDate`, `IsDeleted`, `Status`, `PackageID`, `TestID`, `CompanyID`, `BookingTime`) VALUES(40, 'Neeraj', 'Singh', 68, '09599660409', 'neer19ultimate@gmail.com', 2, '2020-02-14 00:00:00', 2, 'G 202 Skytech Mattrot', 'Noida', 'tyfgb', '201301', '2020-02-05 17:50:02', 0, 0, 4, NULL, 2, '11:00 AM - 12:00 PM');
INSERT INTO `BookingMaster` (`ID`, `FirstName`, `LastName`, `Age`, `Mobile`, `Email`, `Sex`, `BookingDate`, `CollectionType`, `Address`, `City`, `Landmark`, `PinCode`, `CreatedDate`, `IsDeleted`, `Status`, `PackageID`, `TestID`, `CompanyID`, `BookingTime`) VALUES(41, 'stgdfs dfg dfg dfg ', 'dfg dfg dfgdf gd', 43, '09599660409', 'neer.s@outlook.com', 2, '2020-02-22 00:00:00', 1, 'D- 302 Apex Golf Avenue, Sector 1, Greater Noida West', 'Noida', '34534ewfsd', '201301', '2020-02-05 17:53:42', 0, 0, 4, NULL, 2, '11:00 AM - 12:00 PM');
INSERT INTO `BookingMaster` (`ID`, `FirstName`, `LastName`, `Age`, `Mobile`, `Email`, `Sex`, `BookingDate`, `CollectionType`, `Address`, `City`, `Landmark`, `PinCode`, `CreatedDate`, `IsDeleted`, `Status`, `PackageID`, `TestID`, `CompanyID`, `BookingTime`) VALUES(42, 'Neeraj', 'Singh', 24, '08527818810', 'singh.neer@ymail.com', 1, '2020-03-19 00:00:00', 1, 'G 202 Skytech Mattrot', 'Durgapur', 'werwer', '201301', '2020-03-20 06:49:32', 0, 0, 8, NULL, 1, '12');
INSERT INTO `BookingMaster` (`ID`, `FirstName`, `LastName`, `Age`, `Mobile`, `Email`, `Sex`, `BookingDate`, `CollectionType`, `Address`, `City`, `Landmark`, `PinCode`, `CreatedDate`, `IsDeleted`, `Status`, `PackageID`, `TestID`, `CompanyID`, `BookingTime`) VALUES(43, 'Neera', 'Singh', 21, '08527818810', 'singh.neer@ymail.com', 1, '2020-03-31 00:00:00', 1, 'G 202 Skytech Mattrot', 'Howrah', 'wdsf', '201301', '2020-03-29 10:30:35', 0, 0, 7, NULL, 1, '');

-- --------------------------------------------------------

--
-- Table structure for table `CommonSetup`
--

CREATE TABLE `CommonSetup` (
  `ID` int(9) NOT NULL,
  `MainType` varchar(50) NOT NULL,
  `SubType` varchar(50) DEFAULT NULL,
  `DisplayText` varchar(150) DEFAULT NULL,
  `DisplayValue` int(9) DEFAULT NULL,
  `ParentID` int(9) DEFAULT NULL,
  `isDeleted` int(1) DEFAULT NULL,
  `CompanyID` int(2) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `CommonSetup`
--

INSERT INTO `CommonSetup` (`ID`, `MainType`, `SubType`, `DisplayText`, `DisplayValue`, `ParentID`, `isDeleted`, `CompanyID`) VALUES(1, 'User', 'Type', 'Customer', 1, NULL, 0, 2);
INSERT INTO `CommonSetup` (`ID`, `MainType`, `SubType`, `DisplayText`, `DisplayValue`, `ParentID`, `isDeleted`, `CompanyID`) VALUES(2, 'User', 'Type', 'Employee', 2, NULL, 0, 2);
INSERT INTO `CommonSetup` (`ID`, `MainType`, `SubType`, `DisplayText`, `DisplayValue`, `ParentID`, `isDeleted`, `CompanyID`) VALUES(3, 'User', 'Type', 'Student', 3, NULL, 0, 2);

-- --------------------------------------------------------

--
-- Table structure for table `CompanyMaster`
--

CREATE TABLE `CompanyMaster` (
  `ID` int(2) NOT NULL,
  `Name` varchar(145) NOT NULL,
  `LogoUrl` varchar(1000) DEFAULT NULL,
  `SecondryEmail` varchar(150) NOT NULL,
  `PrimaryEmail` varchar(150) NOT NULL,
  `Address` varchar(500) DEFAULT NULL,
  `BannerUrl` varchar(1000) DEFAULT NULL,
  `About` varchar(1000) DEFAULT NULL,
  `MapUrl` varchar(1000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `CompanyMaster`
--

INSERT INTO `CompanyMaster` (`ID`, `Name`, `LogoUrl`, `SecondryEmail`, `PrimaryEmail`, `Address`, `BannerUrl`, `About`, `MapUrl`) VALUES(1, 'Leela Health Care', 'https://leelahealthcare.com/assets/img/leelahealthcare/LeelaHealthcare-logo.png', '', 'info@leelahealthcare.com', NULL, NULL, NULL, NULL);
INSERT INTO `CompanyMaster` (`ID`, `Name`, `LogoUrl`, `SecondryEmail`, `PrimaryEmail`, `Address`, `BannerUrl`, `About`, `MapUrl`) VALUES(2, 'Health IQ', 'https://health-iq.in/assets/images/logo.jpg', '', 'info@health-iq.in', NULL, NULL, NULL, NULL);
INSERT INTO `CompanyMaster` (`ID`, `Name`, `LogoUrl`, `SecondryEmail`, `PrimaryEmail`, `Address`, `BannerUrl`, `About`, `MapUrl`) VALUES(99, 'Anonymous', NULL, '', '', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ContactUsEnquiry`
--

CREATE TABLE `ContactUsEnquiry` (
  `ID` int(9) NOT NULL,
  `Name` varchar(100) NOT NULL,
  `Mobile` varchar(15) NOT NULL,
  `Email` varchar(150) NOT NULL,
  `Message` varchar(1000) DEFAULT NULL,
  `CreatedDate` datetime NOT NULL,
  `IsDeleted` int(1) NOT NULL,
  `Status` int(1) NOT NULL,
  `CompanyID` int(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ContactUsEnquiry`
--

INSERT INTO `ContactUsEnquiry` (`ID`, `Name`, `Mobile`, `Email`, `Message`, `CreatedDate`, `IsDeleted`, `Status`, `CompanyID`) VALUES(69, 'Neeraj Singh', '8527818810', 'singh.neer@ymail.com', 'ddfd', '2020-04-04 15:40:30', 0, 0, 2);
INSERT INTO `ContactUsEnquiry` (`ID`, `Name`, `Mobile`, `Email`, `Message`, `CreatedDate`, `IsDeleted`, `Status`, `CompanyID`) VALUES(70, 'Neeraj Singh', '0852781881', 'singh.neer@ymail.com', 'gxfcbn ', '2020-04-04 15:42:29', 0, 0, 2);

-- --------------------------------------------------------

--
-- Table structure for table `CorporateTieUpEnquiry`
--

CREATE TABLE `CorporateTieUpEnquiry` (
  `ID` int(9) NOT NULL,
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
  `CompanyID` int(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `CorporateTieUpEnquiry`
--

INSERT INTO `CorporateTieUpEnquiry` (`ID`, `Name`, `Mobile`, `Email`, `CompanyName`, `Designation`, `Address`, `City`, `State`, `Message`, `CreatedDate`, `IsDeleted`, `Status`, `CompanyID`) VALUES(67, 'Neeraj Singh', '08527818810', 'singh.neer@ymail.com', 'CAP Global', 3, NULL, 0, 0, 'nmnb mfb mnsb msdnb msnbg sdbfsdmn bsdfs', '2020-03-28 20:20:00', 0, 0, 2);
INSERT INTO `CorporateTieUpEnquiry` (`ID`, `Name`, `Mobile`, `Email`, `CompanyName`, `Designation`, `Address`, `City`, `State`, `Message`, `CreatedDate`, `IsDeleted`, `Status`, `CompanyID`) VALUES(68, 'Neeraj Singh', '09599660409', 'neer19ultimate@gmail.com', 'CAP Global', 4, NULL, 0, 0, 'sdwd', '2020-04-11 00:35:07', 0, 0, 2);
INSERT INTO `CorporateTieUpEnquiry` (`ID`, `Name`, `Mobile`, `Email`, `CompanyName`, `Designation`, `Address`, `City`, `State`, `Message`, `CreatedDate`, `IsDeleted`, `Status`, `CompanyID`) VALUES(69, 'Neeraj Singh', '08527818810', 'singh.neer@ymail.com', 'CAP Global', 1, NULL, 0, 0, 'chgvjhbknlm;lnbh gygjh klj', '2020-04-11 01:02:56', 0, 0, 2);
INSERT INTO `CorporateTieUpEnquiry` (`ID`, `Name`, `Mobile`, `Email`, `CompanyName`, `Designation`, `Address`, `City`, `State`, `Message`, `CreatedDate`, `IsDeleted`, `Status`, `CompanyID`) VALUES(70, 'Neeraj Singh', '09599660409', 'neer.s@outlook.com', 'CAP Global', 1, NULL, 0, 0, 'h vvh jbjbjhb ', '2020-04-11 01:12:00', 0, 0, 2);
INSERT INTO `CorporateTieUpEnquiry` (`ID`, `Name`, `Mobile`, `Email`, `CompanyName`, `Designation`, `Address`, `City`, `State`, `Message`, `CreatedDate`, `IsDeleted`, `Status`, `CompanyID`) VALUES(71, 'Neeraj Singh', '08527818810', 'singh.neer@ymail.com', 'MERCER', 2, NULL, 0, 0, 'hghg j jb', '2020-04-10 13:45:16', 0, 0, 2);
INSERT INTO `CorporateTieUpEnquiry` (`ID`, `Name`, `Mobile`, `Email`, `CompanyName`, `Designation`, `Address`, `City`, `State`, `Message`, `CreatedDate`, `IsDeleted`, `Status`, `CompanyID`) VALUES(72, 'Neeraj Singh', '08527818810', 'neer.s@outlook.com', 'MERCER', 5, NULL, 0, 0, 'vdfg dfgdfg fd g', '2020-04-10 13:57:43', 0, 0, 2);
INSERT INTO `CorporateTieUpEnquiry` (`ID`, `Name`, `Mobile`, `Email`, `CompanyName`, `Designation`, `Address`, `City`, `State`, `Message`, `CreatedDate`, `IsDeleted`, `Status`, `CompanyID`) VALUES(73, 'Neeraj Singh', '08527818810', 'singh.neer@ymail.com', 'CAP Global', 2, NULL, 0, 0, 'retxcfhgvj ,m', '2020-04-10 14:37:28', 0, 0, 2);

-- --------------------------------------------------------

--
-- Table structure for table `CourseCurriculum`
--

CREATE TABLE `CourseCurriculum` (
  `ID` int(9) NOT NULL,
  `Name` varchar(250) NOT NULL,
  `CourseMasterID` int(9) NOT NULL,
  `SubCourcesID` int(9) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `CourseCurriculum`
--

INSERT INTO `CourseCurriculum` (`ID`, `Name`, `CourseMasterID`, `SubCourcesID`) VALUES(1, 'Introduction to patient care, lab technology & equipment.', 1, NULL);
INSERT INTO `CourseCurriculum` (`ID`, `Name`, `CourseMasterID`, `SubCourcesID`) VALUES(2, 'Role of Medical Lab Technician', 1, NULL);
INSERT INTO `CourseCurriculum` (`ID`, `Name`, `CourseMasterID`, `SubCourcesID`) VALUES(3, 'Basic pathology & diagnostic techniques', 1, NULL);
INSERT INTO `CourseCurriculum` (`ID`, `Name`, `CourseMasterID`, `SubCourcesID`) VALUES(4, 'Introduction to patient care, physiotherapy', 2, NULL);
INSERT INTO `CourseCurriculum` (`ID`, `Name`, `CourseMasterID`, `SubCourcesID`) VALUES(5, 'Role of Physiotherapist', 2, NULL);
INSERT INTO `CourseCurriculum` (`ID`, `Name`, `CourseMasterID`, `SubCourcesID`) VALUES(6, 'Basic anatomy & physiology', 3, NULL);
INSERT INTO `CourseCurriculum` (`ID`, `Name`, `CourseMasterID`, `SubCourcesID`) VALUES(7, 'Understanding body mechanics', 4, NULL);
INSERT INTO `CourseCurriculum` (`ID`, `Name`, `CourseMasterID`, `SubCourcesID`) VALUES(8, 'Introduction to nutrition', 5, NULL);
INSERT INTO `CourseCurriculum` (`ID`, `Name`, `CourseMasterID`, `SubCourcesID`) VALUES(9, 'Basic & clinical biochemistry', 1, NULL);
INSERT INTO `CourseCurriculum` (`ID`, `Name`, `CourseMasterID`, `SubCourcesID`) VALUES(10, 'Basic & systemic medical microbiology', 1, NULL);
INSERT INTO `CourseCurriculum` (`ID`, `Name`, `CourseMasterID`, `SubCourcesID`) VALUES(11, 'Basic hematology, immunology, parasitology, histology, &', 1, NULL);
INSERT INTO `CourseCurriculum` (`ID`, `Name`, `CourseMasterID`, `SubCourcesID`) VALUES(12, 'Blood banking, phlebotomy and handling special samples', 1, NULL);
INSERT INTO `CourseCurriculum` (`ID`, `Name`, `CourseMasterID`, `SubCourcesID`) VALUES(13, 'Fine needle aspiration technique', 1, NULL);
INSERT INTO `CourseCurriculum` (`ID`, `Name`, `CourseMasterID`, `SubCourcesID`) VALUES(14, 'Storage & transportation of samples', 1, NULL);
INSERT INTO `CourseCurriculum` (`ID`, `Name`, `CourseMasterID`, `SubCourcesID`) VALUES(15, 'Lab information management system', 1, NULL);
INSERT INTO `CourseCurriculum` (`ID`, `Name`, `CourseMasterID`, `SubCourcesID`) VALUES(16, 'Biomedical waste management', 1, NULL);
INSERT INTO `CourseCurriculum` (`ID`, `Name`, `CourseMasterID`, `SubCourcesID`) VALUES(17, 'Infection control', 1, NULL);
INSERT INTO `CourseCurriculum` (`ID`, `Name`, `CourseMasterID`, `SubCourcesID`) VALUES(18, 'Maintenance & cleaning of lab equipment', 1, NULL);
INSERT INTO `CourseCurriculum` (`ID`, `Name`, `CourseMasterID`, `SubCourcesID`) VALUES(19, 'Personnel Hygiene and Safety & First Aid', 1, NULL);
INSERT INTO `CourseCurriculum` (`ID`, `Name`, `CourseMasterID`, `SubCourcesID`) VALUES(20, 'Patient\'s Rights & Responsibilities', 1, NULL);
INSERT INTO `CourseCurriculum` (`ID`, `Name`, `CourseMasterID`, `SubCourcesID`) VALUES(21, 'Professional Behavior in Healthcare Setting', 1, NULL);
INSERT INTO `CourseCurriculum` (`ID`, `Name`, `CourseMasterID`, `SubCourcesID`) VALUES(22, 'Human Anatomy', 2, NULL);
INSERT INTO `CourseCurriculum` (`ID`, `Name`, `CourseMasterID`, `SubCourcesID`) VALUES(23, 'Human Physiology', 2, NULL);
INSERT INTO `CourseCurriculum` (`ID`, `Name`, `CourseMasterID`, `SubCourcesID`) VALUES(24, 'Pathology', 2, NULL);
INSERT INTO `CourseCurriculum` (`ID`, `Name`, `CourseMasterID`, `SubCourcesID`) VALUES(25, 'Pharmacology', 2, NULL);
INSERT INTO `CourseCurriculum` (`ID`, `Name`, `CourseMasterID`, `SubCourcesID`) VALUES(26, 'Psychology', 2, NULL);
INSERT INTO `CourseCurriculum` (`ID`, `Name`, `CourseMasterID`, `SubCourcesID`) VALUES(27, 'Medical and Surgical Conditions', 2, NULL);
INSERT INTO `CourseCurriculum` (`ID`, `Name`, `CourseMasterID`, `SubCourcesID`) VALUES(28, 'Biomechanics', 2, NULL);
INSERT INTO `CourseCurriculum` (`ID`, `Name`, `CourseMasterID`, `SubCourcesID`) VALUES(29, 'Kineseology', 2, NULL);
INSERT INTO `CourseCurriculum` (`ID`, `Name`, `CourseMasterID`, `SubCourcesID`) VALUES(30, 'Disability prevention', 2, NULL);
INSERT INTO `CourseCurriculum` (`ID`, `Name`, `CourseMasterID`, `SubCourcesID`) VALUES(31, 'Rehabilitation', 2, NULL);
INSERT INTO `CourseCurriculum` (`ID`, `Name`, `CourseMasterID`, `SubCourcesID`) VALUES(32, 'Personnel Hygiene and Safety & First Aid', 2, NULL);
INSERT INTO `CourseCurriculum` (`ID`, `Name`, `CourseMasterID`, `SubCourcesID`) VALUES(33, 'Patient\'s Rights & Responsibilities', 2, NULL);
INSERT INTO `CourseCurriculum` (`ID`, `Name`, `CourseMasterID`, `SubCourcesID`) VALUES(34, 'Professional Behaviour in Healthcare Setting', 2, NULL);
INSERT INTO `CourseCurriculum` (`ID`, `Name`, `CourseMasterID`, `SubCourcesID`) VALUES(35, 'General health & hygiene', 3, NULL);
INSERT INTO `CourseCurriculum` (`ID`, `Name`, `CourseMasterID`, `SubCourcesID`) VALUES(36, 'Understanding hospitals & the healthcare system', 3, NULL);
INSERT INTO `CourseCurriculum` (`ID`, `Name`, `CourseMasterID`, `SubCourcesID`) VALUES(37, 'Special skin care for radiotherapy, pressure sores', 3, NULL);
INSERT INTO `CourseCurriculum` (`ID`, `Name`, `CourseMasterID`, `SubCourcesID`) VALUES(38, 'Caring for the visually impaired', 3, NULL);
INSERT INTO `CourseCurriculum` (`ID`, `Name`, `CourseMasterID`, `SubCourcesID`) VALUES(39, 'Role of a patient care assistant', 3, NULL);
INSERT INTO `CourseCurriculum` (`ID`, `Name`, `CourseMasterID`, `SubCourcesID`) VALUES(40, 'Daily care for a patient', 3, NULL);
INSERT INTO `CourseCurriculum` (`ID`, `Name`, `CourseMasterID`, `SubCourcesID`) VALUES(41, 'Administering drugs as per prescriptions', 3, NULL);
INSERT INTO `CourseCurriculum` (`ID`, `Name`, `CourseMasterID`, `SubCourcesID`) VALUES(42, 'Basic nursing skills', 3, NULL);
INSERT INTO `CourseCurriculum` (`ID`, `Name`, `CourseMasterID`, `SubCourcesID`) VALUES(43, 'Disposal of medical waste', 3, NULL);
INSERT INTO `CourseCurriculum` (`ID`, `Name`, `CourseMasterID`, `SubCourcesID`) VALUES(44, 'Understanding body mechanics', 3, NULL);
INSERT INTO `CourseCurriculum` (`ID`, `Name`, `CourseMasterID`, `SubCourcesID`) VALUES(45, 'Patient handling, lifting, and moving patients', 3, NULL);
INSERT INTO `CourseCurriculum` (`ID`, `Name`, `CourseMasterID`, `SubCourcesID`) VALUES(46, 'Fall prevention care and restraints', 3, NULL);
INSERT INTO `CourseCurriculum` (`ID`, `Name`, `CourseMasterID`, `SubCourcesID`) VALUES(47, 'Emergency first aid and CPR', 3, NULL);
INSERT INTO `CourseCurriculum` (`ID`, `Name`, `CourseMasterID`, `SubCourcesID`) VALUES(48, 'Macronutrients', 5, NULL);
INSERT INTO `CourseCurriculum` (`ID`, `Name`, `CourseMasterID`, `SubCourcesID`) VALUES(49, 'Micronutrients', 5, NULL);
INSERT INTO `CourseCurriculum` (`ID`, `Name`, `CourseMasterID`, `SubCourcesID`) VALUES(50, 'Nutritional Assessment', 5, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `CourseEligibility`
--

CREATE TABLE `CourseEligibility` (
  `ID` int(9) NOT NULL,
  `Qualification` varchar(500) NOT NULL DEFAULT '10th',
  `MinAge` int(2) NOT NULL DEFAULT '15',
  `MaxAge` int(2) NOT NULL DEFAULT '99',
  `Duration` int(2) DEFAULT '0',
  `Certification` varchar(500) DEFAULT NULL,
  `InternshipDuration` int(2) DEFAULT NULL,
  `CourseMasterID` int(9) DEFAULT NULL,
  `IsDeleted` int(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `CourseMaster`
--

CREATE TABLE `CourseMaster` (
  `ID` int(9) NOT NULL,
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
  `ImageUrl` varchar(1000) NOT NULL DEFAULT 'assets/images/academy/courses/courses.jpg'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `CourseMaster`
--

INSERT INTO `CourseMaster` (`ID`, `Name`, `About`, `IsDeleted`, `CompanyID`, `Qualification`, `MinAge`, `MaxAge`, `Duration`, `Certification`, `InternshipDuration`, `ImageUrl`) VALUES(1, 'Medical Lab Technician', 'Medical Lab Technicians are important members of any clinical laboratory team. Medical Lab Technicians analyze fluid, tissues and blood samples to perform a variety of diagnoses. Additionally, students from this course are trained to clean and maintain lab equipment, manage biomedical waste and adhere to quality control standards as per the NABL regulations. They generally work under the supervision of a pathologist.', 0, 2, '10th / Madhyamik passed. 10+2 pass is preferable', 17, 99, 2, 'Bharat Sevak Samaj (promoted by Planning Commission, GOI)', 6, 'assets/images/academy/courses/1.jpg');
INSERT INTO `CourseMaster` (`ID`, `Name`, `About`, `IsDeleted`, `CompanyID`, `Qualification`, `MinAge`, `MaxAge`, `Duration`, `Certification`, `InternshipDuration`, `ImageUrl`) VALUES(2, 'Physiotherapy', 'Physiotherapists are trained professionals working in health care. They are trained to restore mobility, alleviate pain and suffering and work to prevent permanent disability in patients. The job of a physical therapist is preventive, restorative and rehabilitative.', 0, 2, '10th / Madhyamik passed. 10+2 pass is preferable.', 17, 99, 2, 'Bharat Sevak Samaj (promoted by Planning Commission, GOI)', NULL, 'assets/images/academy/courses/2.jpg');
INSERT INTO `CourseMaster` (`ID`, `Name`, `About`, `IsDeleted`, `CompanyID`, `Qualification`, `MinAge`, `MaxAge`, `Duration`, `Certification`, `InternshipDuration`, `ImageUrl`) VALUES(3, 'General Duty Assistant (Nursing)', 'This course trains students to work as nursing aides in hospitals and home care scenarios and they can also provide basic nursing care. They are taught to support nurses and also directly handle ill patients who are unable to look after themselves in both hospital and home care settings.', 0, 2, '10th / Madhyamik passed. 10+2 pass is preferable.', 17, 30, 2, 'Bharat Sevak Samaj (promoted by Planning Commission, GOI)', 6, 'assets/images/academy/courses/3.jpg');
INSERT INTO `CourseMaster` (`ID`, `Name`, `About`, `IsDeleted`, `CompanyID`, `Qualification`, `MinAge`, `MaxAge`, `Duration`, `Certification`, `InternshipDuration`, `ImageUrl`) VALUES(4, 'E.C.G. Technician', 'This course trains students in Emergency situation to detect whether the illness is due to Cardiac problem or else, Use of E.C.G. Machine of different makes & Models- Manual, Semi-Auto & Fully Auto, To carry out E.C.G. on pacemaker patient, Determination of heart beats, Axis, Cardiac Arrhythmias, Ventricular status, Interpretation of normal and abnormal E.C.G, Indication of E.C.G. recording, Requirement of Halter Study & Doppler study, TMT etc.', 0, 2, '10th / Matric / Madhyamik passed', 18, 99, 1, 'Bharat Sevak Samaj (promoted by Planning Commission, GOI)', NULL, 'assets/images/academy/courses/4.jpg');
INSERT INTO `CourseMaster` (`ID`, `Name`, `About`, `IsDeleted`, `CompanyID`, `Qualification`, `MinAge`, `MaxAge`, `Duration`, `Certification`, `InternshipDuration`, `ImageUrl`) VALUES(5, 'Diet & Nutrition', 'The focus of the programme is to enable you to make the best possible choice for meeting the nutritional needs of your family. The student will learn various concepts in nutrition, the role of nutrients such as carbohydrates, lipids, proteins, vitamins, and minerals, including their sources, requirements, functions, and roles in health. It also includes guidelines for nutrition, dietary reference intakes, dietary guidelines for Indians, and basics of nutritional assessment methods.', 0, 2, '10th / Madhyamik passed. 10+2 pass is preferable.', 18, 99, 1, 'Bharat Sevak Samaj (promoted by Planning Commission, GOI)', NULL, 'assets/images/academy/courses/5.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `DoctorAppointment`
--

CREATE TABLE `DoctorAppointment` (
  `ID` int(9) NOT NULL,
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
  `CompanyID` int(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `DoctorAppointment`
--

INSERT INTO `DoctorAppointment` (`ID`, `Name`, `Age`, `Mobile`, `Email`, `Sex`, `BookingDate`, `BookingTime`, `DoctorID`, `CreatedDate`, `IsDeleted`, `Status`, `HospitalID`, `CompanyID`) VALUES(35, 'Neeraj Singh', 21, '09599660409', 'neer19ultimate@gmail.com', 1, '2019-09-28 00:00:00', '2 pm', 9, '2019-09-26 20:53:27', 0, 1, NULL, 1);
INSERT INTO `DoctorAppointment` (`ID`, `Name`, `Age`, `Mobile`, `Email`, `Sex`, `BookingDate`, `BookingTime`, `DoctorID`, `CreatedDate`, `IsDeleted`, `Status`, `HospitalID`, `CompanyID`) VALUES(36, 'Neeraj Singh', 43, '09599660409', 'neer19ultimate@gmail.com', 1, '2019-09-28 00:00:00', '12:00 AM - 01:00 PM', 4, '2019-09-27 23:30:23', 0, 1, NULL, NULL);
INSERT INTO `DoctorAppointment` (`ID`, `Name`, `Age`, `Mobile`, `Email`, `Sex`, `BookingDate`, `BookingTime`, `DoctorID`, `CreatedDate`, `IsDeleted`, `Status`, `HospitalID`, `CompanyID`) VALUES(37, 'Neeraj Singh', 12, '08527818810', 'singh.neer@ymail.com', 1, '2020-01-09 00:00:00', '10:00 AM - 11:00 AM', 6, '2020-01-17 21:35:50', 0, 1, NULL, 2);
INSERT INTO `DoctorAppointment` (`ID`, `Name`, `Age`, `Mobile`, `Email`, `Sex`, `BookingDate`, `BookingTime`, `DoctorID`, `CreatedDate`, `IsDeleted`, `Status`, `HospitalID`, `CompanyID`) VALUES(38, 'Neeraj Singh', 34, '08527818810', 'singh.neer@ymail.com', 1, '2020-01-24 00:00:00', '10:00 AM - 11:00 AM', 5, '2020-01-17 22:11:20', 0, 1, NULL, 2);
INSERT INTO `DoctorAppointment` (`ID`, `Name`, `Age`, `Mobile`, `Email`, `Sex`, `BookingDate`, `BookingTime`, `DoctorID`, `CreatedDate`, `IsDeleted`, `Status`, `HospitalID`, `CompanyID`) VALUES(39, 'Neeraj Singh', 32, 'iwuegriuy29384y', 'neer19ultimate@gmail.com', 1, '2020-01-30 00:00:00', '11:00 AM - 12:00 PM', 4, '2020-01-20 23:01:34', 0, 1, NULL, 2);
INSERT INTO `DoctorAppointment` (`ID`, `Name`, `Age`, `Mobile`, `Email`, `Sex`, `BookingDate`, `BookingTime`, `DoctorID`, `CreatedDate`, `IsDeleted`, `Status`, `HospitalID`, `CompanyID`) VALUES(40, 'Neeraj Singh', 32, '9834y892y35', 'neer19@ugma.com', 1, '2011-09-29 00:00:00', '12:00 AM - 01:00 PM', 12, '2020-01-20 23:03:24', 0, 1, NULL, NULL);
INSERT INTO `DoctorAppointment` (`ID`, `Name`, `Age`, `Mobile`, `Email`, `Sex`, `BookingDate`, `BookingTime`, `DoctorID`, `CreatedDate`, `IsDeleted`, `Status`, `HospitalID`, `CompanyID`) VALUES(41, 'Neeraj Singh', 43, '3425435345345', 'neer19@gmail.com', 1, '2020-01-17 00:00:00', '10:00 AM - 11:00 AM', 12, '2020-01-20 23:12:06', 0, 1, NULL, 2);
INSERT INTO `DoctorAppointment` (`ID`, `Name`, `Age`, `Mobile`, `Email`, `Sex`, `BookingDate`, `BookingTime`, `DoctorID`, `CreatedDate`, `IsDeleted`, `Status`, `HospitalID`, `CompanyID`) VALUES(42, 'neeraj', 46, '9823923863', 'neer19ultimate@gmailcion', 1, '2020-01-24 00:00:00', '12:00 AM - 01:00 PM', 6, '2020-01-20 23:27:58', 0, 1, NULL, NULL);
INSERT INTO `DoctorAppointment` (`ID`, `Name`, `Age`, `Mobile`, `Email`, `Sex`, `BookingDate`, `BookingTime`, `DoctorID`, `CreatedDate`, `IsDeleted`, `Status`, `HospitalID`, `CompanyID`) VALUES(43, 'Neeraj', 54, '8392983823', 'kbsdfksbdfk@kjaf.com', 1, '2020-01-24 00:00:00', '10:00 AM - 11:00 AM', 6, '2020-01-20 23:29:06', 0, 1, NULL, NULL);
INSERT INTO `DoctorAppointment` (`ID`, `Name`, `Age`, `Mobile`, `Email`, `Sex`, `BookingDate`, `BookingTime`, `DoctorID`, `CreatedDate`, `IsDeleted`, `Status`, `HospitalID`, `CompanyID`) VALUES(44, 'Neeraj Singh', 54, '8283482323', 'neer@hmail.com', 1, '2020-02-07 00:00:00', '11:00 AM - 12:00 PM', 12, '2020-01-20 23:37:53', 0, 1, NULL, 2);
INSERT INTO `DoctorAppointment` (`ID`, `Name`, `Age`, `Mobile`, `Email`, `Sex`, `BookingDate`, `BookingTime`, `DoctorID`, `CreatedDate`, `IsDeleted`, `Status`, `HospitalID`, `CompanyID`) VALUES(45, 'Neeraj Singh', 43, '9393727837', 'neer@gmail.com', 1, '2020-01-22 00:00:00', '01:00 PM - 02:00 PM', 4, '2020-01-20 23:40:08', 0, 1, NULL, NULL);
INSERT INTO `DoctorAppointment` (`ID`, `Name`, `Age`, `Mobile`, `Email`, `Sex`, `BookingDate`, `BookingTime`, `DoctorID`, `CreatedDate`, `IsDeleted`, `Status`, `HospitalID`, `CompanyID`) VALUES(46, 'Neeraj Singh', 43, '84862384686', 'neer@gmail.om', 1, '2020-01-16 00:00:00', '10:00 AM - 11:00 AM', 5, '2020-01-20 23:54:38', 0, 1, NULL, 2);
INSERT INTO `DoctorAppointment` (`ID`, `Name`, `Age`, `Mobile`, `Email`, `Sex`, `BookingDate`, `BookingTime`, `DoctorID`, `CreatedDate`, `IsDeleted`, `Status`, `HospitalID`, `CompanyID`) VALUES(47, 'Neeraj Singh', 23, '09599660409', 'neer.s@outlook.com', 1, '2020-01-02 00:00:00', '12', 12, '2020-01-29 14:39:16', 0, 1, NULL, 1);
INSERT INTO `DoctorAppointment` (`ID`, `Name`, `Age`, `Mobile`, `Email`, `Sex`, `BookingDate`, `BookingTime`, `DoctorID`, `CreatedDate`, `IsDeleted`, `Status`, `HospitalID`, `CompanyID`) VALUES(48, 'Neeraj Singh', 23, '09599660409', 'neer.s@outlook.com', 1, '2020-01-02 00:00:00', '12', 12, '2020-01-29 14:51:35', 0, 1, NULL, 1);
INSERT INTO `DoctorAppointment` (`ID`, `Name`, `Age`, `Mobile`, `Email`, `Sex`, `BookingDate`, `BookingTime`, `DoctorID`, `CreatedDate`, `IsDeleted`, `Status`, `HospitalID`, `CompanyID`) VALUES(49, 'Neeraj Singh', 99, '08527818810', 'singh.neer@ymail.com', 1, '2020-02-05 00:00:00', '11:00 AM - 12:00 PM', 5, '2020-02-03 19:22:30', 0, 1, NULL, NULL);
INSERT INTO `DoctorAppointment` (`ID`, `Name`, `Age`, `Mobile`, `Email`, `Sex`, `BookingDate`, `BookingTime`, `DoctorID`, `CreatedDate`, `IsDeleted`, `Status`, `HospitalID`, `CompanyID`) VALUES(50, 'Neeraj Singh', 65, '08527818810', 'singh.neer@ymail.com', 1, '2020-02-13 00:00:00', '10:00 AM - 11:00 AM', 12, '2020-02-03 19:25:47', 0, 1, NULL, NULL);
INSERT INTO `DoctorAppointment` (`ID`, `Name`, `Age`, `Mobile`, `Email`, `Sex`, `BookingDate`, `BookingTime`, `DoctorID`, `CreatedDate`, `IsDeleted`, `Status`, `HospitalID`, `CompanyID`) VALUES(51, 'Neeraj Singh', 23, '08527818810', 'singh.neer@ymail.com', 2, '2020-02-11 00:00:00', '01:00 PM - 02:00 PM', 12, '2020-02-05 12:11:36', 0, 1, NULL, 2);
INSERT INTO `DoctorAppointment` (`ID`, `Name`, `Age`, `Mobile`, `Email`, `Sex`, `BookingDate`, `BookingTime`, `DoctorID`, `CreatedDate`, `IsDeleted`, `Status`, `HospitalID`, `CompanyID`) VALUES(52, 'Neeraj Singh', 56, '08527818810', 'singh.neer@ymail.com', 1, '2020-02-12 00:00:00', '10:00 AM - 11:00 AM', 5, '2020-02-05 12:15:44', 0, 1, NULL, 2);
INSERT INTO `DoctorAppointment` (`ID`, `Name`, `Age`, `Mobile`, `Email`, `Sex`, `BookingDate`, `BookingTime`, `DoctorID`, `CreatedDate`, `IsDeleted`, `Status`, `HospitalID`, `CompanyID`) VALUES(53, 'Neeraj Singh', 45, '08527818810', 'singh.neer@ymail.com', 1, '2020-02-21 00:00:00', '12:00 AM - 01:00 PM', 12, '2020-02-05 14:49:39', 0, 1, NULL, 2);
INSERT INTO `DoctorAppointment` (`ID`, `Name`, `Age`, `Mobile`, `Email`, `Sex`, `BookingDate`, `BookingTime`, `DoctorID`, `CreatedDate`, `IsDeleted`, `Status`, `HospitalID`, `CompanyID`) VALUES(54, 'Neeraj Singh', 54, '08527818810', 'singh.neer@ymail.com', 1, '2020-02-05 00:00:00', '09:00 AM - 10:00 AM', 7, '2020-02-05 17:21:52', 0, 1, NULL, 2);
INSERT INTO `DoctorAppointment` (`ID`, `Name`, `Age`, `Mobile`, `Email`, `Sex`, `BookingDate`, `BookingTime`, `DoctorID`, `CreatedDate`, `IsDeleted`, `Status`, `HospitalID`, `CompanyID`) VALUES(55, 'Neeraj Singh', 12, '08527818810', 'singh.neer@ymail.com', 2, '2020-02-13 00:00:00', '12:00 AM - 01:00 PM', 10, '2020-02-05 17:24:07', 0, 1, NULL, 2);
INSERT INTO `DoctorAppointment` (`ID`, `Name`, `Age`, `Mobile`, `Email`, `Sex`, `BookingDate`, `BookingTime`, `DoctorID`, `CreatedDate`, `IsDeleted`, `Status`, `HospitalID`, `CompanyID`) VALUES(56, 'Neeraj Singh', 65, '08527818810', 'singh.neer@ymail.com', 1, '2020-02-20 00:00:00', '01:00 PM - 02:00 PM', 10, '2020-02-05 17:31:03', 0, 1, NULL, 2);
INSERT INTO `DoctorAppointment` (`ID`, `Name`, `Age`, `Mobile`, `Email`, `Sex`, `BookingDate`, `BookingTime`, `DoctorID`, `CreatedDate`, `IsDeleted`, `Status`, `HospitalID`, `CompanyID`) VALUES(57, 'Neeraj Singh', 21, '09599660409', 'neer19ultimate@gmail.com', 1, '2020-02-10 00:00:00', '12:00 AM - 01:00 PM', 12, '2020-02-05 18:56:17', 0, 1, NULL, 2);
INSERT INTO `DoctorAppointment` (`ID`, `Name`, `Age`, `Mobile`, `Email`, `Sex`, `BookingDate`, `BookingTime`, `DoctorID`, `CreatedDate`, `IsDeleted`, `Status`, `HospitalID`, `CompanyID`) VALUES(58, 'Neeraj Singh', 23, '08527818810', 'singh.neer@ymail.com', 1, '2020-02-11 00:00:00', '01:00 PM - 02:00 PM', 10, '2020-02-05 18:57:09', 0, 1, NULL, 2);
INSERT INTO `DoctorAppointment` (`ID`, `Name`, `Age`, `Mobile`, `Email`, `Sex`, `BookingDate`, `BookingTime`, `DoctorID`, `CreatedDate`, `IsDeleted`, `Status`, `HospitalID`, `CompanyID`) VALUES(59, 'Neeraj Singh', 23, '08527818810', 'singh.neer@ymail.com', 1, '2020-02-26 00:00:00', '02:00 PM - 03:00 PM', 12, '2020-02-05 18:58:34', 0, 1, NULL, 2);
INSERT INTO `DoctorAppointment` (`ID`, `Name`, `Age`, `Mobile`, `Email`, `Sex`, `BookingDate`, `BookingTime`, `DoctorID`, `CreatedDate`, `IsDeleted`, `Status`, `HospitalID`, `CompanyID`) VALUES(60, 'Neeraj Singh', 65, '09599660409', 'neer19ultimate@gmail.com', 2, '2020-01-29 00:00:00', '01:00 PM - 02:00 PM', 7, '2020-02-05 19:00:01', 0, 1, NULL, 2);
INSERT INTO `DoctorAppointment` (`ID`, `Name`, `Age`, `Mobile`, `Email`, `Sex`, `BookingDate`, `BookingTime`, `DoctorID`, `CreatedDate`, `IsDeleted`, `Status`, `HospitalID`, `CompanyID`) VALUES(61, 'Neeraj Singh', 65, '09599660409', 'neer19ultimate@gmail.com', 2, '2020-01-29 00:00:00', '01:00 PM - 02:00 PM', 7, '2020-02-05 19:00:25', 0, 1, NULL, 2);
INSERT INTO `DoctorAppointment` (`ID`, `Name`, `Age`, `Mobile`, `Email`, `Sex`, `BookingDate`, `BookingTime`, `DoctorID`, `CreatedDate`, `IsDeleted`, `Status`, `HospitalID`, `CompanyID`) VALUES(62, 'Neeraj Singh', 65, '09599660409', 'neer19ultimate@gmail.com', 2, '2020-01-29 00:00:00', '01:00 PM - 02:00 PM', 7, '2020-02-05 19:00:42', 0, 1, NULL, 2);
INSERT INTO `DoctorAppointment` (`ID`, `Name`, `Age`, `Mobile`, `Email`, `Sex`, `BookingDate`, `BookingTime`, `DoctorID`, `CreatedDate`, `IsDeleted`, `Status`, `HospitalID`, `CompanyID`) VALUES(63, 'Neeraj Singh', 54, '08527818810', 'singh.neer@ymail.com', 1, '2020-02-19 00:00:00', '10:00 AM - 11:00 AM', 5, '2020-02-05 19:02:47', 0, 1, NULL, 2);
INSERT INTO `DoctorAppointment` (`ID`, `Name`, `Age`, `Mobile`, `Email`, `Sex`, `BookingDate`, `BookingTime`, `DoctorID`, `CreatedDate`, `IsDeleted`, `Status`, `HospitalID`, `CompanyID`) VALUES(64, 'Neeraj Singh', 65, '08527818810', 'singh.neer@ymail.com', 1, '2020-02-20 00:00:00', '11:00 AM - 12:00 PM', 12, '2020-02-05 19:10:32', 0, 1, NULL, 2);
INSERT INTO `DoctorAppointment` (`ID`, `Name`, `Age`, `Mobile`, `Email`, `Sex`, `BookingDate`, `BookingTime`, `DoctorID`, `CreatedDate`, `IsDeleted`, `Status`, `HospitalID`, `CompanyID`) VALUES(65, 'Neeraj Singh', 76, '08527818810', 'singh.neer@ymail.com', 2, '2020-02-20 00:00:00', '01:00 PM - 02:00 PM', 12, '2020-02-05 19:12:02', 0, 1, NULL, 2);
INSERT INTO `DoctorAppointment` (`ID`, `Name`, `Age`, `Mobile`, `Email`, `Sex`, `BookingDate`, `BookingTime`, `DoctorID`, `CreatedDate`, `IsDeleted`, `Status`, `HospitalID`, `CompanyID`) VALUES(66, 'dtygu', 12, '07696085020', 'parmanandsingh469@gmail.com', 1, '2019-12-12 00:00:00', 'drg', 10, '2020-03-15 04:11:36', 0, 1, NULL, 1);
INSERT INTO `DoctorAppointment` (`ID`, `Name`, `Age`, `Mobile`, `Email`, `Sex`, `BookingDate`, `BookingTime`, `DoctorID`, `CreatedDate`, `IsDeleted`, `Status`, `HospitalID`, `CompanyID`) VALUES(67, 'Neeraj Singh', 0, '09599660409', 'neer.s@outlook.com', 0, NULL, NULL, NULL, '2020-03-28 08:44:40', 0, 1, NULL, 2);
INSERT INTO `DoctorAppointment` (`ID`, `Name`, `Age`, `Mobile`, `Email`, `Sex`, `BookingDate`, `BookingTime`, `DoctorID`, `CreatedDate`, `IsDeleted`, `Status`, `HospitalID`, `CompanyID`) VALUES(68, 'Neeraj Singh', 0, '08527818810', 'singh.neer@ymail.com', 0, NULL, NULL, NULL, '2020-03-28 08:48:46', 0, 1, NULL, 2);
INSERT INTO `DoctorAppointment` (`ID`, `Name`, `Age`, `Mobile`, `Email`, `Sex`, `BookingDate`, `BookingTime`, `DoctorID`, `CreatedDate`, `IsDeleted`, `Status`, `HospitalID`, `CompanyID`) VALUES(69, 'Neeraj Singh', 0, '09599660409', 'neer19ultimate@gmail.com', 0, NULL, NULL, NULL, '2020-03-28 08:59:31', 0, 1, NULL, 2);
INSERT INTO `DoctorAppointment` (`ID`, `Name`, `Age`, `Mobile`, `Email`, `Sex`, `BookingDate`, `BookingTime`, `DoctorID`, `CreatedDate`, `IsDeleted`, `Status`, `HospitalID`, `CompanyID`) VALUES(70, 'Neeraj Singh', 0, '08527818810', 'singh.neer@ymail.com', 0, NULL, NULL, NULL, '2020-03-28 09:00:03', 0, 1, NULL, NULL);
INSERT INTO `DoctorAppointment` (`ID`, `Name`, `Age`, `Mobile`, `Email`, `Sex`, `BookingDate`, `BookingTime`, `DoctorID`, `CreatedDate`, `IsDeleted`, `Status`, `HospitalID`, `CompanyID`) VALUES(71, 'Neeraj Singh', 0, '09599660409', 'neer19ultimate@gmail.com', 0, NULL, NULL, NULL, '2020-03-28 09:03:41', 0, 1, NULL, 2);
INSERT INTO `DoctorAppointment` (`ID`, `Name`, `Age`, `Mobile`, `Email`, `Sex`, `BookingDate`, `BookingTime`, `DoctorID`, `CreatedDate`, `IsDeleted`, `Status`, `HospitalID`, `CompanyID`) VALUES(72, 'Neeraj Singh', 0, '09599660409', 'neer.s@outlook.com', 0, NULL, NULL, NULL, '2020-03-28 09:03:59', 0, 1, NULL, NULL);
INSERT INTO `DoctorAppointment` (`ID`, `Name`, `Age`, `Mobile`, `Email`, `Sex`, `BookingDate`, `BookingTime`, `DoctorID`, `CreatedDate`, `IsDeleted`, `Status`, `HospitalID`, `CompanyID`) VALUES(73, 'Neeraj Singh', 0, '08527818810', 'singh.neer@ymail.com', 0, NULL, NULL, NULL, '2020-03-28 09:04:14', 0, 1, NULL, NULL);
INSERT INTO `DoctorAppointment` (`ID`, `Name`, `Age`, `Mobile`, `Email`, `Sex`, `BookingDate`, `BookingTime`, `DoctorID`, `CreatedDate`, `IsDeleted`, `Status`, `HospitalID`, `CompanyID`) VALUES(74, 'Neeraj Singh', 21, '08527818810', 'singh.neer@ymail.com', 1, '2020-03-30 00:00:00', '123', 4, '2020-03-29 10:34:51', 0, 1, NULL, 1);
INSERT INTO `DoctorAppointment` (`ID`, `Name`, `Age`, `Mobile`, `Email`, `Sex`, `BookingDate`, `BookingTime`, `DoctorID`, `CreatedDate`, `IsDeleted`, `Status`, `HospitalID`, `CompanyID`) VALUES(75, 'Neeraj Singh', 21, '08527818810', 'neer.s@outlook.com', 1, '2020-03-30 00:00:00', '123', 4, '2020-03-29 10:35:09', 0, 1, NULL, 1);
INSERT INTO `DoctorAppointment` (`ID`, `Name`, `Age`, `Mobile`, `Email`, `Sex`, `BookingDate`, `BookingTime`, `DoctorID`, `CreatedDate`, `IsDeleted`, `Status`, `HospitalID`, `CompanyID`) VALUES(76, 'Neeraj Singh', 12, '08527818810', 'singh.neer@ymail.com', 2, '2020-03-27 00:00:00', '12', 10, '2020-03-30 23:01:21', 0, 1, NULL, 1);
INSERT INTO `DoctorAppointment` (`ID`, `Name`, `Age`, `Mobile`, `Email`, `Sex`, `BookingDate`, `BookingTime`, `DoctorID`, `CreatedDate`, `IsDeleted`, `Status`, `HospitalID`, `CompanyID`) VALUES(77, 'Neeraj Singh', 44, '08527818810', 'singh.neer@ymail.com', 1, '2020-03-21 00:00:00', 'tfffg', 12, '2020-03-30 23:06:35', 0, 1, NULL, 1);
INSERT INTO `DoctorAppointment` (`ID`, `Name`, `Age`, `Mobile`, `Email`, `Sex`, `BookingDate`, `BookingTime`, `DoctorID`, `CreatedDate`, `IsDeleted`, `Status`, `HospitalID`, `CompanyID`) VALUES(78, 'Neeraj Singh', 21, '09599660409', 'neer.s@outlook.com', 1, '2020-03-30 00:00:00', '212', 8, '2020-03-30 10:46:36', 0, 1, NULL, 1);
INSERT INTO `DoctorAppointment` (`ID`, `Name`, `Age`, `Mobile`, `Email`, `Sex`, `BookingDate`, `BookingTime`, `DoctorID`, `CreatedDate`, `IsDeleted`, `Status`, `HospitalID`, `CompanyID`) VALUES(79, 'Neeraj Singh', 21, '09599660409', 'neer.s@outlook.com', 1, '2020-03-30 00:00:00', '212', 8, '2020-03-30 10:49:57', 0, 1, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `DoctorMaster`
--

CREATE TABLE `DoctorMaster` (
  `ID` int(11) NOT NULL,
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
  `CompanyID` int(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `DoctorMaster`
--

INSERT INTO `DoctorMaster` (`ID`, `FirstName`, `LastName`, `DateOfBirth`, `Experience`, `Specialist`, `ImageUrl`, `Hospital`, `Designation`, `Sequence`, `About`, `LogoUrl`, `IsDeleted`, `CreatedDate`, `UpdatedDate`, `Mobile`, `Email`, `RegistrationNo`, `SpecialityID`, `HospitalID`, `CompanyID`) VALUES(1, 'Trinath', 'Sarkar', '2019-07-28 00:00:00', 10, 'Cardiology', '../../assets/img/Doctors images/Dr.Trinath Sarkar.jpg', 'Calcutta Medical College Paramount Nursing Home', 'M.B.B.S. (Cal), M.D. (Cal), CCEBDM (IDF) ', 999, 'Member: - European Society of Cardiology', 'lnr-heart-pulse', 1, '2019-07-28 00:00:00', '2019-08-03 01:40:14', '9051672875', 'trinath_sarkar2004@yahoo.co.in', NULL, 4, NULL, 1);
INSERT INTO `DoctorMaster` (`ID`, `FirstName`, `LastName`, `DateOfBirth`, `Experience`, `Specialist`, `ImageUrl`, `Hospital`, `Designation`, `Sequence`, `About`, `LogoUrl`, `IsDeleted`, `CreatedDate`, `UpdatedDate`, `Mobile`, `Email`, `RegistrationNo`, `SpecialityID`, `HospitalID`, `CompanyID`) VALUES(2, 'Jayanta', 'Raja', NULL, 0, 'Cardiology', 'https://png.pngtree.com/element_origin_min_pic/16/09/13/2157d8062925150.jpg', ' BM Birla Heart Research Centre Hindustan Health Point', 'M.B.B.S, D.CARD (CAL), DC.CM.A.F.I.C.A (USA)', 999, '', 'lnr-Users', 1, '2019-07-28 00:00:00', NULL, '033-2475 5390', ' drjrajani@yahoo.co.in', NULL, 4, NULL, 1);
INSERT INTO `DoctorMaster` (`ID`, `FirstName`, `LastName`, `DateOfBirth`, `Experience`, `Specialist`, `ImageUrl`, `Hospital`, `Designation`, `Sequence`, `About`, `LogoUrl`, `IsDeleted`, `CreatedDate`, `UpdatedDate`, `Mobile`, `Email`, `RegistrationNo`, `SpecialityID`, `HospitalID`, `CompanyID`) VALUES(3, 'Amit', 'Gupta', NULL, 0, 'Diabetese and Endocrinology', '../../assets/img/Doctors images/Dr.Amit.jpg', 'Fellow Observer Critical Care & Chest Medicine(Johns Hopkins Hospital(USA)', ' M.D.,MRCP, FCGP, DFM(UK)  Dip. Diabetology (Chennai)', 999, '', 'lnr-rocket', 1, '2019-07-28 00:00:00', NULL, '9830075316', '', NULL, 8, NULL, 1);
INSERT INTO `DoctorMaster` (`ID`, `FirstName`, `LastName`, `DateOfBirth`, `Experience`, `Specialist`, `ImageUrl`, `Hospital`, `Designation`, `Sequence`, `About`, `LogoUrl`, `IsDeleted`, `CreatedDate`, `UpdatedDate`, `Mobile`, `Email`, `RegistrationNo`, `SpecialityID`, `HospitalID`, `CompanyID`) VALUES(4, 'Poulomi', 'Saha', NULL, 0, 'ENT Specialist', '../../assets/img/Doctors images/Dr.Poulimi Sarkar.jpg', 'Faculty of WBMES', 'MBBS, MS', 4, NULL, NULL, 0, '2019-08-08 00:00:00', NULL, '8727072555', 'drpoulomisaha@gmail.com', NULL, 7, NULL, 1);
INSERT INTO `DoctorMaster` (`ID`, `FirstName`, `LastName`, `DateOfBirth`, `Experience`, `Specialist`, `ImageUrl`, `Hospital`, `Designation`, `Sequence`, `About`, `LogoUrl`, `IsDeleted`, `CreatedDate`, `UpdatedDate`, `Mobile`, `Email`, `RegistrationNo`, `SpecialityID`, `HospitalID`, `CompanyID`) VALUES(5, 'Ranajit', 'Bari', NULL, 0, 'Diabetes & Endocrinology Consultant', '../../assets/img/Doctors images/DR.Ranajit Bari.jpg', 'Asst. Prof. R.G.Kar Medical College & Hospital', 'MBBS,MD,DM', 2, NULL, NULL, 0, '2019-08-08 00:00:00', NULL, '9433360027', 'dr.ranajit@gmail.com', NULL, 8, NULL, 1);
INSERT INTO `DoctorMaster` (`ID`, `FirstName`, `LastName`, `DateOfBirth`, `Experience`, `Specialist`, `ImageUrl`, `Hospital`, `Designation`, `Sequence`, `About`, `LogoUrl`, `IsDeleted`, `CreatedDate`, `UpdatedDate`, `Mobile`, `Email`, `RegistrationNo`, `SpecialityID`, `HospitalID`, `CompanyID`) VALUES(6, 'Md Rahiul', 'Islam', NULL, 0, 'Physician,Child Specialist,Neonatalogist & Paedtric Intensivist', '../../assets/img/Doctors images/Dr.R Islam.jpg', '                                                                                                  Chittaranjan Seva Sadan          ', 'MBBS,MD(CAL)', 1, NULL, NULL, 0, '2019-08-08 00:00:00', NULL, '7003258132', 'rahcnmc@gmail.com', NULL, 9, NULL, 1);
INSERT INTO `DoctorMaster` (`ID`, `FirstName`, `LastName`, `DateOfBirth`, `Experience`, `Specialist`, `ImageUrl`, `Hospital`, `Designation`, `Sequence`, `About`, `LogoUrl`, `IsDeleted`, `CreatedDate`, `UpdatedDate`, `Mobile`, `Email`, `RegistrationNo`, `SpecialityID`, `HospitalID`, `CompanyID`) VALUES(7, 'Tapas', 'Das', NULL, 0, 'Consultant Physiotherapist', '../../assets/img/Doctors images/Dr.Tapas Das.jpg', 'Medicine(Apollo Hospital),Physiotherapist,Acupunture and Yoga And Naturopathy Physician(Govt. of Wb)', 'Phd,M.Sc, Sports and Allied Science,', 6, NULL, NULL, 0, '2019-08-08 00:00:00', NULL, '9831020106', 'tapasdas76@yahoo.co.in', NULL, 12, NULL, 1);
INSERT INTO `DoctorMaster` (`ID`, `FirstName`, `LastName`, `DateOfBirth`, `Experience`, `Specialist`, `ImageUrl`, `Hospital`, `Designation`, `Sequence`, `About`, `LogoUrl`, `IsDeleted`, `CreatedDate`, `UpdatedDate`, `Mobile`, `Email`, `RegistrationNo`, `SpecialityID`, `HospitalID`, `CompanyID`) VALUES(8, 'Soumyendra Nath', 'Mitra', NULL, 0, 'General Physician', 'https://png.pngtree.com/element_origin_min_pic/16/09/13/2157d8062925150.jpg', 'Ex-Resident Surgeon Marwari Relief Society Hospital,Kolkata	                                Medical Superitendent Apollo Nursing Home,Kolkata', 'Bsc.(Hons.),M.B.B.S', 999, NULL, NULL, 0, '2019-08-08 00:00:00', NULL, '9830243153', NULL, NULL, 1, NULL, 1);
INSERT INTO `DoctorMaster` (`ID`, `FirstName`, `LastName`, `DateOfBirth`, `Experience`, `Specialist`, `ImageUrl`, `Hospital`, `Designation`, `Sequence`, `About`, `LogoUrl`, `IsDeleted`, `CreatedDate`, `UpdatedDate`, `Mobile`, `Email`, `RegistrationNo`, `SpecialityID`, `HospitalID`, `CompanyID`) VALUES(9, 'Nilima', 'Tudu', NULL, 0, 'Gynaecologist', '../../assets/img/Doctors images/Dr.Nilima Tudu.jpg', '                                                                                                                 Belle Vue Clinic        ', 'MBBS(Cal), Dgo(Cal)', 999, NULL, NULL, 1, '2019-08-08 00:00:00', NULL, '9883118528', 'nilima.tudu14@gmail.com', NULL, 11, NULL, 1);
INSERT INTO `DoctorMaster` (`ID`, `FirstName`, `LastName`, `DateOfBirth`, `Experience`, `Specialist`, `ImageUrl`, `Hospital`, `Designation`, `Sequence`, `About`, `LogoUrl`, `IsDeleted`, `CreatedDate`, `UpdatedDate`, `Mobile`, `Email`, `RegistrationNo`, `SpecialityID`, `HospitalID`, `CompanyID`) VALUES(10, 'Paushali', 'Sanyal', NULL, 0, 'Consultant Gynaecologist & Obstetrician', '../../assets/img/Doctors images/Dr.Paushali Sanyal.jpg', ' SSKM Hospital                                                                                        Fellow in Minimal Access Surgery   ', 'MBBS,MS ( G&O), Gold Medalist, DNB(Delhi), MRCOG(London), FMAS', 5, NULL, NULL, 0, '2019-08-08 00:00:00', NULL, '9830279680', 'poushali.sanyal@yahoo.co.in', NULL, 11, NULL, 1);
INSERT INTO `DoctorMaster` (`ID`, `FirstName`, `LastName`, `DateOfBirth`, `Experience`, `Specialist`, `ImageUrl`, `Hospital`, `Designation`, `Sequence`, `About`, `LogoUrl`, `IsDeleted`, `CreatedDate`, `UpdatedDate`, `Mobile`, `Email`, `RegistrationNo`, `SpecialityID`, `HospitalID`, `CompanyID`) VALUES(12, 'Sajeev', 'Shekhar', NULL, 0, 'Consultant Orthopaedic Surgeon', '../../assets/img/Doctors images/Sajeeve.jpg', 'IPGMER & SSKM Hospital', 'MBBS,MS', 3, NULL, NULL, 0, '2019-08-08 00:00:00', NULL, '8197420121', 'sajshekh@hotmail.com', NULL, 10, NULL, 1);
INSERT INTO `DoctorMaster` (`ID`, `FirstName`, `LastName`, `DateOfBirth`, `Experience`, `Specialist`, `ImageUrl`, `Hospital`, `Designation`, `Sequence`, `About`, `LogoUrl`, `IsDeleted`, `CreatedDate`, `UpdatedDate`, `Mobile`, `Email`, `RegistrationNo`, `SpecialityID`, `HospitalID`, `CompanyID`) VALUES(13, 'Robin', 'Kumar', NULL, 0, 'Consultant Chest Physician', 'https://png.pngtree.com/element_origin_min_pic/16/09/13/2157d8062925150.jpg', 'MBBS,MRCHCH(I)', 'MBBS,MRCHCH(I)', 999, NULL, NULL, 0, '0000-00-00 00:00:00', NULL, '', NULL, NULL, 1, NULL, 1);
INSERT INTO `DoctorMaster` (`ID`, `FirstName`, `LastName`, `DateOfBirth`, `Experience`, `Specialist`, `ImageUrl`, `Hospital`, `Designation`, `Sequence`, `About`, `LogoUrl`, `IsDeleted`, `CreatedDate`, `UpdatedDate`, `Mobile`, `Email`, `RegistrationNo`, `SpecialityID`, `HospitalID`, `CompanyID`) VALUES(14, 'Pallabi', 'Chatterjee', NULL, 0, 'Nutrition Dietitian', 'https://png.pngtree.com/element_origin_min_pic/16/09/13/2157d8062925150.jpg', NULL, 'M.Sc. In Applied Nutrition( All India Institute of Hygeine & PublicHealth),', 999, NULL, NULL, 0, '0000-00-00 00:00:00', NULL, '', NULL, NULL, 13, NULL, 1);
INSERT INTO `DoctorMaster` (`ID`, `FirstName`, `LastName`, `DateOfBirth`, `Experience`, `Specialist`, `ImageUrl`, `Hospital`, `Designation`, `Sequence`, `About`, `LogoUrl`, `IsDeleted`, `CreatedDate`, `UpdatedDate`, `Mobile`, `Email`, `RegistrationNo`, `SpecialityID`, `HospitalID`, `CompanyID`) VALUES(15, 'OPD', '', NULL, 0, 'OPD', NULL, 'OPD', NULL, 999, NULL, NULL, 1, '2019-08-08 00:00:00', NULL, '', NULL, NULL, 1, NULL, 1);
INSERT INTO `DoctorMaster` (`ID`, `FirstName`, `LastName`, `DateOfBirth`, `Experience`, `Specialist`, `ImageUrl`, `Hospital`, `Designation`, `Sequence`, `About`, `LogoUrl`, `IsDeleted`, `CreatedDate`, `UpdatedDate`, `Mobile`, `Email`, `RegistrationNo`, `SpecialityID`, `HospitalID`, `CompanyID`) VALUES(16, 'Sabyasachi', 'Sarkar', NULL, 0, 'Consultant Gynaecologist & Obstetrician', '../../assets/img/Doctors images/Dr.R Islam.jpg', '                                                                                                  Chittaranjan Seva Sadan          ', 'MBBS,MS(G &O)', 6, NULL, NULL, 0, '2019-08-08 00:00:00', NULL, '7003258132', 'rahcnmc@gmail.com', NULL, 9, NULL, 2);
INSERT INTO `DoctorMaster` (`ID`, `FirstName`, `LastName`, `DateOfBirth`, `Experience`, `Specialist`, `ImageUrl`, `Hospital`, `Designation`, `Sequence`, `About`, `LogoUrl`, `IsDeleted`, `CreatedDate`, `UpdatedDate`, `Mobile`, `Email`, `RegistrationNo`, `SpecialityID`, `HospitalID`, `CompanyID`) VALUES(17, 'Suvendu', 'Maji', NULL, 0, 'General Surgery & Oncology Consultant', '../../assets/img/Doctors images/DR.Ranajit Bari.jpg', 'Asst. Prof. R.G.Kar Medical College & Hospital', 'MBBS,MS(GEN SURG),DNB(Onco)', 2, NULL, NULL, 0, '2019-08-08 00:00:00', NULL, '9433360027', 'dr.ranajit@gmail.com', NULL, 8, NULL, 2);
INSERT INTO `DoctorMaster` (`ID`, `FirstName`, `LastName`, `DateOfBirth`, `Experience`, `Specialist`, `ImageUrl`, `Hospital`, `Designation`, `Sequence`, `About`, `LogoUrl`, `IsDeleted`, `CreatedDate`, `UpdatedDate`, `Mobile`, `Email`, `RegistrationNo`, `SpecialityID`, `HospitalID`, `CompanyID`) VALUES(18, 'Poulomi', 'Saha', NULL, 0, 'ENT Specialist', '../../assets/img/Doctors images/Dr.Poulimi Sarkar.jpg', 'Faculty of WBMES', 'MBBS, MS', 4, NULL, NULL, 0, '2019-08-08 00:00:00', NULL, '8727072555', 'drpoulomisaha@gmail.com', NULL, 7, NULL, 2);
INSERT INTO `DoctorMaster` (`ID`, `FirstName`, `LastName`, `DateOfBirth`, `Experience`, `Specialist`, `ImageUrl`, `Hospital`, `Designation`, `Sequence`, `About`, `LogoUrl`, `IsDeleted`, `CreatedDate`, `UpdatedDate`, `Mobile`, `Email`, `RegistrationNo`, `SpecialityID`, `HospitalID`, `CompanyID`) VALUES(19, 'Ranajit ', 'Bari', NULL, 0, 'Diabetes & Endocrinology Consultant', '../../assets/img/Doctors images/DR.Ranajit Bari.jpg', 'Asst. Prof. R.G.Kar Medical College & Hospital', 'MBBS,MD,DM', 2, NULL, NULL, 0, '2019-08-08 00:00:00', NULL, '9433360027', 'dr.ranajit@gmail.com', NULL, 8, NULL, 2);
INSERT INTO `DoctorMaster` (`ID`, `FirstName`, `LastName`, `DateOfBirth`, `Experience`, `Specialist`, `ImageUrl`, `Hospital`, `Designation`, `Sequence`, `About`, `LogoUrl`, `IsDeleted`, `CreatedDate`, `UpdatedDate`, `Mobile`, `Email`, `RegistrationNo`, `SpecialityID`, `HospitalID`, `CompanyID`) VALUES(20, 'Md Rahiul ', 'Islam', NULL, 0, 'Physician,Child Specialist,Neonatalogist & Paedtric Intensivist', '../../assets/img/Doctors images/Dr.R Islam.jpg', '                                                                                                  Chittaranjan Seva Sadan          ', 'MBBS,MD(CAL)', 1, NULL, NULL, 0, '2019-08-08 00:00:00', NULL, '7003258132', 'rahcnmc@gmail.com', NULL, 9, NULL, 2);
INSERT INTO `DoctorMaster` (`ID`, `FirstName`, `LastName`, `DateOfBirth`, `Experience`, `Specialist`, `ImageUrl`, `Hospital`, `Designation`, `Sequence`, `About`, `LogoUrl`, `IsDeleted`, `CreatedDate`, `UpdatedDate`, `Mobile`, `Email`, `RegistrationNo`, `SpecialityID`, `HospitalID`, `CompanyID`) VALUES(21, 'Tapas ', 'Das', NULL, 0, 'Consultant Physiotherapist', '../../assets/img/Doctors images/Dr.Tapas Das.jpg', 'Medicine(Apollo Hospital),Physiotherapist,Acupunture and Yoga And Naturopathy Physician(Govt. of Wb)', 'Phd, M.Sc, Sports and Allied Science,', 6, NULL, NULL, 0, '2019-08-08 00:00:00', NULL, '9831020106', 'tapasdas76@yahoo.co.in', NULL, 12, NULL, 2);
INSERT INTO `DoctorMaster` (`ID`, `FirstName`, `LastName`, `DateOfBirth`, `Experience`, `Specialist`, `ImageUrl`, `Hospital`, `Designation`, `Sequence`, `About`, `LogoUrl`, `IsDeleted`, `CreatedDate`, `UpdatedDate`, `Mobile`, `Email`, `RegistrationNo`, `SpecialityID`, `HospitalID`, `CompanyID`) VALUES(22, 'Paushali ', 'Sanyal', NULL, 0, 'Consultant Gynaecologist & Obstetrician', '../../assets/img/Doctors images/Dr.Paushali Sanyal.jpg', ' SSKM Hospital                                                                                        Fellow in Minimal Access Surgery   ', 'MBBS, MS ( G&O), Gold Medalist, DNB(Delhi), MRCOG (London),  FMAS', 5, NULL, NULL, 0, '2019-08-08 00:00:00', NULL, '9830279680', 'poushali.sanyal@yahoo.co.in', NULL, 11, NULL, 2);
INSERT INTO `DoctorMaster` (`ID`, `FirstName`, `LastName`, `DateOfBirth`, `Experience`, `Specialist`, `ImageUrl`, `Hospital`, `Designation`, `Sequence`, `About`, `LogoUrl`, `IsDeleted`, `CreatedDate`, `UpdatedDate`, `Mobile`, `Email`, `RegistrationNo`, `SpecialityID`, `HospitalID`, `CompanyID`) VALUES(23, 'Pallabi', 'Chatterjee', NULL, 0, 'Nutrition Dietitian', 'https://png.pngtree.com/element_origin_min_pic/16/09/13/2157d8062925150.jpg', NULL, 'M.Sc. In Applied Nutrition( All India Institute of Hygeine & PublicHealth),', 999, NULL, NULL, 1, '0000-00-00 00:00:00', NULL, '', NULL, NULL, 13, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `DoctorSpecialities`
--

CREATE TABLE `DoctorSpecialities` (
  `ID` int(9) NOT NULL,
  `DoctorID` int(9) NOT NULL,
  `SpecialityID` int(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `DoctorSpecialities`
--

INSERT INTO `DoctorSpecialities` (`ID`, `DoctorID`, `SpecialityID`) VALUES(1, 1, 1);
INSERT INTO `DoctorSpecialities` (`ID`, `DoctorID`, `SpecialityID`) VALUES(2, 1, 4);
INSERT INTO `DoctorSpecialities` (`ID`, `DoctorID`, `SpecialityID`) VALUES(3, 2, 1);
INSERT INTO `DoctorSpecialities` (`ID`, `DoctorID`, `SpecialityID`) VALUES(4, 2, 4);
INSERT INTO `DoctorSpecialities` (`ID`, `DoctorID`, `SpecialityID`) VALUES(5, 3, 6);
INSERT INTO `DoctorSpecialities` (`ID`, `DoctorID`, `SpecialityID`) VALUES(6, 4, 7);
INSERT INTO `DoctorSpecialities` (`ID`, `DoctorID`, `SpecialityID`) VALUES(7, 5, 8);
INSERT INTO `DoctorSpecialities` (`ID`, `DoctorID`, `SpecialityID`) VALUES(8, 6, 9);

-- --------------------------------------------------------

--
-- Table structure for table `HealthServiceMaster`
--

CREATE TABLE `HealthServiceMaster` (
  `ID` int(9) NOT NULL,
  `Name` varchar(100) NOT NULL,
  `Description` varchar(5000) DEFAULT NULL,
  `ImageUrl` varchar(1000) DEFAULT NULL,
  `PageUrl` varchar(1000) DEFAULT NULL,
  `CreatedDate` datetime NOT NULL,
  `UpdatedDate` datetime DEFAULT NULL,
  `IsDeleted` int(1) NOT NULL DEFAULT '0',
  `Type` int(2) NOT NULL DEFAULT '0',
  `ServicesIncluded` varchar(1000) DEFAULT NULL,
  `CompanyID` int(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `HealthServiceMaster`
--

INSERT INTO `HealthServiceMaster` (`ID`, `Name`, `Description`, `ImageUrl`, `PageUrl`, `CreatedDate`, `UpdatedDate`, `IsDeleted`, `Type`, `ServicesIncluded`, `CompanyID`) VALUES(1, 'Pathology', 'Leela Healthcare basically aims at improving life’s of others. In terms of pathology, it is a medical specialty that determines the cause and nature of diseases by examining and testing body tissues (from biopsies and pap smears, for example) and bodily fluids (from samples including blood and urine). The results from these pathology tests help Doctors diagnose and treat patients correctly. Basically, an integral part of clinical diagnosis', '../../assets/img/services images/pathology .jpg', 'page3 url (if any)', '2016-03-22 09:27:52', '2019-08-03 12:17:18', 0, 0, 'Biochemistry,Clinical Pathology,Cytopathology,Haematology, Immunology, Molecular Biology, Molecular Genetics, Serology', 1);
INSERT INTO `HealthServiceMaster` (`ID`, `Name`, `Description`, `ImageUrl`, `PageUrl`, `CreatedDate`, `UpdatedDate`, `IsDeleted`, `Type`, `ServicesIncluded`, `CompanyID`) VALUES(2, 'Cardiology', 'Cardiology is a medical specialty and a branch of internal medicine concerned with disorders of the heart. It deals with the diagnosis and treatment of such conditions as congenital heart defects, coronary artery disease, electrophysiology, heart failure and heart disease. Subspecialties of the cardiology field include cardiac electrophysiology, echocardiography, interventional cardiology and nuclear cardiology', '../../assets/img/services images/cardiology.jpg', 'page3 url (if any)', '2019-07-29 09:27:52', '2019-08-03 12:16:24', 0, 0, 'ECG, Holter monitoring, BP monitoring', 1);
INSERT INTO `HealthServiceMaster` (`ID`, `Name`, `Description`, `ImageUrl`, `PageUrl`, `CreatedDate`, `UpdatedDate`, `IsDeleted`, `Type`, `ServicesIncluded`, `CompanyID`) VALUES(3, 'Spirometry', 'Spirometry (spy-ROM-uh-tree) is a common office test used to assess how well your lungs work by measuring how much air you inhale, how much you exhale and how quickly you exhale.Spirometry is used to diagnose asthma, chronic obstructive pulmonary disease (COPD) and other conditions that affect breathing. Spirometry may also be used periodically to monitor your lung condition and check whether a treatment for a chronic lung condition is helping you breathe better.', '../../assets/img/services images/spirometry.jpg', 'page3 url (if any)', '2019-07-29 09:27:52', NULL, 0, 0, NULL, 1);
INSERT INTO `HealthServiceMaster` (`ID`, `Name`, `Description`, `ImageUrl`, `PageUrl`, `CreatedDate`, `UpdatedDate`, `IsDeleted`, `Type`, `ServicesIncluded`, `CompanyID`) VALUES(4, 'Neurology', 'Neurology is a branch of medicine dealing with disorders of the nervous system. Neurology deals with the diagnosis and treatment of all categories of conditions and disease involving the central and peripheral nervous systems, including their coverings, blood vessels, and all effector tissue, such as muscle.', '../../assets/img/services images/Neurology.jpg', NULL, '2019-08-08 09:27:52', NULL, 0, 0, 'NCV Study,  EMG Study , EEG ,BLINK REFLEX    ,VEP Study ,BAER Study  ,SSEP Study  ', 1);
INSERT INTO `HealthServiceMaster` (`ID`, `Name`, `Description`, `ImageUrl`, `PageUrl`, `CreatedDate`, `UpdatedDate`, `IsDeleted`, `Type`, `ServicesIncluded`, `CompanyID`) VALUES(5, 'Gynae Care', 'Gynaecare clinic offers a comprehensive range of treatments with complete scientific solutions for infertility and sexual disfunctions. Our dedicated team of doctors personally interact with the patients , answer their queries and decide on the treatment accordingly. We offer the best services in fertility and reproductive medicine. Some of the services offered at our clinic are:', '../../assets/img/services images/gynae-clinic.jpg', NULL, '2019-08-08 09:27:52', NULL, 0, 0, 'Pre & post-natal check up,Laproscopic surgeries, Hysterectomy,Measures for Family Planning, Abnormal bleeding problems, Treatment for Hormonal Imbalance, Blood Tests, IVF or In Vitro Fertilization, Infertility work up, IUI or Intrauterine Insemination,\r Safe medical termination of pregnancy (abortion).\r', NULL);
INSERT INTO `HealthServiceMaster` (`ID`, `Name`, `Description`, `ImageUrl`, `PageUrl`, `CreatedDate`, `UpdatedDate`, `IsDeleted`, `Type`, `ServicesIncluded`, `CompanyID`) VALUES(6, 'Child Care Clinic', 'Childcare clinic offers a comprehensive range of treatments with complete solutions for Child. Our experienced team of Paediatricians caters to the Medical Needs of Newborns, Toddlers, Teenagers and Adolescents., answer their queries and decide on the treatment accordingly. We offer the best services in Paedtrics. Some of the services offered at our clinic are', '../../assets/img/services images/child-care-clinic.jpg', NULL, '2019-08-08 09:27:52', NULL, 0, 0, 'Neonatology\r,Paedtric Intensivist', 1);
INSERT INTO `HealthServiceMaster` (`ID`, `Name`, `Description`, `ImageUrl`, `PageUrl`, `CreatedDate`, `UpdatedDate`, `IsDeleted`, `Type`, `ServicesIncluded`, `CompanyID`) VALUES(7, 'Diabetes Care Clinic', 'Diabetes is a hassle-some disease. At Leela Healthcare, we take the stress out of diabetes. We provide everything a diabetic might need, under one roof. Right from diagnosis to speaking to a dietician, educator, diabetologist. As a patient, you don’t have to keep going from pillar to post. We help patients manage Type 1, 2, gestational or prediabetes. Our evaluations, physical exams and treatments are geared to detect and prevent complications brought on by the disease. Our medical team can help you create routines for nutrition and exercise to prevent diabetes if you are prediabetes. For some type 2 patients, we may be able to control diabetes without medication through weight loss, diet and exercise. Our goal is to provide the best possible solution for your particular diagnosis. There are many ways to treat diabetes. Our doctors gives you options and works with you to design a plan that fits your lifestyle so you can successfully live with diabetes. Along with diet, exercise, oral medications, insulin and non-insulin injections, we also have expertise in insulin pump and continuous glucose monitoring.', '../../assets/img/services images/diabetes-.jpg', NULL, '2019-08-08 09:27:52', NULL, 0, 0, NULL, 1);
INSERT INTO `HealthServiceMaster` (`ID`, `Name`, `Description`, `ImageUrl`, `PageUrl`, `CreatedDate`, `UpdatedDate`, `IsDeleted`, `Type`, `ServicesIncluded`, `CompanyID`) VALUES(8, 'Endrocrinology', 'The department of endocrinology at  Leela Healthcare offers the best treatment modalities available for endocrine disorders to provide accurate and comprehensive care for its patients suffering from various endocrine diseases.\r', '../../assets/img/services images/endrocrinology.jpg', NULL, '2019-08-08 09:27:52', NULL, 0, 0, NULL, NULL);
INSERT INTO `HealthServiceMaster` (`ID`, `Name`, `Description`, `ImageUrl`, `PageUrl`, `CreatedDate`, `UpdatedDate`, `IsDeleted`, `Type`, `ServicesIncluded`, `CompanyID`) VALUES(9, 'Ortho Clinic', 'The department of orthopaedic at Leela Healthcare offers the best treatment modalities available for ortho ailments to provide accurate and comprehensive care for its patients suffering from various ortho problems. In addition, efficient occupational therapists, physiotherapists and pain management experts work towards the quick rehabilitation of the patient leading to a better quality of life', '../../assets/img/services images/ortho-clinic.jpg', NULL, '2019-08-08 09:27:52', NULL, 0, 0, NULL, 1);
INSERT INTO `HealthServiceMaster` (`ID`, `Name`, `Description`, `ImageUrl`, `PageUrl`, `CreatedDate`, `UpdatedDate`, `IsDeleted`, `Type`, `ServicesIncluded`, `CompanyID`) VALUES(10, 'Physiotherapy', 'Physiotherapy is a health science that aims in rehabilitation and enhance individuals with movement chaos by utilizing evidence-based, natural process like motivation, exercise, education, advocacy and adapted tools. Physiotherapists study subjects like neuroscience,physiology and anatomy for developing attitudes and skills that are very much required for health prevention, education, rehabilitation and treatment of the patients with disabilities and physical ailments.It is sad to say that there are still many educated people in India who think that physiotherapy is only related to a few exercises. Physiotherapy is a science in itself. One might be suffering from cardiopulmonary ,orthopaedic, paediatric, neurology, sports injury, congenital abnormality, to name a few, where physical management becomes as a essential part of the rehabilitation process and some times is the only process. Why physiotherapy at Leela HealthCare? At Leela HealthCare our clinic run by experienced team of doctors and paramedics.  We have all type modern Electrotherapy equipments,exercise Theraphy,Manual Theraphy,here patient can get Acupuncture Treatment facility also apart with these. We basically try to alleviate the pain through various modern techniques or tools that can be used by the experience team of doctors and paramedics.\r \"', '../../assets/img/services images/physiotherapy.jpg', NULL, '2019-08-08 09:27:52', NULL, 0, 0, NULL, 1);
INSERT INTO `HealthServiceMaster` (`ID`, `Name`, `Description`, `ImageUrl`, `PageUrl`, `CreatedDate`, `UpdatedDate`, `IsDeleted`, `Type`, `ServicesIncluded`, `CompanyID`) VALUES(11, 'Pain Clinic', 'We provide pain management services for diagnosis and treatment for painful conditions.We treat back pain, knee pain, headache, neck pain and cancer pain etc.... due to slipped disc, migraine, Cluster Headache﻿, trigeminal neuralgia, arthritis, spondylitis, cancer etc. We use most advanced interventional pain management methods...like radio-frequency ablation, spinal cord stimulation, Percutaneous Discectomy, vertebroplasty, Epidural steroid injections, Epiduroscopy, Ozone Necleolysis, Platelet Rich Plasma (PRP)﻿ Therapy etc.', '../../assets/img/services images/pain-clinic.jpg', NULL, '2019-08-08 09:27:52', NULL, 0, 0, 'IFT,Laser Therapy,Tens,Acupuncture/Dry Needling,Electro acupuncture,Ultrasonic therapy,Diapulse /SWD,Electro stimulators,Neuromuscular stimulations,Electronic tractions,Manual Therapy/Manupulataion,Taping Techniques\r \"', 1);
INSERT INTO `HealthServiceMaster` (`ID`, `Name`, `Description`, `ImageUrl`, `PageUrl`, `CreatedDate`, `UpdatedDate`, `IsDeleted`, `Type`, `ServicesIncluded`, `CompanyID`) VALUES(12, 'Sports Medicine', 'Sports Medicine is an integral part of modern medicine. Sports Medicine practitioners deal with human fitness and conditioning related to performance, different types of injuries including sports injuries, rehabilitation, pain and weaknesses arising out of different kinds of injuries and diseases The GOAL of Sports Medicine is to prevent injuries, to improve bodily functions and movements and to treat pain in the shortest possible time and with minimum use of medicines. Sports Medicine Therapy requires specific infrastructure including modern Physiotherapy and modern gadgets and also a team of qualified and dedicated experts from different branches of sports sciences. ', '../../assets/img/services images/Sports-Medicine.jpg', NULL, '2019-08-08 09:27:52', NULL, 0, 0, NULL, 1);
INSERT INTO `HealthServiceMaster` (`ID`, `Name`, `Description`, `ImageUrl`, `PageUrl`, `CreatedDate`, `UpdatedDate`, `IsDeleted`, `Type`, `ServicesIncluded`, `CompanyID`) VALUES(13, 'Nutrition / Dietician', 'Dietetics is about healthy eating practices which act as a preventive and curative means and pave the foundation for a healthier life. At  Leela Healthcare, we regularly counsel our patients about a nutritious, balanced diet that consists of carbohydrates, fats, proteins, minerals, vitamins and electrolytes for their general well-being. Good nutrition is essential for normal organ development and function, normal reproduction, growth and maintenance of muscles and tissue, optimum activity and working efficiency, building resistance to infection and in repairing body damage or injury. The Nutrition and Dietetics team at Leela HealthCare aims to improve the clinical, biochemical, cellular and psychological status of individuals experiencing complications or side effects of various treatments by providing adequate nutrition and related information.', '../../assets/img/services images/nutrition-dietician.jpg', NULL, '2019-08-08 09:27:52', NULL, 0, 0, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `HospitalMaster`
--

CREATE TABLE `HospitalMaster` (
  `ID` int(9) NOT NULL,
  `Name` varchar(245) NOT NULL,
  `Type` int(1) NOT NULL DEFAULT '1',
  `Address` varchar(245) DEFAULT NULL,
  `City` int(3) NOT NULL,
  `State` int(2) DEFAULT NULL,
  `PinCode` varchar(10) DEFAULT NULL,
  `IsDeleted` int(1) NOT NULL DEFAULT '1',
  `Status` int(1) NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `JobApplication`
--

CREATE TABLE `JobApplication` (
  `ID` int(11) NOT NULL,
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
  `CompanyID` int(2) NOT NULL DEFAULT '99'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `JobApplication`
--

INSERT INTO `JobApplication` (`ID`, `FirstName`, `LastName`, `Email`, `Phone`, `Address`, `City`, `ZipCode`, `ResumeText`, `ResumePath`, `CreatedDate`, `CompanyID`) VALUES(14, 'Neeraj', 'Singh', 'neer.s@outlook.com', '9599660409', NULL, 'Noida', NULL, 'f hgvhabjhbajhbanaanan aghab jab', 'C:\\PROJECTS\\IQHealth\\IqHealth\\IqHealth.WebApi\\Content\\Resumes\\9599660409_neer.s@outlook.com.pdf', '2020-04-11 01:15:47', 2);
INSERT INTO `JobApplication` (`ID`, `FirstName`, `LastName`, `Email`, `Phone`, `Address`, `City`, `ZipCode`, `ResumeText`, `ResumePath`, `CreatedDate`, `CompanyID`) VALUES(15, 'Neeraj', 'Singh', 'neemate@ymail.com', '9599660409', NULL, 'Noida', NULL, ' gfjrsfsdjhf bsdkf sd nsdg sdkgd gksfdk.gnfds.g sdf.gmsfdg.,dfmg.,sd gfd.,hsdhdgnhsd nhk.jsfn dfkshdfgl hdsfh sdfh df cgh \ndgf hdfg\nh dfg \nhdfgh\n dghdfgh gdfj dfg', 'G:\\PleskVhosts\\health-iq.in\\health-iq.in\\Content\\Resumes\\9599660409_neemate@ymail.com.pdf', '2020-04-10 07:34:59', 2);
INSERT INTO `JobApplication` (`ID`, `FirstName`, `LastName`, `Email`, `Phone`, `Address`, `City`, `ZipCode`, `ResumeText`, `ResumePath`, `CreatedDate`, `CompanyID`) VALUES(12, 'Neeraj', 'Singh', 'neer19ultimate@gmail.com', '9599660409', NULL, 'Noida', NULL, NULL, 'C:\\PROJECTS\\IQHealth\\IqHealth\\IqHealth.WebApi\\Content\\Resumes\\9599660409_neer19ultimate@gmail.com.pdf', '2020-04-10 19:35:43', 2);
INSERT INTO `JobApplication` (`ID`, `FirstName`, `LastName`, `Email`, `Phone`, `Address`, `City`, `ZipCode`, `ResumeText`, `ResumePath`, `CreatedDate`, `CompanyID`) VALUES(13, 'Neeraj', 'Singh', 'singh.neer@ymail.com', '8527818810', NULL, 'New Delhi', NULL, NULL, 'G:\\PleskVhosts\\health-iq.in\\health-iq.in\\Content\\Resumes\\8527818810_singh.neer@ymail.com.pdf', '2020-04-10 14:01:02', 2);

-- --------------------------------------------------------

--
-- Table structure for table `Login`
--

CREATE TABLE `Login` (
  `Id` int(11) NOT NULL,
  `UserID` int(9) DEFAULT NULL,
  `Password` varchar(20) NOT NULL,
  `LastLoginDate` datetime DEFAULT NULL,
  `LastLoginStatus` int(1) DEFAULT NULL,
  `LoginDate` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Login`
--

INSERT INTO `Login` (`Id`, `UserID`, `Password`, `LastLoginDate`, `LastLoginStatus`, `LoginDate`) VALUES(1, 1, 'Krishna_2012', '2019-07-25 00:00:00', 1, '2019-07-25 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `OnlineEnquiry`
--

CREATE TABLE `OnlineEnquiry` (
  `ID` int(9) NOT NULL,
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
  `CreatedDate` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `OnlineEnquiry`
--

INSERT INTO `OnlineEnquiry` (`ID`, `Type`, `TypeValue`, `Name`, `Email`, `Phone`, `AltPhone`, `Subject`, `Message`, `Status`, `Address`, `Place`, `City`, `State`, `Country`, `CaptchaText`, `CaptchaVerified`, `CompanyID`, `CreatedDate`) VALUES(42, 2, 1, 'Akash', 'akash.shil15@nshm.edu.in', '7908181407', NULL, 'Enquiry For Courses.', 'I ', 0, '', '', '', '', 1, '', 0, 2, '2020-03-31 07:29:49');
INSERT INTO `OnlineEnquiry` (`ID`, `Type`, `TypeValue`, `Name`, `Email`, `Phone`, `AltPhone`, `Subject`, `Message`, `Status`, `Address`, `Place`, `City`, `State`, `Country`, `CaptchaText`, `CaptchaVerified`, `CompanyID`, `CreatedDate`) VALUES(41, 2, 3, 'Neeraj Singh', 'singh.neer@ymail.com', '08527818810', NULL, 'Enquiry For Courses.', 'hhgj', 0, '', 'ftyg', '', '', 1, '', 0, 2, '2020-02-05 17:36:45');
INSERT INTO `OnlineEnquiry` (`ID`, `Type`, `TypeValue`, `Name`, `Email`, `Phone`, `AltPhone`, `Subject`, `Message`, `Status`, `Address`, `Place`, `City`, `State`, `Country`, `CaptchaText`, `CaptchaVerified`, `CompanyID`, `CreatedDate`) VALUES(40, 2, 5, 'Neeraj Singh', 'singh.neer@ymail.com', '08527818810', NULL, 'Enquiry For Courses.', 'chgvjhvhm', 0, '', 'ertgy', '', '', 1, '', 0, 2, '2020-02-05 17:32:49');
INSERT INTO `OnlineEnquiry` (`ID`, `Type`, `TypeValue`, `Name`, `Email`, `Phone`, `AltPhone`, `Subject`, `Message`, `Status`, `Address`, `Place`, `City`, `State`, `Country`, `CaptchaText`, `CaptchaVerified`, `CompanyID`, `CreatedDate`) VALUES(39, 2, 4, 'Neeraj Singh', 'neer.s@outlook.com', '09599660409', NULL, 'Enquiry For Courses.', 'jg jbk kk  k', 0, '', 'Yt', '', '', 1, '', 0, 2, '2020-02-05 14:47:30');
INSERT INTO `OnlineEnquiry` (`ID`, `Type`, `TypeValue`, `Name`, `Email`, `Phone`, `AltPhone`, `Subject`, `Message`, `Status`, `Address`, `Place`, `City`, `State`, `Country`, `CaptchaText`, `CaptchaVerified`, `CompanyID`, `CreatedDate`) VALUES(38, 2, 4, 'Neeraj Singh', 'neer.s@outlook.com', '09599660409', NULL, 'Enquiry For Courses.', 'fgcghchn', 0, '', 'dxfc b', '', '', 1, '', 0, 2, '2020-02-05 14:38:55');
INSERT INTO `OnlineEnquiry` (`ID`, `Type`, `TypeValue`, `Name`, `Email`, `Phone`, `AltPhone`, `Subject`, `Message`, `Status`, `Address`, `Place`, `City`, `State`, `Country`, `CaptchaText`, `CaptchaVerified`, `CompanyID`, `CreatedDate`) VALUES(37, 2, 4, 'Neeraj Singh', 'neer.s@outlook.com', '09599660409', NULL, 'Enquiry For Courses.', 'fgcghchn', 0, '', 'dxfc b', '', '', 1, '', 0, 2, '2020-02-05 14:35:00');
INSERT INTO `OnlineEnquiry` (`ID`, `Type`, `TypeValue`, `Name`, `Email`, `Phone`, `AltPhone`, `Subject`, `Message`, `Status`, `Address`, `Place`, `City`, `State`, `Country`, `CaptchaText`, `CaptchaVerified`, `CompanyID`, `CreatedDate`) VALUES(36, 2, 4, 'Neeraj Singh', 'neer.s@outlook.com', '09599660409', NULL, 'Enquiry For Courses.', 'fgcghchn', 0, '', 'dxfc b', '', '', 1, '', 0, 2, '2020-02-05 14:34:20');
INSERT INTO `OnlineEnquiry` (`ID`, `Type`, `TypeValue`, `Name`, `Email`, `Phone`, `AltPhone`, `Subject`, `Message`, `Status`, `Address`, `Place`, `City`, `State`, `Country`, `CaptchaText`, `CaptchaVerified`, `CompanyID`, `CreatedDate`) VALUES(35, 2, 4, 'Neeraj Singh', 'neer.s@outlook.com', '09599660409', NULL, 'Enquiry For Courses.', 'fgcghchn', 0, '', 'dxfc b', '', '', 1, '', 0, 2, '2020-02-05 14:32:46');
INSERT INTO `OnlineEnquiry` (`ID`, `Type`, `TypeValue`, `Name`, `Email`, `Phone`, `AltPhone`, `Subject`, `Message`, `Status`, `Address`, `Place`, `City`, `State`, `Country`, `CaptchaText`, `CaptchaVerified`, `CompanyID`, `CreatedDate`) VALUES(34, 2, 4, 'Neeraj Singh', 'singh.neer@ymail.com', '08527818810', NULL, 'Enquiry For Courses.', 'chgchchhg', 0, '', '', '', '', 1, '', 0, 2, '2020-02-05 12:44:08');
INSERT INTO `OnlineEnquiry` (`ID`, `Type`, `TypeValue`, `Name`, `Email`, `Phone`, `AltPhone`, `Subject`, `Message`, `Status`, `Address`, `Place`, `City`, `State`, `Country`, `CaptchaText`, `CaptchaVerified`, `CompanyID`, `CreatedDate`) VALUES(33, 2, 2, 'Neeraj Singh', 'singh.neer@ymail.com', '08527818810', NULL, 'Enquiry For Courses.', 'edtrfytgjb', 0, '', 'fgh', '', '', 1, '', 0, 2, '2020-02-05 12:30:28');
INSERT INTO `OnlineEnquiry` (`ID`, `Type`, `TypeValue`, `Name`, `Email`, `Phone`, `AltPhone`, `Subject`, `Message`, `Status`, `Address`, `Place`, `City`, `State`, `Country`, `CaptchaText`, `CaptchaVerified`, `CompanyID`, `CreatedDate`) VALUES(32, 2, 4, 'Neeraj Singh', 'singh.neer@ymail.com', '08527818810', NULL, 'Enquiry For Courses.', 'dfxgfchvb ', 0, '', '', '', '', 1, '', 0, 2, '2020-02-05 11:27:29');
INSERT INTO `OnlineEnquiry` (`ID`, `Type`, `TypeValue`, `Name`, `Email`, `Phone`, `AltPhone`, `Subject`, `Message`, `Status`, `Address`, `Place`, `City`, `State`, `Country`, `CaptchaText`, `CaptchaVerified`, `CompanyID`, `CreatedDate`) VALUES(31, 2, 4, 'Neeraj Singh', 'singh.neer@ymail.com', '08527818810', NULL, 'Enquiry For Courses.', 'dfxgfchvb ', 0, '', '', '', '', 1, '', 0, 2, '2020-02-05 11:27:17');
INSERT INTO `OnlineEnquiry` (`ID`, `Type`, `TypeValue`, `Name`, `Email`, `Phone`, `AltPhone`, `Subject`, `Message`, `Status`, `Address`, `Place`, `City`, `State`, `Country`, `CaptchaText`, `CaptchaVerified`, `CompanyID`, `CreatedDate`) VALUES(30, 2, 3, 'Neeraj Singh', 'singh.neer@ymail.com', '08527818810', NULL, 'Enquiry For Courses.', 'ertfyghvjb', 0, '', '45erd6yftv', '', '', 1, '', 0, 2, '2020-02-05 11:24:53');
INSERT INTO `OnlineEnquiry` (`ID`, `Type`, `TypeValue`, `Name`, `Email`, `Phone`, `AltPhone`, `Subject`, `Message`, `Status`, `Address`, `Place`, `City`, `State`, `Country`, `CaptchaText`, `CaptchaVerified`, `CompanyID`, `CreatedDate`) VALUES(29, 2, 6, 'Neeraj Singh', 'neer.s@outlook.com', '09599660409', NULL, 'Enquiry For Courses.', 'bvm ', 0, '', 'noida', '', '', 1, '', 0, 2, '2020-02-05 11:17:35');
INSERT INTO `OnlineEnquiry` (`ID`, `Type`, `TypeValue`, `Name`, `Email`, `Phone`, `AltPhone`, `Subject`, `Message`, `Status`, `Address`, `Place`, `City`, `State`, `Country`, `CaptchaText`, `CaptchaVerified`, `CompanyID`, `CreatedDate`) VALUES(28, 2, 7, 'Neeraj Singh', 'neer19ultimate@gmail.com', '09599660409', NULL, 'Enquiry For Courses.', 'gdg', 0, '', 'unn', '', '', 1, '', 0, 2, '2020-02-05 01:39:31');
INSERT INTO `OnlineEnquiry` (`ID`, `Type`, `TypeValue`, `Name`, `Email`, `Phone`, `AltPhone`, `Subject`, `Message`, `Status`, `Address`, `Place`, `City`, `State`, `Country`, `CaptchaText`, `CaptchaVerified`, `CompanyID`, `CreatedDate`) VALUES(27, 2, 4, 'Neeraj Singh', 'neer.s@outlook.com', '09599660409', NULL, 'Enquiry For Courses.', 'hhhh', 0, '', 'jh', '', '', 1, '', 0, 2, '2020-02-05 01:13:58');
INSERT INTO `OnlineEnquiry` (`ID`, `Type`, `TypeValue`, `Name`, `Email`, `Phone`, `AltPhone`, `Subject`, `Message`, `Status`, `Address`, `Place`, `City`, `State`, `Country`, `CaptchaText`, `CaptchaVerified`, `CompanyID`, `CreatedDate`) VALUES(26, 2, 5, 'Neeraj Singh', 'singh.neer@ymail.com', '08527818810', NULL, 'Enquiry For Courses.', 'hhgv', 0, '', '', '', '', 1, '', 0, 2, '2020-02-05 01:12:27');
INSERT INTO `OnlineEnquiry` (`ID`, `Type`, `TypeValue`, `Name`, `Email`, `Phone`, `AltPhone`, `Subject`, `Message`, `Status`, `Address`, `Place`, `City`, `State`, `Country`, `CaptchaText`, `CaptchaVerified`, `CompanyID`, `CreatedDate`) VALUES(25, 2, 2, 'Neeraj Singh', 'neer.s@outlook.com', '09599660409', NULL, 'Enquiry For Courses.', 'edrgv', 0, '', '', '', '', 1, '', 0, 2, '2020-02-05 01:09:40');

-- --------------------------------------------------------

--
-- Table structure for table `OrganizeCampEnquiry`
--

CREATE TABLE `OrganizeCampEnquiry` (
  `ID` int(9) NOT NULL,
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
  `CompanyID` int(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `OrganizeCampEnquiry`
--

INSERT INTO `OrganizeCampEnquiry` (`ID`, `Name`, `Mobile`, `Email`, `ExpectedCount`, `Address`, `City`, `State`, `Message`, `CreatedDate`, `IsDeleted`, `Status`, `CompanyID`) VALUES(67, 'Neeraj Singh', '08527818810', 'singh.neer@ymail.com', 89, 'CAP Global', 7, 0, NULL, '2020-03-28 20:21:16', 0, 0, 2);
INSERT INTO `OrganizeCampEnquiry` (`ID`, `Name`, `Mobile`, `Email`, `ExpectedCount`, `Address`, `City`, `State`, `Message`, `CreatedDate`, `IsDeleted`, `Status`, `CompanyID`) VALUES(68, 'Neeraj Singh', '09599660409', 'neer19ultimate@gmail.com', 12, 'CAP Global', 2, 0, NULL, '2020-04-10 14:29:37', 0, 0, 2);
INSERT INTO `OrganizeCampEnquiry` (`ID`, `Name`, `Mobile`, `Email`, `ExpectedCount`, `Address`, `City`, `State`, `Message`, `CreatedDate`, `IsDeleted`, `Status`, `CompanyID`) VALUES(69, 'Neeraj Singh', '08527818810', 'singh.neer@ymail.com', 3, '', 2, 0, NULL, '2020-04-10 14:37:00', 0, 0, 2);

-- --------------------------------------------------------

--
-- Table structure for table `PackageCategory`
--

CREATE TABLE `PackageCategory` (
  `ID` int(3) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Title` varchar(255) NOT NULL,
  `SubTitle` varchar(500) DEFAULT NULL,
  `ImageUrl` varchar(1005) DEFAULT NULL,
  `About` varchar(1500) DEFAULT NULL,
  `IsDeleted` int(1) NOT NULL DEFAULT '0',
  `CompanyID` int(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `PackageCategory`
--

INSERT INTO `PackageCategory` (`ID`, `Name`, `Title`, `SubTitle`, `ImageUrl`, `About`, `IsDeleted`, `CompanyID`) VALUES(1, 'Basic', 'Basic', NULL, '../../assets/img/h-packages/basic.jpg', NULL, 0, NULL);
INSERT INTO `PackageCategory` (`ID`, `Name`, `Title`, `SubTitle`, `ImageUrl`, `About`, `IsDeleted`, `CompanyID`) VALUES(2, 'Diabetes', 'Diabetes', NULL, '../../assets/img/h-packages/diabetese.jpg', NULL, 0, NULL);
INSERT INTO `PackageCategory` (`ID`, `Name`, `Title`, `SubTitle`, `ImageUrl`, `About`, `IsDeleted`, `CompanyID`) VALUES(3, 'Cardiac', 'Cardiac', NULL, '../../assets/img/h-packages/cardiac.jpg', NULL, 0, NULL);
INSERT INTO `PackageCategory` (`ID`, `Name`, `Title`, `SubTitle`, `ImageUrl`, `About`, `IsDeleted`, `CompanyID`) VALUES(4, 'Full Body', 'Full Body', NULL, '../../assets/img/h-packages/full-body.jpg', NULL, 0, NULL);
INSERT INTO `PackageCategory` (`ID`, `Name`, `Title`, `SubTitle`, `ImageUrl`, `About`, `IsDeleted`, `CompanyID`) VALUES(5, 'Wellness', 'Wellness', NULL, '../../assets/img/h-packages/wellness.jpg', NULL, 0, NULL);
INSERT INTO `PackageCategory` (`ID`, `Name`, `Title`, `SubTitle`, `ImageUrl`, `About`, `IsDeleted`, `CompanyID`) VALUES(6, 'Pre Marital check', 'Pre Marital check', NULL, '../../assets/img/h-packages/pre-marital.jpg', NULL, 0, NULL);
INSERT INTO `PackageCategory` (`ID`, `Name`, `Title`, `SubTitle`, `ImageUrl`, `About`, `IsDeleted`, `CompanyID`) VALUES(7, 'Senior Citizen', 'Senior Citizen', NULL, '../../assets/img/h-packages/senior-citizen.jpg', NULL, 0, NULL);
INSERT INTO `PackageCategory` (`ID`, `Name`, `Title`, `SubTitle`, `ImageUrl`, `About`, `IsDeleted`, `CompanyID`) VALUES(8, 'Executive Pack', 'Executive Pack', NULL, '../../assets/img/h-packages/executive-pack.jpg', NULL, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `PackageMaster`
--

CREATE TABLE `PackageMaster` (
  `ID` int(5) NOT NULL,
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
  `Sequence` int(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `PackageMaster`
--

INSERT INTO `PackageMaster` (`ID`, `Name`, `Title`, `SubTitle`, `About`, `Cost`, `Status`, `CatgID`, `CreatedDate`, `IsDeleted`, `UpdatedDate`, `ImageUrl`, `CompanyID`, `Sequence`) VALUES(1, 'MINI BODY CHECK MALE', 'MINI BODY CHECK MALE', NULL, 'COMPLETE BLOOD COUNT (CBC),\r\nCOMPLETE URINE, EXAMINATION,\r\nCHOLESTEROL - SERUM,\r\nGLUCOSE FASTING', '600.00', 1, 1, '2019-07-28 00:00:00', 0, '2019-07-28 00:00:00', NULL, 99, NULL);
INSERT INTO `PackageMaster` (`ID`, `Name`, `Title`, `SubTitle`, `About`, `Cost`, `Status`, `CatgID`, `CreatedDate`, `IsDeleted`, `UpdatedDate`, `ImageUrl`, `CompanyID`, `Sequence`) VALUES(2, 'MINI BODY CHECK FEMALE', 'MINI BODY CHECK FEMALE', NULL, 'MINI BODY CHECK FEMALE', '850.00', 1, 1, '2019-07-28 00:00:00', 0, '2019-07-28 00:00:00', NULL, 99, NULL);
INSERT INTO `PackageMaster` (`ID`, `Name`, `Title`, `SubTitle`, `About`, `Cost`, `Status`, `CatgID`, `CreatedDate`, `IsDeleted`, `UpdatedDate`, `ImageUrl`, `CompanyID`, `Sequence`) VALUES(3, 'DIABETIC CHECK', 'DIABETIC CHECK', NULL, 'DIABETIC CHECK', '499.00', 1, 2, '2019-07-28 00:00:00', 0, '2019-07-28 00:00:00', NULL, 99, NULL);
INSERT INTO `PackageMaster` (`ID`, `Name`, `Title`, `SubTitle`, `About`, `Cost`, `Status`, `CatgID`, `CreatedDate`, `IsDeleted`, `UpdatedDate`, `ImageUrl`, `CompanyID`, `Sequence`) VALUES(4, 'DIABETIC PANEL', 'DIABETIC PANEL', NULL, 'DIABETIC PANEL', '699.00', 1, 2, '2019-07-28 00:00:00', 0, '2019-07-28 00:00:00', NULL, 99, NULL);
INSERT INTO `PackageMaster` (`ID`, `Name`, `Title`, `SubTitle`, `About`, `Cost`, `Status`, `CatgID`, `CreatedDate`, `IsDeleted`, `UpdatedDate`, `ImageUrl`, `CompanyID`, `Sequence`) VALUES(5, 'DIABETES MONITORING PANEL', 'DIABETES MONITORING PANEL', NULL, 'DIABETES MONITORING PANEL', '950.00', 1, 2, '2019-07-28 00:00:00', 0, '2019-07-28 00:00:00', NULL, 99, NULL);
INSERT INTO `PackageMaster` (`ID`, `Name`, `Title`, `SubTitle`, `About`, `Cost`, `Status`, `CatgID`, `CreatedDate`, `IsDeleted`, `UpdatedDate`, `ImageUrl`, `CompanyID`, `Sequence`) VALUES(6, 'Diabetes Check Gold', 'Diabetes Check Gold', NULL, NULL, '1100.00', 1, 2, '2019-07-28 00:00:00', 0, '2019-07-28 00:00:00', NULL, 99, NULL);
INSERT INTO `PackageMaster` (`ID`, `Name`, `Title`, `SubTitle`, `About`, `Cost`, `Status`, `CatgID`, `CreatedDate`, `IsDeleted`, `UpdatedDate`, `ImageUrl`, `CompanyID`, `Sequence`) VALUES(7, 'MASTER CHECK DIABETES', 'MASTER CHECK DIABETES', NULL, NULL, '1590.00', 1, 2, '2019-07-28 00:00:00', 0, '2019-07-28 00:00:00', NULL, 99, NULL);
INSERT INTO `PackageMaster` (`ID`, `Name`, `Title`, `SubTitle`, `About`, `Cost`, `Status`, `CatgID`, `CreatedDate`, `IsDeleted`, `UpdatedDate`, `ImageUrl`, `CompanyID`, `Sequence`) VALUES(8, 'EXECUTIVE PACK -II', NULL, 'DIABETIC CHECK UP', NULL, '1700.00', 1, 2, '2019-07-28 00:00:00', 0, '2019-07-28 00:00:00', NULL, 99, NULL);
INSERT INTO `PackageMaster` (`ID`, `Name`, `Title`, `SubTitle`, `About`, `Cost`, `Status`, `CatgID`, `CreatedDate`, `IsDeleted`, `UpdatedDate`, `ImageUrl`, `CompanyID`, `Sequence`) VALUES(9, 'HEALTHY HEART', 'HEALTHY HEART', NULL, NULL, '799.00', 1, 3, '2019-07-28 00:00:00', 0, '2019-07-28 00:00:00', NULL, 99, NULL);
INSERT INTO `PackageMaster` (`ID`, `Name`, `Title`, `SubTitle`, `About`, `Cost`, `Status`, `CatgID`, `CreatedDate`, `IsDeleted`, `UpdatedDate`, `ImageUrl`, `CompanyID`, `Sequence`) VALUES(10, 'HEALTHY HEART EXTENDED', 'HEALTHY HEART EXTENDED', NULL, NULL, '1299.00', 1, 3, '2019-07-28 00:00:00', 0, '2019-07-28 00:00:00', NULL, 99, NULL);
INSERT INTO `PackageMaster` (`ID`, `Name`, `Title`, `SubTitle`, `About`, `Cost`, `Status`, `CatgID`, `CreatedDate`, `IsDeleted`, `UpdatedDate`, `ImageUrl`, `CompanyID`, `Sequence`) VALUES(11, 'BASIC CARDIAC CHECK UP', 'BASIC CARDIAC CHECK UP', NULL, NULL, '1400.00', 1, 3, '2019-07-28 00:00:00', 0, '2019-07-28 00:00:00', NULL, 99, NULL);
INSERT INTO `PackageMaster` (`ID`, `Name`, `Title`, `SubTitle`, `About`, `Cost`, `Status`, `CatgID`, `CreatedDate`, `IsDeleted`, `UpdatedDate`, `ImageUrl`, `CompanyID`, `Sequence`) VALUES(12, 'EXECUTIVE PACK -III CARDIAC CHECK UP', 'EXECUTIVE PACK -III CARDIAC CHECK UP', NULL, NULL, '3200.00', 1, 3, '2019-07-28 00:00:00', 0, '2019-07-28 00:00:00', NULL, 99, NULL);
INSERT INTO `PackageMaster` (`ID`, `Name`, `Title`, `SubTitle`, `About`, `Cost`, `Status`, `CatgID`, `CreatedDate`, `IsDeleted`, `UpdatedDate`, `ImageUrl`, `CompanyID`, `Sequence`) VALUES(13, 'MASTER CHECK BASIC', 'MASTER CHECK BASIC', NULL, NULL, '1990.00', 1, 1, '2019-07-28 00:00:00', 0, '2019-07-28 00:00:00', NULL, 99, NULL);
INSERT INTO `PackageMaster` (`ID`, `Name`, `Title`, `SubTitle`, `About`, `Cost`, `Status`, `CatgID`, `CreatedDate`, `IsDeleted`, `UpdatedDate`, `ImageUrl`, `CompanyID`, `Sequence`) VALUES(14, 'AYUSH SMART 1  ', 'AYUSH SMART 1  ', NULL, NULL, '899.00', 1, 1, '2019-07-28 00:00:00', 0, '2019-07-28 00:00:00', NULL, 99, NULL);
INSERT INTO `PackageMaster` (`ID`, `Name`, `Title`, `SubTitle`, `About`, `Cost`, `Status`, `CatgID`, `CreatedDate`, `IsDeleted`, `UpdatedDate`, `ImageUrl`, `CompanyID`, `Sequence`) VALUES(15, 'AYUSH SMART 2', 'AYUSH SMART 2', NULL, NULL, '1199.00', 1, 1, '2019-07-28 00:00:00', 0, '2019-07-28 00:00:00', NULL, 99, NULL);
INSERT INTO `PackageMaster` (`ID`, `Name`, `Title`, `SubTitle`, `About`, `Cost`, `Status`, `CatgID`, `CreatedDate`, `IsDeleted`, `UpdatedDate`, `ImageUrl`, `CompanyID`, `Sequence`) VALUES(16, 'AYUSH SMART 3', 'AYUSH SMART 3', NULL, NULL, '1899.00', 1, 1, '2019-07-28 00:00:00', 0, '2019-07-28 00:00:00', NULL, 99, NULL);
INSERT INTO `PackageMaster` (`ID`, `Name`, `Title`, `SubTitle`, `About`, `Cost`, `Status`, `CatgID`, `CreatedDate`, `IsDeleted`, `UpdatedDate`, `ImageUrl`, `CompanyID`, `Sequence`) VALUES(17, 'MASTER CHECK LITE', 'MASTER CHECK LITE', NULL, NULL, '2490.00', 1, 4, '2019-07-28 00:00:00', 0, '2019-07-28 00:00:00', NULL, 99, NULL);
INSERT INTO `PackageMaster` (`ID`, `Name`, `Title`, `SubTitle`, `About`, `Cost`, `Status`, `CatgID`, `CreatedDate`, `IsDeleted`, `UpdatedDate`, `ImageUrl`, `CompanyID`, `Sequence`) VALUES(18, 'MASTER CHECK SILVER', 'MASTER CHECK SILVER', NULL, NULL, '2890.00', 1, 4, '2019-07-28 00:00:00', 0, '2019-07-28 00:00:00', NULL, 99, NULL);
INSERT INTO `PackageMaster` (`ID`, `Name`, `Title`, `SubTitle`, `About`, `Cost`, `Status`, `CatgID`, `CreatedDate`, `IsDeleted`, `UpdatedDate`, `ImageUrl`, `CompanyID`, `Sequence`) VALUES(19, 'MASTER CHECK GOLD', 'MASTER CHECK GOLD', NULL, NULL, '4150.00', 1, 4, '2019-07-28 00:00:00', 0, '2019-07-28 00:00:00', NULL, 99, NULL);
INSERT INTO `PackageMaster` (`ID`, `Name`, `Title`, `SubTitle`, `About`, `Cost`, `Status`, `CatgID`, `CreatedDate`, `IsDeleted`, `UpdatedDate`, `ImageUrl`, `CompanyID`, `Sequence`) VALUES(20, 'MASTER CHECK DIAMOND', 'MASTER CHECK DIAMOND', NULL, NULL, '5490.00', 1, 4, '2019-07-28 00:00:00', 0, '2019-07-28 00:00:00', NULL, 99, NULL);
INSERT INTO `PackageMaster` (`ID`, `Name`, `Title`, `SubTitle`, `About`, `Cost`, `Status`, `CatgID`, `CreatedDate`, `IsDeleted`, `UpdatedDate`, `ImageUrl`, `CompanyID`, `Sequence`) VALUES(21, 'MASTER CHECK PLATINUM', 'MASTER CHECK PLATINUM', NULL, NULL, '6990.00', 1, 4, '2019-07-28 00:00:00', 0, '2019-07-28 00:00:00', NULL, 99, NULL);
INSERT INTO `PackageMaster` (`ID`, `Name`, `Title`, `SubTitle`, `About`, `Cost`, `Status`, `CatgID`, `CreatedDate`, `IsDeleted`, `UpdatedDate`, `ImageUrl`, `CompanyID`, `Sequence`) VALUES(22, 'THYROID PANEL', 'THYROID PANEL', NULL, NULL, '899.00', 1, 5, '2019-07-28 00:00:00', 0, '2019-07-28 00:00:00', NULL, 99, NULL);
INSERT INTO `PackageMaster` (`ID`, `Name`, `Title`, `SubTitle`, `About`, `Cost`, `Status`, `CatgID`, `CreatedDate`, `IsDeleted`, `UpdatedDate`, `ImageUrl`, `CompanyID`, `Sequence`) VALUES(23, 'VITAMIN CHECK', 'VITAMIN CHECK', NULL, NULL, '1299.00', 1, 5, '2019-07-28 00:00:00', 0, '2019-07-28 00:00:00', NULL, 99, NULL);
INSERT INTO `PackageMaster` (`ID`, `Name`, `Title`, `SubTitle`, `About`, `Cost`, `Status`, `CatgID`, `CreatedDate`, `IsDeleted`, `UpdatedDate`, `ImageUrl`, `CompanyID`, `Sequence`) VALUES(24, 'PAIN CHECK', 'PAIN CHECK', 'Body check', NULL, '1999.00', 1, 5, '2019-07-28 00:00:00', 0, '2019-07-28 00:00:00', NULL, 99, NULL);
INSERT INTO `PackageMaster` (`ID`, `Name`, `Title`, `SubTitle`, `About`, `Cost`, `Status`, `CatgID`, `CreatedDate`, `IsDeleted`, `UpdatedDate`, `ImageUrl`, `CompanyID`, `Sequence`) VALUES(25, 'BONE PROFILE', 'BONE PROFILE', NULL, NULL, '2999.00', 1, 5, '2019-07-28 00:00:00', 0, '2019-07-28 00:00:00', NULL, 99, NULL);
INSERT INTO `PackageMaster` (`ID`, `Name`, `Title`, `SubTitle`, `About`, `Cost`, `Status`, `CatgID`, `CreatedDate`, `IsDeleted`, `UpdatedDate`, `ImageUrl`, `CompanyID`, `Sequence`) VALUES(26, 'PRE MARITAL HEALTH CHECKUP1 (MALE)', 'PRE MARITAL HEALTH CHECKUP1 (MALE)', NULL, NULL, '4859.00', 1, 6, '2019-07-28 00:00:00', 0, '2019-07-28 00:00:00', NULL, 99, NULL);
INSERT INTO `PackageMaster` (`ID`, `Name`, `Title`, `SubTitle`, `About`, `Cost`, `Status`, `CatgID`, `CreatedDate`, `IsDeleted`, `UpdatedDate`, `ImageUrl`, `CompanyID`, `Sequence`) VALUES(27, 'PRE MARITAL HEALTH CHECKUP 1(FEMALE)', 'PRE MARITAL HEALTH CHECKUP 1(FEMALE)', NULL, NULL, '1829.00', 1, 6, '2019-07-28 00:00:00', 0, '2019-07-28 00:00:00', NULL, 99, NULL);
INSERT INTO `PackageMaster` (`ID`, `Name`, `Title`, `SubTitle`, `About`, `Cost`, `Status`, `CatgID`, `CreatedDate`, `IsDeleted`, `UpdatedDate`, `ImageUrl`, `CompanyID`, `Sequence`) VALUES(28, 'PRE MARITAL HEALTH CHECKUP 3(FEMALE)', 'PRE MARITAL HEALTH CHECKUP 3(FEMALE)', NULL, NULL, '3279.00', 1, 6, '2019-07-28 00:00:00', 0, '2019-07-28 00:00:00', NULL, 99, NULL);
INSERT INTO `PackageMaster` (`ID`, `Name`, `Title`, `SubTitle`, `About`, `Cost`, `Status`, `CatgID`, `CreatedDate`, `IsDeleted`, `UpdatedDate`, `ImageUrl`, `CompanyID`, `Sequence`) VALUES(29, 'PRE MARITAL HEALTH CHECKUP 2 (MALE)', 'PRE MARITAL HEALTH CHECKUP (MALE)', NULL, NULL, '3279.00', 1, 6, '2019-07-28 00:00:00', 0, '2019-07-28 00:00:00', NULL, 99, NULL);
INSERT INTO `PackageMaster` (`ID`, `Name`, `Title`, `SubTitle`, `About`, `Cost`, `Status`, `CatgID`, `CreatedDate`, `IsDeleted`, `UpdatedDate`, `ImageUrl`, `CompanyID`, `Sequence`) VALUES(30, 'PRE MARITAL HEALTH CHECKUP2(FEMALE)', 'PRE MARITAL HEALTH CHECKUP2(FEMALE)', NULL, NULL, '4859.00', 1, 6, '2019-07-28 00:00:00', 0, '2019-07-28 00:00:00', NULL, 99, NULL);
INSERT INTO `PackageMaster` (`ID`, `Name`, `Title`, `SubTitle`, `About`, `Cost`, `Status`, `CatgID`, `CreatedDate`, `IsDeleted`, `UpdatedDate`, `ImageUrl`, `CompanyID`, `Sequence`) VALUES(31, 'For MEN', 'For MEN', NULL, NULL, '3190.00', 1, 7, '2019-07-28 00:00:00', 0, '2019-07-28 00:00:00', NULL, 99, NULL);
INSERT INTO `PackageMaster` (`ID`, `Name`, `Title`, `SubTitle`, `About`, `Cost`, `Status`, `CatgID`, `CreatedDate`, `IsDeleted`, `UpdatedDate`, `ImageUrl`, `CompanyID`, `Sequence`) VALUES(32, 'For  WOMEN', 'For  WOMEN', NULL, NULL, '3090.00', 1, 7, '2019-07-28 00:00:00', 0, '2019-07-28 00:00:00', NULL, 99, NULL);
INSERT INTO `PackageMaster` (`ID`, `Name`, `Title`, `SubTitle`, `About`, `Cost`, `Status`, `CatgID`, `CreatedDate`, `IsDeleted`, `UpdatedDate`, `ImageUrl`, `CompanyID`, `Sequence`) VALUES(33, 'EXECUTIVE PACK 1', 'EXECUTIVE PACK 1', NULL, NULL, '2950.00', 1, 8, '2019-07-28 00:00:00', 0, '2019-07-28 00:00:00', NULL, 99, NULL);
INSERT INTO `PackageMaster` (`ID`, `Name`, `Title`, `SubTitle`, `About`, `Cost`, `Status`, `CatgID`, `CreatedDate`, `IsDeleted`, `UpdatedDate`, `ImageUrl`, `CompanyID`, `Sequence`) VALUES(34, 'EXECUTIVE PACK II', 'EXECUTIVE PACK II', NULL, NULL, '1700.00', 1, 8, '2019-07-28 00:00:00', 0, '2019-07-28 00:00:00', NULL, 99, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `PartnerEnquiry`
--

CREATE TABLE `PartnerEnquiry` (
  `ID` int(9) NOT NULL,
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
  `CompanyID` int(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `PartnerEnquiry`
--

INSERT INTO `PartnerEnquiry` (`ID`, `Name`, `Mobile`, `Email`, `Address`, `City`, `State`, `Message`, `CreatedDate`, `IsDeleted`, `Status`, `CompanyID`) VALUES(67, 'Neeraj Singh', '09599660409', 'neer.s@outlook.com', 'D- 302 Apex Golf Avenue, Sector 1, Greater Noida West', 2, 0, NULL, '2020-03-28 20:15:06', 0, 0, 2);
INSERT INTO `PartnerEnquiry` (`ID`, `Name`, `Mobile`, `Email`, `Address`, `City`, `State`, `Message`, `CreatedDate`, `IsDeleted`, `Status`, `CompanyID`) VALUES(68, 'Neeraj Singh', '09599660409', 'neer19ultimate@gmail.com', 'G 202 Skytech Mattrot', 7, 0, NULL, '2020-03-28 09:43:58', 0, 0, 2);
INSERT INTO `PartnerEnquiry` (`ID`, `Name`, `Mobile`, `Email`, `Address`, `City`, `State`, `Message`, `CreatedDate`, `IsDeleted`, `Status`, `CompanyID`) VALUES(69, 'Neeraj Singh', '08527818810', 'singh.neer@ymail.com', 'K-93, 2nd Floor,', 2, NULL, NULL, '2020-04-10 14:27:06', 0, 0, 2);
INSERT INTO `PartnerEnquiry` (`ID`, `Name`, `Mobile`, `Email`, `Address`, `City`, `State`, `Message`, `CreatedDate`, `IsDeleted`, `Status`, `CompanyID`) VALUES(70, 'Neeraj Singh', '08527818810', 'singh.neer@ymail.com', 'K-93, 2nd Floor,', 4, NULL, NULL, '2020-04-10 14:38:27', 0, 0, 2);
INSERT INTO `PartnerEnquiry` (`ID`, `Name`, `Mobile`, `Email`, `Address`, `City`, `State`, `Message`, `CreatedDate`, `IsDeleted`, `Status`, `CompanyID`) VALUES(71, 'Neeraj Singh', '08527818810', 'singh.neer@ymail.com', 'K-93, 2nd Floor,', 3, NULL, NULL, '2020-04-10 14:40:25', 0, 0, 2);

-- --------------------------------------------------------

--
-- Table structure for table `SpecialityMaster`
--

CREATE TABLE `SpecialityMaster` (
  `ID` int(9) NOT NULL,
  `Speciality` varchar(145) NOT NULL,
  `Title` varchar(245) DEFAULT NULL,
  `IsDeleted` int(1) NOT NULL DEFAULT '0',
  `ImageUrl` varchar(1000) NOT NULL DEFAULT '../../assets/img/h-packages/cardiac.jpg',
  `LogoUrl` varchar(1000) DEFAULT NULL,
  `CompanyID` int(2) NOT NULL DEFAULT '99'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `SpecialityMaster`
--

INSERT INTO `SpecialityMaster` (`ID`, `Speciality`, `Title`, `IsDeleted`, `ImageUrl`, `LogoUrl`, `CompanyID`) VALUES(1, 'General Physician', 'General Physician', 0, 'http://www.fakingnews.firstpost.com/wp-content/uploads/2018/01/Best-Hopsital-For-Surgical-Care-India-11-300x224.png', NULL, 99);
INSERT INTO `SpecialityMaster` (`ID`, `Speciality`, `Title`, `IsDeleted`, `ImageUrl`, `LogoUrl`, `CompanyID`) VALUES(2, 'Laproscopic Surgery', 'Laproscopic Surgery', 1, 'https://k4q7g7n2.stackpathcdn.com/wp-content/uploads/2017/02/laparoscopic-surgery.jpg', NULL, 99);
INSERT INTO `SpecialityMaster` (`ID`, `Speciality`, `Title`, `IsDeleted`, `ImageUrl`, `LogoUrl`, `CompanyID`) VALUES(3, 'Audiology and Speech Therepy', 'Audiology and Speech Therepy', 1, '../../assets/img/h-packages/cardiac.jpg', NULL, 99);
INSERT INTO `SpecialityMaster` (`ID`, `Speciality`, `Title`, `IsDeleted`, `ImageUrl`, `LogoUrl`, `CompanyID`) VALUES(4, 'Cardiology', 'Cardiology (Heart)', 0, 'http://www.fakingnews.firstpost.com/wp-content/uploads/2018/01/Best-Hopsital-For-Surgical-Care-India-11-300x224.png', NULL, 99);
INSERT INTO `SpecialityMaster` (`ID`, `Speciality`, `Title`, `IsDeleted`, `ImageUrl`, `LogoUrl`, `CompanyID`) VALUES(5, 'Cardiac Surgery', 'Cardiac Surgery (Heart)', 1, '../../assets/img/h-packages/cardiac.jpg', NULL, 99);
INSERT INTO `SpecialityMaster` (`ID`, `Speciality`, `Title`, `IsDeleted`, `ImageUrl`, `LogoUrl`, `CompanyID`) VALUES(6, 'Endocrinologist', 'Endocrinologist', 1, 'https://k4q7g7n2.stackpathcdn.com/wp-content/uploads/2017/02/laparoscopic-surgery.jpg', NULL, 99);
INSERT INTO `SpecialityMaster` (`ID`, `Speciality`, `Title`, `IsDeleted`, `ImageUrl`, `LogoUrl`, `CompanyID`) VALUES(7, 'ENT', 'Ear Nose Tounge', 0, '../../assets/img/h-packages/cardiac.jpg', NULL, 99);
INSERT INTO `SpecialityMaster` (`ID`, `Speciality`, `Title`, `IsDeleted`, `ImageUrl`, `LogoUrl`, `CompanyID`) VALUES(8, 'Diabetes and Endocrinology', 'Diabetes & Endocrinology', 0, 'https://downloads.healthcatalyst.com/wp-content/uploads/2016/12/diabetes-care.jpg', NULL, 99);
INSERT INTO `SpecialityMaster` (`ID`, `Speciality`, `Title`, `IsDeleted`, `ImageUrl`, `LogoUrl`, `CompanyID`) VALUES(9, 'Pediatrics/Paediatric Cardiology', 'Paediatric/Paediatric Intensivist', 0, '../../assets/img/h-packages/cardiac.jpg', NULL, 99);
INSERT INTO `SpecialityMaster` (`ID`, `Speciality`, `Title`, `IsDeleted`, `ImageUrl`, `LogoUrl`, `CompanyID`) VALUES(10, 'Orthopaedic', 'Orthopaedic', 0, 'https://media.istockphoto.com/photos/radiologist-doctor-with-digital-tablet-checking-xray-healthcare-and-picture-id649856016?k=6&m=649856016&s=612x612&w=0&h=kzoxnRizg4drZo0ns47rB45QbgErsUBrSh-ZfGIjs3A=', NULL, 99);
INSERT INTO `SpecialityMaster` (`ID`, `Speciality`, `Title`, `IsDeleted`, `ImageUrl`, `LogoUrl`, `CompanyID`) VALUES(11, 'Gynaecologist', 'Gynaecologist & Obstetrician', 0, 'https://www.mdoctorshub.com/wp-content/uploads/2017/04/1.jpg', NULL, 99);
INSERT INTO `SpecialityMaster` (`ID`, `Speciality`, `Title`, `IsDeleted`, `ImageUrl`, `LogoUrl`, `CompanyID`) VALUES(12, 'Physiotherapist', 'Physiotherapist', 0, 'https://thumbs.dreamstime.com/b/young-woman-wearing-brace-rehabilitation-her-physiotherapist-women-horizontal-view-129652970.jpg', NULL, 99);
INSERT INTO `SpecialityMaster` (`ID`, `Speciality`, `Title`, `IsDeleted`, `ImageUrl`, `LogoUrl`, `CompanyID`) VALUES(13, 'Nutrition/ Dietitian', 'Nutrition/ Dietitian', 0, 'https://image.shutterstock.com/image-photo/young-asian-dietician-nutritionist-holding-260nw-1311225152.jpg', NULL, 99);

-- --------------------------------------------------------

--
-- Table structure for table `SubCourses`
--

CREATE TABLE `SubCourses` (
  `ID` int(9) NOT NULL,
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
  `CompanyID` int(3) NOT NULL DEFAULT '999'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `SubCourses`
--

INSERT INTO `SubCourses` (`ID`, `Name`, `Duration`, `MinQualification`, `MinAge`, `MaxAge`, `IndianAdmissionFee`, `ForeignAdmissionFee`, `IndianOtherFee`, `ForeignOtherFee`, `CourseMasterID`, `CompanyID`) VALUES(1, 'DMLT(Diploma In Medical Laboratory Technician)', 24, '12th - Arts/Commerce', 17, 99, '30000.00', '40000.00', '40000.00', '40000.00', 1, 2);
INSERT INTO `SubCourses` (`ID`, `Name`, `Duration`, `MinQualification`, `MinAge`, `MaxAge`, `IndianAdmissionFee`, `ForeignAdmissionFee`, `IndianOtherFee`, `ForeignOtherFee`, `CourseMasterID`, `CompanyID`) VALUES(2, 'CMLT(Certificate in In Medical Laboratory Technician)', 12, '12th - Arts/Commerce', 17, 99, '15000.00', '20000.00', '20000.00', '20000.00', 1, 2);
INSERT INTO `SubCourses` (`ID`, `Name`, `Duration`, `MinQualification`, `MinAge`, `MaxAge`, `IndianAdmissionFee`, `ForeignAdmissionFee`, `IndianOtherFee`, `ForeignOtherFee`, `CourseMasterID`, `CompanyID`) VALUES(3, 'DPT(Diploma In Physiotherapy)', 24, '12th - Arts/Commerce', 17, 99, '30000.00', '40000.00', '40000.00', '40000.00', 2, 2);
INSERT INTO `SubCourses` (`ID`, `Name`, `Duration`, `MinQualification`, `MinAge`, `MaxAge`, `IndianAdmissionFee`, `ForeignAdmissionFee`, `IndianOtherFee`, `ForeignOtherFee`, `CourseMasterID`, `CompanyID`) VALUES(4, 'CPT(Certificate In Physiotherapy)', 12, '12th - Arts/Commerce', 17, 99, '15000.00', '20000.00', '20000.00', '20000.00', 2, 2);
INSERT INTO `SubCourses` (`ID`, `Name`, `Duration`, `MinQualification`, `MinAge`, `MaxAge`, `IndianAdmissionFee`, `ForeignAdmissionFee`, `IndianOtherFee`, `ForeignOtherFee`, `CourseMasterID`, `CompanyID`) VALUES(5, 'DPC(Diploma In Patient Care)', 24, '12th - Arts/Commerce', 17, 99, '30000.00', '40000.00', '40000.00', '40000.00', 3, 2);
INSERT INTO `SubCourses` (`ID`, `Name`, `Duration`, `MinQualification`, `MinAge`, `MaxAge`, `IndianAdmissionFee`, `ForeignAdmissionFee`, `IndianOtherFee`, `ForeignOtherFee`, `CourseMasterID`, `CompanyID`) VALUES(6, 'CPC(Certificate In Patient Care)', 12, '12th - Arts/Commerce', 17, 99, '15000.00', '20000.00', '20000.00', '20000.00', 3, 2);
INSERT INTO `SubCourses` (`ID`, `Name`, `Duration`, `MinQualification`, `MinAge`, `MaxAge`, `IndianAdmissionFee`, `ForeignAdmissionFee`, `IndianOtherFee`, `ForeignOtherFee`, `CourseMasterID`, `CompanyID`) VALUES(7, 'Diploma In ECG Technicia', 12, '12th - Arts/Commerce', 17, 99, '5000.00', '20000.00', '10000.00', '20000.00', 4, 2);
INSERT INTO `SubCourses` (`ID`, `Name`, `Duration`, `MinQualification`, `MinAge`, `MaxAge`, `IndianAdmissionFee`, `ForeignAdmissionFee`, `IndianOtherFee`, `ForeignOtherFee`, `CourseMasterID`, `CompanyID`) VALUES(8, 'Certificate In Diet & Nutrition', 12, '12th - Arts/Commerce', 17, 99, '5000.00', '20000.00', '10000.00', '20000.00', 5, 2);

-- --------------------------------------------------------

--
-- Table structure for table `TestMaster`
--

CREATE TABLE `TestMaster` (
  `ID` int(7) NOT NULL,
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
  `CompanyID` int(2) NOT NULL DEFAULT '99'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `TestMaster`
--

INSERT INTO `TestMaster` (`ID`, `Name`, `Type`, `PreTestInfo`, `ResultInHours`, `Components`, `Cost`, `CreatedDate`, `UpdatedDate`, `IsDeleted`, `PackageID`, `CompanyID`) VALUES(1, 'COMPLETE BLOOD COUNT (CBC)', 1, '', 24, '', '0.00', '2019-07-28 00:00:00', '2019-07-28 00:00:00', 0, 1, 99);
INSERT INTO `TestMaster` (`ID`, `Name`, `Type`, `PreTestInfo`, `ResultInHours`, `Components`, `Cost`, `CreatedDate`, `UpdatedDate`, `IsDeleted`, `PackageID`, `CompanyID`) VALUES(2, 'COMPLETE URINE EXAMINATION', 2, '', 24, '', '0.00', '2019-07-28 00:00:00', '2019-07-28 00:00:00', 0, 1, 99);
INSERT INTO `TestMaster` (`ID`, `Name`, `Type`, `PreTestInfo`, `ResultInHours`, `Components`, `Cost`, `CreatedDate`, `UpdatedDate`, `IsDeleted`, `PackageID`, `CompanyID`) VALUES(3, 'CHOLESTEROL - SERUM', 1, NULL, 24, NULL, '0.00', '2019-07-28 00:00:00', NULL, 0, 1, 99);
INSERT INTO `TestMaster` (`ID`, `Name`, `Type`, `PreTestInfo`, `ResultInHours`, `Components`, `Cost`, `CreatedDate`, `UpdatedDate`, `IsDeleted`, `PackageID`, `CompanyID`) VALUES(4, 'GLUCOSE FASTING', 1, NULL, 24, NULL, '0.00', '2019-07-28 00:00:00', NULL, 0, 1, 99);
INSERT INTO `TestMaster` (`ID`, `Name`, `Type`, `PreTestInfo`, `ResultInHours`, `Components`, `Cost`, `CreatedDate`, `UpdatedDate`, `IsDeleted`, `PackageID`, `CompanyID`) VALUES(6, 'COMPLETE BLOOD COUNT (CBC) - FEMALE', 1, NULL, 24, NULL, '0.00', '2019-07-28 00:00:00', '2019-07-28 00:00:00', 0, 2, 99);
INSERT INTO `TestMaster` (`ID`, `Name`, `Type`, `PreTestInfo`, `ResultInHours`, `Components`, `Cost`, `CreatedDate`, `UpdatedDate`, `IsDeleted`, `PackageID`, `CompanyID`) VALUES(7, 'COMPLETE URINE EXAMINATION', 2, NULL, 24, NULL, '0.00', '2019-07-28 00:00:00', NULL, 0, 2, 99);
INSERT INTO `TestMaster` (`ID`, `Name`, `Type`, `PreTestInfo`, `ResultInHours`, `Components`, `Cost`, `CreatedDate`, `UpdatedDate`, `IsDeleted`, `PackageID`, `CompanyID`) VALUES(8, 'CHOLESTEROL - SERUM', 1, NULL, 24, NULL, '0.00', '2019-07-28 00:00:00', NULL, 0, 2, 99);
INSERT INTO `TestMaster` (`ID`, `Name`, `Type`, `PreTestInfo`, `ResultInHours`, `Components`, `Cost`, `CreatedDate`, `UpdatedDate`, `IsDeleted`, `PackageID`, `CompanyID`) VALUES(9, 'GLUCOSE FASTING', 1, NULL, 24, NULL, '0.00', '2019-07-28 00:00:00', NULL, 0, 2, 99);
INSERT INTO `TestMaster` (`ID`, `Name`, `Type`, `PreTestInfo`, `ResultInHours`, `Components`, `Cost`, `CreatedDate`, `UpdatedDate`, `IsDeleted`, `PackageID`, `CompanyID`) VALUES(10, 'THYROID STIMULATING HORMONE (TSH) SERUM', 1, NULL, 24, NULL, '0.00', '2019-07-28 00:00:00', NULL, 0, 2, 99);
INSERT INTO `TestMaster` (`ID`, `Name`, `Type`, `PreTestInfo`, `ResultInHours`, `Components`, `Cost`, `CreatedDate`, `UpdatedDate`, `IsDeleted`, `PackageID`, `CompanyID`) VALUES(11, 'GLUCOSE FASTING', 1, NULL, 24, NULL, '0.00', '2019-07-28 00:00:00', NULL, 0, 14, 99);
INSERT INTO `TestMaster` (`ID`, `Name`, `Type`, `PreTestInfo`, `ResultInHours`, `Components`, `Cost`, `CreatedDate`, `UpdatedDate`, `IsDeleted`, `PackageID`, `CompanyID`) VALUES(12, 'CHOLESTEROL - SERUM', 1, NULL, 24, NULL, '0.00', '2019-07-28 00:00:00', NULL, 0, 14, 99);
INSERT INTO `TestMaster` (`ID`, `Name`, `Type`, `PreTestInfo`, `ResultInHours`, `Components`, `Cost`, `CreatedDate`, `UpdatedDate`, `IsDeleted`, `PackageID`, `CompanyID`) VALUES(13, 'ASPARTATE AMINOTRANSFERASE (AST/SGOT)', 1, NULL, 24, NULL, '0.00', '2019-07-28 00:00:00', NULL, 0, 14, 99);
INSERT INTO `TestMaster` (`ID`, `Name`, `Type`, `PreTestInfo`, `ResultInHours`, `Components`, `Cost`, `CreatedDate`, `UpdatedDate`, `IsDeleted`, `PackageID`, `CompanyID`) VALUES(14, 'ALANINE AMINOTRANSFERASE (ALT/SGPT)', 1, NULL, 24, NULL, '0.00', '2019-07-28 00:00:00', NULL, 0, 14, 99);
INSERT INTO `TestMaster` (`ID`, `Name`, `Type`, `PreTestInfo`, `ResultInHours`, `Components`, `Cost`, `CreatedDate`, `UpdatedDate`, `IsDeleted`, `PackageID`, `CompanyID`) VALUES(15, 'UREA - SERUM', 1, NULL, 24, NULL, '0.00', '2019-07-28 00:00:00', NULL, 0, 14, 99);
INSERT INTO `TestMaster` (`ID`, `Name`, `Type`, `PreTestInfo`, `ResultInHours`, `Components`, `Cost`, `CreatedDate`, `UpdatedDate`, `IsDeleted`, `PackageID`, `CompanyID`) VALUES(16, 'CREATININE SERUM', 1, NULL, 24, NULL, '0.00', '2019-07-28 00:00:00', NULL, 0, 14, 99);
INSERT INTO `TestMaster` (`ID`, `Name`, `Type`, `PreTestInfo`, `ResultInHours`, `Components`, `Cost`, `CreatedDate`, `UpdatedDate`, `IsDeleted`, `PackageID`, `CompanyID`) VALUES(17, 'THYROID STIMULATING HORMONE (TSH)', 1, NULL, 24, NULL, '0.00', '2019-07-28 00:00:00', NULL, 0, 14, 99);
INSERT INTO `TestMaster` (`ID`, `Name`, `Type`, `PreTestInfo`, `ResultInHours`, `Components`, `Cost`, `CreatedDate`, `UpdatedDate`, `IsDeleted`, `PackageID`, `CompanyID`) VALUES(18, 'CALCIUM	SERUM', 1, NULL, 24, NULL, '0.00', '2019-07-28 00:00:00', NULL, 0, 14, 99);
INSERT INTO `TestMaster` (`ID`, `Name`, `Type`, `PreTestInfo`, `ResultInHours`, `Components`, `Cost`, `CreatedDate`, `UpdatedDate`, `IsDeleted`, `PackageID`, `CompanyID`) VALUES(19, 'HEMOGLOBIN', 1, NULL, 24, NULL, '0.00', '2019-07-28 00:00:00', NULL, 0, 14, 99);
INSERT INTO `TestMaster` (`ID`, `Name`, `Type`, `PreTestInfo`, `ResultInHours`, `Components`, `Cost`, `CreatedDate`, `UpdatedDate`, `IsDeleted`, `PackageID`, `CompanyID`) VALUES(20, 'GLUCOSE FASTING', 1, NULL, 24, NULL, '0.00', '2019-07-28 00:00:00', NULL, 0, 15, 99);
INSERT INTO `TestMaster` (`ID`, `Name`, `Type`, `PreTestInfo`, `ResultInHours`, `Components`, `Cost`, `CreatedDate`, `UpdatedDate`, `IsDeleted`, `PackageID`, `CompanyID`) VALUES(21, 'CHOLESTEROL - SERUM', 1, NULL, 24, NULL, '0.00', '2019-07-28 00:00:00', NULL, 0, 15, 99);
INSERT INTO `TestMaster` (`ID`, `Name`, `Type`, `PreTestInfo`, `ResultInHours`, `Components`, `Cost`, `CreatedDate`, `UpdatedDate`, `IsDeleted`, `PackageID`, `CompanyID`) VALUES(22, 'ASPARTATE AMINOTRANSFERASE (AST/SGOT) SERUM', 1, NULL, 24, NULL, '0.00', '2019-07-28 00:00:00', NULL, 0, 15, 99);
INSERT INTO `TestMaster` (`ID`, `Name`, `Type`, `PreTestInfo`, `ResultInHours`, `Components`, `Cost`, `CreatedDate`, `UpdatedDate`, `IsDeleted`, `PackageID`, `CompanyID`) VALUES(23, 'ALANINE AMINOTRANSFERASE (ALT/SGPT) SERUM', 1, NULL, 24, NULL, '0.00', '2019-07-28 00:00:00', NULL, 0, 15, 99);
INSERT INTO `TestMaster` (`ID`, `Name`, `Type`, `PreTestInfo`, `ResultInHours`, `Components`, `Cost`, `CreatedDate`, `UpdatedDate`, `IsDeleted`, `PackageID`, `CompanyID`) VALUES(24, 'UREA - SERUM', 1, NULL, 24, NULL, '0.00', '2019-07-28 00:00:00', NULL, 0, 15, 99);
INSERT INTO `TestMaster` (`ID`, `Name`, `Type`, `PreTestInfo`, `ResultInHours`, `Components`, `Cost`, `CreatedDate`, `UpdatedDate`, `IsDeleted`, `PackageID`, `CompanyID`) VALUES(25, 'CREATININE SERUM', 1, NULL, 24, NULL, '0.00', '2019-07-28 00:00:00', NULL, 0, 15, 99);
INSERT INTO `TestMaster` (`ID`, `Name`, `Type`, `PreTestInfo`, `ResultInHours`, `Components`, `Cost`, `CreatedDate`, `UpdatedDate`, `IsDeleted`, `PackageID`, `CompanyID`) VALUES(26, 'THYROID STIMULATING HORMONE (TSH) SERUM', 1, NULL, 24, NULL, '0.00', '2019-07-28 00:00:00', NULL, 0, 15, 99);
INSERT INTO `TestMaster` (`ID`, `Name`, `Type`, `PreTestInfo`, `ResultInHours`, `Components`, `Cost`, `CreatedDate`, `UpdatedDate`, `IsDeleted`, `PackageID`, `CompanyID`) VALUES(27, 'CALCIUM SERUM', 1, NULL, 24, NULL, '0.00', '2019-07-28 00:00:00', NULL, 0, 15, 99);
INSERT INTO `TestMaster` (`ID`, `Name`, `Type`, `PreTestInfo`, `ResultInHours`, `Components`, `Cost`, `CreatedDate`, `UpdatedDate`, `IsDeleted`, `PackageID`, `CompanyID`) VALUES(28, 'COMPLETE BLOOD COUNT (CBC)', 1, NULL, 24, NULL, '0.00', '2019-07-28 00:00:00', NULL, 0, 15, 99);
INSERT INTO `TestMaster` (`ID`, `Name`, `Type`, `PreTestInfo`, `ResultInHours`, `Components`, `Cost`, `CreatedDate`, `UpdatedDate`, `IsDeleted`, `PackageID`, `CompanyID`) VALUES(29, 'TRIGLYCERIDES - SERUM', 1, NULL, 24, NULL, '0.00', '2019-07-28 00:00:00', NULL, 0, 15, 99);
INSERT INTO `TestMaster` (`ID`, `Name`, `Type`, `PreTestInfo`, `ResultInHours`, `Components`, `Cost`, `CreatedDate`, `UpdatedDate`, `IsDeleted`, `PackageID`, `CompanyID`) VALUES(30, 'BILIRUBIN SERUM - TOTAL/DIRECT/INDIRECT', 1, NULL, 24, NULL, '0.00', '2019-07-28 00:00:00', NULL, 0, 15, 99);
INSERT INTO `TestMaster` (`ID`, `Name`, `Type`, `PreTestInfo`, `ResultInHours`, `Components`, `Cost`, `CreatedDate`, `UpdatedDate`, `IsDeleted`, `PackageID`, `CompanyID`) VALUES(31, 'HBA1C GLYCATED HEMOGLOBIN', 1, NULL, 24, NULL, '0.00', '2019-07-28 00:00:00', NULL, 0, 15, 99);
INSERT INTO `TestMaster` (`ID`, `Name`, `Type`, `PreTestInfo`, `ResultInHours`, `Components`, `Cost`, `CreatedDate`, `UpdatedDate`, `IsDeleted`, `PackageID`, `CompanyID`) VALUES(32, 'GLUCOSE FASTING', 1, NULL, 24, NULL, '0.00', '2019-07-28 00:00:00', NULL, 0, 16, 99);
INSERT INTO `TestMaster` (`ID`, `Name`, `Type`, `PreTestInfo`, `ResultInHours`, `Components`, `Cost`, `CreatedDate`, `UpdatedDate`, `IsDeleted`, `PackageID`, `CompanyID`) VALUES(33, 'CHOLESTEROL - SERUM', 1, NULL, 24, NULL, '0.00', '2019-07-28 00:00:00', NULL, 0, 16, 99);
INSERT INTO `TestMaster` (`ID`, `Name`, `Type`, `PreTestInfo`, `ResultInHours`, `Components`, `Cost`, `CreatedDate`, `UpdatedDate`, `IsDeleted`, `PackageID`, `CompanyID`) VALUES(34, 'ASPARTATE AMINOTRANSFERASE (AST/SGOT) SERUM', 1, NULL, 24, NULL, '0.00', '2019-07-28 00:00:00', NULL, 0, 16, 99);
INSERT INTO `TestMaster` (`ID`, `Name`, `Type`, `PreTestInfo`, `ResultInHours`, `Components`, `Cost`, `CreatedDate`, `UpdatedDate`, `IsDeleted`, `PackageID`, `CompanyID`) VALUES(35, 'ALANINE AMINOTRANSFERASE (ALT/SGPT) SERUM', 1, NULL, 24, NULL, '0.00', '2019-07-28 00:00:00', NULL, 0, 16, 99);
INSERT INTO `TestMaster` (`ID`, `Name`, `Type`, `PreTestInfo`, `ResultInHours`, `Components`, `Cost`, `CreatedDate`, `UpdatedDate`, `IsDeleted`, `PackageID`, `CompanyID`) VALUES(36, 'UREA - SERUM', 1, NULL, 24, NULL, '0.00', '2019-07-28 00:00:00', NULL, 0, 16, 99);
INSERT INTO `TestMaster` (`ID`, `Name`, `Type`, `PreTestInfo`, `ResultInHours`, `Components`, `Cost`, `CreatedDate`, `UpdatedDate`, `IsDeleted`, `PackageID`, `CompanyID`) VALUES(37, 'CREATININE SERUM', 1, NULL, 24, NULL, '0.00', '2019-07-28 00:00:00', NULL, 0, 16, 99);
INSERT INTO `TestMaster` (`ID`, `Name`, `Type`, `PreTestInfo`, `ResultInHours`, `Components`, `Cost`, `CreatedDate`, `UpdatedDate`, `IsDeleted`, `PackageID`, `CompanyID`) VALUES(38, 'THYROID STIMULATING HORMONE (TSH) SERUM', 1, NULL, 24, NULL, '0.00', '2019-07-28 00:00:00', NULL, 0, 16, 99);
INSERT INTO `TestMaster` (`ID`, `Name`, `Type`, `PreTestInfo`, `ResultInHours`, `Components`, `Cost`, `CreatedDate`, `UpdatedDate`, `IsDeleted`, `PackageID`, `CompanyID`) VALUES(39, 'TRIGLYCERIDES - SERUM', 1, NULL, 24, NULL, '0.00', '2019-07-28 00:00:00', NULL, 0, 16, 99);
INSERT INTO `TestMaster` (`ID`, `Name`, `Type`, `PreTestInfo`, `ResultInHours`, `Components`, `Cost`, `CreatedDate`, `UpdatedDate`, `IsDeleted`, `PackageID`, `CompanyID`) VALUES(40, 'BILIRUBIN SERUM - TOTAL/DIRECT/INDIRECT', 1, NULL, 24, NULL, '0.00', '2019-07-28 00:00:00', NULL, 0, 16, 99);
INSERT INTO `TestMaster` (`ID`, `Name`, `Type`, `PreTestInfo`, `ResultInHours`, `Components`, `Cost`, `CreatedDate`, `UpdatedDate`, `IsDeleted`, `PackageID`, `CompanyID`) VALUES(41, 'COMPLETE BLOOD COUNT (CBC)', 1, NULL, 24, NULL, '0.00', '2019-07-28 00:00:00', NULL, 0, 16, 99);
INSERT INTO `TestMaster` (`ID`, `Name`, `Type`, `PreTestInfo`, `ResultInHours`, `Components`, `Cost`, `CreatedDate`, `UpdatedDate`, `IsDeleted`, `PackageID`, `CompanyID`) VALUES(42, 'VITAMIN D - 25 HYDROXY (D2+D3)', 1, NULL, 24, NULL, '0.00', '2019-07-28 00:00:00', NULL, 0, 16, 99);
INSERT INTO `TestMaster` (`ID`, `Name`, `Type`, `PreTestInfo`, `ResultInHours`, `Components`, `Cost`, `CreatedDate`, `UpdatedDate`, `IsDeleted`, `PackageID`, `CompanyID`) VALUES(43, 'CALCIUM SERUM', 1, NULL, 24, NULL, '0.00', '2019-07-28 00:00:00', NULL, 0, 16, 99);
INSERT INTO `TestMaster` (`ID`, `Name`, `Type`, `PreTestInfo`, `ResultInHours`, `Components`, `Cost`, `CreatedDate`, `UpdatedDate`, `IsDeleted`, `PackageID`, `CompanyID`) VALUES(44, 'COMPLETE URINE EXAMINATION', 1, NULL, 24, NULL, '0.00', '2019-07-28 00:00:00', NULL, 0, 3, 99);
INSERT INTO `TestMaster` (`ID`, `Name`, `Type`, `PreTestInfo`, `ResultInHours`, `Components`, `Cost`, `CreatedDate`, `UpdatedDate`, `IsDeleted`, `PackageID`, `CompanyID`) VALUES(45, 'GLUCOSE  FASTING', 1, NULL, 24, NULL, '0.00', '2019-07-28 00:00:00', NULL, 0, 3, 99);
INSERT INTO `TestMaster` (`ID`, `Name`, `Type`, `PreTestInfo`, `ResultInHours`, `Components`, `Cost`, `CreatedDate`, `UpdatedDate`, `IsDeleted`, `PackageID`, `CompanyID`) VALUES(46, 'HBA1C GLYCATED HEMOGLOBIN', 1, NULL, 24, NULL, '0.00', '2019-07-28 00:00:00', NULL, 0, 3, 99);
INSERT INTO `TestMaster` (`ID`, `Name`, `Type`, `PreTestInfo`, `ResultInHours`, `Components`, `Cost`, `CreatedDate`, `UpdatedDate`, `IsDeleted`, `PackageID`, `CompanyID`) VALUES(47, 'GLUCOSE	 FASTING', 1, NULL, 24, NULL, '0.00', '2019-07-28 00:00:00', NULL, 0, 4, 99);
INSERT INTO `TestMaster` (`ID`, `Name`, `Type`, `PreTestInfo`, `ResultInHours`, `Components`, `Cost`, `CreatedDate`, `UpdatedDate`, `IsDeleted`, `PackageID`, `CompanyID`) VALUES(48, 'HBA1C GLYCATED HEMOGLOBIN', 1, NULL, 24, NULL, '0.00', '2019-07-28 00:00:00', NULL, 0, 4, 99);
INSERT INTO `TestMaster` (`ID`, `Name`, `Type`, `PreTestInfo`, `ResultInHours`, `Components`, `Cost`, `CreatedDate`, `UpdatedDate`, `IsDeleted`, `PackageID`, `CompanyID`) VALUES(49, 'GLUCOSE	 POST PRANDIAL (PP) 2 HOURS (POST MEAL)', 1, NULL, 24, NULL, '0.00', '2019-07-28 00:00:00', NULL, 0, 4, 99);
INSERT INTO `TestMaster` (`ID`, `Name`, `Type`, `PreTestInfo`, `ResultInHours`, `Components`, `Cost`, `CreatedDate`, `UpdatedDate`, `IsDeleted`, `PackageID`, `CompanyID`) VALUES(50, 'CHOLESTEROL - SERUM', 1, NULL, 24, NULL, '0.00', '2019-07-28 00:00:00', NULL, 0, 4, 99);
INSERT INTO `TestMaster` (`ID`, `Name`, `Type`, `PreTestInfo`, `ResultInHours`, `Components`, `Cost`, `CreatedDate`, `UpdatedDate`, `IsDeleted`, `PackageID`, `CompanyID`) VALUES(51, 'TRIGLYCERIDES - SERUM', 1, NULL, 24, NULL, '0.00', '2019-07-28 00:00:00', NULL, 0, 4, 99);
INSERT INTO `TestMaster` (`ID`, `Name`, `Type`, `PreTestInfo`, `ResultInHours`, `Components`, `Cost`, `CreatedDate`, `UpdatedDate`, `IsDeleted`, `PackageID`, `CompanyID`) VALUES(52, 'UREA - SERUM', 1, NULL, 24, NULL, '0.00', '2019-07-28 00:00:00', NULL, 0, 4, 99);
INSERT INTO `TestMaster` (`ID`, `Name`, `Type`, `PreTestInfo`, `ResultInHours`, `Components`, `Cost`, `CreatedDate`, `UpdatedDate`, `IsDeleted`, `PackageID`, `CompanyID`) VALUES(53, 'CREATININE SERUM', 1, NULL, 24, NULL, '0.00', '2019-07-28 00:00:00', NULL, 0, 4, 99);
INSERT INTO `TestMaster` (`ID`, `Name`, `Type`, `PreTestInfo`, `ResultInHours`, `Components`, `Cost`, `CreatedDate`, `UpdatedDate`, `IsDeleted`, `PackageID`, `CompanyID`) VALUES(54, 'COMPLETE URINE EXAMINATION', 2, NULL, 24, NULL, '0.00', '2019-07-28 00:00:00', NULL, 0, 4, 99);
INSERT INTO `TestMaster` (`ID`, `Name`, `Type`, `PreTestInfo`, `ResultInHours`, `Components`, `Cost`, `CreatedDate`, `UpdatedDate`, `IsDeleted`, `PackageID`, `CompanyID`) VALUES(55, 'GLUCOSE	 FASTING', 1, NULL, 24, NULL, '0.00', '2019-07-28 00:00:00', NULL, 0, 5, 99);
INSERT INTO `TestMaster` (`ID`, `Name`, `Type`, `PreTestInfo`, `ResultInHours`, `Components`, `Cost`, `CreatedDate`, `UpdatedDate`, `IsDeleted`, `PackageID`, `CompanyID`) VALUES(56, 'HBA1C GLYCATED HEMOGLOBIN', 1, NULL, 24, NULL, '0.00', '2019-07-28 00:00:00', NULL, 0, 5, 99);
INSERT INTO `TestMaster` (`ID`, `Name`, `Type`, `PreTestInfo`, `ResultInHours`, `Components`, `Cost`, `CreatedDate`, `UpdatedDate`, `IsDeleted`, `PackageID`, `CompanyID`) VALUES(57, 'GLUCOSE	 POST PRANDIAL (PP) 2 HOURS (POST MEAL)', 1, NULL, 24, NULL, '0.00', '2019-07-28 00:00:00', NULL, 0, 5, 99);
INSERT INTO `TestMaster` (`ID`, `Name`, `Type`, `PreTestInfo`, `ResultInHours`, `Components`, `Cost`, `CreatedDate`, `UpdatedDate`, `IsDeleted`, `PackageID`, `CompanyID`) VALUES(58, 'MICROALBUMIN ( MAU)- SPOT URINE', 2, NULL, 24, NULL, '0.00', '2019-07-28 00:00:00', NULL, 0, 5, 99);
INSERT INTO `TestMaster` (`ID`, `Name`, `Type`, `PreTestInfo`, `ResultInHours`, `Components`, `Cost`, `CreatedDate`, `UpdatedDate`, `IsDeleted`, `PackageID`, `CompanyID`) VALUES(59, 'LIPID PROFILE', 1, NULL, 24, NULL, '0.00', '2019-07-28 00:00:00', NULL, 0, 6, 99);
INSERT INTO `TestMaster` (`ID`, `Name`, `Type`, `PreTestInfo`, `ResultInHours`, `Components`, `Cost`, `CreatedDate`, `UpdatedDate`, `IsDeleted`, `PackageID`, `CompanyID`) VALUES(60, 'HBA1C GLYCATED HEMOGLOBIN', 1, NULL, 24, NULL, '0.00', '2019-07-28 00:00:00', NULL, 0, 6, 99);
INSERT INTO `TestMaster` (`ID`, `Name`, `Type`, `PreTestInfo`, `ResultInHours`, `Components`, `Cost`, `CreatedDate`, `UpdatedDate`, `IsDeleted`, `PackageID`, `CompanyID`) VALUES(61, 'GLUCOSE	 FASTING', 1, NULL, 24, NULL, '0.00', '2019-07-28 00:00:00', NULL, 0, 6, 99);
INSERT INTO `TestMaster` (`ID`, `Name`, `Type`, `PreTestInfo`, `ResultInHours`, `Components`, `Cost`, `CreatedDate`, `UpdatedDate`, `IsDeleted`, `PackageID`, `CompanyID`) VALUES(62, 'COMPLETE URINE EXAMINATION', 2, NULL, 24, NULL, '0.00', '2019-07-28 00:00:00', NULL, 0, 6, 99);
INSERT INTO `TestMaster` (`ID`, `Name`, `Type`, `PreTestInfo`, `ResultInHours`, `Components`, `Cost`, `CreatedDate`, `UpdatedDate`, `IsDeleted`, `PackageID`, `CompanyID`) VALUES(63, 'GLUCOSE	 FASTING', 1, NULL, 24, NULL, '0.00', '2019-07-28 00:00:00', NULL, 0, 7, 99);
INSERT INTO `TestMaster` (`ID`, `Name`, `Type`, `PreTestInfo`, `ResultInHours`, `Components`, `Cost`, `CreatedDate`, `UpdatedDate`, `IsDeleted`, `PackageID`, `CompanyID`) VALUES(64, 'HBA1C GLYCATED HEMOGLOBIN', 1, NULL, 24, NULL, '0.00', '2019-07-28 00:00:00', NULL, 0, 7, 99);
INSERT INTO `TestMaster` (`ID`, `Name`, `Type`, `PreTestInfo`, `ResultInHours`, `Components`, `Cost`, `CreatedDate`, `UpdatedDate`, `IsDeleted`, `PackageID`, `CompanyID`) VALUES(65, 'GLUCOSE	 POST PRANDIAL (PP) 2 HOURS (POST MEAL)', 1, NULL, 24, NULL, '0.00', '2019-07-28 00:00:00', NULL, 0, 7, 99);
INSERT INTO `TestMaster` (`ID`, `Name`, `Type`, `PreTestInfo`, `ResultInHours`, `Components`, `Cost`, `CreatedDate`, `UpdatedDate`, `IsDeleted`, `PackageID`, `CompanyID`) VALUES(66, 'RENAL PROFILE/RENAL FUNCTION TEST (RFT/KFT)', 1, NULL, 24, NULL, '0.00', '2019-07-28 00:00:00', NULL, 0, 7, 99);
INSERT INTO `TestMaster` (`ID`, `Name`, `Type`, `PreTestInfo`, `ResultInHours`, `Components`, `Cost`, `CreatedDate`, `UpdatedDate`, `IsDeleted`, `PackageID`, `CompanyID`) VALUES(67, 'MICROALBUMIN ( MAU)- SPOT URINE', 1, NULL, 24, NULL, '0.00', '2019-07-28 00:00:00', NULL, 0, 7, 99);
INSERT INTO `TestMaster` (`ID`, `Name`, `Type`, `PreTestInfo`, `ResultInHours`, `Components`, `Cost`, `CreatedDate`, `UpdatedDate`, `IsDeleted`, `PackageID`, `CompanyID`) VALUES(68, 'COMPLETE BLOOD COUNT (CBC)', 1, NULL, 24, NULL, '0.00', '2019-07-28 00:00:00', NULL, 0, 8, 99);
INSERT INTO `TestMaster` (`ID`, `Name`, `Type`, `PreTestInfo`, `ResultInHours`, `Components`, `Cost`, `CreatedDate`, `UpdatedDate`, `IsDeleted`, `PackageID`, `CompanyID`) VALUES(69, 'GLUCOSE	 FASTING', 1, NULL, 24, NULL, '0.00', '2019-07-28 00:00:00', NULL, 0, 8, 99);
INSERT INTO `TestMaster` (`ID`, `Name`, `Type`, `PreTestInfo`, `ResultInHours`, `Components`, `Cost`, `CreatedDate`, `UpdatedDate`, `IsDeleted`, `PackageID`, `CompanyID`) VALUES(70, 'GLUCOSE	 POST PRANDIAL (PP) 2 HOURS (POST MEAL)', 1, NULL, 24, NULL, '0.00', '2019-07-28 00:00:00', NULL, 0, 8, 99);
INSERT INTO `TestMaster` (`ID`, `Name`, `Type`, `PreTestInfo`, `ResultInHours`, `Components`, `Cost`, `CreatedDate`, `UpdatedDate`, `IsDeleted`, `PackageID`, `CompanyID`) VALUES(71, 'UREA - SERUM', 1, NULL, 24, NULL, '0.00', '2019-07-28 00:00:00', NULL, 0, 8, 99);
INSERT INTO `TestMaster` (`ID`, `Name`, `Type`, `PreTestInfo`, `ResultInHours`, `Components`, `Cost`, `CreatedDate`, `UpdatedDate`, `IsDeleted`, `PackageID`, `CompanyID`) VALUES(72, 'CREATININE SERUM', 1, NULL, 24, NULL, '0.00', '2019-07-28 00:00:00', NULL, 0, 8, 99);
INSERT INTO `TestMaster` (`ID`, `Name`, `Type`, `PreTestInfo`, `ResultInHours`, `Components`, `Cost`, `CreatedDate`, `UpdatedDate`, `IsDeleted`, `PackageID`, `CompanyID`) VALUES(73, 'LIPID PROFILE', 1, NULL, 24, NULL, '0.00', '2019-07-28 00:00:00', NULL, 0, 8, 99);
INSERT INTO `TestMaster` (`ID`, `Name`, `Type`, `PreTestInfo`, `ResultInHours`, `Components`, `Cost`, `CreatedDate`, `UpdatedDate`, `IsDeleted`, `PackageID`, `CompanyID`) VALUES(74, 'BLOOD GROUP ABO AND RH FACTOR', 1, NULL, 24, NULL, '0.00', '2019-07-28 00:00:00', NULL, 0, 8, 99);
INSERT INTO `TestMaster` (`ID`, `Name`, `Type`, `PreTestInfo`, `ResultInHours`, `Components`, `Cost`, `CreatedDate`, `UpdatedDate`, `IsDeleted`, `PackageID`, `CompanyID`) VALUES(75, 'HBA1C GLYCATED HEMOGLOBIN', 1, NULL, 24, NULL, '0.00', '2019-07-28 00:00:00', NULL, 0, 8, 99);
INSERT INTO `TestMaster` (`ID`, `Name`, `Type`, `PreTestInfo`, `ResultInHours`, `Components`, `Cost`, `CreatedDate`, `UpdatedDate`, `IsDeleted`, `PackageID`, `CompanyID`) VALUES(76, 'GLUCOSE	 FASTING', 1, NULL, 24, NULL, '0.00', '2019-07-28 00:00:00', NULL, 0, 9, 99);
INSERT INTO `TestMaster` (`ID`, `Name`, `Type`, `PreTestInfo`, `ResultInHours`, `Components`, `Cost`, `CreatedDate`, `UpdatedDate`, `IsDeleted`, `PackageID`, `CompanyID`) VALUES(77, 'LIPID PROFILE', 1, NULL, 24, NULL, '0.00', '2019-07-28 00:00:00', NULL, 0, 9, 99);
INSERT INTO `TestMaster` (`ID`, `Name`, `Type`, `PreTestInfo`, `ResultInHours`, `Components`, `Cost`, `CreatedDate`, `UpdatedDate`, `IsDeleted`, `PackageID`, `CompanyID`) VALUES(78, 'UREA - SERUM', 1, NULL, 24, NULL, '0.00', '2019-07-28 00:00:00', NULL, 0, 9, 99);
INSERT INTO `TestMaster` (`ID`, `Name`, `Type`, `PreTestInfo`, `ResultInHours`, `Components`, `Cost`, `CreatedDate`, `UpdatedDate`, `IsDeleted`, `PackageID`, `CompanyID`) VALUES(79, 'CREATININE SERUM', 1, NULL, 24, NULL, '0.00', '2019-07-28 00:00:00', NULL, 0, 9, 99);
INSERT INTO `TestMaster` (`ID`, `Name`, `Type`, `PreTestInfo`, `ResultInHours`, `Components`, `Cost`, `CreatedDate`, `UpdatedDate`, `IsDeleted`, `PackageID`, `CompanyID`) VALUES(80, 'GLUCOSE	 FASTING', 1, NULL, 24, NULL, '0.00', '2019-07-28 00:00:00', NULL, 0, 10, 99);
INSERT INTO `TestMaster` (`ID`, `Name`, `Type`, `PreTestInfo`, `ResultInHours`, `Components`, `Cost`, `CreatedDate`, `UpdatedDate`, `IsDeleted`, `PackageID`, `CompanyID`) VALUES(81, 'HS-CRP (HIGH SENSITIVITY C-REACTIVE PROTEIN)', 1, NULL, 24, NULL, '0.00', '2019-07-28 00:00:00', NULL, 0, 10, 99);
INSERT INTO `TestMaster` (`ID`, `Name`, `Type`, `PreTestInfo`, `ResultInHours`, `Components`, `Cost`, `CreatedDate`, `UpdatedDate`, `IsDeleted`, `PackageID`, `CompanyID`) VALUES(82, 'LIPID PROFILE', 1, NULL, 24, NULL, '0.00', '2019-07-28 00:00:00', NULL, 0, 10, 99);
INSERT INTO `TestMaster` (`ID`, `Name`, `Type`, `PreTestInfo`, `ResultInHours`, `Components`, `Cost`, `CreatedDate`, `UpdatedDate`, `IsDeleted`, `PackageID`, `CompanyID`) VALUES(83, 'UREA - SERUM', 1, NULL, 24, NULL, '0.00', '2019-07-28 00:00:00', NULL, 0, 10, 99);
INSERT INTO `TestMaster` (`ID`, `Name`, `Type`, `PreTestInfo`, `ResultInHours`, `Components`, `Cost`, `CreatedDate`, `UpdatedDate`, `IsDeleted`, `PackageID`, `CompanyID`) VALUES(84, 'CREATININE SERUM', 1, NULL, 24, NULL, '0.00', '2019-07-28 00:00:00', NULL, 0, 10, 99);
INSERT INTO `TestMaster` (`ID`, `Name`, `Type`, `PreTestInfo`, `ResultInHours`, `Components`, `Cost`, `CreatedDate`, `UpdatedDate`, `IsDeleted`, `PackageID`, `CompanyID`) VALUES(85, 'COMPLETE BLOOD COUNT (CBC)', 1, NULL, 24, NULL, '0.00', '2019-07-28 00:00:00', NULL, 0, 11, 99);
INSERT INTO `TestMaster` (`ID`, `Name`, `Type`, `PreTestInfo`, `ResultInHours`, `Components`, `Cost`, `CreatedDate`, `UpdatedDate`, `IsDeleted`, `PackageID`, `CompanyID`) VALUES(86, 'GLUCOSE	 FASTING', 1, NULL, 24, NULL, '0.00', '2019-07-28 00:00:00', NULL, 0, 11, 99);
INSERT INTO `TestMaster` (`ID`, `Name`, `Type`, `PreTestInfo`, `ResultInHours`, `Components`, `Cost`, `CreatedDate`, `UpdatedDate`, `IsDeleted`, `PackageID`, `CompanyID`) VALUES(87, 'LIPID PROFILE', 1, NULL, 24, NULL, '0.00', '2019-07-28 00:00:00', NULL, 0, 11, 99);
INSERT INTO `TestMaster` (`ID`, `Name`, `Type`, `PreTestInfo`, `ResultInHours`, `Components`, `Cost`, `CreatedDate`, `UpdatedDate`, `IsDeleted`, `PackageID`, `CompanyID`) VALUES(88, 'GLUCOSE	 POST PRANDIAL (PP) 2 HOURS (POST MEAL)', 1, NULL, 24, NULL, '0.00', '2019-07-28 00:00:00', NULL, 0, 11, 99);
INSERT INTO `TestMaster` (`ID`, `Name`, `Type`, `PreTestInfo`, `ResultInHours`, `Components`, `Cost`, `CreatedDate`, `UpdatedDate`, `IsDeleted`, `PackageID`, `CompanyID`) VALUES(89, 'UREA - SERUM', 1, NULL, 24, NULL, '0.00', '2019-07-28 00:00:00', NULL, 0, 11, 99);
INSERT INTO `TestMaster` (`ID`, `Name`, `Type`, `PreTestInfo`, `ResultInHours`, `Components`, `Cost`, `CreatedDate`, `UpdatedDate`, `IsDeleted`, `PackageID`, `CompanyID`) VALUES(90, 'CREATININE SERUM', 1, NULL, 24, NULL, '0.00', '2019-07-28 00:00:00', NULL, 0, 11, 99);
INSERT INTO `TestMaster` (`ID`, `Name`, `Type`, `PreTestInfo`, `ResultInHours`, `Components`, `Cost`, `CreatedDate`, `UpdatedDate`, `IsDeleted`, `PackageID`, `CompanyID`) VALUES(91, 'THYROID STIMULATING HORMONE (TSH) SERUM', 1, NULL, 24, NULL, '0.00', '2019-07-28 00:00:00', NULL, 0, 11, 99);
INSERT INTO `TestMaster` (`ID`, `Name`, `Type`, `PreTestInfo`, `ResultInHours`, `Components`, `Cost`, `CreatedDate`, `UpdatedDate`, `IsDeleted`, `PackageID`, `CompanyID`) VALUES(92, 'COMPLETE BLOOD COUNT (CBC)', 1, NULL, 24, NULL, '0.00', '2019-07-28 00:00:00', NULL, 0, 12, 99);
INSERT INTO `TestMaster` (`ID`, `Name`, `Type`, `PreTestInfo`, `ResultInHours`, `Components`, `Cost`, `CreatedDate`, `UpdatedDate`, `IsDeleted`, `PackageID`, `CompanyID`) VALUES(93, 'GLUCOSE	 FASTING', 1, NULL, 24, NULL, '0.00', '2019-07-28 00:00:00', NULL, 0, 12, 99);
INSERT INTO `TestMaster` (`ID`, `Name`, `Type`, `PreTestInfo`, `ResultInHours`, `Components`, `Cost`, `CreatedDate`, `UpdatedDate`, `IsDeleted`, `PackageID`, `CompanyID`) VALUES(94, 'GLUCOSE	 POST PRANDIAL (PP) 2 HOURS (POST MEAL)', 1, NULL, 24, NULL, '0.00', '2019-07-28 00:00:00', NULL, 0, 12, 99);
INSERT INTO `TestMaster` (`ID`, `Name`, `Type`, `PreTestInfo`, `ResultInHours`, `Components`, `Cost`, `CreatedDate`, `UpdatedDate`, `IsDeleted`, `PackageID`, `CompanyID`) VALUES(95, 'UREA - SERUM', 1, NULL, 24, NULL, '0.00', '2019-07-28 00:00:00', NULL, 0, 12, 99);
INSERT INTO `TestMaster` (`ID`, `Name`, `Type`, `PreTestInfo`, `ResultInHours`, `Components`, `Cost`, `CreatedDate`, `UpdatedDate`, `IsDeleted`, `PackageID`, `CompanyID`) VALUES(96, 'CREATININE SERUM', 1, NULL, 24, NULL, '0.00', '2019-07-28 00:00:00', NULL, 0, 12, 99);
INSERT INTO `TestMaster` (`ID`, `Name`, `Type`, `PreTestInfo`, `ResultInHours`, `Components`, `Cost`, `CreatedDate`, `UpdatedDate`, `IsDeleted`, `PackageID`, `CompanyID`) VALUES(97, 'LIPID PROFILE', 1, NULL, 24, NULL, '0.00', '2019-07-28 00:00:00', NULL, 0, 12, 99);
INSERT INTO `TestMaster` (`ID`, `Name`, `Type`, `PreTestInfo`, `ResultInHours`, `Components`, `Cost`, `CreatedDate`, `UpdatedDate`, `IsDeleted`, `PackageID`, `CompanyID`) VALUES(98, 'BLOOD GROUP ABO AND RH FACTOR', 1, NULL, 24, NULL, '0.00', '2019-07-28 00:00:00', NULL, 0, 12, 99);
INSERT INTO `TestMaster` (`ID`, `Name`, `Type`, `PreTestInfo`, `ResultInHours`, `Components`, `Cost`, `CreatedDate`, `UpdatedDate`, `IsDeleted`, `PackageID`, `CompanyID`) VALUES(99, 'HBA1C GLYCATED HEMOGLOBIN', 1, NULL, 24, NULL, '0.00', '2019-07-28 00:00:00', NULL, 0, 12, 99);
INSERT INTO `TestMaster` (`ID`, `Name`, `Type`, `PreTestInfo`, `ResultInHours`, `Components`, `Cost`, `CreatedDate`, `UpdatedDate`, `IsDeleted`, `PackageID`, `CompanyID`) VALUES(100, 'ELECTROLYTES - SERUM', 1, NULL, 24, NULL, '0.00', '2019-07-28 00:00:00', NULL, 0, 12, 99);
INSERT INTO `TestMaster` (`ID`, `Name`, `Type`, `PreTestInfo`, `ResultInHours`, `Components`, `Cost`, `CreatedDate`, `UpdatedDate`, `IsDeleted`, `PackageID`, `CompanyID`) VALUES(101, 'THYROID PROFILE (TOTAL T3 TOTAL T4 TSH)', 1, NULL, 24, NULL, '0.00', '2019-07-28 00:00:00', NULL, 0, 12, 99);
INSERT INTO `TestMaster` (`ID`, `Name`, `Type`, `PreTestInfo`, `ResultInHours`, `Components`, `Cost`, `CreatedDate`, `UpdatedDate`, `IsDeleted`, `PackageID`, `CompanyID`) VALUES(102, 'LIVER FUNCTION TEST (LFT) WITH GGT', 1, NULL, 24, NULL, '0.00', '2019-07-28 00:00:00', NULL, 0, 12, 99);
INSERT INTO `TestMaster` (`ID`, `Name`, `Type`, `PreTestInfo`, `ResultInHours`, `Components`, `Cost`, `CreatedDate`, `UpdatedDate`, `IsDeleted`, `PackageID`, `CompanyID`) VALUES(103, 'HBA1C GLYCATED HEMOGLOBIN', 1, NULL, 24, NULL, '0.00', '2019-07-28 00:00:00', NULL, 0, 13, 99);
INSERT INTO `TestMaster` (`ID`, `Name`, `Type`, `PreTestInfo`, `ResultInHours`, `Components`, `Cost`, `CreatedDate`, `UpdatedDate`, `IsDeleted`, `PackageID`, `CompanyID`) VALUES(104, 'LIPID PROFILE', 1, NULL, 24, NULL, '0.00', '2019-07-28 00:00:00', NULL, 0, 13, 99);
INSERT INTO `TestMaster` (`ID`, `Name`, `Type`, `PreTestInfo`, `ResultInHours`, `Components`, `Cost`, `CreatedDate`, `UpdatedDate`, `IsDeleted`, `PackageID`, `CompanyID`) VALUES(105, 'LIVER FUNCTION TEST (LFT)', 1, NULL, 24, NULL, '0.00', '2019-07-28 00:00:00', NULL, 0, 13, 99);
INSERT INTO `TestMaster` (`ID`, `Name`, `Type`, `PreTestInfo`, `ResultInHours`, `Components`, `Cost`, `CreatedDate`, `UpdatedDate`, `IsDeleted`, `PackageID`, `CompanyID`) VALUES(106, 'RENAL PROFILE/RENAL FUNCTION TEST (RFT/KFT)', 1, NULL, 24, NULL, '0.00', '2019-07-28 00:00:00', NULL, 0, 13, 99);
INSERT INTO `TestMaster` (`ID`, `Name`, `Type`, `PreTestInfo`, `ResultInHours`, `Components`, `Cost`, `CreatedDate`, `UpdatedDate`, `IsDeleted`, `PackageID`, `CompanyID`) VALUES(107, 'COMPLETE BLOOD COUNT (CBC)', 1, NULL, 24, NULL, '0.00', '2019-07-28 00:00:00', NULL, 0, 17, 99);
INSERT INTO `TestMaster` (`ID`, `Name`, `Type`, `PreTestInfo`, `ResultInHours`, `Components`, `Cost`, `CreatedDate`, `UpdatedDate`, `IsDeleted`, `PackageID`, `CompanyID`) VALUES(108, 'COMPLETE URINE EXAMINATION', 2, NULL, 24, NULL, '0.00', '2019-07-28 00:00:00', NULL, 0, 17, 99);
INSERT INTO `TestMaster` (`ID`, `Name`, `Type`, `PreTestInfo`, `ResultInHours`, `Components`, `Cost`, `CreatedDate`, `UpdatedDate`, `IsDeleted`, `PackageID`, `CompanyID`) VALUES(109, 'GLUCOSE	 FASTING', 1, NULL, 24, NULL, '0.00', '2019-07-28 00:00:00', NULL, 0, 17, 99);
INSERT INTO `TestMaster` (`ID`, `Name`, `Type`, `PreTestInfo`, `ResultInHours`, `Components`, `Cost`, `CreatedDate`, `UpdatedDate`, `IsDeleted`, `PackageID`, `CompanyID`) VALUES(110, 'GLUCOSE	 POST PRANDIAL (PP) 2 HOURS (POST MEAL)', 1, NULL, 24, NULL, '0.00', '2019-07-28 00:00:00', NULL, 0, 17, 99);
INSERT INTO `TestMaster` (`ID`, `Name`, `Type`, `PreTestInfo`, `ResultInHours`, `Components`, `Cost`, `CreatedDate`, `UpdatedDate`, `IsDeleted`, `PackageID`, `CompanyID`) VALUES(111, 'HBA1C GLYCATED HEMOGLOBIN', 1, NULL, 24, NULL, '0.00', '2019-07-28 00:00:00', NULL, 0, 17, 99);
INSERT INTO `TestMaster` (`ID`, `Name`, `Type`, `PreTestInfo`, `ResultInHours`, `Components`, `Cost`, `CreatedDate`, `UpdatedDate`, `IsDeleted`, `PackageID`, `CompanyID`) VALUES(112, 'RENAL PROFILE/RENAL FUNCTION TEST (RFT/KFT)', 1, NULL, 24, NULL, '0.00', '2019-07-28 00:00:00', NULL, 0, 17, 99);
INSERT INTO `TestMaster` (`ID`, `Name`, `Type`, `PreTestInfo`, `ResultInHours`, `Components`, `Cost`, `CreatedDate`, `UpdatedDate`, `IsDeleted`, `PackageID`, `CompanyID`) VALUES(113, 'LIPID PROFILE', 1, NULL, 24, NULL, '0.00', '2019-07-28 00:00:00', NULL, 0, 17, 99);
INSERT INTO `TestMaster` (`ID`, `Name`, `Type`, `PreTestInfo`, `ResultInHours`, `Components`, `Cost`, `CreatedDate`, `UpdatedDate`, `IsDeleted`, `PackageID`, `CompanyID`) VALUES(114, 'LIVER FUNCTION TEST (LFT) WITH GGT', 1, NULL, 24, NULL, '0.00', '2019-07-28 00:00:00', NULL, 0, 17, 99);
INSERT INTO `TestMaster` (`ID`, `Name`, `Type`, `PreTestInfo`, `ResultInHours`, `Components`, `Cost`, `CreatedDate`, `UpdatedDate`, `IsDeleted`, `PackageID`, `CompanyID`) VALUES(115, 'COMPLETE BLOOD COUNT (CBC)', 1, NULL, 24, NULL, '0.00', '2019-07-28 00:00:00', NULL, 0, 18, 99);
INSERT INTO `TestMaster` (`ID`, `Name`, `Type`, `PreTestInfo`, `ResultInHours`, `Components`, `Cost`, `CreatedDate`, `UpdatedDate`, `IsDeleted`, `PackageID`, `CompanyID`) VALUES(116, 'COMPLETE URINE EXAMINATION', 2, NULL, 24, NULL, '0.00', '2019-07-28 00:00:00', NULL, 0, 18, 99);
INSERT INTO `TestMaster` (`ID`, `Name`, `Type`, `PreTestInfo`, `ResultInHours`, `Components`, `Cost`, `CreatedDate`, `UpdatedDate`, `IsDeleted`, `PackageID`, `CompanyID`) VALUES(117, 'GLUCOSE	 FASTING', 1, NULL, 24, NULL, '0.00', '2019-07-28 00:00:00', NULL, 0, 18, 99);
INSERT INTO `TestMaster` (`ID`, `Name`, `Type`, `PreTestInfo`, `ResultInHours`, `Components`, `Cost`, `CreatedDate`, `UpdatedDate`, `IsDeleted`, `PackageID`, `CompanyID`) VALUES(118, 'GLUCOSE	 POST PRANDIAL (PP) 2 HOURS (POST MEAL)', 1, NULL, 24, NULL, '0.00', '2019-07-28 00:00:00', NULL, 0, 18, 99);
INSERT INTO `TestMaster` (`ID`, `Name`, `Type`, `PreTestInfo`, `ResultInHours`, `Components`, `Cost`, `CreatedDate`, `UpdatedDate`, `IsDeleted`, `PackageID`, `CompanyID`) VALUES(119, 'HBA1C GLYCATED HEMOGLOBIN', 1, NULL, 24, NULL, '0.00', '2019-07-28 00:00:00', NULL, 0, 18, 99);
INSERT INTO `TestMaster` (`ID`, `Name`, `Type`, `PreTestInfo`, `ResultInHours`, `Components`, `Cost`, `CreatedDate`, `UpdatedDate`, `IsDeleted`, `PackageID`, `CompanyID`) VALUES(120, 'RENAL PROFILE/RENAL FUNCTION TEST (RFT/KFT)', 1, NULL, 24, NULL, '0.00', '2019-07-28 00:00:00', NULL, 0, 18, 99);
INSERT INTO `TestMaster` (`ID`, `Name`, `Type`, `PreTestInfo`, `ResultInHours`, `Components`, `Cost`, `CreatedDate`, `UpdatedDate`, `IsDeleted`, `PackageID`, `CompanyID`) VALUES(121, 'LIPID PROFILE', 1, NULL, 24, NULL, '0.00', '2019-07-28 00:00:00', NULL, 0, 18, 99);
INSERT INTO `TestMaster` (`ID`, `Name`, `Type`, `PreTestInfo`, `ResultInHours`, `Components`, `Cost`, `CreatedDate`, `UpdatedDate`, `IsDeleted`, `PackageID`, `CompanyID`) VALUES(122, 'LIVER FUNCTION TEST (LFT) WITH GGT', 1, NULL, 24, NULL, '0.00', '2019-07-28 00:00:00', NULL, 0, 18, 99);
INSERT INTO `TestMaster` (`ID`, `Name`, `Type`, `PreTestInfo`, `ResultInHours`, `Components`, `Cost`, `CreatedDate`, `UpdatedDate`, `IsDeleted`, `PackageID`, `CompanyID`) VALUES(123, 'THYROID PROFILE (TOTAL T3 TOTAL T4 TSH)', 1, NULL, 24, NULL, '0.00', '2019-07-28 00:00:00', NULL, 0, 18, 99);
INSERT INTO `TestMaster` (`ID`, `Name`, `Type`, `PreTestInfo`, `ResultInHours`, `Components`, `Cost`, `CreatedDate`, `UpdatedDate`, `IsDeleted`, `PackageID`, `CompanyID`) VALUES(124, 'COMPLETE BLOOD COUNT (CBC)', 1, NULL, 24, NULL, '0.00', '2019-07-28 00:00:00', NULL, 0, 19, 99);
INSERT INTO `TestMaster` (`ID`, `Name`, `Type`, `PreTestInfo`, `ResultInHours`, `Components`, `Cost`, `CreatedDate`, `UpdatedDate`, `IsDeleted`, `PackageID`, `CompanyID`) VALUES(125, 'COMPLETE URINE EXAMINATION', 2, NULL, 24, NULL, '0.00', '2019-07-28 00:00:00', NULL, 0, 19, 99);
INSERT INTO `TestMaster` (`ID`, `Name`, `Type`, `PreTestInfo`, `ResultInHours`, `Components`, `Cost`, `CreatedDate`, `UpdatedDate`, `IsDeleted`, `PackageID`, `CompanyID`) VALUES(126, 'GLUCOSE	 FASTING', 1, NULL, 24, NULL, '0.00', '2019-07-28 00:00:00', NULL, 0, 19, 99);
INSERT INTO `TestMaster` (`ID`, `Name`, `Type`, `PreTestInfo`, `ResultInHours`, `Components`, `Cost`, `CreatedDate`, `UpdatedDate`, `IsDeleted`, `PackageID`, `CompanyID`) VALUES(127, 'GLUCOSE	 POST PRANDIAL (PP) 2 HOURS (POST MEAL)', 1, NULL, 24, NULL, '0.00', '2019-07-28 00:00:00', NULL, 0, 19, 99);
INSERT INTO `TestMaster` (`ID`, `Name`, `Type`, `PreTestInfo`, `ResultInHours`, `Components`, `Cost`, `CreatedDate`, `UpdatedDate`, `IsDeleted`, `PackageID`, `CompanyID`) VALUES(128, 'HBA1C GLYCATED HEMOGLOBIN', 1, NULL, 24, NULL, '0.00', '2019-07-28 00:00:00', NULL, 0, 19, 99);
INSERT INTO `TestMaster` (`ID`, `Name`, `Type`, `PreTestInfo`, `ResultInHours`, `Components`, `Cost`, `CreatedDate`, `UpdatedDate`, `IsDeleted`, `PackageID`, `CompanyID`) VALUES(129, 'RENAL PROFILE/RENAL FUNCTION TEST (RFT/KFT)', 1, NULL, 24, NULL, '0.00', '2019-07-28 00:00:00', NULL, 0, 19, 99);
INSERT INTO `TestMaster` (`ID`, `Name`, `Type`, `PreTestInfo`, `ResultInHours`, `Components`, `Cost`, `CreatedDate`, `UpdatedDate`, `IsDeleted`, `PackageID`, `CompanyID`) VALUES(130, 'LIPID PROFILE', 1, NULL, 24, NULL, '0.00', '2019-07-28 00:00:00', NULL, 0, 19, 99);
INSERT INTO `TestMaster` (`ID`, `Name`, `Type`, `PreTestInfo`, `ResultInHours`, `Components`, `Cost`, `CreatedDate`, `UpdatedDate`, `IsDeleted`, `PackageID`, `CompanyID`) VALUES(131, 'LIVER FUNCTION TEST (LFT) WITH GGT', 1, NULL, 24, NULL, '0.00', '2019-07-28 00:00:00', NULL, 0, 19, 99);
INSERT INTO `TestMaster` (`ID`, `Name`, `Type`, `PreTestInfo`, `ResultInHours`, `Components`, `Cost`, `CreatedDate`, `UpdatedDate`, `IsDeleted`, `PackageID`, `CompanyID`) VALUES(132, 'THYROID PROFILE (TOTAL T3 TOTAL T4 TSH)', 1, NULL, 24, NULL, '0.00', '2019-07-28 00:00:00', NULL, 0, 19, 99);
INSERT INTO `TestMaster` (`ID`, `Name`, `Type`, `PreTestInfo`, `ResultInHours`, `Components`, `Cost`, `CreatedDate`, `UpdatedDate`, `IsDeleted`, `PackageID`, `CompanyID`) VALUES(134, 'VITAMIN B12', 3, NULL, 24, NULL, '0.00', '2019-07-28 00:00:00', NULL, 0, 19, 99);
INSERT INTO `TestMaster` (`ID`, `Name`, `Type`, `PreTestInfo`, `ResultInHours`, `Components`, `Cost`, `CreatedDate`, `UpdatedDate`, `IsDeleted`, `PackageID`, `CompanyID`) VALUES(135, 'VITAMIN D - 25 HYDROXY (D2+D3)', 3, NULL, 24, NULL, '0.00', '2019-07-28 00:00:00', NULL, 0, 19, 99);
INSERT INTO `TestMaster` (`ID`, `Name`, `Type`, `PreTestInfo`, `ResultInHours`, `Components`, `Cost`, `CreatedDate`, `UpdatedDate`, `IsDeleted`, `PackageID`, `CompanyID`) VALUES(136, 'COMPLETE BLOOD COUNT (CBC)', 1, NULL, 24, NULL, '0.00', '2019-07-28 00:00:00', NULL, 0, 20, 99);
INSERT INTO `TestMaster` (`ID`, `Name`, `Type`, `PreTestInfo`, `ResultInHours`, `Components`, `Cost`, `CreatedDate`, `UpdatedDate`, `IsDeleted`, `PackageID`, `CompanyID`) VALUES(137, 'COMPLETE URINE EXAMINATION', 2, NULL, 24, NULL, '0.00', '2019-07-28 00:00:00', NULL, 0, 20, 99);
INSERT INTO `TestMaster` (`ID`, `Name`, `Type`, `PreTestInfo`, `ResultInHours`, `Components`, `Cost`, `CreatedDate`, `UpdatedDate`, `IsDeleted`, `PackageID`, `CompanyID`) VALUES(138, 'GLUCOSE	 FASTING', 1, NULL, 24, NULL, '0.00', '2019-07-28 00:00:00', NULL, 0, 20, 99);
INSERT INTO `TestMaster` (`ID`, `Name`, `Type`, `PreTestInfo`, `ResultInHours`, `Components`, `Cost`, `CreatedDate`, `UpdatedDate`, `IsDeleted`, `PackageID`, `CompanyID`) VALUES(139, 'GLUCOSE	 POST PRANDIAL (PP) 2 HOURS (POST MEAL)', 1, NULL, 24, NULL, '0.00', '2019-07-28 00:00:00', NULL, 0, 20, 99);
INSERT INTO `TestMaster` (`ID`, `Name`, `Type`, `PreTestInfo`, `ResultInHours`, `Components`, `Cost`, `CreatedDate`, `UpdatedDate`, `IsDeleted`, `PackageID`, `CompanyID`) VALUES(140, 'HBA1C GLYCATED HEMOGLOBIN', 1, NULL, 24, NULL, '0.00', '2019-07-28 00:00:00', NULL, 0, 20, 99);
INSERT INTO `TestMaster` (`ID`, `Name`, `Type`, `PreTestInfo`, `ResultInHours`, `Components`, `Cost`, `CreatedDate`, `UpdatedDate`, `IsDeleted`, `PackageID`, `CompanyID`) VALUES(141, 'RENAL PROFILE/RENAL FUNCTION TEST (RFT/KFT)', 1, NULL, 24, NULL, '0.00', '2019-07-28 00:00:00', NULL, 0, 20, 99);
INSERT INTO `TestMaster` (`ID`, `Name`, `Type`, `PreTestInfo`, `ResultInHours`, `Components`, `Cost`, `CreatedDate`, `UpdatedDate`, `IsDeleted`, `PackageID`, `CompanyID`) VALUES(142, 'LIPID PROFILE', 1, NULL, 24, NULL, '0.00', '2019-07-28 00:00:00', NULL, 0, 20, 99);
INSERT INTO `TestMaster` (`ID`, `Name`, `Type`, `PreTestInfo`, `ResultInHours`, `Components`, `Cost`, `CreatedDate`, `UpdatedDate`, `IsDeleted`, `PackageID`, `CompanyID`) VALUES(143, 'LIVER FUNCTION TEST (LFT) WITH GGT', 1, NULL, 24, NULL, '0.00', '2019-07-28 00:00:00', NULL, 0, 20, 99);
INSERT INTO `TestMaster` (`ID`, `Name`, `Type`, `PreTestInfo`, `ResultInHours`, `Components`, `Cost`, `CreatedDate`, `UpdatedDate`, `IsDeleted`, `PackageID`, `CompanyID`) VALUES(144, 'THYROID PROFILE (TOTAL T3 TOTAL T4 TSH)', 1, NULL, 24, NULL, '0.00', '2019-07-28 00:00:00', NULL, 0, 20, 99);
INSERT INTO `TestMaster` (`ID`, `Name`, `Type`, `PreTestInfo`, `ResultInHours`, `Components`, `Cost`, `CreatedDate`, `UpdatedDate`, `IsDeleted`, `PackageID`, `CompanyID`) VALUES(145, 'VITAMIN B12', 3, NULL, 24, NULL, '0.00', '2019-07-28 00:00:00', NULL, 0, 20, 99);
INSERT INTO `TestMaster` (`ID`, `Name`, `Type`, `PreTestInfo`, `ResultInHours`, `Components`, `Cost`, `CreatedDate`, `UpdatedDate`, `IsDeleted`, `PackageID`, `CompanyID`) VALUES(146, 'VITAMIN D - 25 HYDROXY (D2+D3)', 3, NULL, 24, NULL, '0.00', '2019-07-28 00:00:00', NULL, 0, 20, 99);
INSERT INTO `TestMaster` (`ID`, `Name`, `Type`, `PreTestInfo`, `ResultInHours`, `Components`, `Cost`, `CreatedDate`, `UpdatedDate`, `IsDeleted`, `PackageID`, `CompanyID`) VALUES(147, 'BLOOD GROUP ABO AND RH FACTOR', 1, NULL, 24, NULL, '0.00', '2019-07-28 00:00:00', NULL, 0, 20, 99);
INSERT INTO `TestMaster` (`ID`, `Name`, `Type`, `PreTestInfo`, `ResultInHours`, `Components`, `Cost`, `CreatedDate`, `UpdatedDate`, `IsDeleted`, `PackageID`, `CompanyID`) VALUES(148, 'IMMUNOCAP PHADITOP ADULT SCREENING', 1, NULL, 24, NULL, '0.00', '2019-07-28 00:00:00', NULL, 0, 20, 99);
INSERT INTO `TestMaster` (`ID`, `Name`, `Type`, `PreTestInfo`, `ResultInHours`, `Components`, `Cost`, `CreatedDate`, `UpdatedDate`, `IsDeleted`, `PackageID`, `CompanyID`) VALUES(149, 'COMPLETE BLOOD COUNT (CBC)', 1, NULL, 24, NULL, '0.00', '2019-07-28 00:00:00', NULL, 0, 21, 99);
INSERT INTO `TestMaster` (`ID`, `Name`, `Type`, `PreTestInfo`, `ResultInHours`, `Components`, `Cost`, `CreatedDate`, `UpdatedDate`, `IsDeleted`, `PackageID`, `CompanyID`) VALUES(150, 'COMPLETE URINE EXAMINATION', 2, NULL, 24, NULL, '0.00', '2019-07-28 00:00:00', NULL, 0, 21, 99);
INSERT INTO `TestMaster` (`ID`, `Name`, `Type`, `PreTestInfo`, `ResultInHours`, `Components`, `Cost`, `CreatedDate`, `UpdatedDate`, `IsDeleted`, `PackageID`, `CompanyID`) VALUES(151, 'GLUCOSE	 FASTING', 1, NULL, 24, NULL, '0.00', '2019-07-28 00:00:00', NULL, 0, 21, 99);
INSERT INTO `TestMaster` (`ID`, `Name`, `Type`, `PreTestInfo`, `ResultInHours`, `Components`, `Cost`, `CreatedDate`, `UpdatedDate`, `IsDeleted`, `PackageID`, `CompanyID`) VALUES(152, 'GLUCOSE	 POST PRANDIAL (PP) 2 HOURS (POST MEAL)', 1, NULL, 24, NULL, '0.00', '2019-07-28 00:00:00', NULL, 0, 21, 99);
INSERT INTO `TestMaster` (`ID`, `Name`, `Type`, `PreTestInfo`, `ResultInHours`, `Components`, `Cost`, `CreatedDate`, `UpdatedDate`, `IsDeleted`, `PackageID`, `CompanyID`) VALUES(153, 'HBA1C GLYCATED HEMOGLOBIN', 1, NULL, 24, NULL, '0.00', '2019-07-28 00:00:00', NULL, 0, 21, 99);
INSERT INTO `TestMaster` (`ID`, `Name`, `Type`, `PreTestInfo`, `ResultInHours`, `Components`, `Cost`, `CreatedDate`, `UpdatedDate`, `IsDeleted`, `PackageID`, `CompanyID`) VALUES(154, 'RENAL PROFILE/RENAL FUNCTION TEST (RFT/KFT)', 1, NULL, 24, NULL, '0.00', '2019-07-28 00:00:00', NULL, 0, 21, 99);
INSERT INTO `TestMaster` (`ID`, `Name`, `Type`, `PreTestInfo`, `ResultInHours`, `Components`, `Cost`, `CreatedDate`, `UpdatedDate`, `IsDeleted`, `PackageID`, `CompanyID`) VALUES(155, 'LIPID PROFILE', 1, NULL, 24, NULL, '0.00', '2019-07-28 00:00:00', NULL, 0, 21, 99);
INSERT INTO `TestMaster` (`ID`, `Name`, `Type`, `PreTestInfo`, `ResultInHours`, `Components`, `Cost`, `CreatedDate`, `UpdatedDate`, `IsDeleted`, `PackageID`, `CompanyID`) VALUES(156, 'LIVER FUNCTION TEST (LFT) WITH GGT', 1, NULL, 24, NULL, '0.00', '2019-07-28 00:00:00', NULL, 0, 21, 99);
INSERT INTO `TestMaster` (`ID`, `Name`, `Type`, `PreTestInfo`, `ResultInHours`, `Components`, `Cost`, `CreatedDate`, `UpdatedDate`, `IsDeleted`, `PackageID`, `CompanyID`) VALUES(157, 'THYROID PROFILE (TOTAL T3 TOTAL T4 TSH)', 1, NULL, 24, NULL, '0.00', '2019-07-28 00:00:00', NULL, 0, 21, 99);
INSERT INTO `TestMaster` (`ID`, `Name`, `Type`, `PreTestInfo`, `ResultInHours`, `Components`, `Cost`, `CreatedDate`, `UpdatedDate`, `IsDeleted`, `PackageID`, `CompanyID`) VALUES(158, 'VITAMIN B12', 1, NULL, 24, NULL, '0.00', '2019-07-28 00:00:00', NULL, 0, 21, 99);
INSERT INTO `TestMaster` (`ID`, `Name`, `Type`, `PreTestInfo`, `ResultInHours`, `Components`, `Cost`, `CreatedDate`, `UpdatedDate`, `IsDeleted`, `PackageID`, `CompanyID`) VALUES(159, 'VITAMIN D - 25 HYDROXY (D2+D3)', 1, NULL, 24, NULL, '0.00', '2019-07-28 00:00:00', NULL, 0, 21, 99);
INSERT INTO `TestMaster` (`ID`, `Name`, `Type`, `PreTestInfo`, `ResultInHours`, `Components`, `Cost`, `CreatedDate`, `UpdatedDate`, `IsDeleted`, `PackageID`, `CompanyID`) VALUES(160, 'BLOOD GROUP ABO AND RH FACTOR', 1, NULL, 24, NULL, '0.00', '2019-07-28 00:00:00', NULL, 0, 21, 99);
INSERT INTO `TestMaster` (`ID`, `Name`, `Type`, `PreTestInfo`, `ResultInHours`, `Components`, `Cost`, `CreatedDate`, `UpdatedDate`, `IsDeleted`, `PackageID`, `CompanyID`) VALUES(161, 'IMMUNOCAP PHADITOP ADULT SCREENING', 1, NULL, 24, NULL, '0.00', '2019-07-28 00:00:00', NULL, 0, 21, 99);
INSERT INTO `TestMaster` (`ID`, `Name`, `Type`, `PreTestInfo`, `ResultInHours`, `Components`, `Cost`, `CreatedDate`, `UpdatedDate`, `IsDeleted`, `PackageID`, `CompanyID`) VALUES(162, 'IRON - SERUM', 1, NULL, 24, NULL, '0.00', '2019-07-28 00:00:00', NULL, 0, 21, 99);
INSERT INTO `TestMaster` (`ID`, `Name`, `Type`, `PreTestInfo`, `ResultInHours`, `Components`, `Cost`, `CreatedDate`, `UpdatedDate`, `IsDeleted`, `PackageID`, `CompanyID`) VALUES(163, 'TOTAL IRON BINDING CAPACITY ( TIBC) - SERUM', 1, NULL, 24, NULL, '0.00', '2019-07-28 00:00:00', NULL, 0, 21, 99);
INSERT INTO `TestMaster` (`ID`, `Name`, `Type`, `PreTestInfo`, `ResultInHours`, `Components`, `Cost`, `CreatedDate`, `UpdatedDate`, `IsDeleted`, `PackageID`, `CompanyID`) VALUES(164, 'ERYTHROCYTE SEDIMENTATION RATE (ESR)', 1, NULL, 24, NULL, '0.00', '2019-07-28 00:00:00', NULL, 0, 21, 99);
INSERT INTO `TestMaster` (`ID`, `Name`, `Type`, `PreTestInfo`, `ResultInHours`, `Components`, `Cost`, `CreatedDate`, `UpdatedDate`, `IsDeleted`, `PackageID`, `CompanyID`) VALUES(165, 'MICROALBUMIN ( MAU)- SPOT URINE', 2, NULL, 24, NULL, '0.00', '2019-07-28 00:00:00', NULL, 0, 21, 99);
INSERT INTO `TestMaster` (`ID`, `Name`, `Type`, `PreTestInfo`, `ResultInHours`, `Components`, `Cost`, `CreatedDate`, `UpdatedDate`, `IsDeleted`, `PackageID`, `CompanyID`) VALUES(166, 'THYROID PROFILE TOTAL(T3,T4,TSH)', 1, NULL, 24, NULL, '0.00', '2019-07-28 00:00:00', NULL, 0, 22, 99);
INSERT INTO `TestMaster` (`ID`, `Name`, `Type`, `PreTestInfo`, `ResultInHours`, `Components`, `Cost`, `CreatedDate`, `UpdatedDate`, `IsDeleted`, `PackageID`, `CompanyID`) VALUES(167, 'FREE T3 (FT3)', 1, NULL, 24, NULL, '0.00', '2019-07-28 00:00:00', NULL, 0, 22, 99);
INSERT INTO `TestMaster` (`ID`, `Name`, `Type`, `PreTestInfo`, `ResultInHours`, `Components`, `Cost`, `CreatedDate`, `UpdatedDate`, `IsDeleted`, `PackageID`, `CompanyID`) VALUES(168, 'FREE T4 (FT4)', 1, NULL, 24, NULL, '0.00', '2019-07-28 00:00:00', NULL, 0, 22, 99);
INSERT INTO `TestMaster` (`ID`, `Name`, `Type`, `PreTestInfo`, `ResultInHours`, `Components`, `Cost`, `CreatedDate`, `UpdatedDate`, `IsDeleted`, `PackageID`, `CompanyID`) VALUES(169, 'CALCIUM SERUM', 1, NULL, 24, NULL, '0.00', '2019-07-28 00:00:00', NULL, 0, 22, 99);
INSERT INTO `TestMaster` (`ID`, `Name`, `Type`, `PreTestInfo`, `ResultInHours`, `Components`, `Cost`, `CreatedDate`, `UpdatedDate`, `IsDeleted`, `PackageID`, `CompanyID`) VALUES(170, 'VITAMIN D - 25 HYDROXY (D2+D3)', 3, NULL, 24, NULL, '0.00', '2019-07-28 00:00:00', NULL, 0, 23, 99);
INSERT INTO `TestMaster` (`ID`, `Name`, `Type`, `PreTestInfo`, `ResultInHours`, `Components`, `Cost`, `CreatedDate`, `UpdatedDate`, `IsDeleted`, `PackageID`, `CompanyID`) VALUES(171, 'VITAMIN B12', 3, NULL, 24, NULL, '0.00', '2019-07-28 00:00:00', NULL, 0, 23, 99);
INSERT INTO `TestMaster` (`ID`, `Name`, `Type`, `PreTestInfo`, `ResultInHours`, `Components`, `Cost`, `CreatedDate`, `UpdatedDate`, `IsDeleted`, `PackageID`, `CompanyID`) VALUES(172, 'CALCIUM SERUM', 1, NULL, 24, NULL, '0.00', '2019-07-28 00:00:00', NULL, 0, 23, 99);
INSERT INTO `TestMaster` (`ID`, `Name`, `Type`, `PreTestInfo`, `ResultInHours`, `Components`, `Cost`, `CreatedDate`, `UpdatedDate`, `IsDeleted`, `PackageID`, `CompanyID`) VALUES(173, 'COMPLETE BLOOD COUNT (CBC)', 1, NULL, 24, NULL, '0.00', '2019-07-28 00:00:00', NULL, 0, 24, 99);
INSERT INTO `TestMaster` (`ID`, `Name`, `Type`, `PreTestInfo`, `ResultInHours`, `Components`, `Cost`, `CreatedDate`, `UpdatedDate`, `IsDeleted`, `PackageID`, `CompanyID`) VALUES(174, 'VITAMIN D - 25 HYDROXY (D2+D3)', 3, NULL, 24, NULL, '0.00', '2019-07-28 00:00:00', NULL, 0, 24, 99);
INSERT INTO `TestMaster` (`ID`, `Name`, `Type`, `PreTestInfo`, `ResultInHours`, `Components`, `Cost`, `CreatedDate`, `UpdatedDate`, `IsDeleted`, `PackageID`, `CompanyID`) VALUES(175, 'CALCIUM SERUM', 1, NULL, 24, NULL, '0.00', '2019-07-28 00:00:00', NULL, 0, 24, 99);
INSERT INTO `TestMaster` (`ID`, `Name`, `Type`, `PreTestInfo`, `ResultInHours`, `Components`, `Cost`, `CreatedDate`, `UpdatedDate`, `IsDeleted`, `PackageID`, `CompanyID`) VALUES(176, 'PHOSPHORUS INORGANIC - SERUM', 1, NULL, 24, NULL, '0.00', '2019-07-28 00:00:00', NULL, 0, 24, 99);
INSERT INTO `TestMaster` (`ID`, `Name`, `Type`, `PreTestInfo`, `ResultInHours`, `Components`, `Cost`, `CreatedDate`, `UpdatedDate`, `IsDeleted`, `PackageID`, `CompanyID`) VALUES(177, 'ALKALINE PHOSPHATASE - SERUM', 1, NULL, 24, NULL, '0.00', '2019-07-28 00:00:00', NULL, 0, 24, 99);
INSERT INTO `TestMaster` (`ID`, `Name`, `Type`, `PreTestInfo`, `ResultInHours`, `Components`, `Cost`, `CreatedDate`, `UpdatedDate`, `IsDeleted`, `PackageID`, `CompanyID`) VALUES(178, 'ALKALINE PHOSPHATASE - SERUM', 1, NULL, 24, NULL, '0.00', '2019-07-28 00:00:00', NULL, 0, 25, 99);
INSERT INTO `TestMaster` (`ID`, `Name`, `Type`, `PreTestInfo`, `ResultInHours`, `Components`, `Cost`, `CreatedDate`, `UpdatedDate`, `IsDeleted`, `PackageID`, `CompanyID`) VALUES(179, 'VITAMIN D - 25 HYDROXY (D2+D3)', 1, NULL, 24, NULL, '0.00', '2019-07-28 00:00:00', NULL, 0, 25, 99);
INSERT INTO `TestMaster` (`ID`, `Name`, `Type`, `PreTestInfo`, `ResultInHours`, `Components`, `Cost`, `CreatedDate`, `UpdatedDate`, `IsDeleted`, `PackageID`, `CompanyID`) VALUES(180, 'CALCIUM SERUM', 1, NULL, 24, NULL, '0.00', '2019-07-28 00:00:00', NULL, 0, 25, 99);
INSERT INTO `TestMaster` (`ID`, `Name`, `Type`, `PreTestInfo`, `ResultInHours`, `Components`, `Cost`, `CreatedDate`, `UpdatedDate`, `IsDeleted`, `PackageID`, `CompanyID`) VALUES(181, 'PARATHYROID HORMONE [PTH]', 1, NULL, 24, NULL, '0.00', '2019-07-28 00:00:00', NULL, 0, 25, 99);
INSERT INTO `TestMaster` (`ID`, `Name`, `Type`, `PreTestInfo`, `ResultInHours`, `Components`, `Cost`, `CreatedDate`, `UpdatedDate`, `IsDeleted`, `PackageID`, `CompanyID`) VALUES(182, 'THYROXINE (T4 TOTAL) SERUM', 1, NULL, 24, NULL, '0.00', '2019-07-28 00:00:00', NULL, 0, 25, 99);
INSERT INTO `TestMaster` (`ID`, `Name`, `Type`, `PreTestInfo`, `ResultInHours`, `Components`, `Cost`, `CreatedDate`, `UpdatedDate`, `IsDeleted`, `PackageID`, `CompanyID`) VALUES(183, 'THYROID STIMULATING HORMONE (TSH) SERUM', 1, NULL, 24, NULL, '0.00', '2019-07-28 00:00:00', NULL, 0, 25, 99);
INSERT INTO `TestMaster` (`ID`, `Name`, `Type`, `PreTestInfo`, `ResultInHours`, `Components`, `Cost`, `CreatedDate`, `UpdatedDate`, `IsDeleted`, `PackageID`, `CompanyID`) VALUES(184, 'Glucose Fasting', 1, NULL, 24, NULL, '0.00', '2019-07-28 00:00:00', NULL, 0, 26, 99);
INSERT INTO `TestMaster` (`ID`, `Name`, `Type`, `PreTestInfo`, `ResultInHours`, `Components`, `Cost`, `CreatedDate`, `UpdatedDate`, `IsDeleted`, `PackageID`, `CompanyID`) VALUES(185, 'URINE R/E', 1, NULL, 24, NULL, '0.00', '2019-07-28 00:00:00', NULL, 0, 26, 99);
INSERT INTO `TestMaster` (`ID`, `Name`, `Type`, `PreTestInfo`, `ResultInHours`, `Components`, `Cost`, `CreatedDate`, `UpdatedDate`, `IsDeleted`, `PackageID`, `CompanyID`) VALUES(186, 'BLOOD GROUP ABO AND RH FACTOR', 1, NULL, 24, NULL, '0.00', '2019-07-28 00:00:00', NULL, 0, 26, 99);
INSERT INTO `TestMaster` (`ID`, `Name`, `Type`, `PreTestInfo`, `ResultInHours`, `Components`, `Cost`, `CreatedDate`, `UpdatedDate`, `IsDeleted`, `PackageID`, `CompanyID`) VALUES(187, 'HIV I & II', 1, NULL, 24, NULL, '0.00', '2019-07-28 00:00:00', NULL, 0, 26, 99);
INSERT INTO `TestMaster` (`ID`, `Name`, `Type`, `PreTestInfo`, `ResultInHours`, `Components`, `Cost`, `CreatedDate`, `UpdatedDate`, `IsDeleted`, `PackageID`, `CompanyID`) VALUES(188, 'HBSAG / AUSTRALIA ANTIGEN', 1, NULL, 24, NULL, '0.00', '2019-07-28 00:00:00', NULL, 0, 26, 99);
INSERT INTO `TestMaster` (`ID`, `Name`, `Type`, `PreTestInfo`, `ResultInHours`, `Components`, `Cost`, `CreatedDate`, `UpdatedDate`, `IsDeleted`, `PackageID`, `CompanyID`) VALUES(189, 'ANTI HCV', 1, NULL, 24, NULL, '0.00', '2019-07-28 00:00:00', NULL, 0, 26, 99);
INSERT INTO `TestMaster` (`ID`, `Name`, `Type`, `PreTestInfo`, `ResultInHours`, `Components`, `Cost`, `CreatedDate`, `UpdatedDate`, `IsDeleted`, `PackageID`, `CompanyID`) VALUES(190, 'VDRL', 1, NULL, 24, NULL, '0.00', '2019-07-28 00:00:00', NULL, 0, 26, 99);
INSERT INTO `TestMaster` (`ID`, `Name`, `Type`, `PreTestInfo`, `ResultInHours`, `Components`, `Cost`, `CreatedDate`, `UpdatedDate`, `IsDeleted`, `PackageID`, `CompanyID`) VALUES(191, 'THALASSEMIA PROFILE', 1, NULL, 24, NULL, '0.00', '2019-07-28 00:00:00', NULL, 0, 26, 99);
INSERT INTO `TestMaster` (`ID`, `Name`, `Type`, `PreTestInfo`, `ResultInHours`, `Components`, `Cost`, `CreatedDate`, `UpdatedDate`, `IsDeleted`, `PackageID`, `CompanyID`) VALUES(192, 'CBC', 1, NULL, 24, NULL, '0.00', '2019-07-28 00:00:00', NULL, 0, 27, 99);
INSERT INTO `TestMaster` (`ID`, `Name`, `Type`, `PreTestInfo`, `ResultInHours`, `Components`, `Cost`, `CreatedDate`, `UpdatedDate`, `IsDeleted`, `PackageID`, `CompanyID`) VALUES(193, 'BLOOD GROUP ABO AND RH FACTOR', 1, NULL, 24, NULL, '0.00', '2019-07-28 00:00:00', NULL, 0, 27, 99);
INSERT INTO `TestMaster` (`ID`, `Name`, `Type`, `PreTestInfo`, `ResultInHours`, `Components`, `Cost`, `CreatedDate`, `UpdatedDate`, `IsDeleted`, `PackageID`, `CompanyID`) VALUES(194, 'HIV I & II', 1, NULL, 24, NULL, '0.00', '2019-07-28 00:00:00', NULL, 0, 27, 99);
INSERT INTO `TestMaster` (`ID`, `Name`, `Type`, `PreTestInfo`, `ResultInHours`, `Components`, `Cost`, `CreatedDate`, `UpdatedDate`, `IsDeleted`, `PackageID`, `CompanyID`) VALUES(195, 'HBSAG ', 1, NULL, 24, NULL, '0.00', '2019-07-28 00:00:00', NULL, 0, 27, 99);
INSERT INTO `TestMaster` (`ID`, `Name`, `Type`, `PreTestInfo`, `ResultInHours`, `Components`, `Cost`, `CreatedDate`, `UpdatedDate`, `IsDeleted`, `PackageID`, `CompanyID`) VALUES(196, 'VDRL', 1, NULL, 24, NULL, '0.00', '2019-07-28 00:00:00', NULL, 0, 27, 99);
INSERT INTO `TestMaster` (`ID`, `Name`, `Type`, `PreTestInfo`, `ResultInHours`, `Components`, `Cost`, `CreatedDate`, `UpdatedDate`, `IsDeleted`, `PackageID`, `CompanyID`) VALUES(197, 'RBS', 1, NULL, 24, NULL, '0.00', '2019-07-28 00:00:00', NULL, 0, 27, 99);
INSERT INTO `TestMaster` (`ID`, `Name`, `Type`, `PreTestInfo`, `ResultInHours`, `Components`, `Cost`, `CreatedDate`, `UpdatedDate`, `IsDeleted`, `PackageID`, `CompanyID`) VALUES(198, 'URINE R/E', 1, NULL, 24, NULL, '0.00', '2019-07-28 00:00:00', NULL, 0, 27, 99);
INSERT INTO `TestMaster` (`ID`, `Name`, `Type`, `PreTestInfo`, `ResultInHours`, `Components`, `Cost`, `CreatedDate`, `UpdatedDate`, `IsDeleted`, `PackageID`, `CompanyID`) VALUES(199, 'GLUCOSE	 FASTING', 1, NULL, 24, NULL, '0.00', '2019-07-28 00:00:00', NULL, 0, 28, 99);
INSERT INTO `TestMaster` (`ID`, `Name`, `Type`, `PreTestInfo`, `ResultInHours`, `Components`, `Cost`, `CreatedDate`, `UpdatedDate`, `IsDeleted`, `PackageID`, `CompanyID`) VALUES(200, 'CBC', 1, NULL, 24, NULL, '0.00', '2019-07-28 00:00:00', NULL, 0, 28, 99);
INSERT INTO `TestMaster` (`ID`, `Name`, `Type`, `PreTestInfo`, `ResultInHours`, `Components`, `Cost`, `CreatedDate`, `UpdatedDate`, `IsDeleted`, `PackageID`, `CompanyID`) VALUES(201, 'URINE R/E', 1, NULL, 24, NULL, '0.00', '2019-07-28 00:00:00', NULL, 0, 28, 99);
INSERT INTO `TestMaster` (`ID`, `Name`, `Type`, `PreTestInfo`, `ResultInHours`, `Components`, `Cost`, `CreatedDate`, `UpdatedDate`, `IsDeleted`, `PackageID`, `CompanyID`) VALUES(202, 'BLOOD GROUP ABO AND RH FACTOR', 1, NULL, 24, NULL, '0.00', '2019-07-28 00:00:00', NULL, 0, 28, 99);
INSERT INTO `TestMaster` (`ID`, `Name`, `Type`, `PreTestInfo`, `ResultInHours`, `Components`, `Cost`, `CreatedDate`, `UpdatedDate`, `IsDeleted`, `PackageID`, `CompanyID`) VALUES(203, 'HIV I & II', 1, NULL, 24, NULL, '0.00', '2019-07-28 00:00:00', NULL, 0, 28, 99);
INSERT INTO `TestMaster` (`ID`, `Name`, `Type`, `PreTestInfo`, `ResultInHours`, `Components`, `Cost`, `CreatedDate`, `UpdatedDate`, `IsDeleted`, `PackageID`, `CompanyID`) VALUES(204, 'HBSAG ', 1, NULL, 24, NULL, '0.00', '2019-07-28 00:00:00', NULL, 0, 28, 99);
INSERT INTO `TestMaster` (`ID`, `Name`, `Type`, `PreTestInfo`, `ResultInHours`, `Components`, `Cost`, `CreatedDate`, `UpdatedDate`, `IsDeleted`, `PackageID`, `CompanyID`) VALUES(205, 'ANTI HCV', 1, NULL, 24, NULL, '0.00', '2019-07-28 00:00:00', NULL, 0, 28, 99);
INSERT INTO `TestMaster` (`ID`, `Name`, `Type`, `PreTestInfo`, `ResultInHours`, `Components`, `Cost`, `CreatedDate`, `UpdatedDate`, `IsDeleted`, `PackageID`, `CompanyID`) VALUES(206, 'VDRL', 1, NULL, 24, NULL, '0.00', '2019-07-28 00:00:00', NULL, 0, 28, 99);
INSERT INTO `TestMaster` (`ID`, `Name`, `Type`, `PreTestInfo`, `ResultInHours`, `Components`, `Cost`, `CreatedDate`, `UpdatedDate`, `IsDeleted`, `PackageID`, `CompanyID`) VALUES(207, 'GLUCOSE	 FASTING', 1, NULL, 24, NULL, '0.00', '2019-07-28 00:00:00', NULL, 0, 29, 99);
INSERT INTO `TestMaster` (`ID`, `Name`, `Type`, `PreTestInfo`, `ResultInHours`, `Components`, `Cost`, `CreatedDate`, `UpdatedDate`, `IsDeleted`, `PackageID`, `CompanyID`) VALUES(208, 'URINE R/E', 1, NULL, 24, NULL, '0.00', '2019-07-28 00:00:00', NULL, 0, 29, 99);
INSERT INTO `TestMaster` (`ID`, `Name`, `Type`, `PreTestInfo`, `ResultInHours`, `Components`, `Cost`, `CreatedDate`, `UpdatedDate`, `IsDeleted`, `PackageID`, `CompanyID`) VALUES(209, 'BLOOD GROUP ABO AND RH FACTOR', 1, NULL, 24, NULL, '0.00', '2019-07-28 00:00:00', NULL, 0, 29, 99);
INSERT INTO `TestMaster` (`ID`, `Name`, `Type`, `PreTestInfo`, `ResultInHours`, `Components`, `Cost`, `CreatedDate`, `UpdatedDate`, `IsDeleted`, `PackageID`, `CompanyID`) VALUES(210, 'HIV I & II', 1, NULL, 24, NULL, '0.00', '2019-07-28 00:00:00', NULL, 0, 29, 99);
INSERT INTO `TestMaster` (`ID`, `Name`, `Type`, `PreTestInfo`, `ResultInHours`, `Components`, `Cost`, `CreatedDate`, `UpdatedDate`, `IsDeleted`, `PackageID`, `CompanyID`) VALUES(212, 'HBSAG ', 1, NULL, 24, NULL, '0.00', '2019-07-28 00:00:00', NULL, 0, 29, 99);
INSERT INTO `TestMaster` (`ID`, `Name`, `Type`, `PreTestInfo`, `ResultInHours`, `Components`, `Cost`, `CreatedDate`, `UpdatedDate`, `IsDeleted`, `PackageID`, `CompanyID`) VALUES(213, 'ANTI HCV', 1, NULL, 24, NULL, '0.00', '2019-07-28 00:00:00', NULL, 0, 29, 99);
INSERT INTO `TestMaster` (`ID`, `Name`, `Type`, `PreTestInfo`, `ResultInHours`, `Components`, `Cost`, `CreatedDate`, `UpdatedDate`, `IsDeleted`, `PackageID`, `CompanyID`) VALUES(214, 'VDRL', 1, NULL, 24, NULL, '0.00', '2019-07-28 00:00:00', NULL, 0, 29, 99);
INSERT INTO `TestMaster` (`ID`, `Name`, `Type`, `PreTestInfo`, `ResultInHours`, `Components`, `Cost`, `CreatedDate`, `UpdatedDate`, `IsDeleted`, `PackageID`, `CompanyID`) VALUES(215, 'CBC', 1, NULL, 24, NULL, '0.00', '2019-07-28 00:00:00', NULL, 0, 29, 99);
INSERT INTO `TestMaster` (`ID`, `Name`, `Type`, `PreTestInfo`, `ResultInHours`, `Components`, `Cost`, `CreatedDate`, `UpdatedDate`, `IsDeleted`, `PackageID`, `CompanyID`) VALUES(216, 'GLUCOSE	 FASTING', 1, NULL, 24, NULL, '0.00', '2019-07-28 00:00:00', NULL, 0, 30, 99);
INSERT INTO `TestMaster` (`ID`, `Name`, `Type`, `PreTestInfo`, `ResultInHours`, `Components`, `Cost`, `CreatedDate`, `UpdatedDate`, `IsDeleted`, `PackageID`, `CompanyID`) VALUES(217, 'CBC', 1, NULL, 24, NULL, '0.00', '2019-07-28 00:00:00', NULL, 0, 30, 99);
INSERT INTO `TestMaster` (`ID`, `Name`, `Type`, `PreTestInfo`, `ResultInHours`, `Components`, `Cost`, `CreatedDate`, `UpdatedDate`, `IsDeleted`, `PackageID`, `CompanyID`) VALUES(218, 'URINE R/E', 2, NULL, 24, NULL, '0.00', '2019-07-28 00:00:00', NULL, 0, 30, 99);
INSERT INTO `TestMaster` (`ID`, `Name`, `Type`, `PreTestInfo`, `ResultInHours`, `Components`, `Cost`, `CreatedDate`, `UpdatedDate`, `IsDeleted`, `PackageID`, `CompanyID`) VALUES(221, 'HIV I & II', 1, NULL, 24, NULL, '0.00', '2019-07-28 00:00:00', NULL, 0, 30, 99);
INSERT INTO `TestMaster` (`ID`, `Name`, `Type`, `PreTestInfo`, `ResultInHours`, `Components`, `Cost`, `CreatedDate`, `UpdatedDate`, `IsDeleted`, `PackageID`, `CompanyID`) VALUES(222, 'HBSAG ', 1, NULL, 24, NULL, '0.00', '2019-07-28 00:00:00', NULL, 0, 30, 99);
INSERT INTO `TestMaster` (`ID`, `Name`, `Type`, `PreTestInfo`, `ResultInHours`, `Components`, `Cost`, `CreatedDate`, `UpdatedDate`, `IsDeleted`, `PackageID`, `CompanyID`) VALUES(223, 'ANTI HCV', 1, NULL, 24, NULL, '0.00', '2019-07-28 00:00:00', NULL, 0, 30, 99);
INSERT INTO `TestMaster` (`ID`, `Name`, `Type`, `PreTestInfo`, `ResultInHours`, `Components`, `Cost`, `CreatedDate`, `UpdatedDate`, `IsDeleted`, `PackageID`, `CompanyID`) VALUES(224, 'VDRL', 1, NULL, 24, NULL, '0.00', '2019-07-28 00:00:00', NULL, 0, 30, 99);
INSERT INTO `TestMaster` (`ID`, `Name`, `Type`, `PreTestInfo`, `ResultInHours`, `Components`, `Cost`, `CreatedDate`, `UpdatedDate`, `IsDeleted`, `PackageID`, `CompanyID`) VALUES(225, 'THALASSEMIA PROFILE', 1, NULL, 24, NULL, '0.00', '2019-07-28 00:00:00', NULL, 0, 30, 99);
INSERT INTO `TestMaster` (`ID`, `Name`, `Type`, `PreTestInfo`, `ResultInHours`, `Components`, `Cost`, `CreatedDate`, `UpdatedDate`, `IsDeleted`, `PackageID`, `CompanyID`) VALUES(226, 'COMPLETE BLOOD COUNT (CBC)', 1, NULL, 24, NULL, '0.00', '2019-07-28 00:00:00', NULL, 0, 31, 99);
INSERT INTO `TestMaster` (`ID`, `Name`, `Type`, `PreTestInfo`, `ResultInHours`, `Components`, `Cost`, `CreatedDate`, `UpdatedDate`, `IsDeleted`, `PackageID`, `CompanyID`) VALUES(227, 'ERYTHROCYTE SEDIMENTATION RATE (ESR)', 1, NULL, 24, NULL, '0.00', '2019-07-28 00:00:00', NULL, 0, 31, 99);
INSERT INTO `TestMaster` (`ID`, `Name`, `Type`, `PreTestInfo`, `ResultInHours`, `Components`, `Cost`, `CreatedDate`, `UpdatedDate`, `IsDeleted`, `PackageID`, `CompanyID`) VALUES(228, 'BLOOD GROUP ABO AND RH FACTOR', 1, NULL, 24, NULL, '0.00', '2019-07-28 00:00:00', NULL, 0, 31, 99);
INSERT INTO `TestMaster` (`ID`, `Name`, `Type`, `PreTestInfo`, `ResultInHours`, `Components`, `Cost`, `CreatedDate`, `UpdatedDate`, `IsDeleted`, `PackageID`, `CompanyID`) VALUES(229, 'GLUCOSE	 FASTING', 1, NULL, 24, NULL, '0.00', '2019-07-28 00:00:00', NULL, 0, 31, 99);
INSERT INTO `TestMaster` (`ID`, `Name`, `Type`, `PreTestInfo`, `ResultInHours`, `Components`, `Cost`, `CreatedDate`, `UpdatedDate`, `IsDeleted`, `PackageID`, `CompanyID`) VALUES(230, 'LIPID PROFILE', 1, NULL, 24, NULL, '0.00', '2019-07-28 00:00:00', NULL, 0, 31, 99);
INSERT INTO `TestMaster` (`ID`, `Name`, `Type`, `PreTestInfo`, `ResultInHours`, `Components`, `Cost`, `CreatedDate`, `UpdatedDate`, `IsDeleted`, `PackageID`, `CompanyID`) VALUES(231, 'GLUCOSE	 POST PRANDIAL (PP) 2 HOURS (POST MEAL)', 1, NULL, 24, NULL, '0.00', '2019-07-28 00:00:00', NULL, 0, 31, 99);
INSERT INTO `TestMaster` (`ID`, `Name`, `Type`, `PreTestInfo`, `ResultInHours`, `Components`, `Cost`, `CreatedDate`, `UpdatedDate`, `IsDeleted`, `PackageID`, `CompanyID`) VALUES(232, 'HBA1C GLYCATED HEMOGLOBIN', 1, NULL, 24, NULL, '0.00', '2019-07-28 00:00:00', NULL, 0, 31, 99);
INSERT INTO `TestMaster` (`ID`, `Name`, `Type`, `PreTestInfo`, `ResultInHours`, `Components`, `Cost`, `CreatedDate`, `UpdatedDate`, `IsDeleted`, `PackageID`, `CompanyID`) VALUES(233, 'RENAL PROFILE/RENAL FUNCTION TEST (RFT/KFT)', 1, NULL, 24, NULL, '0.00', '2019-07-28 00:00:00', NULL, 0, 31, 99);
INSERT INTO `TestMaster` (`ID`, `Name`, `Type`, `PreTestInfo`, `ResultInHours`, `Components`, `Cost`, `CreatedDate`, `UpdatedDate`, `IsDeleted`, `PackageID`, `CompanyID`) VALUES(234, 'LIVER FUNCTION TEST (LFT) WITH GGT', 1, NULL, 24, NULL, '0.00', '2019-07-28 00:00:00', NULL, 0, 31, 99);
INSERT INTO `TestMaster` (`ID`, `Name`, `Type`, `PreTestInfo`, `ResultInHours`, `Components`, `Cost`, `CreatedDate`, `UpdatedDate`, `IsDeleted`, `PackageID`, `CompanyID`) VALUES(235, 'PROSTATIC SPECIFIC ANTIGEN (PSA TOTAL)', 1, NULL, 24, NULL, '0.00', '2019-07-28 00:00:00', NULL, 0, 31, 99);
INSERT INTO `TestMaster` (`ID`, `Name`, `Type`, `PreTestInfo`, `ResultInHours`, `Components`, `Cost`, `CreatedDate`, `UpdatedDate`, `IsDeleted`, `PackageID`, `CompanyID`) VALUES(236, 'COMPLETE URINE EXAMINATION', 2, NULL, 24, NULL, '0.00', '2019-07-28 00:00:00', NULL, 0, 31, 99);
INSERT INTO `TestMaster` (`ID`, `Name`, `Type`, `PreTestInfo`, `ResultInHours`, `Components`, `Cost`, `CreatedDate`, `UpdatedDate`, `IsDeleted`, `PackageID`, `CompanyID`) VALUES(237, 'COMPLETE BLOOD COUNT (CBC)', 1, NULL, 24, NULL, '0.00', '2019-07-28 00:00:00', NULL, 0, 32, 99);
INSERT INTO `TestMaster` (`ID`, `Name`, `Type`, `PreTestInfo`, `ResultInHours`, `Components`, `Cost`, `CreatedDate`, `UpdatedDate`, `IsDeleted`, `PackageID`, `CompanyID`) VALUES(238, 'ERYTHROCYTE SEDIMENTATION RATE (ESR)', 1, NULL, 24, NULL, '0.00', '2019-07-28 00:00:00', NULL, 0, 32, 99);
INSERT INTO `TestMaster` (`ID`, `Name`, `Type`, `PreTestInfo`, `ResultInHours`, `Components`, `Cost`, `CreatedDate`, `UpdatedDate`, `IsDeleted`, `PackageID`, `CompanyID`) VALUES(239, 'BLOOD GROUP ABO AND RH FACTOR', 1, NULL, 24, NULL, '0.00', '2019-07-28 00:00:00', NULL, 0, 32, 99);
INSERT INTO `TestMaster` (`ID`, `Name`, `Type`, `PreTestInfo`, `ResultInHours`, `Components`, `Cost`, `CreatedDate`, `UpdatedDate`, `IsDeleted`, `PackageID`, `CompanyID`) VALUES(240, 'LIPID PROFILE', 1, NULL, 24, NULL, '0.00', '2019-07-28 00:00:00', NULL, 0, 32, 99);
INSERT INTO `TestMaster` (`ID`, `Name`, `Type`, `PreTestInfo`, `ResultInHours`, `Components`, `Cost`, `CreatedDate`, `UpdatedDate`, `IsDeleted`, `PackageID`, `CompanyID`) VALUES(241, 'GLUCOSE	 FASTING', 1, NULL, 24, NULL, '0.00', '2019-07-28 00:00:00', NULL, 0, 32, 99);
INSERT INTO `TestMaster` (`ID`, `Name`, `Type`, `PreTestInfo`, `ResultInHours`, `Components`, `Cost`, `CreatedDate`, `UpdatedDate`, `IsDeleted`, `PackageID`, `CompanyID`) VALUES(242, 'GLUCOSE	 POST PRANDIAL (PP) 2 HOURS (POST MEAL)', 1, NULL, 24, NULL, '0.00', '2019-07-28 00:00:00', NULL, 0, 32, 99);
INSERT INTO `TestMaster` (`ID`, `Name`, `Type`, `PreTestInfo`, `ResultInHours`, `Components`, `Cost`, `CreatedDate`, `UpdatedDate`, `IsDeleted`, `PackageID`, `CompanyID`) VALUES(243, 'VITAMIN B12', 3, NULL, 24, NULL, '0.00', '2019-07-28 00:00:00', NULL, 0, 32, 99);
INSERT INTO `TestMaster` (`ID`, `Name`, `Type`, `PreTestInfo`, `ResultInHours`, `Components`, `Cost`, `CreatedDate`, `UpdatedDate`, `IsDeleted`, `PackageID`, `CompanyID`) VALUES(244, 'THYROID STIMULATING HORMONE (TSH)', 1, NULL, 24, NULL, '0.00', '2019-07-28 00:00:00', NULL, 0, 32, 99);
INSERT INTO `TestMaster` (`ID`, `Name`, `Type`, `PreTestInfo`, `ResultInHours`, `Components`, `Cost`, `CreatedDate`, `UpdatedDate`, `IsDeleted`, `PackageID`, `CompanyID`) VALUES(245, 'VITAMIN D - 25 HYDROXY (D2+D3)', 3, NULL, 24, NULL, '0.00', '2019-07-28 00:00:00', NULL, 0, 32, 99);
INSERT INTO `TestMaster` (`ID`, `Name`, `Type`, `PreTestInfo`, `ResultInHours`, `Components`, `Cost`, `CreatedDate`, `UpdatedDate`, `IsDeleted`, `PackageID`, `CompanyID`) VALUES(247, 'COMPLETE URINE EXAMINATION', 2, NULL, 24, NULL, '0.00', '2019-07-28 00:00:00', NULL, 0, 32, 99);
INSERT INTO `TestMaster` (`ID`, `Name`, `Type`, `PreTestInfo`, `ResultInHours`, `Components`, `Cost`, `CreatedDate`, `UpdatedDate`, `IsDeleted`, `PackageID`, `CompanyID`) VALUES(248, 'COMPLETE BLOOD COUNT (CBC)', 1, NULL, 24, NULL, '0.00', '2019-07-28 00:00:00', NULL, 0, 33, 99);
INSERT INTO `TestMaster` (`ID`, `Name`, `Type`, `PreTestInfo`, `ResultInHours`, `Components`, `Cost`, `CreatedDate`, `UpdatedDate`, `IsDeleted`, `PackageID`, `CompanyID`) VALUES(249, 'COMPLETE URINE EXAMINATION', 1, NULL, 24, NULL, '0.00', '2019-07-28 00:00:00', NULL, 0, 33, 99);
INSERT INTO `TestMaster` (`ID`, `Name`, `Type`, `PreTestInfo`, `ResultInHours`, `Components`, `Cost`, `CreatedDate`, `UpdatedDate`, `IsDeleted`, `PackageID`, `CompanyID`) VALUES(250, 'GLUCOSE	 FASTING', 1, NULL, 24, NULL, '0.00', '2019-07-28 00:00:00', NULL, 0, 33, 99);
INSERT INTO `TestMaster` (`ID`, `Name`, `Type`, `PreTestInfo`, `ResultInHours`, `Components`, `Cost`, `CreatedDate`, `UpdatedDate`, `IsDeleted`, `PackageID`, `CompanyID`) VALUES(251, 'GLUCOSE	 POST PRANDIAL (PP) 2 HOURS (POST MEAL)', 1, NULL, 24, NULL, '0.00', '2019-07-28 00:00:00', NULL, 0, 33, 99);
INSERT INTO `TestMaster` (`ID`, `Name`, `Type`, `PreTestInfo`, `ResultInHours`, `Components`, `Cost`, `CreatedDate`, `UpdatedDate`, `IsDeleted`, `PackageID`, `CompanyID`) VALUES(252, 'UREA - SERUM', 1, NULL, 24, NULL, '0.00', '2019-07-28 00:00:00', NULL, 0, 33, 99);
INSERT INTO `TestMaster` (`ID`, `Name`, `Type`, `PreTestInfo`, `ResultInHours`, `Components`, `Cost`, `CreatedDate`, `UpdatedDate`, `IsDeleted`, `PackageID`, `CompanyID`) VALUES(253, 'LIPID PROFILE', 1, NULL, 24, NULL, '0.00', '2019-07-28 00:00:00', NULL, 0, 33, 99);
INSERT INTO `TestMaster` (`ID`, `Name`, `Type`, `PreTestInfo`, `ResultInHours`, `Components`, `Cost`, `CreatedDate`, `UpdatedDate`, `IsDeleted`, `PackageID`, `CompanyID`) VALUES(254, 'LIVER FUNCTION TEST (LFT) WITH GGT', 1, NULL, 24, NULL, '0.00', '2019-07-28 00:00:00', NULL, 0, 33, 99);
INSERT INTO `TestMaster` (`ID`, `Name`, `Type`, `PreTestInfo`, `ResultInHours`, `Components`, `Cost`, `CreatedDate`, `UpdatedDate`, `IsDeleted`, `PackageID`, `CompanyID`) VALUES(255, 'HBS AG SCREENING(RAPID)', 1, NULL, 24, NULL, '0.00', '2019-07-28 00:00:00', NULL, 0, 33, 99);
INSERT INTO `TestMaster` (`ID`, `Name`, `Type`, `PreTestInfo`, `ResultInHours`, `Components`, `Cost`, `CreatedDate`, `UpdatedDate`, `IsDeleted`, `PackageID`, `CompanyID`) VALUES(256, 'URIC ACID - SERUM', 1, NULL, 24, NULL, '0.00', '2019-07-28 00:00:00', NULL, 0, 33, 99);
INSERT INTO `TestMaster` (`ID`, `Name`, `Type`, `PreTestInfo`, `ResultInHours`, `Components`, `Cost`, `CreatedDate`, `UpdatedDate`, `IsDeleted`, `PackageID`, `CompanyID`) VALUES(257, 'CREATININE SERUM', 1, NULL, 24, NULL, '0.00', '2019-07-28 00:00:00', NULL, 0, 33, 99);
INSERT INTO `TestMaster` (`ID`, `Name`, `Type`, `PreTestInfo`, `ResultInHours`, `Components`, `Cost`, `CreatedDate`, `UpdatedDate`, `IsDeleted`, `PackageID`, `CompanyID`) VALUES(258, 'COMPLETE BLOOD COUNT (CBC)', 1, NULL, 24, NULL, '0.00', '2019-07-28 00:00:00', NULL, 0, 34, 99);
INSERT INTO `TestMaster` (`ID`, `Name`, `Type`, `PreTestInfo`, `ResultInHours`, `Components`, `Cost`, `CreatedDate`, `UpdatedDate`, `IsDeleted`, `PackageID`, `CompanyID`) VALUES(259, 'GLUCOSE	 FASTING', 1, NULL, 24, NULL, '0.00', '2019-07-28 00:00:00', NULL, 0, 34, 99);
INSERT INTO `TestMaster` (`ID`, `Name`, `Type`, `PreTestInfo`, `ResultInHours`, `Components`, `Cost`, `CreatedDate`, `UpdatedDate`, `IsDeleted`, `PackageID`, `CompanyID`) VALUES(260, 'GLUCOSE	 POST PRANDIAL (PP) 2 HOURS (POST MEAL)', 1, NULL, 24, NULL, '0.00', '2019-07-28 00:00:00', NULL, 0, 34, 99);
INSERT INTO `TestMaster` (`ID`, `Name`, `Type`, `PreTestInfo`, `ResultInHours`, `Components`, `Cost`, `CreatedDate`, `UpdatedDate`, `IsDeleted`, `PackageID`, `CompanyID`) VALUES(261, 'LIPID PROFILE', 1, NULL, 24, NULL, '0.00', '2019-07-28 00:00:00', NULL, 0, 34, 99);
INSERT INTO `TestMaster` (`ID`, `Name`, `Type`, `PreTestInfo`, `ResultInHours`, `Components`, `Cost`, `CreatedDate`, `UpdatedDate`, `IsDeleted`, `PackageID`, `CompanyID`) VALUES(262, 'UREA - SERUM', 1, NULL, 24, NULL, '0.00', '2019-07-28 00:00:00', NULL, 0, 34, 99);
INSERT INTO `TestMaster` (`ID`, `Name`, `Type`, `PreTestInfo`, `ResultInHours`, `Components`, `Cost`, `CreatedDate`, `UpdatedDate`, `IsDeleted`, `PackageID`, `CompanyID`) VALUES(263, 'CREATININE SERUM', 1, NULL, 24, NULL, '0.00', '2019-07-28 00:00:00', NULL, 0, 34, 99);
INSERT INTO `TestMaster` (`ID`, `Name`, `Type`, `PreTestInfo`, `ResultInHours`, `Components`, `Cost`, `CreatedDate`, `UpdatedDate`, `IsDeleted`, `PackageID`, `CompanyID`) VALUES(264, 'BLOOD GROUP ABO AND RH FACTOR', 1, NULL, 24, NULL, '0.00', '2019-07-28 00:00:00', NULL, 0, 34, 99);
INSERT INTO `TestMaster` (`ID`, `Name`, `Type`, `PreTestInfo`, `ResultInHours`, `Components`, `Cost`, `CreatedDate`, `UpdatedDate`, `IsDeleted`, `PackageID`, `CompanyID`) VALUES(265, 'HBA1C', 1, NULL, 24, NULL, '0.00', '2019-07-28 00:00:00', NULL, 0, 34, 99);
INSERT INTO `TestMaster` (`ID`, `Name`, `Type`, `PreTestInfo`, `ResultInHours`, `Components`, `Cost`, `CreatedDate`, `UpdatedDate`, `IsDeleted`, `PackageID`, `CompanyID`) VALUES(266, 'GLYCATED HEMOGLOBIN', 1, NULL, 24, NULL, '0.00', '2019-07-28 00:00:00', NULL, 0, 34, 99);
INSERT INTO `TestMaster` (`ID`, `Name`, `Type`, `PreTestInfo`, `ResultInHours`, `Components`, `Cost`, `CreatedDate`, `UpdatedDate`, `IsDeleted`, `PackageID`, `CompanyID`) VALUES(267, 'ELECTROLYTES - SERUM', 1, NULL, 24, NULL, '0.00', '2019-07-28 00:00:00', NULL, 0, 34, 99);
INSERT INTO `TestMaster` (`ID`, `Name`, `Type`, `PreTestInfo`, `ResultInHours`, `Components`, `Cost`, `CreatedDate`, `UpdatedDate`, `IsDeleted`, `PackageID`, `CompanyID`) VALUES(268, 'THYROID PROFILE(T3,T4,TSH)', 1, NULL, 24, NULL, '0.00', '2019-07-28 00:00:00', NULL, 0, 34, 99);
INSERT INTO `TestMaster` (`ID`, `Name`, `Type`, `PreTestInfo`, `ResultInHours`, `Components`, `Cost`, `CreatedDate`, `UpdatedDate`, `IsDeleted`, `PackageID`, `CompanyID`) VALUES(269, 'LIVER FUNCTION TEST (LFT) WITH GGT', 1, NULL, 24, NULL, '0.00', '2019-07-28 00:00:00', NULL, 0, 34, 99);
INSERT INTO `TestMaster` (`ID`, `Name`, `Type`, `PreTestInfo`, `ResultInHours`, `Components`, `Cost`, `CreatedDate`, `UpdatedDate`, `IsDeleted`, `PackageID`, `CompanyID`) VALUES(219220, 'BLOOD GROUP ABO AND RH FACTOR', 1, NULL, 24, NULL, '0.00', '2019-07-28 00:00:00', NULL, 0, 30, 99);
INSERT INTO `TestMaster` (`ID`, `Name`, `Type`, `PreTestInfo`, `ResultInHours`, `Components`, `Cost`, `CreatedDate`, `UpdatedDate`, `IsDeleted`, `PackageID`, `CompanyID`) VALUES(219221, '', 1, NULL, 0, NULL, '0.00', '0000-00-00 00:00:00', NULL, 0, NULL, 99);
INSERT INTO `TestMaster` (`ID`, `Name`, `Type`, `PreTestInfo`, `ResultInHours`, `Components`, `Cost`, `CreatedDate`, `UpdatedDate`, `IsDeleted`, `PackageID`, `CompanyID`) VALUES(219222, '', 1, NULL, 0, NULL, '0.00', '0000-00-00 00:00:00', NULL, 0, NULL, 99);
INSERT INTO `TestMaster` (`ID`, `Name`, `Type`, `PreTestInfo`, `ResultInHours`, `Components`, `Cost`, `CreatedDate`, `UpdatedDate`, `IsDeleted`, `PackageID`, `CompanyID`) VALUES(219223, '', 1, NULL, 0, NULL, '0.00', '0000-00-00 00:00:00', NULL, 0, NULL, 99);
INSERT INTO `TestMaster` (`ID`, `Name`, `Type`, `PreTestInfo`, `ResultInHours`, `Components`, `Cost`, `CreatedDate`, `UpdatedDate`, `IsDeleted`, `PackageID`, `CompanyID`) VALUES(219224, '', 1, NULL, 0, NULL, '0.00', '0000-00-00 00:00:00', NULL, 0, NULL, 99);
INSERT INTO `TestMaster` (`ID`, `Name`, `Type`, `PreTestInfo`, `ResultInHours`, `Components`, `Cost`, `CreatedDate`, `UpdatedDate`, `IsDeleted`, `PackageID`, `CompanyID`) VALUES(219225, '', 1, NULL, 0, NULL, '0.00', '0000-00-00 00:00:00', NULL, 0, NULL, 99);

-- --------------------------------------------------------

--
-- Table structure for table `UploadedReports`
--

CREATE TABLE `UploadedReports` (
  `ID` int(9) NOT NULL,
  `UserID` int(9) NOT NULL COMMENT 'UserId of type customer (type =1)',
  `FileName` varchar(50) NOT NULL,
  `FilePath` varchar(1000) DEFAULT NULL,
  `FileType` int(1) DEFAULT '1' COMMENT '1 Medical Report\\n2 Exam Report\\n3 Course Document\\n4 Invoice',
  `UploadedDate` datetime NOT NULL,
  `UploadedBy` int(9) NOT NULL DEFAULT '1' COMMENT 'Employee who uploaded - USERID of type = 3 (employee)',
  `IsDeleted` int(1) NOT NULL DEFAULT '0',
  `CompanyID` int(2) NOT NULL DEFAULT '99'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `UploadedReports`
--

INSERT INTO `UploadedReports` (`ID`, `UserID`, `FileName`, `FilePath`, `FileType`, `UploadedDate`, `UploadedBy`, `IsDeleted`, `CompanyID`) VALUES(1, 2, 'adharx.pdf', 'C:\\PROJECTS\\IQHealth\\IqHealth\\IqHealth.WebApi\\Content\\DiagnosticReports\\2/adharx.pdf', 1, '2020-02-27 21:54:55', 1, 0, 2);
INSERT INTO `UploadedReports` (`ID`, `UserID`, `FileName`, `FilePath`, `FileType`, `UploadedDate`, `UploadedBy`, `IsDeleted`, `CompanyID`) VALUES(2, 2, 'Appoitent.pdf', 'C:\\PROJECTS\\IQHealth\\IqHealth\\IqHealth.WebApi\\Content\\DiagnosticReports\\2/Appoitent.pdf', 1, '2020-02-27 21:57:21', 1, 0, 2);
INSERT INTO `UploadedReports` (`ID`, `UserID`, `FileName`, `FilePath`, `FileType`, `UploadedDate`, `UploadedBy`, `IsDeleted`, `CompanyID`) VALUES(3, 2, 'getPolicyCopB.pdf', 'getPolicyCopB.pdf', 1, '2020-02-27 10:42:02', 1, 0, 2);
INSERT INTO `UploadedReports` (`ID`, `UserID`, `FileName`, `FilePath`, `FileType`, `UploadedDate`, `UploadedBy`, `IsDeleted`, `CompanyID`) VALUES(4, 2, 'adharx (1).pdf', 'adharx (1).pdf', 1, '2020-02-27 10:42:44', 1, 0, 2);
INSERT INTO `UploadedReports` (`ID`, `UserID`, `FileName`, `FilePath`, `FileType`, `UploadedDate`, `UploadedBy`, `IsDeleted`, `CompanyID`) VALUES(5, 2, '0_01042008-AnnexureI.pdf', '0_01042008-AnnexureI.pdf', 1, '2020-04-09 23:43:41', 1, 0, 2);
INSERT INTO `UploadedReports` (`ID`, `UserID`, `FileName`, `FilePath`, `FileType`, `UploadedDate`, `UploadedBy`, `IsDeleted`, `CompanyID`) VALUES(6, 2, '1042008-AnnexureI.pdf', '1042008-AnnexureI.pdf', 1, '2020-04-09 23:51:15', 1, 0, 2);

-- --------------------------------------------------------

--
-- Table structure for table `UserMaster`
--

CREATE TABLE `UserMaster` (
  `ID` int(9) NOT NULL,
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
  `CompanyID` int(2) NOT NULL DEFAULT '99'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `UserMaster`
--

INSERT INTO `UserMaster` (`ID`, `FirstName`, `LastName`, `UserName`, `Email`, `DateOfBirth`, `BloodGroup`, `Address`, `City`, `State`, `UserStatus`, `CreatedDate`, `UpdatedDate`, `IsDeleted`, `Password`, `Mobile`, `UserType`, `CompanyID`) VALUES(1, 'Neeraj', 'Singh', NULL, 'employee@gmail.com', NULL, NULL, 'K-93, 2nd Floor, y fyu gjgg j', 'New Delhi', 20, 0, '2020-02-28 01:52:13', NULL, 0, 'Krishna_2012', '54354254545354', 3, 2);
INSERT INTO `UserMaster` (`ID`, `FirstName`, `LastName`, `UserName`, `Email`, `DateOfBirth`, `BloodGroup`, `Address`, `City`, `State`, `UserStatus`, `CreatedDate`, `UpdatedDate`, `IsDeleted`, `Password`, `Mobile`, `UserType`, `CompanyID`) VALUES(2, 'Customer', 'Singh', NULL, 'customer@gmail.com', NULL, NULL, 'K-93, 2nd Floor,', 'New Delhi', 29, 0, '2020-02-28 01:54:40', NULL, 0, '123456', '9898987675', 1, 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `BookingMaster`
--
ALTER TABLE `BookingMaster`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_Booking_Package_ID_idx` (`PackageID`),
  ADD KEY `FK_Booking_Test_ID_idx` (`TestID`),
  ADD KEY `FK_Booking_Company_idx` (`CompanyID`);

--
-- Indexes for table `CommonSetup`
--
ALTER TABLE `CommonSetup`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `CompanyMaster`
--
ALTER TABLE `CompanyMaster`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `ContactUsEnquiry`
--
ALTER TABLE `ContactUsEnquiry`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `CorporateTieUpEnquiry`
--
ALTER TABLE `CorporateTieUpEnquiry`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `CourseCurriculum`
--
ALTER TABLE `CourseCurriculum`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_Curriculam_CourseMaster_ID_idx` (`CourseMasterID`);

--
-- Indexes for table `CourseEligibility`
--
ALTER TABLE `CourseEligibility`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_Eligibility_Course_ID_idx` (`CourseMasterID`);

--
-- Indexes for table `CourseMaster`
--
ALTER TABLE `CourseMaster`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_Course_Company_ID_idx` (`CompanyID`);

--
-- Indexes for table `DoctorAppointment`
--
ALTER TABLE `DoctorAppointment`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_Appointment_Doctor` (`DoctorID`),
  ADD KEY `FK_Appointment_Hospital_idx` (`HospitalID`),
  ADD KEY `FK_DoctorAppointment_Company_idx` (`CompanyID`);

--
-- Indexes for table `DoctorMaster`
--
ALTER TABLE `DoctorMaster`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_Doctor_Speciality_ID_idx` (`SpecialityID`),
  ADD KEY `FK_HealthServiceMaster_Company_ID_idx` (`CompanyID`),
  ADD KEY `FK_PackageCategory_Company_ID_idx` (`CompanyID`),
  ADD KEY `FK_PackageMaster_Company_ID_idx` (`CompanyID`);

--
-- Indexes for table `DoctorSpecialities`
--
ALTER TABLE `DoctorSpecialities`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_Docotr_Specialities_ID_idx` (`DoctorID`),
  ADD KEY `FK_Specialites+Doctor_ID_idx` (`SpecialityID`);

--
-- Indexes for table `HealthServiceMaster`
--
ALTER TABLE `HealthServiceMaster`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `HospitalMaster`
--
ALTER TABLE `HospitalMaster`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `JobApplication`
--
ALTER TABLE `JobApplication`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `Email_UNIQUE` (`Email`);

--
-- Indexes for table `Login`
--
ALTER TABLE `Login`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `FK_ID_Login_User` (`UserID`);

--
-- Indexes for table `OnlineEnquiry`
--
ALTER TABLE `OnlineEnquiry`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `OrganizeCampEnquiry`
--
ALTER TABLE `OrganizeCampEnquiry`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `PackageCategory`
--
ALTER TABLE `PackageCategory`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `Catg_Name_UNIQUE` (`Name`);

--
-- Indexes for table `PackageMaster`
--
ALTER TABLE `PackageMaster`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `Name_UNIQUE` (`Name`),
  ADD KEY `fk_package_catg_ID_idx` (`CatgID`),
  ADD KEY `FK_Package_Comapny_ID_idx` (`CompanyID`);

--
-- Indexes for table `PartnerEnquiry`
--
ALTER TABLE `PartnerEnquiry`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `SpecialityMaster`
--
ALTER TABLE `SpecialityMaster`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_Speciality_Company_ID_idx` (`CompanyID`);

--
-- Indexes for table `SubCourses`
--
ALTER TABLE `SubCourses`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_SubCourses_Course_ID_idx` (`CourseMasterID`),
  ADD KEY `FK_SubCources_Company_ID_idx` (`CompanyID`);

--
-- Indexes for table `TestMaster`
--
ALTER TABLE `TestMaster`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `fk_tests_packages_ID_idx` (`PackageID`),
  ADD KEY `FK_TestMaster_Company_ID_idx` (`CompanyID`);

--
-- Indexes for table `UploadedReports`
--
ALTER TABLE `UploadedReports`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `FileName_UNIQUE` (`FileName`);

--
-- Indexes for table `UserMaster`
--
ALTER TABLE `UserMaster`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_User_Company_ID_idx` (`CompanyID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `BookingMaster`
--
ALTER TABLE `BookingMaster`
  MODIFY `ID` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `CommonSetup`
--
ALTER TABLE `CommonSetup`
  MODIFY `ID` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `CompanyMaster`
--
ALTER TABLE `CompanyMaster`
  MODIFY `ID` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=100;

--
-- AUTO_INCREMENT for table `ContactUsEnquiry`
--
ALTER TABLE `ContactUsEnquiry`
  MODIFY `ID` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;

--
-- AUTO_INCREMENT for table `CorporateTieUpEnquiry`
--
ALTER TABLE `CorporateTieUpEnquiry`
  MODIFY `ID` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=74;

--
-- AUTO_INCREMENT for table `CourseCurriculum`
--
ALTER TABLE `CourseCurriculum`
  MODIFY `ID` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `CourseEligibility`
--
ALTER TABLE `CourseEligibility`
  MODIFY `ID` int(9) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `CourseMaster`
--
ALTER TABLE `CourseMaster`
  MODIFY `ID` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `DoctorAppointment`
--
ALTER TABLE `DoctorAppointment`
  MODIFY `ID` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=80;

--
-- AUTO_INCREMENT for table `DoctorMaster`
--
ALTER TABLE `DoctorMaster`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `DoctorSpecialities`
--
ALTER TABLE `DoctorSpecialities`
  MODIFY `ID` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `HealthServiceMaster`
--
ALTER TABLE `HealthServiceMaster`
  MODIFY `ID` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `HospitalMaster`
--
ALTER TABLE `HospitalMaster`
  MODIFY `ID` int(9) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `JobApplication`
--
ALTER TABLE `JobApplication`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `Login`
--
ALTER TABLE `Login`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `OnlineEnquiry`
--
ALTER TABLE `OnlineEnquiry`
  MODIFY `ID` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `OrganizeCampEnquiry`
--
ALTER TABLE `OrganizeCampEnquiry`
  MODIFY `ID` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=70;

--
-- AUTO_INCREMENT for table `PackageCategory`
--
ALTER TABLE `PackageCategory`
  MODIFY `ID` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `PackageMaster`
--
ALTER TABLE `PackageMaster`
  MODIFY `ID` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `PartnerEnquiry`
--
ALTER TABLE `PartnerEnquiry`
  MODIFY `ID` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=72;

--
-- AUTO_INCREMENT for table `SpecialityMaster`
--
ALTER TABLE `SpecialityMaster`
  MODIFY `ID` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `SubCourses`
--
ALTER TABLE `SubCourses`
  MODIFY `ID` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `TestMaster`
--
ALTER TABLE `TestMaster`
  MODIFY `ID` int(7) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=219226;

--
-- AUTO_INCREMENT for table `UploadedReports`
--
ALTER TABLE `UploadedReports`
  MODIFY `ID` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `UserMaster`
--
ALTER TABLE `UserMaster`
  MODIFY `ID` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `BookingMaster`
--
ALTER TABLE `BookingMaster`
  ADD CONSTRAINT `FK_Booking_Company` FOREIGN KEY (`CompanyID`) REFERENCES `CompanyMaster` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_Booking_Package_ID` FOREIGN KEY (`PackageID`) REFERENCES `PackageMaster` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_Booking_Test_ID` FOREIGN KEY (`TestID`) REFERENCES `TestMaster` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `CourseCurriculum`
--
ALTER TABLE `CourseCurriculum`
  ADD CONSTRAINT `FK_Curriculam_CourseMaster_ID` FOREIGN KEY (`CourseMasterID`) REFERENCES `CourseMaster` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `CourseEligibility`
--
ALTER TABLE `CourseEligibility`
  ADD CONSTRAINT `FK_Eligibility_Course_ID` FOREIGN KEY (`CourseMasterID`) REFERENCES `CourseMaster` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `CourseMaster`
--
ALTER TABLE `CourseMaster`
  ADD CONSTRAINT `FK_Course_Company_ID` FOREIGN KEY (`CompanyID`) REFERENCES `CompanyMaster` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `DoctorAppointment`
--
ALTER TABLE `DoctorAppointment`
  ADD CONSTRAINT `FK_Appointment_Doctor` FOREIGN KEY (`DoctorID`) REFERENCES `DoctorMaster` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_DoctorAppointment_Company_ID` FOREIGN KEY (`CompanyID`) REFERENCES `CompanyMaster` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `DoctorMaster`
--
ALTER TABLE `DoctorMaster`
  ADD CONSTRAINT `FK_DoctorMaster_Company_ID` FOREIGN KEY (`CompanyID`) REFERENCES `CompanyMaster` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_Speciality_Doctor_ID` FOREIGN KEY (`SpecialityID`) REFERENCES `SpecialityMaster` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `DoctorSpecialities`
--
ALTER TABLE `DoctorSpecialities`
  ADD CONSTRAINT `FK_Docotr_Specialities_ID` FOREIGN KEY (`DoctorID`) REFERENCES `DoctorMaster` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_Specialites+Doctor_ID` FOREIGN KEY (`SpecialityID`) REFERENCES `SpecialityMaster` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `PackageMaster`
--
ALTER TABLE `PackageMaster`
  ADD CONSTRAINT `fk_package_catg_ID` FOREIGN KEY (`CatgID`) REFERENCES `PackageCategory` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_Package_Comapny_ID` FOREIGN KEY (`CompanyID`) REFERENCES `CompanyMaster` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `SpecialityMaster`
--
ALTER TABLE `SpecialityMaster`
  ADD CONSTRAINT `FK_Speciality_Company_ID` FOREIGN KEY (`CompanyID`) REFERENCES `CompanyMaster` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `SubCourses`
--
ALTER TABLE `SubCourses`
  ADD CONSTRAINT `FK_SubCources_Company_ID` FOREIGN KEY (`CompanyID`) REFERENCES `CompanyMaster` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_SubCourses_Course_ID` FOREIGN KEY (`CourseMasterID`) REFERENCES `CourseMaster` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `TestMaster`
--
ALTER TABLE `TestMaster`
  ADD CONSTRAINT `FK_Test_Company_ID` FOREIGN KEY (`CompanyID`) REFERENCES `CompanyMaster` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_Test_Package_ID` FOREIGN KEY (`PackageID`) REFERENCES `PackageMaster` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `UserMaster`
--
ALTER TABLE `UserMaster`
  ADD CONSTRAINT `FK_User_Company_ID` FOREIGN KEY (`CompanyID`) REFERENCES `CompanyMaster` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
