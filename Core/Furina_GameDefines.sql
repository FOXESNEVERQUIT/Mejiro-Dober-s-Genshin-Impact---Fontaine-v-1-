--=======================================================================================================================
-- BUILDINGCLASSES
--=======================================================================================================================
-- BuildingClasses
------------------------------	

--------------------------------
-- Buildings
--------------------------------	
INSERT INTO Buildings 	
			(Type, 							BuildingClass, 	Cost,	GoldMaintenance,	PrereqTech,	Help,	Description,	Civilopedia,	Strategy,
			ArtDefineTag,	MinAreaSize,		ThemingBonusHelp,										GreatWorkSlotType,		GreatWorkCount,	SpecialistType,	SpecialistCount,	ConquestProb,	IconAtlas,		PortraitIndex,		HurryCostModifier)
SELECT	'BUILDING_FURINA',	BuildingClass,	Cost,	GoldMaintenance,	PrereqTech,	'TXT_KEY_BUILDING_FURINA_HELP',	'TXT_KEY_BUILDING_FURINA_DESC',	'TXT_KEY_CIV5_BUILDINGS_FURINA_PEDIA',	'TXT_KEY_BUILDING_FURINA_STRATEGY',
			ArtDefineTag,	MinAreaSize,		'TXT_KEY_FURINA_THEMING_BONUS_HELP',	GreatWorkSlotType,				2,				'SPECIALIST_MUSICIAN',	2,				ConquestProb,	'FURINA_ATLAS',		3,		HurryCostModifier
FROM Buildings WHERE Type = 'BUILDING_OPERA_HOUSE';

------------------------------	
-- Building_Flavors
------------------------------	
INSERT INTO Building_Flavors 	
			(BuildingType, 					FlavorType,	Flavor)
SELECT	'BUILDING_FURINA', 	FlavorType,	Flavor
FROM Building_Flavors WHERE BuildingType = 'BUILDING_OPERA_HOUSE';

--------------------------------
-- Building_ClassesNeededInCity
--------------------------------	
INSERT INTO Building_ClassesNeededInCity 	
			(BuildingType, 					BuildingClassType)
SELECT	'BUILDING_FURINA', 	BuildingClassType
FROM Building_ClassesNeededInCity WHERE BuildingType = 'BUILDING_OPERA_HOUSE';
--------------------------------
-- Building_PrereqBuildingClasses
--------------------------------	

------------------------------	
-- Building_YieldChanges
------------------------------	
INSERT INTO Building_YieldChanges 	
			(BuildingType, 					YieldType,		Yield)
SELECT	'BUILDING_FURINA', 	YieldType,		Yield
FROM Building_YieldChanges WHERE BuildingType = 'BUILDING_OPERA_HOUSE';

------------------------------	
-- Building_ThemingBonuses
------------------------------	
INSERT INTO Building_ThemingBonuses 	
			(BuildingType, 						Description, 			Bonus,	SameEra,	RequiresSamePlayer,	AIPriority)
VALUES	('BUILDING_FURINA',	'TXT_KEY_THEMING_BONUS_FURINA',	 2,	1,	1,	3);
--==========================================================================================================================
-- PROMOTIONS
--==========================================================================================================================	
-- UnitPromotions
--------------------------------	
INSERT INTO UnitPromotions 
				(Type, 													Description, 										Help, 							Sound, 					CannotBeChosen,		CombatPercent,		PortraitIndex,		IconAtlas, 			PediaType, 			PediaEntry)
VALUES	('PROMOTION_FURINA', 	'TXT_KEY_PROMOTION_FURINA', 'TXT_KEY_PROMOTION_FURINA_HELP', 'AS2D_IF_LEVELUP',			1,							25,						59,			'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_FURINA');

INSERT INTO UnitPromotions 
				(Type, 													Description, 										Help, 							Sound, 					CannotBeChosen,		CombatPercent,		PortraitIndex,		IconAtlas, 			PediaType, 			PediaEntry)
VALUES	('PROMOTION_FURINA_DUMMY', 	'TXT_KEY_PROMOTION_FURINA_DUMMY', 'TXT_KEY_PROMOTION_FURINA_DUMMY_HELP', 'AS2D_IF_LEVELUP',			1,							25,						59,			'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_FURINA_DUMMY');
------------------------------	
-- UnitPromotions_UnitCombatMods
------------------------------	
------------------------------	
-- UnitPromotions_UnitCombats
------------------------------	

--==========================================================================================================================	
-- UNITS
--==========================================================================================================================
-- UnitClasses
--------------------------------	
INSERT INTO UnitClasses
			(Type, 									Description,		DefaultUnit)
VALUES	('UNITCLASS_FURINA',	'TXT_KEY_UNIT_FURINA',	null),
			('UNITCLASS_FURINA_DUMMY',	'TXT_KEY_UNIT_FURINA_DUMMY',	'UNIT_FURINA_DUMMY');
--------------------------------	
-- Units
--------------------------------	
INSERT INTO Units 	
		(Type,												Class,		Cost,	Moves,	CivilianAttackPriority,	Special,	Domain, DefaultUnitAI,	 Description, 								Civilopedia, 													Help, 									Strategy,							
		WorkRate,	CombatLimit,	HurryCostModifier,	BaseCultureTurnsToCount,	OneShotTourism,	OneShotTourismPercentOthers,	UnitArtInfoEraVariation,	AdvancedStartCost, DontShowYields,	UnitArtInfo, 	UnitFlagIconOffset,	UnitFlagAtlas, PortraitIndex, 	IconAtlas,	MoveRate)
SELECT	'UNIT_FURINA',	'UNITCLASS_FURINA',		Cost,	Moves,	CivilianAttackPriority,	Special,	Domain, DefaultUnitAI, 'TXT_KEY_UNIT_FURINA', 	'TXT_KEY_CIVILOPEDIA_UNITS_FURINA_TEXT', 	'TXT_KEY_UNIT_FURINA_HELP', 	'TXT_KEY_UNIT_FURINA_STRATEGY',			
		WorkRate,	CombatLimit,	HurryCostModifier,							4,									5,			OneShotTourismPercentOthers,				0,				AdvancedStartCost, DontShowYields,	'ART_DEF_UNIT_FURINA',	UnitFlagIconOffset,	UnitFlagAtlas,		2, 	'FURINA_ATLAS',	MoveRate
FROM Units WHERE Type = 'UNIT_MUSICIAN';

INSERT INTO Units 	
			(Type,																	Class,								Cost,	Moves,	Domain, DefaultUnitAI,	 Description, 								Civilopedia, 																	Strategy,							
			WorkRate,	CombatLimit,	OneShotTourism,	OneShotTourismPercentOthers,		AdvancedStartCost, 	UnitArtInfo, 	UnitFlagIconOffset,	UnitFlagAtlas, PortraitIndex, 	IconAtlas)
VALUES	('UNIT_FURINA_DUMMY',	'UNITCLASS_FURINA_DUMMY',		-1,		2,		'DOMAIN_LAND', 'UNITAI_MUSICIAN', 'TXT_KEY_UNIT_FURINA_DUMMY', 	'TXT_KEY_CIVILOPEDIA_UNITS_FURINA_DUMMY', 	'TXT_KEY_UNIT_FURINA_DUMMY_STRATEGY',			
				-1,					0,					1,								0,								-1,					'ART_DEF_UNIT_GREAT_MUSICIAN',	7,	'EXPANSION2_UNIT_FLAG_ATLAS',		2, 	'FURINA_ATLAS');
------------------------------
-- UnitGameplay2DScripts
------------------------------	
INSERT INTO UnitGameplay2DScripts 	
		(UnitType, 			SelectionSound, FirstSelectionSound)
VALUES	('UNIT_FURINA', 	'AS2D_SELECT_FURINA', 'AS2D_BIRTH_FURINA');
--------------------------------
-- Unit_AITypes
--------------------------------	
INSERT INTO Unit_AITypes 	
				(UnitType, 			UnitAIType)
SELECT	'UNIT_FURINA',	UnitAIType
FROM Unit_AITypes WHERE UnitType = 'UNIT_MUSICIAN';
--------------------------------
-- Unit_Flavors
--------------------------------
INSERT INTO Unit_Flavors 	
				(UnitType, 			FlavorType,	Flavor)
SELECT	'UNIT_FURINA',	FlavorType,	Flavor
FROM Unit_Flavors WHERE UnitType = 'UNIT_MUSICIAN';
--------------------------------
-- Unit_ClassUpgrades
--------------------------------

--------------------------------
-- Unit_FreePromotions
--------------------------------
INSERT INTO Unit_FreePromotions 	
				(UnitType, 			PromotionType)
SELECT	'UNIT_FURINA',	PromotionType
FROM Unit_FreePromotions WHERE UnitType = 'UNIT_MUSICIAN';
--------------------------------
-- Unit_Builds
--------------------------------

--------------------------------
-- Unit_UniqueNames
--------------------------------

--==========================================================================================================================	
-- LEADERS
--==========================================================================================================================	
-- Leaders
--------------------------------			
INSERT INTO Leaders 
		(Type, 					Description, 					Civilopedia, 						CivilopediaTag, 							ArtDefineTag, 		
		VictoryCompetitiveness,	WonderCompetitiveness, 	MinorCivCompetitiveness, WorkAgainstWillingness,	Boldness, 	DiploBalance, 	WarmongerHate, 	DenounceWillingness, 	DoFWillingness,	Loyalty, 		Neediness, 	Forgiveness, 	Chattiness, Meanness, 	IconAtlas, 				PortraitIndex)
VALUES	('LEADER_FURINA', 	'TXT_KEY_LEADER_FURINA', 	'TXT_KEY_LEADER_FURINA_PEDIA', 	'TXT_KEY_CIVILOPEDIA_LEADERS_FURINA', 	'Furina_Scene.xml',	
			10,											8,										9, 									3,								6, 				9, 					9, 						7, 									9, 				10, 					2, 				7, 				5, 				1, 		'FURINA_ATLAS',				1);
--------------------------------
-- Leader_MajorCivApproachBiases
--------------------------------					
INSERT INTO Leader_MajorCivApproachBiases 
		(LeaderType, 			MajorCivApproachType, 				Bias)
VALUES	('LEADER_FURINA', 	'MAJOR_CIV_APPROACH_WAR', 			2),
		('LEADER_FURINA', 	'MAJOR_CIV_APPROACH_HOSTILE', 		2),
		('LEADER_FURINA', 	'MAJOR_CIV_APPROACH_DECEPTIVE', 2),
		('LEADER_FURINA', 	'MAJOR_CIV_APPROACH_GUARDED', 		3),
		('LEADER_FURINA', 	'MAJOR_CIV_APPROACH_AFRAID', 		3),
		('LEADER_FURINA', 	'MAJOR_CIV_APPROACH_FRIENDLY', 		5),
		('LEADER_FURINA', 	'MAJOR_CIV_APPROACH_NEUTRAL', 		9);
--------------------------------
-- Leader_MajorCivApproachBiases
--------------------------------					
INSERT INTO Leader_MinorCivApproachBiases 
		(LeaderType, 			MinorCivApproachType, 				Bias)
VALUES	('LEADER_FURINA', 	'MINOR_CIV_APPROACH_IGNORE', 		1),
		('LEADER_FURINA', 	'MINOR_CIV_APPROACH_FRIENDLY', 		9),
		('LEADER_FURINA', 	'MINOR_CIV_APPROACH_PROTECTIVE', 	6),
		('LEADER_FURINA', 	'MINOR_CIV_APPROACH_CONQUEST', 		1),
		('LEADER_FURINA', 	'MINOR_CIV_APPROACH_BULLY', 		1);
--------------------------------
-- Leader_Flavors
--------------------------------					
INSERT INTO Leader_Flavors 
		(LeaderType, 			FlavorType, 						Flavor)
VALUES	('LEADER_FURINA', 	'FLAVOR_OFFENSE', 					5),
		('LEADER_FURINA', 	'FLAVOR_DEFENSE', 					5),
		('LEADER_FURINA', 	'FLAVOR_CITY_DEFENSE', 				5),
		('LEADER_FURINA', 	'FLAVOR_MILITARY_TRAINING', 		4),
		('LEADER_FURINA', 	'FLAVOR_RECON', 					6),
		('LEADER_FURINA', 	'FLAVOR_RANGED', 					5),
		('LEADER_FURINA', 	'FLAVOR_MOBILE', 					4),
		('LEADER_FURINA', 	'FLAVOR_NAVAL', 					8),
		('LEADER_FURINA', 	'FLAVOR_NAVAL_RECON', 				7),
		('LEADER_FURINA', 	'FLAVOR_NAVAL_GROWTH', 				8),
		('LEADER_FURINA', 	'FLAVOR_NAVAL_TILE_IMPROVEMENT', 	8),
		('LEADER_FURINA', 	'FLAVOR_AIR', 						5),
		('LEADER_FURINA', 	'FLAVOR_EXPANSION', 				7),
		('LEADER_FURINA', 	'FLAVOR_GROWTH', 					7),
		('LEADER_FURINA', 	'FLAVOR_TILE_IMPROVEMENT', 			6),
		('LEADER_FURINA', 	'FLAVOR_INFRASTRUCTURE', 			8),
		('LEADER_FURINA', 	'FLAVOR_PRODUCTION', 				6),
		('LEADER_FURINA', 	'FLAVOR_GOLD', 						6),
		('LEADER_FURINA', 	'FLAVOR_SCIENCE', 					5),
		('LEADER_FURINA', 	'FLAVOR_CULTURE', 					10),
		('LEADER_FURINA', 	'FLAVOR_HAPPINESS', 				9),
		('LEADER_FURINA', 	'FLAVOR_GREAT_PEOPLE', 				9),
		('LEADER_FURINA', 	'FLAVOR_WONDER', 					9),
		('LEADER_FURINA', 	'FLAVOR_RELIGION', 					3),
		('LEADER_FURINA', 	'FLAVOR_DIPLOMACY', 				8),
		('LEADER_FURINA', 	'FLAVOR_SPACESHIP', 				4),
		('LEADER_FURINA', 	'FLAVOR_WATER_CONNECTION', 			9),
		('LEADER_FURINA', 	'FLAVOR_NUKE', 						4),
		('LEADER_FURINA', 	'FLAVOR_USE_NUKE', 					4),
		('LEADER_FURINA', 	'FLAVOR_ESPIONAGE', 				7),
		('LEADER_FURINA', 	'FLAVOR_AIRLIFT', 					5),
		('LEADER_FURINA', 	'FLAVOR_I_TRADE_DESTINATION', 		5),
		('LEADER_FURINA', 	'FLAVOR_I_TRADE_ORIGIN', 			5),
		('LEADER_FURINA', 	'FLAVOR_I_SEA_TRADE_ROUTE', 		5),
		('LEADER_FURINA', 	'FLAVOR_I_LAND_TRADE_ROUTE', 		5),
		('LEADER_FURINA', 	'FLAVOR_ARCHAEOLOGY', 				5),
		('LEADER_FURINA', 	'FLAVOR_AIR_CARRIER', 				5);
--------------------------------
-- Leader_Traits
--------------------------------					
INSERT INTO Leader_Traits 
		(LeaderType, 			TraitType)
VALUES	('LEADER_FURINA', 	'TRAIT_FURINA');
--==========================================================================================================================	
-- TRAITS
--==========================================================================================================================	
-- Traits
--------------------------------	
INSERT INTO Traits 
			(Type, 					Description, 					ShortDescription	)
VALUES	('TRAIT_FURINA', 	'TXT_KEY_TRAIT_FURINA', 	'TXT_KEY_TRAIT_FURINA_SHORT');

--==========================================================================================================================	
-- CIVILIZATIONS
--==========================================================================================================================	
-- Civilizations
--------------------------------			
INSERT INTO Civilizations 	
			(Type, 									Description, 								ShortDescription, 										Adjective, 							CivilopediaTag, 				DefaultPlayerColor, 		ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix,		 IconAtlas, 			AlphaIconAtlas, 			PortraitIndex,		SoundtrackTag, 	MapImage, 				DawnOfManQuote, 		DawnOfManAudio, 			DawnOfManImage)
SELECT	'CIVILIZATION_FURINA', 			'TXT_KEY_CIV_FURINA_DESC', 		'TXT_KEY_CIV_FURINA_SHORT_DESC',					'TXT_KEY_CIV_FURINA_ADJECTIVE',			'TXT_KEY_CIV5_FURINA',		'PLAYERCOLOR_FURINA',		ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, 'FURINA_ATLAS',	'FURINA_ALPHA_ATLAS',				0, 		SoundtrackTag,		'FurinaMap.dds',	'TXT_KEY_CIV5_DOM_FURINA_TEXT', 	'AS2D_DOM_SPEECH_FURINA', 'FurinaLoading.dds'
FROM Civilizations WHERE Type = 'CIVILIZATION_FRANCE';
--------------------------------
-- Civilization_CityNames
--------------------------------		
INSERT INTO Civilization_CityNames 
		(CivilizationType, 				CityName)
VALUES	('CIVILIZATION_FURINA', 	'TXT_KEY_CITY_NAME_FURINA_00'),
			('CIVILIZATION_FURINA', 	'TXT_KEY_CITY_NAME_FURINA_01'),
			('CIVILIZATION_FURINA', 	'TXT_KEY_CITY_NAME_FURINA_02'),
			('CIVILIZATION_FURINA', 	'TXT_KEY_CITY_NAME_FURINA_03'),
			('CIVILIZATION_FURINA', 	'TXT_KEY_CITY_NAME_FURINA_04'),
			('CIVILIZATION_FURINA', 	'TXT_KEY_CITY_NAME_FURINA_05'),
			('CIVILIZATION_FURINA', 	'TXT_KEY_CITY_NAME_FURINA_06'),
			('CIVILIZATION_FURINA', 	'TXT_KEY_CITY_NAME_FURINA_07'),
			('CIVILIZATION_FURINA', 	'TXT_KEY_CITY_NAME_FURINA_08'),
			('CIVILIZATION_FURINA', 	'TXT_KEY_CITY_NAME_FURINA_09'),
			('CIVILIZATION_FURINA', 	'TXT_KEY_CITY_NAME_FURINA_10'),
			('CIVILIZATION_FURINA', 	'TXT_KEY_CITY_NAME_FURINA_11'),
			('CIVILIZATION_FURINA', 	'TXT_KEY_CITY_NAME_FURINA_12'),
			('CIVILIZATION_FURINA', 	'TXT_KEY_CITY_NAME_FURINA_13'),
			('CIVILIZATION_FURINA', 	'TXT_KEY_CITY_NAME_FURINA_14'),
			('CIVILIZATION_FURINA', 	'TXT_KEY_CITY_NAME_FURINA_15'),
			('CIVILIZATION_FURINA', 	'TXT_KEY_CITY_NAME_FURINA_16'),
			('CIVILIZATION_FURINA', 	'TXT_KEY_CITY_NAME_FURINA_17'),
			('CIVILIZATION_FURINA', 	'TXT_KEY_CITY_NAME_FURINA_18');
--------------------------------
-- Civilization_FreeBuildingClasses
--------------------------------		
INSERT INTO Civilization_FreeBuildingClasses 
		(CivilizationType, 				BuildingClassType)
SELECT	'CIVILIZATION_FURINA', 	BuildingClassType
FROM Civilization_FreeBuildingClasses WHERE CivilizationType = 'CIVILIZATION_FRANCE';
--------------------------------
-- Civilization_FreeTechs
--------------------------------	
INSERT INTO Civilization_FreeTechs 
		(CivilizationType, 				TechType)
SELECT	'CIVILIZATION_FURINA', 	TechType
FROM Civilization_FreeTechs WHERE CivilizationType = 'CIVILIZATION_FRANCE';
--------------------------------
-- Civilization_FreeUnits
--------------------------------	
INSERT INTO Civilization_FreeUnits
		(CivilizationType, 				UnitClassType, Count, UnitAIType)
SELECT	'CIVILIZATION_FURINA', 	UnitClassType, Count, UnitAIType
FROM Civilization_FreeUnits WHERE CivilizationType = 'CIVILIZATION_FRANCE';
--------------------------------
-- Civilization_Leaders
--------------------------------		
INSERT INTO Civilization_Leaders
		(CivilizationType, 				LeaderheadType)
VALUES	('CIVILIZATION_FURINA', 	'LEADER_FURINA');
--------------------------------
-- Civilization_BuildingClassOverrides
--------------------------------	
INSERT INTO Civilization_BuildingClassOverrides 
		(CivilizationType, 				BuildingClassType, 				BuildingType)
VALUES	('CIVILIZATION_FURINA', 	'BUILDINGCLASS_OPERA_HOUSE', 	'BUILDING_FURINA');
--------------------------------
-- Civilization_UnitClassOverrides
--------------------------------	
INSERT INTO Civilization_UnitClassOverrides 
		(CivilizationType, 				UnitClassType, 				UnitType)
VALUES	('CIVILIZATION_FURINA', 	'UNITCLASS_FURINA', 	'UNIT_FURINA');
--------------------------------
-- Civilization_Religions
--------------------------------	
INSERT INTO Civilization_Religions
		(CivilizationType, 				ReligionType)
VALUES	('CIVILIZATION_FURINA',	'RELIGION_CHRISTIANITY');
--------------------------------
-- Civilization_SpyNames
--------------------------------	
INSERT INTO Civilization_SpyNames
		(CivilizationType, 				SpyName)
VALUES	('CIVILIZATION_FURINA', 	'TXT_KEY_SPY_NAME_FURINA_0'),	
			('CIVILIZATION_FURINA', 	'TXT_KEY_SPY_NAME_FURINA_1'),
			('CIVILIZATION_FURINA', 	'TXT_KEY_SPY_NAME_FURINA_2'),
			('CIVILIZATION_FURINA', 	'TXT_KEY_SPY_NAME_FURINA_3'),
			('CIVILIZATION_FURINA', 	'TXT_KEY_SPY_NAME_FURINA_4'),
			('CIVILIZATION_FURINA', 	'TXT_KEY_SPY_NAME_FURINA_5'),
			('CIVILIZATION_FURINA', 	'TXT_KEY_SPY_NAME_FURINA_6'),
			('CIVILIZATION_FURINA', 	'TXT_KEY_SPY_NAME_FURINA_7'),
			('CIVILIZATION_FURINA', 	'TXT_KEY_SPY_NAME_FURINA_8'),
			('CIVILIZATION_FURINA', 	'TXT_KEY_SPY_NAME_FURINA_9');
--==========================================================================================================================
-- Civilization_Start_Region_Priority
--==========================================================================================================================	
INSERT INTO Civilization_Start_Region_Avoid
		(CivilizationType, 				RegionType)
VALUES	('CIVILIZATION_FURINA', 	'REGION_DESERT'),
			('CIVILIZATION_FURINA', 	'REGION_TUNDRA'),
			('CIVILIZATION_FURINA', 	'REGION_JUNGLE');
--------------------------------
-- Civilization_Start_Along_Ocean
--------------------------------	
INSERT INTO Civilization_Start_Along_Ocean
		(CivilizationType, 				StartAlongOcean)
VALUES	('CIVILIZATION_FURINA', 	1);

--------------------------------
-- Civilization_Start_Place_First_Along_Ocean
--------------------------------	
INSERT INTO Civilization_Start_Place_First_Along_Ocean
		(CivilizationType, 				PlaceFirst)
VALUES	('CIVILIZATION_FURINA', 	1);
--==========================================================================================================================
--==========================================================================================================================
--==========================================================================================================================
--==========================================================================================================================
---------------------------
-- Policies
---------------------------
--=======================================================================================================================
-- BUILDINGCLASSES
--=======================================================================================================================
-- BuildingClasses
------------------------------	
INSERT INTO BuildingClasses 	
			(Type, 												DefaultBuilding, 										Description)
VALUES	('BUILDINGCLASS_NEUVILLETTE_DUMMY',	'BUILDING_NEUVILLETTE_DUMMY',		'TXT_KEY_NEUVILLETTE_DUMMY_SHORT'),
			('BUILDINGCLASS_NEUVILLETTE_DUMMY_2',	'BUILDING_NEUVILLETTE_DUMMY_2',		'TXT_KEY_NEUVILLETTE_DUMMY_2_SHORT');
--------------------------------
-- Buildings
--------------------------------	
INSERT INTO Buildings 	
			(Type, 												BuildingClass, 			Description,							Cost,		FaithCost,													PrereqTech,	GreatWorkCount,		NeverCapture,		NoOccupiedUnhappiness,	NukeImmune,	IconAtlas,		PortraitIndex)
VALUES	('BUILDING_NEUVILLETTE_DUMMY',	'BUILDINGCLASS_NEUVILLETTE_DUMMY',		'TXT_KEY_NEUVILLETTE_DUMMY_SHORT',		-1,		-1,		null,				-1,							1,							1,									1,			'NEUVILLETTE_ATLAS',		0);

INSERT INTO Buildings 	
			(Type, 												BuildingClass, 			Description,							Cost,		FaithCost,													PrereqTech,	GreatWorkCount,		ConquestProb,			NukeImmune,	IconAtlas,		PortraitIndex)
VALUES	('BUILDING_NEUVILLETTE_DUMMY_2',	'BUILDINGCLASS_NEUVILLETTE_DUMMY_2',		'TXT_KEY_NEUVILLETTE_DUMMY_2_SHORT',		-1,		-1,		null,				-1,							100,								1,			'NEUVILLETTE_ATLAS',		0);
--------------------------------
-- Buildings
--------------------------------	
INSERT INTO Buildings 	
			(Type, 							BuildingClass, 	Cost,	GoldMaintenance,	PrereqTech,	Help,	Description,	Civilopedia,	Strategy,
			ConquestProb,	ArtDefineTag,	HurryCostModifier,		MinAreaSize,		IconAtlas,		PortraitIndex)

SELECT	'BUILDING_NEUVILLETTE',	BuildingClass,	Cost,	2,	PrereqTech,	'TXT_KEY_BUILDING_NEUVILLETTE_HELP',	'TXT_KEY_BUILDING_NEUVILLETTE_DESC',	'TXT_KEY_CIV5_BUILDINGS_NEUVILLETTE_PEDIA',	'TXT_KEY_BUILDING_NEUVILLETTE_STRATEGY',
			ConquestProb,	ArtDefineTag,	HurryCostModifier,		MinAreaSize,		'NEUVILLETTE_ATLAS',	2	
FROM Buildings WHERE Type = 'BUILDING_COURTHOUSE';


INSERT INTO Buildings 	
			(Type, 				BuildingClass, 	Cost,	GoldMaintenance,	PrereqTech,	Help,	Description,	Civilopedia,	Strategy,
			HurryCostModifier,		ArtDefineTag,	EspionageModifier,	Espionage,	NeverCapture,	MinAreaSize,		IconAtlas,		PortraitIndex)

SELECT	'BUILDING_NEUVILLETTE_2',	BuildingClass,	Cost,	GoldMaintenance,	PrereqTech,	'TXT_KEY_BUILDING_NEUVILLETTE_2_HELP',	'TXT_KEY_BUILDING_NEUVILLETTE_2_DESC',	'TXT_KEY_CIV5_BUILDINGS_NEUVILLETTE_2_PEDIA',	'TXT_KEY_BUILDING_NEUVILLETTE_2_STRATEGY',			
			HurryCostModifier,		ArtDefineTag,	-50,	Espionage,	NeverCapture,	MinAreaSize,		'NEUVILLETTE_ATLAS',	3		
FROM Buildings WHERE Type = 'BUILDING_POLICE_STATION';
------------------------------	
-- Building_Flavors
------------------------------	
INSERT INTO Building_Flavors 	
			(BuildingType, 					FlavorType,	Flavor)
SELECT	'BUILDING_NEUVILLETTE', 	FlavorType,	Flavor
FROM Building_Flavors WHERE BuildingType = 'BUILDING_COURTHOUSE';

INSERT INTO Building_Flavors 	
			(BuildingType, 					FlavorType,	Flavor)
SELECT	'BUILDING_NEUVILLETTE_2', 	FlavorType,	Flavor
FROM Building_Flavors WHERE BuildingType = 'BUILDING_POLICE_STATION';
--==========================================================================================================================
-- PROMOTIONS
--==========================================================================================================================	
-- UnitPromotions
--------------------------------	
------------------------------	
-- UnitPromotions_UnitCombatMods
------------------------------	
------------------------------	
-- UnitPromotions_UnitCombats
------------------------------	

--==========================================================================================================================	
-- UNITS
--==========================================================================================================================

--------------------------------	
-- Units
--------------------------------	

------------------------------
-- UnitGameplay2DScripts
------------------------------	

--------------------------------
-- Unit_AITypes
--------------------------------	

--------------------------------
-- Unit_Flavors
--------------------------------

--------------------------------
-- Unit_ClassUpgrades
--------------------------------

--------------------------------
-- Unit_FreePromotions
--------------------------------

--------------------------------
-- Unit_Builds
--------------------------------

--------------------------------
-- Unit_UniqueNames
--------------------------------

--==========================================================================================================================	
-- LEADERS
--==========================================================================================================================	
-- Leaders
--------------------------------			
INSERT INTO Leaders 
		(Type, 					Description, 					Civilopedia, 						CivilopediaTag, 							ArtDefineTag, 		
		VictoryCompetitiveness,	WonderCompetitiveness, 	MinorCivCompetitiveness, WorkAgainstWillingness,	Boldness, 	DiploBalance, 	WarmongerHate, 	DenounceWillingness, 	DoFWillingness,	Loyalty, 		Neediness, 	Forgiveness, 	Chattiness, Meanness, 	IconAtlas, 				PortraitIndex)
VALUES	('LEADER_NEUVILLETTE', 	'TXT_KEY_LEADER_NEUVILLETTE', 	'TXT_KEY_LEADER_NEUVILLETTE_PEDIA', 	'TXT_KEY_CIVILOPEDIA_LEADERS_NEUVILLETTE', 	'Neuvillette_Scene.xml',	
			3,											2,										7, 									3,								9, 				12, 					9, 						5, 									5, 				10, 					2, 				7, 				3, 				1, 		'NEUVILLETTE_ATLAS',				1);
--------------------------------
-- Leader_MajorCivApproachBiases
--------------------------------					
INSERT INTO Leader_MajorCivApproachBiases 
		(LeaderType, 			MajorCivApproachType, 				Bias)
VALUES	('LEADER_NEUVILLETTE', 	'MAJOR_CIV_APPROACH_WAR', 			2),
		('LEADER_NEUVILLETTE', 	'MAJOR_CIV_APPROACH_HOSTILE', 		2),
		('LEADER_NEUVILLETTE', 	'MAJOR_CIV_APPROACH_DECEPTIVE', 2),
		('LEADER_NEUVILLETTE', 	'MAJOR_CIV_APPROACH_GUARDED', 		3),
		('LEADER_NEUVILLETTE', 	'MAJOR_CIV_APPROACH_AFRAID', 		3),
		('LEADER_NEUVILLETTE', 	'MAJOR_CIV_APPROACH_FRIENDLY', 		5),
		('LEADER_NEUVILLETTE', 	'MAJOR_CIV_APPROACH_NEUTRAL', 		9);
--------------------------------
-- Leader_MajorCivApproachBiases
--------------------------------					
INSERT INTO Leader_MinorCivApproachBiases 
		(LeaderType, 			MinorCivApproachType, 				Bias)
VALUES	('LEADER_NEUVILLETTE', 	'MINOR_CIV_APPROACH_IGNORE', 		1),
		('LEADER_NEUVILLETTE', 	'MINOR_CIV_APPROACH_FRIENDLY', 		7),
		('LEADER_NEUVILLETTE', 	'MINOR_CIV_APPROACH_PROTECTIVE', 	6),
		('LEADER_NEUVILLETTE', 	'MINOR_CIV_APPROACH_CONQUEST', 		1),
		('LEADER_NEUVILLETTE', 	'MINOR_CIV_APPROACH_BULLY', 		1);
--------------------------------
-- Leader_Flavors
--------------------------------					
INSERT INTO Leader_Flavors 
		(LeaderType, 			FlavorType, 						Flavor)
VALUES	('LEADER_NEUVILLETTE', 	'FLAVOR_OFFENSE', 					5),
		('LEADER_NEUVILLETTE', 	'FLAVOR_DEFENSE', 					5),
		('LEADER_NEUVILLETTE', 	'FLAVOR_CITY_DEFENSE', 				5),
		('LEADER_NEUVILLETTE', 	'FLAVOR_MILITARY_TRAINING', 		4),
		('LEADER_NEUVILLETTE', 	'FLAVOR_RECON', 					6),
		('LEADER_NEUVILLETTE', 	'FLAVOR_RANGED', 					5),
		('LEADER_NEUVILLETTE', 	'FLAVOR_MOBILE', 					4),
		('LEADER_NEUVILLETTE', 	'FLAVOR_NAVAL', 					8),
		('LEADER_NEUVILLETTE', 	'FLAVOR_NAVAL_RECON', 				7),
		('LEADER_NEUVILLETTE', 	'FLAVOR_NAVAL_GROWTH', 				8),
		('LEADER_NEUVILLETTE', 	'FLAVOR_NAVAL_TILE_IMPROVEMENT', 	8),
		('LEADER_NEUVILLETTE', 	'FLAVOR_AIR', 						5),
		('LEADER_NEUVILLETTE', 	'FLAVOR_EXPANSION', 				5),
		('LEADER_NEUVILLETTE', 	'FLAVOR_GROWTH', 					6),
		('LEADER_NEUVILLETTE', 	'FLAVOR_TILE_IMPROVEMENT', 			6),
		('LEADER_NEUVILLETTE', 	'FLAVOR_INFRASTRUCTURE', 			6),
		('LEADER_NEUVILLETTE', 	'FLAVOR_PRODUCTION', 				6),
		('LEADER_NEUVILLETTE', 	'FLAVOR_GOLD', 						5),
		('LEADER_NEUVILLETTE', 	'FLAVOR_SCIENCE', 					5),
		('LEADER_NEUVILLETTE', 	'FLAVOR_CULTURE', 					7),
		('LEADER_NEUVILLETTE', 	'FLAVOR_HAPPINESS', 				7),
		('LEADER_NEUVILLETTE', 	'FLAVOR_GREAT_PEOPLE', 				5),
		('LEADER_NEUVILLETTE', 	'FLAVOR_WONDER', 					3),
		('LEADER_NEUVILLETTE', 	'FLAVOR_RELIGION', 					3),
		('LEADER_NEUVILLETTE', 	'FLAVOR_DIPLOMACY', 				6),
		('LEADER_NEUVILLETTE', 	'FLAVOR_SPACESHIP', 				4),
		('LEADER_NEUVILLETTE', 	'FLAVOR_WATER_CONNECTION', 			9),
		('LEADER_NEUVILLETTE', 	'FLAVOR_NUKE', 						4),
		('LEADER_NEUVILLETTE', 	'FLAVOR_USE_NUKE', 					4),
		('LEADER_NEUVILLETTE', 	'FLAVOR_ESPIONAGE', 				5),
		('LEADER_NEUVILLETTE', 	'FLAVOR_AIRLIFT', 					5),
		('LEADER_NEUVILLETTE', 	'FLAVOR_I_TRADE_DESTINATION', 		5),
		('LEADER_NEUVILLETTE', 	'FLAVOR_I_TRADE_ORIGIN', 			5),
		('LEADER_NEUVILLETTE', 	'FLAVOR_I_SEA_TRADE_ROUTE', 		5),
		('LEADER_NEUVILLETTE', 	'FLAVOR_I_LAND_TRADE_ROUTE', 		5),
		('LEADER_NEUVILLETTE', 	'FLAVOR_ARCHAEOLOGY', 				5),
		('LEADER_NEUVILLETTE', 	'FLAVOR_AIR_CARRIER', 				5);
--------------------------------
-- Leader_Traits
--------------------------------					
INSERT INTO Leader_Traits 
		(LeaderType, 			TraitType)
VALUES	('LEADER_NEUVILLETTE', 	'TRAIT_NEUVILLETTE');
--==========================================================================================================================	
-- TRAITS
--==========================================================================================================================	
-- Traits
--------------------------------	
INSERT INTO Traits 
			(Type, 					Description, 					ShortDescription	)
VALUES	('TRAIT_NEUVILLETTE', 	'TXT_KEY_TRAIT_NEUVILLETTE', 	'TXT_KEY_TRAIT_NEUVILLETTE_SHORT');

--==========================================================================================================================	
-- CIVILIZATIONS
--==========================================================================================================================	
-- Civilizations
--------------------------------			
INSERT INTO Civilizations 	
			(Type, 									Description, 								ShortDescription, 										Adjective, 							CivilopediaTag, 				DefaultPlayerColor, 		ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix,		 IconAtlas, 			AlphaIconAtlas, 			PortraitIndex,		SoundtrackTag, 	MapImage, 				DawnOfManQuote, 		DawnOfManAudio, 			DawnOfManImage)
SELECT	'CIVILIZATION_NEUVILLETTE', 			'TXT_KEY_CIV_NEUVILLETTE_DESC', 		'TXT_KEY_CIV_NEUVILLETTE_SHORT_DESC',					'TXT_KEY_CIV_NEUVILLETTE_ADJECTIVE',			'TXT_KEY_CIV5_NEUVILLETTE',		'PLAYERCOLOR_NEUVILLETTE',		ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, 'NEUVILLETTE_ATLAS',	'NEUVILLETTE_ALPHA_ATLAS',				0, 		SoundtrackTag,		'NeuvilletteMap.dds',	'TXT_KEY_CIV5_DOM_NEUVILLETTE_TEXT', 	'AS2D_DOM_SPEECH_NEUVILLETTE', 'NeuvilletteLoading.dds'
FROM Civilizations WHERE Type = 'CIVILIZATION_FRANCE';
--------------------------------
-- Civilization_CityNames
--------------------------------		
INSERT INTO Civilization_CityNames 
		(CivilizationType, 				CityName)
VALUES	('CIVILIZATION_NEUVILLETTE', 	'TXT_KEY_CITY_NAME_NEUVILLETTE_00'),
			('CIVILIZATION_NEUVILLETTE', 	'TXT_KEY_CITY_NAME_NEUVILLETTE_01'),
			('CIVILIZATION_NEUVILLETTE', 	'TXT_KEY_CITY_NAME_NEUVILLETTE_02'),
			('CIVILIZATION_NEUVILLETTE', 	'TXT_KEY_CITY_NAME_NEUVILLETTE_03'),
			('CIVILIZATION_NEUVILLETTE', 	'TXT_KEY_CITY_NAME_NEUVILLETTE_04'),
			('CIVILIZATION_NEUVILLETTE', 	'TXT_KEY_CITY_NAME_NEUVILLETTE_05'),
			('CIVILIZATION_NEUVILLETTE', 	'TXT_KEY_CITY_NAME_NEUVILLETTE_06'),
			('CIVILIZATION_NEUVILLETTE', 	'TXT_KEY_CITY_NAME_NEUVILLETTE_07'),
			('CIVILIZATION_NEUVILLETTE', 	'TXT_KEY_CITY_NAME_NEUVILLETTE_08'),
			('CIVILIZATION_NEUVILLETTE', 	'TXT_KEY_CITY_NAME_NEUVILLETTE_09'),
			('CIVILIZATION_NEUVILLETTE', 	'TXT_KEY_CITY_NAME_NEUVILLETTE_10'),
			('CIVILIZATION_NEUVILLETTE', 	'TXT_KEY_CITY_NAME_NEUVILLETTE_11'),
			('CIVILIZATION_NEUVILLETTE', 	'TXT_KEY_CITY_NAME_NEUVILLETTE_12'),
			('CIVILIZATION_NEUVILLETTE', 	'TXT_KEY_CITY_NAME_NEUVILLETTE_13'),
			('CIVILIZATION_NEUVILLETTE', 	'TXT_KEY_CITY_NAME_NEUVILLETTE_14'),
			('CIVILIZATION_NEUVILLETTE', 	'TXT_KEY_CITY_NAME_NEUVILLETTE_15'),
			('CIVILIZATION_NEUVILLETTE', 	'TXT_KEY_CITY_NAME_NEUVILLETTE_16'),
			('CIVILIZATION_NEUVILLETTE', 	'TXT_KEY_CITY_NAME_NEUVILLETTE_17'),
			('CIVILIZATION_NEUVILLETTE', 	'TXT_KEY_CITY_NAME_NEUVILLETTE_18');
--------------------------------
-- Civilization_FreeBuildingClasses
--------------------------------		
INSERT INTO Civilization_FreeBuildingClasses 
		(CivilizationType, 				BuildingClassType)
SELECT	'CIVILIZATION_NEUVILLETTE', 	BuildingClassType
FROM Civilization_FreeBuildingClasses WHERE CivilizationType = 'CIVILIZATION_FRANCE';
--------------------------------
-- Civilization_FreeTechs
--------------------------------	
INSERT INTO Civilization_FreeTechs 
		(CivilizationType, 				TechType)
SELECT	'CIVILIZATION_NEUVILLETTE', 	TechType
FROM Civilization_FreeTechs WHERE CivilizationType = 'CIVILIZATION_FRANCE';
--------------------------------
-- Civilization_FreeUnits
--------------------------------	
INSERT INTO Civilization_FreeUnits
		(CivilizationType, 				UnitClassType, Count, UnitAIType)
SELECT	'CIVILIZATION_NEUVILLETTE', 	UnitClassType, Count, UnitAIType
FROM Civilization_FreeUnits WHERE CivilizationType = 'CIVILIZATION_FRANCE';
--------------------------------
-- Civilization_Leaders
--------------------------------		
INSERT INTO Civilization_Leaders
		(CivilizationType, 				LeaderheadType)
VALUES	('CIVILIZATION_NEUVILLETTE', 	'LEADER_NEUVILLETTE');
--------------------------------
-- Civilization_BuildingClassOverrides
--------------------------------	
INSERT INTO Civilization_BuildingClassOverrides 
		(CivilizationType, 				BuildingClassType, 				BuildingType)
VALUES	('CIVILIZATION_NEUVILLETTE', 	'BUILDINGCLASS_COURTHOUSE', 	'BUILDING_NEUVILLETTE'),
			('CIVILIZATION_NEUVILLETTE', 	'BUILDINGCLASS_POLICE_STATION', 	'BUILDING_NEUVILLETTE_2');
--------------------------------
-- Civilization_UnitClassOverrides
--------------------------------	

--------------------------------
-- Civilization_Religions
--------------------------------	
INSERT INTO Civilization_Religions
		(CivilizationType, 				ReligionType)
VALUES	('CIVILIZATION_NEUVILLETTE',	'RELIGION_CHRISTIANITY');
--------------------------------
-- Civilization_SpyNames
--------------------------------	
INSERT INTO Civilization_SpyNames
		(CivilizationType, 				SpyName)
VALUES	('CIVILIZATION_NEUVILLETTE', 	'TXT_KEY_SPY_NAME_NEUVILLETTE_0'),	
			('CIVILIZATION_NEUVILLETTE', 	'TXT_KEY_SPY_NAME_NEUVILLETTE_1'),
			('CIVILIZATION_NEUVILLETTE', 	'TXT_KEY_SPY_NAME_NEUVILLETTE_2'),
			('CIVILIZATION_NEUVILLETTE', 	'TXT_KEY_SPY_NAME_NEUVILLETTE_3'),
			('CIVILIZATION_NEUVILLETTE', 	'TXT_KEY_SPY_NAME_NEUVILLETTE_4'),
			('CIVILIZATION_NEUVILLETTE', 	'TXT_KEY_SPY_NAME_NEUVILLETTE_5'),
			('CIVILIZATION_NEUVILLETTE', 	'TXT_KEY_SPY_NAME_NEUVILLETTE_6'),
			('CIVILIZATION_NEUVILLETTE', 	'TXT_KEY_SPY_NAME_NEUVILLETTE_7'),
			('CIVILIZATION_NEUVILLETTE', 	'TXT_KEY_SPY_NAME_NEUVILLETTE_8'),
			('CIVILIZATION_NEUVILLETTE', 	'TXT_KEY_SPY_NAME_NEUVILLETTE_9');
--==========================================================================================================================
-- Civilization_Start_Region_Priority
--==========================================================================================================================	
INSERT INTO Civilization_Start_Region_Avoid
		(CivilizationType, 				RegionType)
VALUES	('CIVILIZATION_NEUVILLETTE', 	'REGION_DESERT'),
			('CIVILIZATION_NEUVILLETTE', 	'REGION_TUNDRA'),
			('CIVILIZATION_NEUVILLETTE', 	'REGION_JUNGLE');
--------------------------------
-- Civilization_Start_Along_Ocean
--------------------------------	
INSERT INTO Civilization_Start_Along_Ocean
		(CivilizationType, 				StartAlongOcean)
VALUES	('CIVILIZATION_NEUVILLETTE', 	1);

--------------------------------
-- Civilization_Start_Place_First_Along_Ocean
--------------------------------	
INSERT INTO Civilization_Start_Place_First_Along_Ocean
		(CivilizationType, 				PlaceFirst)
VALUES	('CIVILIZATION_NEUVILLETTE', 	1);
--==========================================================================================================================
--==========================================================================================================================
--==========================================================================================================================
--==========================================================================================================================
---------------------------
-- Policies
---------------------------
