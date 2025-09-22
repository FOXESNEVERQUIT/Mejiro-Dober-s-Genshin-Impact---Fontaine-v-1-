--==========================================================================================================================
-- ART DEFINES
--==========================================================================================================================	
-- IconTextureAtlases
------------------------------
INSERT INTO IconTextureAtlases 
			(Atlas, 								IconSize,				Filename, 			IconsPerRow, 	IconsPerColumn)
VALUES		('FURINA_ATLAS', 					256, 	'FurinaAtlas256.dds',		4, 				1),
				('FURINA_ATLAS', 					128, 	'FurinaAtlas128.dds',		4, 				1),
				('FURINA_ATLAS', 					80, 		'FurinaAtlas80.dds',			4, 				1),
				('FURINA_ATLAS', 					64, 		'FurinaAtlas64.dds',			4, 				1),
				('FURINA_ATLAS', 					45, 		'FurinaAtlas45.dds',			4, 				1),
				('FURINA_ATLAS', 					32, 		'FurinaAtlas32.dds',			4, 				1),
				('FURINA_ALPHA_ATLAS', 		128, 	'FurinaAlpha128.dds',		1, 				1),
				('FURINA_ALPHA_ATLAS', 		80, 		'FurinaAlpha80.dds',			1, 				1),
				('FURINA_ALPHA_ATLAS', 		64, 		'FurinaAlpha64.dds',			1, 				1),
				('FURINA_ALPHA_ATLAS', 		48, 		'FurinaAlpha48.dds',			1, 				1),
				('FURINA_ALPHA_ATLAS', 		45, 		'FurinaAlpha45.dds',			1, 				1),
				('FURINA_ALPHA_ATLAS', 		32, 		'FurinaAlpha32.dds',			1, 				1),
				('FURINA_ALPHA_ATLAS', 		24, 		'FurinaAlpha24.dds',			1, 				1),
				('FURINA_ALPHA_ATLAS', 		16, 		'FurinaAlpha16.dds',			1, 				1);

------------------------------
-- Colors
------------------------------		
INSERT INTO Colors 
		(Type, 												Red, 	Green, Blue, 	Alpha)
VALUES	('COLOR_PLAYER_FURINA_ICON', 			1,	1,	1, 	1),
			('COLOR_PLAYER_FURINA_BACKGROUND', 	0.2862, 	0.4039, 	0.8823, 	1);
------------------------------
-- PlayerColors
------------------------------				
INSERT INTO PlayerColors 
		(Type, 							PrimaryColor, 						SecondaryColor, 						TextColor)
VALUES	('PLAYERCOLOR_FURINA', 	'COLOR_PLAYER_FURINA_ICON',	'COLOR_PLAYER_FURINA_BACKGROUND',	'COLOR_PLAYER_WHITE_TEXT');
--==========================================================================================================================
-- AUDIO
--==========================================================================================================================	
-- Audio_Sounds
------------------------------

INSERT INTO Audio_Sounds 
		(SoundID, 								Filename, 			LoadType)
VALUES	('SND_DOM_SPEECH_FURINA',			'FurinaSoundTrack', 	'DynamicResident'),
			('SND_LEADER_MUSIC_FURINA_PEACE',		'FurinaSoundTrackPeace', 	'Streamed'),	
			('SND_LEADER_MUSIC_FURINA_WAR',		'FurinaSoundTrackWar', 	'Streamed'),
			('SND_FURINA_ARKHE',			'FurinaArkheAusia1', 	'DynamicResident'),
			('SND_FURINA_ARKHE_2',			'FurinaArkheAusia2', 	'DynamicResident'),
			('SND_FURINA_ARKHE_3',			'FurinaArkheAusia3', 	'DynamicResident'),
			('SND_FURINA_ARKHE_4',			'FurinaArkhePneuma1', 	'DynamicResident'),
			('SND_FURINA_ARKHE_5',			'FurinaArkhePneuma2', 	'DynamicResident'),
			('SND_FURINA_ARKHE_6',			'FurinaArkhePneuma3', 	'DynamicResident'),
			('SND_BIRTH_FURINA',			'FurinaArkheAusia1',		'DynamicResident'),
			('SND_SELECT_FURINA',			'FurinaArkhePneuma1',		'DynamicResident');
------------------------------
-- Audio_2DSounds
------------------------------	
INSERT INTO Audio_2DSounds 
			(ScriptID, 															SoundID, 								SoundType, 	MinVolume, 	MaxVolume,	IsMusic)
VALUES	('AS2D_DOM_SPEECH_FURINA', 				'SND_DOM_SPEECH_FURINA', 				'GAME_SPEECH',		60, 			60, 			0),
			('AS2D_LEADER_MUSIC_FURINA_PEACE',			'SND_LEADER_MUSIC_FURINA_PEACE',			'GAME_MUSIC',		60, 			60, 			1),
			('AS2D_LEADER_MUSIC_FURINA_WAR', 				'SND_LEADER_MUSIC_FURINA_WAR',				'GAME_MUSIC', 		60, 			60, 			1),
			('AS2D_FURINA_ARKHE',				'SND_FURINA_ARKHE',				'GAME_SFX',			45,				45,				0),
			('AS2D_FURINA_ARKHE_2',				'SND_FURINA_ARKHE_2',				'GAME_SFX',			45,				45,				0),
			('AS2D_FURINA_ARKHE_3',				'SND_FURINA_ARKHE_3',				'GAME_SFX',			45,				45,				0),
			('AS2D_FURINA_ARKHE_4',				'SND_FURINA_ARKHE_4',				'GAME_SFX',			45,				45,				0),
			('AS2D_FURINA_ARKHE_5',				'SND_FURINA_ARKHE_5',				'GAME_SFX',			45,				45,				0),
			('AS2D_FURINA_ARKHE_6',				'SND_FURINA_ARKHE_6',				'GAME_SFX',			45,				45,				0),
			('AS2D_SELECT_FURINA',					'SND_SELECT_FURINA',					'GAME_SFX',			45,				45,				0),
			('AS2D_BIRTH_FURINA',					'SND_BIRTH_FURINA',					'GAME_SFX',			45,				45,				0);

-- IconTextureAtlases
------------------------------
INSERT INTO IconTextureAtlases 
			(Atlas, 								IconSize,				Filename, 			IconsPerRow, 	IconsPerColumn)
VALUES		('NEUVILLETTE_ATLAS', 					256, 	'NeuvilletteAtlas256.dds',			4, 				1),
				('NEUVILLETTE_ATLAS', 					128, 	'NeuvilletteAtlas128.dds',			4, 				1),
				('NEUVILLETTE_ATLAS', 					80, 		'NeuvilletteAtlas80.dds',			4, 				1),
				('NEUVILLETTE_ATLAS', 					64, 		'NeuvilletteAtlas64.dds',			4, 				1),
				('NEUVILLETTE_ATLAS', 					45, 		'NeuvilletteAtlas45.dds',			4, 				1),
				('NEUVILLETTE_ATLAS', 					32, 		'NeuvilletteAtlas32.dds',			4, 				1),
				('NEUVILLETTE_ALPHA_ATLAS', 		128, 	'NeuvilletteAlpha128.dds',			1, 				1),
				('NEUVILLETTE_ALPHA_ATLAS', 		80, 		'NeuvilletteAlpha80.dds',			1, 				1),
				('NEUVILLETTE_ALPHA_ATLAS', 		64, 		'NeuvilletteAlpha64.dds',			1, 				1),
				('NEUVILLETTE_ALPHA_ATLAS', 		48, 		'NeuvilletteAlpha48.dds',			1, 				1),
				('NEUVILLETTE_ALPHA_ATLAS', 		45, 		'NeuvilletteAlpha45.dds',			1, 				1),
				('NEUVILLETTE_ALPHA_ATLAS', 		32, 		'NeuvilletteAlpha32.dds',			1, 				1),
				('NEUVILLETTE_ALPHA_ATLAS', 		24, 		'NeuvilletteAlpha24.dds',			1, 				1),
				('NEUVILLETTE_ALPHA_ATLAS', 		16, 		'NeuvilletteAlpha16.dds',			1, 				1);

------------------------------
-- Colors
------------------------------		
INSERT INTO Colors 
		(Type, 												Red, 	Green, Blue, 	Alpha)
VALUES	('COLOR_PLAYER_NEUVILLETTE_ICON', 			1,	1,	1, 	1),
			('COLOR_PLAYER_NEUVILLETTE_BACKGROUND', 	0.18, 	0.419, 	0.839, 	1);
------------------------------
-- PlayerColors
------------------------------				
INSERT INTO PlayerColors 
		(Type, 							PrimaryColor, 						SecondaryColor, 						TextColor)
VALUES	('PLAYERCOLOR_NEUVILLETTE', 	'COLOR_PLAYER_NEUVILLETTE_ICON',	'COLOR_PLAYER_NEUVILLETTE_BACKGROUND',	'COLOR_PLAYER_WHITE_TEXT');
--==========================================================================================================================
-- AUDIO
--==========================================================================================================================	
-- Audio_Sounds
------------------------------

INSERT INTO Audio_Sounds 
		(SoundID, 								Filename, 			LoadType)
VALUES	('SND_DOM_SPEECH_NEUVILLETTE',			'NeuvilletteSoundTrack', 	'DynamicResident'),
			('SND_LEADER_MUSIC_NEUVILLETTE_PEACE',		'NeuvilletteSoundTrackPeace', 	'Streamed'),	
			('SND_LEADER_MUSIC_NEUVILLETTE_WAR',		'NeuvilletteSoundTrackWar', 	'Streamed'),
			('SND_NEUVILLETTE_JUDGMENT',			'NeuvilletteJudgment', 	'DynamicResident');
------------------------------
-- Audio_2DSounds
------------------------------	
INSERT INTO Audio_2DSounds 
			(ScriptID, 															SoundID, 								SoundType, 	MinVolume, 	MaxVolume,	IsMusic)
VALUES	('AS2D_DOM_SPEECH_NEUVILLETTE', 				'SND_DOM_SPEECH_NEUVILLETTE', 				'GAME_SPEECH',		60, 			60, 			0),
			('AS2D_NEUVILLETTE_JUDGMENT',				'SND_NEUVILLETTE_JUDGMENT',				'GAME_SFX',			45,				45,				0),
			('AS2D_LEADER_MUSIC_NEUVILLETTE_PEACE',			'SND_LEADER_MUSIC_NEUVILLETTE_PEACE',			'GAME_MUSIC',		60, 			60, 			1),
			('AS2D_LEADER_MUSIC_NEUVILLETTE_WAR', 				'SND_LEADER_MUSIC_NEUVILLETTE_WAR',				'GAME_MUSIC', 		60, 			60, 			1);