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

-- Dumping data for table world.battleground_template: 21 rows
/*!40000 ALTER TABLE `battleground_template` DISABLE KEYS */;
INSERT INTO `battleground_template` (`id`, `MinPlayersPerTeam`, `MaxPlayersPerTeam`, `MinLvl`, `MaxLvl`, `AllianceStartLoc`, `AllianceStartO`, `HordeStartLoc`, `HordeStartO`, `StartMaxDist`, `Weight`, `holiday`, `ScriptName`, `Name_loc1`, `Name_loc2`, `Name_loc3`, `Name_loc4`, `Name_loc5`, `Name_loc6`, `Name_loc7`, `Name_loc8`, `Name_loc9`, `Name_loc10`, `Name_loc11`, `Comment`) VALUES
	(1, 10, 40, 45, 90, 611, 3.16312, 610, 0.715504, 100, 2, 283, '', 'Alterac Valley', '', '', '', '', '', '', 'Альтеракская долина', '', '', '', 'Alterac Valley'),
	(2, 5, 10, 10, 90, 769, 3.14159, 770, 0.151581, 75, 8, 284, '', 'Warsong Gulch', '', '', '', '', '', '', 'Ущелье Песни Войны', '', '', '', 'Warsong Gulch'),
	(3, 8, 15, 10, 90, 890, 3.91571, 889, 0.813671, 75, 8, 285, '', 'Arathi Basin', '', '', '', '', '', '', 'Низина Арати', '', '', '', 'Arathi Basin'),
	(7, 8, 15, 35, 90, 1103, 3.03123, 1104, 0.055761, 75, 8, 353, '', 'Eye of The Storm', '', '', '', '', '', '', 'Око Бури', '', '', '', 'Eye of The Storm'),
	(4, 0, 2, 10, 90, 929, 0, 936, 3.14159, 0, 1, 0, '', 'Nagrand Arena', '', '', '', '', '', '', 'Арена Награнда', '', '', '', 'Nagrand Arena'),
	(5, 0, 2, 10, 90, 939, 0, 940, 3.14159, 0, 1, 0, '', 'Blades\'s Edge Arena', '', '', '', '', '', '', 'Арена Острогорья', '', '', '', 'Blades\'s Edge Arena'),
	(6, 0, 2, 10, 90, 0, 0, 0, 0, 0, 1, 0, '', 'All Arena', '', '', '', '', '', '', 'Все Арены', '', '', '', 'All Arena'),
	(8, 0, 2, 10, 90, 1258, 0, 1259, 3.14159, 0, 1, 0, '', 'Ruins of Lordaeron', '', '', '', '', '', '', 'Руины Лордерона', '', '', '', 'Ruins of Lordaeron'),
	(9, 8, 15, 65, 90, 1367, 0, 1368, 0, 0, 6, 400, '', 'Strand of the Ancients', '', '', '', '', '', '', 'Берег Древних', '', '', '', 'Strand of the Ancients'),
	(10, 0, 5, 10, 91, 1362, 0, 1363, 3.14159, 0, 1, 0, '', 'Dalaran Sewers', '', '', '', '', '', '', 'Арена Даларана', '', '', '', 'Dalaran Sewers'),
	(11, 5, 5, 91, 91, 1364, 0, 1365, 0, 0, 1, 0, '', 'The Ring of Valor', '', '', '', '', '', '', 'Арена Доблести', '', '', '', 'The Ring of Valor'),
	(30, 10, 40, 71, 90, 1485, 0, 1486, 3.16124, 200, 2, 420, '', 'Isle of Conquest', '', '', '', '', '', '', 'Остров Завоеваний', '', '', '', 'Isle of Conquest'),
	(32, 5, 40, 45, 90, 0, 0, 0, 0, 0, 1, 0, '', 'Random battleground', '', '', '', '', '', '', 'Случайное поле боя', '', '', '', 'Random battleground'),
	(699, 5, 10, 70, 90, 4059, 0, 4060, 0, 20, 8, 489, '', 'Temple of Kotmogu', '', '', '', '', '', '', 'Храм Котмогу', '', '', '', 'Kotmogu\'s temple'),
	(108, 5, 10, 71, 90, 1726, 0, 1727, 0, 0, 8, 436, '', 'Twin Peaks', '', '', '', '', '', '', 'Два Пика', '', '', '', 'Twin Peaks'),
	(120, 5, 10, 10, 90, 1740, 0, 1799, 0, 0, 8, 435, '', 'The Battle for Gilneas', '', '', '', '', '', '', 'Битва за Гилнеас', '', '', '', 'Battle for Gilneas'),
	(754, 3, 5, 90, 90, 4487, 0, 4486, 0, 0, 6, 515, '', 'Deepwind Gorge', '', '', '', '', '', '', '', 'Deepwind Gorge', '', '', 'Deepwind Gorge'),
	(757, 0, 5, 10, 90, 4534, 0, 4535, 0, 0, 1, 0, '', 'The Tiger\'s Peak', '', '', '', '', '', '', '', '', '', '', 'The Tiger\'s Peak'),
	(100, 10, 10, 90, 90, 0, 0, 0, 0, 0, 1, 0, '', 'Rated Battleground 10v10', '', '', '', '', '', '', 'Рейтинговое поле боя', '', '', '', 'Rated Battleground 10v10'),
	(719, 0, 5, 90, 90, 4136, 0, 4137, 0, 10, 1, 0, '', 'Tol\'viron Arena', '', '', '', '', '', '', '', '', '', '', 'Tol\'viron Arena'),
	(708, 8, 10, 90, 90, 4062, 3.14, 4061, 3.14, 15, 12, 488, '', '', '', '', '', '', '', '', '', '', '', '', 'SilverShard Mines');
/*!40000 ALTER TABLE `battleground_template` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
