-- 푸리나 함수
-- 제작자 : 메지로 도베르
-- 제작 날짜 : 2024/04/04 오후 5:20:51
--------------------------------------------------------------
-- 세팅
--------------------------------------------------------------
include("SaveUtils_Suk_V2.lua"); MY_MOD_NAME = "Furina";
include("IconSupport.lua");
include( "InstanceManager");
include("FLuaVector.lua");
include("PlotIterators.lua");
include( "InfoTooltipInclude" );

function ArtanisMODActive(Furina)
	for iSlot = 0, GameDefines.MAX_MAJOR_CIVS-1, 1 do
		local slotStatus = PreGame.GetSlotStatus(iSlot)
		if (slotStatus == SlotStatus["SS_TAKEN"] or slotStatus == SlotStatus["SS_COMPUTER"]) then
			if PreGame.GetCivilization(iSlot) == Furina then
				return true
			end
		end
	end
	return false
end



local Furina         = GameInfoTypes["CIVILIZATION_FURINA"]
local FurinaLeader         = GameInfoTypes["LEADER_FURINA"]
local FurinaBuilding         = GameInfoTypes["BUILDING_FURINA"]
local FurinaUnit         = GameInfoTypes["UNIT_FURINA"]
local FurinaMusicianClass  = GameInfoTypes["UNITCLASS_MUSICIAN"]
local FurinaWriterClass  = GameInfoTypes["UNITCLASS_WRITER"]
local FurinaPromotion         = GameInfoTypes["PROMOTION_FURINA"]
local FurinaPromotionDummy         = GameInfoTypes["PROMOTION_FURINA_DUMMY"]
local FurinaMusicSchoolClass = GameInfoTypes.BUILDINGCLASS_OPERA_HOUSE
local FurinaActive      = ArtanisMODActive(Furina)
local GameSpeed = ((GameInfo.GameSpeeds[Game.GetGameSpeedType()].BuildPercent)/100)

function GetRandom(lower, upper)
    return Map.Rand((upper + 1) - lower, "") + lower
end
--------------------------------------------------------------
-- 푸리나 특성 함수
--------------------------------------------------------------
if Players[Game.GetActivePlayer()]:GetCivilizationType() ~= Furina then
	Controls.Arkhe:SetHide(true)
	Controls.Arkhe2:SetHide(true)
end

if FurinaActive then
	print("푸리나가 게임에 참여했습니다.")

	-- 푸리나 특성

	function FurinaEffect()
		for iPlayerID = 0, GameDefines.MAX_CIV_PLAYERS - 1 do
			local pPlayer = Players[iPlayerID]
			if pPlayer:IsAlive() and pPlayer:GetCivilizationType() == Furina then
				Controls.Furina_ChoiceOne:SetColor({x=1, y=1, z=1, w=0.25})
				Controls.Furina_ChoiceTwo:SetColor({x=1, y=1, z=1, w=0.25})
				if load(pPlayer, "ArkheCooltime") == nil then
					save(pPlayer, "ArkheCooltime", 0)
				end
			end
		end
	end
	Events.SequenceGameInitComplete.Add(FurinaEffect)

	function FurinaArkhe( iPlayer )
		local pPlayer = Players[iPlayer]
		if pPlayer:GetCivilizationType() == Furina and pPlayer:IsAlive() then
			if load(pPlayer, "ArkheCooltime") > 0 then
				save(pPlayer, "ArkheCooltime", load(pPlayer, "ArkheCooltime") - 1)
			end
			for pUnit in pPlayer:Units() do
				if pUnit:IsCombatUnit() then
					local pPlot = pUnit:GetPlot()
					if pPlot:IsFreshWater() or pPlot:IsRiver() then
						if load (pPlayer, "ArkheOusia") == true then
							pUnit:SetHasPromotion(FurinaPromotion, true)
						elseif load (pPlayer, "ArkhePnuema") == true then
							pUnit:ChangeDamage(-10)
						end
					end
				end
			end
		end
	end
	GameEvents.PlayerDoTurn.Add(FurinaArkhe)

	function FurinaArkhe2(playerID, unitID, hexVec, unitType, cultureType, civID, primaryColor, secondaryColor, unitFlagIndex, fogState, selected, military, notInvisible)
		local pPlayer = Players[playerID]
		local pUnit = pPlayer:GetUnitByID(unitID)
		if pPlayer:GetCivilizationType() == Furina and pPlayer:IsAlive() then
			if pUnit:GetUnitClassType() == FurinaMusicianClass or pUnit:GetUnitClassType() == FurinaWriterClass then
				if not pUnit:IsHasPromotion(FurinaPromotionDummy) then
					pUnit:SetHasPromotion(FurinaPromotionDummy, true)
					local Capital = pPlayer:GetCapitalCity()
					pPlayer:InitUnit(GameInfoTypes["UNIT_FURINA"], Capital:GetX(), Capital:GetY(), UNITAI_MUSICIAN)
				end
			end
			if load (pPlayer, "ArkheOusia") == true then
				if pUnit:IsCombatUnit() then
					local pPlot = pUnit:GetPlot()
					if pPlot:IsFreshWater() or pPlot:IsRiver() then
						pUnit:SetHasPromotion(FurinaPromotion, true)
					end
				end
			end
		end
	end
	Events.SerialEventUnitCreated.Add(FurinaArkhe2)

	function FurinaArkhe3(playerID, unitID, X, Y)
		local pPlayer = Players[playerID]
		local pUnit = pPlayer:GetUnitByID(unitID)
		if pPlayer:GetCivilizationType() == Furina and pPlayer:IsAlive() then
			if load (pPlayer, "ArkheOusia") == true then
				if pUnit:IsCombatUnit() then
					local pPlot = pUnit:GetPlot()
					if pPlot:IsFreshWater() or pPlot:IsRiver() then
						pUnit:SetHasPromotion(FurinaPromotion, true)
					end
				end
			end
		end
	end
	GameEvents.UnitSetXY.Add(FurinaArkhe3)

	function OusiaFunctionActivate()
		local pPlayer = Players[Game:GetActivePlayer()]
		if pPlayer:IsAlive() and pPlayer:GetCivilizationType() == Furina then
			if load(pPlayer, "ArkheCooltime") == 0 and not load(pPlayer, "ArkheOusia") == true then
				save(pPlayer, "ArkheCooltime", math.floor(6 * GameSpeed))
				Controls.Furina_ChoiceOne:SetColor({x=1, y=1, z=1, w=1})
				Controls.Furina_ChoiceTwo:SetColor({x=1, y=1, z=1, w=0.25})
				Controls.Ousia_Activate:SetHide(true)
				Controls.Pneuma_Activate:SetHide(false)
				save(pPlayer, "ArkheOusia", true)
				save(pPlayer, "ArkhePnuema", false)
				print("남은 쿨타임 : " ..load(pPlayer, "ArkheCooltime"))
				local FurinaRandom = GetRandom(1, 3)
				if FurinaRandom == 1 then
					Events.AudioPlay2DSound("AS2D_FURINA_ARKHE")
				elseif FurinaRandom == 2 then
					Events.AudioPlay2DSound("AS2D_FURINA_ARKHE_2")
				else
					Events.AudioPlay2DSound("AS2D_FURINA_ARKHE_3")
				end
				for pUnit in pPlayer:Units() do
					if load(pPlayer, "ArkheOusia") == true then
						if pUnit:IsCombatUnit() then
							local pPlot = pUnit:GetPlot()
							if pPlot:IsFreshWater() or pPlot:IsRiver() then
								pUnit:SetHasPromotion(FurinaPromotion, true)
							end
						end
					end
				end
			end
		end
	end
	Controls.Ousia:RegisterCallback(Mouse.eLClick, OusiaFunctionActivate);

	function PneumaFunctionActivate()
		local pPlayer = Players[Game:GetActivePlayer()]
		if pPlayer:IsAlive() and pPlayer:GetCivilizationType() == Furina then
			if load(pPlayer, "ArkheCooltime") == 0 and not load(pPlayer, "ArkhePnuema") == true then
				save(pPlayer, "ArkheCooltime", math.floor(6 * GameSpeed))
				Controls.Furina_ChoiceOne:SetColor({x=1, y=1, z=1, w=0.25})
				Controls.Furina_ChoiceTwo:SetColor({x=1, y=1, z=1, w=1})
				Controls.Ousia_Activate:SetHide(false)
				Controls.Pneuma_Activate:SetHide(true)
				save(pPlayer, "ArkheOusia", false)
				save(pPlayer, "ArkhePnuema", true)
				print("남은 쿨타임 : " ..load(pPlayer, "ArkheCooltime"))
				local FurinaRandom = GetRandom(1, 3)
				if FurinaRandom == 1 then
					Events.AudioPlay2DSound("AS2D_FURINA_ARKHE_4")
				elseif FurinaRandom == 2 then
					Events.AudioPlay2DSound("AS2D_FURINA_ARKHE_5")
				else
					Events.AudioPlay2DSound("AS2D_FURINA_ARKHE_6")
				end
				for pUnit in pPlayer:Units() do
					if load(pPlayer, "ArkheOusia") == false then
						if pUnit:IsCombatUnit() then
							pUnit:SetHasPromotion(FurinaPromotion, false)
						end
					end
				end
			end
		end
	end
	Controls.Pneuma:RegisterCallback(Mouse.eLClick, PneumaFunctionActivate);

	function FurinaTheming(playerID)
		local pPlayer = Players[playerID]
		if pPlayer:GetCivilizationType() == Furina and pPlayer:IsAlive() then
			for pCity in pPlayer:Cities() do
				local MusicTheme = pCity:GetThemingBonus(FurinaMusicSchoolClass)
				if MusicTheme >= 1 and load(pPlayer, "ArkhePnuema") == true then
					print(MusicTheme)
					pPlayer:ChangeGoldenAgeProgressMeter(10)
				end
			end
		end
	end
	GameEvents.PlayerDoTurn.Add(FurinaTheming)

	function FurinaTheming2(iPlayer, iCity, eUnit, Gold, FoC)
		local pPlayer = Players[iPlayer]
		if pPlayer:GetCivilizationType() == Furina and pPlayer:IsAlive() then
			local pCity = pPlayer:GetCityByID(iCity)
			local MusicTheme = pCity:GetThemingBonus(FurinaMusicSchoolClass)
			if MusicTheme >= 1 and load(pPlayer, "ArkheOusia") == true then
				print(MusicTheme)
				local pUnit = pPlayer:GetUnitByID(eUnit)
				pUnit:ChangeExperience(15)
			end
		end
	end
	GameEvents.CityTrained.Add(FurinaTheming2)

	function FurinaGetHappiness(iPlayer, iUnit) -- 오페라 배우 소모
		local pPlayer = Players[iPlayer]
		if pPlayer:IsAlive() and pPlayer:GetCivilizationType() == Furina and iUnit == FurinaUnit then
			if load(pPlayer, "ArkhePnuema") == true then
				pPlayer:ChangeJONSCulture(pPlayer:GetTotalJONSCulturePerTurn())
			end
			if load(pPlayer, "ArkheOusia") == true then
				for QPlayer = 0, GameDefines.MAX_MAJOR_CIVS-1, 1 do
					local aPlayer = Players[QPlayer]
					local OtherCapital = aPlayer:GetCapitalCity()
					local pTeam = Teams[pPlayer:GetTeam()];
					local iOtherTeam = aPlayer:GetTeam();
					if OtherCapital ~= nil and aPlayer ~= pPlayer and pTeam:IsHasMet(iOtherTeam) then
						pPlayer:InitUnit(GameInfoTypes["UNIT_FURINA_DUMMY"], OtherCapital:GetX()+1, OtherCapital:GetY()):PushMission(GameInfoTypes["MISSION_ONE_SHOT_TOURISM"])
					end
				end
			end
		end
	end
	GameEvents.GreatPersonExpended.Add(FurinaGetHappiness)


	function RefreshFurinaUI()
		if Players[Game:GetActivePlayer()]:GetLeaderType() == FurinaLeader and Players[Game:GetActivePlayer()]:IsHuman() then
			bIsActivePlayerFurina = true
		else
			bIsActivePlayerFurina = false
		end
	end

	RefreshFurinaUI()

	function OnEnterCityScreen()
		Controls.Arkhe:SetHide(true)
		Controls.Arkhe2:SetHide(true)
	end

	function OnExitCityScreen()
		Controls.Arkhe:SetHide(false)
		Controls.Arkhe2:SetHide(false)
	end

	if bIsActivePlayerFurina then
		Events.SerialEventExitCityScreen.Add( OnExitCityScreen );
		Events.SerialEventEnterCityScreen.Add( OnEnterCityScreen );
	else
		Controls.Arkhe:SetHide(true);
		Controls.Arkhe2:SetHide(true);
	end

	for iPlayer = 0, GameDefines.MAX_MAJOR_CIVS-1, 1 do
		local pPlayer = Players[iPlayer]
		if not Players[Game:GetActivePlayer()]:IsHuman() then
			Controls.Arkhe:SetHide(true)
			Controls.Arkhe2:SetHide(true)
		else
			RefreshFurinaUI()
		end
	end

	ContextPtr:SetUpdate(function()
		local pPlayer = Players[Game.GetActivePlayer()]
		local FurinaArkheTurn = load(pPlayer, "ArkheCooltime")
		if Players[Game:GetActivePlayer()]:IsHuman() and Players[Game:GetActivePlayer()]:GetLeaderType() == FurinaLeader then
			local FurinaArkheOverviewText
			if load(pPlayer, "ArkheCooltime") == 0 then
				FurinaArkheOverviewText = Locale.ConvertTextKey("TXT_KEY_FURINA_ARKHE_2")
			else
				FurinaArkheOverviewText = Locale.ConvertTextKey("TXT_KEY_FURINA_ARKHE", FurinaArkheTurn)
			end
			Controls.Furina_Arkhe:SetText(FurinaArkheOverviewText);
			Controls.Arkhe2:DoAutoSize();
		end
	end)
end


