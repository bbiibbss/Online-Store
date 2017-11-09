-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 12-Jan-2017 às 11:09
-- Versão do servidor: 10.1.19-MariaDB
-- PHP Version: 5.6.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `online_store`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `am_auth_assignment`
--

CREATE TABLE `am_auth_assignment` (
  `item_name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Extraindo dados da tabela `am_auth_assignment`
--

INSERT INTO `am_auth_assignment` (`item_name`, `user_id`, `created_at`) VALUES
('admin', '1', 1483536842),
('customer', '2', 1483536842),
('customer', '4', 1484067225),
('customer', '5', 1484067298);

-- --------------------------------------------------------

--
-- Estrutura da tabela `am_auth_item`
--

CREATE TABLE `am_auth_item` (
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `type` int(11) NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `rule_name` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `data` text COLLATE utf8_unicode_ci,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Extraindo dados da tabela `am_auth_item`
--

INSERT INTO `am_auth_item` (`name`, `type`, `description`, `rule_name`, `data`, `created_at`, `updated_at`) VALUES
('admin', 1, NULL, NULL, NULL, 1483536841, 1483536841),
('createProduct', 2, 'Create products', NULL, NULL, 1483536840, 1483536840),
('customer', 1, NULL, NULL, NULL, 1483536841, 1483536841),
('deleteProducts', 2, 'Delete products', NULL, NULL, 1483536841, 1483536841),
('manageBackend', 2, 'Manage store''s backend', NULL, NULL, 1483536840, 1483536840),
('updateProduct', 2, 'Update products', NULL, NULL, 1483536840, 1483536840),
('updateUserProfile', 2, 'Update user profile', NULL, NULL, 1483536841, 1483536841);

-- --------------------------------------------------------

--
-- Estrutura da tabela `am_auth_item_child`
--

CREATE TABLE `am_auth_item_child` (
  `parent` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `child` varchar(64) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Extraindo dados da tabela `am_auth_item_child`
--

INSERT INTO `am_auth_item_child` (`parent`, `child`) VALUES
('admin', 'createProduct'),
('admin', 'deleteProducts'),
('admin', 'manageBackend'),
('admin', 'updateProduct'),
('customer', 'updateUserProfile');

-- --------------------------------------------------------

--
-- Estrutura da tabela `am_auth_rule`
--

CREATE TABLE `am_auth_rule` (
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `data` text COLLATE utf8_unicode_ci,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `am_migration`
--

CREATE TABLE `am_migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `am_migration`
--

INSERT INTO `am_migration` (`version`, `apply_time`) VALUES
('m000000_000000_base', 1483033637),
('m130524_201442_init', 1483033641),
('m140506_102106_rbac_init', 1483113704);

-- --------------------------------------------------------

--
-- Estrutura da tabela `am_order`
--

CREATE TABLE `am_order` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `is_paid` tinyint(1) NOT NULL,
  `id_status` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `shipping_address` text NOT NULL,
  `billing_address` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `am_order`
--

INSERT INTO `am_order` (`id`, `id_user`, `is_paid`, `id_status`, `date`, `shipping_address`, `billing_address`) VALUES
(24, 2, 1, 1, '2017-01-12 01:14:20', 'user shipping address', 'user shipping address'),
(25, 2, 1, 1, '2017-01-12 11:02:36', 'user shipping address', 'user shipping address');

-- --------------------------------------------------------

--
-- Estrutura da tabela `am_order_product_assignment`
--

CREATE TABLE `am_order_product_assignment` (
  `id` int(11) NOT NULL,
  `id_order` int(11) NOT NULL,
  `id_product` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `am_order_product_assignment`
--

INSERT INTO `am_order_product_assignment` (`id`, `id_order`, `id_product`, `quantity`, `price`) VALUES
(11, 24, 24, 1, 23),
(12, 24, 28, 1, 179),
(13, 24, 29, 1, 196),
(14, 24, 30, 1, 123),
(15, 24, 25, 1, 324),
(16, 24, 26, 1, 33),
(17, 24, 7, 2, 50),
(18, 24, 9, 1, 36),
(19, 24, 10, 1, 56),
(20, 25, 7, 1, 50),
(21, 25, 8, 1, 56),
(22, 25, 9, 1, 36);

-- --------------------------------------------------------

--
-- Estrutura da tabela `am_order_status`
--

CREATE TABLE `am_order_status` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `am_order_status`
--

INSERT INTO `am_order_status` (`id`, `name`) VALUES
(1, 'in progress'),
(2, 'completed');

-- --------------------------------------------------------

--
-- Estrutura da tabela `am_product`
--

CREATE TABLE `am_product` (
  `id` int(11) NOT NULL,
  `id_category` int(11) NOT NULL,
  `id_subcategory` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `photo` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `am_product`
--

INSERT INTO `am_product` (`id`, `id_category`, `id_subcategory`, `name`, `photo`, `description`, `quantity`, `price`) VALUES
(7, 1, 14, 'Slipknot t-shirt', 'slipknot1.jpg', 'sdsddsfsd', 34, 50),
(8, 1, 14, 'Slipknot T-shirt', 'slipknot2.jpg', 'fsdfsdfasdf', 234, 56),
(9, 1, 14, 'Slipknot T-shirt', 'slipknot3.png', 'saasdas', 324, 36),
(10, 1, 14, 'Korn T-shirt', 'korn1.gif', 'dsfdf', 435, 56),
(11, 1, 13, 'Korn - Follow the leader', 'korn2.jpg', 'sdfsdfsf', 32, 17),
(12, 1, 13, 'Korn - Issues', 'korn3.jpg', 'fdffdg', 324, 17),
(13, 1, 14, 'Lamb of God T-shirt', 'lamb_of_god1.jpg', 'gdfsggs', 324, 34),
(14, 1, 13, 'Lamb of God T-shirt', 'lamb_of_god2.jpg', 'fgdsgdg', 435, 23),
(15, 1, 13, 'Lamb of God T-shirt', 'lamb_of_god3.jpg', 'fdsgd', 435, 34),
(16, 1, 13, 'Architects - Lost forever//Lost together', 'architects1.jpg', 'fdgdsfg', 324, 15),
(17, 1, 15, 'Disturbed - Sickness', 'disturbed1.jpg', 'sdfsf', 43, 25),
(18, 1, 14, 'Drowning Pool T-Shirt', 'drowning_pool1.jpg', 'dgfg', 32, 24),
(19, 1, 14, 'Drowning Pool T-Shirt', 'drowning_pool2.jpg', 'dfg', 324, 23),
(20, 1, 12, 'Meshuggah Hoodie', 'meshuggah1.jpg', 'dfgfgdfsg', 20, 35),
(21, 1, 12, 'Meshuggah Hoodie', 'meshuggah2.jpg', 'dgdfgfg', 123, 27),
(22, 1, 14, 'While She Sleeps T-Shirt', 'while_she_sleeps1.jpg', 'dfgsf', 432, 25),
(23, 1, 14, 'While She Sleeps T-Shirt', 'while_she_sleeps2.jpg', 'ewrf', 34, 25),
(24, 4, 4, 'Hand bag', 'accessorie1.jpg', 'fdfds', 223, 23),
(25, 4, 4, 'Beanie', 'accessorie2.jpg', 'fdgdfg', 234, 324),
(26, 4, 8, 'Bikini', 'bikini1.jpg', 'cxvxcv', 1, 33),
(27, 4, 6, 'Dress', 'dress1.jpg', 'ddgdfg', 23, 23),
(28, 4, 2, 'Dr. Martens', 'womanFootwear3.jpg', 'gffghb', 34, 179),
(29, 3, 1, 'Dr. Martens', 'Footwear6.jpg', 'dfdf', 234, 196),
(30, 3, 3, 'Sun glasses', 'glasses.jpg', 'sdfsd', 232, 123),
(31, 3, 5, 'T-shirt', 't-shirt4.jpg', 'dfg', 34, 23),
(32, 1, 14, 'asdad', 'dsfsdf.jpg', 'd', 234, 12);

-- --------------------------------------------------------

--
-- Estrutura da tabela `am_product_category`
--

CREATE TABLE `am_product_category` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `am_product_category`
--

INSERT INTO `am_product_category` (`id`, `name`) VALUES
(1, 'Band''s merchandise'),
(3, 'man'),
(4, 'woman');

-- --------------------------------------------------------

--
-- Estrutura da tabela `am_product_subcategory`
--

CREATE TABLE `am_product_subcategory` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `id_category` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `am_product_subcategory`
--

INSERT INTO `am_product_subcategory` (`id`, `name`, `id_category`) VALUES
(1, 'Footwear', 3),
(2, 'Footwear', 4),
(3, 'Accessories', 3),
(4, 'Accessories', 4),
(5, 'Clothing', 3),
(6, 'Clothing', 4),
(7, 'Beachwear', 3),
(8, 'Beachwear', 4),
(12, 'Hoodies', 1),
(13, 'CD''s', 1),
(14, 'T-shirts', 1),
(15, 'DVD''s', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `am_user`
--

CREATE TABLE `am_user` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `auth_key` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `password_hash` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password_reset_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `vat_number` int(20) NOT NULL,
  `phone_number` int(11) NOT NULL,
  `billing_address` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `shipping_address` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` smallint(6) NOT NULL DEFAULT '10',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Extraindo dados da tabela `am_user`
--

INSERT INTO `am_user` (`id`, `name`, `email`, `auth_key`, `password_hash`, `password_reset_token`, `vat_number`, `phone_number`, `billing_address`, `shipping_address`, `status`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'admin@gmail.com', '', '$2y$13$BynibFnibnJ5z2o./s37ceHZEO0pQgZILi3suCjO4PdQsC0A1lzDC', NULL, 46356345, 546557467, 'fghdfghgjghhk', 'jkjhfjjjjjgkfj', 10, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 'user324234', 'user@gmail.com', '', '$2y$13$BynibFnibnJ5z2o./s37ceHZEO0pQgZILi3suCjO4PdQsC0A1lzDC', NULL, 1111, 546456456, 'user billing  address', 'user shipping address', 10, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3, '', 'user1@gmail.com', 'Iby9CYeTDt2jdodV3bWTmg-UJNJe-0Ff', '$2y$13$Myaqzl8TMagg2jyYYltXa.Y3GEXTYJwlyisuazdM5KsuduRYZG3kK', NULL, 0, 0, '', '', 10, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4, 'user2', 'user2@gmail.com', 'UHKq0wiL1dJ2yEe9BPEXF-bpYauVuaf7', '$2y$13$sv22O9TgK3YD6DNCN.of4Obvj6sHJGt4PCfM.aIOSqvudV5VMFtVK', NULL, 567567657, 964567, 'user 2 billing address', 'user 2 shipping address', 10, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5, 'user3', 'user3@gmail.com', 'Avc4IqVefZUVDMXeMD9EPN_QxOGcOZE7', '$2y$13$OQv0gfFeNfmhzCKKEI8/c.uWw8dOqqWCytei7XeIJ3FpkjXLA06K.', NULL, 657457, 96467, 'user 3 billing address', 'user 3 shipping address', 10, '0000-00-00 00:00:00', '0000-00-00 00:00:00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `am_auth_assignment`
--
ALTER TABLE `am_auth_assignment`
  ADD PRIMARY KEY (`item_name`,`user_id`);

--
-- Indexes for table `am_auth_item`
--
ALTER TABLE `am_auth_item`
  ADD PRIMARY KEY (`name`),
  ADD KEY `rule_name` (`rule_name`),
  ADD KEY `idx-auth_item-type` (`type`);

--
-- Indexes for table `am_auth_item_child`
--
ALTER TABLE `am_auth_item_child`
  ADD PRIMARY KEY (`parent`,`child`),
  ADD KEY `child` (`child`);

--
-- Indexes for table `am_auth_rule`
--
ALTER TABLE `am_auth_rule`
  ADD PRIMARY KEY (`name`);

--
-- Indexes for table `am_migration`
--
ALTER TABLE `am_migration`
  ADD PRIMARY KEY (`version`);

--
-- Indexes for table `am_order`
--
ALTER TABLE `am_order`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_user` (`id_user`),
  ADD KEY `id_status` (`id_status`);

--
-- Indexes for table `am_order_product_assignment`
--
ALTER TABLE `am_order_product_assignment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_order` (`id_order`),
  ADD KEY `id_product` (`id_product`);

--
-- Indexes for table `am_order_status`
--
ALTER TABLE `am_order_status`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `am_product`
--
ALTER TABLE `am_product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_category` (`id_category`),
  ADD KEY `id_subcategory` (`id_subcategory`);

--
-- Indexes for table `am_product_category`
--
ALTER TABLE `am_product_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `am_product_subcategory`
--
ALTER TABLE `am_product_subcategory`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_category` (`id_category`);

--
-- Indexes for table `am_user`
--
ALTER TABLE `am_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `password_reset_token` (`password_reset_token`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `am_order`
--
ALTER TABLE `am_order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;
--
-- AUTO_INCREMENT for table `am_order_product_assignment`
--
ALTER TABLE `am_order_product_assignment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
--
-- AUTO_INCREMENT for table `am_order_status`
--
ALTER TABLE `am_order_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `am_product`
--
ALTER TABLE `am_product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;
--
-- AUTO_INCREMENT for table `am_product_category`
--
ALTER TABLE `am_product_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `am_product_subcategory`
--
ALTER TABLE `am_product_subcategory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `am_user`
--
ALTER TABLE `am_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `am_auth_assignment`
--
ALTER TABLE `am_auth_assignment`
  ADD CONSTRAINT `am_auth_assignment_ibfk_1` FOREIGN KEY (`item_name`) REFERENCES `am_auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `am_auth_item`
--
ALTER TABLE `am_auth_item`
  ADD CONSTRAINT `am_auth_item_ibfk_1` FOREIGN KEY (`rule_name`) REFERENCES `am_auth_rule` (`name`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Limitadores para a tabela `am_auth_item_child`
--
ALTER TABLE `am_auth_item_child`
  ADD CONSTRAINT `am_auth_item_child_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `am_auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `am_auth_item_child_ibfk_2` FOREIGN KEY (`child`) REFERENCES `am_auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `am_order`
--
ALTER TABLE `am_order`
  ADD CONSTRAINT `am_order_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `am_user` (`id`),
  ADD CONSTRAINT `am_order_ibfk_2` FOREIGN KEY (`id_status`) REFERENCES `am_order_status` (`id`);

--
-- Limitadores para a tabela `am_order_product_assignment`
--
ALTER TABLE `am_order_product_assignment`
  ADD CONSTRAINT `am_order_product_assignment_ibfk_2` FOREIGN KEY (`id_product`) REFERENCES `am_product` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `am_order_product_assignment_ibfk_3` FOREIGN KEY (`id_order`) REFERENCES `am_order` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `am_product`
--
ALTER TABLE `am_product`
  ADD CONSTRAINT `am_product_ibfk_1` FOREIGN KEY (`id_category`) REFERENCES `am_product_category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `am_product_ibfk_2` FOREIGN KEY (`id_subcategory`) REFERENCES `am_product_subcategory` (`id`);

--
-- Limitadores para a tabela `am_product_subcategory`
--
ALTER TABLE `am_product_subcategory`
  ADD CONSTRAINT `am_product_subcategory_ibfk_1` FOREIGN KEY (`id_category`) REFERENCES `am_product_category` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
