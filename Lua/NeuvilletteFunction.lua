-- 느비예트 함수
-- 제작자 : 메지로 도베르
-- 제작 날짜 : 2024/04/03 오후 9:41:19
--------------------------------------------------------------
-- 세팅
--------------------------------------------------------------
include("SaveUtils_Suk_V2.lua"); MY_MOD_NAME = "Neuvillette";
include("IconSupport.lua");
include( "InstanceManager");
include("FLuaVector.lua");
include("PlotIterators.lua");
include( "InfoTooltipInclude" );

function ArtanisMODActive(Neuvillette)
	for iSlot = 0, GameDefines.MAX_MAJOR_CIVS-1, 1 do
		local slotStatus = PreGame.GetSlotStatus(iSlot)
		if (slotStatus == SlotStatus["SS_TAKEN"] or slotStatus == SlotStatus["SS_COMPUTER"]) then
			if PreGame.GetCivilization(iSlot) == Neuvillette then
				return true
			end
		end
	end
	return false
end



local Neuvillette         = GameInfoTypes["CIVILIZATION_NEUVILLETTE"]
local NeuvilletteBuilding         = GameInfoTypes["BUILDING_NEUVILLETTE"]
local NeuvilletteBuilding2         = GameInfoTypes["BUILDING_NEUVILLETTE_2"]
local NeuvilletteBuildingDummy = GameInfoTypes["BUILDING_NEUVILLETTE_DUMMY"] 
local NeuvilletteBuildingDummy2 = GameInfoTypes["BUILDING_NEUVILLETTE_DUMMY_2"] 
local NeuvilletteActive      = ArtanisMODActive(Neuvillette)

--------------------------------------------------------------
-- 느비예트 특성 함수
--------------------------------------------------------------
if Players[Game.GetActivePlayer()]:GetCivilizationType() ~= Neuvillette then
	Controls.NeuvilletteBackground:SetHide(true)
end

if NeuvilletteActive then
	print("느비예트가 게임에 참여했습니다.")

	-- 느비예트 특성

	function NeuvilletteEffect()
		for iPlayerID = 0, GameDefines.MAX_CIV_PLAYERS - 1 do
			local pPlayer = Players[iPlayerID]
			if pPlayer:IsAlive() and pPlayer:GetCivilizationType() == Neuvillette then
				if load(pPlayer, "NeuvilletteJudgment") == nil then
					save(pPlayer, "NeuvilletteJudgment", 0)
					Controls.Neuvillette_Activate:SetHide(true)
				end
			end
		end
	end
	Events.SequenceGameInitComplete.Add(NeuvilletteEffect)

	function NeuvilletteJudgmentActivate( iPlayer )
		local pPlayer = Players[iPlayer]
		if pPlayer:GetCivilizationType() == Neuvillette and pPlayer:IsAlive() then
			for iOtherPlayer=0, GameDefines.MAX_MAJOR_CIVS - 1 do
				local pOtherPlayer = Players[iOtherPlayer]
				if pOtherPlayer:IsEverAlive() then
					if pPlayer ~= pOtherPlayer then
						local NeuvilletteResearchAgreement = 0
						local NeuvilletteDiplomat = 0
						local NeuvilletteDoF = 0
						local pOtherEra = pOtherPlayer:GetCurrentEra()
						local pPlayerTeam = Teams[pPlayer:GetTeam()]
						local pOtherTeam = Teams[pOtherPlayer:GetTeam()]
						if pOtherPlayer:IsDenouncingPlayer(pPlayer:GetID()) or pPlayerTeam:IsAtWar(pOtherPlayer:GetTeam()) then
							save(pPlayer, "NeuvilletteJudgment", load(pPlayer, "NeuvilletteJudgment") + 10)
						end
					end
				end
			end
			for pCity in pPlayer:Cities() do
				if pCity:IsHasBuilding(NeuvilletteBuilding) then
					pCity:SetNumRealBuilding(NeuvilletteBuildingDummy, 1)
					local pPlot = pCity:Plot()
					if pPlot:IsFreshWater() or pPlot:IsRiver() then
						save(pPlayer, "NeuvilletteJudgment", load(pPlayer, "NeuvilletteJudgment") + 2)
					else
						save(pPlayer, "NeuvilletteJudgment", load(pPlayer, "NeuvilletteJudgment") + 1)
					end
				end
				if pCity:IsHasBuilding(NeuvilletteBuilding2) then
					local pPlot = pCity:Plot()
					if pPlot:IsFreshWater() or pPlot:IsRiver() then
						save(pPlayer, "NeuvilletteJudgment", load(pPlayer, "NeuvilletteJudgment") + 2)
					else
						save(pPlayer, "NeuvilletteJudgment", load(pPlayer, "NeuvilletteJudgment") + 1)
					end
				end
			end
			local iTotalNeuvillette = load(pPlayer, "NeuvilletteJudgment")
			local NeuvilletteGauge = Locale.ConvertTextKey("TXT_KEY_NEUVILLETTE_JUDGMENT_PROGRESS_2", iTotalNeuvillette)
			local NeuvilletteGaugeToolTip = Locale.ConvertTextKey("TXT_KEY_NEUVILLETTE_JUDGMENT_PROGRESS")
			Controls.NeuvilletteButton:SetText(NeuvilletteGauge)
			Controls.NeuvilletteButton:LocalizeAndSetToolTip(NeuvilletteGaugeToolTip)
			Controls.NeuvilletteMeter:SetPercent(iTotalNeuvillette / 300)
			if iTotalNeuvillette >= 300 and pPlayer:IsHuman() then
				Controls.Neuvillette_Activate:SetHide(false)
			end
		end
	end
	GameEvents.PlayerDoTurn.Add(NeuvilletteJudgmentActivate)

	function NeuvilletteNew(PlayerID, KilledPlayerID, killeeUnitType)
		local pPlayer = Players[PlayerID]
		local aPlayer = Players[KilledPlayerID]
		if pPlayer:GetCivilizationType() == Neuvillette and pPlayer:IsAlive() then
			save(pPlayer, "NeuvilletteJudgment", load(pPlayer, "NeuvilletteJudgment") + 1)
			local iTotalNeuvillette = load(pPlayer, "NeuvilletteJudgment")
			local NeuvilletteGauge = Locale.ConvertTextKey("TXT_KEY_NEUVILLETTE_JUDGMENT_PROGRESS_2", iTotalNeuvillette)
			local NeuvilletteGaugeToolTip = Locale.ConvertTextKey("TXT_KEY_NEUVILLETTE_JUDGMENT_PROGRESS")
			Controls.NeuvilletteButton:SetText(NeuvilletteGauge)
			Controls.NeuvilletteButton:LocalizeAndSetToolTip(NeuvilletteGaugeToolTip)
			Controls.NeuvilletteMeter:SetPercent(iTotalNeuvillette / 300)
			if iTotalNeuvillette >= 300 and pPlayer:IsHuman() then
				Controls.Neuvillette_Activate:SetHide(false)
			end
		end
	end
	GameEvents.UnitKilledInCombat.Add(NeuvilletteNew)

	function NeuvilletteNew2(PlayerID, KilledPlayerID, killeeUnitType)
		local aPlayer = Players[PlayerID]
		local pPlayer = Players[KilledPlayerID]
		if pPlayer:GetCivilizationType() == Neuvillette and pPlayer:IsAlive() then
			save(pPlayer, "NeuvilletteJudgment", load(pPlayer, "NeuvilletteJudgment") + 1)
			local iTotalNeuvillette = load(pPlayer, "NeuvilletteJudgment")
			local NeuvilletteGauge = Locale.ConvertTextKey("TXT_KEY_NEUVILLETTE_JUDGMENT_PROGRESS_2", iTotalNeuvillette)
			local NeuvilletteGaugeToolTip = Locale.ConvertTextKey("TXT_KEY_NEUVILLETTE_JUDGMENT_PROGRESS")
			Controls.NeuvilletteButton:SetText(NeuvilletteGauge)
			Controls.NeuvilletteButton:LocalizeAndSetToolTip(NeuvilletteGaugeToolTip)
			Controls.NeuvilletteMeter:SetPercent(iTotalNeuvillette / 300)
			if iTotalNeuvillette >= 300 and pPlayer:IsHuman() then
				Controls.Neuvillette_Activate:SetHide(false)
			end
		end
	end
	GameEvents.UnitKilledInCombat.Add(NeuvilletteNew2)

	function IsValidPlayer(player)
		return player ~= nil and player:IsAlive() and not player:IsBarbarian();
	end


	function IsMajorCiv(player)
		return IsValidPlayer(player) and player:GetID() <= GameDefines.MAX_MAJOR_CIVS-1;
	end

	function NeuvilletteGet(hexPos, playerID, cityID, newPlayerID)
		local pPlayer = Players[newPlayerID];
		local ePlayer = Players[playerID];
		local pPlot = Map.GetPlot(ToGridFromHex(hexPos.x, hexPos.y));
		if pPlot:IsCity() then
			local pCity = pPlot:GetPlotCity();
			local pPlayerID = GameInfo.Leaders[pPlayer:GetLeaderType()].ID;
			if pPlayerID == GameInfo.Leaders["LEADER_NEUVILLETTE"].ID and IsValidPlayer(pPlayer) then
				if not pCity:IsHasBuilding(NeuvilletteBuildingDummy2) then					
					pCity:SetNumRealBuilding(NeuvilletteBuildingDummy2, 1)
					if pCity:IsOriginalCapital() then
						save(pPlayer, "NeuvilletteJudgment", load(pPlayer, "NeuvilletteJudgment") + 30 )
					else
						save(pPlayer, "NeuvilletteJudgment", load(pPlayer, "NeuvilletteJudgment") + 10 )
					end
				end
			end
			local iTotalNeuvillette = load(pPlayer, "NeuvilletteJudgment")
			local NeuvilletteGauge = Locale.ConvertTextKey("TXT_KEY_NEUVILLETTE_JUDGMENT_PROGRESS_2", iTotalNeuvillette)
			local NeuvilletteGaugeToolTip = Locale.ConvertTextKey("TXT_KEY_NEUVILLETTE_JUDGMENT_PROGRESS")

			if Game.GetActivePlayer() == newPlayerID then
				Controls.NeuvilletteButton:SetText(NeuvilletteGauge)
				Controls.NeuvilletteButton:LocalizeAndSetToolTip(NeuvilletteGaugeToolTip)
				Controls.NeuvilletteMeter:SetPercent(iTotalNeuvillette / 300)
				if iTotalNeuvillette >= 300 and pPlayer:IsHuman() then
					Controls.Neuvillette_Activate:SetHide(false)
				end
			end
		end
	end
	Events.SerialEventCityCaptured.Add( NeuvilletteGet )

	function NeuvilletteJudgementSkill()
		local pPlayer = Players[0]
		if pPlayer:IsAlive() and pPlayer:GetCivilizationType() == Neuvillette then
			local Capital = pPlayer:GetCapitalCity()
			local iTotalJudgment = load(pPlayer, "NeuvilletteJudgment")
			if iTotalJudgment >= 300 then
				NeuvilletteSkill = 1
				for iPlayerID = 0, GameDefines.MAX_CIV_PLAYERS - 1 do
					local aPlayer = Players[iPlayerID]
					if pPlayer ~= aPlayer then
						for pCity in aPlayer:Cities() do
							Events.SerialEventHexHighlight(ToHexFromGrid(Vector2(pCity:GetX(), pCity:GetY())), true, Vector4(1.0, 1.0, 0, 1.0))
						end
					end
				end
			end
		end
	end
	Controls.NeuvilletteButton:RegisterCallback(Mouse.eLClick, NeuvilletteJudgementSkill);

	function InputHandler( uiMsg, wParam, lParam )
		if NeuvilletteSkill ~= 0 then
			if uiMsg == MouseEvents.LButtonDown then
				lButtonDown = true
				local pPlot = Map.GetPlot(UI.GetMouseOverHex())
				local pPlayer = Players[Game:GetActivePlayer()]
				if NeuvilletteSkill == 1 then
					if pPlot:IsCity() then
						for iPlot in PlotAreaSpiralIterator(pPlot, 3, 2, true, true, true) do
							for i = 0, iPlot:GetNumUnits() - 1 do
								local aUnit = iPlot:GetUnit(i);
								aUnit:Kill(true, -1)
							end
						end
						local pCity = pPlot:GetPlotCity()
						local Population = pCity:GetPopulation()
						pCity:ChangePopulation(Population / 4)
						pCity:SetDamage(10000)
						pCity:ChangeResistanceTurns(Population / 2)
						Events.ClearHexHighlights()
						NeuvilletteSkill = 0
						Controls.Neuvillette_Activate:SetHide(true)
						save(pPlayer, "NeuvilletteJudgment", load(pPlayer, "NeuvilletteJudgment") - 300)
						Events.GameplayAlertMessage(Locale.ConvertTextKey("TXT_KEY_ALERT_NEUVILLETTE_JUDGMENT"))
						Events.AudioPlay2DSound("AS2D_NEUVILLETTE_JUDGMENT")
						local iTotalNeuvillette = load(pPlayer, "NeuvilletteJudgment")
						local NeuvilletteGauge = Locale.ConvertTextKey("TXT_KEY_NEUVILLETTE_JUDGMENT_PROGRESS_2", iTotalNeuvillette)
						local NeuvilletteGaugeToolTip = Locale.ConvertTextKey("TXT_KEY_NEUVILLETTE_JUDGMENT_PROGRESS")
						Controls.NeuvilletteButton:SetText(NeuvilletteGauge)
						Controls.NeuvilletteButton:LocalizeAndSetToolTip(NeuvilletteGaugeToolTip)
						Controls.NeuvilletteMeter:SetPercent(iTotalNeuvillette / 300)
					end
				end
			elseif uiMsg == MouseEvents.LButtonUp then
				if lButtonDown then
					lButtonDown = false
				end
			elseif uiMsg == MouseEvents.RButtonDown then
				rButtonDown = true
			elseif uiMsg == MouseEvents.RButtonUp then
				if rButtonDown and NeuvilletteSkill > 0 then
					rButtonDown = false
					NeuvilletteSkill = 0
					Events.ClearHexHighlights()
				end
			end
		end
		
		return false;
	end
	ContextPtr:SetInputHandler( InputHandler )

	function OnEnterCityScreen()
		for iPlayerID = 0, GameDefines.MAX_CIV_PLAYERS - 1 do
			local pPlayer = Players[iPlayerID]
			if Game.GetActivePlayer() == iPlayerID and pPlayer:GetCivilizationType() == Neuvillette then 
				Controls.NeuvilletteBackground:SetHide(true)
			end
		end
	end
	Events.SerialEventEnterCityScreen.Add(OnEnterCityScreen)

	function OnExitCityScreen()
		for iPlayerID = 0, GameDefines.MAX_CIV_PLAYERS - 1 do
			local pPlayer = Players[iPlayerID]
			if Game.GetActivePlayer() == iPlayerID and pPlayer:GetCivilizationType() == Neuvillette then 
				Controls.NeuvilletteBackground:SetHide(false)
			end
		end
	end
	Events.SerialEventExitCityScreen.Add(OnExitCityScreen)
end
