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

-- Dumping data for table world.challenge_mode_rewards: 9 rows
/*!40000 ALTER TABLE `challenge_mode_rewards` DISABLE KEYS */;
INSERT INTO `challenge_mode_rewards` (`map_id`, `none_money`, `bronze_money`, `silver_money`, `gold_money`, `none_valor`, `bronze_valor`, `silver_valor`, `gold_valor`, `title`, `gold_achievement`, `comment`) VALUES
	(960, 114000, 228000, 342000, 456000, 0, 12500, 15000, 16500, 374, 8430, 'Temple of the Jade Serpent'),
	(961, 114000, 228000, 342000, 456000, 0, 12500, 15000, 16500, 373, 8431, 'Stormstout Brewery'),
	(962, 114000, 228000, 342000, 456000, 0, 12500, 15000, 16500, 366, 8434, 'Gate of the Setting Sun'),
	(959, 114000, 228000, 342000, 456000, 0, 12500, 15000, 16500, 371, 8432, 'Shado-Pan Monastery'),
	(1011, 114000, 228000, 342000, 456000, 0, 12500, 15000, 16500, 372, 8439, 'Siege of Niuzao Temple'),
	(994, 114000, 228000, 342000, 456000, 0, 12500, 15000, 16500, 367, 8433, 'Mogu\'shan Palace'),
	(1007, 114000, 228000, 342000, 456000, 0, 12500, 15000, 16500, 370, 8438, 'Scholomance'),
	(1001, 114000, 228000, 342000, 456000, 0, 12500, 15000, 16500, 368, 8436, 'Scarlet Halls'),
	(1004, 114000, 228000, 342000, 456000, 0, 12500, 15000, 16500, 369, 8437, 'Scarlet Monastery');
/*!40000 ALTER TABLE `challenge_mode_rewards` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
