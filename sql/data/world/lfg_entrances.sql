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

-- Dumping data for table world.lfg_entrances: ~43 rows (approximately)
/*!40000 ALTER TABLE `lfg_entrances` DISABLE KEYS */;
INSERT INTO `lfg_entrances` (`dungeonId`, `name`, `position_x`, `position_y`, `position_z`, `orientation`) VALUES
	(2, 'Scholomance', 199.876, 125.346, 138.43, 4.67748),
	(18, 'Scarlet Monastery - Graveyard', 1688.99, 1053.48, 18.6775, 0.00117),
	(26, 'Maraudon - Orange Crystals', 1019.69, -458.31, -43.43, 0.31),
	(34, 'Dire Maul - East', 44.4499, -154.822, -2.71201, 0),
	(36, 'Dire Maul - West', -62.9658, 159.867, -3.46206, 3.14788),
	(38, 'Dire Maul - North', 255.249, -16.0561, -2.58737, 4.7),
	(40, 'Stratholme - Main Gate', 3395.09, -3380.25, 142.702, 0.1),
	(163, 'Scarlet Monastery - Armory', 1610.83, -323.433, 18.6738, 6.28022),
	(164, 'Scarlet Monastery', 1124.77, 521.32, 1.5, 1.6),
	(165, 'Scarlet Monastery - Library', 255.346, -209.09, 18.6773, 6.26656),
	(217, 'Gundrak - South', 1894.58, 652.713, 176.666, 4.078),
	(272, 'Maraudon - Purple Crystals', 752.91, -616.53, -33.11, 1.37),
	(273, 'Maraudon - Pristine Waters', 495.702, 17.3372, -96.3128, 3.11854),
	(274, 'Stratholme - Service Entrance', 3593.15, -3646.56, 138.5, 5.33),
	(285, 'The Headless Horseman', 1124.77, 521.32, 1.5, 1.6),
	(286, 'The Frost Lord Ahune', -100.396, -95.9996, -4.28423, 4.71239),
	(287, 'Coren Direbrew', 897.495, -141.976, -49.7563, 2.1255),
	(288, 'The Crown Chemical Co.', -238.075, 2166.43, 88.853, 1.13446),
	(474, 'Scarlet Monastery', 1124.77, 521.32, 1.5, 1.6),
	(527, 'Mogu\'shan Vaults - Entrance Target', 3861.56, 1045.11, 490.073, 6.24687),
	(528, 'Scenario - Ring of Blood - Start', 4276.98, 1462.39, 445.461, 1.5708),
	(529, 'Heart of Fear - Entrance Target', -2373.58, 460.01, 422.341, 6.282),
	(530, 'Scenario - Ring of Blood - Start', -1926.55, 475.847, 470.958, 3.1416),
	(537, 'AssaultOnZanvess_horde', -1435.65, 3935, 6.51, 5.81),
	(566, 'TheramoresFall_A', -4018.29, -4747.51, 20.1, 0.71),
	(567, 'TheramoresFall_H', -3814.29, -4794.1, 10.87, 0.94),
	(593, 'AssaultOnZanvess_alliance', -678.72, 4409.05, 186.21, 4.53),
	(594, 'BlackTempleScenario', 706.74, 954.36, 53.06, 4.69),
	(610, 'Thunder King Raid - Entrance Target', 5892.09, 6615.74, 106.109, 4.7124),
	(611, 'Thunder King Raid - LFR Second Wing Entrance', 6042.61, 5076.46, -44.5322, 4.7124),
	(612, 'Thunder King Raid - LFR Third Wing Entrance', 6081.01, 4433.47, -13.1465, 2.17464),
	(613, 'Thunder King Raid - LFR Fourth Wing Entrance', 5831.82, 4848.53, 89.4996, 1.571),
	(615, 'Thunder Forge', 7245.83, 5300.06, 65.99, 3.88),
	(637, 'BloodOnTheSnow', -5213.37, -448.99, 387.33, 2.34),
	(646, 'BloodOnTheSnow_heroic', -5213.37, -448.99, 387.33, 2.34),
	(716, 'Garrosh Raid - Entrance Target', 1440.89, 263.047, 283.558, 1.5706),
	(717, 'Garrosh Raid - Pre-Galakras Transfer Loc', 1440.25, -5015.09, 12.1583, 1.6646),
	(724, 'Garrosh Raid - Pre-Malkorok Transfer Loc', 1795.51, -4774.25, -254.601, 5.30498),
	(725, 'Garrosh Raid - Underhold Nexus Transfer Loc', 1992.65, -5169.94, -270.238, 3.78254),
	(839, 'Garrosh Raid - Entrance Target', 1440.89, 263.047, 283.558, 1.5706),
	(840, 'Garrosh Raid - Pre-Galakras Transfer Loc', 1440.25, -5015.09, 12.1583, 1.6646),
	(841, 'Garrosh Raid - Pre-Malkorok Transfer Loc', 1795.51, -4774.25, -254.601, 5.30498),
	(842, 'Garrosh Raid - Underhold Nexus Transfer Loc', 1992.65, -5169.94, -270.238, 3.78254);
/*!40000 ALTER TABLE `lfg_entrances` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
