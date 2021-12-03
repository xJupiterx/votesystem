-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 13, 2021 at 07:50 AM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.0.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `votesystem`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(60) NOT NULL,
  `firstname` varchar(50) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `photo` varchar(150) NOT NULL,
  `created_on` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `username`, `password`, `firstname`, `lastname`, `photo`, `created_on`) VALUES
(1, 'admin', '$2y$10$fLK8s7ZDnM.1lE7XMP.J6OuPbQ.DPUVKBo7rENnQY7gYq0xAzsKJy', 'Junel', 'Manlangit', 'user3-128x128.jpg', '2018-04-02');

-- --------------------------------------------------------

--
-- Table structure for table `candidates`
--

CREATE TABLE `candidates` (
  `id` int(11) NOT NULL,
  `position_id` int(11) NOT NULL,
  `firstname` varchar(30) NOT NULL,
  `lastname` varchar(30) NOT NULL,
  `photo` varchar(150) NOT NULL,
  `platform` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `candidates`
--

INSERT INTO `candidates` (`id`, `position_id`, `firstname`, `lastname`, `photo`, `platform`) VALUES
(18, 8, 'junjun', 'sakalam', 'avatar5.png', ''),
(19, 9, 'tutoy', 'shakdart', 'profile.jpg', ''),
(20, 8, 'Sheyn', 'Manlangit', 'user3-128x128.jpg', ''),
(21, 9, 'john', 'dela rea', 'avatar5.png', ''),
(22, 10, 'john paul', 'funa', 'user6-128x128.jpg', ''),
(23, 10, 'sherly', 'Manlangit', 'user4-128x128.jpg', ''),
(24, 10, 'bong', 'manlangit', '', ''),
(25, 11, 'mae', 'dough', '', ''),
(26, 11, 'jesh', 'mediante', 'avatar04.png', ''),
(27, 11, 'renz', 'montegrande', 'user2-160x160.jpg', ''),
(28, 12, 'christopher', 'oliver', 'user8-128x128.jpg', ''),
(29, 12, 'ardie', 'delima', 'user1-128x128.jpg', ''),
(30, 12, 'jm', 'panol', 'user1-128x128.jpg', '');

-- --------------------------------------------------------

--
-- Table structure for table `positions`
--

CREATE TABLE `positions` (
  `id` int(11) NOT NULL,
  `description` varchar(50) NOT NULL,
  `max_vote` int(11) NOT NULL,
  `priority` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `positions`
--

INSERT INTO `positions` (`id`, `description`, `max_vote`, `priority`) VALUES
(8, 'President', 0, 1),
(9, 'Vice President', 0, 2),
(10, 'Treasurer', 0, 3),
(11, 'Secretary', 0, 4),
(12, 'Auditor', 0, 5);

-- --------------------------------------------------------

--
-- Table structure for table `voters`
--

CREATE TABLE `voters` (
  `id` int(11) NOT NULL,
  `voters_id` varchar(15) NOT NULL,
  `password` varchar(60) NOT NULL,
  `firstname` varchar(30) NOT NULL,
  `lastname` varchar(30) NOT NULL,
  `photo` varchar(150) NOT NULL,
  `gsuite` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `voters`
--

INSERT INTO `voters` (`id`, `voters_id`, `password`, `firstname`, `lastname`, `photo`, `gsuite`) VALUES
(2, 'rpKhqH9vB4AN8Pn', '$2y$10$Y2BbJGI7/f6MPTC/VzjmN.yVZs8ygy0OR0lNHpw0r7l5gV99h29gC', 'Junel', 'Manlangit', 'user3-128x128.jpg', 'junelmanlangit9@gmail.com'),
(3, 'Hn39SEl5fVAJpm2', '$2y$10$yP8gveGS5WOHybSDw1wOSusIKLn0UU57Kkn/hwTPjvCObfrQ30Nye', 'junjun', 'shesh', 'profile.jpg', 'junelmanlangit@gmail.com'),
(4, 'E73B519kTtzlJNi', '$2y$10$Y.hV947EpQMvw62vxNGnFeTYoZ4NdAOnCW8tgAljtxZ8hoFoPJuDe', 'Junel', 'Manlangit', '', ' junel.manlangit@citycollegeoftagaytay.edu.ph'),
(5, 'eEfTjswA8nZLiRb', '$2y$10$nJdSxJ0Q/tSJa6cH/cIMw.iWUOXYqbzfwsWbfdMvhBf4zU4mwixLe', 'Junel', 'Manlangit', '', ' junel.manlangit@citycollegeoftagaytay.edu.ph'),
(6, 'hZCz7LvmN4TtikH', '$2y$10$Msr3aY0ldlY/aTXxtdYMduYVcS..tjYDbFrHzprF9FSKpjOW9dg.i', 'Junel', 'Manlangit', '', 'junelmanlangit9@gmail.com'),
(7, 'JshkMvSL6zW9GVF', '$2y$10$RviF2mZ2jEt/ROGDCHM3k.8XVm4sAKyMgfoML4FwwPA0gAlU5OvP6', 'junjun', 'shesh', '', 'junelmanlangit9@gmail.com'),
(8, 'rgQloAHOXTZMGKq', '$2y$10$adJJLUwWctXDZ7c2LjqmYOBrY8m/trQ0Nsv5XQrNwnuoDoGSwPd36', 'voter 1', 'aqw', 'user8-128x128.jpg', 'junelmanlangit@gmail.com'),
(9, 'f4ZrmnSRKNbGoF2', '$2y$10$25N9hTDc79Msna0nxRMNbO/KlzBcirn.uQR0aFUAgZWb4MH9z/ARC', 'gago', 'ako', 'user6-128x128.jpg', 'gago@gmail.com'),
(10, 'zVb78lPd4UKjumk', '$2y$10$xQNtACtvXUNoMgLCxaJ.Qe0tAG/vqTPL.lyoSk/W2eJDqJpota1pi', 'gagagaga', 'gasdadasd', 'user5-128x128.jpg', 'asdasd@gmail.com'),
(14, 'KGptUwH6oMxLTBe', '$2y$10$4n/Bp9Gy9qUK8XL3GNtiwOrYodj.z9jVc0RDlyybh4k61Oc5yMLLG', 'firstname', 'lastname', '', 'sample@gsuite.com'),
(15, '1VPWrCHDui542Oh', '$2y$10$vQFM/ZMBAOUlBZUMCrc0juOT2rTe9RAQStJIw5FJMDmDUgkg7gFeG', 'sample', 'sample', '', 'sample@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `votes`
--

CREATE TABLE `votes` (
  `id` int(11) NOT NULL,
  `voters_id` int(11) NOT NULL,
  `candidate_id` int(11) NOT NULL,
  `position_id` int(11) NOT NULL,
  `time` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `votes`
--

INSERT INTO `votes` (`id`, `voters_id`, `candidate_id`, `position_id`, `time`) VALUES
(81, 4, 20, 8, ''),
(82, 4, 21, 9, ''),
(83, 4, 22, 10, ''),
(84, 4, 27, 11, ''),
(85, 4, 30, 12, ''),
(86, 3, 21, 9, ''),
(87, 3, 23, 10, ''),
(88, 3, 26, 11, ''),
(89, 3, 28, 12, ''),
(95, 15, 20, 8, '14:31'),
(96, 15, 21, 9, '14:31'),
(97, 15, 24, 10, '14:31'),
(98, 15, 26, 11, '14:31'),
(99, 15, 28, 12, '14:31');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `candidates`
--
ALTER TABLE `candidates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `positions`
--
ALTER TABLE `positions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `voters`
--
ALTER TABLE `voters`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `votes`
--
ALTER TABLE `votes`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `candidates`
--
ALTER TABLE `candidates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `positions`
--
ALTER TABLE `positions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `voters`
--
ALTER TABLE `voters`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `votes`
--
ALTER TABLE `votes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=100;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
