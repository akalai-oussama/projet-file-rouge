-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : jeu. 16 juin 2022 à 13:39
-- Version du serveur : 10.4.22-MariaDB
-- Version de PHP : 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `e-commerce`
--

-- --------------------------------------------------------

--
-- Structure de la table `carts`
--

CREATE TABLE `carts` (
  `id` int(11) NOT NULL,
  `userReference` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `carts`
--

INSERT INTO `carts` (`id`, `userReference`) VALUES
(3, NULL),
(4, NULL),
(5, '6253f3fa8ac42'),
(6, '6253f41996834'),
(7, '6253f457deed4'),
(8, '6253f46052a14'),
(9, '62a6f7b501782'),
(10, '62a70a6406b1d'),
(11, '62a70cf5ca0ca'),
(12, '62ab01974bfb0'),
(13, '62ab0270b6da3');

-- --------------------------------------------------------

--
-- Structure de la table `cart_line`
--

CREATE TABLE `cart_line` (
  `idCartLine` int(11) NOT NULL,
  `idProduct` int(11) DEFAULT NULL,
  `idCart` int(11) DEFAULT NULL,
  `productCartQuantity` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `cart_line`
--

INSERT INTO `cart_line` (`idCartLine`, `idProduct`, `idCart`, `productCartQuantity`) VALUES
(1, 1, 1, 2),
(2, 2, 9, 1),
(14, 1, 11, 0),
(16, 6, 11, 0),
(17, 7, 11, 0),
(18, 3, 11, 0),
(19, 4, 11, 0);

-- --------------------------------------------------------

--
-- Structure de la table `categorie`
--

CREATE TABLE `categorie` (
  `id_categorie` int(11) NOT NULL,
  `nom_categorie` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `categorie`
--

INSERT INTO `categorie` (`id_categorie`, `nom_categorie`) VALUES
(1, 'FRONT-END'),
(2, 'BACK-END'),
(3, 'DESIGN');

-- --------------------------------------------------------

--
-- Structure de la table `produit`
--

CREATE TABLE `produit` (
  `id_produit` int(11) NOT NULL,
  `nom_produit` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `reference` varchar(255) NOT NULL,
  `categorie_produit` varchar(11) DEFAULT NULL,
  `photo` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `produit`
--

INSERT INTO `produit` (`id_produit`, `nom_produit`, `description`, `reference`, `categorie_produit`, `photo`) VALUES
(1, 'Angular', 'Angular est une plate-forme et un framework pour construire des applications client d’une page en utilisant HTML et TypeScript. Angular est écrit en TypeScript.', 'https://www.tektutorialshub.com/angular-tutorial/ \n', '1-FRONT-END', 'angular.jpg'),
(2, 'HTML5', 'Le HyperText Markup Language, généralement abrégé HTML ou, dans sa dernière version, HTML5, est le langage de balisage conçu pour représenter les pages web.', 'https://www.w3schools.com/html/', '1-FRONT-END', 'html.png'),
(3, 'CSS3', 'Les feuilles de style en cascade, généralement appelées CSS de l\'anglais Cascading Style Sheets, forment un langage informatique qui décrit la présentation des documents HTML et XML.', 'https://www.tutorialrepublic.com/css-tutorial/', '1-FRONT-END', 'css.png'),
(4, 'Laravel\n', 'Laravel est un framework web open-source écrit en PHP respectant le principe modèle-vue-contrôleur et entièrement développé en programmation orientée objet. Laravel est distribué sous licence MIT, avec ses sources hébergées sur GitHub.', 'https://www.tutorialspoint.com/laravel/index.htm', '1-FRONT-END', 'laravel.png'),
(5, 'Vue.js\n', 'Vue.js, est un framework JavaScript open-source utilisé pour construire des interfaces utilisateur et des applications web monopages.', 'https://www.tutorialspoint.com/vuejs/index.htm', '1-FRONT-END', 'vue.png'),
(6, 'React\n', 'React est une librairie JavaScript créée par Facebook\nReact est une bibliothèque d’interface utilisateur (IU)\nReact est un outil pour construire des composants d’interface utilisateur', 'https://fr.reactjs.org/tutorial/tutorial.html', '1-FRONT-END', 'react.png'),
(7, 'Canva', 'Canva est une plate-forme de conception graphique qui permet aux utilisateurs de créer des graphiques, des présentations, des affiches, des documents et d\'autres contenus visuels sur les médias sociaux.', 'https://www.canva.com/designschool/tutorials/getting-started/', '3-DESIGN', 'canva.png'),
(10, 'Kotlin', 'Kotlin est un langage de programmation orienté objet et fonctionnel, avec un typage statique qui permet de compiler pour la machine virtuelle Java, JavaScript, et vers plusieurs plateformes en natif.', 'https://www.w3schools.com/kotlin/index.php', '2-BACK-END', 'kotlin.png'),
(11, 'Swift', 'Swift est un langage de programmation objet compilé, multi-paradigmes, qui se veut simple, performant et sûr. Il est développé en open source.', 'https://docs.swift.org/swift-book/GuidedTour/GuidedTour.html', '1-FRONT-END', 'swift.png'),
(12, 'Sass', 'Sass (Syntactically awesome stylesheets) est un langage de script préprocesseur qui est compilé ou interprété en CSS (Cascading Style Sheets). SassScript est le langage de script en lui-même. Sass est disponible en deux syntaxes.', 'https://www.w3schools.com/sass/', '1-FRONT-END', 'sass.png'),
(13, 'Java', 'Java est un langage de programmation orienté objet créé par James Gosling et Patrick Naughton, employés de Sun Microsystems, avec le soutien de Bill Joy, présenté officiellement le 23 mai 1995 au SunWorld. La société Sun a été ensuite rachetée en 2009 par', 'https://www.tutorialspoint.com/java/index.htm', '2-BACK-END', 'java.png'),
(14, 'jQuery', 'jQuery est une bibliothèque JavaScript libre et multiplateforme créée pour faciliter l\'écriture de scripts côté client dans le code HTML des pages web. La première version est lancée en janvier 2006 par John Resig.', 'https://www.tutorialrepublic.com/jquery-tutorial/', '1-FRONT-END', 'jquery.png'),
(15, 'MySQL', 'MySQL est un système de gestion de bases de données relationnelles. Il est distribué sous une double licence GPL et propriétaire.', 'https://www.tutorialspoint.com/mysql/index.htm', '2-BACK-END', 'mysql.png'),
(16, 'Bootstrap', 'Bootstrap est un framework de développement frontal gratuit et open source pour la création de sites Web et d’applications web.', 'https://www.tutorialrepublic.com/twitter-bootstrap-tutorial/', '1-FRONT-END', 'bootstrap.png'),
(17, 'C++', 'C++ est un langage de programmation compilé permettant la programmation sous de multiples paradigmes, dont la programmation procédurale, la programmation orientée objet et la programmation générique.', 'https://www.w3schools.com/CPP/default.asp', '2-BACK-END', 'c++.png'),
(18, 'JavaScript', 'JavaScript est un langage de programmation qui permet d\'implémenter des mécanismes complexes sur une page web.', 'https://www.javascripttutorial.net/', '2-BACK-END', 'javascript.png'),
(20, 'PHP\n', 'PHP: Hypertext Preprocessor, plus connu sous son sigle PHP, est un langage de programmation libre, principalement utilisé pour produire des pages Web dynamiques via un serveur HTTP.', 'https://www.phptutorial.net/', '2-BACK-END', 'php.png'),
(21, 'Python', 'Python est un langage de programmation interprété, multi-paradigme et multiplateformes. Il favorise la programmation impérative structurée, fonctionnelle et orientée objet', 'https://www.w3schools.com/python/', '2-BACK-END', 'python.png'),
(22, 'Ruby', 'Ruby est un langage de programmation libre. Il est interprété, orienté objet, et multi-paradigme.\n\nLe nom Ruby n\'est pas un acronyme mais un jeu de mots avec le langage informatique Perl.', 'https://www.tutorialspoint.com/ruby/index.htm', '2-BACK-END', 'ruby.png'),
(33, 'Figma', 'Figma est un éditeur de graphiques vectoriels et un outil de prototypage. Il est principalement basé sur le web, avec des fonctionnalités hors ligne supplémentaires activées par des applications de bureau pour macOS et Windows.', 'https://www.figma.com/fr/resources/learn-design/', '3-DESIGN', 'figma.png'),
(34, 'Moodstruck Epic 4D Mascara', 'Go ahead and toss your falsies, because this one-step wonder just made an entrance. MOODSTRUCK EPIC 4D one‑step fiber mascara combines Y‑shaped fibers and a specially engineered two-sided brush to interlock fibers for lash volume, length, and lift like yo', '', '4', 'Moodstruck Epic 4D Mascara.jpg'),
(35, 'Nudiversal Lip Duo in Shade 11  Istanbul', 'ALL-DAY WEAR: Natural-looking nude lip color that lasts for up to 24 hours\r\nEASY TWO-STEP PROCESS: For long-lasting coverage, apply color before locking it in with the shiny topcoat\r\nMOISTURIZING FORMULA: The nourishing formula contains sunflower seed oil', '', '4', 'Nudiversal Lip Duo in Shade 11  Istanbul.jpg'),
(37, 'Acne Clearing Toner', 'Contains 1 - 8 ounce botttle of wild crop, certified organic witch hazel toner, fragrance free\r\nOur first ingredient is Certified Organic Witch Hazel - wild harvested to capture the vital plant essence and distilled to preserve its natural potency – not d', '', '5', 'Acne Clearing Toner.jpg'),
(38, 'Blemish Balm Moisturizer', 'Replenishing Post-pimple Cream – Rescue Balm is the post-blemish essential. As soon as you’ve popped a zit or removed your pimple patch, dab on Rescue Balm to instantly improve your skin’s texture and appearance\r\nThe Hero Difference – The brand that broug', '', '5', 'Blemish Balm Moisturizer.jpg'),
(39, 'C15 Super Booster', 'DIMINISH LARGE PORES: Tighten & refine the look of stretched, sagging pores caused by age or sun damage.\r\nIMPROVE SKIN TONE: Vitamin C & licorice root visibly brighten skin and improve blotchy tone, discolorations and uneven skin tone\r\nMINIMIZE HARD, CLOG', '', '5', 'C15 Super Booster.jpg'),
(40, 'CeraVe Hydrating Facial Cleanser', '[ DAILY FACE WASH ] Gentle cleansing lotion with hyaluronic acid, ceramides, and glycerin to help hydrate skin without stripping moisture. Removes face makeup, dirt, and excess oil, provides 24-hour hydration and leaves a moisturized, non-greasy feel.\r\n[ ', '', '5', 'CeraVe Hydrating Facial Cleanser.jpg'),
(41, 'Natural-Cosmetic-cream-product', 'BRIGHTEN and CLARIFY SKIN - Our revival serum, a hydrating and lifting serum with aminos, contains anti-aging benefits to promote rejuvenation and help your skin feel lifted, firm, and younger.\r\nWITH VITAMINS AND MINERALS - Moisturizing and revitalizing, ', '', '5', 'Natural-Cosmetic-cream-product-ad-Clipart-PNG.png'),
(42, 'Phloretin CF', 'The Ultimate Skin Revitalizing Set: Vitamin C brightens in the AM; Retinol renews while you sleep; Hyaluronic acid is the perfect day or night solution to lock in moisture to reduce appearance of fine lines\r\nVitamin C is your wake up cure with powerful an', '', '5', 'Phloretin CF.jpg'),
(43, 'Purifying Toner', 'Gentle Face Toner: Alcohol-free and formulated to soothe, tone, hydrate, and balance the pH level of skin; This face toner helps reduce the look of pores, balance oily skin, and maintain the skin\'s moisture barrier\r\n98 Percent Natural Origin Ingredients: ', '', '5', 'Purifying Toner.jpg'),
(44, 'Rose & Hyaluronic Acid Deep Hydration Toner', 'True Beauty Rest – Wake to the skin of your dreams with your Noacier Overnight Collagen Mask. Your innovative, potent formula helps firm, tone, and hydrate your complexion from the inside out as you sleep.\r\nTurn Back Time – Promote seamless skin with hydr', '', '5', 'Rose & Hyaluronic Acid Deep Hydration Toner.jpg'),
(45, 'Squalane + Phyto-Retinol Serum', 'Biossance Squalane + Copper Peptide Rapid Plumping Serum. Get immediate and lasting hydration powered by our proprietary Rapid Plumping Complex that floods skin with 3 super-hydrators for supreme moisture.\r\nBounce in a Bottle. The non-sticky, silky blue e', '', '5', 'Squalane + Phyto-Retinol Serum.jpg');

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `firstName` varchar(255) DEFAULT NULL,
  `lastName` varchar(255) DEFAULT NULL,
  `passWord` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `role` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `firstName`, `lastName`, `passWord`, `email`, `role`) VALUES
(1, 'oussama', 'akalai', 'admin', 'mlikiA26@gmail.com', 'client'),
(2, 'amin', NULL, 'user', 'user@gmail.com', NULL);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `cart_line`
--
ALTER TABLE `cart_line`
  ADD PRIMARY KEY (`idCartLine`),
  ADD KEY `idProduct` (`idProduct`);

--
-- Index pour la table `categorie`
--
ALTER TABLE `categorie`
  ADD PRIMARY KEY (`id_categorie`);

--
-- Index pour la table `produit`
--
ALTER TABLE `produit`
  ADD PRIMARY KEY (`id_produit`),
  ADD KEY `categorie` (`categorie_produit`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `carts`
--
ALTER TABLE `carts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT pour la table `cart_line`
--
ALTER TABLE `cart_line`
  MODIFY `idCartLine` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT pour la table `categorie`
--
ALTER TABLE `categorie`
  MODIFY `id_categorie` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `produit`
--
ALTER TABLE `produit`
  MODIFY `id_produit` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `cart_line`
--
ALTER TABLE `cart_line`
  ADD CONSTRAINT `cart_line_ibfk_1` FOREIGN KEY (`idProduct`) REFERENCES `produit` (`id_produit`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
