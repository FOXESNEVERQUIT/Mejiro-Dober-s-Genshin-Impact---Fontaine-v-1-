--=======================================================================================================================
-- Bingle's Civ IV Traits
--=======================================================================================================================
-- Leader_SharedTraits
------------------------------	
CREATE TABLE IF NOT EXISTS 
    Leader_SharedTraits (
    LeaderType          text    REFERENCES Leaders(Type)        default null,
    TraitOne            text    REFERENCES Policies(Type)       default null,
    TraitTwo            text    REFERENCES Policies(Type)       default null);
     
INSERT OR REPLACE INTO Leader_SharedTraits
            (LeaderType,    TraitOne,    TraitTwo)
VALUES	('LEADER_FURINA',	'POLICY_CREATIVE_X',	'POLICY_PHILOSOPHICAL_X'),
			('LEADER_NEUVILLETTE',	'POLICY_INDUSTRIOUS_X',	'POLICY_PHILOSOPHICAL_X');
------------------------------	
-- Leaders
------------------------------	

UPDATE Leaders
SET Description = (CASE WHEN EXISTS(SELECT Type FROM Policies WHERE Type = 'POLICY_AGGRESSIVE_X' )
	THEN 'TXT_KEY_LEADER_FURINA_C4T'
	ELSE 'TXT_KEY_LEADER_FURINA' END) 
WHERE Type = 'LEADER_FURINA';

UPDATE Leaders
SET Description = (CASE WHEN EXISTS(SELECT Type FROM Policies WHERE Type = 'POLICY_AGGRESSIVE_X' )
	THEN 'TXT_KEY_LEADER_NEUVILLETTE_C4T'
	ELSE 'TXT_KEY_LEADER_NEUVILLETTE' END) 
WHERE Type = 'LEADER_NEUVILLETTE';

--==========================================================================================================================
-- BrutalSamurai's Ethnic Units/Gedemon's R.E.D.
--==========================================================================================================================
-- Civilizations
------------------------------	

UPDATE Civilizations 
SET ArtStyleSuffix = (CASE WHEN EXISTS(SELECT ArtStyleSuffix FROM Civilizations WHERE ArtStyleSuffix = '_FRANCE' )
	THEN '_FRANCE'
	ELSE '_EURO' END)  
WHERE Type = 'CIVILIZATION_FURINA';

UPDATE Civilizations 
SET ArtStyleSuffix = (CASE WHEN EXISTS(SELECT ArtStyleSuffix FROM Civilizations WHERE ArtStyleSuffix = '_FRANCE' )
	THEN '_FRANCE'
	ELSE '_EURO' END)  
WHERE Type = 'CIVILIZATION_NEUVILLETTE';

--==========================================================================================================================    
-- JFD's and Pouakai's MERCENARIES
--==========================================================================================================================
-- Flavors
------------------------------------------------------------    
INSERT OR REPLACE INTO Flavors 
        (Type)
VALUES  ('FLAVOR_JFD_MERCENARY');
------------------------------------------------------------
-- Leader_Flavors
------------------------------------------------------------    
INSERT INTO Leader_Flavors
        (LeaderType,                FlavorType,                 Flavor)
VALUES	('LEADER_FURINA',    'FLAVOR_JFD_MERCENARY',     8),
			('LEADER_NEUVILLETTE',    'FLAVOR_JFD_MERCENARY',     8);

--==========================================================================================================================
-- JFD's Cultural Diversity
--==========================================================================================================================
-- Civilization_JFD_CultureTypes
------------------------------	
CREATE TABLE IF NOT EXISTS 
Civilization_JFD_CultureTypes (
	CivilizationType 							text 	REFERENCES Civilizations(Type) 		default null,
	CultureType 								text										default null,
	SplashScreenTag								text										default	null,
	SoundtrackTag								text										default	null);

INSERT OR REPLACE INTO Civilization_JFD_CultureTypes
			(CivilizationType,					CultureType,		SplashScreenTag,	SoundtrackTag)
VALUES	('CIVILIZATION_FURINA',				'JFD_Western',		'JFD_Western',		'JFD_Western'),
			('CIVILIZATION_NEUVILLETTE',				'JFD_Western',		'JFD_Western',		'JFD_Western');

--==========================================================================================================================	
-- JFD's Piety & Prestige
--==========================================================================================================================			
-- Flavors
------------------------------	
INSERT OR REPLACE INTO Flavors 
			(Type)
VALUES		('FLAVOR_JFD_RELIGIOUS_INTOLERANCE');
------------------------------
-- Leader_Flavors
------------------------------
INSERT INTO Leader_Flavors
			(LeaderType,				FlavorType,							Flavor)
VALUES	('LEADER_FURINA',		'FLAVOR_JFD_RELIGIOUS_INTOLERANCE',	0),
			('LEADER_NEUVILLETTE',		'FLAVOR_JFD_RELIGIOUS_INTOLERANCE',	0);