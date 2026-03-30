-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : lun. 30 mars 2026 à 14:59
-- Version du serveur : 9.1.0
-- Version de PHP : 8.4.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `agoraorm`
--

-- --------------------------------------------------------

--
-- Structure de la table `cat_tournoi`
--

DROP TABLE IF EXISTS `cat_tournoi`;
CREATE TABLE IF NOT EXISTS `cat_tournoi` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `cat_tournoi`
--

INSERT INTO `cat_tournoi` (`id`, `nom`) VALUES
(1, 'Tournoi Local'),
(2, 'Championnat National'),
(3, 'Amical'),
(4, 'E-Sport Pro'),
(5, 'Caritatif');

-- --------------------------------------------------------

--
-- Structure de la table `doctrine_migration_versions`
--

DROP TABLE IF EXISTS `doctrine_migration_versions`;
CREATE TABLE IF NOT EXISTS `doctrine_migration_versions` (
  `version` varchar(191) COLLATE utf8mb3_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `genre`
--

DROP TABLE IF EXISTS `genre`;
CREATE TABLE IF NOT EXISTS `genre` (
  `id` int NOT NULL AUTO_INCREMENT,
  `lib_genre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `genre`
--

INSERT INTO `genre` (`id`, `lib_genre`) VALUES
(1, 'Action'),
(2, 'Aventure'),
(3, 'RPG'),
(4, 'Course'),
(5, 'Sport'),
(6, 'FPS'),
(7, 'Stratégie'),
(8, 'Simulation');

-- --------------------------------------------------------

--
-- Structure de la table `jeu_video`
--

DROP TABLE IF EXISTS `jeu_video`;
CREATE TABLE IF NOT EXISTS `jeu_video` (
  `ref_jeu` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `genre_id` int DEFAULT NULL,
  `pegi_id` int DEFAULT NULL,
  `plateforme_id` int DEFAULT NULL,
  `marque_id` int DEFAULT NULL,
  `nom` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prix` double NOT NULL,
  `date_parution` date NOT NULL,
  PRIMARY KEY (`ref_jeu`),
  KEY `IDX_4E22D9D44296D31F` (`genre_id`),
  KEY `IDX_4E22D9D4DD019E4A` (`pegi_id`),
  KEY `IDX_4E22D9D4391E226B` (`plateforme_id`),
  KEY `IDX_4E22D9D44827B9B2` (`marque_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `jeu_video`
--

INSERT INTO `jeu_video` (`ref_jeu`, `genre_id`, `pegi_id`, `plateforme_id`, `marque_id`, `nom`, `prix`, `date_parution`) VALUES
('AC_MIRAGE', 2, 4, 3, 4, 'Assassin\'s Creed Mirage', 49.99, '2023-10-05'),
('COD_MW3', 6, 5, 2, 5, 'Call of Duty: Modern Warfare III', 79.99, '2023-11-10'),
('FF16', 3, 4, 2, 7, 'Final Fantasy XVI', 69.99, '2023-06-22'),
('FIFA24', 5, 1, 2, 5, 'EA Sports FC 24', 59.99, '2023-09-29'),
('MK8DX', 4, 1, 4, 1, 'Mario Kart 8 Deluxe', 49.99, '2017-04-28'),
('SF6', 1, 3, 1, 6, 'Street Fighter 6', 59.99, '2023-06-02'),
('ZELDA_TOTK', 2, 3, 4, 1, 'The Legend of Zelda: Tears of the Kingdom', 69.99, '2023-05-12');

-- --------------------------------------------------------

--
-- Structure de la table `marque`
--

DROP TABLE IF EXISTS `marque`;
CREATE TABLE IF NOT EXISTS `marque` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nom_marque` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `marque`
--

INSERT INTO `marque` (`id`, `nom_marque`) VALUES
(1, 'Nintendo'),
(2, 'Sony'),
(3, 'Microsoft'),
(4, 'Ubisoft'),
(5, 'Electronic Arts'),
(6, 'Capcom'),
(7, 'Square Enix');

-- --------------------------------------------------------

--
-- Structure de la table `membre`
--

DROP TABLE IF EXISTS `membre`;
CREATE TABLE IF NOT EXISTS `membre` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nom_membre` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prenom_membre` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tel_membre` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mail_membre` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rue_membre` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cp_membre` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ville_membre` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_IDENTIFIER_USERNAME` (`username`)
) ;

--
-- Déchargement des données de la table `membre`
--

INSERT INTO `membre` (`id`, `username`, `roles`, `password`, `nom_membre`, `prenom_membre`, `tel_membre`, `mail_membre`, `rue_membre`, `cp_membre`, `ville_membre`) VALUES
(1, 'admin', '[\"ROLE_ADMIN\"]', '$2y$13$0RQ3aMPWAnpI4bsqm/AopudrkVMhjFtvd0msx5zbcoBxync1vw8L6', 'Admin', 'System', '0123456789', 'admin@agora.fr', '1 rue de l\'Admin', '75000', 'Paris'),
(2, 'user', '[\"ROLE_USER\"]', '$2y$10$TGPM06FymtTuk68bZSljsexyUWKM7odDC6KFba33sfwL9A8xLrk51y', 'User', 'Lambda', '0987654321', 'user@agora.fr', '2 rue du User', '69000', 'Lyon');

-- --------------------------------------------------------

--
-- Structure de la table `participant`
--

DROP TABLE IF EXISTS `participant`;
CREATE TABLE IF NOT EXISTS `participant` (
  `id` int NOT NULL AUTO_INCREMENT,
  `prenom` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nom` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telephone` varchar(14) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `participant`
--

INSERT INTO `participant` (`id`, `prenom`, `nom`, `telephone`, `email`) VALUES
(1, 'Jean', 'Dupont', '0601020304', 'jean.dupont@email.com'),
(2, 'Marie', 'Curie', '0605060708', 'marie.curie@email.com'),
(3, 'Pierre', 'Martin', '0611121314', 'pierre.martin@email.com'),
(4, 'Sophie', 'Durand', '0615161718', 'sophie.durand@email.com'),
(5, 'Lucas', 'Bernard', '0621222324', 'lucas.bernard@email.com'),
(6, 'Emma', 'Petit', '0625262728', 'emma.petit@email.com'),
(7, 'Thomas', 'Robert', '0631323334', 'thomas.robert@email.com'),
(8, 'Lea', 'Richard', '0635363738', 'lea.richard@email.com');

-- --------------------------------------------------------

--
-- Structure de la table `pegi`
--

DROP TABLE IF EXISTS `pegi`;
CREATE TABLE IF NOT EXISTS `pegi` (
  `id` int NOT NULL AUTO_INCREMENT,
  `age_limite` int NOT NULL,
  `desc_pegi` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `pegi`
--

INSERT INTO `pegi` (`id`, `age_limite`, `desc_pegi`) VALUES
(1, 3, 'Convient à toutes les classes d\'âge.'),
(2, 7, 'Déconseillé aux moins de 7 ans.'),
(3, 12, 'Déconseillé aux moins de 12 ans.'),
(4, 16, 'Déconseillé aux moins de 16 ans.'),
(5, 18, 'Réservé aux adultes.');

-- --------------------------------------------------------

--
-- Structure de la table `plateformes`
--

DROP TABLE IF EXISTS `plateformes`;
CREATE TABLE IF NOT EXISTS `plateformes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `lib_plateforme` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `plateformes`
--

INSERT INTO `plateformes` (`id`, `lib_plateforme`) VALUES
(1, 'PC'),
(2, 'PlayStation 5'),
(3, 'Xbox Series X'),
(4, 'Nintendo Switch'),
(5, 'PlayStation 4');

-- --------------------------------------------------------

--
-- Structure de la table `tournoi`
--

DROP TABLE IF EXISTS `tournoi`;
CREATE TABLE IF NOT EXISTS `tournoi` (
  `id` int NOT NULL AUTO_INCREMENT,
  `plateforme_id` int NOT NULL,
  `cat_tournoi_id` int DEFAULT NULL,
  `nom` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_debut` datetime NOT NULL,
  `date_fin` datetime DEFAULT NULL,
  `nb_participants` int DEFAULT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `IDX_18AFD9DF391E226B` (`plateforme_id`),
  KEY `IDX_18AFD9DF2BE55CFB` (`cat_tournoi_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `tournoi`
--

INSERT INTO `tournoi` (`id`, `plateforme_id`, `cat_tournoi_id`, `nom`, `date_debut`, `date_fin`, `nb_participants`, `description`) VALUES
(1, 4, 1, 'Tournoi Mario Kart 2025', '2025-01-15 14:00:00', '2025-01-15 18:00:00', 32, 'Grand tournoi de rentrée sur Mario Kart 8 Deluxe.'),
(2, 2, 2, 'Championnat FIFA 25', '2025-02-10 10:00:00', '2025-02-12 20:00:00', 64, 'Championnat régional qualificatif.'),
(3, 1, 3, 'Soirée Street Fighter', '2025-03-05 19:00:00', '2025-03-05 23:00:00', 16, 'Tournoi amical pour le fun.'),
(4, 4, 5, 'Marathon Zelda', '2025-04-01 08:00:00', '2025-04-03 08:00:00', 10, 'Speedrun caritatif sur TOTK.'),
(5, 1, 4, 'League of Legends Open', '2025-05-20 09:00:00', '2025-05-21 22:00:00', 100, 'Tournoi ouvert à tous les rangs.'),
(6, 1, 2, 'tournois agora', '2025-12-11 17:24:00', '2025-12-11 17:30:00', NULL, 'torunois agora'),
(7, 1, 2, 'tournois test', '2025-12-11 17:27:00', '2025-12-11 17:52:00', NULL, 'tournois');

-- --------------------------------------------------------

--
-- Structure de la table `tournoi_participant`
--

DROP TABLE IF EXISTS `tournoi_participant`;
CREATE TABLE IF NOT EXISTS `tournoi_participant` (
  `tournoi_id` int NOT NULL,
  `participant_id` int NOT NULL,
  PRIMARY KEY (`tournoi_id`,`participant_id`),
  KEY `IDX_9C531479F607770A` (`tournoi_id`),
  KEY `IDX_9C5314799D1C3019` (`participant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `tournoi_participant`
--

INSERT INTO `tournoi_participant` (`tournoi_id`, `participant_id`) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(2, 5),
(2, 6),
(2, 7),
(2, 8),
(3, 1),
(3, 5),
(5, 2),
(5, 4),
(5, 6),
(5, 8),
(6, 1);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `jeu_video`
--
ALTER TABLE `jeu_video`
  ADD CONSTRAINT `FK_4E22D9D4391E226B` FOREIGN KEY (`plateforme_id`) REFERENCES `plateformes` (`id`),
  ADD CONSTRAINT `FK_4E22D9D44296D31F` FOREIGN KEY (`genre_id`) REFERENCES `genre` (`id`),
  ADD CONSTRAINT `FK_4E22D9D44827B9B2` FOREIGN KEY (`marque_id`) REFERENCES `marque` (`id`),
  ADD CONSTRAINT `FK_4E22D9D4DD019E4A` FOREIGN KEY (`pegi_id`) REFERENCES `pegi` (`id`);

--
-- Contraintes pour la table `tournoi`
--
ALTER TABLE `tournoi`
  ADD CONSTRAINT `FK_18AFD9DF2BE55CFB` FOREIGN KEY (`cat_tournoi_id`) REFERENCES `cat_tournoi` (`id`),
  ADD CONSTRAINT `FK_18AFD9DF391E226B` FOREIGN KEY (`plateforme_id`) REFERENCES `plateformes` (`id`);

--
-- Contraintes pour la table `tournoi_participant`
--
ALTER TABLE `tournoi_participant`
  ADD CONSTRAINT `FK_9C5314799D1C3019` FOREIGN KEY (`participant_id`) REFERENCES `participant` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_9C531479F607770A` FOREIGN KEY (`tournoi_id`) REFERENCES `tournoi` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
