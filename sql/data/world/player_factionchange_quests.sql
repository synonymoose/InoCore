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

-- Dumping data for table world.player_factionchange_quests: 6 rows
/*!40000 ALTER TABLE `player_factionchange_quests` DISABLE KEYS */;
INSERT INTO `player_factionchange_quests` (`allianceQuestId`, `hordeQuestId`, `Comments`) VALUES
	(32388, 32430, 'A Change of Command'),
	(32389, 32431, 'The Lion Roars & Glory to the Horde'),
	(32373, 32427, 'The Measure of a Leader'),
	(32374, 32429, 'The Prince\'s Pursuit'),
	(32474, 32476, 'A Test of Valor'),
	(32390, 32432, 'Call of the Packmaster & The Soul of the Horde');
/*!40000 ALTER TABLE `player_factionchange_quests` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
