function GetSpellByName(name)
   local spid=nil;

   for j=1,1024 do 

       local n=GetSpellName(j,BOOKTYPE_SPELL);

       if n and strfind(n,name) then spid=j; break; end 

   end 

   return spid;

end

function Trueshot_Run()
   -- Wishmaster_Config["sp1"] = "Trueshot Aura";
   -- Wishmaster_Config["sp2"] = "Aspect of the Hawk";

   local z=0;
   local spts=GetSpellByName("Trueshot Aura");
   local sph=GetSpellByName("Aspect of the Hawk");

   for i=1,40 do t=UnitBuff("player",i) 
       
       if (t and strfind(t,"TrueShot")) then z=1 break end 

   end 

   if z==0 then 
	if spts and GetSpellCooldown(spts, BOOKTYPE_SPELL) < 1 then
            CastSpellByName("Trueshot Aura") 
            print("Trueshot Aura")
        end
   else 
	if sph and GetSpellCooldown(sph, BOOKTYPE_SPELL) < 1 then
            CastSpellByName("Aspect of the Hawk") 
            print("Aspect of the Hawk")
        end  
   end

end

-- About Lua debugger (which is in full package):
-- "Demo Lua Debugger.exe" is a debugger for in-game Lua. You could add a breakpoint into your Lua code by:
--    UnitXP("debug", "breakpoint");


-- if not self.autoSlot then self.autoSlot = GetActionSlot("Auto Shot") end

-- function reportActionButtons()
-- 	local lActionSlot = 0;
-- 	for lActionSlot = 1, 120 do
--		local lActionText = GetActionText(lActionSlot);
--		local lActionTexture = GetActionTexture(lActionSlot);
--		if lActionTexture then
--			local lMessage = "Slot " .. lActionSlot .. ": [" .. lActionTexture .. "]";
--			if lActionText then
--				lMessage = lMessage .. " \"" .. lActionText .. "\"";
--			end
--			DEFAULT_CHAT_FRAME:AddMessage(lMessage);
--		end
--	end
--end

--PallyPower_BlessingTalentSearch = "Improved Blessings";
--PallyPower_ConcentrationAuraTalentSearch = "Improved Concentration Aura";
--PallyPower_DevotionAuraTalentSearch = "Improved Devotion Aura";
--PallyPower_RetributionAuraTalentSearch = "Improved Retribution Aura";
--[[    local numTabs = GetNumTalentTabs();
    for t = 1, numTabs do
        local numTalents = GetNumTalents(t);
        for i = 1, numTalents do
            nameTalent, icon, iconx, icony, currRank, maxRank = GetTalentInfo(t, i);
            if string.find(nameTalent, PallyPower_BlessingTalentSearch) then -- Talent tab 3 - Talent number 1
				for id = 0, 1 do -- wisdom & might
					if (RankInfo[id]) then
						RankInfo[id]["talent"] = currRank
					end
				end
            --Improved Concentration Aura (Talent tab 1 - Talent number 10)
            elseif string.find(nameTalent, PallyPower_ConcentrationAuraTalentSearch) and currRank > 0 then
                for id, name in pairs(PallyPower_AuraID) do
                    if (id == 2) then
                        AuraRankInfo[id]["talent"] = currRank
                    end
                end
            --Improved Devotion Aura (Talent tab 2 - Talent number 1)
            elseif string.find(nameTalent, PallyPower_DevotionAuraTalentSearch) and currRank > 0 then
                for id, name in pairs(PallyPower_AuraID) do
                    if (id == 0) then
                        AuraRankInfo[id]["talent"] = currRank
                    end
                end
            --Improved Retribution Aura (Talent tab 3 - Talent number 6)
            elseif string.find(nameTalent, PallyPower_RetributionAuraTalentSearch) and currRank > 0 then
                for id, name in pairs(PallyPower_AuraID) do
                    if (id == 1) then
                        AuraRankInfo[id]["talent"] = currRank
                    end
                end
            end
        end
    end]]


    --[[
MoveAnything_HideList["MainMenuBar"] = {
	{ "MainMenuBarArtFrame", "BACKGROUND","ARTWORK"},
	{ "PetActionBarFrame", "OVERLAY"},
	{ "ShapeshiftBarFrame", "OVERLAY"},
	{ "MainMenuBar", "DISABLEMOUSE"},
	{ "BonusActionBarFrame", "OVERLAY", "DISABLEMOUSE"},
};
MoveAnything_HideList["MainMenuExpBar"] = {
	{ "MainMenuExpBar", "WH", "BORDER", "OVERLAY"},
	{ "ExhaustionTick", "FRAME"},
	{ "MainMenuExpBar", function( show )

MoveAnything_MoveOnlyWhenVisible["GroupLootFrame1"] = true;
MoveAnything_MoveOnlyWhenVisible["GroupLootFrame2"] = true;
MoveAnything_MoveOnlyWhenVisible["GroupLootFrame3"] = true;
MoveAnything_MoveOnlyWhenVisible["GroupLootFrame4"] = true;

MoveAnything_DefaultFrameList = {

	{ "MAOptions", "MoveAnything! Options Window" },

	{ "Separator", "**** Standard Party Frames ****" },
	{ "PlayerFrame", "Player" },
	{ "TargetFrame", "Target" },
	{ "PartyMemberFrame1", "Party Member 1" },
	{ "PartyMemberFrame2", "Party Member 2" },
	{ "PartyMemberFrame3", "Party Member 3" },
	{ "PartyMemberFrame4", "Party Member 4" },

	{ "Separator", "**** Pets ****" },
	{ "PetFrame", "Pet" },
	{ "PartyMemberFrame1PetFrame", "Party Pet 1" },
	{ "PartyMemberFrame2PetFrame", "Party Pet 2" },
	{ "PartyMemberFrame3PetFrame", "Party Pet 3" },
	{ "PartyMemberFrame4PetFrame", "Party Pet 4" },

	{ "Separator", "**** Bags ****" },
	{ "BagFrame1", "Bag 1 (Backpack)" },
	{ "BagFrame2", "Bag 2" },
	{ "BagFrame3", "Bag 3" },
	{ "BagFrame4", "Bag 4" },
	{ "BagFrame5", "Bag 5" },

	{ "Separator", "**** Bank ****" },
	{ "BankFrame", "Bank Teller Window" },
	{ "BankBagFrame1", "Bank Bag 1" },
	{ "BankBagFrame2", "Bank Bag 2" },
	{ "BankBagFrame3", "Bank Bag 3" },
	{ "BankBagFrame4", "Bank Bag 4" },
	{ "BankBagFrame5", "Bank Bag 5" },
	{ "BankBagFrame6", "Bank Bag 6" },

	{ "Separator", "**** Bottom Bar ****" },
	{ "MainMenuBar", "Bottom Bar" },
	{ "MainMenuBarArtFrame", "Art Frame" },
	{ "MainMenuBarMaxLevelBar", "Max Level Bar" },
	{ "MainMenuExpBar", "Experience Bar" },
	{ "MainMenuBarPerformanceBarFrame", "Lag Meter" },

	{ "Separator", "**** Action Button Bars ****" },
	{ "BasicActionButtonsMover", "Action Buttons" },
	{ "BasicActionButtonsVerticalMover", "Action Buttons (Vertical)" },
	{ "PetActionButtonsMover", "Pet Action Buttons" },
	{ "PetActionButtonsVerticalMover", "Pet Action Buttons (Vertical)" },
	{ "ShapeshiftButtonsMover", "Stance / Aura / Shapeshift Buttons" },
	{ "ShapeshiftButtonsVerticalMover", "Stance / Aura / Shapeshift (Vertical)" },

	{ "Separator", "**** Bag and Micro Button Bars ****" },
	{ "BagButtonsMover", "Bag Buttons" },
	{ "BagButtonsVerticalMover", "Bag Buttons (Vertical)" },
	{ "MicroButtonsMover", "Micro Buttons" },
	{ "MicroButtonsVerticalMover", "Micro Buttons (Vertical)" },

	{ "Separator", "**** Extra Action Bars ****" },
	{ "MultiBarBottomLeft", "Bottom Left ActionBar" },
	{ "MultiBarBottomRight", "Bottom Right ActionBar" },
	{ "MultiBarRight", "Right ActionBar" },
	{ "MultiBarLeft", "Right ActionBar 2" },

	{ "Separator", "**** Minimap and Minimap Hangers ****" },
	{ "MinimapCluster", "MiniMap" },
	{ "MinimapZoneTextButton", "MiniMap Zone Text" },
	{ "MinimapZoomIn", "MiniMap Zoom In Button" },
	{ "MinimapZoomOut", "MiniMap Zoom Out Button" },
	{ "MiniMapMailFrame", "MiniMap Mail Notification" },
	{ "MiniMapTrackingFrame", "MiniMap Tracking" },
	{ "MiniMapMeetingStoneFrame", "MiniMap Meeting Stone" },
	{ "MiniMapBattlefieldFrame", "MiniMap Battlefield" },
	{ "GameTimeFrame", "MiniMap Day-Night Clock" },

	{ "Separator", "**** Battle Grounds Elements ****" },
	{ "WorldStateAlwaysUpFrame", "Flags Frame"},
	{ "AlwaysUpFrame1", "Alliance Flag"},
	{ "AlwaysUpFrame2", "Horde Flag"},

	{ "Separator", "**** Dice Roll Frames ****" },
	{ "GroupLootFrame1", "Dice Roll Frame 1" },
	{ "GroupLootFrame2", "Dice Roll Frame 2" },
	{ "GroupLootFrame3", "Dice Roll Frame 3" },
	{ "GroupLootFrame4", "Dice Roll Frame 4" },

	{ "Separator", "**** Miscellaneous Screen Items ****" },
	{ "StaticPopup1", "Static Popup Frame" },
	{ "UIErrorsFrame", "UI Errors Frame" },
	{ "CastingBarFrame", "Casting Bar" },
	{ "BuffFrame", "Buff Window" },
	{ "TemporaryEnchantFrame", "Item buff/Debuff Windows" },
	{ "TooltipMover", "Tooltip" },
	{ "FramerateMover", "Framerate" },
	{ "DurabilityFrame", "Durability Damage Portrait" },
	{ "QuestWatchFrame", "Quest Tracker" },
	{ "QuestTimerFrame", "Quest Timer" },
	{ "ComboFrame", "Rogue Combo point counter" },
	{ "MirrorTimer1", "Breath/Fatigue Bar" },

	{ "Separator", "**** General Info Panel Placement ****" },
	{ "UIPanelMover1", "Info Panel 1" },
	{ "UIPanelMover2", "Info Panel 2" },

	{ "Separator", "**** Specific Info Panels ****" },
	{ "CharacterFrame", "Character / Pet / Reputation / Skills" },
	{ "TradeSkillFrame", "Trade Skills" },
	{ "InspectFrame", "Inspect View" },
	{ "SpellBookFrame", "Spell Book" },
	{ "LootFrame", "Looting Window" },
	{ "TaxiFrame", "Flight Paths" },
	{ "QuestLogFrame", "Quest Log" },
	{ "MerchantFrame", "Merchant Inventory" },
	{ "TradeFrame", "Trade Window" },
	{ "FriendsFrame", "Friends / Who / Guild / Raid" },
	{ "MacroFrame", "Macros" },
	{ "MailFrame", "Mailbox" },
	{ "TalentFrame", "Talent Tree" },
	{ "PetStableFrame", "Pet Stable" },
	{ "AuctionFrame", "Auction House" },
}

    ]]

--[[local frm = CreateFrame("Frame","WishmasterTestFrame",UIParent)
frm:SetPoint("CENTER",UIParent,0,0)
frm:SetWidth(100)
frm:SetHeight(100)
frm:SetToplevel(true)
--frm:SetBackdropColor(0.0, 0.0, 0.0, 0.5)
frm:SetBackdrop({
		bgFile = "Interface\\DialogFrame\\UI-DialogBox-Background",
		tile = true,
		tileSize = 16,
		edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
		edgeSize = 16,
		insets = { left = 4, right = 4, top = 4, bottom = 4 },
    })
frm:Show()]]