-- phpMyAdmin SQL Dump
-- version 4.9.6
-- https://www.phpmyadmin.net/
--
-- Host: e93ud.myd.infomaniak.com
-- Generation Time: Oct 09, 2023 at 08:49 PM
-- Server version: 5.7.32-log
-- PHP Version: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `e93ud_munotcup`
--

-- --------------------------------------------------------

--
-- Table structure for table `disziplinen`
--

CREATE TABLE `disziplinen` (
  `id` int(9) NOT NULL,
  `name` varchar(300) NOT NULL,
  `kuerzel` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `disziplinen`
--

INSERT INTO `disziplinen` (`id`, `name`, `kuerzel`) VALUES
(1, 'Barren', 'BA'),
(2, 'Boden', 'BO'),
(3, 'Reck', 'RE'),
(4, 'Sprung', 'SP'),
(5, 'Schaukelringe', 'SR'),
(6, 'Schulstufenbarren', 'SSB'),
(7, 'Gerätekombination', 'GK'),
(8, 'Gymnastik S,M,L (Bühne)', 'GYB'),
(9, 'Gymnastik S,M,L (Rasen)', 'GYR'),
(10, 'Team Aerobic', 'TAE'),
(11, 'Gymnastik Verein S', 'GY-S'),
(12, 'Gymnastik Verein M', 'GY-M'),
(13, 'Gymnastik Verein L', 'GY-L'),
(14, 'Gymnastik Verein S,M,L', 'GY-SML');

-- --------------------------------------------------------

--
-- Table structure for table `ergebnisse_gy`
--

CREATE TABLE `ergebnisse_gy` (
  `id` int(9) NOT NULL,
  `rang` int(11) NOT NULL DEFAULT '999',
  `verein` int(9) NOT NULL,
  `disziplin` int(9) NOT NULL,
  `pnote_1dg` double NOT NULL DEFAULT '-1',
  `tnote_1dg` double NOT NULL DEFAULT '-1',
  `ordabzuege_1dg` double NOT NULL DEFAULT '-1',
  `besvork_1dg` double NOT NULL DEFAULT '-1',
  `note_1dg` double NOT NULL DEFAULT '-1',
  `rang_1dg` int(11) NOT NULL DEFAULT '999',
  `pnote_2dg` double NOT NULL DEFAULT '-1',
  `tnote_2dg` double NOT NULL DEFAULT '-1',
  `ordabzuege_2dg` double NOT NULL DEFAULT '-1',
  `besvork_2dg` double NOT NULL DEFAULT '-1',
  `note_2dg` double NOT NULL DEFAULT '-1',
  `total` double NOT NULL DEFAULT '-1',
  `anzahl_turnende` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ergebnisse_gy`
--

INSERT INTO `ergebnisse_gy` (`id`, `rang`, `verein`, `disziplin`, `pnote_1dg`, `tnote_1dg`, `ordabzuege_1dg`, `besvork_1dg`, `note_1dg`, `rang_1dg`, `pnote_2dg`, `tnote_2dg`, `ordabzuege_2dg`, `besvork_2dg`, `note_2dg`, `total`, `anzahl_turnende`) VALUES
(1, 3, 6, 8, 2.983, 4.433, 0, 0, 9.42, 3, 2.983, 4.5, 0, 0, 9.48, 18.9, 17),
(2, 3, 19, 8, 2.9, 4.175, 0, 0, 9.08, 6, 2.833, 4.258, 0, 0, 9.09, 18.17, 8),
(3, 2, 20, 8, 2.917, 4.542, 0, 0, 9.46, 2, 2.85, 4.4, 0, 0, 9.25, 18.71, 9),
(4, 3, 30, 8, 2.617, 4.025, 0, 0.01, 8.63, 8, 2.75, 4.25, 0, 0, 9, 17.63, 11),
(5, 4, 33, 8, 2.733, 4.033, 0, 0.01, 8.76, 7, 2.717, 4.342, 0, 0, 9.06, 17.82, 6),
(6, 1, 34, 8, 2.95, 4.542, 0, 0, 9.49, 1, 3, 4.592, 0, 0, 9.59, 19.08, 10),
(7, 2, 35, 8, 2.733, 4.433, 0, 0, 9.17, 4, 2.8, 4.467, 0, 0, 9.27, 18.43, 13),
(8, 10, 37, 8, 2.667, 3.633, 0, 0, 8.3, 10, 2.6, 3.533, 0, 0, 8.13, 16.43, 24),
(9, 6, 41, 8, 2.867, 4.267, 0, 0.01, 9.12, 5, 2.833, 4.225, 0, 0, 9.06, 18.18, 16),
(10, 5, 45, 8, 2.567, 3.817, 0, 0, 8.38, 9, 2.5, 3.833, 0, 0, 8.33, 16.71, 10),
(11, 4, 48, 8, 2.333, 3.767, 0, 0, 8.1, 11, 2.467, 3.975, 0, 0, 8.44, 16.54, 13),
(12, 4, 9, 9, 2.8, 4.508, 0, 0, 9.31, 4, 2.783, 4.417, 0, 0, 9.2, 18.51, 20),
(13, 11, 16, 9, 2.367, 3.475, 0, 0, 7.84, 9, 2.217, 3.358, 0, 0, 7.58, 15.42, 37),
(14, 1, 18, 9, 3, 4.725, 0, 0, 9.73, 1, 3, 4.85, 0, 0, 9.85, 19.58, 20),
(15, 2, 28, 9, 2.933, 4.517, 0, 0, 9.45, 2, 2.983, 4.508, 0, 0, 9.49, 18.94, 25),
(16, 9, 33, 9, 2.583, 3.617, 0, 0, 8.2, 8, 2.633, 3.917, 0, 0, 8.55, 16.75, 17),
(17, 1, 34, 9, 2.967, 4.442, 0, 0, 9.41, 3, 2.983, 4.667, 0, 0, 9.65, 19.06, 12),
(18, 7, 38, 9, 2.733, 4.183, 0, 0, 8.92, 6, 2.85, 4.225, 0, 0, 9.08, 18, 25),
(19, 6, 2, 10, 3.55, 2.917, 0, 0, 6.467, 7, 3.55, 3.008, 0, 0, 6.558, 13.03, NULL),
(20, 2, 4, 10, 5, 4.433, 0, 0, 9.433, 2, 5, 4.567, 0, 0, 9.567, 19, NULL),
(21, 3, 8, 10, 4.917, 4.5, 0, 0, 9.417, 3, 4.917, 4.483, 0, 0, 9.4, 18.82, NULL),
(22, 1, 15, 10, 5, 4.583, 0, 0, 9.583, 1, 5, 4.692, 0, 0, 9.692, 19.28, NULL),
(23, 999, 17, 10, -1, -1, -1, -1, -1, 999, -1, -1, -1, -1, -1, -1, NULL),
(24, 1, 29, 10, 4.65, 4.017, 0, 0, 8.667, 4, 4.65, 4.008, 0, 0, 8.658, 17.33, NULL),
(25, 4, 33, 10, 4.233, 4.033, 0, 0, 8.266, 5, 4.233, 4.025, 0, 0, 8.258, 16.52, NULL),
(26, 5, 49, 10, 4.217, 3.9, 0, 0, 8.117, 6, 4.217, 4.1, 0, 0, 8.316, 16.43, NULL),
(32, 5, 54, 9, 2.817, 4.208, 0, 0, 9.03, 5, 2.883, 4.3, 0, 0, 9.18, 18.21, 18),
(33, 8, 55, 9, 2.7, 3.867, 0, 0, 8.57, 7, 2.817, 3.842, 0, 0, 8.66, 17.23, 41);

-- --------------------------------------------------------

--
-- Table structure for table `ergebnisse_vgt`
--

CREATE TABLE `ergebnisse_vgt` (
  `id` int(9) NOT NULL,
  `rang` int(11) NOT NULL DEFAULT '999',
  `verein` int(9) NOT NULL,
  `disziplin` int(9) NOT NULL,
  `einzelausfuehrung_1dg` double NOT NULL DEFAULT '-1',
  `synchronitaet_1dg` double NOT NULL DEFAULT '-1',
  `programm_1dg` double NOT NULL DEFAULT '-1',
  `ordabzuege_1dg` double NOT NULL DEFAULT '-1',
  `note_1dg` double NOT NULL DEFAULT '-1',
  `rang_1dg` int(11) NOT NULL DEFAULT '999',
  `einzelausfuehrung_2dg` double NOT NULL DEFAULT '-1',
  `synchronitaet_2dg` double NOT NULL DEFAULT '-1',
  `programm_2dg` double NOT NULL DEFAULT '-1',
  `ordabzuege_2dg` double NOT NULL DEFAULT '-1',
  `note_2dg` double NOT NULL DEFAULT '-1',
  `total` double NOT NULL DEFAULT '-1',
  `anzahl_turnende` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ergebnisse_vgt`
--

INSERT INTO `ergebnisse_vgt` (`id`, `rang`, `verein`, `disziplin`, `einzelausfuehrung_1dg`, `synchronitaet_1dg`, `programm_1dg`, `ordabzuege_1dg`, `note_1dg`, `rang_1dg`, `einzelausfuehrung_2dg`, `synchronitaet_2dg`, `programm_2dg`, `ordabzuege_2dg`, `note_2dg`, `total`, `anzahl_turnende`) VALUES
(1, 2, 6, 1, 3.65, 2.675, 3, 0, 9.25, 2, 3.65, 2.675, 3, 0, 9.3, 18.55, NULL),
(2, 8, 10, 1, 3.35, 2.375, 2.7, 0, 8.43, 8, 3.375, 2.35, 2.75, 0, 8.44, 16.87, NULL),
(3, 7, 12, 1, 3.45, 2.5, 2.9, 0, 8.85, 5, 3.375, 2.525, 2.9, 0, 8.75, 17.6, NULL),
(4, 4, 28, 1, 3.575, 2.6, 2.9, 0, 9.04, 4, 3.625, 2.65, 2.9, 0, 9.17, 18.21, NULL),
(5, 5, 32, 1, 3.55, 2.525, 2.8, 0, 8.76, 6, 3.525, 2.6, 2.85, 0, 8.86, 17.62, NULL),
(6, 6, 35, 1, 3.425, 2.425, 2.8, 0.04, 8.61, 7, 3.525, 2.625, 2.85, 0, 9, 17.61, NULL),
(7, 9, 36, 1, 3.325, 2.375, 2.7, 0, 8.34, 9, 3.325, 2.4, 2.75, 0, 8.44, 16.78, NULL),
(8, 3, 40, 1, 3.675, 2.675, 2.9, 0, 9.21, 3, 3.625, 2.675, 2.95, 0, 9.21, 18.42, NULL),
(9, 1, 41, 1, 3.725, 2.725, 3, 0, 9.45, 1, 3.7, 2.7, 3, 0, 9.4, 18.85, NULL),
(10, 10, 42, 1, 3.375, 2.275, 2.7, 0.04, 8.31, 10, 3.35, 2.425, 2.75, 0, 8.45, 16.76, NULL),
(11, 11, 52, 1, 3.025, 2.1, 2.75, 0.13, 7.75, 11, 3.075, 2.15, 2.75, 0, 7.84, 15.59, NULL),
(12, 4, 3, 2, 3.35, 2.425, 2.5, 0, 8.24, 7, 3.375, 2.5, 2.6, 0, 8.42, 16.66, NULL),
(13, 2, 5, 2, 3.675, 2.75, 2.9, 0, 9.3, 1, 3.675, 2.75, 2.9, 0, 9.33, 18.63, NULL),
(14, 3, 23, 2, 3.625, 2.65, 2.95, 0, 9.2, 3, 3.65, 2.775, 2.95, 0, 9.34, 18.54, NULL),
(15, 4, 33, 2, 3.675, 2.75, 2.9, 0, 9.2, 3, 3.65, 2.75, 3, 0, 9.32, 18.52, NULL),
(16, 1, 46, 2, 3.65, 2.675, 3, 0, 9.29, 2, 3.725, 2.8, 3, 0, 9.53, 18.82, NULL),
(17, 3, 47, 2, 3.5, 2.525, 2.85, 0, 8.81, 5, 3.6, 2.675, 2.85, 0, 9.08, 17.89, NULL),
(18, 5, 51, 2, 3.425, 2.55, 2.55, 0, 8.46, 6, 3.475, 2.65, 2.6, 0, 8.71, 17.17, NULL),
(19, 1, 18, 3, 3.8, 2.8, 3, 0, 9.56, 1, 3.875, 2.825, 3, 0, 9.7, 19.26, NULL),
(20, 3, 22, 3, 3.575, 2.55, 2.9, 0, 8.95, 3, 3.575, 2.6, 2.9, 0, 9.03, 17.98, NULL),
(21, 4, 26, 3, 3.425, 2.425, 2.9, 0, 8.64, 4, 3.5, 2.425, 2.85, 0, 8.71, 17.35, NULL),
(22, 2, 28, 3, 3.575, 2.65, 2.95, 0, 9.1, 2, 3.65, 2.65, 2.95, 0, 9.16, 18.26, NULL),
(23, 6, 31, 3, 3, 2.275, 2.75, 0, 7.92, 6, 3.25, 2.25, 2.75, 0, 8.18, 16.1, NULL),
(24, 5, 33, 3, 3.35, 2.4, 2.85, 0, 8.41, 5, 3.525, 2.5, 2.85, 0, 8.68, 17.09, NULL),
(26, 2, 4, 4, 3.7, 2.8, 3, 0, 9.5, 2, 3.75, 2.8, 3, 0, 9.55, 19.05, NULL),
(27, 1, 7, 4, 3.55, 2.725, 2.85, 0, 9.13, 4, 3.525, 2.575, 2.8, 0, 8.9, 18.03, NULL),
(28, 4, 11, 4, 3.675, 2.725, 2.85, 0, 9.16, 3, 3.6, 2.675, 2.8, 0, 8.83, 17.99, NULL),
(29, 1, 18, 4, 3.875, 2.825, 3, 0, 9.65, 1, 3.875, 2.85, 3, 0, 9.72, 19.37, NULL),
(30, 3, 27, 4, 3.65, 2.7, 2.75, 0, 9.02, 5, 3.65, 2.725, 2.8, 0, 9.1, 18.12, NULL),
(31, 6, 32, 4, 3.625, 2.775, 2.9, 0.3, 8.79, 7, 3.625, 2.8, 2.95, 0.3, 8.95, 17.74, NULL),
(32, 5, 40, 4, 3.575, 2.725, 2.7, 0, 8.95, 6, 3.6, 2.675, 2.7, 0, 8.81, 17.76, NULL),
(33, 7, 51, 4, 3.35, 2.575, 2.55, 0, 8.39, 8, 3.45, 2.575, 2.65, 0, 8.67, 17.06, NULL),
(34, 1, 4, 5, 3.75, 2.825, 3, 0, 9.54, 1, 3.75, 2.825, 3, 0, 9.54, 19.08, NULL),
(35, 8, 5, 5, 3.2, 2.275, 2.7, 0, 8.03, 10, 3.425, 2.525, 2.75, 0, 8.7, 16.73, NULL),
(36, 9, 11, 5, 3.25, 2.525, 2.75, 0, 8.39, 8, 3.2, 2.4, 2.7, 0, 8.26, 16.65, NULL),
(37, 3, 18, 5, 3.65, 2.725, 2.95, 0, 9.26, 3, 3.775, 2.8, 3, 0, 9.54, 18.8, NULL),
(38, 7, 19, 5, 3.3, 2.425, 2.8, 0, 8.47, 7, 3.375, 2.325, 2.85, 0, 8.5, 16.97, NULL),
(39, 4, 24, 5, 3.5, 2.575, 2.9, 0, 8.9, 5, 3.575, 2.7, 2.95, 0, 9.17, 18.07, NULL),
(40, 5, 27, 5, 3.525, 2.675, 2.95, 0, 9.02, 4, 3.5, 2.625, 2.95, 0, 8.97, 17.99, NULL),
(41, 6, 32, 5, 3.325, 2.5, 2.75, 0, 8.53, 6, 3.425, 2.6, 2.9, 0, 8.89, 17.42, NULL),
(42, 11, 34, 5, 2.725, 2.35, 2.7, 0, 7.71, 11, 2.6, 2.25, 2.6, 0, 7.28, 14.99, NULL),
(43, 2, 40, 5, 3.75, 2.775, 3, 0, 9.48, 2, 3.725, 2.775, 3, 0, 9.43, 18.91, NULL),
(44, 10, 51, 5, 3.25, 2.3, 2.7, 0, 8.12, 9, 3.25, 2.4, 2.75, 0, 8.29, 16.41, NULL),
(45, 3, 6, 6, 3.675, 2.75, 2.95, 0, 9.31, 3, 3.675, 2.725, 2.95, 0, 9.33, 18.64, NULL),
(46, 9, 9, 6, 3.425, 2.525, 2.75, 0, 8.65, 11, 3.6, 2.625, 2.85, 0, 9.07, 17.72, NULL),
(47, 4, 13, 6, 3.7, 2.75, 2.95, 0, 9.31, 3, 3.625, 2.7, 2.95, 0, 9.27, 18.58, NULL),
(48, 6, 14, 6, 3.6, 2.7, 2.6, 0, 8.9, 9, 3.6, 2.7, 2.65, 0, 8.94, 17.84, NULL),
(49, 10, 16, 6, 3.3, 2.125, 2.65, 0, 8, 13, 3.5, 2.35, 2.65, 0, 8.48, 16.48, NULL),
(50, 8, 20, 6, 3.6, 2.7, 2.75, 0, 8.95, 8, 3.55, 2.7, 2.7, 0, 8.85, 17.8, NULL),
(51, 1, 23, 6, 3.775, 2.775, 3, 0, 9.5, 1, 3.775, 2.675, 3, 0, 9.44, 18.94, NULL),
(52, 5, 29, 6, 3.4, 2.4, 2.5, 0, 8.29, 12, 3.35, 2.475, 2.5, 0, 8.31, 16.6, NULL),
(54, 7, 35, 6, 3.525, 2.675, 2.65, 0, 8.83, 10, 3.575, 2.7, 2.7, 0, 8.98, 17.81, NULL),
(55, 2, 37, 6, 3.725, 2.75, 3, 0, 9.43, 2, 3.675, 2.725, 3, 0, 9.39, 18.82, NULL),
(56, 6, 38, 6, 3.625, 2.65, 2.85, 0, 8.98, 7, 3.55, 2.6, 2.8, 0, 8.86, 17.84, NULL),
(57, 5, 44, 6, 3.625, 2.675, 3, 0, 9.25, 5, 3.6, 2.6, 2.95, 0, 9.15, 18.4, NULL),
(58, 2, 47, 6, 3.625, 2.675, 2.8, 0, 9.05, 6, 3.55, 2.625, 2.7, 0, 8.87, 17.92, NULL),
(59, 5, 4, 7, 3.65, 2.775, 2.9, 0, 9.33, 4, 3.65, 2.65, 2.95, 0, 9.22, 18.55, NULL),
(60, 8, 6, 7, 3.65, 2.725, 2.75, 0, 9.13, 8, 3.525, 2.65, 2.7, 0, 8.79, 17.92, NULL),
(61, 17, 15, 7, 3.225, 2.425, 2.3, 0, 7.91, 17, 3.2, 2.45, 2.35, 0, 7.93, 15.84, NULL),
(62, 14, 17, 7, 3.425, 2.45, 2.4, 0, 8.28, 15, 3.5, 2.525, 2.45, 0, 8.48, 16.76, NULL),
(63, 13, 19, 7, 3.45, 2.4, 2.6, 0, 8.31, 14, 3.5, 2.525, 2.65, 0, 8.61, 16.92, NULL),
(64, 1, 21, 7, 3.75, 2.775, 3, 0, 9.47, 2, 3.825, 2.85, 3, 0, 9.66, 19.13, NULL),
(65, 3, 22, 7, 3.7, 2.775, 3, 0, 9.41, 3, 3.675, 2.775, 2.95, 0, 9.36, 18.77, NULL),
(66, 6, 23, 7, 3.625, 2.7, 2.85, 0, 9.18, 6, 3.7, 2.75, 2.9, 0, 9.33, 18.51, NULL),
(67, 6, 24, 7, 3.65, 2.675, 2.9, 0, 9.23, 5, 3.675, 2.7, 2.9, 0, 9.28, 18.51, NULL),
(68, 11, 26, 7, 3.425, 2.4, 2.65, 0, 8.43, 12, 3.525, 2.65, 2.8, 0, 8.93, 17.36, NULL),
(69, 9, 28, 7, 3.55, 2.625, 2.5, 0, 8.67, 10, 3.7, 2.775, 2.7, 0, 9.17, 17.84, NULL),
(70, 12, 30, 7, 3.5, 2.4, 2.7, 0, 8.55, 11, 3.475, 2.475, 2.75, 0, 8.68, 17.23, NULL),
(71, 10, 31, 7, 3.525, 2.525, 2.65, 0, 8.69, 9, 3.525, 2.525, 2.7, 0, 8.75, 17.44, NULL),
(72, 6, 39, 7, 2.7, 2.225, 1.95, 0, 6.86, 18, 2.75, 2.225, 2.05, 0, 7.03, 13.89, NULL),
(73, 2, 41, 7, 3.75, 2.8, 3, 0, 9.54, 1, 3.7, 2.775, 3, 0, 9.46, 19, NULL),
(74, 4, 43, 7, 3.675, 2.75, 2.85, 0, 9.18, 6, 3.8, 2.8, 3, 0, 9.51, 18.69, NULL),
(75, 16, 45, 7, 3.375, 2.375, 2.5, 0.2, 8.05, 16, 3.2, 2.375, 2.55, 0, 8.08, 16.13, NULL),
(76, 15, 48, 7, 3.4, 2.475, 2.55, 0, 8.37, 13, 3.375, 2.4, 2.55, 0, 8.24, 16.61, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `materialien`
--

CREATE TABLE `materialien` (
  `id` int(9) NOT NULL,
  `disziplin` int(9) NOT NULL,
  `bezeichnung` varchar(300) NOT NULL,
  `vorhanden` int(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `materialien`
--

INSERT INTO `materialien` (`id`, `disziplin`, `bezeichnung`, `vorhanden`) VALUES
(1, 1, 'Reuther-Sprungbretter', 6),
(2, 1, 'Open End', 6),
(3, 1, 'Kasten 5 Elemente', 6),
(4, 1, 'Matten normal', 42),
(5, 1, 'Niedersprungmatten 16 cm', 6),
(6, 1, 'Schulbarren mit Bodenbrett', 6),
(7, 2, 'Bodenfläche 12mx12mx3cm + 4cm', 1),
(8, 3, 'Niedersprungmatten 16 cm', 6),
(9, 3, 'Reck', 6),
(10, 3, 'Sprungkissen 40 cm', 6),
(11, 3, 'Reuther-Sprungbretter', 6),
(12, 3, 'Kasten 5 Elemente', 6),
(13, 3, 'Open End', 6),
(14, 3, 'Matten normal', 42),
(15, 4, 'Kasten 5 Elemente', 6),
(16, 4, 'Sprungkissen 40 cm', 6),
(17, 4, 'Open End', 6),
(18, 4, 'Reuther-Sprungbretter', 6),
(19, 4, 'Matten normal', 42),
(20, 4, 'Niedersprungmatten 16 cm', 6),
(21, 5, 'Sprungkissen 40 cm', 6),
(22, 5, 'Matten normal', 54),
(23, 5, 'Niedersprungmatten 16 cm', 6),
(24, 5, 'Schaukelringe', 6),
(25, 6, 'Schulbarren mit Bodenbrett', 6),
(26, 6, 'Reuther-Sprungbretter', 6),
(27, 6, 'Matten normal', 42),
(28, 6, 'Niedersprungmatten 16 cm', 6),
(29, 7, 'Reuther-Sprungbretter', 6),
(30, 7, 'Open End', 6),
(31, 7, 'Kasten 5 Elemente', 4),
(32, 7, 'Matten normal', 48),
(33, 7, 'Sprungkissen 40 cm', 6),
(34, 7, 'Niedersprungmatten 16 cm', 6),
(35, 7, 'Spiethbahnen 12X2m', 4),
(36, 7, 'Schulbarren mit Bodenbrett', 6),
(37, 8, '12x12 (Ja=1)', 1),
(38, 8, '12x18 (Ja=1)', 1),
(39, 8, '12x24 (Ja=1)', 1),
(40, 9, '18x24 (Ja=1)', 1),
(41, 9, '24x40 (Ja=1)', 1),
(42, 10, '12x12 (Ja=1)', 1),
(43, 10, '12x18 (Ja=1)', 1),
(44, 10, '12x24 (Ja=1)', 1);

-- --------------------------------------------------------

--
-- Table structure for table `session`
--

CREATE TABLE `session` (
  `id` int(9) NOT NULL,
  `verein` int(9) NOT NULL,
  `cookie` varchar(100) NOT NULL,
  `started` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `closed` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `session`
--

INSERT INTO `session` (`id`, `verein`, `cookie`, `started`, `closed`) VALUES
(1, 1, '163401b3424a036.77329434', '2022-10-07 12:27:46', 1),
(2, 2, '263406ede45ff79.27814820', '2022-11-06 12:21:23', 1),
(3, 1, '1634125f5eecf21.28408576', '2022-10-14 10:50:35', 1),
(4, 3, '3634186516e5900.51288054', '2022-11-21 18:23:10', 1),
(5, 4, '463432ea7752894.34375018', '2022-10-09 20:43:56', 1),
(6, 4, '46343329396e727.77891765', '2022-10-09 20:44:14', 1),
(7, 5, '563440416dba8a3.39669986', '2022-11-18 15:03:22', 1),
(8, 6, '663443c8ebf61e8.45713517', '2022-10-10 15:45:40', 1),
(9, 7, '76347d36608f9e5.41966585', '2022-10-13 08:59:55', 1),
(10, 1, '163493efb920034.13259280', '2022-10-14 10:54:17', 1),
(11, 1, '163493fd9883e58.71575345', '2022-10-14 10:58:41', 1),
(12, 8, '863495b5160ad88.21316680', '2022-10-14 13:01:38', 1),
(13, 8, '863495db210c682.47482421', '2022-10-14 13:01:38', 0),
(14, 9, '9634d8e3da98b22.30383347', '2022-10-18 13:30:12', 1),
(15, 10, '10634e52bbdb08e5.79903128', '2022-10-18 08:37:53', 1),
(16, 10, '10634e65e11ed0f0.81809357', '2022-10-18 08:37:53', 0),
(17, 9, '9634eaa64db92d4.06075713', '2022-10-18 13:30:12', 0),
(18, 11, '1163546e3485fbc9.62171235', '2022-11-17 22:25:29', 1),
(19, 12, '1263567669d99589.96838336', '2022-10-24 11:37:26', 1),
(20, 13, '1363579a36108100.17444290', '2022-10-25 08:14:10', 1),
(21, 13, '1363579ad2a33449.72794180', '2022-10-25 08:14:10', 0),
(22, 14, '146358dfef83ce31.30165911', '2022-10-26 07:45:11', 1),
(23, 14, '146358e587641540.06354439', '2022-10-26 12:01:16', 1),
(24, 14, '146359218c98b8d9.70268384', '2022-10-26 12:02:24', 1),
(25, 14, '14635a703e35f8c2.49274798', '2022-10-27 11:49:18', 0),
(26, 15, '15635cd5becb3fc8.69985542', '2023-01-16 16:17:41', 1),
(27, 16, '16635d1194bdb647.48307985', '2022-10-30 21:17:43', 1),
(28, 17, '17635e30d157fc70.50020155', '2022-10-30 08:22:46', 1),
(29, 16, '16635eebb0454998.85859031', '2022-10-31 06:52:21', 1),
(30, 16, '16635f70a578e395.40749277', '2022-10-31 07:00:36', 1),
(31, 18, '18635fd10b113174.28881057', '2022-10-31 22:51:12', 1),
(32, 19, '19635ffdb2156569.69034095', '2022-12-08 19:48:30', 1),
(33, 18, '1863605160e8e9f0.09958202', '2022-11-03 12:27:02', 1),
(34, 4, '46362841c0170f3.24853691', '2022-11-16 18:24:59', 1),
(35, 20, '20636359555647b9.37314570', '2022-11-03 06:01:57', 0),
(36, 21, '2163635abcce7e79.72836091', '2022-11-17 06:43:59', 1),
(37, 18, '186363b396b54c14.42674459', '2022-11-03 12:27:02', 0),
(38, 7, '76364e68b104ff8.24291985', '2022-11-04 10:20:11', 1),
(39, 2, '26367a6c3ca5ec5.77337158', '2022-11-06 12:21:23', 0),
(40, 1, '16368c691ba7f34.07545471', '2022-11-07 08:51:55', 1),
(41, 1, '16368c72b4d7517.52753243', '2022-11-07 09:04:55', 1),
(42, 1, '16368ca372efce8.47990225', '2022-11-16 17:10:13', 1),
(43, 23, '23636bbb0f6577c7.22590559', '2022-11-09 14:43:35', 1),
(44, 23, '23636bbc97def867.28960723', '2022-11-09 14:47:46', 1),
(45, 23, '23636bbd9295d6d8.99744341', '2022-11-28 08:22:53', 1),
(46, 22, '22636c018da6b186.63633798', '2022-11-09 20:26:23', 1),
(47, 17, '17637160326caa20.13988291', '2022-11-24 10:14:26', 1),
(48, 24, '246373bb5f8beb45.92329072', '2022-11-15 16:21:02', 1),
(49, 24, '246373bc6e899bb0.38280933', '2022-11-15 16:24:52', 1),
(50, 24, '246373bd540858a7.52874267', '2023-01-02 14:29:25', 1),
(51, 25, '25637513a944b801.52756017', '2022-11-24 14:08:23', 1),
(52, 16, '1663751937ecf5a6.12735997', '2022-11-16 17:22:37', 1),
(53, 1, '163751975d1cea6.09187724', '2022-11-24 13:05:03', 1),
(54, 16, '1663751c5d8570a0.72481167', '2022-11-16 17:23:31', 1),
(55, 4, '463752afb995382.02457706', '2022-11-22 13:20:39', 1),
(56, 21, '216375d82fc32d05.25273225', '2022-11-17 06:43:59', 0),
(57, 26, '26637691d5424fc1.21668828', '2022-12-01 15:51:56', 1),
(58, 11, '116376b4d919c3a1.62533322', '2022-11-17 22:30:11', 1),
(59, 5, '563779ebaba2822.52153282', '2022-11-18 15:07:58', 1),
(60, 5, '563779fce3927b9.84550930', '2022-11-18 15:07:58', 0),
(61, 27, '276377b08b3a3cf5.13712149', '2022-11-21 15:20:25', 1),
(62, 16, '1663792796d62337.48223635', '2022-11-19 18:59:34', 0),
(63, 28, '286379f5ac1cd9f9.27587884', '2022-11-20 09:38:52', 0),
(64, 29, '29637a515dadbe93.12231017', '2023-01-16 16:17:57', 1),
(65, 30, '30637b3d2a307092.15746046', '2023-01-16 13:25:32', 1),
(66, 3, '3637bc20e2b75f1.03272744', '2023-01-08 14:08:13', 1),
(67, 7, '7637be4b2a17194.22314693', '2023-01-05 20:19:35', 1),
(68, 4, '4637ccca7b85a16.76607050', '2022-12-10 11:30:54', 1),
(69, 31, '31637cee54d42f33.45674633', '2022-11-22 15:44:20', 0),
(70, 12, '12637e58705f8745.18165111', '2022-11-23 18:05:13', 1),
(71, 12, '12637e60d9dbf9b4.30909399', '2022-11-23 18:05:13', 0),
(72, 17, '17637f4402eadfb5.86746655', '2022-12-24 11:34:27', 1),
(73, 1, '1637f6bffc58ed0.83408912', '2022-12-22 07:05:37', 1),
(74, 25, '25637f7ad7438a97.17371935', '2022-11-24 14:08:23', 0),
(75, 32, '3263805ce99e6f15.28165203', '2022-11-25 06:12:57', 0),
(76, 34, '346380e0667aa617.78158818', '2022-11-25 15:34:59', 1),
(77, 35, '356381da7eb56b74.19831468', '2022-11-26 09:46:59', 1),
(78, 34, '3463825e5741ff75.66612180', '2022-11-30 17:41:19', 1),
(79, 27, '2763839d9461fdb0.60591883', '2023-01-04 19:29:55', 1),
(80, 23, '2363846fddb1fe04.72581779', '2022-12-02 16:14:14', 1),
(81, 34, '34638795bf4e5f40.62370371', '2022-11-30 17:41:19', 0),
(82, 26, '266388cd9c19deb4.74994106', '2022-12-09 16:37:13', 1),
(83, 23, '23638a245642d516.60867768', '2022-12-02 16:14:16', 1),
(84, 23, '23638a24589839e4.41683499', '2022-12-02 16:14:16', 0),
(85, 6, '6638e234e4cc4f0.98892748', '2022-12-05 16:58:54', 0),
(86, 36, '3663908af88e8c73.05953098', '2022-12-07 12:45:44', 0),
(87, 19, '1963923f8e092335.39661940', '2023-01-02 14:26:43', 1),
(88, 26, '2663936439e5b161.85766778', '2022-12-09 16:37:13', 0),
(89, 4, '463946dee35b700.45737078', '2022-12-21 10:17:17', 1),
(90, 37, '376396367d1b2fb1.70001782', '2022-12-18 20:30:11', 1),
(91, 37, '37639f7853838ca4.89482131', '2022-12-24 11:45:29', 1),
(92, 38, '3863a051accd17e3.53139238', '2022-12-21 13:50:05', 1),
(93, 39, '3963a0aacb1ecdf3.76798567', '2022-12-19 18:26:51', 1),
(94, 40, '4063a1ba308ce7a1.50880047', '2022-12-20 13:35:44', 0),
(95, 41, '4163a2b4aaa237f8.88565430', '2022-12-21 08:00:00', 1),
(96, 41, '4163a2bd100d16d9.52591254', '2022-12-21 08:00:44', 1),
(97, 4, '463a2dd2d449039.11372031', '2023-01-11 16:04:51', 1),
(98, 42, '4263a2f8f2af2799.15558148', '2022-12-21 12:15:46', 0),
(99, 38, '3863a30f0d5fc779.63563619', '2022-12-21 13:50:05', 0),
(100, 43, '4363a37406a8f022.81972443', '2022-12-21 21:12:14', 1),
(101, 1, '163a401c17e2c01.83480223', '2022-12-22 07:29:10', 1),
(102, 1, '163a407468b4469.91317202', '2022-12-30 15:18:13', 1),
(103, 17, '1763a6e3c3e33c84.71237977', '2022-12-24 11:34:27', 0),
(104, 37, '3763a6e659e54293.41222010', '2022-12-27 19:17:07', 1),
(105, 44, '4463a97bc16cc142.21337869', '2022-12-26 10:47:29', 0),
(106, 37, '3763ab44b3323687.04405200', '2022-12-27 19:17:07', 0),
(107, 1, '163af0135a588e6.95668262', '2023-01-17 13:16:53', 1),
(108, 45, '4563af0cd1392a77.83956985', '2023-02-08 18:00:18', 1),
(109, 46, '4663b27a0bc55119.94069468', '2023-01-04 05:16:04', 1),
(110, 47, '4763b27ff7e6acc6.27519920', '2023-01-02 06:55:51', 0),
(111, 19, '1963b2e9a3596105.33015342', '2023-01-02 15:21:53', 1),
(112, 24, '2463b2ea45e0cb27.62823972', '2023-01-02 14:29:25', 0),
(113, 19, '1963b2f691ab8653.37264993', '2023-01-02 15:21:53', 0),
(114, 46, '4663b50b94d9b2c6.67185792', '2023-01-04 05:16:04', 0),
(115, 48, '4863b56a48b801a0.62942054', '2023-01-09 15:19:36', 1),
(116, 27, '2763b5d3b33164f7.03345493', '2023-01-04 19:29:55', 0),
(117, 49, '4963b671cb8639d7.40840388', '2023-01-05 06:44:27', 0),
(118, 33, '3363b6cff895ef50.73942459', '2023-01-15 15:37:07', 1),
(119, 7, '763b730d7ec0ee0.09671358', '2023-01-05 20:30:29', 1),
(120, 3, '363bace4d3aa444.41324228', '2023-01-08 14:08:13', 0),
(121, 48, '4863bc30881bca87.80426825', '2023-01-09 15:19:36', 0),
(122, 50, '5063bd93d44e66c2.59017823', '2023-01-11 15:02:01', 1),
(123, 50, '5063becf69040013.49415818', '2023-02-13 15:52:34', 1),
(124, 4, '463bede23978529.05162178', '2023-01-11 16:04:51', 0),
(125, 51, '5163bfcb3dc80004.00190557', '2023-01-12 09:25:50', 1),
(126, 51, '5163bfd21e13c450.11174119', '2023-01-12 09:25:50', 0),
(127, 30, '3063c5504c369df0.22229194', '2023-01-16 13:40:15', 1),
(128, 30, '3063c553bfa00dd5.17602517', '2023-01-16 13:40:15', 0),
(129, 29, '2963c578b5604c60.22534565', '2023-01-16 16:17:57', 0),
(130, 52, '5263c58ef9a85785.58962472', '2023-01-16 18:00:29', 1),
(131, 52, '5263c590bd771e90.60165568', '2023-01-16 18:00:29', 0),
(132, 1, '163c69fc5ddef80.43722059', '2023-01-17 13:52:59', 1),
(133, 1, '163c6a83b3bfed5.03007829', '2023-01-17 18:29:30', 1),
(134, 1, '163c6e90aa63f20.92909983', '2023-01-17 20:52:39', 1),
(135, 1, '163c70a97ac2425.43333625', '2023-01-21 14:07:21', 1),
(136, 1, '163cbf1993def38.03426872', '2023-02-07 18:18:27', 1),
(137, 1, '163e295f3c414d1.29319601', '2023-02-08 07:15:42', 1),
(138, 1, '163e34c1eb2ba01.38549448', '2023-02-08 08:08:30', 1),
(139, 1, '163e3587e0981c2.86439329', '2023-02-08 09:45:46', 1),
(140, 1, '163e36f4a5a03e9.48895477', '2023-02-08 15:02:28', 1),
(141, 1, '163e3b98413b626.80944482', '2023-02-11 09:55:43', 1),
(142, 45, '4563e3e332197ff9.73005729', '2023-02-13 19:44:29', 1),
(143, 1, '163e7661f99fdb8.19596549', '2023-02-13 09:22:19', 1),
(144, 1, '163ea014b9c1ac9.86727024', '2023-02-13 09:29:08', 1),
(145, 1, '163ea02e4a387f6.57187580', '2023-02-13 11:13:11', 1),
(146, 1, '163ea1b475c35e5.81281249', '2023-02-13 13:02:59', 1),
(147, 1, '163ea35035a10c5.38415652', '2023-02-13 13:42:53', 1),
(148, 1, '163ea3e5d20b608.90476101', '2023-02-13 17:40:37', 1),
(149, 50, '5063ea5cc259bc08.36790447', '2023-02-13 16:22:14', 1),
(150, 50, '5063ea63b6ed65d8.92367709', '2023-04-06 11:41:39', 1),
(151, 1, '163ea7615ba5719.78222565', '2023-02-13 18:50:23', 1),
(152, 1, '163ea866ef301a3.55464648', '2023-02-13 20:13:44', 1),
(153, 45, '4563ea931d5f87b5.16789001', '2023-02-13 19:44:29', 0),
(154, 1, '163ea99f89689c1.61407783', '2023-02-13 20:16:00', 1),
(155, 1, '163ea9a8029b5f6.08254258', '2023-02-13 21:34:07', 1),
(156, 1, '163eaaccf33af23.58220004', '2023-02-13 21:38:44', 1),
(157, 1, '163ebdcda112636.21401281', '2023-02-21 20:15:01', 1),
(158, 1, '163f52645da9ce7.59340979', '2023-03-10 16:49:45', 1),
(159, 1, '1640b5fa9c90a64.57787010', '2023-03-10 16:53:01', 1),
(160, 1, '1641466bdd88801.58584638', '2023-03-21 16:57:34', 1),
(161, 1, '16419e1fe163d02.97728273', '2023-03-28 18:03:31', 1),
(162, 1, '164232bf3276410.33519869', '2023-04-06 08:51:00', 1),
(163, 1, '1642e87f4cf9916.20043914', '2023-04-11 08:10:28', 1),
(164, 50, '50642eaff33b2096.69693999', '2023-04-09 14:50:35', 1),
(165, 50, '506432d0bbe6fa35.68425219', '2023-04-09 16:03:03', 1),
(166, 50, '506432e1b79e88a1.86870358', '2023-04-18 17:17:26', 1),
(167, 1, '1643515f4ad3fa0.86143147', '2023-04-11 09:48:00', 1),
(168, 1, '164352cd035c832.12153813', '2023-04-11 10:15:18', 1),
(169, 1, '1643533365012b5.62314338', '2023-04-12 10:51:57', 1),
(170, 1, '164368d4d6e47c1.89476414', '2023-04-14 06:38:54', 1),
(171, 1, '16438f4fe638589.54652897', '2023-04-17 11:16:51', 1),
(172, 1, '1643d2aa3488d70.43286071', '2023-04-17 11:56:02', 1),
(173, 1, '1643d33d22bbf74.78984887', '2023-04-17 12:04:24', 1),
(174, 1, '1643d35c8b99a27.63057719', '2023-04-17 12:08:35', 1),
(175, 1, '1643d36c3109793.92531653', '2023-04-17 12:14:36', 1),
(176, 1, '1643d382c2582e9.40906962', '2023-04-19 15:58:06', 1),
(177, 50, '50643ed0a6de2376.04065151', '2023-04-18 17:17:26', 0),
(178, 1, '164400f8e058d42.74847464', '2023-04-25 18:07:26', 1),
(179, 1, '1644816deb122c2.30427831', '2023-04-27 06:37:18', 1),
(180, 1, '1644a181e4edff2.57073612', '2023-04-27 19:10:59', 1),
(181, 1, '1644ac8c37ba5e1.84220316', '2023-04-27 20:37:26', 1),
(182, 1, '1644add0677c505.92784088', '2023-04-27 22:16:13', 1),
(183, 1, '1644af42d6028a3.07315135', '2023-04-28 15:29:43', 1),
(184, 1, '1644be6674c9f18.55877757', '2023-04-28 15:32:33', 1),
(185, 1, '1644be7111dda20.40484714', '2023-04-28 15:34:20', 1),
(186, 1, '1644be77c0cb9c4.20497016', '2023-05-03 03:48:19', 1),
(187, 54, '546450dd16eba766.95510600', '2023-05-02 10:55:59', 1),
(188, 54, '546450ec3fa466d9.65033591', '2023-05-02 10:55:59', 0),
(189, 55, '5564510f74f32f70.80650357', '2023-05-02 13:26:12', 0),
(190, 1, '16451d983c9dc68.49752591', '2023-05-08 10:35:15', 1),
(191, 1, '16458d0634effc3.03827035', '2023-05-16 08:09:15', 1),
(192, 1, '164633a2be6d4e9.49780644', '2023-05-16 08:09:15', 0);

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `thekey` varchar(20) NOT NULL,
  `thevalue` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`thekey`, `thevalue`) VALUES
('hello', 'value');

-- --------------------------------------------------------

--
-- Table structure for table `verein`
--

CREATE TABLE `verein` (
  `id` int(9) NOT NULL,
  `vereinsname` varchar(300) NOT NULL,
  `vereinsname_suffix` varchar(300) DEFAULT NULL,
  `startetunterjugend` tinyint(1) NOT NULL,
  `gruendungsjahr` int(4) DEFAULT NULL,
  `anzahlaktivemitglieder` int(4) DEFAULT NULL,
  `prominente` varchar(500) DEFAULT '',
  `saisonziele` varchar(500) DEFAULT '',
  `homepage` varchar(100) DEFAULT NULL,
  `kontaktvorname` varchar(100) NOT NULL,
  `kontaktnachname` varchar(100) NOT NULL,
  `kontaktadresse` varchar(100) NOT NULL,
  `kontaktplz` varchar(100) NOT NULL,
  `kontaktort` varchar(100) NOT NULL,
  `kontakttelefon` varchar(100) NOT NULL,
  `abhaengigkeiten` varchar(500) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `passwort` varchar(300) NOT NULL,
  `unsubscribed` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `verein`
--

INSERT INTO `verein` (`id`, `vereinsname`, `vereinsname_suffix`, `startetunterjugend`, `gruendungsjahr`, `anzahlaktivemitglieder`, `prominente`, `saisonziele`, `homepage`, `kontaktvorname`, `kontaktnachname`, `kontaktadresse`, `kontaktplz`, `kontaktort`, `kontakttelefon`, `abhaengigkeiten`, `email`, `passwort`, `unsubscribed`) VALUES
(1, 'OK Munotcup', NULL, 0, 0, 0, '', '', 'https://munotcup.ch/', 'Alexandre', 'de Spindler', 'Rietstrasse 169', '8200', 'Schaffhausen', '+41 79 256 79 09', '', 'mc@tvschaffhausen.ch', '$2y$10$fTRNCD5zNloc6bXRQOdPZ.GLlnj1YMouEx6VMjsXMf6sM3eKlnkei', 0),
(2, 'TV Russikon', 'Russikon', 0, 1963, 89, '', 'Podestplatz an der Regionalmeisterschaft in Fehraltorf', 'http://www.tvrussikon.ch/', 'Melina', 'Comuzzo', 'Ludetswilerstrasse 3', '8322', 'Madetswil', '+41 78 636 12 02', '', 'melina.comuzzo@gmx.ch', '$2y$10$1YcC1fpcNat63L0rDbEIU.y7MjUoR4NU1vyME1a5QGJwoBsk8ml1i', 0),
(3, 'Turnfabrik Frauenfeld Jugend', 'Frauenfeld Jugend', 1, 2013, 0, '', 'Mit dem neuen Programm erfolgreich durch die Saison.', 'https://www.turnfabrik.ch/', 'Mascha', 'Michel', 'Hasenbühlstrasse 4', '8500', 'Frauenfeld', '+41 79 249 31 86', '', 'mascha.michel@gmx.ch', '$2y$10$/XuFQ3H6ycZdNhX5w/1cQOZ0vSugZb8jYpAntAA9w5HUKn6AaMzWy', 0),
(4, 'TV Weiningen', 'Weiningen', 0, 1915, 68, '', '', 'https://www.tvweiningen.ch/', 'Silja', 'Mohler', 'Zürcherstrasse 9a', '8104', 'Weiningen', '+41 78 656 05 88', 'Sprung / GK / Ring / Aero, darf nicht gleichzeitig gestartet werden - mehrere Turnende in versch. Disziplinen', 'n.schneider91@hotmail.com', '$2y$10$GbBPRsDEphGELBf9DWAvBec218SnFK2Eqaimy96xoV7bz02VTcb2.', 0),
(5, 'Verein Turnfabrik Frauenfeld', 'Frauenfeld', 0, 2013, 0, '', '', 'https://www.turnfabrik.ch/', 'Sandro', 'Gamper', 'Schaffhauserstrasse 16', '8500', 'Frauenfeld', '+41 77 428 89 39', '', 'sandro_gamper@hotmail.com', '$2y$10$DNq6Y/AtZ1eBxLiM8FDYoOUzIanJ6mtX0x2fK1E3FRMJFi4kY5Dqm', 0),
(6, 'DTV/TV Beggingen', 'Beggingen', 0, 0, 0, '', '', 'https://www.tvbeggingen.ch/', 'Florence', 'Aebi', 'Randenstrasse 4', '8228', 'Beggingen', '+41 79 847 95 80', '', 'floaebi@bluewin.ch', '$2y$10$SEFDX.2lWpFBnpauABvN5uawRybIb51K0IMSmtuAuCdgaDLzTX08G', 0),
(7, 'TV Schaffhausen Jugend', 'Schaffhausen Jugend', 1, 1835, 0, '', '', 'https://www.tvschaffhausen.ch/', 'Sebastian', 'Frei', 'Holzbrunnenstrasse 11', '8200', 'Schaffhausen', '+41 78 827 09 87', 'Einige unserer TurnerInnen starten auch bei den Aktiven des TV Schaffhausens', 'jugend.tvs@gmail.com', '$2y$10$HIai4b3j5gbogHC/5wQ90.8kMaKzkJIr7uYRbJHw7qeAQ3ZJWyi8a', 0),
(8, 'Jugend- und Sportverein Niederdorf', 'Niederdorf', 0, 2006, 40, '-', 'Spass und Freude am Turnen mit stetiger Weiterentwicklung des persönlichen Könnens.', 'https://www.jsv-niederdorf.ch/', 'Lea', 'Thomet', 'Dietisberg', '4448', 'Läufelfingen', '+41 79 758 96 41', NULL, 'lea.thomet@dietisberg.ch', '$2y$10$43i.o5sdXMXY02rlyy0oYu2.0go85owaVsdQAgjPzHLzMBFrmuxTm', 0),
(9, 'DTV Andelfingen', 'Andelfingen', 0, 0, 36, '', '', 'https://www.dtv-andelfingen.ch/', 'Vivienne', 'Götz', 'Schwellistrasse 45', '8450', 'Andelfingen', '+41 79 413 12 22', 'Wir haben Turnerinnen, welche in beiden Disziplinen starten werden. Schulstufenbarren und Gymnastik.', 'vivienne.goetz@dtv-andelfingen.ch', '$2y$10$aCMLIZZMd9NcL2ewYiqpZe7CQIceesAnTejY4xfpDI17jafY32.Jm', 0),
(10, 'TV Hegi', 'Hegi', 0, 1916, 19, 'Thaha Serhani, Samir Serhani', '', 'https://tvhegi.ch/', 'Roman', 'Baumann', 'Heinrich Bosshard-Strasse 30', '8352', 'Elsau', '+41 76 583 06 97', '', 'oberturner@tvhegi.ch', '$2y$10$ZgMdqxAEVfa0zrBQHzpLR.RJCCFe6sYku58P885OOtU4KE1ZzVVmO', 0),
(11, 'TV SATUS Schaffhausen', 'SATUS Schaffhausen', 0, 1878, 120, '', 'Teilnahme an KTF 2023 Wyland', 'https://www.satus-sh.ch/', 'Ivan Ernesto', 'Schaad', 'Lärchenstrasse 10', '8200', 'Schaffhausen', '+41 79 945 33 49', '', 'ivanschaad@hotmail.com', '$2y$10$nWCgnTyMGg4AKcp70HzMpeFGYVqzKm3CudvlStxb9xp3m8Vb1o3sm', 0),
(12, 'TV Altikon', 'Altikon', 0, 1938, 24, '', '', 'https://tvaltikon.clubdesk.com//', 'Tobias', 'Suter', 'Agnesstrasse 14a', '8406', 'Winterthur', '+41 76 570 75 88', '', 'nils.fleischer@bluewin.ch', '$2y$10$KNHLp1Yi2czQ7QwT5DMRS.st2iv0z8yQs6pc2cLprypj5dcl5QVc6', 0),
(13, 'Gym Getu Moosleerau', 'Moosleerau', 0, 2015, 9, '', 'Ziel: Final an der Aargauer und Schweizer Meisterschaft\nMunot-Cup Sieg von 2022 wiederholen ', 'https://swisslisting.com/gymgetumoosleerau', 'Michelle', 'Gautschi', 'Dorfstrasse 22', '5745', 'Safenwil', '+41 78 675 51 31', '', 'm.gautschi@me.com', '$2y$10$a5shfenyQeqR73paTVNtheLjqmB4KpTUjlxvlo02S0wzI8qU4o.xW', 0),
(14, 'TV Zeglingen', 'Zeglingen', 0, 1920, 100, 'Mario Dolder, Biathlet', 'Gute Note turnen und Spass haben', 'https://www.tvzeglingen.ch/', 'Lea', 'Thommen', 'Hagenmattweg 10', '4496', 'Kilchberg Bl', '+41 79 453 21 95', '', 'thommen.lea@bluewin.ch', '$2y$10$5wb9.ywUtjk0bvhvIG594OhYCB7qsrOVmIYOjGKO7JtabeVtyFKYS', 0),
(15, 'Turne Schlaate (Schleitheim)', 'Schlaate', 0, 1869, 0, '', '', 'https://turneschlaate.ch/', 'Leonie', 'Platt', 'Raaweg 11', '8226', 'Schleitheim', '+41 77 464 95 56', 'Bei unserem Verein gibt es mehrere Abhängigkeiten im Zeitplan. \n1. Es gibt Turnerinnen, welche bei der GK und bei der Gymnastik-Bühne starten. \n2. Die Leiterinnen der Jugendgruppen, sowohl StuBa als Aerobic, starten selbst bei der Aerobic. ', 'leonie.platt@turneschlaate.ch', '$2y$10$1tDexZSM35tFumqnBNCfVu7yNejY7vwXHkuxEEaXhAE7ZYpvgsazS', 0),
(16, 'TV Flaach', 'Flaach', 0, 1916, 0, '', '', 'https://tvflaach.ch/', 'Michelle', 'Breitenmoser', 'Chläfflerstrasse 6', '8416', 'Flaach', '+41 79 917 55 58', 'Bitte Stuba und Gym nicht zeitgleich planen. Wir haben sehr viele Turnerinnen, die beide Disziplinen machen. Vielen Dank!', 'michelle.breitenmoser@tvflaach.clubdesk.ch', '$2y$10$RAqHS2PGv8UXHnd9U5se3O1WMM6XgbmC52OwnFVpTi8WEbYvtW6jS', 0),
(17, 'TV Otelfingen', 'Otelfingen', 0, 1914, 50, '-', 'Dort weitermachen wo wir am Aargauer Kantonalturnfest 2022 aufgehört haben. ', 'https://tvotelfingen.ch/', 'Debora', 'Varrese', 'Glärnischweg 3', '8107', 'Buchs', '+41 76 435 47 37', 'Es gibt Überschneidungen von Turnenden im Tae und GK.', 'debora.varrese@gmail.com', '$2y$10$DcbFxFTEvtAlgzQ3tWZMzOGuXJfxX6/opEIZ8v9BBDsO.ZzbZqIY.', 0),
(18, 'TSV Rohrdorf', 'Rohrdorf', 0, 1935, 280, '', 'Aargauermeistertitel verteidigen\nSchweizermeistertitel verteidigen\nZufriedenstellende Wettkämpfe absolvieren', 'https://tsvrohrdorf.ch/', 'Lea', 'Jenelten', 'Mühlegasse 4', '5444', 'Künten', '+41 76 502 94 50', 'Sprung/ Schaukelring/ Reck sind mehrheitlich die gleichen Personen\nGymnastik Rasen könnte parallel dazu starten \n', 'tl@tsvrohrdorf.ch', '$2y$10$iBvZ4IcaVOH/0ox4o0RVRe4BqKPlOJG/zEWt5lN3s9ZhJgBYIxaKW', 0),
(19, 'TV Dietlikon', 'Dietlikon', 0, 1896, 50, '', 'Spass', 'https://tvdietlikon.ch/', 'Raffael', 'Pfaller', 'Tobelwiesstrasse 6', '8309', 'Nürensdorf', '+41 76 441 34 37', '', 'raffael.pfaller@hotmail.com', '$2y$10$Ux2Rkt0A1iaiJ2Rai3ZAieGNas2ytaVv8Bt/pdFufakoDL1OnheG.', 0),
(20, 'DTV Oberrüti', 'Oberrüti', 0, 1980, 140, '', 'Erster Wettkampf in diesem Jahr.\nWird als Standortbestimmung genützt.', 'https://www.dtvoberrueti.ch/', 'Seraina', 'Wyder', 'Berghof 1', '6034', 'Inwil', '+41 76 331 92 92', 'Bitte den Start vom GeTu Sins-Oberrüti, Gerätekombination berücksichtigen.\nEs gibt Turnerinnen, die an beiden Orten dabei sind.', 'serainawyder@hotmail.com', '$2y$10$oPT7h7sIIh60gMmJtl87befxdWu.UQ/FAEZvrYwnZPLCyre0dEtBG', 0),
(21, 'GeTu Sins-Oberrüti', 'Sins-Oberrüti', 0, 2015, 27, '', '', 'https://www.getu-sins-oberrueti.ch/', 'Seraina', 'Wyder', 'Berghof 1', '6034', 'Inwil', '+41 76 331 92 92', 'DTV Oberrüti, Schulstufenbarren und Gymnastik\nEs gibt Turnerinnen, welche in beiden Vereinen dabei sind.', 'seraina.wyder@eimax.ch', '$2y$10$sbNEBNaNTyjlSc6aDeGlH.ms5T9v.rtHyCSwF4XrO80s4B1U6sA/u', 0),
(22, 'TV Regensdorf', 'Regensdorf', 0, 1920, 50, '', 'Zürcher KTF Wyland, SMV Oberriet', 'https://www.tv-regensdorf.ch/', 'Patrick', 'Lienert', 'Alte Buchserstrasse 8', '8106', 'Adlikon b. Regensdorf', '+41 78 860 57 52', '', 'p.lienert@gmail.com', '$2y$10$BWNGA9PLOLXgVK3n5ckLKuXXpp/6H32eGv8cm2cbdzjH9Tnv/X3oO', 0),
(23, 'Geräteriege Eschlikon', 'Eschlikon', 0, 1973, 113, 'Nein', 'Unfallfrei bleiben: Eine Saison ohne spontane Änderungen direkt vor oder gar während den Wettkämpfen\nNur im Team kommt frau weiter: Den guten Zusammenhalt untereinander beibehalten & Spass haben am Turnen', 'https://www.geraeteriegeeschlikon.com/', 'Tanja', 'Groot Kormelink', 'Schaffhauserstrasse 155', '8057', 'Zürich', '+41 79 822 35 62', 'Nur dass unsere 3 Disziplinen aneinander vorbeigehen :)', 'tanja.groot@bluewin.ch', '$2y$10$/OjgJsxHOFEV20uaaE.KPu3CljJPPaLDY2PofAE3FuD0U3P/bzP3q', 0),
(24, 'TV Malans', 'Malans', 0, 0, 0, '', '', 'https://www.tvmalans.ch/', 'Rebecca', 'Dürmüller', 'Heuteilerweg 22', '7208', 'Malans', '+41 79 950 36 63', '', 'rebecca.duermueller@bluewin.ch', '$2y$10$G.flX2Aq4IS668oQw7xN9.KuRZ3dX5ccK4sl1SC/Jfs3gIgifG3j2', 0),
(25, 'DTV Henggart', 'Henggart', 0, 0, 0, '', 'Ein super KTF 2023 im Wyland zu organisieren. ', 'https://www.dtv-henggart.ch/', 'Nadja', 'Ganz', 'Maienstrasse 11', '8406', 'Winterthur', '+41 79 431 95 32', 'Wenn es irgendwie möglich wäre, würden wir gerne am Nachmittag starten, da wir einige Turnerinnen haben, welche erst auf den Nachmittag kommen können. Wäre super, wenn das berücksichtigt werden könnte! LG Nadja', 'nadja-ganz@hotmail.com', '$2y$10$8aD15VflP4Ov319QFHjLQOuINtCAj9MqX.332b3IrXQqeaicDsO.W', 1),
(26, 'TV Thayngen', 'Thayngen', 0, 1884, 60, '', '', 'https://tvthayngen.ch/', 'Miriam', 'Bosshard', 'Zieglerweg 28', '8240', 'Thayngen', '+41 79 838 86 03', '', 'miriam.bosshard@tvthayngen.ch', '$2y$10$z66k4AEVJQmNsGEGf2.0XeoSIHTcHIEulC9sI7AL4KKNTvqMTjI4e', 0),
(27, 'TV Gachnang-Islikon', 'Gachnang-Islikon', 0, 1910, 85, '', 'Thurgauermeister oder Note 9.2', 'https://tvgi.ch/', 'Céline', 'Erb', 'Zürcherstrasse 96', '8500', 'Frauenfeld', '+41 79 220 83 92', 'Alle starten in Sprung und Schaukelringe', 'celineerb99@gmail.com', '$2y$10$.aNXn8hnkeQK5VCXden6L.TT9XWCWA/rWANtF4CVaunSMWCP6bZpS', 0),
(28, 'DR & TV Sulz', 'Sulz', 0, 1910, 75, '', '', 'https://www.tvsulz.ch/', 'Pascal', 'Weiss', 'Büntacher 5', '5085', 'Sulz AG', '+41 79 397 13 82', 'Barren und GK können zur gleichen Zeit stattfinden, bei allen anderen Disziplinen gibt es Überschneidungen bei den Teilnehmern', 'oberturner@tvsulz.ch', '$2y$10$.Q9XQT1rU6RXRvMem7OO2up8IWYyqwyosvSXkbxGwjm0HBNQvVEYe', 0),
(29, 'Turne Schlaate Jugend (Schleitheim)', 'Schlaate Jugend', 1, 1869, 0, '', '', 'https://turneschlaate.ch/riegen/jugend/', 'Leonie', 'Platt', 'Raaweg 11', '8226', 'Schleitheim ', '+41 77 464 95 56', 'Die Leiter der Jugendriegen starten selbst beim Wettkampf bei der Disziplin Aerobic.  ', 'leonie.platt@outlook.com', '$2y$10$Wraa9pDmwPmkTWUUChwVfuTr6hhW0Xrdbiz5H99CkzZPterXsnAPS', 0),
(30, 'TV Büsingen', 'Büsingen', 0, 1894, 33, '', '', 'https://tv-buesingen.ch/', 'Francesco', 'Güntert', 'Hochstrasse 294', '8200', 'Schaffhausen', '+41 78 806 97 96', 'Gymnastik und Gerätekombination betrifft die identischen aktiv Turner*innen aus dem Verein', 'tk.tvbuesingen@gmail.com', '$2y$10$zld36BFHd6cx..aueDtnjeTsg/B7XEV928HC/rIoBlk.giDLyHql6', 0),
(31, 'TV Hemmental', 'Hemmental', 0, 1925, 0, '', 'Möglichst alle Aktivmitglieder an einem Turnfest starten zu lassen.', 'https://www.tv-hemmental.ch/', 'Michael', 'Schlatter', 'Hauptstrasse 42', '8231', 'Hemmental ', '+41 79 832 37 51', 'Eine Doppelturnerin ist bei uns im Verein, TV Hemmental und SATUS Schaffhausen', 'michi.schlatter@gmail.com', '$2y$10$Ri8HHyuNr9Eo/as0S1u0s.If.BG6dB1blKstJG1ye8gcvfAbtTePG', 0),
(32, 'TV Schaffhausen', 'Schaffhausen', 0, 1835, 35, '', 'über der Note 9.2 turnen.', 'https://www.tvschaffhausen.ch/', 'Christian', 'Werner', 'Rütihofstrasse 6', '8248', 'Uhwiesen', '+41 76 432 10 17', 'Bitte nicht zu früh, da ich die WRs einweisen muss.', 'christianwerner@gmx.ch', '$2y$10$mB4nVrQTCX01QEDVPUJl6.z76koBPigvJpz/KMbmZsoELFng69JnO', 0),
(33, 'TV Egg', 'Egg', 0, 1902, 280, '', '', 'https://www.tvegg.ch/', 'Corinne', 'Studer', 'Seewisenstrasse 19', '8132', 'Egg b. Zürich', '+41 78 712 96 51', 'RE, BO und GYB teilweise gleiche Turnende. TAe und GYK teilweise gleiche Turnende. GYG Turnende aus allen angemeldeten Disziplinen', 'corinne.studer@ggaweb.ch', '$2y$10$TaOy0DtqZG8xHYeRiw7theKfC01oSviSt16LD1DQJEQvtEPaoGnHC', 0),
(34, 'TV Gelterkinden', 'Gelterkinden', 0, 1864, 0, '', '', 'https://www.tvgelterkinden.ch/', 'Lea', 'Hasler', 'Rohrbachweg 5', '4460', 'Gelterkinden ', '+41 79 692 80 98', '', 'lea_hasler@bluewin.ch', '$2y$10$sWIHUI8V8b1OSwOE8p3avuk6E6shHk4f4.qZCtwQxcOR3idwQ1jUu', 0),
(35, 'TV Dinhard', 'Dinhard', 0, 1918, 76, '', '', 'https://tvdinhard.ch/', 'Larissa', 'Erni', 'Zelgliweg 2', '8474', 'Dinhard', '+41 78 681 43 59', 'BA Männer wären dankbar, wenn sie am morgen starten können, da am Nachmittag noch eine Hochzeit stattfindet.', 'lari.erni95@gmail.com', '$2y$10$wDPLJioLzRT1rNPSz/qNkeidttb7WF0GGe3NTNBou/PUay0Mv3uZq', 0),
(36, 'TV Andelfingen', 'Andelfingen', 0, 1881, 43, '', '', 'https://www.tv-andelfingen.ch/', 'Dominik', 'Schäuble', 'Rundstrasse 54', '8400', 'Winterthur', '+41 79 815 20 60', '', 'dominik.schaeuble@gmail.com', '$2y$10$XyKReFGisGrMFVD5cjkGD.LDb9sitPw6zcof5rWLL.e3wKxZDEvzy', 0),
(37, 'DR Ossingen', 'Ossingen', 0, 0, 50, '', '', 'https://www.tvossingen.ch/', 'Sarah', 'Meier', 'Goldbuck', '8475', 'Ossingen', '+41 79 479 52 21', '', 'sarah.meier@gao.ch', '$2y$10$syryOA.1uYMf/5JZQTDKTugbRYY.ip/ZpVvaOMy/zm1sLXvDvPbx2', 0),
(38, 'TV 8427', '8427', 0, 0, 0, '', '', 'https://tv8427.ch/', 'Sibylle', 'Weber', 'Chlosterwis 13', '8427', 'Freienstein', '+41 79 257 86 80', 'mehrere Turnerinnen, die sowohl Gymnastik als auch bei SSB mitturnen', 'sibylle_weber@bluewin.ch', '$2y$10$SelrEsVgfOknmfLSI/.Tx.Mf.8osbevbPLLehrpuy2vUYbY6ZyfsC', 0),
(39, 'Jugi Breite Jugend', 'Breite Jugend', 1, 0, 0, '', '', 'https://www.frauenturnvereinbuchthalen.ch/riege-breite/jugendriege-breite/', 'Janine', 'Cardone-Glaus', 'Hohlenbaumstrasse 56', '8200', 'Schaffhausen', '+41 79 208 03 39', 'Teilnahme an den SHMVJ am gleichen Tag', 'jugi.breite@gmail.com', '$2y$10$LxXP6sYh1Wzepq9wlvA5mOniIaWRb9VPysoFZ4HC8mqbz6iBoJBXW', 0),
(40, 'TV Eschlikon', 'Eschlikon', 0, 1877, 70, '', 'Verteidigung der drei Thurgauermeistertitel am Barren, Sprung und Schaukelring', 'https://tveschlikon.ch/', 'Flavio', 'Oehler', 'Herdernwisstrasse 7', '8360', 'Eschlikon', '+41 79 378 68 06', '', 'flavio.oehler@gmail.com', '$2y$10$XECypQE/iyewUg3UNXGgh.JfEtWkPIbZLUVRpsUYsp6DD6C7kW9dO', 0),
(41, 'TV/DR Dägerlen', 'Dägerlen', 0, 1912, 45, '', '', 'http://www.tv-daegerlen.ch/', 'Janick', 'Furrer', 'Andelfingerstrasse 3', '8452', 'Adlikon bei Andelfingen', '+41 79 595 65 64', 'GK und Barren sowie GK und Gymnastik nicht gleichzeitig.', 'furrerjanick@gmail.com', '$2y$10$qhJUJa/MNbD7BtwFiB8Q2uOu/5X6rVnomWJHgzNMA421u3hSZU0Qi', 0),
(42, 'STV Illhart-Sonterswil', 'Illhart-Sonterswil', 0, 1916, 35, '', 'Guter Einstieg in die neue Saison mit neuen Jungturnern und neuem Programm. ', 'https://www.stvillhartsonterswil.ch/', 'Marco', 'Moser', 'Industriestrasse 7', '8570', 'Weinfelden', '+41 79 679 92 06', '', 'marco.mosi94@gmail.com', '$2y$10$sUmv/g97TjB909R9hyu.WeR7XaWpJfp83m6sIc8HgmUz/qmjLHlHu', 0),
(43, 'TV Buchthalen', 'Buchthalen', 0, 0, 0, '', '', 'https://www.tv-buchthalen.ch/', 'Philipp', 'Schibli', 'Herblingerstrasse 89', '8207', 'Schaffhausen', '+41 79 702 44 85', '', 'philipp.schibli@tv-buchthalen.ch', '$2y$10$n9ygOxap2R8tRrlF2SbgMu2qLWtpJ0WSc43C1h7WuqMguiB4aq0KO', 0),
(44, 'TV Löhningen', 'Löhningen', 0, 1997, 0, '', '', 'https://www.tvloehningen.ch/', 'Elena', 'Vögele', 'Im Benze 25', '8222', 'Beringen', '+41 78 667 66 13', '', 'elenavoegele@msn.com', '$2y$10$0ky4rWczBHKxYavS9VSIZeFrfxuvCtcs/cGSYrGVf9ncTTz8pkWMi', 0),
(45, 'TV Trüllikon', 'Trüllikon', 0, 1913, 35, 'Keine', '-', 'https://www.tv-truellikon.ch/', 'Rainer', 'Müller', 'Schlosshofstrasse 21', '8400', 'Winterthur', '+41 79 288 32 34', 'Gymnastik und GK sind mehrheitlich die gleichen Turner*innen', 'rainer.mueller.ch@gmail.com', '$2y$10$4PhjTH2/2DBnTWFDGF6NyeQZ1Iuls3bLZ8p0xP2Da3kSueTWchaGW', 0),
(46, 'GTT Tägerwilen', 'Tägerwilen', 0, 2014, 70, '', '', 'https://gtt-taegerwilen.ch/', 'Michaela', 'Battistini', 'Ländlistrasse 22', '8274', 'Gottlieben', '+41 79 302 41 56', 'Wir starten mit der Jugend und den Aktiven. Teilweise starten sie in beiden Gruppen. ', 'michaela@battistini.li', '$2y$10$qBqkBfwfcFBCz7qfvkbEQuXfy.pCMLgpuSFiGTSI.neY5O7US25JK', 0),
(47, 'GTT Tägerwilen Jugend', 'Tägerwilen Jugend', 1, 2016, 70, '', '', 'https://gtt-taegerwilen.ch/', 'Michaela', 'Battistini', 'Ländlistrasse 22', '8274', 'Gottlieben', '+41 79 302 41 56', '', 'jannika@battistini.li', '$2y$10$SD7p/vxOfLMO4.qi1QZEXO/xeme6VXt8qd/k81Y6vDUFQ7oSZLBIy', 0),
(48, 'TV/DR Wiesendangen', 'Wiesendangen', 0, 1893, 0, '', '', 'https://tv-wiesendangen.ch/v2/', 'Michaela', 'Gachnang', 'Gemeindehausstrasse 20', '8542', 'Wiesendangen', '+41 79 223 72 19', 'Wir starten mit einer Gymnastik und Gerätekombination. Diverse unserer TUI sind in beiden Aufführungen dabei.', 'dr.hauptleiterin@tv-wiesendangen.ch', '$2y$10$HPRlQqVJDzj5H0zXfW054.J/A3GmMZYlVJMH3sTWxp7Qm3SZEFOqO', 0),
(49, 'Frauengym Thayngen ', 'Thayngen', 0, 1998, 18, '', '', 'https://www.frauengym.ch/', 'Christina ', 'Krämer ', 'Zieglerweg 19', '8240', 'Thayngen ', '+41 78 818 78 16', '', 'christina.starck@gmx.de', '$2y$10$AcXKbbM43sFEpvJMfkHiBuDTGwK0u7ydGGxTI0Xi34pl2OQJbEySa', 0),
(50, 'TV/DTV Schupfart', 'Schupfart', 0, 1890, 53, '', '', 'https://tvschupfart.ch/', 'Julia', 'Schüpfer', 'Kornweg 11', '4322', 'Mumpf', '+41 79 870 16 88', 'Gleiche Personen in den Disziplinen GK und TEA', 'julia1862@bluewin.ch', '$2y$10$FLXaEvyWm/Sarhxb8C6AGueTEDm3q0J85ebCELkrBJuADLpYzpkcm', 1),
(51, 'TV Rafz', 'Rafz', 0, 1907, 50, '-', '-', 'https://www.tvrafz.ch/', 'Marcel', 'Gysel', 'Schluchewäg 16', '8197', 'Rafz', '+41 79 343 93 92', '', 'marcel.gysel@lfs.ch', '$2y$10$ywXn3Ulbkjelcf1nSOCcLe/uaG2zD86kQVDVB.uWour5/eSEOgKsW', 0),
(52, 'TV Ossingen', 'Ossingen', 0, 1893, 45, '', '', 'https://www.tvossingen.ch/', 'Beda', 'Arztmann', 'Gütighauserstrasse 4', '8475', 'Ossingen', '+41 79 711 35 04', '', 'oberturner@tvossingen.ch', '$2y$10$I6vBphZ7k7C0cGW0hEhxr.hfr1hqABX0/b9J8jT/HNoIYd5UQSX1e', 0),
(54, 'TV Egg 35 Plus', 'Egg 35 Plus', 0, 1902, 280, '', '', 'https://www.tvegg.ch/', 'Corinne', 'Studer', 'Seewisenstrasse 19', '8132', 'Egg', '+41 78 712 96 51', NULL, 'despindler@gmail.com', '$2y$10$fTRNCD5zNloc6bXRQOdPZ.GLlnj1YMouEx6VMjsXMf6sM3eKlnkei', 0),
(55, 'TV Egg GYR-Grossfeld', 'Egg GYR-Grossfeld', 0, 1902, 280, '', '', 'https://www.tvegg.ch/', 'Corinne', 'Studer', 'Seewisenstrasse 19', '8132', 'Egg', '+41 78 712 96 51', NULL, 'desa@zhaw.ch', '$2y$10$fTRNCD5zNloc6bXRQOdPZ.GLlnj1YMouEx6VMjsXMf6sM3eKlnkei', 0);

-- --------------------------------------------------------

--
-- Table structure for table `vereinmachtdisziplin`
--

CREATE TABLE `vereinmachtdisziplin` (
  `verein` int(9) NOT NULL,
  `disziplin` int(9) NOT NULL,
  `anzahlturner` int(4) NOT NULL,
  `dauer` time NOT NULL,
  `erfolge` varchar(500) DEFAULT '',
  `leitung` varchar(300) DEFAULT '',
  `vorfuehrungerstmalwettkampf` tinyint(1) DEFAULT NULL,
  `wieoftdisziplinmunotcup` int(4) DEFAULT NULL,
  `besonderheiten` varchar(500) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vereinmachtdisziplin`
--

INSERT INTO `vereinmachtdisziplin` (`verein`, `disziplin`, `anzahlturner`, `dauer`, `erfolge`, `leitung`, `vorfuehrungerstmalwettkampf`, `wieoftdisziplinmunotcup`, `besonderheiten`) VALUES
(2, 10, 7, '00:02:55', '', 'Melina Comuzzo', 1, NULL, ''),
(3, 2, 12, '00:04:10', '', 'Mascha Michel / Alina Betschart', 1, NULL, 'Sie wird das erste Mal geturnt.'),
(4, 4, 20, '00:05:00', '', 'Mika Hodel', 0, NULL, ''),
(4, 5, 16, '00:05:00', '', 'Tanja Lieberherr, Thomas Rüttimann, Silja Mohler', 0, NULL, ''),
(4, 7, 30, '00:05:00', '', 'Flavia Brunner, Nathalie Schneider', 0, NULL, ''),
(4, 10, 8, '00:05:00', '', 'Olivia Gyr, Fiona Machaz', 0, NULL, ''),
(5, 2, 22, '00:05:00', '', 'Alessia Jumly & Xeno Oettli', 0, NULL, ''),
(5, 5, 25, '00:05:00', '', 'Anna Schenk', 0, NULL, ''),
(6, 1, 15, '00:03:10', '', 'Vincent Sieber', 0, 1, ''),
(6, 6, 17, '00:04:00', '', 'Sophia Wanner', 0, 1, ''),
(6, 7, 14, '00:04:44', '', 'Andrea Vogelsanger und Naomi Wanner', 0, 1, ''),
(6, 8, 18, '00:03:24', '', 'Florence Aebi und Vera Wanner', 0, 1, ''),
(7, 4, 26, '00:04:00', '', 'Lily Beyeler', 1, NULL, ''),
(8, 10, 8, '00:03:28', '', 'Alina Staudenmann / Tiziana Ritter', 0, 1, ''),
(9, 6, 15, '00:03:54', '', 'Regula Wegmann, Barbara Wegmann', 0, NULL, ''),
(9, 9, 20, '00:03:56', '', 'Vivienne Götz, Alina Keiser, Nicole Fritschi', 0, NULL, ''),
(10, 1, 12, '00:03:15', '', 'A. Gisler', 0, 6, ''),
(11, 4, 17, '00:02:01', '', 'Silvan Epprecht', 0, 22, ''),
(11, 5, 12, '00:02:56', '', 'Loris Schüpbach', 0, 22, ''),
(12, 1, 11, '00:03:40', '', 'Tobias Suter', 0, 2, ''),
(13, 6, 9, '00:03:50', '', 'Uschi Dätwyler', 1, 4, ''),
(14, 6, 10, '00:03:34', '', 'Lea Thommen', 0, 1, 'Ein selbst zusammengestellter Bewegungsablauf'),
(15, 7, 10, '00:03:10', '', 'Daniela Cula und Lucia Boll', 0, 2, ''),
(15, 10, 7, '00:03:25', '3-Facher Schweizermeister in der Kategorie 35+', 'Caro Güttinger ', 0, 2, 'Wir freuen uns, endlich unser \r\nneues Programm dem Publikum präsentieren zu dürfen.'),
(16, 6, 21, '00:04:00', '', '', 1, NULL, ''),
(16, 9, 37, '00:04:00', '', '', 1, NULL, ''),
(17, 7, 11, '00:03:10', '', 'Debora Varrese und Sinja Kühne', 0, 3, ''),
(17, 10, 11, '00:03:30', '', 'Tamara Blaser', 0, 1, ''),
(18, 3, 23, '00:05:00', '', 'Adrian Kaufmann, Roger Wüst', 0, NULL, ''),
(18, 4, 30, '00:03:20', '', 'Simone Naef, Luca Kaufmann', 0, NULL, ''),
(18, 5, 32, '00:05:00', '', 'Sereina Uehli, Yanik Hunziker, Madlene Zehnder', 0, NULL, ''),
(18, 9, 20, '00:03:50', '', 'Janine Moret, Sandra Banz', 0, NULL, ''),
(19, 5, 18, '00:04:05', '', 'Raffael Pfaller', 0, 3, 'erstmals mit 6 ringen'),
(19, 7, 25, '00:04:01', '', 'Andreas Zaugg, Micha Carrel, Natali Stöppel, Lena Arndt', 0, 3, ''),
(19, 8, 8, '00:03:19', '', '', 0, 3, ''),
(20, 6, 16, '00:04:30', '', 'Fabienne Bourquin, Leah Casillo', 1, NULL, ''),
(20, 8, 12, '00:04:30', '', 'Fabienne Zemp, Ramona Inderkum', 1, NULL, 'Allererster Wettkampf für das neue Leiterteam.'),
(21, 7, 27, '00:04:30', '', 'Sarah Kaufmann, Vanessa Kohler, Fabienne Bourquin', 1, NULL, 'Allererste Vorführung mit dem neuen Leiterteam.'),
(22, 3, 14, '00:04:15', '', 'Janik Schlatter', 1, NULL, 'Da es auf nächstes Jahr auch eine neue Musik gibt, ist die Zeit noch nicht korrekt.'),
(22, 7, 20, '00:03:52', '', 'Kim Heimgartner', 0, NULL, ''),
(23, 2, 24, '00:04:15', '', 'Katja Kellenberger', 0, 1, 'Reines Frauen-Team'),
(23, 6, 20, '00:04:00', '', 'Tanja Groot Kormelink', 1, 1, ''),
(23, 7, 22, '00:03:38', '', 'Tanja Groot Kormelink', 0, 1, ''),
(24, 5, 12, '00:04:32', '', 'Nele Pahl, Mischa Liesch', 0, NULL, ''),
(24, 7, 24, '00:04:32', '', '', 0, NULL, ''),
(26, 3, 12, '00:04:00', '', 'Sina Bosshard / Miriam Bosshard', 0, NULL, ''),
(26, 7, 18, '00:03:30', '', 'Linda Surber', 1, NULL, 'Wir starten dieses Jahr das erste Mal in einer GK mit Sprung und Boden. Das junge Team ist motiviert Vollgas zu geben! '),
(27, 4, 25, '00:02:40', '', 'Claudio Hollenstein, Moni Erb, Céline Erb', 0, NULL, ''),
(27, 5, 25, '00:04:10', '', 'Claudio Hollenstein, Moni Erb, Céline Erb', 0, NULL, ''),
(28, 1, 30, '00:03:20', '', 'Sacha Renevey, Yannick Christen, Luca Thomann', 0, 3, ''),
(28, 3, 28, '00:04:50', '', 'Daniel Boss, Jennifer Senn, Nicola Christen', 0, 3, ''),
(28, 7, 25, '00:03:30', '', 'Elodie Schär, Ayline Unternährer, Debora Erdin', 0, 3, ''),
(28, 9, 25, '00:03:25', '', 'Alina Deiss, Lara Wächter, Ramon Weiss, Pascal Weiss', 0, 3, ''),
(29, 6, 20, '00:02:30', '', 'Caro Güttinger und Leonie Platt', 0, 2, '21 Mädchen im Alter von 11 bis 13 Jahren freuen sich, am Munotcup starten zu dürfen.'),
(29, 10, 18, '00:03:10', '', 'Caro Güttinger und Patricia Meister', 1, 2, 'Neu gegründetes Aerobic Jugendteam. Es ist für alle 18 Kinder der 1. Wettkampf in der Aerobic.'),
(30, 7, 21, '00:03:25', '', 'Karin Meyer', 0, 2, ''),
(30, 8, 11, '00:03:41', '', 'Alina Waldvogel', 0, 2, ''),
(31, 3, 10, '00:03:55', '', 'Michael Schlatter', 0, 8, 'Sehr viele junge Teilnehmer '),
(31, 7, 15, '00:04:20', '', 'Anja Leu, Carmen Leu, Michael Schlatter', 0, 8, 'Sehr viele junge Teilnehmer '),
(32, 1, 20, '00:03:00', '', 'Hanna Engelhart / Laura Steinacher', 1, 25, ''),
(32, 4, 20, '00:02:25', '', 'Lukas Heieck / Lily Beyeler / Manuel Germann', 1, 25, ''),
(32, 5, 20, '00:02:25', '', 'Chantal Roth / Anna-Lena Harder', 1, 25, ''),
(33, 2, 24, '00:05:00', '', 'Nicole Inauen und Pascal Studer', 0, NULL, ''),
(33, 3, 12, '00:04:00', '', 'Tina Gut', 0, NULL, ''),
(33, 8, 6, '00:04:00', '', 'Cédrine Glanzmann', 0, NULL, ''),
(33, 9, 17, '00:03:11', '', 'Michaela Alder', 0, NULL, ''),
(33, 10, 12, '00:04:00', '', 'Nadine Pfister', 0, NULL, ''),
(34, 5, 18, '00:04:31', '', 'Barbara Schobel, Nina Tanner', 0, NULL, ''),
(34, 8, 10, '00:04:30', '', 'Franco Polsini', 0, NULL, ''),
(34, 9, 12, '00:04:19', '', 'Nadja Wirz, Lea Hasler', 0, NULL, ''),
(35, 1, 12, '00:03:30', '', 'Philipp Matter', 1, NULL, ''),
(35, 6, 16, '00:03:45', '', 'Pascale Hohl, Muriel Büsser', 0, NULL, ''),
(35, 8, 13, '00:03:30', '', 'Flavia Hasler, Valeria Huder', 1, NULL, ''),
(36, 1, 16, '00:03:30', '', 'Daniel Fritschi, Serafin Schneider', 0, NULL, ''),
(37, 6, 20, '00:03:39', '', 'Lea Wetter, Ladina Widmer', 0, NULL, ''),
(37, 8, 24, '00:03:10', '', 'Lara Kaul, Chiara Schmuki, Pascale Stutz', 0, NULL, ''),
(38, 6, 20, '00:04:00', '', 'Bea Loch & Mira Schneider', 1, NULL, ''),
(38, 9, 25, '00:04:00', '', '', 1, NULL, ''),
(39, 7, 15, '00:05:00', '', 'Esther Bayer', 0, NULL, ''),
(40, 1, 25, '00:03:22', '', 'Flavio Oehler, Fabian Wohlwend', 0, NULL, '6 Barren'),
(40, 4, 19, '00:03:00', '', 'Flavio Oehler, Fabian Wohlwend', 0, NULL, ''),
(40, 5, 13, '00:03:04', '', 'Flavio Oehler, Fabian Wohlwend', 0, NULL, ''),
(41, 1, 14, '00:03:48', '', 'Severin Furrer', 0, NULL, ''),
(41, 7, 25, '00:04:23', '', 'Fabienne Aeby, Joel Furrer, Janick Furrer', 0, NULL, ''),
(41, 8, 18, '00:03:34', '', 'Sara Ganz', 0, NULL, ''),
(42, 1, 11, '00:00:03', '', 'Marco Moser', 1, NULL, ''),
(43, 7, 20, '00:03:30', '', '', 0, NULL, ''),
(44, 6, 14, '00:03:08', '', 'Elena Vögele', 0, 2, ''),
(45, 7, 14, '00:03:15', '', 'Sara Fraefel & Nina Maurer', 0, NULL, ''),
(45, 8, 14, '00:03:15', '', 'Sara Fraefel & Nina Maurer', 0, NULL, ''),
(46, 2, 18, '00:04:30', '', 'Jannika Battistini & Nadja Vande Velde', 1, NULL, 'Kategorie Jugend'),
(47, 2, 18, '00:04:30', '', 'Alexandra Deiss  & Michaela Battistini ', 1, NULL, ''),
(47, 6, 18, '00:04:30', '', 'Nadja Vande Velde & Jannika Battistini', 1, NULL, ''),
(48, 7, 23, '00:03:45', '', 'Michaela Gachnang, Sarina Meier, Samuel Gähwiler, Yves Kappeler', 0, NULL, ''),
(48, 8, 14, '00:03:20', '', 'Michaela Gachnang, Samira Bollinger', 1, NULL, 'Dauer kann noch etwas abweichen.'),
(49, 10, 10, '00:02:26', '', 'Linda Surber', 1, NULL, ''),
(51, 2, 16, '00:04:15', '', 'Irina Amhof & Marcel Gysel', 0, 7, ''),
(51, 4, 16, '00:02:47', '', 'Karin Bollinger & Gian Marco Sigrist', 0, 7, ''),
(51, 5, 15, '00:04:31', '', 'Karin Bollinger & Gian Marco Sigrist', 0, 7, ''),
(52, 1, 20, '00:03:30', '', 'Phillip Werner Samuel Buri', 0, 2, ''),
(54, 9, 18, '00:03:13', '', 'Michaela Alder', 0, NULL, ''),
(55, 9, 41, '00:03:54', '', 'Michaela Alder', 1, NULL, '');

-- --------------------------------------------------------

--
-- Table structure for table `vereinmachtdisziplinmaterialien`
--

CREATE TABLE `vereinmachtdisziplinmaterialien` (
  `verein` int(9) NOT NULL,
  `disziplin` int(9) NOT NULL,
  `material` int(9) NOT NULL,
  `anzahl` int(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vereinmachtdisziplinmaterialien`
--

INSERT INTO `vereinmachtdisziplinmaterialien` (`verein`, `disziplin`, `material`, `anzahl`) VALUES
(2, 10, 43, 1),
(3, 2, 7, 1),
(4, 4, 16, 6),
(4, 4, 17, 6),
(4, 4, 19, 42),
(4, 4, 20, 6),
(4, 5, 21, 6),
(4, 5, 22, 54),
(4, 5, 23, 6),
(4, 5, 24, 6),
(4, 7, 30, 4),
(4, 7, 32, 48),
(4, 7, 33, 6),
(4, 7, 34, 6),
(4, 7, 35, 2),
(4, 10, 43, 1),
(5, 2, 7, 1),
(5, 5, 21, 6),
(5, 5, 22, 54),
(5, 5, 23, 6),
(5, 5, 24, 6),
(6, 1, 2, 4),
(6, 1, 3, 4),
(6, 1, 4, 42),
(6, 1, 5, 6),
(6, 1, 6, 4),
(6, 6, 25, 5),
(6, 6, 27, 42),
(6, 6, 28, 5),
(6, 7, 30, 2),
(6, 7, 32, 48),
(6, 7, 33, 2),
(6, 7, 34, 6),
(6, 7, 35, 2),
(6, 7, 36, 3),
(6, 8, 39, 1),
(7, 4, 16, 4),
(7, 4, 17, 4),
(7, 4, 19, 20),
(7, 4, 20, 4),
(8, 10, 43, 1),
(9, 6, 25, 3),
(9, 6, 27, 24),
(9, 9, 40, 1),
(10, 1, 4, 24),
(10, 1, 5, 3),
(10, 1, 6, 3),
(11, 4, 16, 3),
(11, 4, 17, 3),
(11, 4, 19, 42),
(11, 4, 20, 3),
(11, 5, 21, 6),
(11, 5, 22, 54),
(11, 5, 23, 6),
(11, 5, 24, 6),
(12, 1, 1, 3),
(12, 1, 2, 3),
(12, 1, 3, 3),
(12, 1, 4, 22),
(12, 1, 5, 4),
(12, 1, 6, 3),
(13, 6, 25, 3),
(13, 6, 27, 30),
(13, 6, 28, 3),
(14, 6, 25, 2),
(14, 6, 27, 24),
(15, 7, 29, 2),
(15, 7, 30, 1),
(15, 7, 32, 30),
(15, 7, 33, 1),
(15, 7, 34, 2),
(15, 7, 36, 2),
(15, 10, 43, 1),
(16, 6, 25, 4),
(16, 6, 27, 36),
(16, 9, 41, 1),
(17, 7, 30, 2),
(17, 7, 32, 30),
(17, 7, 33, 2),
(17, 7, 34, 2),
(17, 7, 35, 4),
(17, 10, 43, 1),
(18, 3, 8, 5),
(18, 3, 9, 5),
(18, 3, 10, 5),
(18, 3, 12, 5),
(18, 3, 13, 5),
(18, 3, 14, 42),
(18, 4, 16, 4),
(18, 4, 17, 4),
(18, 4, 19, 20),
(18, 4, 20, 4),
(18, 5, 21, 6),
(18, 5, 22, 54),
(18, 5, 23, 6),
(18, 5, 24, 6),
(18, 9, 40, 1),
(19, 5, 21, 6),
(19, 5, 22, 54),
(19, 5, 23, 6),
(19, 5, 24, 6),
(19, 7, 31, 2),
(19, 7, 32, 48),
(19, 7, 33, 2),
(19, 7, 34, 2),
(19, 7, 36, 4),
(19, 8, 37, 1),
(20, 6, 25, 3),
(20, 6, 27, 27),
(20, 6, 28, 3),
(20, 8, 38, 1),
(21, 7, 32, 48),
(21, 7, 34, 4),
(21, 7, 35, 4),
(21, 7, 36, 4),
(22, 3, 8, 5),
(22, 3, 9, 5),
(22, 3, 10, 5),
(22, 3, 14, 30),
(22, 7, 30, 2),
(22, 7, 32, 48),
(22, 7, 33, 4),
(22, 7, 35, 4),
(23, 2, 7, 1),
(23, 6, 25, 5),
(23, 6, 27, 42),
(23, 6, 28, 5),
(23, 7, 29, 1),
(23, 7, 32, 48),
(23, 7, 34, 3),
(23, 7, 36, 4),
(24, 5, 21, 6),
(24, 5, 22, 54),
(24, 5, 23, 6),
(24, 5, 24, 5),
(24, 7, 29, 3),
(24, 7, 30, 3),
(24, 7, 31, 3),
(24, 7, 32, 48),
(24, 7, 34, 3),
(24, 7, 35, 3),
(24, 7, 36, 3),
(26, 3, 9, 5),
(26, 3, 10, 4),
(26, 3, 11, 4),
(26, 3, 14, 42),
(26, 7, 29, 2),
(26, 7, 30, 2),
(26, 7, 31, 2),
(26, 7, 32, 48),
(26, 7, 33, 2),
(26, 7, 34, 4),
(26, 7, 35, 2),
(27, 4, 16, 4),
(27, 4, 20, 4),
(27, 5, 21, 6),
(27, 5, 23, 6),
(27, 5, 24, 6),
(28, 1, 1, 5),
(28, 1, 2, 5),
(28, 1, 3, 5),
(28, 1, 4, 42),
(28, 1, 5, 5),
(28, 1, 6, 5),
(28, 3, 8, 6),
(28, 3, 9, 6),
(28, 3, 10, 6),
(28, 3, 12, 6),
(28, 3, 13, 6),
(28, 3, 14, 42),
(28, 7, 32, 48),
(28, 7, 34, 3),
(28, 7, 35, 2),
(28, 7, 36, 3),
(28, 9, 41, 1),
(29, 6, 25, 4),
(29, 6, 27, 42),
(29, 10, 43, 1),
(30, 7, 30, 2),
(30, 7, 31, 2),
(30, 7, 32, 38),
(30, 7, 34, 4),
(30, 7, 36, 3),
(30, 8, 38, 1),
(31, 3, 8, 2),
(31, 3, 9, 3),
(31, 3, 10, 1),
(31, 3, 14, 30),
(31, 7, 30, 2),
(31, 7, 31, 2),
(31, 7, 32, 36),
(31, 7, 34, 2),
(31, 7, 36, 4),
(32, 1, 2, 4),
(32, 1, 3, 4),
(32, 1, 4, 26),
(32, 1, 5, 4),
(32, 1, 6, 4),
(32, 4, 16, 4),
(32, 4, 17, 4),
(32, 4, 19, 22),
(32, 4, 20, 4),
(32, 5, 21, 6),
(32, 5, 22, 46),
(32, 5, 23, 6),
(32, 5, 24, 6),
(33, 2, 7, 1),
(33, 3, 9, 5),
(33, 3, 14, 40),
(33, 8, 38, 1),
(33, 9, 40, 1),
(33, 10, 43, 1),
(34, 5, 21, 6),
(34, 5, 22, 48),
(34, 5, 23, 6),
(34, 5, 24, 5),
(34, 8, 39, 1),
(34, 9, 40, 1),
(35, 1, 1, 3),
(35, 1, 3, 3),
(35, 1, 4, 9),
(35, 1, 5, 6),
(35, 1, 6, 3),
(35, 6, 25, 4),
(35, 6, 27, 20),
(35, 8, 38, 1),
(36, 1, 2, 4),
(36, 1, 3, 4),
(36, 1, 4, 34),
(36, 1, 6, 4),
(37, 6, 25, 5),
(37, 6, 27, 35),
(37, 8, 39, 1),
(38, 6, 25, 5),
(38, 6, 27, 40),
(38, 9, 40, 1),
(39, 7, 32, 24),
(39, 7, 33, 2),
(39, 7, 36, 3),
(40, 1, 2, 6),
(40, 1, 3, 6),
(40, 1, 4, 42),
(40, 1, 5, 6),
(40, 1, 6, 6),
(40, 4, 16, 4),
(40, 4, 17, 4),
(40, 4, 19, 32),
(40, 4, 20, 4),
(40, 5, 21, 6),
(40, 5, 22, 54),
(40, 5, 23, 6),
(40, 5, 24, 6),
(41, 1, 2, 3),
(41, 1, 3, 3),
(41, 1, 4, 42),
(41, 1, 5, 4),
(41, 1, 6, 3),
(41, 7, 30, 3),
(41, 7, 31, 3),
(41, 7, 32, 48),
(41, 7, 34, 6),
(41, 7, 36, 5),
(41, 8, 38, 1),
(42, 1, 1, 3),
(42, 1, 2, 3),
(42, 1, 3, 3),
(42, 1, 4, 42),
(42, 1, 5, 3),
(42, 1, 6, 3),
(43, 7, 30, 2),
(43, 7, 32, 48),
(43, 7, 33, 2),
(43, 7, 34, 4),
(43, 7, 35, 4),
(44, 6, 25, 2),
(44, 6, 27, 16),
(45, 7, 29, 1),
(45, 7, 30, 1),
(45, 7, 31, 1),
(45, 7, 32, 9),
(45, 7, 34, 1),
(45, 7, 36, 3),
(45, 8, 37, 1),
(46, 2, 7, 1),
(47, 2, 7, 1),
(47, 6, 25, 4),
(47, 6, 27, 40),
(48, 7, 29, 3),
(48, 7, 32, 48),
(48, 7, 34, 4),
(48, 7, 35, 2),
(48, 7, 36, 4),
(48, 8, 38, 1),
(49, 10, 43, 1),
(51, 2, 7, 1),
(51, 4, 15, 3),
(51, 4, 16, 3),
(51, 4, 17, 3),
(51, 4, 19, 21),
(51, 4, 20, 3),
(51, 5, 21, 5),
(51, 5, 22, 45),
(51, 5, 23, 5),
(51, 5, 24, 5),
(52, 1, 1, 4),
(52, 1, 2, 4),
(52, 1, 3, 4),
(52, 1, 4, 32),
(52, 1, 6, 4),
(54, 9, 40, 1),
(55, 9, 41, 1);

-- --------------------------------------------------------

--
-- Table structure for table `vereinmachtisziplinzusatzangaben`
--

CREATE TABLE `vereinmachtisziplinzusatzangaben` (
  `verein` int(9) NOT NULL,
  `disziplin` int(9) NOT NULL,
  `zusatzangabe` int(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vereinmachtisziplinzusatzangaben`
--

INSERT INTO `vereinmachtisziplinzusatzangaben` (`verein`, `disziplin`, `zusatzangabe`) VALUES
(4, 7, 2),
(4, 7, 3),
(6, 7, 2),
(6, 7, 3),
(6, 7, 5),
(15, 7, 3),
(15, 7, 5),
(17, 7, 2),
(17, 7, 3),
(19, 7, 1),
(19, 7, 5),
(21, 7, 2),
(21, 7, 5),
(22, 7, 2),
(22, 7, 3),
(23, 7, 2),
(23, 7, 5),
(24, 7, 1),
(24, 7, 2),
(26, 7, 2),
(26, 7, 3),
(28, 7, 2),
(28, 7, 5),
(30, 7, 1),
(30, 7, 5),
(31, 7, 1),
(31, 7, 5),
(39, 7, 2),
(39, 7, 3),
(39, 7, 5),
(41, 7, 1),
(41, 7, 5),
(43, 7, 2),
(43, 7, 3),
(45, 7, 1),
(45, 7, 5),
(48, 7, 1),
(48, 7, 2),
(48, 7, 5),
(6, 8, 7),
(19, 8, 7),
(20, 8, 7),
(30, 8, 7),
(33, 8, 7),
(34, 8, 7),
(35, 8, 7),
(37, 8, 7),
(41, 8, 7),
(45, 8, 7),
(48, 8, 7),
(9, 9, 9),
(16, 9, 9),
(18, 9, 9),
(28, 9, 9),
(33, 9, 9),
(34, 9, 9),
(38, 9, 9),
(54, 9, 9),
(55, 9, 9);

-- --------------------------------------------------------

--
-- Table structure for table `zusatzangaben`
--

CREATE TABLE `zusatzangaben` (
  `id` int(9) NOT NULL,
  `disziplin` int(9) NOT NULL,
  `angabe` varchar(300) NOT NULL,
  `exclusive` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `zusatzangaben`
--

INSERT INTO `zusatzangaben` (`id`, `disziplin`, `angabe`, `exclusive`) VALUES
(1, 7, 'Barren (BA)', 0),
(2, 7, 'Boden (BO)', 0),
(3, 7, 'Sprung (SP)', 0),
(4, 7, 'Reck (RE)', 0),
(5, 7, 'Schulstufenbarren (SSB)', 0),
(6, 8, 'Mit Handgeräte', 1),
(7, 8, 'Ohne Handgeräte', 1),
(8, 9, 'Mit Handgeräte', 1),
(9, 9, 'Ohne Handgeräte', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `disziplinen`
--
ALTER TABLE `disziplinen`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ergebnisse_gy`
--
ALTER TABLE `ergebnisse_gy`
  ADD PRIMARY KEY (`id`),
  ADD KEY `verein_gyfk_constraint` (`verein`),
  ADD KEY `disziplin_gyfk_constraint` (`disziplin`);

--
-- Indexes for table `ergebnisse_vgt`
--
ALTER TABLE `ergebnisse_vgt`
  ADD PRIMARY KEY (`id`),
  ADD KEY `verein_fk_constraint` (`verein`),
  ADD KEY `disziplin_fk_constraint` (`disziplin`);

--
-- Indexes for table `materialien`
--
ALTER TABLE `materialien`
  ADD PRIMARY KEY (`id`),
  ADD KEY `disziplin_materialfk_constraint` (`disziplin`);

--
-- Indexes for table `session`
--
ALTER TABLE `session`
  ADD PRIMARY KEY (`id`),
  ADD KEY `verein_sessionfk_constraint` (`verein`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`thekey`);

--
-- Indexes for table `verein`
--
ALTER TABLE `verein`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `vereinmachtdisziplin`
--
ALTER TABLE `vereinmachtdisziplin`
  ADD PRIMARY KEY (`verein`,`disziplin`),
  ADD KEY `disziplin_vmdfk_constraint` (`disziplin`),
  ADD KEY `verein_vmdfk_constraint` (`verein`);

--
-- Indexes for table `vereinmachtdisziplinmaterialien`
--
ALTER TABLE `vereinmachtdisziplinmaterialien`
  ADD PRIMARY KEY (`verein`,`disziplin`,`material`),
  ADD KEY `disziplin_vmdmfk_constraint` (`disziplin`),
  ADD KEY `verein_vmdmfk_constraint` (`verein`),
  ADD KEY `material_vmdmfk_constraint` (`material`);

--
-- Indexes for table `vereinmachtisziplinzusatzangaben`
--
ALTER TABLE `vereinmachtisziplinzusatzangaben`
  ADD PRIMARY KEY (`verein`,`disziplin`,`zusatzangabe`),
  ADD KEY `disziplin_vmdzfk_constraint` (`disziplin`),
  ADD KEY `verein_vmdzfk_constraint` (`verein`),
  ADD KEY `zusatzangabe_vmdzfk_constraint` (`zusatzangabe`);

--
-- Indexes for table `zusatzangaben`
--
ALTER TABLE `zusatzangaben`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `disziplinen`
--
ALTER TABLE `disziplinen`
  MODIFY `id` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `ergebnisse_gy`
--
ALTER TABLE `ergebnisse_gy`
  MODIFY `id` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `ergebnisse_vgt`
--
ALTER TABLE `ergebnisse_vgt`
  MODIFY `id` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=128;

--
-- AUTO_INCREMENT for table `materialien`
--
ALTER TABLE `materialien`
  MODIFY `id` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `session`
--
ALTER TABLE `session`
  MODIFY `id` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=193;

--
-- AUTO_INCREMENT for table `verein`
--
ALTER TABLE `verein`
  MODIFY `id` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT for table `zusatzangaben`
--
ALTER TABLE `zusatzangaben`
  MODIFY `id` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `ergebnisse_gy`
--
ALTER TABLE `ergebnisse_gy`
  ADD CONSTRAINT `disziplin_gyfk_constraint` FOREIGN KEY (`disziplin`) REFERENCES `disziplinen` (`id`),
  ADD CONSTRAINT `verein_gyfk_constraint` FOREIGN KEY (`verein`) REFERENCES `verein` (`id`);

--
-- Constraints for table `ergebnisse_vgt`
--
ALTER TABLE `ergebnisse_vgt`
  ADD CONSTRAINT `disziplin_fk_constraint` FOREIGN KEY (`disziplin`) REFERENCES `disziplinen` (`id`),
  ADD CONSTRAINT `verein_fk_constraint` FOREIGN KEY (`verein`) REFERENCES `verein` (`id`);

--
-- Constraints for table `materialien`
--
ALTER TABLE `materialien`
  ADD CONSTRAINT `disziplin_materialfk_constraint` FOREIGN KEY (`disziplin`) REFERENCES `disziplinen` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `session`
--
ALTER TABLE `session`
  ADD CONSTRAINT `verein_sessionfk_constraint` FOREIGN KEY (`verein`) REFERENCES `verein` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `vereinmachtdisziplin`
--
ALTER TABLE `vereinmachtdisziplin`
  ADD CONSTRAINT `disziplin_vmdfk_constraint` FOREIGN KEY (`disziplin`) REFERENCES `disziplinen` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `verein_vmdfk_constraint` FOREIGN KEY (`verein`) REFERENCES `verein` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `vereinmachtdisziplinmaterialien`
--
ALTER TABLE `vereinmachtdisziplinmaterialien`
  ADD CONSTRAINT `disziplin_vmdmfk_constraint` FOREIGN KEY (`disziplin`) REFERENCES `disziplinen` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `material_vmdmfk_constraint` FOREIGN KEY (`material`) REFERENCES `materialien` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `verein_vmdmfk_constraint` FOREIGN KEY (`verein`) REFERENCES `verein` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `vereinmachtisziplinzusatzangaben`
--
ALTER TABLE `vereinmachtisziplinzusatzangaben`
  ADD CONSTRAINT `disziplin_vmdzfk_constraint` FOREIGN KEY (`disziplin`) REFERENCES `disziplinen` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `verein_vmdzfk_constraint` FOREIGN KEY (`verein`) REFERENCES `verein` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `zusatzangabe_vmdzfk_constraint` FOREIGN KEY (`zusatzangabe`) REFERENCES `zusatzangaben` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
