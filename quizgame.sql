-- phpMyAdmin SQL Dump
-- version 4.1.6
-- http://www.phpmyadmin.net
--
-- Machine: 127.0.0.1
-- Gegenereerd op: 23 apr 2015 om 22:27
-- Serverversie: 5.6.16
-- PHP-versie: 5.5.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Databank: `quizgame`
--

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `answer`
--

CREATE TABLE IF NOT EXISTS `answer` (
  `Answer_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Question_ID` int(11) NOT NULL,
  `PossibleAnswer` varchar(100) NOT NULL,
  PRIMARY KEY (`Answer_ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Gegevens worden uitgevoerd voor tabel `answer`
--

INSERT INTO `answer` (`Answer_ID`, `Question_ID`, `PossibleAnswer`) VALUES
(1, 1, 'Kings Dominion'),
(2, 1, 'King Island'),
(3, 1, 'Cedar Point');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `question`
--

CREATE TABLE IF NOT EXISTS `question` (
  `Question_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Question` varchar(100) NOT NULL,
  `Picture` varchar(50) NOT NULL,
  `CorrectAnswer` varchar(50) NOT NULL,
  PRIMARY KEY (`Question_ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Gegevens worden uitgevoerd voor tabel `question`
--

INSERT INTO `question` (`Question_ID`, `Question`, `Picture`, `CorrectAnswer`) VALUES
(1, 'Where is this Roller coaster located', 'Dominator', 'Kings Dominion');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
