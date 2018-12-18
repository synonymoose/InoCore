DELETE FROM `game_event_gameobject` WHERE `guid` IN
(213432, 213435, 213373, 213370, 213429, 213431, 213372, 213374,
 197155, 213376, 213371, 213369);
INSERT INTO `game_event_gameobject` (`eventEntry`, `guid`) VALUES
(1, 213432), (1, 213435), (1, 213373), (1, 213370),
(1, 213429), (1, 213431), (1, 213372), (1, 213374),
(1, 197155), (1, 213376), (1, 213371), (1, 213369);
DELETE FROM `creature_addon` WHERE `guid` = 400136;
DELETE FROM `creature_template_addon` WHERE `entry` = 54334;
INSERT INTO `creature_template_addon` (`entry`,`bytes1`,`bytes2`,`emote`) VALUES
(54334, 0, 1, 483);
DELETE FROM `game_event_gameobject` WHERE `guid` IN
(46505, 46502, 46503, 46498, 46497, 46444, 46399, 46517);
INSERT INTO `game_event_gameobject` (`eventEntry`, `guid`) VALUES
(75, 46505), (75, 46502), (75, 46503), (75, 46498),
(75, 46497), (75, 46444), (75, 46399), (75, 46517);
