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

-- Dumping data for table auth.account: ~1 rows (approximately)
/*!40000 ALTER TABLE `account` DISABLE KEYS */;
INSERT INTO `account` (`id`, `username`, `sha_pass_hash`, `sessionkey`, `v`, `s`, `token_key`, `email`, `joindate`, `last_ip`, `failed_logins`, `locked`, `last_login`, `online`, `expansion`, `mutetime`, `locale`, `os`, `recruiter`) VALUES
	(1, 'ADMIN', '8301316D0D8448A34FA6D0C6BF1CBFA2B4A1A93A', '65FACC1F4BD5E4E05403C3BD1D2F6FD111242617F1A18A25E93CA67CF9F779E6F17D29B05EB425A6', '3FAEECD2484A1652BCC2E2CCA859914DD34D58BCCD5BC18873807CBA70B432E2', 'B9E854966F1433E1B9D29CE9ABCB6D67F2F1A2203127EC697C2AD37EA1430203', '', '', '2018-12-16 11:16:39', '127.0.0.1', 0, 0, '2018-12-16 11:41:07', 1, 4, 0, 0, 'Win', 0);
/*!40000 ALTER TABLE `account` ENABLE KEYS */;

-- Dumping data for table auth.account_access: ~1 rows (approximately)
/*!40000 ALTER TABLE `account_access` DISABLE KEYS */;
INSERT INTO `account_access` (`id`, `gmlevel`, `RealmID`, `comment`) VALUES
	(1, 3, -1, 'ADMIN');
/*!40000 ALTER TABLE `account_access` ENABLE KEYS */;

-- Dumping data for table auth.account_banned: ~0 rows (approximately)
/*!40000 ALTER TABLE `account_banned` DISABLE KEYS */;
/*!40000 ALTER TABLE `account_banned` ENABLE KEYS */;

-- Dumping data for table auth.account_log_ip: 1 rows
/*!40000 ALTER TABLE `account_log_ip` DISABLE KEYS */;
INSERT INTO `account_log_ip` (`accountid`, `ip`, `date`) VALUES
	(2, '127.0.0.1', '2018-12-16 11:17:05');
/*!40000 ALTER TABLE `account_log_ip` ENABLE KEYS */;

-- Dumping data for table auth.account_premium: ~0 rows (approximately)
/*!40000 ALTER TABLE `account_premium` DISABLE KEYS */;
/*!40000 ALTER TABLE `account_premium` ENABLE KEYS */;

-- Dumping data for table auth.account_rep_mods: ~0 rows (approximately)
/*!40000 ALTER TABLE `account_rep_mods` DISABLE KEYS */;
/*!40000 ALTER TABLE `account_rep_mods` ENABLE KEYS */;

-- Dumping data for table auth.account_spell: ~0 rows (approximately)
/*!40000 ALTER TABLE `account_spell` DISABLE KEYS */;
/*!40000 ALTER TABLE `account_spell` ENABLE KEYS */;

-- Dumping data for table auth.firewall_farms: ~0 rows (approximately)
/*!40000 ALTER TABLE `firewall_farms` DISABLE KEYS */;
/*!40000 ALTER TABLE `firewall_farms` ENABLE KEYS */;

-- Dumping data for table auth.ip_banned: ~0 rows (approximately)
/*!40000 ALTER TABLE `ip_banned` DISABLE KEYS */;
/*!40000 ALTER TABLE `ip_banned` ENABLE KEYS */;

-- Dumping data for table auth.ip_to_country: 0 rows
/*!40000 ALTER TABLE `ip_to_country` DISABLE KEYS */;
/*!40000 ALTER TABLE `ip_to_country` ENABLE KEYS */;

-- Dumping data for table auth.logs: ~0 rows (approximately)
/*!40000 ALTER TABLE `logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `logs` ENABLE KEYS */;

-- Dumping data for table auth.log_vote: ~0 rows (approximately)
/*!40000 ALTER TABLE `log_vote` DISABLE KEYS */;
/*!40000 ALTER TABLE `log_vote` ENABLE KEYS */;

-- Dumping data for table auth.mails: ~0 rows (approximately)
/*!40000 ALTER TABLE `mails` DISABLE KEYS */;
/*!40000 ALTER TABLE `mails` ENABLE KEYS */;

-- Dumping data for table auth.realmcharacters: ~1 rows (approximately)
/*!40000 ALTER TABLE `realmcharacters` DISABLE KEYS */;
INSERT INTO `realmcharacters` (`realmid`, `acctid`, `numchars`) VALUES
	(1, 2, 1);
/*!40000 ALTER TABLE `realmcharacters` ENABLE KEYS */;

-- Dumping data for table auth.realmlist: ~1 rows (approximately)
/*!40000 ALTER TABLE `realmlist` DISABLE KEYS */;
INSERT INTO `realmlist` (`id`, `name`, `address`, `port`, `icon`, `flag`, `timezone`, `allowedSecurityLevel`, `population`, `gamebuild`, `online`, `delay`, `queued`) VALUES
	(1, 'InoCore', '127.0.0.1', 8085, 0, 0, 1, 0, 0, 18019, 1, 10, 0);
/*!40000 ALTER TABLE `realmlist` ENABLE KEYS */;

-- Dumping data for table auth.transferts: ~0 rows (approximately)
/*!40000 ALTER TABLE `transferts` DISABLE KEYS */;
/*!40000 ALTER TABLE `transferts` ENABLE KEYS */;

-- Dumping data for table auth.transferts_logs: ~0 rows (approximately)
/*!40000 ALTER TABLE `transferts_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `transferts_logs` ENABLE KEYS */;

-- Dumping data for table auth.uptime: ~2 rows (approximately)
/*!40000 ALTER TABLE `uptime` DISABLE KEYS */;
INSERT INTO `uptime` (`realmid`, `starttime`, `uptime`, `maxplayers`, `revision`) VALUES
	(1, 1544976975, 0, 0, 'JadeCore rev. 0000-00-00 00:00:00 +0000 (Archived) (Win32, Release)'),
	(1, 1544978413, 1800, 1, 'JadeCore rev. 0000-00-00 00:00:00 +0000 (Archived) (Win32, Release)');
/*!40000 ALTER TABLE `uptime` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
