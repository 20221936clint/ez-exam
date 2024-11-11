-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 11, 2024 at 04:29 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `1221`
--

-- --------------------------------------------------------

--
-- Table structure for table `bikes`
--

CREATE TABLE `bikes` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `image_url` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bikes`
--

INSERT INTO `bikes` (`id`, `name`, `image_url`) VALUES
(1, 'Mountain Bike', 'https://verdana.supremebikes.ph/cdn/shop/products/TREK-MARLIN4GEN2-BLU-0W_ab19b492-4e5f-4b52-9c58-b1c944fd9e8c.jpg?v=1671594188'),
(2, 'Road Bike', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTRlVotijI60VD-fmI1CG50dhEsEqPjKTWRig&s'),
(3, 'Electric Bike', 'https://down-ph.img.susercontent.com/file/ph-11134207-7qul5-limnukengljadf'),
(4, 'Hybrid Bike', 'https://hips.hearstapps.com/hmg-prod/images/bmc-alpenchallenge-0056-1537970707.jpg'),
(5, 'Folding Bike', 'https://hips.hearstapps.com/hmg-prod/images/brompton-p-line-2021-gm-0675-graded-lores-1657749600.jpg'),
(6, 'Cruiser Bike', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRN4oTH_O-mSiBmWo5GqNt9dav4bRiovPzUfQ&s'),
(7, 'BMX Bike', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ2osspGlv-Wu2TSw5jXssWHrWS6qRrruxURw&s'),
(8, 'Touring Bike', 'https://i0.wp.com/tomsbiketrip.com/wp-content/uploads/2022/02/ridgeback-panorama-2022-touring-bike.jpg?resize=1534%2C1000&ssl=1'),
(9, 'Racing Bike', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSLxc-CFZEuKXB877xXfql1TDFRWDua-W7LLw&s'),
(10, 'Kids Bike', 'https://contents.mediadecathlon.com/p1869047/k$3332f1e4f3ff1e8dc172a54583fd2b60/500-16-inch-kids-bike-4-6-years-docto-girl-btwin-8391524.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `likes`
--

CREATE TABLE `likes` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `bike_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `likes`
--

INSERT INTO `likes` (`id`, `user_id`, `bike_id`) VALUES
(1, 3, 1),
(2, 3, 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `first_login` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `created_at`, `first_login`) VALUES
(1, 'qwerty', '$2y$10$laaTgEaHvdWdI.9NFQs7Ie73HyO1Tz03Vx.Smb36xFW4jUxPzOCry', '2024-11-11 10:57:55', 1),
(2, 'opop', '$2y$10$x8RaTSD1SI0OY7xwW0SG3OrlDljvtUZGzTRdn.z57yd/HEjExC6B2', '2024-11-11 10:58:41', 1),
(3, 'joshua', '$2y$10$ighNHAUpd9zL6iXpvHDNEeIqYDxUPx574xGjjbTswF03GOcxrtZaC', '2024-11-11 11:02:49', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bikes`
--
ALTER TABLE `bikes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `likes`
--
ALTER TABLE `likes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `bike_id` (`bike_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bikes`
--
ALTER TABLE `bikes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `likes`
--
ALTER TABLE `likes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `likes`
--
ALTER TABLE `likes`
  ADD CONSTRAINT `likes_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `likes_ibfk_2` FOREIGN KEY (`bike_id`) REFERENCES `bikes` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
