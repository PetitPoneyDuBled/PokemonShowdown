-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : mariadb:3306
-- Généré le : mer. 10 mai 2023 à 12:18
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
  `description` text NOT NULL,
  `PP` int(11) NOT NULL,
  `Catégorie` enum('Physique','Spéciale','Statut','') NOT NULL,
  `effet_statut_id` int(11) DEFAULT NULL,
  `probabilite_effet` int(11) DEFAULT NULL,
  `Taux_coup_critique` float NOT NULL DEFAULT 6.25,
  `Modification_coup_critique` int(11) DEFAULT NULL,
  `modification_attaque` float DEFAULT NULL,
  `modification_defense` float DEFAULT NULL,
  `modification_attaque_speciale` float DEFAULT NULL,
  `modification_defense_speciale` float DEFAULT NULL,
  `modification_vitesse` float DEFAULT NULL,
  `modification_attaque_allie` int(11) DEFAULT NULL,
  `modification_defense_allie` int(11) DEFAULT NULL,
  `modification_attaque_speciale_allie` int(11) DEFAULT NULL,
  `modification_defense_speciale_allie` int(11) DEFAULT NULL,
  `modification_vitesse_allie` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Déchargement des données de la table `attaque`
--

INSERT INTO `attaque` (`id`, `nom`, `puissance`, `précision`, `type_id`, `description`, `PP`, `Catégorie`, `effet_statut_id`, `probabilite_effet`, `Taux_coup_critique`, `Modification_coup_critique`, `modification_attaque`, `modification_defense`, `modification_attaque_speciale`, `modification_defense_speciale`, `modification_vitesse`, `modification_attaque_allie`, `modification_defense_allie`, `modification_attaque_speciale_allie`, `modification_defense_speciale_allie`, `modification_vitesse_allie`) VALUES
(1, 'Charge', 35, 100, 9, 'Charge l\'ennemi avec un violent plaquage.', 56, 'Physique', NULL, NULL, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2, 'Rugissement', 0, 100, 9, 'Le lanceur pousse un cri tout mimi pour tromper la vigilance de l\'ennemi et baisser son Attaque', 61, 'Statut', NULL, NULL, 6, NULL, -1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3, 'Griffe', 40, 100, 9, 'Lacère l\'ennemi avec des griffes acérées pour lui infliger des dégâts.', 56, 'Physique', NULL, NULL, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4, 'Fouet Lianes', 35, 100, 10, 'Fouette l\'ennemi avec de fines lianes pour infliger des dégâts.', 16, 'Physique', NULL, NULL, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(5, 'Mimi-Queue', 0, 100, 9, 'Le lanceur remue son adorable queue pour tromper la vigilance de l\'ennemi et baisser sa Défense.', 48, 'Statut', NULL, NULL, 6, NULL, NULL, -1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(6, 'Pistolet à O', 40, 100, 4, 'De l\'eau est projetée sur l\'ennemi en arc de cercle.', 40, 'Spéciale', NULL, NULL, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(7, 'Flammèche', 40, 100, 6, 'L\'ennemi est attaqué par de faibles flammes. Peut aussi le brûler.', 40, 'Spéciale', NULL, NULL, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(8, 'Mur de fer', 0, 100, 1, 'L\'épiderme du lanceur devient dur comme du fer, ce qui augmente considérablement sa Défense.', 24, 'Statut', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `effet_statut`
--

CREATE TABLE `effet_statut` (
  `id` int(11) NOT NULL,
  `nom` varchar(255) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `effet_statut`
--

INSERT INTO `effet_statut` (`id`, `nom`, `description`) VALUES
(1, 'Empoisonné', 'Le Pokémon subit des dégâts à chaque tour (attention l\'empoisonnement grave n\'existe pas encore)'),
(2, 'Brûlé', 'Le Pokémon subit des dégâts à chaque tour et voit son Attaque physique diminué'),
(3, 'Paralysé', 'Le Pokémon voit sa Vitesse réduite et peut être incapable d\'attaquer'),
(4, 'Endormi', 'Le Pokémon ne peut pas attaquer tant qu\'il dort'),
(5, 'Gelé', 'Le Pokémon ne peut pas attaquer tant qu\\\'il est gelé'),
(6, 'Confusion', 'Le Pokémon peut attaquer contre l\'adversaire ou contre lui même'),
(7, 'Malédiction', 'Le Pokémon subit des dégâts en échange de maudire son adversaire'),
(8, 'Peur', 'Le Pokémon ne peut pas attaquer pendant 1 tour'),
(9, 'Clairvoyance', 'Le Pokémon peut être attaquer par des attaques de type normal ou combat et son esquive est réduit à 0'),
(10, 'Vampigraine', 'Le Pokémon est infecté est perd des pv chaque tour pour soigner le Pokémon adverse');

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
  `pv` int(11) DEFAULT NULL,
  `atq` int(11) DEFAULT NULL,
  `def` int(11) DEFAULT NULL,
  `atqspe` int(11) DEFAULT NULL,
  `defspe` int(11) DEFAULT NULL,
  `vit` int(11) DEFAULT NULL,
  `sexe` enum('null','feminin','masculin','') NOT NULL,
  `niveauAtq` int(11) NOT NULL DEFAULT 0,
  `niveauDef` int(11) NOT NULL DEFAULT 0,
  `niveauAtqspe` int(11) NOT NULL,
  `niveauDefspe` int(11) NOT NULL DEFAULT 0,
  `niveauVit` int(11) NOT NULL DEFAULT 0,
  `atq_base` int(11) NOT NULL,
  `def_base` int(11) NOT NULL,
  `atqspe_base` int(11) NOT NULL,
  `defspe_base` int(11) NOT NULL,
  `vit_base` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Déchargement des données de la table `pokemon`
--

INSERT INTO `pokemon` (`id`, `nom`, `pv`, `atq`, `def`, `atqspe`, `defspe`, `vit`, `sexe`, `niveauAtq`, `niveauDef`, `niveauAtqspe`, `niveauDefspe`, `niveauVit`, `atq_base`, `def_base`, `atqspe_base`, `defspe_base`, `vit_base`) VALUES
(1, 'Bulbizarre', 231, 134, 34, 166, 166, 126, 'null', 0, -6, 0, 0, 0, 134, 134, 166, 166, 126),
(2, 'Herbizarre', 261, 160, 162, 196, 196, 156, 'null', 0, 0, 0, 0, 0, 160, 162, 196, 196, 156),
(3, 'Florizarre', 301, 200, 202, 236, 236, 196, 'null', 0, 0, 0, 0, 0, 200, 202, 236, 236, 196),
(4, 'Salamèche', 219, 140, 122, 156, 136, 166, 'null', 0, 0, 0, 0, 0, 140, 122, 156, 136, 166),
(5, 'Reptincel', 257, 164, 152, 196, 166, 196, 'null', 0, 0, 0, 0, 0, 164, 152, 196, 166, 196),
(6, 'Dracaufeu', 297, 204, 77, 254, 206, 236, 'null', 0, -3, 0, 0, 0, 204, 192, 254, 206, 236),
(7, 'Carapuce', 229, 132, 166, 136, 164, 122, 'null', 0, 0, 0, 0, 0, 132, 166, 136, 164, 122),
(8, 'Carabaffe', 259, 162, 98, 166, 196, 152, 'null', 0, -2, 0, 0, 0, 162, 196, 166, 196, 152),
(9, 'Tortank', 299, 202, 236, 206, 246, 192, 'null', 0, 0, 0, 0, 0, 202, 236, 206, 246, 192);

-- --------------------------------------------------------

--
-- Structure de la table `pokemon_attaque`
--

CREATE TABLE `pokemon_attaque` (
  `pokemon_id` int(11) NOT NULL,
  `attaque_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Déchargement des données de la table `pokemon_attaque`
--

INSERT INTO `pokemon_attaque` (`pokemon_id`, `attaque_id`) VALUES
(1, 1),
(1, 2),
(1, 4),
(2, 4),
(2, 1),
(2, 2),
(3, 1),
(3, 2),
(3, 4),
(4, 3),
(4, 2),
(4, 7),
(5, 3),
(5, 7),
(5, 2),
(6, 3),
(6, 7),
(6, 2),
(7, 1),
(7, 5),
(7, 6),
(8, 1),
(8, 5),
(8, 6),
(9, 1),
(9, 5),
(9, 6),
(7, 8),
(8, 8),
(9, 8);

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
(9, 4),
(6, 17);

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
  ADD PRIMARY KEY (`id`),
  ADD KEY `attaque_effet_statut_fk` (`effet_statut_id`);

--
-- Index pour la table `effet_statut`
--
ALTER TABLE `effet_statut`
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

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
-- Contraintes pour la table `attaque`
--
ALTER TABLE `attaque`
  ADD CONSTRAINT `attaque_effet_statut_fk` FOREIGN KEY (`effet_statut_id`) REFERENCES `effet_statut` (`id`);

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
