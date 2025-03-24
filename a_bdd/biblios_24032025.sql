-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : lun. 24 mars 2025 à 10:41
-- Version du serveur : 8.4.3
-- Version de PHP : 8.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `biblios`
--

-- --------------------------------------------------------

--
-- Structure de la table `author`
--

DROP TABLE IF EXISTS `author`;
CREATE TABLE IF NOT EXISTS `author` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_of_birth` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `date_of_death` datetime DEFAULT NULL COMMENT '(DC2Type:datetime_immutable)',
  `nationality` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `author`
--

INSERT INTO `author` (`id`, `name`, `date_of_birth`, `date_of_death`, `nationality`) VALUES
(1, 'Victor Hugo', '1802-02-26 00:00:00', '1885-05-22 00:00:00', 'FR'),
(2, 'Albert Camus', '1913-11-07 00:00:00', '1960-01-04 00:00:00', 'FR'),
(3, 'Marcel Proust', '1871-07-10 00:00:00', '1922-11-18 00:00:00', 'FR'),
(4, 'Émile Zola', '1840-04-02 00:00:00', '1902-09-29 00:00:00', 'FR'),
(5, 'Simone de Beauvoir', '1908-01-09 00:00:00', '1986-04-14 00:00:00', 'FR'),
(6, 'Jean-Paul Sartre', '1905-06-21 00:00:00', '1980-04-15 00:00:00', 'FR'),
(7, 'Antoine de Saint-Exupéry', '1900-06-29 00:00:00', '1944-07-31 00:00:00', 'FR'),
(8, 'Charles Baudelaire', '1821-04-09 00:00:00', '1867-08-31 00:00:00', 'FR'),
(9, 'William Shakespeare', '1564-04-23 00:00:00', '1616-04-23 00:00:00', 'GB'),
(10, 'Mark Twain', '1835-11-30 00:00:00', '1910-04-21 00:00:00', 'US'),
(11, 'J.K. Rowling', '1965-07-31 00:00:00', NULL, 'GB'),
(12, 'George Orwell', '1903-06-25 00:00:00', '1950-01-21 00:00:00', 'GB'),
(13, 'F. Scott Fitzgerald', '1896-09-24 00:00:00', '1940-12-21 00:00:00', 'US'),
(14, 'Gabriel García Márquez', '1927-03-06 00:00:00', '2014-04-17 00:00:00', 'CO'),
(15, 'Haruki Murakami', '1949-01-12 00:00:00', NULL, 'JP'),
(16, 'Stendhal', '1783-01-23 00:00:00', '1843-03-23 00:00:00', 'FR');

-- --------------------------------------------------------

--
-- Structure de la table `author_book`
--

DROP TABLE IF EXISTS `author_book`;
CREATE TABLE IF NOT EXISTS `author_book` (
  `author_id` int NOT NULL,
  `book_id` int NOT NULL,
  PRIMARY KEY (`author_id`,`book_id`),
  KEY `IDX_2F0A2BEEF675F31B` (`author_id`),
  KEY `IDX_2F0A2BEE16A2B381` (`book_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `author_book`
--

INSERT INTO `author_book` (`author_id`, `book_id`) VALUES
(1, 1),
(1, 7),
(2, 2),
(3, 3),
(7, 4),
(8, 6),
(12, 5),
(16, 8);

-- --------------------------------------------------------

--
-- Structure de la table `book`
--

DROP TABLE IF EXISTS `book`;
CREATE TABLE IF NOT EXISTS `book` (
  `id` int NOT NULL AUTO_INCREMENT,
  `editor_id` int DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `isbn` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cover` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `edited_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `plot` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `page_number` int NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_CBE5A3316995AC4C` (`editor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `book`
--

INSERT INTO `book` (`id`, `editor_id`, `title`, `isbn`, `cover`, `edited_at`, `plot`, `page_number`, `status`) VALUES
(1, 1, 'Les Misérables', '9782253096344', 'les-miserables.jpg', '1862-04-15 00:00:00', 'L\'histoire de Jean Valjean, un ancien forçat qui devient maire d\'une ville française sous une nouvelle identité.', 1232, 'available'),
(2, 2, 'L\'Étranger', '9782070360024', 'etranger.jpg', '1942-05-19 00:00:00', 'L\'histoire de Meursault, un Français d\'Algérie qui tue un Arabe sur une plage.', 184, 'available'),
(3, 3, 'À la recherche du temps perdu', '9782070754921', 'temps-perdu.jpg', '1913-11-14 00:00:00', 'Roman-fleuve qui explore les thèmes du temps, de la mémoire et de l\'expérience.', 3031, 'available'),
(4, 7, 'Le Petit Prince', '9782070612758', 'petit-prince.jpg', '1943-04-06 00:00:00', 'Un pilote échoué dans le désert rencontre un jeune prince venu d\'une autre planète.', 96, 'borrowed'),
(5, 5, '1984', '9782070368228', '1984.jpg', '1949-06-08 00:00:00', 'Un monde totalitaire où la liberté et la vérité n\'existent plus, et où Big Brother surveille tout.', 438, 'available'),
(6, 7, 'Les Fleurs du mal', '9782253009115', 'fleurs-du-mal.jpg', '1857-06-25 00:00:00', 'Recueil de poèmes qui explore la dualité de l\'âme humaine et la beauté du mal.', 305, 'available'),
(7, 2, 'Les Contemplations', '9782253009115', 'contemplations.jpg', '1856-10-20 00:00:00', 'Recueil de poèmes de Victor Hugo qui explore la nature, l\'amour, la mort et la religion.', 352, 'borrowed'),
(8, 2, 'Le Rouge et le Noir', '9782253006206', 'rouge-noir.jpg', '1830-11-13 00:00:00', 'L\'ambitieux Jolien Sorel, miné par sa passion pour Mme de Rénal, échoue dans son rêve de gloire et se détruit', 576, 'available');

-- --------------------------------------------------------

--
-- Structure de la table `comment`
--

DROP TABLE IF EXISTS `comment`;
CREATE TABLE IF NOT EXISTS `comment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `book_id` int DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `published_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_9474526C16A2B381` (`book_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `editor`
--

DROP TABLE IF EXISTS `editor`;
CREATE TABLE IF NOT EXISTS `editor` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `editor`
--

INSERT INTO `editor` (`id`, `name`) VALUES
(1, 'Gallimard'),
(2, 'Flammarion'),
(3, 'Hachette'),
(4, 'Actes Sud'),
(5, 'Robert Laffont'),
(6, 'Le Livre de Poche'),
(7, 'Larousse');

-- --------------------------------------------------------

--
-- Structure de la table `messenger_messages`
--

DROP TABLE IF EXISTS `messenger_messages`;
CREATE TABLE IF NOT EXISTS `messenger_messages` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `body` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `headers` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue_name` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `available_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `delivered_at` datetime DEFAULT NULL COMMENT '(DC2Type:datetime_immutable)',
  PRIMARY KEY (`id`),
  KEY `IDX_75EA56E0FB7336F0` (`queue_name`),
  KEY `IDX_75EA56E0E3BD61CE` (`available_at`),
  KEY `IDX_75EA56E016BA31DB` (`delivered_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `author_book`
--
ALTER TABLE `author_book`
  ADD CONSTRAINT `FK_2F0A2BEE16A2B381` FOREIGN KEY (`book_id`) REFERENCES `book` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_2F0A2BEEF675F31B` FOREIGN KEY (`author_id`) REFERENCES `author` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `book`
--
ALTER TABLE `book`
  ADD CONSTRAINT `FK_CBE5A3316995AC4C` FOREIGN KEY (`editor_id`) REFERENCES `editor` (`id`);

--
-- Contraintes pour la table `comment`
--
ALTER TABLE `comment`
  ADD CONSTRAINT `FK_9474526C16A2B381` FOREIGN KEY (`book_id`) REFERENCES `book` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
