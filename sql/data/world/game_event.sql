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

-- Dumping data for table world.game_event: 71 rows
/*!40000 ALTER TABLE `game_event` DISABLE KEYS */;
INSERT INTO `game_event` (`eventEntry`, `start_time`, `end_time`, `occurence`, `length`, `holiday`, `description`, `world_event`) VALUES
	(1, '2014-06-20 20:01:00', '2020-12-30 23:00:00', 525600, 20160, 341, 'Midsummer Fire Festival', 0),
	(2, '2014-12-16 04:00:00', '2020-12-30 12:00:00', 525600, 25920, 141, 'Winter Veil', 0),
	(3, '2012-11-03 18:01:00', '2012-12-31 01:00:00', 131040, 8639, 376, 'Darkmoon Faire (Terokkar Forest)', 0),
	(4, '2012-12-01 17:01:00', '2012-12-31 04:00:00', 131040, 8639, 374, 'Darkmoon Faire (Elwynn Forest)', 0),
	(5, '2012-10-06 17:01:00', '2012-12-31 04:00:00', 131040, 8639, 375, 'Darkmoon Faire (Mulgore)', 0),
	(6, '2010-01-01 00:00:00', '2020-12-30 23:00:00', 525600, 120, 0, 'New Year\'s Eve', 0),
	(7, '2011-01-22 18:01:00', '2020-12-30 23:00:00', 525600, 27360, 327, 'Lunar Festival', 0),
	(8, '2014-02-09 22:00:00', '2020-12-31 01:00:00', 525600, 20160, 423, 'Love is in the Air', 0),
	(9, '2014-04-21 02:00:00', '2020-12-31 01:00:00', 524160, 10080, 181, 'Noblegarden', 0),
	(10, '2015-04-27 04:00:00', '2020-12-31 01:00:00', 525600, 20160, 201, 'Children\'s Week ', 0),
	(11, '2012-09-17 19:00:00', '2020-12-30 23:00:00', 525600, 10080, 321, 'Harvest Festival', 0),
	(12, '2011-10-17 19:00:00', '2020-12-30 23:00:00', 525600, 20160, 324, 'Hallow\'s End', 0),
	(22, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 525600, 1, 0, 'AQ War Effort', 0),
	(17, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 525600, 1, 0, 'Scourge Invasion', 0),
	(13, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 525600, 1, 0, 'Elemental Invasions', 0),
	(14, '2011-12-31 17:00:00', '2020-12-30 23:00:00', 10080, 1440, 0, 'Stranglethorn Fishing Extravaganza Announce', 0),
	(16, '2007-08-04 22:00:00', '2020-12-30 23:00:00', 180, 120, 0, 'Gurubashi Arena Booty Run', 0),
	(15, '2012-01-01 07:00:00', '2020-12-30 23:00:00', 10080, 120, 301, 'Stranglethorn Fishing Extravaganza Fishing Pools', 0),
	(18, '2013-02-10 01:00:00', '2020-12-30 23:00:00', 90720, 10080, 283, 'Call to Arms: Alterac Valley!', 0),
	(19, '2013-01-06 01:00:00', '2020-12-30 23:00:00', 90720, 10080, 284, 'Call to Arms: Warsong Gulch!', 0),
	(20, '2013-01-27 01:00:00', '2020-12-30 23:00:00', 90720, 10080, 285, 'Call to Arms: Arathi Basin!', 0),
	(21, '2013-02-03 01:00:00', '2020-12-30 23:00:00', 90720, 10080, 353, 'Call to Arms: Eye of the Storm!', 0),
	(23, '2011-03-02 18:01:00', '2012-12-31 04:00:00', 131040, 4320, 0, 'Darkmoon Faire Building (Elwynn Forest)', 0),
	(24, '2012-09-19 18:01:00', '2020-12-30 23:00:00', 525600, 31680, 372, 'Brewfest', 0),
	(25, '2008-01-02 15:00:00', '2020-12-30 23:00:00', 1440, 720, 0, 'Nights', 0),
	(27, '2008-03-24 00:00:00', '2020-12-30 23:00:00', 86400, 21600, 0, 'Edge of Madness, Gri\'lek', 0),
	(28, '2008-04-07 00:00:00', '2020-12-30 23:00:00', 86400, 21600, 0, 'Edge of Madness, Hazza\'rah', 0),
	(29, '2008-04-21 00:00:00', '2020-12-30 23:00:00', 86400, 21600, 0, 'Edge of Madness, Renataki', 0),
	(30, '2008-05-05 00:00:00', '2020-12-30 23:00:00', 86400, 21600, 0, 'Edge of Madness, Wushoolay', 0),
	(31, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 5184000, 2592000, 0, 'Arena Tournament', 0),
	(32, '2008-05-15 14:00:00', '2020-01-01 01:00:00', 10080, 5, 0, 'L70ETC Concert', 0),
	(33, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 5184000, 0, 0, 'Shattered Sun Offensive: Phase 1 - Reclaiming the Sanctum', 2),
	(34, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 5184000, 2592000, 0, 'Shattered Sun Offensive: Phase 1 - Reclaiming the Sanctum COMPLETE', 2),
	(35, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 5184000, 0, 0, 'Shattered Sun Offensive: Phase 2 - Sun\'s Reach Armory', 2),
	(36, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 5184000, 2592000, 0, 'Shattered Sun Offensive: Phase 2 - Sun\'s Reach Armory COMPLETE', 2),
	(37, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 5184000, 0, 0, 'Shattered Sun Offensive: Phase 2b - Activating the Sunwell Portal', 2),
	(38, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 5184000, 2592000, 0, 'Shattered Sun Offensive: Phase 2b - Activating the Sunwell Portal COMPLETE', 2),
	(39, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 5184000, 0, 0, 'Shattered Sun Offensive: Phase 3 - Sun\'s Reach Harbor', 2),
	(40, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 5184000, 2592000, 0, 'Shattered Sun Offensive: Phase 3 - Sun\'s Reach Harbor COMPLETE', 2),
	(41, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 5184000, 0, 0, 'Shattered Sun Offensive: Phase 3b - Rebuilding the Anvil and Forge', 2),
	(42, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 5184000, 2592000, 0, 'Shattered Sun Offensive: Phase 3b - Rebuilding the Anvil and Forge COMPLETE', 2),
	(43, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 5184000, 0, 0, 'Shattered Sun Offensive: Phase 4A - Creating the Alchemy Lab', 2),
	(44, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 5184000, 2592000, 0, 'Shattered Sun Offensive: Phase 4A - Creating the Alchemy Lab COMPLETE', 2),
	(45, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 5184000, 0, 0, 'Shattered Sun Offensive: Phase 4B - Building the Monument to the Fallen', 2),
	(46, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 5184000, 2592000, 0, 'Shattered Sun Offensive: Phase 4B - Building the Monument to the Fallen COMPLETE', 2),
	(47, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 5184000, 2592000, 0, 'Shattered Sun Offensive: Phase 4 - COMPLETE', 2),
	(52, '2013-12-25 01:00:00', '2020-12-31 01:00:00', 525600, 11700, 0, 'Winter Veil: Gifts', 0),
	(51, '2012-10-31 20:00:00', '2020-12-30 23:00:00', 525600, 2820, 409, 'Day of the Dead', 0),
	(48, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 5184000, 2592000, 0, 'Wintergrasp Alliance Defence', 5),
	(49, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 5184000, 2592000, 0, 'Wintergrasp Horde Defence', 5),
	(53, '2013-01-13 01:00:00', '2020-12-30 23:00:00', 90720, 10080, 400, 'Call to Arms: Strand of the Ancients!', 0),
	(55, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 5184000, 2592000, 0, 'Arena Season 3', 0),
	(56, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 5184000, 2592000, 0, 'Arena Season 4', 0),
	(57, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 5184000, 2592000, 0, 'Arena Season 5', 0),
	(58, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 5184000, 2592000, 0, 'Arena Season 6', 0),
	(59, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 5184000, 2592000, 0, 'Arena Season 7', 0),
	(60, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 5184000, 2592000, 0, 'Arena Season 8', 0),
	(54, '2013-01-20 01:00:00', '2020-12-30 23:00:00', 90720, 10080, 420, 'Call to Arms: Isle of Conquest!', 0),
	(50, '2012-09-18 18:01:00', '2020-12-30 22:00:00', 525600, 1440, 398, 'Pirates\' Day', 0),
	(61, '2010-09-06 18:00:00', '2010-10-09 18:00:00', 9999999, 47520, 0, 'Zalazane\'s Fall', 0),
	(62, '2012-01-01 07:00:00', '2020-12-30 23:00:00', 10080, 180, 0, 'Stranglethorn Fishing Extravaganza Turn-ins', 0),
	(63, '2012-01-07 06:00:00', '2020-12-30 23:00:00', 10080, 180, 424, 'Kalu\'ak Fishing Derby Turn-ins', 0),
	(64, '2012-01-07 07:00:00', '2020-12-30 23:00:00', 10080, 60, 0, 'Kalu\'ak Fishing Derby Fishing Pools', 0),
	(26, '2014-11-24 03:00:00', '2020-12-30 22:00:00', 525600, 14400, 404, 'Pilgrim\'s Bounty', 0),
	(65, '2013-02-17 01:00:00', '2020-12-30 23:00:00', 90720, 10080, 435, 'Call to Arms: Battle for Gilneas', 0),
	(66, '2013-02-24 01:00:00', '2020-12-30 23:00:00', 90720, 10080, 436, 'Call to Arms: Twin Peaks', 0),
	(67, '2013-03-03 01:00:00', '2020-12-30 23:00:00', 90720, 10080, 488, 'Call to Arms: Silvershard Mines', 0),
	(68, '2013-03-10 01:00:00', '2020-12-30 23:00:00', 90720, 10080, 489, 'Call to Arms: Temple of Kotmogu', 0),
	(69, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 5184000, 2592000, 0, 'Arena Season 9', 0),
	(75, '2014-03-02 01:00:00', '2020-12-30 14:00:00', 43680, 8639, 479, 'Darkmoon Faire', 0),
	(76, '2013-03-09 22:00:00', '2020-12-30 20:00:00', 90720, 10080, 515, 'Call to Arms: Deepwind Gorge', 0);
/*!40000 ALTER TABLE `game_event` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
