-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: May 11, 2020 at 10:22 AM
-- Server version: 10.4.10-MariaDB
-- PHP Version: 7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cv11_kvetinarstvo`
--

-- --------------------------------------------------------

--
-- Table structure for table `druhy_kvetov`
--

DROP TABLE IF EXISTS `druhy_kvetov`;
CREATE TABLE IF NOT EXISTS `druhy_kvetov` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nazov` char(50) COLLATE utf8_slovak_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_slovak_ci;

--
-- Dumping data for table `druhy_kvetov`
--

INSERT INTO `druhy_kvetov` (`id`, `nazov`) VALUES
(1, 'Ruže'),
(2, 'Tulipány'),
(3, 'Alstromérie'),
(4, 'Pivonky'),
(5, 'Slnečnice'),
(6, 'Gerbery'),
(7, 'Chryzantémy'),
(8, 'Hortenzie'),
(9, 'Ľalie'),
(10, 'Begónia');

-- --------------------------------------------------------

--
-- Table structure for table `kvety`
--

DROP TABLE IF EXISTS `kvety`;
CREATE TABLE IF NOT EXISTS `kvety` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nazov` char(50) COLLATE utf8_slovak_ci NOT NULL,
  `cena` decimal(5,2) NOT NULL,
  `obsah_balenia` int(11) NOT NULL,
  `druh` int(11) NOT NULL,
  `vyska_od` decimal(4,0) NOT NULL,
  `vyska_do` decimal(4,0) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `druh` (`druh`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_slovak_ci;

--
-- Dumping data for table `kvety`
--

INSERT INTO `kvety` (`id`, `nazov`, `cena`, `obsah_balenia`, `druh`, `vyska_od`, `vyska_do`) VALUES
(1, 'Ruža Eden Rose®', '9.95', 1, 1, '0', '250'),
(2, 'Ruža Schneewittchen®', '5.25', 1, 1, '0', '100'),
(3, 'Ruža Bordüre Apricot®', '4.95', 1, 1, '0', '60'),
(4, 'Ruža Montana®', '5.95', 1, 1, '0', '60'),
(5, 'Gazdovská hortenzia Belle Seduction', '9.25', 1, 8, '0', '80'),
(6, 'Hortenzia Diamant Rouge', '6.45', 1, 8, '0', '100'),
(7, 'Ľalia Orange Electric', '5.25', 2, 9, '60', '100'),
(8, 'Ľalia Honeymoon', '4.95', 2, 9, '0', '200'),
(9, 'Begonia Pendula MIX', '5.50', 5, 10, '0', '40');

-- --------------------------------------------------------

--
-- Table structure for table `kvety_stanovisko`
--

DROP TABLE IF EXISTS `kvety_stanovisko`;
CREATE TABLE IF NOT EXISTS `kvety_stanovisko` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_kvety` int(11) NOT NULL,
  `id_stanovisko` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_kvety` (`id_kvety`),
  KEY `id_stanovisko` (`id_stanovisko`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_slovak_ci;

--
-- Dumping data for table `kvety_stanovisko`
--

INSERT INTO `kvety_stanovisko` (`id`, `id_kvety`, `id_stanovisko`) VALUES
(1, 1, 1),
(2, 2, 1),
(3, 3, 1),
(4, 4, 1),
(5, 5, 1),
(6, 5, 2),
(7, 6, 1),
(8, 6, 2),
(9, 7, 1),
(10, 7, 2),
(11, 8, 1),
(12, 9, 2);

-- --------------------------------------------------------

--
-- Table structure for table `stanovisko`
--

DROP TABLE IF EXISTS `stanovisko`;
CREATE TABLE IF NOT EXISTS `stanovisko` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nazov` char(50) COLLATE utf8_slovak_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_slovak_ci;

--
-- Dumping data for table `stanovisko`
--

INSERT INTO `stanovisko` (`id`, `nazov`) VALUES
(1, 'Slnko'),
(2, 'Polotieň'),
(3, 'Tieň');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `kvety`
--
ALTER TABLE `kvety`
  ADD CONSTRAINT `kvety_ibfk_1` FOREIGN KEY (`druh`) REFERENCES `druhy_kvetov` (`id`);

--
-- Constraints for table `kvety_stanovisko`
--
ALTER TABLE `kvety_stanovisko`
  ADD CONSTRAINT `kvety_stanovisko_ibfk_1` FOREIGN KEY (`id_kvety`) REFERENCES `kvety` (`id`),
  ADD CONSTRAINT `kvety_stanovisko_ibfk_2` FOREIGN KEY (`id_stanovisko`) REFERENCES `stanovisko` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
