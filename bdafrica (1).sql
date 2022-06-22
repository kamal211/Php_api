-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : mer. 22 juin 2022 à 10:43
-- Version du serveur : 10.4.24-MariaDB
-- Version de PHP : 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `bdafrica`
--

-- --------------------------------------------------------

--
-- Structure de la table `categorieproduct`
--

CREATE TABLE `categorieproduct` (
  `idCategorieProduit` int(11) NOT NULL,
  `nomCategorieProduit` varchar(254) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `categorieservices`
--

CREATE TABLE `categorieservices` (
  `idCategorieService` int(11) NOT NULL,
  `nomCategorieService` varchar(254) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `commande`
--

CREATE TABLE `commande` (
  `refCommande` varchar(254) NOT NULL,
  `idUser` int(111) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `adresseLivraison` varchar(254) DEFAULT NULL,
  `etat` int(11) DEFAULT NULL,
  `typeCmnd` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `detailcmndservice`
--

CREATE TABLE `detailcmndservice` (
  `idService` int(11) NOT NULL,
  `refCommande` varchar(254) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `detailcommande`
--

CREATE TABLE `detailcommande` (
  `refCommande` varchar(254) NOT NULL,
  `idProduit` int(11) NOT NULL,
  `qteCommande` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `produit`
--

CREATE TABLE `produit` (
  `idProduit` int(11) NOT NULL,
  `nomCategorieProduit` int(11) NOT NULL,
  `nom` varchar(254) DEFAULT NULL,
  `prix` decimal(8,0) DEFAULT NULL,
  `qteStock` int(11) DEFAULT NULL,
  `photo` varchar(254) DEFAULT NULL,
  `description` varchar(254) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `produit`
--

INSERT INTO `produit` (`idProduit`, `nomCategorieProduit`, `nom`, `prix`, `qteStock`, `photo`, `description`) VALUES
(1, 85, 'Tempor tempora velit', '21', 8, 'C:\\fakepath\\connexionPic.png', 'Magna sit earum dol'),
(2, 85, 'Tempor tempora velit', '21', 8, 'C:\\fakepath\\connexionPic.png', 'Magna sit earum dol');

-- --------------------------------------------------------

--
-- Structure de la table `services`
--

CREATE TABLE `services` (
  `idService` int(11) NOT NULL,
  `idCategorieService` int(11) NOT NULL,
  `nomService` varchar(254) DEFAULT NULL,
  `prix` int(11) DEFAULT NULL,
  `categorieService` int(11) DEFAULT NULL,
  `photo` int(11) DEFAULT NULL,
  `detailService` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur`
--

CREATE TABLE `utilisateur` (
  `idUser` int(111) NOT NULL,
  `nom` varchar(254) DEFAULT NULL,
  `prenom` varchar(254) DEFAULT NULL,
  `adresse` varchar(254) DEFAULT NULL,
  `email` varchar(254) DEFAULT NULL,
  `motDePasse` varchar(254) DEFAULT NULL,
  `creer_le` date DEFAULT NULL,
  `type` varchar(254) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `utilisateur`
--

INSERT INTO `utilisateur` (`idUser`, `nom`, `prenom`, `adresse`, `email`, `motDePasse`, `creer_le`, `type`) VALUES
(1, 'Veritatis qui delect', 'Ut cum adipisci null', 'Et elit ut enim non', 'vivaf@mailinator.com', 'Pa$$w0rd!', '2022-06-22', 'Id et voluptates tem'),
(5, 'Accusamus laborum es', 'Sunt qui aut et sun', 'Enim et perferendis ', 'lire@mailinator.com', 'Pa$$w0rd!', '2022-06-22', 'Accusantium quos ear');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `categorieproduct`
--
ALTER TABLE `categorieproduct`
  ADD PRIMARY KEY (`idCategorieProduit`);

--
-- Index pour la table `categorieservices`
--
ALTER TABLE `categorieservices`
  ADD PRIMARY KEY (`idCategorieService`);

--
-- Index pour la table `commande`
--
ALTER TABLE `commande`
  ADD PRIMARY KEY (`refCommande`),
  ADD KEY `idUser` (`idUser`);

--
-- Index pour la table `produit`
--
ALTER TABLE `produit`
  ADD PRIMARY KEY (`idProduit`),
  ADD KEY `idCategorieProduit` (`nomCategorieProduit`);

--
-- Index pour la table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`idService`),
  ADD KEY `FK_association4` (`idCategorieService`);

--
-- Index pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  ADD PRIMARY KEY (`idUser`),
  ADD UNIQUE KEY `email` (`email`,`motDePasse`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `categorieproduct`
--
ALTER TABLE `categorieproduct`
  MODIFY `idCategorieProduit` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `categorieservices`
--
ALTER TABLE `categorieservices`
  MODIFY `idCategorieService` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `produit`
--
ALTER TABLE `produit`
  MODIFY `idProduit` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `services`
--
ALTER TABLE `services`
  MODIFY `idService` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  MODIFY `idUser` int(111) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
