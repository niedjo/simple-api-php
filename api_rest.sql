-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : dim. 25 août 2024 à 13:44
-- Version du serveur : 5.7.36
-- Version de PHP : 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `4521270_demo`
--

-- --------------------------------------------------------

--
-- Structure de la table `categories`
--

DROP TABLE IF EXISTS `categories`;
CREATE TABLE IF NOT EXISTS `categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(256) NOT NULL,
  `description` text NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `categories`
--

INSERT INTO `categories` (`id`, `nom`, `description`, `created_at`, `updated_at`) VALUES
(1, 'Mode', 'Catégorie pour tout ce qui est en rapport avec la mode.', '2019-06-01 00:32:07', '2019-08-30 14:34:33'),
(2, 'Electronique', 'Gadgets, drones et plus.', '2018-06-03 02:34:11', '2019-01-30 15:34:33'),
(3, 'Moteurs', 'Sports mécaniques', '2018-06-01 10:33:07', '2019-07-30 14:34:54'),
(5, 'Films', 'Produits cinématographiques.', '2018-06-01 10:33:07', '2018-01-08 11:27:26'),
(6, 'Livres', 'E-books, livres audio...', '2018-06-01 10:33:07', '2019-01-08 11:27:47'),
(13, 'Sports', 'Articles de sport.', '2018-01-09 02:24:24', '2019-01-08 23:24:24');

-- --------------------------------------------------------

--
-- Structure de la table `produits`
--

DROP TABLE IF EXISTS `produits`;
CREATE TABLE IF NOT EXISTS `produits` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(32) NOT NULL,
  `description` text NOT NULL,
  `prix` decimal(10,0) NOT NULL,
  `categories_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `categories_id` (`categories_id`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `produits`
--

INSERT INTO `produits` (`id`, `nom`, `description`, `prix`, `categories_id`, `created_at`, `updated_at`) VALUES
(65, 'Samsung Galaxy S 10', 'Le dernier né des téléphones Samsung', '899', 2, '2019-09-07 21:19:09', '2019-09-07 18:19:09'),
(66, 'Habemus Piratam', 'Le livre à propos d\'un pirate informatique', '13', 6, '2019-09-07 21:21:11', '2019-09-07 18:21:11');

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `produits`
--
ALTER TABLE `produits`
  ADD CONSTRAINT `produits_ibfk_1` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
