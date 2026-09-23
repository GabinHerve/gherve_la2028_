-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3307
-- Généré le : lun. 21 sep. 2026 à 09:55
-- Version du serveur : 11.4.9-MariaDB
-- Version de PHP : 8.3.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `la2028`
--

-- --------------------------------------------------------

--
-- Structure de la table `athlete`
--

DROP TABLE IF EXISTS `athlete`;
CREATE TABLE IF NOT EXISTS `athlete` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(50) NOT NULL,
  `prenom` varchar(50) NOT NULL,
  `pays_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `sport_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_ath_pays` (`pays_id`),
  KEY `fk_ath_sport` (`sport_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `athlete`
--

INSERT INTO `athlete` (`id`, `nom`, `prenom`, `pays_id`, `date`, `sport_id`) VALUES
(1, 'Rinner', 'Teddy', 1, '1989-04-07', 1),
(2, 'Biles', 'Simone', 2, '1997-03-14', 2),
(3, 'Marchand', 'Léon', 1, '2002-05-17', 6),
(4, 'Evenepoel', 'Remco', 7, '2000-01-25', 9),
(5, 'Lyles', 'Noah', 2, '1997-07-18', 7),
(6, 'Ledecky', 'Katie', 2, '1997-03-17', 6),
(7, 'Duplantis', 'Armand', 23, '1999-11-10', 7),
(8, 'Hassan', 'Sifan', 24, '1993-01-01', 7),
(9, 'Djokovic', 'Novak', 22, '1987-05-22', 16);

-- --------------------------------------------------------

--
-- Structure de la table `epreuve`
--

DROP TABLE IF EXISTS `epreuve`;
CREATE TABLE IF NOT EXISTS `epreuve` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `libelle` varchar(100) NOT NULL,
  `sport_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_ath_sport_id` (`sport_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `epreuve`
--

INSERT INTO `epreuve` (`id`, `libelle`, `sport_id`) VALUES
(1, '200m brasse', 6),
(2, '200m papillon', 6),
(3, '200m 4 nages', 6),
(4, '400m 4 nages', 6),
(5, 'Saut en longueur', 7),
(6, 'Triple saut', 7),
(7, 'Saut en hauteur', 7),
(8, 'Saut à la perche', 7),
(9, 'Marathon', 7);

-- --------------------------------------------------------

--
-- Structure de la table `pays`
--

DROP TABLE IF EXISTS `pays`;
CREATE TABLE IF NOT EXISTS `pays` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `pays`
--

INSERT INTO `pays` (`id`, `nom`) VALUES
(1, 'France'),
(2, 'Etats-Unis'),
(3, 'Royaume-Uni'),
(4, 'Espagne'),
(5, 'Allemagne'),
(6, 'Suisse'),
(7, 'Belgique'),
(8, 'Chine'),
(9, 'Japon'),
(10, 'Canada'),
(11, 'Brésil'),
(12, 'Argentine'),
(13, 'Irlande'),
(14, 'Islande'),
(15, 'Italie'),
(16, 'Lituanie'),
(17, 'Luxembourg'),
(18, 'Maroc'),
(19, 'Algérie'),
(20, 'Portugal'),
(21, 'Roumanie'),
(22, 'Serbie'),
(23, 'Suède'),
(24, 'Pays-Bas');

-- --------------------------------------------------------

--
-- Structure de la table `sport`
--

DROP TABLE IF EXISTS `sport`;
CREATE TABLE IF NOT EXISTS `sport` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `libelle` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `sport`
--

INSERT INTO `sport` (`id`, `libelle`) VALUES
(1, 'Judo'),
(2, 'Gymnastique'),
(3, 'Boxe'),
(4, 'Lutte'),
(5, 'Taekwondo'),
(6, 'Natation'),
(7, 'Athlétisme'),
(8, 'Triathlon'),
(9, 'Cyclisme'),
(10, 'BMX'),
(11, 'Equitation'),
(12, 'Canoë-kayak'),
(13, 'Voile'),
(14, 'Surf'),
(15, 'Skateboard'),
(16, 'Tennis'),
(17, 'Tennis de table'),
(18, 'Badminton'),
(19, 'Golf'),
(20, 'Escrime'),
(21, 'Tir'),
(22, 'Escalade');

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `athlete`
--
ALTER TABLE `athlete`
  ADD CONSTRAINT `fk_ath_pays` FOREIGN KEY (`pays_id`) REFERENCES `pays` (`id`),
  ADD CONSTRAINT `fk_ath_sport` FOREIGN KEY (`sport_id`) REFERENCES `sport` (`id`);

--
-- Contraintes pour la table `epreuve`
--
ALTER TABLE `epreuve`
  ADD CONSTRAINT `fk_ath_sport_id` FOREIGN KEY (`sport_id`) REFERENCES `sport` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
