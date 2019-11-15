-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  ven. 15 nov. 2019 à 13:38
-- Version du serveur :  5.7.26
-- Version de PHP :  7.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `projetweb`
--

DELIMITER $$
--
-- Procédures
--
DROP PROCEDURE IF EXISTS `addcom`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `addcom` (IN `membre` INT, IN `photo` INT, IN `conten` VARCHAR(255))  NO SQL
INSERT INTO commentaire (id_membre,id_photo,contenu)
VALUES (membre,photo,conten)$$

DROP PROCEDURE IF EXISTS `Addlike`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Addlike` (IN `idphoto` INT)  NO SQL
UPDATE photo SET nbr_like=nbr_like+1 WHERE id=idphoto$$

DROP PROCEDURE IF EXISTS `addPhoto`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `addPhoto` (IN `event` INT, IN `photo` VARCHAR(50))  NO SQL
INSERT INTO photo (id_event,url,nbr_like)
VALUES (event,photo,0)$$

DROP PROCEDURE IF EXISTS `addproduit`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `addproduit` (IN `nom` VARCHAR(50), IN `description` VARCHAR(50), IN `prix` FLOAT, IN `categorie` VARCHAR(50), IN `url` VARCHAR(50))  NO SQL
INSERT INTO boutique (nom,description,prix,categorie,url)
VALUES (nom,description,prix,categorie,url)$$

DROP PROCEDURE IF EXISTS `addusers`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `addusers` (IN `nom` VARCHAR(20), IN `prenom` VARCHAR(20), IN `localisation` VARCHAR(50), IN `adresse_mail` VARCHAR(30), IN `mdp` VARCHAR(20))  NO SQL
INSERT INTO membre (nom,prenom,localisation,adresse_mail,mdp,role)
 VALUES (nom,prenom,localisation,adresse_mail,mdp,1)$$

DROP PROCEDURE IF EXISTS `allactivites`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `allactivites` ()  NO SQL
SELECT * FROM activites$$

DROP PROCEDURE IF EXISTS `allevenement`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `allevenement` ()  NO SQL
SELECT * FROM evenement$$

DROP PROCEDURE IF EXISTS `allProducts`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `allProducts` (IN `categori` VARCHAR(50))  NO SQL
SELECT * FROM boutique WHERE categorie=categori$$

DROP PROCEDURE IF EXISTS `conflike`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `conflike` (IN `id` INT, IN `photo` INT)  NO SQL
SELECT id_photo FROM likeconfirm WHERE id_membre=id AND id_photo=photo$$

DROP PROCEDURE IF EXISTS `delArt`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `delArt` (IN `article` INT)  NO SQL
DELETE FROM boutique WHERE id=article$$

DROP PROCEDURE IF EXISTS `delcom`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `delcom` (IN `com` INT)  NO SQL
DELETE FROM commentaire WHERE idcom=com$$

DROP PROCEDURE IF EXISTS `delimg`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `delimg` (IN `photo` INT)  NO SQL
DELETE FROM photo WHERE id=photo$$

DROP PROCEDURE IF EXISTS `desactivite`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `desactivite` (IN `membre` INT, IN `event` INT)  NO SQL
DELETE FROM inscription_activite WHERE id_membre=membre AND id_activite=event$$

DROP PROCEDURE IF EXISTS `desevent`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `desevent` (IN `membre` INT, IN `event` INT)  NO SQL
DELETE FROM inscription_event WHERE id_membre=membre AND id_evenement=event$$

DROP PROCEDURE IF EXISTS `inscactivite`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `inscactivite` (IN `membre` INT, IN `activite` INT)  NO SQL
INSERT INTO inscription_activite (id_membre,id_activite)
VALUES (membre,activite)$$

DROP PROCEDURE IF EXISTS `inscevent`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `inscevent` (IN `membre` INT, IN `evenement` INT)  NO SQL
INSERT INTO inscription_event (id_membre,id_evenement)
VALUES (membre,evenement)$$

DROP PROCEDURE IF EXISTS `likeconfirmadd`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `likeconfirmadd` (IN `idmembre` INT, IN `photo` INT)  NO SQL
INSERT INTO likeconfirm (id_membre,id_photo)
VALUES (idmembre,photo)$$

DROP PROCEDURE IF EXISTS `likeconfirmrem`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `likeconfirmrem` (IN `membre` INT, IN `idphoto` INT)  NO SQL
DELETE FROM likeconfirm WHERE id_membre=membre AND id_photo=idphoto$$

DROP PROCEDURE IF EXISTS `listeinscrit`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `listeinscrit` (IN `evenement` INT)  NO SQL
SELECT nom,prenom,titre FROM inscription_activite
INNER JOIN membre ON inscription_activite.id_membre=membre.id
INNER JOIN activites ON inscription_activite.id_activite=activites.id
 WHERE id_activite = evenement$$

DROP PROCEDURE IF EXISTS `mailbde`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `mailbde` ()  NO SQL
SELECT adresse_mail FROM membre WHERE role=3$$

DROP PROCEDURE IF EXISTS `maxevenement`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `maxevenement` ()  NO SQL
SELECT * FROM evenement WHERE id=(
    SELECT MAX(id) FROM evenement
    )$$

DROP PROCEDURE IF EXISTS `remlike`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `remlike` (IN `idphoto` INT)  NO SQL
UPDATE photo SET nbr_like=nbr_like-1 WHERE id=idphoto$$

DROP PROCEDURE IF EXISTS `samemdp`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `samemdp` (IN `maile` VARCHAR(20), IN `motDePass` VARCHAR(20))  NO SQL
SELECT mdp
FROM membre
WHERE adresse_mail=maile AND mdp=motDePass$$

DROP PROCEDURE IF EXISTS `samepseudo`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `samepseudo` (IN `maile` VARCHAR(20))  NO SQL
SELECT *
FROM membre
WHERE adresse_mail=maile$$

DROP PROCEDURE IF EXISTS `selectactivite`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `selectactivite` (IN `membre` INT, IN `event` INT)  NO SQL
SELECT id_membre FROM inscription_activite
WHERE id_membre=membre AND id_activite=event$$

DROP PROCEDURE IF EXISTS `selectArticle`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `selectArticle` (IN `mine` FLOAT, IN `maxe` FLOAT)  NO SQL
SELECT * FROM boutique WHERE Prix BETWEEN mine AND maxe$$

DROP PROCEDURE IF EXISTS `selectcom`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `selectcom` (IN `photo` INT)  NO SQL
SELECT * FROM commentaire
INNER JOIN membre ON commentaire.id_membre=membre.id
 WHERE id_photo=photo$$

DROP PROCEDURE IF EXISTS `selectevent`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `selectevent` (IN `membre` INT, IN `event` INT)  NO SQL
SELECT id_membre FROM inscription_event
WHERE id_membre=membre AND id_evenement=event$$

DROP PROCEDURE IF EXISTS `selectphoto`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `selectphoto` (IN `event` INT)  NO SQL
SELECT * FROM photo WHERE id_event=event$$

DROP PROCEDURE IF EXISTS `testForm`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `testForm` (IN `pseud` VARCHAR(20), IN `photo` VARCHAR(255), IN `titr` VARCHAR(25), IN `conten` TEXT, IN `datetim` DATETIME)  NO SQL
INSERT INTO evenement (pseudo, photo, titre, contenu, date_creation) 
VALUES (pseud, photo, titr, conten, datetim)$$

DROP PROCEDURE IF EXISTS `testForm2`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `testForm2` (IN `pseud` VARCHAR(20), IN `photo` VARCHAR(255), IN `titr` VARCHAR(25), IN `conten` TEXT, IN `datetim` DATE)  NO SQL
INSERT INTO activites (pseudo, photo, titre, contenu, date_creation) 
VALUES (pseud, photo, titr, conten, datetim)$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Structure de la table `activites`
--

DROP TABLE IF EXISTS `activites`;
CREATE TABLE IF NOT EXISTS `activites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pseudo` varchar(200) COLLATE utf8_bin NOT NULL,
  `photo` varchar(30) COLLATE utf8_bin NOT NULL,
  `titre` varchar(50) COLLATE utf8_bin NOT NULL,
  `contenu` text COLLATE utf8_bin NOT NULL,
  `date_creation` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Déchargement des données de la table `activites`
--

INSERT INTO `activites` (`id`, `pseudo`, `photo`, `titre`, `contenu`, `date_creation`) VALUES
(1, 'thierry', 'foot.jpg', 'Club de football', 'Entrainement tout les Jeudi\r\n\r\nClub sérieux , no troll.', '2019-11-11 13:28:00'),
(2, 'Titouan', 'basket.jpg', 'Basket Ball Club', 'Entrainement tout les jeudi', '2019-11-11 13:28:00'),
(3, 'titou', 'ayo.jpg', 'Club des panda roux', 'c trop bo les pandas roux', '2019-11-06 13:28:00'),
(11, 'Bastien Aelters', 'jdr.png', 'Jeu de rôle', 'Tu aime l\'aventure ? Rejoins nous dans nos activités au seins du club Jeu de rôle !', '2019-11-14 00:00:00');

-- --------------------------------------------------------

--
-- Structure de la table `boutique`
--

DROP TABLE IF EXISTS `boutique`;
CREATE TABLE IF NOT EXISTS `boutique` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(50) COLLATE utf8_bin NOT NULL,
  `description` text COLLATE utf8_bin NOT NULL,
  `prix` float NOT NULL,
  `categorie` varchar(50) COLLATE utf8_bin NOT NULL,
  `url` varchar(50) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Déchargement des données de la table `boutique`
--

INSERT INTO `boutique` (`id`, `nom`, `description`, `prix`, `categorie`, `url`) VALUES
(6, 'T-shirt Lacoste', 'T-shirt lacoste d\'une haute qualité', 40, 'shirt', 'tshirtlacoste.jpg'),
(5, 'T-shirt LV', 'meilleurs T-shirt Louis Vuitton', 50, 'shirt', 'tshirtlv.jpg'),
(4, 'Bonnet du CESI', 'Bonnet 100% coton fait main par les membres du BDE', 15, 'bonnet', 'telecharge.jpg'),
(7, 'Pull lv', 'Pull Louis Vuitton de haute facture', 80, 'pull', 'pullv.jpg'),
(8, 'casquette LV', 'Casquette Louis Vuitton brodée main', 40, 'casquette', 'casquettelv.jpg'),
(9, 'Bonnet LV', 'Bonnet Louis Vuitton d\'occasion', 30, 'bonnet', 'bonnetlv.jpg');

-- --------------------------------------------------------

--
-- Structure de la table `commentaire`
--

DROP TABLE IF EXISTS `commentaire`;
CREATE TABLE IF NOT EXISTS `commentaire` (
  `idcom` int(11) NOT NULL AUTO_INCREMENT,
  `id_membre` int(11) NOT NULL,
  `id_photo` int(11) NOT NULL,
  `contenu` text COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`idcom`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Déchargement des données de la table `commentaire`
--

INSERT INTO `commentaire` (`idcom`, `id_membre`, `id_photo`, `contenu`) VALUES
(4, 2, 1, 'il est trop gros ce hamster lol');

-- --------------------------------------------------------

--
-- Structure de la table `evenement`
--

DROP TABLE IF EXISTS `evenement`;
CREATE TABLE IF NOT EXISTS `evenement` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pseudo` varchar(200) COLLATE utf8_bin NOT NULL,
  `photo` varchar(30) COLLATE utf8_bin NOT NULL,
  `titre` varchar(50) COLLATE utf8_bin NOT NULL,
  `contenu` text COLLATE utf8_bin NOT NULL,
  `date_creation` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Déchargement des données de la table `evenement`
--

INSERT INTO `evenement` (`id`, `pseudo`, `photo`, `titre`, `contenu`, `date_creation`) VALUES
(1, 'leosmania', 'CESI-Summerbreak.jpg', 'CESI Summer break', 'Plus que 2 semaines avant le Summer Break! Vous avez jusqu’au 26 juin pour prendre vos préventes. On vous attend nombreux le 28 juin à partir de 16h30 avec des animations organisées par les clubs. N’oubliez pas le barbecue organisé par le club gastronomie ! On finira la soirée à La Suite à partir de 23h avec une soirée Be The DJ où VOUS choisissez les musiques qui passent. On organise ce mardi 18 juin une vente de billets en physique dans le hall Marconi N’attendez plus et prenez vos préventes https://billetterie.pumpkin-app.com/cesi-summer-break Retrouvez l’évènement Facebook ici https://www.facebook.com/events/2252667301714929/', '2019-11-14 10:34:11'),
(17, 'leosmania', 'Normandy_gamjam.jpg', 'Normandie Game Jam', 'La Normandie game Jam est un évenement dont le but est de créer un jeu avec n\'importe quel language de programation ', '2019-11-15 14:23:35'),
(2, 'Bastien Aelters', 'battledev.jpg', 'Battle Dev', 'Comme chaque année, la BattleDev est de retour au CESI. Des milliers de développeurs vont s\'affronter le 26 novembre 2019, de 20h à 22h. La BattleDev est un concours de programmation et d\'algorithmie en ligne dont le but est de réussir 6 exercices en 2h, dans le langage de programmation de ton choix.', '2019-11-14 10:34:49'),
(3, 'Titouan Lambrecq', 'ces-esport.png', 'OPEN LAN', 'Le Ces\'esport organise une OPENLAN ce mardi soir ! Rejoins nous en salle 05 à 17h30. Viens jouer à tes jeux favoris avec tes amis !', '2019-11-14 10:37:17');

-- --------------------------------------------------------

--
-- Structure de la table `inscription_activite`
--

DROP TABLE IF EXISTS `inscription_activite`;
CREATE TABLE IF NOT EXISTS `inscription_activite` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_membre` int(11) NOT NULL,
  `id_activite` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `inscription_activite`
--

INSERT INTO `inscription_activite` (`id`, `id_membre`, `id_activite`) VALUES
(22, 2, 1),
(19, 2, 1),
(21, 2, 3),
(17, 2, 1);

-- --------------------------------------------------------

--
-- Structure de la table `inscription_event`
--

DROP TABLE IF EXISTS `inscription_event`;
CREATE TABLE IF NOT EXISTS `inscription_event` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_membre` int(11) NOT NULL,
  `id_evenement` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Déchargement des données de la table `inscription_event`
--

INSERT INTO `inscription_event` (`id`, `id_membre`, `id_evenement`) VALUES
(1, 2, 2),
(4, 1, 2),
(17, 1, 8);

-- --------------------------------------------------------

--
-- Structure de la table `likeconfirm`
--

DROP TABLE IF EXISTS `likeconfirm`;
CREATE TABLE IF NOT EXISTS `likeconfirm` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_membre` int(11) NOT NULL,
  `id_photo` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=53 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `likeconfirm`
--

INSERT INTO `likeconfirm` (`id`, `id_membre`, `id_photo`) VALUES
(52, 2, 1);

-- --------------------------------------------------------

--
-- Structure de la table `membre`
--

DROP TABLE IF EXISTS `membre`;
CREATE TABLE IF NOT EXISTS `membre` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(50) COLLATE utf8_bin NOT NULL,
  `prenom` varchar(50) COLLATE utf8_bin NOT NULL,
  `localisation` varchar(50) COLLATE utf8_bin NOT NULL,
  `adresse_mail` varchar(50) COLLATE utf8_bin NOT NULL,
  `mdp` varchar(50) COLLATE utf8_bin NOT NULL,
  `role` int(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Déchargement des données de la table `membre`
--

INSERT INTO `membre` (`id`, `nom`, `prenom`, `localisation`, `adresse_mail`, `mdp`, `role`) VALUES
(1, 'Gilles', 'Leo', 'ROUEN', 'leo.gilles@orange.fr', 'Lego1972', 3),
(2, 'Lambrecq', 'Titouan', 'rouen', 'titou@gmail.fr', 'Titou67', 1),
(3, 'Cesi', 'cesi', 'rouen', 'cesi@cesi.fr', 'Cesi2019', 2);

-- --------------------------------------------------------

--
-- Structure de la table `photo`
--

DROP TABLE IF EXISTS `photo`;
CREATE TABLE IF NOT EXISTS `photo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_event` varchar(50) COLLATE utf8_bin NOT NULL,
  `url` varchar(200) COLLATE utf8_bin NOT NULL,
  `nbr_like` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Déchargement des données de la table `photo`
--

INSERT INTO `photo` (`id`, `id_event`, `url`, `nbr_like`) VALUES
(4, '1', 'cochon.JPG', 1),
(1, '2', 'ayo.jpg', 3);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
