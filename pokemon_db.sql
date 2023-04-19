-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : mariadb:3306
-- Généré le : mar. 18 avr. 2023 à 23:58
-- Version du serveur : 10.11.2-MariaDB-1:10.11.2+maria~ubu2204
-- Version de PHP : 8.1.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `pokemon_db`
--

-- --------------------------------------------------------

--
-- Structure de la table `attaque`
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
-- Structure de la table `objet`
--

CREATE TABLE `objet` (
  `id` int(11) NOT NULL,
  `nom` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `effet` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Structure de la table `pokemon`
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

--
-- Déchargement des données de la table `pokemon`
--

INSERT INTO `pokemon` (`id`, `nom`, `pv`, `atq`, `def`, `atqspe`, `defspe`, `vit`, `sexe`) VALUES
(1, 'Bulbizarre', 231, 134, 134, 166, 166, 126, 'null'),
(2, 'Herbizarre', 261, 160, 162, 196, 196, 156, 'null'),
(3, 'Florizarre', 301, 200, 202, 236, 236, 196, 'null'),
(4, 'Salamèche', 219, 140, 122, 156, 136, 166, 'null'),
(5, 'Reptincel', 257, 164, 152, 196, 166, 196, 'null'),
(6, 'Dracaufeu', 297, 204, 192, 254, 206, 236, 'null'),
(7, 'Carapuce', 229, 101, 166, 136, 164, 122, 'null'),
(8, 'Carabaffe', 259, 131, 196, 166, 196, 152, 'null'),
(9, 'Tortank', 299, 202, 236, 206, 246, 192, 'null');

-- --------------------------------------------------------

--
-- Structure de la table `pokemon_attaque`
--

CREATE TABLE `pokemon_attaque` (
  `pokemon_id` int(11) NOT NULL,
  `attaque_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Structure de la table `pokemon_objet`
--

CREATE TABLE `pokemon_objet` (
  `pokemon_id` int(11) NOT NULL,
  `objet_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Structure de la table `pokemon_type`
--

CREATE TABLE `pokemon_type` (
  `pokemon_id` int(11) NOT NULL,
  `type_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Déchargement des données de la table `pokemon_type`
--

INSERT INTO `pokemon_type` (`pokemon_id`, `type_id`) VALUES
(1, 11),
(1, 10),
(2, 10),
(2, 11),
(3, 11),
(3, 10),
(4, 6),
(5, 6),
(6, 6),
(7, 4),
(8, 4),
(9, 4);

-- --------------------------------------------------------

--
-- Structure de la table `type`
--

CREATE TABLE `type` (
  `id` int(11) NOT NULL,
  `nom` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Déchargement des données de la table `type`
--

INSERT INTO `type` (`id`, `nom`) VALUES
(1, 'Acier'),
(2, 'Combat'),
(3, 'Dragon'),
(4, 'Eau'),
(5, 'Electrik'),
(6, 'Feu'),
(7, 'Glace'),
(8, 'Insect'),
(9, 'Normal'),
(10, 'Plante'),
(11, 'Poison'),
(12, 'Psy'),
(13, 'Roche'),
(14, 'Sol'),
(15, 'Spectre'),
(16, 'Tenebre'),
(17, 'Vol');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `attaque`
--
ALTER TABLE `attaque`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `objet`
--
ALTER TABLE `objet`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `pokemon`
--
ALTER TABLE `pokemon`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `pokemon_attaque`
--
ALTER TABLE `pokemon_attaque`
  ADD KEY `attaque_id` (`attaque_id`),
  ADD KEY `pokemon_id` (`pokemon_id`);

--
-- Index pour la table `pokemon_objet`
--
ALTER TABLE `pokemon_objet`
  ADD KEY `objet_id` (`objet_id`),
  ADD KEY `pokemon_id` (`pokemon_id`);

--
-- Index pour la table `pokemon_type`
--
ALTER TABLE `pokemon_type`
  ADD KEY `pokemon_id` (`pokemon_id`),
  ADD KEY `type_id` (`type_id`);

--
-- Index pour la table `type`
--
ALTER TABLE `type`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `attaque`
--
ALTER TABLE `attaque`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `objet`
--
ALTER TABLE `objet`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `pokemon`
--
ALTER TABLE `pokemon`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT pour la table `type`
--
ALTER TABLE `type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `pokemon_attaque`
--
ALTER TABLE `pokemon_attaque`
  ADD CONSTRAINT `pokemon_attaque_ibfk_1` FOREIGN KEY (`attaque_id`) REFERENCES `attaque` (`id`),
  ADD CONSTRAINT `pokemon_attaque_ibfk_2` FOREIGN KEY (`pokemon_id`) REFERENCES `pokemon` (`id`);

--
-- Contraintes pour la table `pokemon_objet`
--
ALTER TABLE `pokemon_objet`
  ADD CONSTRAINT `pokemon_objet_ibfk_1` FOREIGN KEY (`objet_id`) REFERENCES `objet` (`id`),
  ADD CONSTRAINT `pokemon_objet_ibfk_2` FOREIGN KEY (`pokemon_id`) REFERENCES `pokemon` (`id`);

--
-- Contraintes pour la table `pokemon_type`
--
ALTER TABLE `pokemon_type`
  ADD CONSTRAINT `pokemon_type_ibfk_1` FOREIGN KEY (`pokemon_id`) REFERENCES `pokemon` (`id`),
  ADD CONSTRAINT `pokemon_type_ibfk_2` FOREIGN KEY (`type_id`) REFERENCES `type` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
