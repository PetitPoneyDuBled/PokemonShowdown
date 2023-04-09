-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: db
-- Generation Time: Apr 08, 2023 at 12:12 PM
-- Server version: 10.11.2-MariaDB-1:10.11.2+maria~ubu2204
-- PHP Version: 8.1.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `Pokemon`
--

-- --------------------------------------------------------

--
-- Table structure for table `attaque`
--

CREATE TABLE `attaque` (
  `id` int(11) NOT NULL,
  `nom` varchar(255) NOT NULL,
  `puissance` int(11) NOT NULL,
  `précision` int(11) NOT NULL,
  `type_id` int(11) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Table structure for table `objet`
--

CREATE TABLE `objet` (
  `id` int(11) NOT NULL,
  `nom` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `effet` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Table structure for table `pokemon`
--

CREATE TABLE `pokemon` (
  `id` int(11) NOT NULL,
  `nom` varchar(255) NOT NULL,
  `pv` int(11) NOT NULL,
  `atq` int(11) NOT NULL,
  `def` int(11) NOT NULL,
  `atqspe` int(11) NOT NULL,
  `defspe` int(11) NOT NULL,
  `vit` int(11) NOT NULL,
  `sexe` enum('null','feminin','masculin','') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Table structure for table `pokemon_attaque`
--

CREATE TABLE `pokemon_attaque` (
  `pokemon_id` int(11) NOT NULL,
  `attaque_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Table structure for table `pokemon_objet`
--

CREATE TABLE `pokemon_objet` (
  `pokemon_id` int(11) NOT NULL,
  `objet_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Table structure for table `pokemon_type`
--

CREATE TABLE `pokemon_type` (
  `pokemon_id` int(11) NOT NULL,
  `type_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Table structure for table `type`
--

CREATE TABLE `type` (
  `id` int(11) NOT NULL,
  `nom` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `attaque`
--
ALTER TABLE `attaque`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `objet`
--
ALTER TABLE `objet`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pokemon`
--
ALTER TABLE `pokemon`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pokemon_attaque`
--
ALTER TABLE `pokemon_attaque`
  ADD KEY `attaque_id` (`attaque_id`),
  ADD KEY `pokemon_id` (`pokemon_id`);

--
-- Indexes for table `pokemon_objet`
--
ALTER TABLE `pokemon_objet`
  ADD KEY `objet_id` (`objet_id`),
  ADD KEY `pokemon_id` (`pokemon_id`);

--
-- Indexes for table `pokemon_type`
--
ALTER TABLE `pokemon_type`
  ADD KEY `pokemon_id` (`pokemon_id`),
  ADD KEY `type_id` (`type_id`);

--
-- Indexes for table `type`
--
ALTER TABLE `type`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `attaque`
--
ALTER TABLE `attaque`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `objet`
--
ALTER TABLE `objet`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pokemon`
--
ALTER TABLE `pokemon`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `type`
--
ALTER TABLE `type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `pokemon_attaque`
--
ALTER TABLE `pokemon_attaque`
  ADD CONSTRAINT `pokemon_attaque_ibfk_1` FOREIGN KEY (`attaque_id`) REFERENCES `attaque` (`id`),
  ADD CONSTRAINT `pokemon_attaque_ibfk_2` FOREIGN KEY (`pokemon_id`) REFERENCES `pokemon` (`id`);

--
-- Constraints for table `pokemon_objet`
--
ALTER TABLE `pokemon_objet`
  ADD CONSTRAINT `pokemon_objet_ibfk_1` FOREIGN KEY (`objet_id`) REFERENCES `objet` (`id`),
  ADD CONSTRAINT `pokemon_objet_ibfk_2` FOREIGN KEY (`pokemon_id`) REFERENCES `pokemon` (`id`);

--
-- Constraints for table `pokemon_type`
--
ALTER TABLE `pokemon_type`
  ADD CONSTRAINT `pokemon_type_ibfk_1` FOREIGN KEY (`pokemon_id`) REFERENCES `pokemon` (`id`),
  ADD CONSTRAINT `pokemon_type_ibfk_2` FOREIGN KEY (`type_id`) REFERENCES `type` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
