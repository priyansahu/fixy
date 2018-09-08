-- MySQL dump 10.13  Distrib 8.0.12, for Win64 (x86_64)
--
-- Host: localhost    Database: fixy
-- ------------------------------------------------------
-- Server version	8.0.12

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

CREATE SCHEMA 'fixy';

--
-- Table structure for table `address`
--
 

DROP TABLE IF EXISTS `address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `address` (
  `address_no` int(11) NOT NULL AUTO_INCREMENT,
  `address_line1` varchar(20) NOT NULL,
  `address_line2` varchar(20) DEFAULT NULL,
  `city_no` int(11) NOT NULL,
  `state_no` int(11) NOT NULL,
  `zip` int(11) NOT NULL,
  `country` varchar(20) NOT NULL,
  `created_by` varchar(20) NOT NULL,
  `created_dt` timestamp NOT NULL,
  `last_modified_by` varchar(20) NOT NULL,
  `last_modified_dt` timestamp NOT NULL,
  PRIMARY KEY (`address_no`),
  KEY `fk_city_no_idx` (`city_no`),
  KEY `fk_state_no_idx` (`state_no`),
  CONSTRAINT `fk_city_no` FOREIGN KEY (`city_no`) REFERENCES `cities` (`city_no`),
  CONSTRAINT `fk_state_no` FOREIGN KEY (`state_no`) REFERENCES `states` (`state_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cities`
--

DROP TABLE IF EXISTS `cities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `cities` (
  `city_no` int(11) NOT NULL AUTO_INCREMENT,
  `city_nm` varchar(20) NOT NULL,
  `status` bit(1) NOT NULL,
  `created_by` varchar(20) NOT NULL,
  `created_dt` timestamp NOT NULL,
  `last_modified_by` varchar(20) NOT NULL,
  `last_modified_dt` timestamp NOT NULL,
  PRIMARY KEY (`city_no`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `csr_and_technician_details`
--

DROP TABLE IF EXISTS `csr_and_technician_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `csr_and_technician_details` (
  `user_account_no` int(11) NOT NULL AUTO_INCREMENT,
  `alt_mobile_no` varchar(20) DEFAULT NULL,
  `alt_emaill_address` varchar(20) DEFAULT NULL,
  `alt_contact_address_no` int(11) DEFAULT NULL,
  `experience` int(11) NOT NULL,
  `designation_no` int(11) NOT NULL,
  `unique_identification_type` varchar(20) NOT NULL,
  `unique_identification_data` varchar(20) NOT NULL,
  `gender` varchar(6) NOT NULL,
  `date_of_birth` date NOT NULL,
  `created_by` varchar(20) NOT NULL,
  `created_dt` timestamp NOT NULL,
  `last_modified_by` varchar(20) NOT NULL,
  `last_modified_dt` timestamp NOT NULL,
  PRIMARY KEY (`user_account_no`),
  KEY `fk_designation_no_idx` (`designation_no`),
  KEY `fk_contact_address_no_idx` (`alt_contact_address_no`),
  CONSTRAINT `fk_contact_address_no` FOREIGN KEY (`alt_contact_address_no`) REFERENCES `address` (`address_no`),
  CONSTRAINT `fk_designation_no` FOREIGN KEY (`designation_no`) REFERENCES `designation` (`designation_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `designation`
--

DROP TABLE IF EXISTS `designation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `designation` (
  `designation_no` int(11) NOT NULL AUTO_INCREMENT,
  `designation_nm` varchar(25) NOT NULL,
  `role_no` int(11) NOT NULL,
  `description` varchar(500) DEFAULT NULL,
  `created_by` varchar(20) NOT NULL,
  `created_dt` timestamp NOT NULL,
  `last_modified_by` varchar(20) NOT NULL,
  `last_modified_dt` timestamp NOT NULL,
  PRIMARY KEY (`designation_no`),
  KEY `fk_role_no_idx` (`role_no`),
  CONSTRAINT `fk_role_no` FOREIGN KEY (`role_no`) REFERENCES `role` (`role_no`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `role` (
  `role_no` int(11) NOT NULL AUTO_INCREMENT,
  `role_nm` varchar(20) NOT NULL,
  `created_by` varchar(20) NOT NULL,
  `created_dt` timestamp NOT NULL,
  `last_modified_by` varchar(20) NOT NULL,
  `last_modified_dt` timestamp NOT NULL,
  PRIMARY KEY (`role_no`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `servcice_category_fields`
--

DROP TABLE IF EXISTS `servcice_category_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `servcice_category_fields` (
  `field_no` int(11) NOT NULL AUTO_INCREMENT,
  `service_category_no` int(11) NOT NULL,
  `sequence_no` int(11) NOT NULL,
  `field_nm` varchar(25) NOT NULL,
  `field_type` varchar(20) NOT NULL,
  `data_type` varchar(20) NOT NULL,
  `required` bit(1) NOT NULL,
  `status` bit(1) NOT NULL,
  `created_by` varchar(20) NOT NULL,
  `created_dt` timestamp NOT NULL,
  `last_modified_by` varchar(20) NOT NULL,
  `last_modified_dt` timestamp NOT NULL,
  PRIMARY KEY (`field_no`),
  UNIQUE KEY `service_category_no_UNIQUE` (`service_category_no`),
  UNIQUE KEY `field_nm_UNIQUE` (`field_nm`),
  CONSTRAINT `fk_service_category_no` FOREIGN KEY (`service_category_no`) REFERENCES `service_categories` (`category_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `servcice_request_fields_data`
--

DROP TABLE IF EXISTS `servcice_request_fields_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `servcice_request_fields_data` (
  `service_request_no` int(11) NOT NULL,
  `field_no` int(11) NOT NULL,
  `field_value` varchar(10) NOT NULL,
  `created_by` varchar(20) NOT NULL,
  `created_dt` timestamp NOT NULL,
  `last_modified_by` varchar(20) NOT NULL,
  `last_modified_dt` timestamp NOT NULL,
  PRIMARY KEY (`service_request_no`,`field_no`),
  KEY `fk_field_no_idx` (`field_no`),
  CONSTRAINT `fk_field_no` FOREIGN KEY (`field_no`) REFERENCES `servcice_category_fields` (`field_no`),
  CONSTRAINT `fk_service_request_no` FOREIGN KEY (`service_request_no`) REFERENCES `service_request` (`service_request_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `service`
--

DROP TABLE IF EXISTS `service`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `service` (
  `service_no` int(11) NOT NULL AUTO_INCREMENT,
  `service_nm` varchar(20) NOT NULL,
  `description` varchar(500) DEFAULT NULL,
  `service_logo_bytes` blob,
  `service_logo_type` varchar(20) DEFAULT NULL,
  `status` bit(1) NOT NULL,
  `created_by` varchar(20) NOT NULL,
  `created_dt` timestamp NOT NULL,
  `last_modified_by` varchar(20) NOT NULL,
  `last_modified_dt` timestamp NOT NULL,
  PRIMARY KEY (`service_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `service_categories`
--

DROP TABLE IF EXISTS `service_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `service_categories` (
  `category_no` int(11) NOT NULL AUTO_INCREMENT,
  `service_no` int(11) NOT NULL,
  `category_nm` varchar(20) NOT NULL,
  `description` varchar(500) DEFAULT NULL,
  `category_logo_bytes` blob NOT NULL,
  `category_logo_type` varchar(20) NOT NULL,
  `fixed_charges` float NOT NULL,
  `required_inspection` bit(1) NOT NULL,
  `is_emergency_service` bit(1) NOT NULL,
  `average_resolution_time` time NOT NULL,
  `warranty_in_days` int(11) NOT NULL,
  `created_by` varchar(20) NOT NULL,
  `created_dt` timestamp NOT NULL,
  `last_modified_by` varchar(20) NOT NULL,
  `last_modified_dt` timestamp NOT NULL,
  PRIMARY KEY (`category_no`),
  KEY `fk_service_no_idx` (`service_no`),
  CONSTRAINT `fk_service_no` FOREIGN KEY (`service_no`) REFERENCES `service` (`service_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `service_category_fields_lov`
--

DROP TABLE IF EXISTS `service_category_fields_lov`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `service_category_fields_lov` (
  `field_no` int(11) NOT NULL AUTO_INCREMENT,
  `field_label` varchar(20) NOT NULL,
  `field_value` varchar(20) NOT NULL,
  PRIMARY KEY (`field_no`),
  CONSTRAINT `fk_field_no_2` FOREIGN KEY (`field_no`) REFERENCES `servcice_category_fields` (`field_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `service_location`
--

DROP TABLE IF EXISTS `service_location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `service_location` (
  `service_no` int(11) NOT NULL,
  `city_no` int(10) NOT NULL,
  `status` bit(1) NOT NULL,
  `created_by` varchar(20) NOT NULL,
  `created_dt` timestamp NOT NULL,
  `last_modified_by` varchar(20) NOT NULL,
  `last_modified_dt` timestamp NOT NULL,
  PRIMARY KEY (`service_no`),
  KEY `fk_city_no_idx1` (`city_no`),
  CONSTRAINT `fk_city_no1` FOREIGN KEY (`city_no`) REFERENCES `cities` (`city_no`),
  CONSTRAINT `fk_service_no1` FOREIGN KEY (`service_no`) REFERENCES `service` (`service_no`)
) ENGINE=InnoDB  ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `service_request`
--

DROP TABLE IF EXISTS `service_request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `service_request` (
  `service_request_no` int(11) NOT NULL AUTO_INCREMENT,
  `service_request_dt` date NOT NULL,
  `category_no` int(11) NOT NULL,
  `service_request_address_no` int(11) NOT NULL,
  `available_start_hour` time NOT NULL,
  `available_end_hour` time NOT NULL,
  `is_emergency_request` bit(1) NOT NULL,
  `estimated_hours_completion` time NOT NULL,
  `estimated_amount` float NOT NULL,
  `technician_no` int(11) NOT NULL,
  `description` varchar(500) NOT NULL,
  `service_request_completed_dt` date NOT NULL,
  `status` varchar(10) NOT NULL,
  `comments` varchar(300) NOT NULL,
  `contact_no` varchar(13) NOT NULL,
  `user_account_no` int(11) NOT NULL,
  `created_by` varchar(20) NOT NULL,
  `created_dt` timestamp NOT NULL,
  `last_modified_by` varchar(20) NOT NULL,
  `last_modified_dt` timestamp NOT NULL,
  PRIMARY KEY (`service_request_no`),
  KEY `fk_category_no_idx` (`category_no`),
  KEY `fk_user_account_idx` (`user_account_no`),
  KEY `fk_addres_no_idx` (`service_request_address_no`),
  KEY `fk_technician_no_idx` (`technician_no`),
  CONSTRAINT `fk_addres_no` FOREIGN KEY (`service_request_address_no`) REFERENCES `address` (`address_no`),
  CONSTRAINT `fk_category_no` FOREIGN KEY (`category_no`) REFERENCES `service_categories` (`category_no`),
  CONSTRAINT `fk_technician_no` FOREIGN KEY (`technician_no`) REFERENCES `csr_and_technician_details` (`user_account_no`),
  CONSTRAINT `fk_user_account` FOREIGN KEY (`user_account_no`) REFERENCES `user_account` (`user_account_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `service_request_attachment`
--

DROP TABLE IF EXISTS `service_request_attachment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `service_request_attachment` (
  `attachment_no` int(11) NOT NULL AUTO_INCREMENT,
  `service_request_no` int(11) NOT NULL,
  `attachment_bytes` blob NOT NULL,
  `attachment_type` varchar(10) NOT NULL,
  `created_by` varchar(20) NOT NULL,
  `created_dt` timestamp NOT NULL,
  `last_modified_by` varchar(45) NOT NULL,
  `last_modified_dt` timestamp NOT NULL,
  PRIMARY KEY (`attachment_no`),
  KEY `fk_service_request_no_idx` (`service_request_no`),
  KEY `fk_service_request_no_idx1` (`service_request_no`) /*!80000 INVISIBLE */,
  CONSTRAINT `fk_service_request_no1` FOREIGN KEY (`service_request_no`) REFERENCES `service` (`service_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `service_request_feedback`
--

DROP TABLE IF EXISTS `service_request_feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `service_request_feedback` (
  `service_request_no` int(11) NOT NULL AUTO_INCREMENT,
  `rating` varchar(10) DEFAULT NULL,
  `comments` varchar(200) DEFAULT NULL,
  `created_by` varchar(20) NOT NULL,
  `created_dt` timestamp NOT NULL,
  `last_modified_by` varchar(20) NOT NULL,
  `last_modified_dt` timestamp NOT NULL,
  PRIMARY KEY (`service_request_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `service_request_inspection`
--

DROP TABLE IF EXISTS `service_request_inspection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `service_request_inspection` (
  `service_request_no` int(11) NOT NULL AUTO_INCREMENT,
  `inspection_technician_no` int(11) NOT NULL,
  `inspection_dt` date NOT NULL,
  `customer_nm` varchar(20) NOT NULL,
  `customer_contact_no` varchar(13) NOT NULL,
  `description` varchar(200) DEFAULT NULL,
  `standing_instruction` varchar(200) NOT NULL,
  `status` bit(1) NOT NULL,
  `inspection_charge` float NOT NULL,
  `created_by` varchar(20) NOT NULL,
  `created_dt` timestamp NOT NULL,
  `last_modified_by` varchar(20) NOT NULL,
  `last_modified_dt` timestamp NOT NULL,
  PRIMARY KEY (`service_request_no`),
  KEY `fk_inspection_technician_no_idx` (`inspection_technician_no`),
  CONSTRAINT `fk_inspection_technician_no` FOREIGN KEY (`inspection_technician_no`) REFERENCES `csr_and_technician_details` (`user_account_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `service_request_refund`
--

DROP TABLE IF EXISTS `service_request_refund`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `service_request_refund` (
  `service_request_refund_no` int(11) NOT NULL AUTO_INCREMENT,
  `service_request_no` int(11) NOT NULL,
  `complaint_no` int(11) NOT NULL,
  `description` varchar(200) DEFAULT NULL,
  `refund_amount` float DEFAULT NULL,
  `authorized_by` varchar(20) NOT NULL,
  `created_by` varchar(20) NOT NULL,
  `created_dt` timestamp NOT NULL,
  `last_modified_by` varchar(20) NOT NULL,
  `last_modified_dt` timestamp NOT NULL,
  PRIMARY KEY (`service_request_refund_no`),
  KEY `fk_service_request_no_1` (`service_request_no`) ,
  KEY `fk_complaint_no_1` (`complaint_no`) ,
  CONSTRAINT `fk_compalint_no` FOREIGN KEY (`complaint_no`) REFERENCES `work_order_complaint` (`complaint_no`),
  CONSTRAINT `fk_service_request_no5` FOREIGN KEY (`service_request_no`) REFERENCES `service_request` (`service_request_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `states`
--

DROP TABLE IF EXISTS `states`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `states` (
  `state_no` int(11) NOT NULL AUTO_INCREMENT,
  `state_nm` varchar(20) NOT NULL,
  `status` bit(1) NOT NULL,
  `created_by` varchar(20) NOT NULL,
  `created_dt` timestamp NOT NULL,
  `last_modified_by` varchar(20) NOT NULL,
  `last_modified_dt` timestamp NOT NULL,
  PRIMARY KEY (`state_no`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `technician_service_categories`
--

DROP TABLE IF EXISTS `technician_service_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `technician_service_categories` (
  `technician_account_no` int(11) NOT NULL AUTO_INCREMENT,
  `category_no` int(11) NOT NULL,
  PRIMARY KEY (`technician_account_no`),
  KEY `fk_category_no_idx` (`category_no`),
  CONSTRAINT `fk_category_no3` FOREIGN KEY (`category_no`) REFERENCES `service_categories` (`category_no`),
  CONSTRAINT `fk_technician_account_no` FOREIGN KEY (`technician_account_no`) REFERENCES `csr_and_technician_details` (`user_account_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_account`
--

DROP TABLE IF EXISTS `user_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `user_account` (
  `user_account_no` int(11) NOT NULL AUTO_INCREMENT,
  `primary_email_address` varchar(25) NOT NULL,
  `password` varchar(25) NOT NULL,
  `primary_mobile_nbr` varchar(13) NOT NULL,
  `first_nm` varchar(25) NOT NULL,
  `last_nm` varchar(20) NOT NULL,
  `contact_address_no` int(11) NOT NULL,
  `role_no` int(11) NOT NULL,
  `registered_dt` date NOT NULL,
  `activation_dt` date NOT NULL,
  `activation_code` int(11) NOT NULL,
  `status` bit(1) NOT NULL,
  `created_by` varchar(20) NOT NULL,
  `created_dt` timestamp NOT NULL,
  `last_modified_by` varchar(25) NOT NULL,
  `last_modified_dt` timestamp NOT NULL,
  PRIMARY KEY (`user_account_no`),
  UNIQUE KEY `primary_email_address_UNIQUE` (`primary_email_address`),
  UNIQUE KEY `primary_mobile_nbr_UNIQUE` (`primary_mobile_nbr`),
  UNIQUE KEY `contact_address_no_UNIQUE` (`contact_address_no`),
  UNIQUE KEY `first_nm_UNIQUE` (`first_nm`),
  KEY `fk_role_no_idx` (`role_no`),
  KEY `fk_role_no_6` (`role_no`),
  CONSTRAINT `fk_role_no_6` FOREIGN KEY (`role_no`) REFERENCES `role` (`role_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `work _order_spares`
--

DROP TABLE IF EXISTS `work _order_spares`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `work _order_spares` (
  `work _order_spares_no` int(11) NOT NULL AUTO_INCREMENT,
  `work _order_no` int(11) NOT NULL,
  `spare_part_nm` varchar(100) NOT NULL,
  `description` varchar(300) DEFAULT NULL,
  `cost` float NOT NULL,
  `quantity` int(11) NOT NULL,
  `created_by` varchar(20) NOT NULL,
  `created_dt` timestamp NOT NULL,
  `last_modified_by` varchar(20) NOT NULL,
  `last_modified_dt` timestamp NOT NULL,
  PRIMARY KEY (`work _order_spares_no`),
  KEY `fk_work_order_no_idx` (`work _order_no`),
  CONSTRAINT `fk_work_order_no` FOREIGN KEY (`work _order_no`) REFERENCES `work_order` (`work_order_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `work_order`
--

DROP TABLE IF EXISTS `work_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `work_order` (
  `work_order_no` int(11) NOT NULL,
  `service_request_no` int(11) NOT NULL,
  `technician_no` int(11) NOT NULL,
  `work_order_created_dt` date NOT NULL,
  `start_dt` date NOT NULL,
  `estimation_hours` time DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  `work_order_status_no` varchar(20) NOT NULL,
  `created_by` varchar(20) NOT NULL,
  `created_dt` timestamp NOT NULL,
  `last_modified_by` varchar(20) NOT NULL,
  `last_modified_dt` timestamp NOT NULL,
  PRIMARY KEY (`work_order_no`),
  KEY `service_request_no_5` (`service_request_no`) ,
  KEY `technician_no_3` (`technician_no`),
  CONSTRAINT `fk_service_request_no_5` FOREIGN KEY (`service_request_no`) REFERENCES `service_request` (`service_request_no`),
  CONSTRAINT `fk_technician_no_3` FOREIGN KEY (`technician_no`) REFERENCES `csr_and_technician_details` (`user_account_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `work_order_activity_log`
--

DROP TABLE IF EXISTS `work_order_activity_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `work_order_activity_log` (
  `work_order_activity_log_no` int(11) NOT NULL AUTO_INCREMENT,
  `work_order_no` int(11) NOT NULL,
  `user_account_no` int(11) NOT NULL,
  `activity_log` varchar(10) NOT NULL,
  `activity_log_date` date NOT NULL,
  `notes` varchar(50) NOT NULL,
  `comments` varchar(100) NOT NULL,
  `work_order_status_no` int(11) NOT NULL,
  `created_by` varchar(20) NOT NULL,
  `created_dt` timestamp NOT NULL,
  `last_modified_by` varchar(20) NOT NULL,
  `last_modified_dt` timestamp NOT NULL,
  PRIMARY KEY (`work_order_activity_log_no`),
  KEY `fk_work_oeder_no_idx` (`work_order_no`),
  KEY `fk_work_oeder_no_` (`work_order_no`),
  KEY `fk_work_order_status_no_idx` (`work_order_status_no`),
  KEY `fk_user_account_no_idx` (`user_account_no`),
  CONSTRAINT `fk_user_account_no` FOREIGN KEY (`user_account_no`) REFERENCES `user_account` (`user_account_no`),
  CONSTRAINT `fk_work_order_no9` FOREIGN KEY (`work_order_no`) REFERENCES `work_order` (`work_order_no`),
  CONSTRAINT `fk_work_order_status_no` FOREIGN KEY (`work_order_status_no`) REFERENCES `work_order_status` (`work_order_status_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `work_order_complaint`
--

DROP TABLE IF EXISTS `work_order_complaint`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `work_order_complaint` (
  `complaint_no` int(11) NOT NULL AUTO_INCREMENT,
  `work_order_no` int(11) NOT NULL,
  `description` varchar(200) DEFAULT NULL,
  `contact_no` varchar(13) NOT NULL,
  `contact_person` varchar(20) NOT NULL,
  `complaint_raised_dt` varchar(20) NOT NULL,
  `resolution_information` varchar(100) NOT NULL,
  `status` bit(1) NOT NULL,
  `created_by` varchar(20) NOT NULL,
  `created_dt` timestamp NOT NULL,
  `last_modified_by` varchar(20) NOT NULL,
  `last_modified_dt` timestamp NOT NULL,
  PRIMARY KEY (`complaint_no`),
  UNIQUE KEY `contact_no_UNIQUE` (`contact_no`),
  UNIQUE KEY `contact_person_UNIQUE` (`contact_person`),
  KEY `fk_work_order_no_idx` (`work_order_no`),
  KEY `fk_work_order_no_6` (`work_order_no`),
  CONSTRAINT `fk_work_order_no6` FOREIGN KEY (`work_order_no`) REFERENCES `work_order` (`work_order_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `work_order_status`
--

DROP TABLE IF EXISTS `work_order_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `work_order_status` (
  `work_order_status_no` int(11) NOT NULL AUTO_INCREMENT,
  `work_order_status` bit(1) NOT NULL,
  `description` varchar(200) DEFAULT NULL,
  `created_by` varchar(20) NOT NULL,
  `created_dt` timestamp NOT NULL,
  `last_modified_by` varchar(20) NOT NULL,
  `last_modified_dt` timestamp NOT NULL,
  PRIMARY KEY (`work_order_status_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-09-04 15:51:56
