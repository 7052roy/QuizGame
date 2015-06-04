-- phpMyAdmin SQL Dump
-- version 4.3.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Gegenereerd op: 04 jun 2015 om 15:25
-- Serverversie: 5.6.24
-- PHP-versie: 5.6.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `quizgame`
--

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `answer`
--

CREATE TABLE IF NOT EXISTS `answer` (
  `Answer_ID` int(11) NOT NULL,
  `Question_ID` int(11) NOT NULL,
  `PossibleAnswer` varchar(100) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=latin1;

--
-- Gegevens worden geëxporteerd voor tabel `answer`
--

INSERT INTO `answer` (`Answer_ID`, `Question_ID`, `PossibleAnswer`) VALUES
(1, 1, 'Kings Dominion'),
(2, 1, 'King Island'),
(3, 1, 'Cedar Point'),
(4, 2, 'Dorney Park'),
(5, 2, 'Walibi Belgium'),
(6, 2, 'Cedar Point'),
(7, 3, 'Attractiepark Slagharen'),
(8, 3, 'Avonturenpark Hellendoorn'),
(9, 3, 'Walibi Holland'),
(10, 4, 'Walibi Belgium'),
(11, 4, 'Walibi Holland'),
(12, 4, 'Walibi Sud Quest'),
(13, 5, 'Kings Dominion'),
(14, 5, 'Luna Park'),
(15, 5, 'Moreys Pier'),
(16, 6, 'Top Thrill Dragster'),
(17, 6, 'King Da Ka'),
(18, 6, 'Stealth'),
(19, 7, 'Big Thunder Mountain'),
(20, 7, 'Mission Space'),
(21, 7, 'Space Mountain'),
(22, 8, 'Vekoma'),
(23, 8, 'B&M'),
(24, 8, 'Premier Rides'),
(25, 9, 'Six Flags America'),
(26, 9, 'Six Flags Great America'),
(27, 9, 'Six Flags Great Adventure'),
(30, 10, 'Tornado'),
(31, 10, 'Time Warp'),
(32, 10, 'Volare');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `highscores`
--

CREATE TABLE IF NOT EXISTS `highscores` (
  `HighScore_ID` int(11) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `Score` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Gegevens worden geëxporteerd voor tabel `highscores`
--

INSERT INTO `highscores` (`HighScore_ID`, `Name`, `Score`) VALUES
(1, 'roy', 0),
(2, 'marco', 33767),
(4, 'roy', 103400),
(5, 'roy', 75559),
(6, 'test', 86887);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `question`
--

CREATE TABLE IF NOT EXISTS `question` (
  `Question_ID` int(11) NOT NULL,
  `Question` varchar(100) NOT NULL,
  `Picture` varchar(50) NOT NULL,
  `CorrectAnswer` varchar(50) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

--
-- Gegevens worden geëxporteerd voor tabel `question`
--

INSERT INTO `question` (`Question_ID`, `Question`, `Picture`, `CorrectAnswer`) VALUES
(1, 'Where is this Roller coaster located?', 'Dominator', 'Kings Dominion'),
(2, 'Where is this Roller coaster located?', 'GateKeeper', 'Cedar Point'),
(3, 'Where is this Roller coaster located?', 'Tornado', 'Avonturenpark Hellendoorn'),
(4, 'Where is this Roller coaster located?', 'Boomerang', 'Walibi Belgium'),
(5, 'Where is this Roller coaster located?', 'GreatWhite', 'Moreys Pier'),
(6, 'What is the name of this coaster?', 'KingDaKa', 'King Da Ka'),
(7, 'What is the name of the rollercoaster in the back?', 'SpaceMountain', 'Space Mountain'),
(8, 'Which company build Joker''s Jinx?', 'Joker', 'Premier Rides'),
(9, 'Where is this Roller coaster located?', 'RideOfSteel', 'Six Flags America'),
(10, 'What is the model of this coaster called?', 'TimeWarp', 'Volare');

--
-- Indexen voor geëxporteerde tabellen
--

--
-- Indexen voor tabel `answer`
--
ALTER TABLE `answer`
  ADD PRIMARY KEY (`Answer_ID`);

--
-- Indexen voor tabel `highscores`
--
ALTER TABLE `highscores`
  ADD PRIMARY KEY (`HighScore_ID`);

--
-- Indexen voor tabel `question`
--
ALTER TABLE `question`
  ADD PRIMARY KEY (`Question_ID`);

--
-- AUTO_INCREMENT voor geëxporteerde tabellen
--

--
-- AUTO_INCREMENT voor een tabel `answer`
--
ALTER TABLE `answer`
  MODIFY `Answer_ID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=33;
--
-- AUTO_INCREMENT voor een tabel `highscores`
--
ALTER TABLE `highscores`
  MODIFY `HighScore_ID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT voor een tabel `question`
--
ALTER TABLE `question`
  MODIFY `Question_ID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=11;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
