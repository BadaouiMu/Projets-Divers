-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 15, 2023 at 10:05 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `rateapp`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id_cat` int(11) NOT NULL,
  `categ_name` varchar(32) NOT NULL,
  `desc_cat` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id_cat`, `categ_name`, `desc_cat`) VALUES
(1, 'telecom', 'Concerne les services qui consistent, en tout ou en partie, en la transmission et l\'acheminement de signaux sur le reseau public de telecommunications par des procedes de telecommunications, a l\'exception de la radiodiffusion et de la television'),
(2, 'Restauration', 'Concerne les operations de service des plats (dressage des tables, accueil des clients, prise de commandes)'),
(3, 'Voyage', 'Concerne les activites proposees a des voyageurs au cours d\'un voyage ou d\'un sejour et en dehors de leur environnement habituel a des fins de loisirs'),
(4, 'Sante', 'Avis en matiere de sante et de soins infirmiers aux personnes, a des familles et des groupes a domicile et dans la collectivite, avec pour objectif la prevention de la maladie et la promotion et le maintien de la sante');

-- --------------------------------------------------------

--
-- Table structure for table `rating`
--

CREATE TABLE `rating` (
  `id_user` int(32) NOT NULL,
  `id_cat` int(20) NOT NULL,
  `id_serv` int(20) NOT NULL,
  `comment` text NOT NULL,
  `rate` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `rating`
--

INSERT INTO `rating` (`id_user`, `id_cat`, `id_serv`, `comment`, `rate`) VALUES
(1, 1, 1, 'Bon', 2.5),
(3, 1, 1, 'Service apres vente NULL !!!', 0.5),
(4, 1, 1, 'Bon', 3),
(4, 1, 2, 'Bon', 0);

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE `services` (
  `id_cat` int(32) NOT NULL,
  `id_serv` int(20) NOT NULL,
  `service_name` text NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `services`
--

INSERT INTO `services` (`id_cat`, `id_serv`, `service_name`, `description`) VALUES
(1, 1, 'Maroc Telecom', 'est une entreprise de telecommunications fondee en 1998.Privatisee par le Maroc en 2001, elle est introduite en 2004 a la bourse Euronext et a la Bourse de Casablanca. Depuis 2014, son principal actionnaire est l\'operateur emirati Etisalat.Maroc Telecom est le premier operateur telecoms au Maroc et est presente dans une dizaine de pays d\'Afrique francophone ou elle realise 40 % de son chiffre d\'affaires'),
(1, 2, 'Inwi', 'inwi est un operateur global de telecommunications au Maroc qui opere sur les segments de la telephonie mobile, la telephonie fixe et Internet.'),
(1, 3, 'Orange', 'Anciennement Meditel , est l\'un des trois principaux operateurs de telecommunications agrees au Maroc. L\'operateur multi services propose des offres de telephonie mobile, fixe, de cybersecurite et de mobile money.Cree en 1999, il est le deuxieme operateur de telephonie mobile au Maroc.En decembre 2016, Meditel devient Orange Maroc.'),
(2, 1, 'McDonald\'s', 'McDonald\'s Corporation est une chaine de restauration rapide mondiale. Elle est developpee par l\'homme d\'affaires americain Ray Kroc en 1952 apres qu\'il a achete les droits d\'une petite chaine de hamburger exploitee a partir de 1940 par Richard et Maurice McDonald.'),
(2, 2, 'Burger King', 'Burger King, parfois abrege en son acronyme BK, est une grande chaine de restauration rapide americaine qui compte plus de 13 000 lieux de vente dans 100 pays, dont les deux tiers aux Etats-Unis, et beaucoup au Canada. Ses principaux concurrents sont McDonald\'s, Quick.'),
(3, 1, 'Supratours', 'Supratours est une filiale du Groupe ONCF, exploitant des lignes d\'autocars longue distance au Maroc. La quasi-exclusivite de son reseau est organise autour de la ville de Marrakech.'),
(3, 2, 'Compagnie de transports au Maroc', 'La Compagnie de transports au Maroc, ou CTM, est une compagnie marocaine de transport routier cree en 1919. Elle opere dans les services de transport de voyageurs et de messagerie. La compagnie est membre du reseau Eurolines.'),
(4, 1, 'Paracetamol', 'Le paracetamol, aussi appele acetaminophene, est un compose chimique utilise comme antalgique et antipyretique, qui figure parmi les medicaments les plus communs, utilises et prescrits au monde.');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id_user` int(32) NOT NULL,
  `username` varchar(32) NOT NULL,
  `password` varchar(32) NOT NULL,
  `priv` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id_user`, `username`, `password`, `priv`) VALUES
(1, 'User1', '1', 1),
(2, 'User2', '2', 0),
(3, 'User3', '3', 1),
(4, 'User4', '4', 0),
(5, 'User5', '5', 0),
(6, 'adminn', 'admin', 1),
(7, 'admin', 'a', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id_cat`);

--
-- Indexes for table `rating`
--
ALTER TABLE `rating`
  ADD PRIMARY KEY (`id_user`,`id_cat`,`id_serv`),
  ADD KEY `id_user` (`id_user`),
  ADD KEY `id_cat` (`id_cat`),
  ADD KEY `id_serv` (`id_serv`);

--
-- Indexes for table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id_cat`,`id_serv`),
  ADD KEY `id_cat` (`id_cat`),
  ADD KEY `id_serv` (`id_serv`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `rating`
--
ALTER TABLE `rating`
  ADD CONSTRAINT `rating_ibfk_1` FOREIGN KEY (`id_cat`) REFERENCES `categories` (`id_cat`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `rating_ibfk_2` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `rating_ibfk_3` FOREIGN KEY (`id_serv`) REFERENCES `services` (`id_serv`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `services`
--
ALTER TABLE `services`
  ADD CONSTRAINT `services_ibfk_1` FOREIGN KEY (`id_cat`) REFERENCES `categories` (`id_cat`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
