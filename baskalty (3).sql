-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : mer. 26 fév. 2020 à 21:06
-- Version du serveur :  10.4.11-MariaDB
-- Version de PHP : 7.4.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `baskalty`
--

-- --------------------------------------------------------

--
-- Structure de la table `categoriee`
--

CREATE TABLE `categoriee` (
  `idCategorie` int(11) NOT NULL,
  `nom` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `evenement`
--

CREATE TABLE `evenement` (
  `idEvenement` int(11) NOT NULL,
  `nom` varchar(255) NOT NULL,
  `DateD` date NOT NULL DEFAULT current_timestamp(),
  `DateF` date NOT NULL DEFAULT current_timestamp(),
  `places` int(11) NOT NULL,
  `Description` varchar(255) NOT NULL,
  `Etat` varchar(255) NOT NULL,
  `idUtilisateur` int(11) NOT NULL,
  `categorie` varchar(255) NOT NULL,
  `emplacement` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `evenement`
--

INSERT INTO `evenement` (`idEvenement`, `nom`, `DateD`, `DateF`, `places`, `Description`, `Etat`, `idUtilisateur`, `categorie`, `emplacement`) VALUES
(72, 'Course', '2020-02-27', '2020-02-27', 19, 'notre club organise une course de velo en tunis le 11 h du matin \nsoyez nombreux', 'en cours', 11, 'competition', 'tunis'),
(73, 'Rondoné', '2020-02-27', '2020-02-27', 50, 'rondonée le 27 dans les aysage de gabes pour reserver appelez 25892403', 'en cours', 11, 'societal', 'gabes');

-- --------------------------------------------------------

--
-- Structure de la table `participation`
--

CREATE TABLE `participation` (
  `idEvenement` int(11) NOT NULL,
  `idUtlisateur` int(11) NOT NULL,
  `numParticipant` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `participation`
--

INSERT INTO `participation` (`idEvenement`, `idUtlisateur`, `numParticipant`) VALUES
(200, 11, 400),
(200, 11, 500),
(111, 11, 400),
(111, 11, 400),
(111, 11, 400),
(111, 11, 400),
(111, 11, 400),
(111, 11, 400),
(111, 11, 400),
(111, 11, 400),
(1234, 22, 5000),
(1234, 22, 5000),
(1234, 22, 5000),
(13, 2, 2500),
(13, 2, 2500),
(1, 2, 5),
(68, 11, 500),
(72, 11, 500);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `evenement`
--
ALTER TABLE `evenement`
  ADD PRIMARY KEY (`idEvenement`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `evenement`
--
ALTER TABLE `evenement`
  MODIFY `idEvenement` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=75;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
