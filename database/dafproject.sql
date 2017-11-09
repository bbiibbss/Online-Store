-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 17-Nov-2016 às 13:34
-- Versão do servidor: 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `dafproject`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `proj_address`
--

CREATE TABLE IF NOT EXISTS `proj_address` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `purchaser_name` varchar(50) NOT NULL,
  `shipping_address` varchar(100) NOT NULL,
  `billing_address` varchar(100) NOT NULL,
  `zip_code` varchar(10) NOT NULL,
  `city` varchar(20) NOT NULL,
  `country` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `proj_categories`
--

CREATE TABLE IF NOT EXISTS `proj_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `proj_migration`
--

CREATE TABLE IF NOT EXISTS `proj_migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `proj_migration`
--

INSERT INTO `proj_migration` (`version`, `apply_time`) VALUES
('m000000_000000_base', 1478094708),
('m130524_201442_init', 1478094710);

-- --------------------------------------------------------

--
-- Estrutura da tabela `proj_order`
--

CREATE TABLE IF NOT EXISTS `proj_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vat_number` int(50) NOT NULL,
  `phone_number` int(50) NOT NULL,
  `id_order_status` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_user` (`id_user`),
  KEY `id_order_status` (`id_order_status`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `proj_order_history`
--

CREATE TABLE IF NOT EXISTS `proj_order_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  `id_order` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_order` (`id_order`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `proj_order_product`
--

CREATE TABLE IF NOT EXISTS `proj_order_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_order` int(11) NOT NULL,
  `id_product` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_order` (`id_order`,`id_product`),
  KEY `id_product` (`id_product`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `proj_order_status`
--

CREATE TABLE IF NOT EXISTS `proj_order_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `proj_product`
--

CREATE TABLE IF NOT EXISTS `proj_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `image` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `size` varchar(5) NOT NULL,
  `price` float(10,2) NOT NULL,
  `id_categories` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_categories` (`id_categories`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `proj_stock`
--

CREATE TABLE IF NOT EXISTS `proj_stock` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_product` int(11) NOT NULL,
  `quantity` int(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_product` (`id_product`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `proj_user`
--

CREATE TABLE IF NOT EXISTS `proj_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `auth_key` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `password_hash` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password_reset_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` smallint(6) NOT NULL DEFAULT '10',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `surname` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `phone_number` int(20) NOT NULL,
  `vat_number` int(20) NOT NULL,
  `address_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `password_reset_token` (`password_reset_token`),
  KEY `address_id` (`address_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `proj_order`
--
ALTER TABLE `proj_order`
  ADD CONSTRAINT `proj_order_ibfk_1` FOREIGN KEY (`id_order_status`) REFERENCES `proj_order_status` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `proj_order_ibfk_2` FOREIGN KEY (`id_user`) REFERENCES `proj_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `proj_order_history`
--
ALTER TABLE `proj_order_history`
  ADD CONSTRAINT `proj_order_history_ibfk_1` FOREIGN KEY (`id_order`) REFERENCES `proj_order` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `proj_order_product`
--
ALTER TABLE `proj_order_product`
  ADD CONSTRAINT `proj_order_product_ibfk_1` FOREIGN KEY (`id_order`) REFERENCES `proj_order` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `proj_order_product_ibfk_2` FOREIGN KEY (`id_product`) REFERENCES `proj_product` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `proj_product`
--
ALTER TABLE `proj_product`
  ADD CONSTRAINT `proj_product_ibfk_1` FOREIGN KEY (`id_categories`) REFERENCES `proj_categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `proj_stock`
--
ALTER TABLE `proj_stock`
  ADD CONSTRAINT `proj_stock_ibfk_1` FOREIGN KEY (`id_product`) REFERENCES `proj_product` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `proj_user`
--
ALTER TABLE `proj_user`
  ADD CONSTRAINT `proj_user_ibfk_1` FOREIGN KEY (`address_id`) REFERENCES `proj_address` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
