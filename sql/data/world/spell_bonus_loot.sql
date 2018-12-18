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

-- Dumping data for table world.spell_bonus_loot: 16 rows
/*!40000 ALTER TABLE `spell_bonus_loot` DISABLE KEYS */;
INSERT INTO `spell_bonus_loot` (`creatureEntry`, `currency`, `spellId`, `lootSourceType`, `lootSourceEntry`, `Comments`) VALUES
	(69465, 752, 139674, 1, 69465, 'Jin\'rokh the Breaker'),
	(68476, 752, 139677, 1, 68476, 'Horridon'),
	(71734, 776, 145912, 2, 221739, 'Sha of Pride 10N'),
	(717344, 776, 145912, 2, 221739, 'Sha of Pride 25N'),
	(71543, 776, 145909, 2, 221776, 'Immerseus 10N'),
	(715434, 776, 145909, 2, 221776, 'Immerseus 25N'),
	(71475, 776, 145910, 1, 71475, 'Fallen Protectors (Rook Stonetoe) 10N'),
	(714754, 776, 145910, 1, 71475, 'Fallen Protectors (Rook Stonetoe) 25N'),
	(72276, 776, 145911, 1, 72276, 'Norushen (Amalgam of Corruption) 10N'),
	(722764, 776, 145911, 1, 72276, 'Norushen (Amalgam of Corruption) 25N'),
	(72249, 776, 145913, 1, 72249, 'Galakras 10N'),
	(722494, 776, 145913, 1, 72249, 'Galakras 25N'),
	(71466, 776, 145914, 1, 71466, 'Iron Juggernaut 10N'),
	(714664, 776, 145914, 1, 71466, 'Iron Juggernaut 25N'),
	(71859, 776, 145915, 1, 71859, 'Kor\'kron Dark Shaman (Earthbreaker Haromm) 10N'),
	(718594, 776, 145915, 1, 71859, 'Kor\'kron Dark Shaman (Earthbreaker Haromm) 10N');
/*!40000 ALTER TABLE `spell_bonus_loot` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
