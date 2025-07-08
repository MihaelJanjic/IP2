-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 08, 2025 at 12:25 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `watchitlater`
--

-- --------------------------------------------------------

--
-- Table structure for table `watchitlater`
--

CREATE TABLE `watchitlater` (
  `id` int(11) NOT NULL,
  `type` varchar(50) NOT NULL,
  `name` varchar(100) NOT NULL,
  `season` int(3) DEFAULT NULL,
  `date` varchar(100) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `image` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `watchitlater`
--

INSERT INTO `watchitlater` (`id`, `type`, `name`, `season`, `date`, `description`, `image`) VALUES
(1, 'Show', 'The Witcher', 4, '2025-2026', NULL, 'https://dnm.nflximg.net/api/v6/2DuQlx0fM4wd1nzqm5BFBi6ILa8/AAAAQTNqB2yoQOufQnRNuZvxnyJOxV58m7k3P3AYY1-6-_2PuNHRUNzplAoSz9ULl54PMrfBxo7Pv7wdFoSG9F5goQruw5XAgmFhIBmHXdCezlmxM0pLbsQS42bGmOgPipQ_-F8xQH5Znx_KXgLyg-pSRIDe.jpg?r=3af'),
(2, 'Anime', 'Demon slayer: Infinity Castle', NULL, '12.9.2025.', 'In Japan it releases on July 18, 2025.', 'https://static.beebom.com/wp-content/uploads/2025/03/Infinity-Castle-arc.jpg?w=1168&quality=75'),
(5, 'Game', 'Soulframe', NULL, '2025.', 'Free-To-Play fantasy action MMO focused on melee combat, exploration, and restoring a world corrupted by industry.', 'https://www-static.soulframe.com/images/opengraph-image6.jpg'),
(6, 'Show', 'Alien: Earth', 1, '12.8.2025.', 'A sci-fi horror prequel set two years before the original Alien film, following a synthetic’s mission that uncovers alien life.', 'https://img.youtube.com/vi/sgTBZmqrAIA/maxresdefault.jpg'),
(8, 'Movie', 'M3GAN 2.0', NULL, '27.6.2025.', NULL, 'https://upload.wikimedia.org/wikipedia/en/thumb/9/94/M3GAN_2.0_Official_Poster.jpg/250px-M3GAN_2.0_Official_Poster.jpg'),
(15, 'Movie', 'The Conjuring: Last Rites', 0, '5.9.2025.', 'Ed and Lorraine Warren close their supernatural saga with one final case.', 'https://cinetown.s3.ap-south-1.amazonaws.com/movies/poster/1748710960.jpeg'),
(16, 'Show', 'Peacemaker', 2, '21.8.2025.', 'John Cena returns as Peacemaker in an emotionally rich, action‑packed season exploring his past and bridging into the new DCU.', 'https://upload.wikimedia.org/wikipedia/en/2/24/Peacemaker_season_2_poster.jpg'),
(17, 'Movie', 'Mission: Impossible – The Final Reckoning', 0, '23.5.2025.', 'Tom Cruise returns as Ethan Hunt in the eighth installment of the action-packed spy thriller series.', 'https://www.fhstheflash.com/wp-content/uploads/2025/05/mi-reckoning-web-1200x675.jpg'),
(18, 'Movie', 'Superman', 0, '11.7.2025.', 'James Gunn\'s reimagining of the iconic superhero, starring David Corenswet as Clark Kent.', 'https://resizing.flixster.com/08R7NSRbZV4s8n5wlLgZLVyMrZ0=/ems.cHJkLWVtcy1hc3NldHMvbW92aWVzLzBhZDkzNTk2LTk3MzktNDY0ZS1hN2NkLWFkMmQxMDc3MjAzOC5qcGc='),
(19, 'Movie', 'Jurassic World: Rebirth', 0, '2.7.2025.', 'A new chapter in the Jurassic World saga, introducing a fresh cast and thrilling dinosaur adventures.', 'https://m.media-amazon.com/images/M/MV5BMDE1N2EzMjAtMDY1My00YWE5LWEyYjYtYmE3YjZjNzQwNDhmXkEyXkFqcGc@._V1_.jpg'),
(20, 'Movie', 'Wicked: For Good', 2, '21.11.2025.', 'The second part of the musical adaptation, continuing the story of Elphaba and Glinda.', 'https://www.7xs.com.au/wp-content/uploads/sites/48/2025/06/20250605-wicked-feature.jpg'),
(21, 'Movie', 'Avatar: Fire and Ash', 3, '19.12.2025.', 'James Cameron returns with the third installment of the Avatar saga, exploring new clans on Pandora.', 'https://cdn.mos.cms.futurecdn.net/eLX7svojUEdyqTay3JAywG-1200-80.jpg'),
(22, 'Movie', 'Five Nights at Freddy\'s 2', 2, '5.12.2025.', 'The sequel to the hit horror film, featuring new animatronic horrors and a chilling storyline.', 'https://pbs.twimg.com/media/GJeskIfWoAALXRx.jpg'),
(23, 'Game', 'Sid Meier\'s Civilization VII', 7, '11.2.2025.', 'The latest installment in the strategy series, allowing players to build and lead their empire through history.', 'https://i.ytimg.com/vi/9P_RGVGtEYo/maxresdefault.jpg'),
(24, 'Game', 'Mafia: The Old Country', 0, '8.8.2025.', 'A prequel set in early 1900s Sicily, exploring the origins of the Mafia through the story of Enzo Favara.', 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/1941540/480ec5d21e6d63e1b9eedbb32d3bce88c19a0542/capsule_616x353.jpg?t=1751062323'),
(25, 'Game', 'Little Nightmares III', 3, '10.10.2025.', 'A horror puzzle-platformer where two children navigate \'The Nowhere\' to escape a looming threat.', 'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/1392860/capsule_616x353.jpg?t=1751007819'),
(26, 'Game', 'High on Life 2', 0, 'Q4 2025', 'A first-person shooter sequel with talking weapons and a new skateboarding mechanic.', 'https://xboxwire.thesourcemediaassets.com/sites/2/2025/06/High-on-Life-2-8636417da340b43c7789.jpg'),
(27, 'Game', 'Heroes of Might and Magic: Olden Era', 0, 'Summer 2025', 'A turn-based strategy game introducing new RPG mechanics and multiplayer modes.', 'https://imgeucdn.gamespress.com/cdn/files/Games%20Press/2025/06/301421-9c6c589e/Heroes_of_Might_and_Magic_Olden_Era_Art.png?w=533&mode=max&otf=y&quality=90&format=png&bgcolor=transparent&sky=4889e01467537afa75bf6801cf98d945cc1df04831aee5325adceda04820bfa9');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `watchitlater`
--
ALTER TABLE `watchitlater`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `watchitlater`
--
ALTER TABLE `watchitlater`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
