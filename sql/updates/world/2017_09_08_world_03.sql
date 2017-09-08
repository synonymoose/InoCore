SET @BP_ENTRY   = 951;
SET @SI_ENTRY   = 49869;
SET @BBW_ENTRY  = 49871;
SET @MMCB_ENTRY = 197;
SET @SIS_ENTRY  = 50047;
SET @GA_ENTRY   = 50039;
SET @H_ENTRY    = 448;
SET @LN_ENTRY   = 61837;

DELETE FROM `creature_equip_template` WHERE `entry`=@BP_ENTRY;
INSERT INTO `creature_equip_template` (`entry`, `id`, `itemEntry1`, `itemEntry2`, `itemEntry3`) VALUES
(@BP_ENTRY, 1, 1907, 0, 0);
UPDATE `creature` SET `MovementType`=0,`spawndist`=0,`equipment_id`=1 WHERE `id`=@BP_ENTRY;
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

UPDATE `creature` SET `MovementType`=1,`unit_flags`=770 WHERE `guid` IN (18270, 18267, 18263, 18281, 18277, 18261, 18262, 18211, 18202, 18193, 18180, 18169, 18154, 18156, 18152);
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
DELETE FROM `creature_template_addon` WHERE `entry` IN (@LN_ENTRY, @MMCB_ENTRY);
INSERT INTO `creature_template_addon` (`entry`,`bytes1`,`bytes2`,`emote`) VALUES
(@LN_ENTRY, 5, 1, 426),
(@MMCB_ENTRY, 0, 1, 483);
UPDATE `creature` SET `position_z`=99.0125 WHERE `id`=@LN_ENTRY;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@H_ENTRY AND `source_type`=0;
DELETE FROM `creature_text` WHERE `entry`=@H_ENTRY;
UPDATE `creature_template` SET `AIName`="", `scriptname`="npc_hogger" WHERE `entry`=@H_ENTRY;
