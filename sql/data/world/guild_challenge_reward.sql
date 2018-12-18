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

-- Dumping data for table world.guild_challenge_reward: ~6 rows (approximately)
/*!40000 ALTER TABLE `guild_challenge_reward` DISABLE KEYS */;
INSERT INTO `guild_challenge_reward` (`Type`, `Experience`, `Gold`, `Gold2`, `Count`) VALUES
	(0, 0, 0, 0, 0),
	(1, 300000, 250, 125, 7),
	(2, 3000000, 1000, 500, 1),
	(3, 1500000, 500, 250, 3),
	(4, 50000, 250, 125, 15),
	(5, 1000000, 500, 250, 3);
/*!40000 ALTER TABLE `guild_challenge_reward` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
