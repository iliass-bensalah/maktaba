-- phpMyAdmin SQL Dump
-- version 4.8.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 04, 2019 at 11:32 PM
-- Server version: 10.1.31-MariaDB
-- PHP Version: 7.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `maktaba`
--
CREATE DATABASE IF NOT EXISTS `maktaba` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `maktaba`;

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertbooks` (IN `vtitle` VARCHAR(255), IN `vauthor` VARCHAR(255), IN `visbn` VARCHAR(20), IN `vcopies` INT)  BEGIN
DECLARE i int DEFAULT 0;
INSERT INTO books (`id`, `author`, `ISBN`, `title`) VALUES (NULL, vauthor, visbn, vtitle) ON DUPLICATE KEY UPDATE id = id;
WHILE i < vcopies DO
INSERT INTO bookitems (`biid`, `available`, `book_id`)
VALUES(NULL, true, (SELECT `id` FROM books WHERE ISBN = visbn));
SET i = i + 1;
END WHILE;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `bookitems`
--

CREATE TABLE `bookitems` (
  `biid` int(11) NOT NULL,
  `available` tinyint(1) NOT NULL,
  `book_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bookitems`
--

INSERT INTO `bookitems` (`biid`, `available`, `book_id`) VALUES
(22, 1, 27),
(26, 0, 27),
(27, 0, 27),
(28, 1, 30),
(29, 1, 30),
(30, 1, 31),
(31, 1, 31),
(32, 1, 31),
(33, 1, 32),
(34, 1, 32),
(35, 1, 32),
(36, 1, 33),
(37, 1, 33),
(38, 1, 33);

-- --------------------------------------------------------

--
-- Table structure for table `books`
--

CREATE TABLE `books` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `author` varchar(255) NOT NULL,
  `ISBN` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `books`
--

INSERT INTO `books` (`id`, `title`, `author`, `ISBN`) VALUES
(27, 'cats', 'nyan nyan', '1231231234'),
(30, 'good cats', 'nyan', '01230123'),
(31, 'bad cats', 'nyan', '31233123'),
(32, 'cats and dogs', 'woof woof', '987654321'),
(33, 'good dog', 'nyan nyan', '9111234123');

-- --------------------------------------------------------

--
-- Table structure for table `borrowings`
--

CREATE TABLE `borrowings` (
  `brid` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `biid` int(11) NOT NULL,
  `brdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `archived` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `borrowings`
--

INSERT INTO `borrowings` (`brid`, `uid`, `biid`, `brdate`, `archived`) VALUES
(2, 17, 32, '2019-08-04 01:14:47', 1),
(3, 17, 27, '2019-08-04 01:16:58', 0),
(4, 17, 22, '2019-08-04 01:17:42', 1),
(5, 17, 26, '2019-08-04 01:18:01', 0);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `uid` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `is_admin` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`uid`, `email`, `password`, `is_admin`) VALUES
(16, 'admin@mail.com', '123', 1),
(17, 'user@mail.com', '123', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bookitems`
--
ALTER TABLE `bookitems`
  ADD PRIMARY KEY (`biid`),
  ADD KEY `book_id` (`book_id`);

--
-- Indexes for table `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ISBN` (`ISBN`);

--
-- Indexes for table `borrowings`
--
ALTER TABLE `borrowings`
  ADD PRIMARY KEY (`brid`),
  ADD KEY `biid` (`biid`),
  ADD KEY `uid` (`uid`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`uid`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bookitems`
--
ALTER TABLE `bookitems`
  MODIFY `biid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `books`
--
ALTER TABLE `books`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `borrowings`
--
ALTER TABLE `borrowings`
  MODIFY `brid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `uid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bookitems`
--
ALTER TABLE `bookitems`
  ADD CONSTRAINT `bookitems_ibfk_1` FOREIGN KEY (`book_id`) REFERENCES `books` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `borrowings`
--
ALTER TABLE `borrowings`
  ADD CONSTRAINT `borrowings_ibfk_1` FOREIGN KEY (`biid`) REFERENCES `bookitems` (`biid`) ON DELETE CASCADE,
  ADD CONSTRAINT `borrowings_ibfk_2` FOREIGN KEY (`uid`) REFERENCES `users` (`uid`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
