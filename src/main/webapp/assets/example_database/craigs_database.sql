-- phpMyAdmin SQL Dump
-- version 4.1.12
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Sep 11, 2017 at 05:46 PM
-- Server version: 5.6.16
-- PHP Version: 5.5.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `craigs_database`
--

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE IF NOT EXISTS `items` (
  `id` int(32) NOT NULL AUTO_INCREMENT,
  `title` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `price` int(11) NOT NULL,
  `price_appendix` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `category` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `url` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `latitude` decimal(10,8) DEFAULT NULL,
  `longitude` decimal(10,8) DEFAULT NULL,
  `address` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `featured` int(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=10 ;

--
-- Dumping data for table `items`
--

INSERT INTO `items` (`id`, `title`, `image`, `price`, `price_appendix`, `type`, `category`, `url`, `latitude`, `longitude`, `address`, `featured`) VALUES
(1, 'Furniture for Sale', 'assets/img/image-01.jpg', 80, '', 'Offer', 'Restaurant', 'single-listing-1.html', '40.73727700', '-73.77963100', '', 1),
(2, 'Creative Course', 'assets/img/image-02.jpg', 125, '', 'Offer', 'Bar & Grill', 'single-listing-2.html', '40.73925841', '-73.85348797', '', 0),
(3, 'Into the Wild', 'assets/img/image-03.jpg', 1560, '', 'Ad', 'Event', 'single-listing-3.html', NULL, NULL, 'Forest Hills, Queens, NY 11375, USA', 0),
(4, 'Luxury Apartment', 'assets/img/image-04.jpg', 75000, '', 'Offer', 'Real Estate', 'single-listing-1.html', '40.74078900', '-73.92176600', '', 0),
(5, 'We''ll Redesign Your Apartment', 'assets/img/image-05.jpg', 200, 'From', 'Offer', 'Architecture', 'single-listing-2.html', '40.71828400', '-73.90631710', '', 0),
(6, 'Baby Cats', 'assets/img/image-07.jpg', 80, 'From', 'Offer', 'Pets & Animals', 'single-listing-3.html', NULL, NULL, 'Greenpoint, Brooklyn, New York, USA', 1),
(7, 'Seeking for a Job', 'assets/img/image-06.jpg', 1200, '', 'Demand', 'Jobs', 'single-listing-1.html', NULL, NULL, '', 0),
(8, 'Used Smartphone', 'assets/img/image-08.jpg', 300, '', 'Offer', 'Mobiles', 'single-listing-2.html', NULL, NULL, '', 1),
(9, 'Offroad Car', 'assets/img/image-09.jpg', 30000, '', 'Offer', 'Cars & Motorcycles', 'single-listing-2.html', NULL, NULL, '', 0);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
