-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 27, 2019 at 12:18 PM
-- Server version: 10.2.10-MariaDB
-- PHP Version: 7.3.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `nocistrazivaca`
--

-- --------------------------------------------------------

--
-- Table structure for table `migration_versions`
--

CREATE TABLE `migration_versions` (
  `version` varchar(14) COLLATE utf8mb4_unicode_ci NOT NULL,
  `executed_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migration_versions`
--

INSERT INTO `migration_versions` (`version`, `executed_at`) VALUES
('20190916181228', '2019-09-18 09:17:25'),
('20190918161403', '2019-09-18 16:14:34'),
('20190918161504', '2019-09-18 16:15:08'),
('20190918161542', '2019-09-18 16:15:45'),
('20190918161850', '2019-09-18 16:18:54'),
('20190918161954', '2019-09-18 16:19:57'),
('20190918162013', '2019-09-18 16:20:16'),
('20190921223501', '2019-09-21 22:35:14');

-- --------------------------------------------------------

--
-- Table structure for table `question`
--

CREATE TABLE `question` (
  `id` int(11) NOT NULL,
  `question` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `question`
--

INSERT INTO `question` (`id`, `question`) VALUES
(1, '/questions/1/pitanje.jpg'),
(2, '/questions/2/pitanje.jpg'),
(3, '/questions/3/pitanje.jpg'),
(4, '/questions/4/pitanje.jpg'),
(5, '/questions/5/pitanje.jpg'),
(6, '/questions/6/pitanje.jpg'),
(7, '/questions/7/pitanje.jpg'),
(8, '/questions/8/pitanje.jpg'),
(9, '/questions/9/pitanje.jpg'),
(10, '/questions/10/pitanje.jpg'),
(11, '/questions/11/pitanje.jpg'),
(12, '/questions/12/pitanje.jpg'),
(13, '/questions/13/pitanje.jpg'),
(14, '/questions/14/pitanje.jpg'),
(15, '/questions/15/pitanje.jpg'),
(16, '/questions/16/pitanje.jpg'),
(17, '/questions/17/pitanje.jpg'),
(18, '/questions/18/pitanje.jpg'),
(19, '/questions/19/pitanje.jpg'),
(20, '/questions/20/pitanje.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `question_choices`
--

CREATE TABLE `question_choices` (
  `id` int(11) NOT NULL,
  `question_id` int(11) DEFAULT NULL,
  `is_right_choice` tinyint(1) NOT NULL,
  `choice` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `question_choices`
--

INSERT INTO `question_choices` (`id`, `question_id`, `is_right_choice`, `choice`) VALUES
(1, 1, 1, '/questions/1/odgovor1.jpg'),
(2, 1, 1, '/questions/1/odgovor2.jpg'),
(3, 1, 0, '/questions/1/odgovor3.jpg'),
(4, 1, 0, '/questions/1/odgovor4.jpg'),
(5, 2, 1, '/questions/2/odgovor1.jpg'),
(6, 2, 0, '/questions/2/odgovor2.jpg'),
(7, 2, 0, '/questions/2/odgovor3.jpg'),
(8, 3, 1, '/questions/3/odgovor1.jpg'),
(9, 3, 0, '/questions/3/odgovor2.jpg'),
(10, 3, 1, '/questions/3/odgovor3.jpg'),
(11, 3, 0, '/questions/3/odgovor4.jpg'),
(12, 4, 1, '/questions/4/odgovor1.jpg'),
(13, 4, 0, '/questions/4/odgovor2.jpg'),
(14, 4, 1, '/questions/4/odgovor3.jpg'),
(15, 5, 1, '/questions/5/odgovor1.jpg'),
(16, 5, 0, '/questions/5/odgovor2.jpg'),
(17, 5, 0, '/questions/5/odgovor3.jpg'),
(18, 6, 0, '/questions/6/odgovor1.jpg'),
(19, 6, 1, '/questions/6/odgovor2.jpg'),
(20, 6, 0, '/questions/6/odgovor3.jpg'),
(21, 6, 1, '/questions/6/odgovor4.jpg'),
(22, 7, 1, '/questions/7/odgovor1.jpg'),
(23, 7, 1, '/questions/7/odgovor2.jpg'),
(24, 7, 0, '/questions/7/odgovor3.jpg'),
(25, 7, 1, '/questions/7/odgovor4.jpg'),
(26, 8, 0, '/questions/8/odgovor1.jpg'),
(27, 8, 1, '/questions/8/odgovor2.jpg'),
(28, 8, 1, '/questions/8/odgovor3.jpg'),
(29, 9, 0, '/questions/9/odgovor1.jpg'),
(30, 9, 1, '/questions/9/odgovor2.jpg'),
(31, 9, 0, '/questions/9/odgovor3.jpg'),
(32, 9, 1, '/questions/9/odgovor4.jpg'),
(33, 10, 0, '/questions/10/odgovor1.jpg'),
(34, 10, 0, '/questions/10/odgovor2.jpg'),
(35, 10, 1, '/questions/10/odgovor3.jpg'),
(36, 11, 1, '/questions/11/odgovor1.jpg'),
(37, 11, 0, '/questions/11/odgovor2.jpg'),
(38, 11, 0, '/questions/11/odgovor3.jpg'),
(39, 11, 0, '/questions/11/odgovor4.jpg'),
(40, 12, 1, '/questions/12/odgovor1.jpg'),
(41, 12, 0, '/questions/11/odgovor2.jpg'),
(42, 13, 1, '/questions/13/odgovor1.jpg'),
(43, 13, 1, '/questions/13/odgovor2.jpg'),
(44, 13, 0, '/questions/13/odgovor3.jpg'),
(45, 13, 1, '/questions/13/odgovor4.jpg'),
(46, 14, 0, '/questions/14/odgovor1.jpg'),
(47, 14, 1, '/questions/14/odgovor2.jpg'),
(48, 14, 0, '/questions/14/odgovor3.jpg'),
(49, 14, 1, '/questions/14/odgovor4.jpg'),
(50, 15, 1, '/questions/15/odgovor1.jpg'),
(51, 15, 1, '/questions/15/odgovor2.jpg'),
(52, 15, 0, '/questions/15/odgovor3.jpg'),
(53, 15, 0, '/questions/15/odgovor4.jpg'),
(54, 16, 0, '/questions/16/odgovor1.jpg'),
(55, 16, 0, '/questions/16/odgovor2.jpg'),
(56, 16, 0, '/questions/16/odgovor3.jpg'),
(57, 16, 1, '/questions/16/odgovor4.jpg'),
(58, 17, 0, '/questions/17/odgovor1.jpg'),
(59, 17, 1, '/questions/17/odgovor2.jpg'),
(60, 17, 1, '/questions/17/odgovor3.jpg'),
(61, 17, 0, '/questions/17/odgovor4.jpg'),
(62, 18, 1, '/questions/18/odgovor1.jpg'),
(63, 18, 1, '/questions/18/odgovor2.jpg'),
(64, 18, 1, '/questions/18/odgovor3.jpg'),
(65, 18, 0, '/questions/18/odgovor4.jpg'),
(66, 19, 1, '/questions/19/odgovor1.jpg'),
(67, 19, 0, '/questions/19/odgovor2.jpg'),
(68, 19, 0, '/questions/19/odgovor3.jpg'),
(69, 19, 1, '/questions/19/odgovor4.jpg'),
(70, 20, 1, '/questions/20/odgovor1.jpg'),
(71, 20, 0, '/questions/20/odgovor2.jpg'),
(72, 20, 1, '/questions/20/odgovor3.jpg'),
(73, 20, 0, '/questions/20/odgovor4.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `school`
--

CREATE TABLE `school` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `school`
--

INSERT INTO `school` (`id`, `name`) VALUES
(1, 'O.Š. Sečenji Ištvan '),
(2, 'O.Š. Sonja Marinković'),
(3, 'O.Š. Ivan Milutinović'),
(4, 'O.Š. Matko Vuković'),
(5, 'O.Š. Đuro Salaj'),
(6, 'O.Š. Ivan Goran Kovačić'),
(7, 'O.Š. Jovan Jovanović Zmaj'),
(8, 'O.Š. Kizur Ištvan'),
(9, 'O.Š. Jovan Mikić'),
(10, 'O.Š. 10. Oktobar'),
(11, 'O.Š. Miloš Crnjanski'),
(12, 'O.Š. Majšanski put'),
(13, 'O.Š. Sveti Sava'),
(14, 'O.Š. Miroslav Antić'),
(15, 'O.Š. Petefi Šandor'),
(16, 'O.Š. Bosa Milićević'),
(17, 'O.Š. Pionir'),
(18, 'O.Š. Matija Gubec'),
(19, 'O.Š. Hunjadi Janoš'),
(20, 'O.Š. Vuk Karadžić'),
(21, 'O.Š. Vladimir Nazor'),
(22, 'O.Š. Žarko Zrenjanin'),
(23, 'O.Š. Muzička škola'),
(24, 'Žarko Zrenjanin'),
(25, 'Muzička škola'),
(26, 'Ekonomska škola Global '),
(27, 'Ekonomsko škola Bosa Milicevic'),
(28, 'Gimnazija Svetozar Markovic '),
(29, 'Hemijsko tehnoloska škola Lazar Nesic '),
(30, 'Medicinska škola'),
(31, 'Politehnička škola'),
(32, 'Tehnička škola Ivan Sarić'),
(33, 'Ekonomski fakultet'),
(34, 'Građevinski fakultet'),
(35, 'Visoka tehnička škola strukovnih studija'),
(36, 'Visoka škola strukovnih studija za obrazovanje \nvaspitača\n'),
(37, 'Gimnazija za talentovane učenike Kostolanji Dežo');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `school_id` int(11) DEFAULT NULL,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `score` int(11) DEFAULT NULL,
  `nickname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `time` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `migration_versions`
--
ALTER TABLE `migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Indexes for table `question`
--
ALTER TABLE `question`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `question_choices`
--
ALTER TABLE `question_choices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_B1243241E27F6BF` (`question_id`);

--
-- Indexes for table `school`
--
ALTER TABLE `school`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_8D93D649C32A47EE` (`school_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `question`
--
ALTER TABLE `question`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `question_choices`
--
ALTER TABLE `question_choices`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=74;

--
-- AUTO_INCREMENT for table `school`
--
ALTER TABLE `school`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `question_choices`
--
ALTER TABLE `question_choices`
  ADD CONSTRAINT `FK_B1243241E27F6BF` FOREIGN KEY (`question_id`) REFERENCES `question` (`id`);

--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `FK_8D93D649C32A47EE` FOREIGN KEY (`school_id`) REFERENCES `school` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
