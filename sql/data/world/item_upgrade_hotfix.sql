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

-- Dumping data for table world.item_upgrade_hotfix: ~4 rows (approximately)
/*!40000 ALTER TABLE `item_upgrade_hotfix` DISABLE KEYS */;
INSERT INTO `item_upgrade_hotfix` (`Id`, `itemUpgradePath`, `itemLevelUpgrade`, `prevItemUpgradeId`, `currencyId`, `currencyCost`) VALUES
	(504, 124, 12, 493, 396, 25000),
	(505, 124, 16, 504, 396, 25000),
	(506, 125, 20, 498, 396, 25000),
	(507, 125, 24, 506, 396, 25000);
/*!40000 ALTER TABLE `item_upgrade_hotfix` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
