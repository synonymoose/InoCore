SET @SI_ENTRY = 49869;
SET @BBW_ENTRY = 49871;
SET @SIS_ENTRY = 50047;

DELETE FROM `creature_text` WHERE `entry` IN (@SI_ENTRY);
INSERT INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES
(@SI_ENTRY, 1, 0, 'Come, monsters! We will crush you!', 14, 0, 15, 0, 0, 0, 'Stormwind Infantry - Yell'),
(@SI_ENTRY, 1, 1, 'I\'ll kill a hundred more of your battle worgs!', 14, 0, 15, 0, 0, 0, 'Stormwind Infantry - Yell'),
(@SI_ENTRY, 1, 2, 'Look alive, men! There are orcs and worgs about!', 14, 0, 15, 0, 0, 0, 'Stormwind Infantry - Yell'),
(@SI_ENTRY, 1, 3, 'Your filthy dogs won\'t be enough!', 14, 0, 15, 0, 0, 0, 'Stormwind Infantry - Yell'),
(@SI_ENTRY, 1, 4, 'Your worgs are no match for the might of Stormwind!', 14, 0, 15, 0, 0, 0, 'Stormwind Infantry - Yell');

DELETE FROM `locales_creature_text` WHERE `entry` IN (@SI_ENTRY);
INSERT INTO `locales_creature_text` (`entry`, `textGroup`, `id`, `text_loc1`, `text_loc2`, `text_loc3`, `text_loc4`, `text_loc5`, `text_loc6`, `text_loc7`, `text_loc8`, `text_loc9`, `text_loc10`) VALUES
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
