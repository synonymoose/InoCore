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

-- Dumping data for table world.spell_areatrigger: 22 rows
/*!40000 ALTER TABLE `spell_areatrigger` DISABLE KEYS */;
INSERT INTO `spell_areatrigger` (`spell_id`, `selection`, `visualRadius`, `radius`, `ScriptName`, `Comment`) VALUES
	(122731, 2, 3, 3, 'spell_area_imperial_vizier_zorlok_noise_cancelling', 'Noise Cancelling, Imperial Vizier Zor\'lok'),
	(123811, 2, 35, 35, 'spell_area_imperial_vizier_zorlok_pheromones_of_zeal', 'Pheromones of Zeal, Imperial Vizier Zor\'lok'),
	(13810, 2, 10, 10, 'spell_area_hunter_ice_trap', 'Ice Trap, Hunter'),
	(116011, 1, 8, 8, 'spell_area_mage_rune_of_power', 'Rune of Power, Mage'),
	(116235, 2, 3.5, 3.5, 'spell_area_stone_guard_ametyst_pool', 'Ametyst Pool, Stone Guard'),
	(123461, 2, 60, 60, 'spell_area_lei_shi_get_away', 'Get Away, Lei Shi'),
	(144692, 2, 15, 15, 'spell_area_ordos_pool_of_fire', 'Pool of Fire, Ordos'),
	(102793, 2, 8, 8, 'spell_area_druid_ursols_vortex', 'Ursol\'s Vortex, Druid'),
	(115460, 1, 3.5, 1, 'spell_area_monk_healing_sphere', 'Healing Sphere, Monk'),
	(115817, 1, 6, 6, 'spell_area_fen_cancel_barrier', 'Cancel Barrier, Feng'),
	(116546, 2, 30, 30, 'spell_area_elegon_draw_power', 'Draw Power, Elegon'),
	(117032, 1, 3.5, 1, 'spell_area_monk_healing_sphere_afterlife', 'Healing Sphere (afterlife), Monk'),
	(119031, 1, 3.5, 1, 'spell_area_monk_gift_of_the_serpent', 'Gift of the Serpent, Monk'),
	(121286, 1, 3.5, 1, 'spell_area_monk_chi_sphere_afterlife', 'Chi Sphere (afterlife), Monk'),
	(121536, 1, 3.5, 1, 'spell_area_priest_angelic_feather', 'Angelic Feather, Priest'),
	(122035, 2, 3.5, 1, 'spell_area_monk_path_of_blossom', 'Path of Blossom, Monk'),
	(124503, 1, 3.5, 1, 'spell_area_monk_gift_of_the_ox_1', 'Gift of the Ox, Monk'),
	(124506, 1, 3.5, 1, 'spell_area_monk_gift_of_the_ox_2', 'Gift of the Ox, Monk'),
	(125270, 1, 1, 2, 'spell_area_grand_empress_shekzeer_sha_corrupt', ''),
	(115290, 2, 2, 2, 'spell_area_thalos_the_soulrender_spirit_gale', 'Spirit Gale, Thalos the Soulrender'),
	(125301, 2, 7, 7, '', 'Blade Tempest, Blade Lord Tayak'),
	(114035, 2, 3, 3, 'spell_area_jandice_barov_gravity_flux', 'Gravity Flux, Jandice Barov');
/*!40000 ALTER TABLE `spell_areatrigger` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
