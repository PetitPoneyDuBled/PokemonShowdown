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
  `modification_vitesse` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

INSERT INTO `attaque` (`id`, `nom`, `puissance`, `précision`, `type_id`, `description`, `PP`, `Catégorie`, `effet_statut_id`, `probabilite_effet`, `Taux_coup_critique`, `Modification_coup_critique`, `modification_attaque`, `modification_defense`, `modification_attaque_speciale`, `modification_defense_speciale`, `modification_vitesse`) VALUES
(1, 'Charge', 35, 100, 9, 'Charge l\'ennemi avec un violent plaquage.', 56, 'Physique', NULL, NULL, 6, NULL, NULL, NULL, NULL, NULL, NULL),
(2, 'Rugissement', 0, 100, 9, 'Le lanceur pousse un cri tout mimi pour tromper la vigilance de l\'ennemi et baisser son Attaque', 61, 'Statut', NULL, NULL, 6, NULL, -1, NULL, NULL, NULL, NULL),
(3, 'Griffe', 40, 100, 9, 'Lacère l\'ennemi avec des griffes acérées pour lui infliger des dégâts.', 56, 'Physique', NULL, NULL, 6, NULL, NULL, NULL, NULL, NULL, NULL),
(4, 'Fouet Lianes', 35, 100, 10, 'Fouette l\'ennemi avec de fines lianes pour infliger des dégâts.', 16, 'Physique', NULL, NULL, 6, NULL, NULL, NULL, NULL, NULL, NULL),
(5, 'Mimi-Queue', 0, 100, 9, 'Le lanceur remue son adorable queue pour tromper la vigilance de l\'ennemi et baisser sa Défense.', 48, 'Statut', NULL, NULL, 6, NULL, NULL, NULL, NULL, NULL, NULL),
(6, 'Pistolet à O', 40, 100, 4, 'De l\'eau est projetée sur l\'ennemi en arc de cercle.', 40, 'Spéciale', NULL, NULL, 6, NULL, NULL, NULL, NULL, NULL, NULL),
(7, 'Flammèche', 40, 100, 6, 'L\'ennemi est attaqué par de faibles flammes. Peut aussi le brûler.', 40, 'Spéciale', NULL, NULL, 6, NULL, NULL, NULL, NULL, NULL, NULL);

CREATE TABLE `effet_statut` (
  `id` int(11) NOT NULL,
  `nom` varchar(255) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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

CREATE TABLE `objet` (
  `id` int(11) NOT NULL,
  `nom` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `effet` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

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

CREATE TABLE `pokemon_attaque` (
  `pokemon_id` int(11) NOT NULL,
  `attaque_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

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

CREATE TABLE `pokemon_objet` (
  `pokemon_id` int(11) NOT NULL,
  `objet_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

CREATE TABLE `pokemon_type` (
  `pokemon_id` int(11) NOT NULL,
  `type_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

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

CREATE TABLE `type` (
  `id` int(11) NOT NULL,
  `nom` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

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

ALTER TABLE `attaque`
  ADD PRIMARY KEY (`id`),
  ADD KEY `attaque_effet_statut_fk` (`effet_statut_id`);

ALTER TABLE `effet_statut`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `objet`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `pokemon`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `pokemon_attaque`
  ADD KEY `attaque_id` (`attaque_id`),
  ADD KEY `pokemon_id` (`pokemon_id`);

ALTER TABLE `pokemon_objet`
  ADD KEY `objet_id` (`objet_id`),
  ADD KEY `pokemon_id` (`pokemon_id`);

ALTER TABLE `pokemon_type`
  ADD KEY `pokemon_id` (`pokemon_id`),
  ADD KEY `type_id` (`type_id`);

ALTER TABLE `type`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `attaque`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

ALTER TABLE `objet`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `pokemon`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

ALTER TABLE `type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

ALTER TABLE `attaque`
  ADD CONSTRAINT `attaque_effet_statut_fk` FOREIGN KEY (`effet_statut_id`) REFERENCES `effet_statut` (`id`);

ALTER TABLE `pokemon_attaque`
  ADD CONSTRAINT `pokemon_attaque_ibfk_1` FOREIGN KEY (`attaque_id`) REFERENCES `attaque` (`id`),
  ADD CONSTRAINT `pokemon_attaque_ibfk_2` FOREIGN KEY (`pokemon_id`) REFERENCES `pokemon` (`id`);

ALTER TABLE `pokemon_objet`
  ADD CONSTRAINT `pokemon_objet_ibfk_1` FOREIGN KEY (`objet_id`) REFERENCES `objet` (`id`),
  ADD CONSTRAINT `pokemon_objet_ibfk_2` FOREIGN KEY (`pokemon_id`) REFERENCES `pokemon` (`id`);

ALTER TABLE `pokemon_type`
  ADD CONSTRAINT `pokemon_type_ibfk_1` FOREIGN KEY (`pokemon_id`) REFERENCES `pokemon` (`id`),
  ADD CONSTRAINT `pokemon_type_ibfk_2` FOREIGN KEY (`type_id`) REFERENCES `type` (`id`);
COMMIT;
