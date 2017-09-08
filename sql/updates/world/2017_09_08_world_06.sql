SET @BP_ENTRY     = 951;
SET @SI_ENTRY     = 49869;
SET @BBW_ENTRY    = 49871;
SET @MMCB_ENTRY   = 197;
SET @SIS_ENTRY    = 50047;
SET @GA_ENTRY     = 50039;
SET @H_ENTRY      = 448;
SET @LN_ENTRY     = 61837;
SET @SAR_ENTRY    = 42216;
SET @WOLF_ENTRY_1 = 43291;
SET @WOLF_ENTRY_2 = 43292;
SET @MAGE_ENTRY   = 53836;

DELETE FROM `creature` WHERE `guid`=11598421;
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`MovementType`) VALUES
(11598421, @MAGE_ENTRY, 0, 1, -8959, -147, 81.5134, 3.76123, 300, 0, 0);
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@MAGE_ENTRY;
DELETE FROM `smart_scripts` WHERE (`entryorguid`=-11598421 AND `source_type`=0);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(-11598421, 0, 0, 0, 1, 0, 100, 0, 4200, 6700, 5100, 6400, 11, 167677, 0, 0, 0, 0, 0, 10, 18253, 44548, 0, 0, 0, 0, 0, "Stormwind Mage - On Reset - Summon Water Elemental"),
(-11598421, 0, 1, 0, 1, 0, 100, 0, 7400, 7900, 6700, 7100, 11, 166991, 0, 0, 0, 0, 0, 10, 18253, 44548, 0, 0, 0, 0, 0, "Stormwind Mage - On Reset - Summon Water Elemental");
DELETE FROM `creature_template_addon` WHERE `entry`=@MAGE_ENTRY;
INSERT INTO `creature_template_addon` (`entry`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES
(@MAGE_ENTRY, 0, 257, 474, '69787');

DELETE FROM `creature_equip_template` WHERE `entry`=@BP_ENTRY;
INSERT INTO `creature_equip_template` (`entry`, `itemEntry1`, `itemEntry2`, `itemEntry3`) VALUES
(@BP_ENTRY, 1907, 0, 0);
UPDATE `creature` SET `MovementType`=0,`spawndist`=0,`equipment_id`=951 WHERE `id`=@BP_ENTRY;
UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=@BP_ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid` = @BP_ENTRY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(@BP_ENTRY, 0, 0, 0, 1, 0, 100, 0, 0, 0, 1800000, 1800000, 11, 13864, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Brother Paxton - Every 30 Minutes - Cast 'Power Word: Fortitude'"),
(@BP_ENTRY, 0, 1, 0, 25, 0, 100, 0, 0, 0, 0, 0, 53, 0, @BP_ENTRY*100, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Brother Paxton - On Reset - Start Waypoint Path"),
(@BP_ENTRY, 0, 2, 3, 40, 0, 15, 0, 0, 0, 0, 0, 54, 10000, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Brother Paxton - Pause Waypoint"),
(@BP_ENTRY, 0, 3, 0, 61, 0, 20, 0, 0, 0, 0, 0, 88, (@BP_ENTRY*100)+0, (@BP_ENTRY*100)+3, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Brother Paxton - Random Timed Action");
DELETE FROM `waypoints` WHERE `entry`=@BP_ENTRY*100;
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `point_comment`) VALUES
(@BP_ENTRY*100, 1, -8829.18, -147.578, 80.4889, 'Brother Paxton Waypoint Path 01'),
(@BP_ENTRY*100, 2, -8822.08, -146.456, 80.877, 'Brother Paxton Waypoint Path 02'),
(@BP_ENTRY*100, 3, -8817.2, -150.924, 81.5878, 'Brother Paxton Waypoint Path 03'),
(@BP_ENTRY*100, 4, -8811.99, -159.78, 81.614, 'Brother Paxton Waypoint Path 04');
DELETE FROM `smart_scripts` WHERE `entryorguid` IN((@BP_ENTRY*100)+0, (@BP_ENTRY*100)+1, (@BP_ENTRY*100)+2, (@BP_ENTRY*100)+3) AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
((@BP_ENTRY*100)+0, 9, 0, 0, 0, 0, 100, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 19, @SI_ENTRY, 10, 0, 0, 0, 0, 0, 'Stormwind Infantry - Yell For Help'),
((@BP_ENTRY*100)+0, 9, 1, 0, 0, 0, 100, 1, 1000, 1000, 0, 0, 66, 0, 0, 0, 0, 0, 0, 19, @SI_ENTRY, 10, 0, 0, 0, 0, 0, 'Brother Paxton - Set Orientation'),
((@BP_ENTRY*100)+0, 9, 2, 0, 0, 0, 100, 1, 2000, 2000, 0, 0, 11, 66097, 0, 0, 0, 0, 0, 19, @SI_ENTRY, 10, 0, 0, 0, 0, 0, 'Brother Paxton - Cast Penance'),
((@BP_ENTRY*100)+0, 9, 3, 0, 0, 0, 100, 1, 1000, 1000, 0, 0, 1, 2, 5000, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Brother Paxton - Say Text'),
((@BP_ENTRY*100)+1, 9, 0, 0, 0, 0, 100, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 19, @SI_ENTRY, 10, 0, 0, 0, 0, 0, 'Stormwind Infantry - Yell For Help'),
((@BP_ENTRY*100)+1, 9, 1, 0, 0, 0, 100, 1, 1000, 1000, 0, 0, 66, 0, 0, 0, 0, 0, 0, 19, @SI_ENTRY, 10, 0, 0, 0, 0, 0, 'Brother Paxton - Set Orientation'),
((@BP_ENTRY*100)+1, 9, 2, 0, 0, 0, 100, 1, 2000, 2000, 0, 0, 11, 38588, 0, 0, 0, 0, 0, 19, @SI_ENTRY, 10, 0, 0, 0, 0, 0, 'Brother Paxton - Cast Flash Heal'),
((@BP_ENTRY*100)+1, 9, 3, 0, 0, 0, 100, 1, 1000, 1000, 0, 0, 1, 2, 5000, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Brother Paxton - Say Text'),
((@BP_ENTRY*100)+2, 9, 0, 0, 0, 0, 100, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 19, @SI_ENTRY, 10, 0, 0, 0, 0, 0, 'Stormwind Infantry - Yell For Help'),
((@BP_ENTRY*100)+2, 9, 1, 0, 0, 0, 100, 1, 1000, 1000, 0, 0, 66, 0, 0, 0, 0, 0, 0, 19, @SI_ENTRY, 10, 0, 0, 0, 0, 0, 'Brother Paxton - Set Orientation'),
((@BP_ENTRY*100)+2, 9, 2, 0, 0, 0, 100, 1, 2000, 2000, 0, 0, 11, 8362, 0, 0, 0, 0, 0, 19, @SI_ENTRY, 10, 0, 0, 0, 0, 0, 'Brother Paxton - Cast Renew'),
((@BP_ENTRY*100)+2, 9, 3, 0, 0, 0, 100, 1, 1000, 1000, 0, 0, 1, 0, 5000, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Brother Paxton - Say Text'),
((@BP_ENTRY*100)+3, 9, 0, 0, 0, 0, 100, 1, 1000, 1000, 0, 0, 11, 93091, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Brother Paxton - Cast AOE Heal'),
((@BP_ENTRY*100)+3, 9, 1, 0, 0, 0, 100, 1, 1000, 1000, 0, 0, 1, 1, 5000, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Brother Paxton - Say Text');

DELETE FROM `creature_text` WHERE `entry` IN (@BP_ENTRY, @SI_ENTRY);
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES
(@BP_ENTRY, 0, 0, 'BY THE LIGHT BE RENEWED!', 12, 0, 100, 0, 0, 0, 'Brother Paxton - Renew Cast Phrase'),
(@BP_ENTRY, 1, 0, 'AND I LAY MY HANDS UPON YOU!', 12, 0, 100, 0, 0, 0, 'Brother Paxton - Renew Cast Phrase'),
(@BP_ENTRY, 1, 1, 'Let the Holy Light embrace you!', 12, 0, 100, 0, 0, 0, 'Brother Paxton - Healing Cast Phrase'),
(@BP_ENTRY, 2, 0, 'Be healed, brother!', 12, 0, 100, 0, 0, 0, 'Brother Paxton - Healing Cast Phrase'),
(@BP_ENTRY, 2, 1, 'FIGHT ON, BROTHER!', 12, 0, 100, 0, 0, 0, 'Brother Paxton - Healing Cast Phrase'),
(@SI_ENTRY, 0, 0, 'HELP!', 12, 0, 100, 0, 0, 0, 'Stormwind Infantry - Call For Heal'),
(@SI_ENTRY, 0, 1, 'I need a heal!', 12, 0, 100, 0, 0, 0, 'Stormwind Infantry - Call For Heal'),
(@SI_ENTRY, 0, 2, 'I could use a heal, brother!', 12, 0, 100, 0, 0, 0, 'Stormwind Infantry - Call For Heal'),
(@SI_ENTRY, 0, 3, 'Make yourself useful and heal me, Paxton!', 12, 0, 100, 0, 0, 0, 'Stormwind Infantry - Call For Heal'),
(@SI_ENTRY, 1, 0, 'Come, monsters! We will crush you!', 14, 0, 15, 0, 0, 0, 'Stormwind Infantry - Yell'),
(@SI_ENTRY, 1, 1, 'I\'ll kill a hundred more of your battle worgs!', 14, 0, 15, 0, 0, 0, 'Stormwind Infantry - Yell'),
(@SI_ENTRY, 1, 2, 'Look alive, men! There are orcs and worgs about!', 14, 0, 15, 0, 0, 0, 'Stormwind Infantry - Yell'),
(@SI_ENTRY, 1, 3, 'Your filthy dogs won\'t be enough!', 14, 0, 15, 0, 0, 0, 'Stormwind Infantry - Yell'),
(@SI_ENTRY, 1, 4, 'Your worgs are no match for the might of Stormwind!', 14, 0, 15, 0, 0, 0, 'Stormwind Infantry - Yell');

DELETE FROM `locales_creature_text` WHERE `entry` IN (@BP_ENTRY, @SI_ENTRY);
INSERT INTO `locales_creature_text` (`entry`, `textGroup`, `id`, `text_loc1`, `text_loc2`, `text_loc3`, `text_loc4`, `text_loc5`, `text_loc6`, `text_loc7`, `text_loc8`, `text_loc9`, `text_loc10`) VALUES
(@BP_ENTRY, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ДА ИСЦЕЛИТ ТЕБЯ СВЕТ!', NULL, NULL),
(@BP_ENTRY, 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'НЫНЕ ВОЗЛАГАЮ НА ТЕБЯ РУКИ!', NULL, NULL),
(@BP_ENTRY, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Да озарит тебя Свет!', NULL, NULL),
(@BP_ENTRY, 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Исцелись, брат!', NULL, NULL),
(@BP_ENTRY, 2, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ВОЗВРАЩАЙСЯ В СТРОЙ, БРАТ!', NULL, NULL),
(@SI_ENTRY, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ПОМОГИ МНЕ!', NULL, NULL),
(@SI_ENTRY, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Излечи меня!', NULL, NULL),
(@SI_ENTRY, 0, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Излечи меня, брат!', NULL, NULL),
(@SI_ENTRY, 0, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Пакстон, приди мне на помощь и исцели меня!', NULL, NULL),
(@SI_ENTRY, 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Идите сюда, чудовища! Мы с вами расправимся!', NULL, NULL),
(@SI_ENTRY, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Я прикончу еще сотню ваших боевых воргов!', NULL, NULL),
(@SI_ENTRY, 1, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Будьте начеку! Поблизости орки и ворги!', NULL, NULL),
(@SI_ENTRY, 1, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Пора вас отправить вслед за вашими грязными псами!', NULL, NULL),
(@SI_ENTRY, 1, 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Ваши ворги бессильны перед военной мощью Штормграда!', NULL, NULL);

UPDATE `creature_template` SET `AIName`="" WHERE `entry`=@SIS_ENTRY;
UPDATE `creature` SET `curhealth`=1 WHERE `id`=@SIS_ENTRY;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@SIS_ENTRY AND `source_type`=0;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@SIS_ENTRY*100 AND `source_type`=9;
DELETE FROM `npc_spellclick_spells` WHERE `npc_entry`=@SIS_ENTRY;
INSERT INTO `npc_spellclick_spells` (`npc_entry`, `spell_id`, `cast_flags`, `user_type`) VALUES
(@SIS_ENTRY, 93072, 1, 0),
(@SIS_ENTRY, 93097, 0, 0);

UPDATE `creature_template` SET `scriptname`="npc_blackrock_battle_worg" WHERE `entry`=@BBW_ENTRY;
UPDATE `creature` SET `MovementType`=1,`spawndist`=15 WHERE `id`=@GA_ENTRY;
DELETE FROM `creature_template_addon` WHERE `entry` IN (@LN_ENTRY, @SAR_ENTRY, @MMCB_ENTRY, @WOLF_ENTRY_1, @WOLF_ENTRY_2);
INSERT INTO `creature_template_addon` (`entry`,`bytes1`,`bytes2`,`emote`) VALUES
(@LN_ENTRY, 5, 1, 426),
(@SAR_ENTRY, 5, 1, 483),
(@MMCB_ENTRY, 0, 1, 483),
(@WOLF_ENTRY_1, 3, 1, 0),
(@WOLF_ENTRY_2, 1, 1, 0);
UPDATE `creature` SET `position_z`=99.0125 WHERE `id`=@LN_ENTRY;
DELETE FROM `creature` WHERE `guid` IN (11598411, 11598412, 11598413, 11598414, 11598415, 11598416, 11598417, 11598418, 11598419, 11598420);
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `unit_flags2`, `dynamicflags`, `isActive`, `protec_anti_doublet`) VALUES
(11598411, 42059, 0, 6170, 9, 1, 1, 0, 0, -8938.35, -132.975, 82.2191, 5.42745, 500, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, NULL),
(11598412, 42059, 0, 6170, 9, 1, 1, 0, 0, -8939.87, -134.071, 82.2103, 5.39211, 500, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, NULL),
(11598413, 42059, 0, 6170, 9, 1, 1, 0, 0, -8941.13, -132.506, 82.2646, 5.39211, 500, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, NULL),
(11598414, 42059, 0, 6170, 9, 1, 1, 0, 0, -8939.73, -131.37, 82.3038, 5.39211, 500, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, NULL),
(11598415, 42059, 0, 6170, 9, 1, 1, 0, 0, -8941.22, -129.797, 82.4094, 5.56489, 500, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, NULL),
(11598416, 42059, 0, 6170, 9, 1, 1, 0, 0, -8942.53, -131.052, 82.4063, 5.46672, 500, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, NULL),
(11598417, 42094, 0, 6170, 9, 1, 1, 0, 1, -8971.18, -155.411, 81.5028, 3.86227, 500, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, NULL),
(11598418, 42094, 0, 6170, 9, 1, 1, 0, 1, -8964.33, -155.348, 81.5031, 5.61438, 500, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, NULL),
(11598419, 42094, 0, 6170, 9, 1, 1, 0, 1, -8968.87, -148.46, 81.5031, 1.51785, 500, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, NULL),
(11598420, 42094, 0, 6170, 9, 1, 1, 0, 1, -8971.34, -150.209, 81.5028, 2.50353, 500, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, NULL);

UPDATE `creature_template` SET `AIName`="SmartAI" WHERE `entry`=42094;
DELETE FROM `smart_scripts` WHERE (`entryorguid`=42094 AND `source_type`=0);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(42094, 0, 0, 0, 1, 0, 100, 0, 1500, 5300, 1000, 4900, 10, 51, 45, 36, 54, 60, 43, 1, 0, 0, 0, 0, 0, 0, 0, "Stormwind Recruit - OOC - Play Random Emote");
DELETE FROM `creature_equip_template` WHERE `entry`=42094;
INSERT INTO `creature_equip_template` (`entry`, `itemEntry1`, `itemEntry2`, `itemEntry3`) VALUES
(42094, 1899, 143, 2551);

DELETE FROM `creature_equip_template` WHERE `entry`=42938;
INSERT INTO `creature_equip_template` (`entry`, `itemEntry1`, `itemEntry2`, `itemEntry3`) VALUES
(42938, 56117, 0, 0);
UPDATE `creature` SET `equipment_id`=42938 WHERE `id`=42938;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@H_ENTRY AND `source_type`=0;
DELETE FROM `creature_text` WHERE `entry`=@H_ENTRY;
UPDATE `creature_template` SET `AIName`="", `scriptname`="npc_hogger" WHERE `entry`=@H_ENTRY;
