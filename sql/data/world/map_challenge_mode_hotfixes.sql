-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.5.9-log - MySQL Community Server (GPL)
-- Server OS:                    Win32
-- HeidiSQL Version:             9.5.0.5196
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping data for table world.map_challenge_mode_hotfixes: 7 rows
/*!40000 ALTER TABLE `map_challenge_mode_hotfixes` DISABLE KEYS */;
INSERT INTO `map_challenge_mode_hotfixes` (`id`, `map_id`, `field2`, `field3`, `field4`, `bronze_time`, `silver_time`, `gold_time`, `field8`, `field9`) VALUES
	(161, 1209, 0, 0, 3, 3400, 1700, 1020, 0, 0),
	(164, 1182, 0, 0, 3, 3300, 1920, 1140, 0, 0),
	(165, 1176, 0, 0, 3, 3600, 1800, 1050, 0, 0),
	(166, 1208, 0, 0, 3, 3000, 1500, 870, 0, 0),
	(167, 1358, 0, 0, 3, 5100, 2580, 1500, 0, 0),
	(168, 1279, 0, 0, 3, 3600, 1800, 1050, 0, 0),
	(169, 1195, 0, 0, 3, 3600, 2040, 1200, 0, 0);
/*!40000 ALTER TABLE `map_challenge_mode_hotfixes` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
