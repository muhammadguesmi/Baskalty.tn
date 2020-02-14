-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  jeu. 13 fév. 2020 à 15:13
-- Version du serveur :  5.7.24
-- Version de PHP :  7.2.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `baskalty`
--

-- --------------------------------------------------------

--
-- Structure de la table `categorieevent`
--

DROP TABLE IF EXISTS `categorieevent`;
CREATE TABLE IF NOT EXISTS `categorieevent` (
  `idCategorie` int(11) NOT NULL AUTO_INCREMENT,
  `nomCategorie` varchar(255) NOT NULL,
  PRIMARY KEY (`idCategorie`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `categorieproduit`
--

DROP TABLE IF EXISTS `categorieproduit`;
CREATE TABLE IF NOT EXISTS `categorieproduit` (
  `idCategorie` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) NOT NULL,
  PRIMARY KEY (`idCategorie`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `commande`
--

DROP TABLE IF EXISTS `commande`;
CREATE TABLE IF NOT EXISTS `commande` (
  `idCommande` int(11) NOT NULL AUTO_INCREMENT,
  `idUser` int(11) NOT NULL,
  `etat` varchar(255) NOT NULL,
  PRIMARY KEY (`idCommande`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `evenement`
--

DROP TABLE IF EXISTS `evenement`;
CREATE TABLE IF NOT EXISTS `evenement` (
  `idEvenement` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) NOT NULL,
  `dateD` date NOT NULL,
  `dateF` date NOT NULL,
  `places` int(11) NOT NULL,
  `img` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `adresse` varchar(255) NOT NULL,
  `etat` int(11) NOT NULL,
  `idUtilisateur` int(11) NOT NULL,
  `idCategorie` int(11) NOT NULL,
  PRIMARY KEY (`idEvenement`),
  KEY `idUtilisateur` (`idUtilisateur`,`idCategorie`),
  KEY `idCategorie` (`idCategorie`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `lignecommand`
--

DROP TABLE IF EXISTS `lignecommand`;
CREATE TABLE IF NOT EXISTS `lignecommand` (
  `idLigne` int(11) NOT NULL AUTO_INCREMENT,
  `idCommande` int(11) NOT NULL,
  `idProduit` int(11) NOT NULL,
  `quantite` int(11) NOT NULL,
  PRIMARY KEY (`idLigne`),
  KEY `idCommande` (`idCommande`,`idProduit`),
  KEY `idProduit` (`idProduit`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `location`
--

DROP TABLE IF EXISTS `location`;
CREATE TABLE IF NOT EXISTS `location` (
  `idLocation` int(11) NOT NULL AUTO_INCREMENT,
  `idPal` int(11) NOT NULL,
  `idUtilisateur` int(11) NOT NULL,
  `dateD` date NOT NULL,
  `dateF` date NOT NULL,
  PRIMARY KEY (`idLocation`),
  KEY `idPal` (`idPal`,`idUtilisateur`),
  KEY `idUtilisateur` (`idUtilisateur`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `participation`
--

DROP TABLE IF EXISTS `participation`;
CREATE TABLE IF NOT EXISTS `participation` (
  `idParticipation` int(11) NOT NULL AUTO_INCREMENT,
  `idEvenement` int(11) NOT NULL,
  `idUtilisateur` int(11) NOT NULL,
  `numParticipant` int(11) NOT NULL,
  PRIMARY KEY (`idParticipation`),
  KEY `idEvenement` (`idEvenement`,`idUtilisateur`),
  KEY `idUtilisateur` (`idUtilisateur`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `produit`
--

DROP TABLE IF EXISTS `produit`;
CREATE TABLE IF NOT EXISTS `produit` (
  `idProduit` int(11) NOT NULL AUTO_INCREMENT,
  `nomProduit` varchar(255) NOT NULL,
  `prix` double NOT NULL,
  `quantite` int(11) NOT NULL,
  `type` int(11) NOT NULL,
  `idCategorie` int(11) NOT NULL,
  `IdUser` int(11) NOT NULL,
  PRIMARY KEY (`idProduit`),
  KEY `idCategorie` (`idCategorie`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `produital`
--

DROP TABLE IF EXISTS `produital`;
CREATE TABLE IF NOT EXISTS `produital` (
  `idPaL` int(11) NOT NULL AUTO_INCREMENT,
  `nomPaL` varchar(255) NOT NULL,
  `tarifPj` double NOT NULL,
  `etat` int(11) NOT NULL,
  `quantite` int(11) NOT NULL,
  `idStation` int(11) NOT NULL,
  PRIMARY KEY (`idPaL`),
  KEY `idStation` (`idStation`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `question`
--

DROP TABLE IF EXISTS `question`;
CREATE TABLE IF NOT EXISTS `question` (
  `idQuestion` int(11) NOT NULL AUTO_INCREMENT,
  `idUtilisateur` int(11) NOT NULL,
  `titre` varchar(255) NOT NULL,
  `champ` text NOT NULL,
  `datePub` date NOT NULL,
  PRIMARY KEY (`idQuestion`),
  KEY `idUtilisateur` (`idUtilisateur`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `ratingprod`
--

DROP TABLE IF EXISTS `ratingprod`;
CREATE TABLE IF NOT EXISTS `ratingprod` (
  `idRating` int(11) NOT NULL AUTO_INCREMENT,
  `note` int(11) NOT NULL,
  `idUtilisateur` int(11) NOT NULL,
  `idProduit` int(11) NOT NULL,
  PRIMARY KEY (`idRating`),
  KEY `idUtilisateur` (`idUtilisateur`),
  KEY `idProduit` (`idProduit`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `reclammation`
--

DROP TABLE IF EXISTS `reclammation`;
CREATE TABLE IF NOT EXISTS `reclammation` (
  `idReclamation` int(11) NOT NULL AUTO_INCREMENT,
  `idUtilisateur` int(11) NOT NULL,
  `titre` varchar(255) NOT NULL,
  `champ` text NOT NULL,
  PRIMARY KEY (`idReclamation`),
  KEY `idUtilisateur` (`idUtilisateur`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `reponsequest`
--

DROP TABLE IF EXISTS `reponsequest`;
CREATE TABLE IF NOT EXISTS `reponsequest` (
  `idReponseQ` int(11) NOT NULL,
  `idQuestion` int(11) NOT NULL,
  `idUtilisateur` int(11) NOT NULL,
  `ratingPositif` int(11) NOT NULL,
  `champ` text NOT NULL,
  `ratingNegatif` int(11) NOT NULL,
  `dateR` date NOT NULL,
  KEY `idQuestion` (`idQuestion`,`idUtilisateur`),
  KEY `idUtilisateur` (`idUtilisateur`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `reponsereclammation`
--

DROP TABLE IF EXISTS `reponsereclammation`;
CREATE TABLE IF NOT EXISTS `reponsereclammation` (
  `idReponseR` int(11) NOT NULL AUTO_INCREMENT,
  `idReclamation` int(11) NOT NULL,
  `idUtilisateur` int(11) NOT NULL,
  `champ` text NOT NULL,
  PRIMARY KEY (`idReponseR`),
  KEY `idReclamation` (`idReclamation`,`idUtilisateur`),
  KEY `idUtilisateur` (`idUtilisateur`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `station`
--

DROP TABLE IF EXISTS `station`;
CREATE TABLE IF NOT EXISTS `station` (
  `idStation` int(11) NOT NULL AUTO_INCREMENT,
  `adresse` varchar(255) NOT NULL,
  PRIMARY KEY (`idStation`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur`
--

DROP TABLE IF EXISTS `utilisateur`;
CREATE TABLE IF NOT EXISTS `utilisateur` (
  `IdUtilisateur` int(11) NOT NULL AUTO_INCREMENT,
  `nomUtilisateur` varchar(255) NOT NULL,
  `mail` varchar(255) NOT NULL,
  `mdp` varchar(255) NOT NULL,
  `nom` varchar(255) NOT NULL,
  `prenom` varchar(255) NOT NULL,
  `adresse` varchar(255) NOT NULL,
  `type` int(11) NOT NULL,
  PRIMARY KEY (`IdUtilisateur`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `evenement`
--
ALTER TABLE `evenement`
  ADD CONSTRAINT `evenement_ibfk_1` FOREIGN KEY (`idCategorie`) REFERENCES `categorieevent` (`idCategorie`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `evenement_ibfk_2` FOREIGN KEY (`idUtilisateur`) REFERENCES `utilisateur` (`IdUtilisateur`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `lignecommand`
--
ALTER TABLE `lignecommand`
  ADD CONSTRAINT `lignecommand_ibfk_1` FOREIGN KEY (`idCommande`) REFERENCES `commande` (`idCommande`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `lignecommand_ibfk_2` FOREIGN KEY (`idProduit`) REFERENCES `produit` (`idProduit`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `location`
--
ALTER TABLE `location`
  ADD CONSTRAINT `location_ibfk_1` FOREIGN KEY (`idPal`) REFERENCES `produital` (`idPaL`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `location_ibfk_2` FOREIGN KEY (`idUtilisateur`) REFERENCES `utilisateur` (`IdUtilisateur`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `participation`
--
ALTER TABLE `participation`
  ADD CONSTRAINT `participation_ibfk_1` FOREIGN KEY (`idEvenement`) REFERENCES `evenement` (`idEvenement`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `participation_ibfk_2` FOREIGN KEY (`idUtilisateur`) REFERENCES `utilisateur` (`IdUtilisateur`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `produit`
--
ALTER TABLE `produit`
  ADD CONSTRAINT `produit_ibfk_1` FOREIGN KEY (`idCategorie`) REFERENCES `categorieproduit` (`idCategorie`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `produital`
--
ALTER TABLE `produital`
  ADD CONSTRAINT `produital_ibfk_1` FOREIGN KEY (`idStation`) REFERENCES `station` (`idStation`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `question`
--
ALTER TABLE `question`
  ADD CONSTRAINT `question_ibfk_1` FOREIGN KEY (`idUtilisateur`) REFERENCES `utilisateur` (`IdUtilisateur`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `ratingprod`
--
ALTER TABLE `ratingprod`
  ADD CONSTRAINT `ratingprod_ibfk_1` FOREIGN KEY (`idProduit`) REFERENCES `produit` (`idProduit`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ratingprod_ibfk_2` FOREIGN KEY (`idUtilisateur`) REFERENCES `utilisateur` (`IdUtilisateur`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `reclammation`
--
ALTER TABLE `reclammation`
  ADD CONSTRAINT `reclammation_ibfk_1` FOREIGN KEY (`idUtilisateur`) REFERENCES `utilisateur` (`IdUtilisateur`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `reponsequest`
--
ALTER TABLE `reponsequest`
  ADD CONSTRAINT `reponsequest_ibfk_1` FOREIGN KEY (`idUtilisateur`) REFERENCES `utilisateur` (`IdUtilisateur`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `reponsequest_ibfk_2` FOREIGN KEY (`idQuestion`) REFERENCES `question` (`idQuestion`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `reponsereclammation`
--
ALTER TABLE `reponsereclammation`
  ADD CONSTRAINT `reponsereclammation_ibfk_1` FOREIGN KEY (`idReclamation`) REFERENCES `reclammation` (`idReclamation`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `reponsereclammation_ibfk_2` FOREIGN KEY (`idUtilisateur`) REFERENCES `utilisateur` (`IdUtilisateur`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
