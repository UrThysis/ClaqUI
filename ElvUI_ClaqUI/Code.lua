--Don't worry about this
local addon, ns = ...
local Version = GetAddOnMetadata(addon, "Version")

--Cache Lua / WoW API
local format = string.format
local GetCVarBool = GetCVarBool
local ReloadUI = ReloadUI
local StopMusic = StopMusic

-- These are things we do not cache
-- GLOBALS: PluginInstallStepComplete, PluginInstallFrame

--Change this line and use a unique name for your plugin.
local MyPluginName = "ClaqUI"

--Create references to ElvUI internals
local E, L, V, P, G = unpack(ElvUI)

--Create reference to LibElvUIPlugin
local EP = LibStub("LibElvUIPlugin-1.0")

--Create a new ElvUI module so ElvUI can handle initialization when ready
local ClaqUI = E:NewModule(MyPluginName, "AceHook-3.0", "AceEvent-3.0", "AceTimer-3.0");

--This function will hold your layout settings
local function SetupLayout(layout)
	--[[
	--	PUT YOUR EXPORTED PROFILE/SETTINGS BELOW HERE
	--]]
    if E.db["movers"] == nil then E.db["movers"] = {} end

    -- Windtools --
    E.db["WT"]["announcement"]["goodbye"]["enable"] = false
    E.db["WT"]["announcement"]["thanks"]["enable"] = false
    E.db["WT"]["announcement"]["utility"]["enable"] = false
    E.db["WT"]["announcement"]["utility"]["spells"]["feasts"]["text"] = " %player% puts %spell% - Eat mofo!"
    E.db["WT"]["combat"]["combatAlert"]["enable"] = false
    E.db["WT"]["combat"]["raidMarkers"]["enable"] = false
    E.db["WT"]["item"]["extraItemsBar"]["enable"] = false
    E.db["WT"]["misc"]["gameBar"]["enable"] = false
    E.db["WT"]["quest"]["paragonReputation"]["enable"] = false
    E.db["WT"]["quest"]["switchButtons"]["enable"] = false
    E.db["WT"]["quest"]["turnIn"]["enable"] = false
    E.db["WT"]["social"]["chatBar"]["enable"] = false
    E.db["WT"]["social"]["emote"]["enable"] = false
    

    -- Action bars --
    E.db["actionbar"]["bar1"]["buttonHeight"] = 30
    E.db["actionbar"]["bar1"]["buttonSize"] = 40
    E.db["actionbar"]["bar1"]["buttonSpacing"] = 0
    E.db["actionbar"]["bar1"]["buttonsPerRow"] = 6
    E.db["actionbar"]["bar1"]["buttons"] = 12
    E.db["actionbar"]["bar1"]["countFont"] = "Accidental Presidency"
    E.db["actionbar"]["bar1"]["countFontOutline"] = "OUTLINE"
    E.db["actionbar"]["bar1"]["countFontSize"] = 18
    E.db["actionbar"]["bar1"]["countTextPosition"] = "TOP"
    E.db["actionbar"]["bar1"]["hotkeyFont"] = "Accidental Presidency"
    E.db["actionbar"]["bar1"]["hotkeyFontOutline"] = "OUTLINE"
    E.db["actionbar"]["bar1"]["hotkeyFontSize"] = 18
    E.db["actionbar"]["bar1"]["hotkeyTextPosition"] = "TOPLEFT"
    E.db["actionbar"]["bar1"]["hotkeyTextXOffset"] = 4
    E.db["actionbar"]["bar1"]["hotkeyTextYOffset"] = -4
    E.db["actionbar"]["bar1"]["keepSizeRatio"] = false
    E.db["actionbar"]["bar1"]["macroFont"] = "Accidental Presidency"
    E.db["actionbar"]["bar1"]["macroFontOutline"] = "OUTLINE"
    E.db["actionbar"]["bar1"]["macroFontSize"] = 18
    E.db["actionbar"]["bar1"]["macroTextPosition"] = "BOTTOM"
    E.db["actionbar"]["bar1"]["macroTextYOffset"] = 0
    E.db["actionbar"]["bar1"]["macrotext"] = true
    E.db["actionbar"]["bar1"]["mouseover"] = true
    E.db["actionbar"]["bar1"]["point"] = "TOPLEFT"
    E.db["actionbar"]["bar10"]["countFont"] = "Accidental Presidency"
    E.db["actionbar"]["bar10"]["countFontOutline"] = "OUTLINE"
    E.db["actionbar"]["bar10"]["countFontSize"] = 18
    E.db["actionbar"]["bar10"]["countTextPosition"] = "TOP"
    E.db["actionbar"]["bar10"]["hotkeyFont"] = "Accidental Presidency"
    E.db["actionbar"]["bar10"]["hotkeyFontOutline"] = "OUTLINE"
    E.db["actionbar"]["bar10"]["hotkeyFontSize"] = 18
    E.db["actionbar"]["bar10"]["hotkeyTextPosition"] = "TOPLEFT"
    E.db["actionbar"]["bar10"]["hotkeyTextXOffset"] = 4
    E.db["actionbar"]["bar10"]["hotkeyTextYOffset"] = -4
    E.db["actionbar"]["bar10"]["macroFont"] = "Accidental Presidency"
    E.db["actionbar"]["bar10"]["macroFontOutline"] = "OUTLINE"
    E.db["actionbar"]["bar10"]["macroFontSize"] = 18
    E.db["actionbar"]["bar10"]["macroTextPosition"] = "BOTTOM"
    E.db["actionbar"]["bar10"]["macroTextYOffset"] = 0
    E.db["actionbar"]["bar2"]["buttonSize"] = 25
    E.db["actionbar"]["bar2"]["buttonSpacing"] = 1
    E.db["actionbar"]["bar2"]["buttons"] = 6
    E.db["actionbar"]["bar2"]["countFont"] = "Accidental Presidency"
    E.db["actionbar"]["bar2"]["countFontOutline"] = "OUTLINE"
    E.db["actionbar"]["bar2"]["countFontSize"] = 18
    E.db["actionbar"]["bar2"]["hotkeyFont"] = "Accidental Presidency"
    E.db["actionbar"]["bar2"]["hotkeyFontOutline"] = "OUTLINE"
    E.db["actionbar"]["bar2"]["hotkeyFontSize"] = 18
    E.db["actionbar"]["bar2"]["hotkeyTextPosition"] = "TOPLEFT"
    E.db["actionbar"]["bar2"]["hotkeyTextXOffset"] = 4
    E.db["actionbar"]["bar2"]["hotkeyTextYOffset"] = -4
    E.db["actionbar"]["bar2"]["hotkeytext"] = false
    E.db["actionbar"]["bar2"]["macroFont"] = "Accidental Presidency"
    E.db["actionbar"]["bar2"]["macroFontOutline"] = "OUTLINE"
    E.db["actionbar"]["bar2"]["macroFontSize"] = 18
    E.db["actionbar"]["bar2"]["macroTextPosition"] = "BOTTOM"
    E.db["actionbar"]["bar2"]["macroTextYOffset"] = 0
    E.db["actionbar"]["bar2"]["visibility"] = "[petbattle] hide; show"
    E.db["actionbar"]["bar3"]["buttonHeight"] = 30
    E.db["actionbar"]["bar3"]["buttonSize"] = 40
    E.db["actionbar"]["bar3"]["buttonSpacing"] = 0
    E.db["actionbar"]["bar3"]["buttons"] = 12
    E.db["actionbar"]["bar3"]["buttonsPerRow"] = 3
    E.db["actionbar"]["bar3"]["countFont"] = "Accidental Presidency"
    E.db["actionbar"]["bar3"]["countFontOutline"] = "OUTLINE"
    E.db["actionbar"]["bar3"]["countFontSize"] = 18
    E.db["actionbar"]["bar3"]["countTextPosition"] = "TOP"
    E.db["actionbar"]["bar3"]["hotkeyFont"] = "Accidental Presidency"
    E.db["actionbar"]["bar3"]["hotkeyFontOutline"] = "OUTLINE"
    E.db["actionbar"]["bar3"]["hotkeyFontSize"] = 18
    E.db["actionbar"]["bar3"]["hotkeyTextPosition"] = "TOPLEFT"
    E.db["actionbar"]["bar3"]["hotkeyTextXOffset"] = 4
    E.db["actionbar"]["bar3"]["hotkeyTextYOffset"] = -4
    E.db["actionbar"]["bar3"]["keepSizeRatio"] = false
    E.db["actionbar"]["bar3"]["macroFont"] = "Accidental Presidency"
    E.db["actionbar"]["bar3"]["macroFontOutline"] = "OUTLINE"
    E.db["actionbar"]["bar3"]["macroFontSize"] = 18
    E.db["actionbar"]["bar3"]["macroTextPosition"] = "BOTTOM"
    E.db["actionbar"]["bar3"]["macroTextYOffset"] = 0
    E.db["actionbar"]["bar3"]["mouseover"] = true
    E.db["actionbar"]["bar3"]["visibility"] = "[petbattle] hide; show"
    E.db["actionbar"]["bar4"]["backdrop"] = false
    E.db["actionbar"]["bar4"]["buttonHeight"] = 30
    E.db["actionbar"]["bar4"]["buttonSize"] = 40
    E.db["actionbar"]["bar4"]["buttonSpacing"] = 0
    E.db["actionbar"]["bar4"]["buttonsPerRow"] = 3
    E.db["actionbar"]["bar4"]["countFont"] = "Accidental Presidency"
    E.db["actionbar"]["bar4"]["countFontOutline"] = "OUTLINE"
    E.db["actionbar"]["bar4"]["countFontSize"] = 18
    E.db["actionbar"]["bar4"]["countTextPosition"] = "TOP"
    E.db["actionbar"]["bar4"]["hotkeyFont"] = "Accidental Presidency"
    E.db["actionbar"]["bar4"]["hotkeyFontOutline"] = "OUTLINE"
    E.db["actionbar"]["bar4"]["hotkeyFontSize"] = 18
    E.db["actionbar"]["bar4"]["hotkeyTextPosition"] = "TOPLEFT"
    E.db["actionbar"]["bar4"]["hotkeyTextXOffset"] = 4
    E.db["actionbar"]["bar4"]["hotkeyTextYOffset"] = -4
    E.db["actionbar"]["bar4"]["keepSizeRatio"] = false
    E.db["actionbar"]["bar4"]["macroFont"] = "Accidental Presidency"
    E.db["actionbar"]["bar4"]["macroFontOutline"] = "OUTLINE"
    E.db["actionbar"]["bar4"]["macroFontSize"] = 18
    E.db["actionbar"]["bar4"]["macroTextPosition"] = "BOTTOM"
    E.db["actionbar"]["bar4"]["macroTextYOffset"] = 0
    E.db["actionbar"]["bar4"]["mouseover"] = true
    E.db["actionbar"]["bar4"]["visibility"] = "[petbattle] hide; show"
    E.db["actionbar"]["bar5"]["buttonHeight"] = 30
    E.db["actionbar"]["bar5"]["buttonSize"] = 40
    E.db["actionbar"]["bar5"]["buttonSpacing"] = 0
    E.db["actionbar"]["bar5"]["buttonsPerRow"] = 6
    E.db["actionbar"]["bar5"]["buttons"] = 12
    E.db["actionbar"]["bar5"]["countFont"] = "Accidental Presidency"
    E.db["actionbar"]["bar5"]["countFontOutline"] = "OUTLINE"
    E.db["actionbar"]["bar5"]["countFontSize"] = 18
    E.db["actionbar"]["bar5"]["countTextPosition"] = "TOP"
    E.db["actionbar"]["bar5"]["hotkeyFont"] = "Accidental Presidency"
    E.db["actionbar"]["bar5"]["hotkeyFontOutline"] = "OUTLINE"
    E.db["actionbar"]["bar5"]["hotkeyFontSize"] = 18
    E.db["actionbar"]["bar5"]["hotkeyTextPosition"] = "TOPLEFT"
    E.db["actionbar"]["bar5"]["hotkeyTextXOffset"] = 4
    E.db["actionbar"]["bar5"]["hotkeyTextYOffset"] = -4
    E.db["actionbar"]["bar5"]["keepSizeRatio"] = false
    E.db["actionbar"]["bar5"]["macroFont"] = "Accidental Presidency"
    E.db["actionbar"]["bar5"]["macroFontOutline"] = "OUTLINE"
    E.db["actionbar"]["bar5"]["macroFontSize"] = 18
    E.db["actionbar"]["bar5"]["macroTextPosition"] = "BOTTOM"
    E.db["actionbar"]["bar5"]["macroTextYOffset"] = 0
    E.db["actionbar"]["bar5"]["macrotext"] = true
    E.db["actionbar"]["bar5"]["mouseover"] = true
    E.db["actionbar"]["bar5"]["point"] = "TOPLEFT"
    E.db["actionbar"]["bar5"]["visibility"] = "[petbattle] hide; show"
    E.db["actionbar"]["bar6"]["buttonHeight"] = 30
    E.db["actionbar"]["bar6"]["buttonSize"] = 40
    E.db["actionbar"]["bar6"]["buttonSpacing"] = 0
    E.db["actionbar"]["bar6"]["buttonsPerRow"] = 6
    E.db["actionbar"]["bar6"]["buttons"] = 12
    E.db["actionbar"]["bar6"]["countFont"] = "Accidental Presidency"
    E.db["actionbar"]["bar6"]["countFontOutline"] = "OUTLINE"
    E.db["actionbar"]["bar6"]["countFontSize"] = 18
    E.db["actionbar"]["bar6"]["countTextPosition"] = "TOP"
    E.db["actionbar"]["bar6"]["hotkeyFont"] = "Accidental Presidency"
    E.db["actionbar"]["bar6"]["hotkeyFontOutline"] = "OUTLINE"
    E.db["actionbar"]["bar6"]["hotkeyFontSize"] = 18
    E.db["actionbar"]["bar6"]["hotkeyTextPosition"] = "TOPLEFT"
    E.db["actionbar"]["bar6"]["hotkeyTextXOffset"] = 4
    E.db["actionbar"]["bar6"]["hotkeyTextYOffset"] = -4
    E.db["actionbar"]["bar6"]["keepSizeRatio"] = false
    E.db["actionbar"]["bar6"]["macroFont"] = "Accidental Presidency"
    E.db["actionbar"]["bar6"]["macroFontOutline"] = "OUTLINE"
    E.db["actionbar"]["bar6"]["macroFontSize"] = 18
    E.db["actionbar"]["bar6"]["macroTextPosition"] = "BOTTOM"
    E.db["actionbar"]["bar6"]["macroTextYOffset"] = 0
    E.db["actionbar"]["bar6"]["macrotext"] = true
    E.db["actionbar"]["bar6"]["mouseover"] = true
    E.db["actionbar"]["bar6"]["point"] = "TOPLEFT"
    E.db["actionbar"]["bar6"]["visibility"] = "[petbattle] hide; show"
    E.db["actionbar"]["bar7"]["countFont"] = "Accidental Presidency"
    E.db["actionbar"]["bar7"]["countFontOutline"] = "OUTLINE"
    E.db["actionbar"]["bar7"]["countFontSize"] = 18
    E.db["actionbar"]["bar7"]["countTextPosition"] = "TOP"
    E.db["actionbar"]["bar7"]["hotkeyFont"] = "Accidental Presidency"
    E.db["actionbar"]["bar7"]["hotkeyFontOutline"] = "OUTLINE"
    E.db["actionbar"]["bar7"]["hotkeyFontSize"] = 18
    E.db["actionbar"]["bar7"]["hotkeyTextPosition"] = "TOPLEFT"
    E.db["actionbar"]["bar7"]["hotkeyTextXOffset"] = 4
    E.db["actionbar"]["bar7"]["hotkeyTextYOffset"] = -4
    E.db["actionbar"]["bar7"]["macroFont"] = "Accidental Presidency"
    E.db["actionbar"]["bar7"]["macroFontOutline"] = "OUTLINE"
    E.db["actionbar"]["bar7"]["macroFontSize"] = 18
    E.db["actionbar"]["bar7"]["macroTextPosition"] = "BOTTOM"
    E.db["actionbar"]["bar7"]["macroTextYOffset"] = 0
    E.db["actionbar"]["bar8"]["countFont"] = "Accidental Presidency"
    E.db["actionbar"]["bar8"]["countFontOutline"] = "OUTLINE"
    E.db["actionbar"]["bar8"]["countFontSize"] = 18
    E.db["actionbar"]["bar8"]["countTextPosition"] = "TOP"
    E.db["actionbar"]["bar8"]["hotkeyFont"] = "Accidental Presidency"
    E.db["actionbar"]["bar8"]["hotkeyFontOutline"] = "OUTLINE"
    E.db["actionbar"]["bar8"]["hotkeyFontSize"] = 18
    E.db["actionbar"]["bar8"]["hotkeyTextPosition"] = "TOPLEFT"
    E.db["actionbar"]["bar8"]["hotkeyTextXOffset"] = 4
    E.db["actionbar"]["bar8"]["hotkeyTextYOffset"] = -4
    E.db["actionbar"]["bar8"]["macroFont"] = "Accidental Presidency"
    E.db["actionbar"]["bar8"]["macroFontOutline"] = "OUTLINE"
    E.db["actionbar"]["bar8"]["macroFontSize"] = 18
    E.db["actionbar"]["bar8"]["macroTextPosition"] = "BOTTOM"
    E.db["actionbar"]["bar8"]["macroTextYOffset"] = 0
    E.db["actionbar"]["bar9"]["countFont"] = "Accidental Presidency"
    E.db["actionbar"]["bar9"]["countFontOutline"] = "OUTLINE"
    E.db["actionbar"]["bar9"]["countFontSize"] = 18
    E.db["actionbar"]["bar9"]["countTextPosition"] = "TOP"
    E.db["actionbar"]["bar9"]["hotkeyFont"] = "Accidental Presidency"
    E.db["actionbar"]["bar9"]["hotkeyFontOutline"] = "OUTLINE"
    E.db["actionbar"]["bar9"]["hotkeyFontSize"] = 18
    E.db["actionbar"]["bar9"]["hotkeyTextPosition"] = "TOPLEFT"
    E.db["actionbar"]["bar9"]["hotkeyTextXOffset"] = 4
    E.db["actionbar"]["bar9"]["hotkeyTextYOffset"] = -4
    E.db["actionbar"]["bar9"]["macroFont"] = "Accidental Presidency"
    E.db["actionbar"]["bar9"]["macroFontOutline"] = "OUTLINE"
    E.db["actionbar"]["bar9"]["macroFontSize"] = 18
    E.db["actionbar"]["bar9"]["macroTextPosition"] = "BOTTOM"
    E.db["actionbar"]["bar9"]["macroTextYOffset"] = 0
    E.db["actionbar"]["barPet"]["backdrop"] = false
    E.db["actionbar"]["barPet"]["buttonHeight"] = 20
    E.db["actionbar"]["barPet"]["buttonSize"] = 30
    E.db["actionbar"]["barPet"]["buttonSpacing"] = 0
    E.db["actionbar"]["barPet"]["buttonsPerRow"] = 5
    E.db["actionbar"]["barPet"]["countFont"] = "Accidental Presidency"
    E.db["actionbar"]["barPet"]["countFontOutline"] = "OUTLINE"
    E.db["actionbar"]["barPet"]["countFontSize"] = 18
    E.db["actionbar"]["barPet"]["countTextPosition"] = "TOP"
    E.db["actionbar"]["barPet"]["hotkeyFont"] = "Accidental Presidency"
    E.db["actionbar"]["barPet"]["hotkeyFontOutline"] = "OUTLINE"
    E.db["actionbar"]["barPet"]["hotkeyFontSize"] = 12
    E.db["actionbar"]["barPet"]["hotkeyTextPosition"] = "TOPLEFT"
    E.db["actionbar"]["barPet"]["hotkeyTextXOffset"] = 4
    E.db["actionbar"]["barPet"]["hotkeyTextYOffset"] = -4
    E.db["actionbar"]["barPet"]["keepSizeRatio"] = false
    E.db["actionbar"]["barPet"]["mouseover"] = true
    E.db["actionbar"]["countTextPosition"] = "TOP"
    E.db["actionbar"]["extraActionButton"]["clean"] = true
    E.db["actionbar"]["extraActionButton"]["hotkeyFont"] = "Accidental Presidency"
    E.db["actionbar"]["extraActionButton"]["hotkeyFontOutline"] = "OUTLINE"
    E.db["actionbar"]["extraActionButton"]["hotkeyFontSize"] = 18
    E.db["actionbar"]["extraActionButton"]["hotkeyTextPosition"] = "TOPLEFT"
    E.db["actionbar"]["extraActionButton"]["hotkeyTextXOffset"] = 4
    E.db["actionbar"]["extraActionButton"]["hotkeyTextYOffset"] = -4
    E.db["actionbar"]["font"] = "Accidental Presidency"
    E.db["actionbar"]["fontOutline"] = "OUTLINE"
    E.db["actionbar"]["fontSize"] = 18
    E.db["actionbar"]["hotkeyTextPosition"] = "TOPLEFT"
    E.db["actionbar"]["macroTextPosition"] = "BOTTOM"
    E.db["actionbar"]["microbar"]["buttonHeight"] = 30
    E.db["actionbar"]["microbar"]["buttonSize"] = 30
    E.db["actionbar"]["microbar"]["enabled"] = true
    E.db["actionbar"]["microbar"]["mouseover"] = true
    E.db["actionbar"]["stanceBar"]["hotkeyFont"] = "Accidental Presidency"
    E.db["actionbar"]["stanceBar"]["hotkeyFontOutline"] = "OUTLINE"
    E.db["actionbar"]["stanceBar"]["hotkeyFontSize"] = 18
    E.db["actionbar"]["stanceBar"]["hotkeyTextPosition"] = "TOPLEFT"
    E.db["actionbar"]["stanceBar"]["hotkeyTextXOffset"] = 4
    E.db["actionbar"]["stanceBar"]["hotkeyTextYOffset"] = -4
    E.db["actionbar"]["stanceBar"]["mouseover"] = true
    E.db["actionbar"]["vehicleExitButton"]["hotkeyFont"] = "Accidental Presidency"
    E.db["actionbar"]["vehicleExitButton"]["hotkeyFontOutline"] = "OUTLINE"
    E.db["actionbar"]["vehicleExitButton"]["hotkeyFontSize"] = 18
    E.db["actionbar"]["vehicleExitButton"]["hotkeyTextPosition"] = "TOPLEFT"
    E.db["actionbar"]["vehicleExitButton"]["hotkeyTextXOffset"] = 4
    E.db["actionbar"]["vehicleExitButton"]["hotkeyTextYOffset"] = -4
    E.db["actionbar"]["zoneActionButton"]["clean"] = true

    -- Auras -- 
    E.db["auras"]["buffs"]["countFont"] = "Accidental Presidency"
    E.db["auras"]["buffs"]["countFontOutline"] = "OUTLINE"
    E.db["auras"]["buffs"]["countFontSize"] = 18
    E.db["auras"]["buffs"]["size"] = 34
    E.db["auras"]["buffs"]["timeFont"] = "Accidental Presidency"
    E.db["auras"]["buffs"]["timeFontOutline"] = "OUTLINE"
    E.db["auras"]["buffs"]["timeFontSize"] = 20
    E.db["auras"]["debuffs"]["countFont"] = "Accidental Presidency"
    E.db["auras"]["debuffs"]["countFontOutline"] = "OUTLINE"
    E.db["auras"]["debuffs"]["countFontSize"] = 16
    E.db["auras"]["debuffs"]["size"] = 40
    E.db["auras"]["debuffs"]["timeFont"] = "Accidental Presidency"
    E.db["auras"]["debuffs"]["timeFontOutline"] = "OUTLINE"
    E.db["auras"]["debuffs"]["timeFontSize"] = 16
    
    --Bags - Disabled !NOTE TO USE BAGNON! --
    E.db["bags"]["bagSize"] = 42
    E.db["bags"]["bagWidth"] = 474
    E.db["bags"]["bankSize"] = 42
    E.db["bags"]["bankWidth"] = 474
    E.db["bags"]["countFont"] = "Accidental Presidency"
    E.db["bags"]["countFontSize"] = 16
    E.db["bags"]["itemLevelCustomColorEnable"] = true
    E.db["bags"]["itemLevelFont"] = "Accidental Presidency"
    E.db["bags"]["itemLevelFontSize"] = 16
    E.db["bags"]["scrapIcon"] = true
    E.db["bags"]["split"]["bag1"] = true
    E.db["bags"]["split"]["bag2"] = true
    E.db["bags"]["split"]["bag3"] = true
    E.db["bags"]["split"]["bag4"] = true
    E.db["bags"]["split"]["bagSpacing"] = 7
    E.db["bags"]["split"]["player"] = true

    -- Chat --
    E.db["chat"]["channelAlerts"]["WHISPER"] = "Xylophone"
    E.db["chat"]["copyChatLines"] = true
    E.db["chat"]["font"] = "Accidental Presidency"
    E.db["chat"]["fontSize"] = 16
    E.db["chat"]["inactivityTimer"] = 20
    E.db["chat"]["panelBackdrop"] = "HIDEBOTH"
    E.db["chat"]["panelHeight"] = 245
    E.db["chat"]["panelWidth"] = 472
    E.db["chat"]["tabFont"] = "Accidental Presidency"
    E.db["chat"]["tabFontOutline"] = "OUTLINE"
    E.db["chat"]["tabFontSize"] = 16
    E.db["chat"]["tabSelector"] = "ARROW"
    E.db["chat"]["tabSelectorColor"]["b"] = 1
    E.db["chat"]["tabSelectorColor"]["g"] = 0.67843137254902
    E.db["chat"]["tabSelectorColor"]["r"] = 0
    E.db["chat"]["timeStampFormat"] = "%H:%M "
    E.db["chat"]["useCustomTimeColor"] = false
    E.db["convertPages"] = true

    --Databars  & Datatexts --
    E.db["cooldown"]["fonts"]["font"] = "Accidental Presidency"
    E.db["databars"]["azerite"]["enable"] = false
    E.db["databars"]["experience"]["enable"] = false
    E.db["databars"]["honor"]["enable"] = false
    E.db["databars"]["threat"]["enable"] = false
    E.db["databars"]["threat"]["height"] = 24
    E.db["databars"]["threat"]["width"] = 472
    
    E.db["datatexts"]["font"] = "Accidental Presidency"
    E.db["datatexts"]["fontSize"] = 16
    E.db["datatexts"]["panels"]["LeftChatDataPanel"][3] = "Friends"
    E.db["datatexts"]["panels"]["LeftChatDataPanel"]["panelTransparency"] = true
    E.db["datatexts"]["panels"]["MinimapPanel"]["enable"] = false
    E.db["datatexts"]["panels"]["MinimapPanel"]["panelTransparency"] = true
    E.db["datatexts"]["panels"]["Right Panel Replacement"][1] = "System"
    E.db["datatexts"]["panels"]["Right Panel Replacement"][2] = "Time"
    E.db["datatexts"]["panels"]["Right Panel Replacement"][3] = "Gold"
    E.db["datatexts"]["panels"]["Right Panel Replacement"]["enable"] = true
    E.db["datatexts"]["panels"]["RightChatDataPanel"]["enable"] = false
    E.db["datatexts"]["panels"]["RightChatDataPanel"]["panelTransparency"] = true


    --General Settings--
    E.db["general"]["altPowerBar"]["font"] = "Accidental Presidency"
    E.db["general"]["altPowerBar"]["fontSize"] = 16
    E.db["general"]["altPowerBar"]["smoothbars"] = true
    E.db["general"]["altPowerBar"]["statusBar"] = "Solid"
    E.db["general"]["altPowerBar"]["statusBarColor"]["b"] = 0.88627450980392
    E.db["general"]["altPowerBar"]["statusBarColor"]["g"] = 0.44313725490196
    E.db["general"]["altPowerBar"]["statusBarColor"]["r"] = 0.22352941176471
    E.db["general"]["autoRepair"] = "GUILD"
    E.db["general"]["backdropcolor"]["b"] = 0.066666666666667
    E.db["general"]["backdropcolor"]["g"] = 0.066666666666667
    E.db["general"]["backdropcolor"]["r"] = 0.066666666666667
    E.db["general"]["backdropfadecolor"]["a"] = 0.27957034111023
    E.db["general"]["backdropfadecolor"]["b"] = 0.058823529411765
    E.db["general"]["backdropfadecolor"]["g"] = 0.058823529411765
    E.db["general"]["backdropfadecolor"]["r"] = 0.058823529411765
    E.db["general"]["bonusObjectivePosition"] = "AUTO"
    E.db["general"]["bottomPanel"] = false
    E.db["general"]["customGlow"]["style"] = "Autocast Shine"
    E.db["general"]["font"] = "Accidental Presidency"
    E.db["general"]["fontSize"] = 16
    E.db["general"]["interruptAnnounce"] = "PARTY"
    E.db["general"]["itemLevel"]["itemLevelFont"] = "Accidental Presidency"
    E.db["general"]["itemLevel"]["itemLevelFontSize"] = 14
    E.db["general"]["lootRoll"]["nameFont"] = "Accidental Presidency"
    E.db["general"]["lootRoll"]["nameFontSize"] = 16
    E.db["general"]["lootRoll"]["statusBarTexture"] = "Solid"
    E.db["general"]["minimap"]["icons"]["mail"]["yOffset"] = -30
    E.db["general"]["minimap"]["locationFont"] = "Accidental Presidency"
    E.db["general"]["minimap"]["locationFontSize"] = 24
    E.db["general"]["minimap"]["size"] = 220
    E.db["general"]["objectiveFrameAutoHideInKeystone"] = true
    E.db["general"]["objectiveFrameHeight"] = 600
    E.db["general"]["talkingHeadFrameScale"] = 1
    E.db["general"]["totems"]["growthDirection"] = "HORIZONTAL"
    E.db["general"]["totems"]["size"] = 50
    E.db["general"]["totems"]["spacing"] = 8
    E.db["general"]["valuecolor"]["b"] = 0.44705784320831
    E.db["general"]["valuecolor"]["g"] = 0.82744914293289
    E.db["general"]["valuecolor"]["r"] = 0.66666519641876
    E.db["layoutSetting"] = "dpsCaster"

    --Anchors --

    E.db["movers"]["AlertFrameMover"] = "TOPLEFT,UIParent,TOPLEFT,389,-232"
    E.db["movers"]["AltPowerBarMover"] = "TOP,UIParent,TOP,0,-4"
    E.db["movers"]["ArenaHeaderMover"] = "TOPRIGHT,UIParent,TOPRIGHT,-417,-443"
    E.db["movers"]["AzeriteBarMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-3,-246"
    E.db["movers"]["BNETMover"] = "TOPLEFT,UIParent,TOPLEFT,206,-4"
    E.db["movers"]["BelowMinimapContainerMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-76,-228"
    E.db["movers"]["BossBannerMover"] = "TOP,ElvUIParent,TOP,0,-126"
    E.db["movers"]["BossButton"] = "BOTTOM,ElvUIParent,BOTTOM,-333,68"
    E.db["movers"]["BossHeaderMover"] = "TOPRIGHT,UIParent,TOPRIGHT,-355,-268"
    E.db["movers"]["BuffsMover"] = "TOPRIGHT,UIParent,TOPRIGHT,-290,-4"
    E.db["movers"]["DTPanelRight Panel ReplacementMover"] = "BOTTOMLEFT,UIParent,BOTTOMLEFT,4,4"
    E.db["movers"]["DebuffsMover"] = "TOPRIGHT,UIParent,TOPRIGHT,-290,-174"
    E.db["movers"]["DurabilityFrameMover"] = "TOPLEFT,ElvUIParent,TOPLEFT,141,-4"
    E.db["movers"]["ElvAB_1"] = "BOTTOM,UIParent,BOTTOM,0,4"
    E.db["movers"]["ElvAB_10"] = "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-4,400"
    E.db["movers"]["ElvAB_2"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,638,391"
    E.db["movers"]["ElvAB_3"] = "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-656,5"
    E.db["movers"]["ElvAB_4"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,655,3"
    E.db["movers"]["ElvAB_5"] = "BOTTOM,ElvUIParent,BOTTOM,241,4"
    E.db["movers"]["ElvAB_6"] = "BOTTOM,ElvUIParent,BOTTOM,-241,4"
    E.db["movers"]["ElvAB_7"] = "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-4,298"
    E.db["movers"]["ElvAB_8"] = "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-4,332"
    E.db["movers"]["ElvAB_9"] = "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-4,366"
    E.db["movers"]["ElvUF_AssistMover"] = "TOPLEFT,ElvUIParent,TOPLEFT,4,-249"
    E.db["movers"]["ElvUF_FocusCastbarMover"] = "TOPLEFT,ElvUF_Focus,BOTTOMLEFT,0,-1"
    E.db["movers"]["ElvUF_FocusMover"] = "BOTTOM,UIParent,BOTTOM,0,123"
    E.db["movers"]["ElvUF_PartyMover"] = "TOPLEFT,UIParent,TOPLEFT,373,-508"
    E.db["movers"]["ElvUF_PetCastbarMover"] = "TOPLEFT,ElvUF_Pet,BOTTOMLEFT,0,-1"
    E.db["movers"]["ElvUF_PetMover"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,483,420"
    E.db["movers"]["ElvUF_PlayerCastbarMover"] = "BOTTOM,ElvUIParent,BOTTOM,0,337"
    E.db["movers"]["ElvUF_PlayerMover"] = "BOTTOM,ElvUIParent,BOTTOM,-350,420"
    E.db["movers"]["ElvUF_Raid40Mover"] = "TOPLEFT,UIParent,TOPLEFT,4,-519"
    E.db["movers"]["ElvUF_RaidMover"] = "TOPLEFT,UIParent,TOPLEFT,4,-513"
    E.db["movers"]["ElvUF_TankMover"] = "TOPLEFT,ElvUIParent,TOPLEFT,4,-187"
    E.db["movers"]["ElvUF_TargetCastbarMover"] = "BOTTOM,UIParent,BOTTOM,351,394"
    E.db["movers"]["ElvUF_TargetMover"] = "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-636,420"
    E.db["movers"]["ElvUF_TargetTargetMover"] = "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-483,420"
    E.db["movers"]["ElvUIBagMover"] = "BOTTOMRIGHT,UIParent,BOTTOMRIGHT,-337,223"
    E.db["movers"]["EventToastMover"] = "TOP,ElvUIParent,TOP,0,-150"
    E.db["movers"]["ExperienceBarMover"] = "TOP,UIParent,TOP,0,-4"
    E.db["movers"]["GMMover"] = "TOPLEFT,ElvUIParent,TOPLEFT,250,-6"
    E.db["movers"]["HonorBarMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-2,-251"
    E.db["movers"]["LeftChatMover"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,4,27"
    E.db["movers"]["LootFrameMover"] = "BOTTOM,UIParent,BOTTOM,0,568"
    E.db["movers"]["LossControlMover"] = "TOP,UIParent,TOP,0,-591"
    E.db["movers"]["MawBuffsBelowMinimapMover"] = "TOPLEFT,UIParent,TOPLEFT,460,-4"
    E.db["movers"]["MicrobarMover"] = "BOTTOMRIGHT,UIParent,BOTTOMRIGHT,-4,4"
    E.db["movers"]["MinimapMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-3,-3"
    E.db["movers"]["MirrorTimer1Mover"] = "TOP,ElvUIParent,TOP,-1,-96"
    E.db["movers"]["MirrorTimer2Mover"] = "TOP,MirrorTimer1,BOTTOM,0,0"
    E.db["movers"]["MirrorTimer3Mover"] = "TOP,MirrorTimer2,BOTTOM,0,0"
    E.db["movers"]["ObjectiveFrameMover"] = "TOPRIGHT,UIParent,TOPRIGHT,-96,-261"
    E.db["movers"]["PetAB"] = "BOTTOMLEFT,ElvUIParent,BOTTOMLEFT,480,380"
    E.db["movers"]["PlayerPowerBarMover"] = "BOTTOM,UIParent,BOTTOM,-375,230"
    E.db["movers"]["PowerBarContainerMover"] = "TOP,UIParent,TOP,0,-52"
    E.db["movers"]["ReputationBarMover"] = "TOPRIGHT,ElvUIParent,TOPRIGHT,-2,-243"
    E.db["movers"]["RightChatMover"] = "BOTTOMLEFT,UIParent,BOTTOMLEFT,4,50"
    E.db["movers"]["ShiftAB"] = "BOTTOM,ElvUIParent,BOTTOM,0,68"
    E.db["movers"]["SocialMenuMover"] = "TOPLEFT,ElvUIParent,TOPLEFT,4,-187"
    E.db["movers"]["TalkingHeadFrameMover"] = "TOP,UIParent,TOP,0,-179"
    E.db["movers"]["ThreatBarMover"] = "BOTTOMRIGHT,ElvUIParent,BOTTOMRIGHT,-4,4"
    E.db["movers"]["TooltipMover"] = "BOTTOMRIGHT,UIParent,BOTTOMRIGHT,-4,217"
    E.db["movers"]["TopCenterContainerMover"] = "TOP,ElvUIParent,TOP,0,-30"
    E.db["movers"]["TotemBarMover"] = "BOTTOMLEFT,UIParent,BOTTOMLEFT,638,395"
    E.db["movers"]["VOICECHAT"] = "TOPLEFT,ElvUIParent,TOPLEFT,369,-210"
    E.db["movers"]["VehicleLeaveButton"] = "BOTTOMLEFT,UIParent,BOTTOMLEFT,620,4"
    E.db["movers"]["VehicleSeatMover"] = "TOPLEFT,ElvUIParent,TOPLEFT,4,-4"
    E.db["movers"]["WTChatBarMover"] = "BOTTOMLEFT,LeftChatPanel,TOPLEFT,6,3"
    E.db["movers"]["WTCombatAlertFrameMover"] = "TOP,ElvUIParent,TOP,0,-200"
    E.db["movers"]["WTCustomEmoteFrameMover"] = "TOPLEFT,UIParent,TOPLEFT,4,-252"
    E.db["movers"]["WTExtraItemsBar1Mover"] = "BOTTOMLEFT,RightChatPanel,TOPLEFT,0,0"
    E.db["movers"]["WTExtraItemsBar2Mover"] = "BOTTOMLEFT,RightChatPanel,TOPLEFT,0,45"
    E.db["movers"]["WTExtraItemsBar3Mover"] = "BOTTOMLEFT,RightChatPanel,TOPLEFT,0,90"
    E.db["movers"]["WTExtraItemsBar4Mover"] = "BOTTOMLEFT,RightChatPanel,TOPLEFT,0,135"
    E.db["movers"]["WTExtraItemsBar5Mover"] = "BOTTOMLEFT,RightChatPanel,TOPLEFT,0,180"
    E.db["movers"]["WTGameBarAnchor"] = "TOP,ElvUIParent,TOP,0,-20"
    E.db["movers"]["WTInstanceDifficultyFrameMover"] = "TOPLEFT,MMHolder,TOPLEFT,10,-10"
    E.db["movers"]["WTMinimapButtonBarAnchor"] = "TOPRIGHT,UIParent,TOPRIGHT,-227,-4"
    E.db["movers"]["WTParagonReputationToastFrameMover"] = "BOTTOM,ElvUIParent,BOTTOM,0,250"
    E.db["movers"]["WTRaidMarkersBarAnchor"] = "BOTTOMRIGHT,RightChatPanel,TOPRIGHT,-1,3"
    E.db["movers"]["WTSwitchButtonBarMover"] = "RIGHT,ObjectiveFrameMover,RIGHT,0,-2"
    E.db["movers"]["ZoneAbility"] = "BOTTOM,UIParent,BOTTOM,-279,68"

    -- Nameplates -!DISABLED! - !REMEMBER TO USE PLATER! --
    E.db["nameplates"]["colors"]["reactions"]["good"]["b"] = 0.29
    E.db["nameplates"]["colors"]["reactions"]["good"]["g"] = 0.67
    E.db["nameplates"]["colors"]["reactions"]["good"]["r"] = 0.3
    E.db["nameplates"]["colors"]["reactions"]["neutral"]["g"] = 0.76
    E.db["nameplates"]["colors"]["selection"][0]["b"] = 0.25
    E.db["nameplates"]["colors"]["selection"][0]["g"] = 0.25
    E.db["nameplates"]["colors"]["selection"][0]["r"] = 0.78
    E.db["nameplates"]["colors"]["selection"][2]["b"] = 0.36
    E.db["nameplates"]["colors"]["selection"][2]["g"] = 0.76
    E.db["nameplates"]["colors"]["selection"][2]["r"] = 0.85
    E.db["nameplates"]["colors"]["selection"][3]["b"] = 0.3
    E.db["nameplates"]["colors"]["selection"][3]["g"] = 0.67
    E.db["nameplates"]["colors"]["selection"][3]["r"] = 0.29
    E.db["nameplates"]["colors"]["threat"]["badColor"]["b"] = 0.25
    E.db["nameplates"]["colors"]["threat"]["badColor"]["g"] = 0.25
    E.db["nameplates"]["colors"]["threat"]["badColor"]["r"] = 0.78
    E.db["nameplates"]["colors"]["threat"]["goodColor"]["b"] = 0.3
    E.db["nameplates"]["colors"]["threat"]["goodColor"]["g"] = 0.67
    E.db["nameplates"]["colors"]["threat"]["goodColor"]["r"] = 0.29
    E.db["nameplates"]["colors"]["threat"]["goodTransition"]["b"] = 0.36
    E.db["nameplates"]["colors"]["threat"]["goodTransition"]["g"] = 0.76
    E.db["nameplates"]["colors"]["threat"]["goodTransition"]["r"] = 0.85
    E.db["nameplates"]["font"] = "Accidental Presidency"
    E.db["nameplates"]["statusbar"] = "Solid"
    E.db["nameplates"]["units"]["ENEMY_NPC"]["health"]["text"]["format"] = ""
    E.db["nameplates"]["units"]["ENEMY_PLAYER"]["health"]["text"]["format"] = ""
    E.db["nameplates"]["units"]["ENEMY_PLAYER"]["portrait"]["classicon"] = false
    E.db["nameplates"]["units"]["ENEMY_PLAYER"]["portrait"]["enable"] = true
    E.db["nameplates"]["units"]["ENEMY_PLAYER"]["portrait"]["position"] = "LEFT"
    E.db["nameplates"]["units"]["ENEMY_PLAYER"]["portrait"]["xOffset"] = 0
    E.db["nameplates"]["units"]["ENEMY_PLAYER"]["portrait"]["yOffset"] = 0

    --Tooltip --
    E.db["tooltip"]["alwaysShowRealm"] = true
    E.db["tooltip"]["font"] = "Accidental Presidency"
    E.db["tooltip"]["headerFont"] = "Accidental Presidency"
    E.db["tooltip"]["headerFontSize"] = 16
    E.db["tooltip"]["healthBar"]["font"] = "Accidental Presidency"
    E.db["tooltip"]["healthBar"]["fontOutline"] = "NONE"
    E.db["tooltip"]["healthBar"]["fontSize"] = 12
    E.db["tooltip"]["healthBar"]["height"] = 12
    E.db["tooltip"]["smallTextFontSize"] = 16
    E.db["tooltip"]["textFontSize"] = 16

    --Unitframes --
    E.db["unitframe"]["colors"]["auraBarBuff"]["b"] = 0.93333131074905
    E.db["unitframe"]["colors"]["auraBarBuff"]["g"] = 0.53333216905594
    E.db["unitframe"]["colors"]["auraBarBuff"]["r"] = 0.52941060066223
    E.db["unitframe"]["colors"]["castClassColor"] = true
    E.db["unitframe"]["colors"]["castColor"]["b"] = 0.043137254901961
    E.db["unitframe"]["colors"]["castColor"]["g"] = 0
    E.db["unitframe"]["colors"]["castColor"]["r"] = 0.37647058823529
    E.db["unitframe"]["colors"]["castNoInterrupt"]["b"] = 0.2156862745098
    E.db["unitframe"]["colors"]["castNoInterrupt"]["g"] = 0.44705882352941
    E.db["unitframe"]["colors"]["castNoInterrupt"]["r"] = 0.35686274509804
    E.db["unitframe"]["colors"]["colorhealthbyvalue"] = false
    E.db["unitframe"]["colors"]["customhealthbackdrop"] = true
    E.db["unitframe"]["colors"]["custompowerbackdrop"] = true
    E.db["unitframe"]["colors"]["healPrediction"]["absorbs"]["a"] = 0.56000000238419
    E.db["unitframe"]["colors"]["healPrediction"]["absorbs"]["b"] = 0.53725490196078
    E.db["unitframe"]["colors"]["healPrediction"]["absorbs"]["g"] = 0.49411764705882
    E.db["unitframe"]["colors"]["healPrediction"]["absorbs"]["r"] = 0
    E.db["unitframe"]["colors"]["healPrediction"]["others"]["a"] = 0.56000000238419
    E.db["unitframe"]["colors"]["healPrediction"]["others"]["b"] = 0.53725490196078
    E.db["unitframe"]["colors"]["healPrediction"]["others"]["g"] = 0.49411764705882
    E.db["unitframe"]["colors"]["healPrediction"]["overabsorbs"]["a"] = 0.56000000238419
    E.db["unitframe"]["colors"]["healPrediction"]["overabsorbs"]["b"] = 0.53725490196078
    E.db["unitframe"]["colors"]["healPrediction"]["overabsorbs"]["g"] = 0.49411764705882
    E.db["unitframe"]["colors"]["healPrediction"]["overabsorbs"]["r"] = 0
    E.db["unitframe"]["colors"]["healPrediction"]["personal"]["a"] = 0.56000000238419
    E.db["unitframe"]["colors"]["healPrediction"]["personal"]["b"] = 0.53725490196078
    E.db["unitframe"]["colors"]["healPrediction"]["personal"]["g"] = 0.49411764705882
    E.db["unitframe"]["colors"]["health"]["b"] = 0.13333333333333
    E.db["unitframe"]["colors"]["health"]["g"] = 0.13333333333333
    E.db["unitframe"]["colors"]["health"]["r"] = 0.13333333333333
    E.db["unitframe"]["colors"]["health_backdrop"]["b"] = 0.23529411764706
    E.db["unitframe"]["colors"]["health_backdrop"]["g"] = 0.23529411764706
    E.db["unitframe"]["colors"]["health_backdrop"]["r"] = 0.22745098039216
    E.db["unitframe"]["colors"]["health_backdrop_dead"]["b"] = 0.43529411764706
    E.db["unitframe"]["colors"]["health_backdrop_dead"]["g"] = 0.39607843137255
    E.db["unitframe"]["colors"]["health_backdrop_dead"]["r"] = 0.41960784313725
    E.db["unitframe"]["colors"]["power_backdrop"]["b"] = 0.12549019607843
    E.db["unitframe"]["colors"]["power_backdrop"]["g"] = 0.12549019607843
    E.db["unitframe"]["colors"]["power_backdrop"]["r"] = 0.12156862745098
    E.db["unitframe"]["colors"]["powerclass"] = true
    E.db["unitframe"]["colors"]["tapped"]["b"] = 0.89019607843137
    E.db["unitframe"]["colors"]["tapped"]["g"] = 0.89411764705882
    E.db["unitframe"]["colors"]["tapped"]["r"] = 0.82352941176471
    E.db["unitframe"]["font"] = "Accidental Presidency"
    E.db["unitframe"]["smartRaidFilter"] = false
    E.db["unitframe"]["smoothbars"] = true
    E.db["unitframe"]["statusbar"] = "Solid"

    --Disable Arena/Assist frames --
    E.db["unitframe"]["units"]["arena"]["enable"] = false
    E.db["unitframe"]["units"]["assist"]["enable"] = false

    --Boss farmes--
    --Custom Texts --
    E.db["unitframe"]["units"]["boss"]["customTexts"] = E.db["unitframe"]["units"]["boss"]["customTexts"] or {}
    E.db["unitframe"]["units"]["boss"]["customTexts"]["HPValue"] = {}
    E.db["unitframe"]["units"]["boss"]["customTexts"]["Namë"] = {}
    E.db["unitframe"]["units"]["boss"]["customTexts"]["PowerValue"] = {}

    E.db["unitframe"]["units"]["boss"]["buffs"]["countFont"] = "Accidental Presidency"
    E.db["unitframe"]["units"]["boss"]["buffs"]["countFontSize"] = 14
    E.db["unitframe"]["units"]["boss"]["buffs"]["maxDuration"] = 300
    E.db["unitframe"]["units"]["boss"]["buffs"]["perrow"] = 2
    E.db["unitframe"]["units"]["boss"]["buffs"]["sizeOverride"] = 35
    E.db["unitframe"]["units"]["boss"]["buffs"]["yOffset"] = -1
    E.db["unitframe"]["units"]["boss"]["castbar"]["customTextFont"]["enable"] = true
    E.db["unitframe"]["units"]["boss"]["castbar"]["customTextFont"]["font"] = "Accidental Presidency"
    E.db["unitframe"]["units"]["boss"]["castbar"]["customTextFont"]["fontSize"] = 18
    E.db["unitframe"]["units"]["boss"]["castbar"]["customTimeFont"]["enable"] = true
    E.db["unitframe"]["units"]["boss"]["castbar"]["customTimeFont"]["font"] = "Accidental Presidency"
    E.db["unitframe"]["units"]["boss"]["castbar"]["customTimeFont"]["fontSize"] = 18
    E.db["unitframe"]["units"]["boss"]["castbar"]["height"] = 16
    E.db["unitframe"]["units"]["boss"]["castbar"]["icon"] = false
    E.db["unitframe"]["units"]["boss"]["castbar"]["width"] = 220
    E.db["unitframe"]["units"]["boss"]["customTexts"]["HPValue"]["attachTextTo"] = "Health"
    E.db["unitframe"]["units"]["boss"]["customTexts"]["HPValue"]["enable"] = true
    E.db["unitframe"]["units"]["boss"]["customTexts"]["HPValue"]["font"] = "Accidental Presidency"
    E.db["unitframe"]["units"]["boss"]["customTexts"]["HPValue"]["fontOutline"] = "OUTLINE"
    E.db["unitframe"]["units"]["boss"]["customTexts"]["HPValue"]["justifyH"] = "RIGHT"
    E.db["unitframe"]["units"]["boss"]["customTexts"]["HPValue"]["size"] = 20
    E.db["unitframe"]["units"]["boss"]["customTexts"]["HPValue"]["text_format"] = "[health:current:shortvalue] || [health:percent]"
    E.db["unitframe"]["units"]["boss"]["customTexts"]["HPValue"]["xOffset"] = -5
    E.db["unitframe"]["units"]["boss"]["customTexts"]["HPValue"]["yOffset"] = 24
    E.db["unitframe"]["units"]["boss"]["customTexts"]["Namë"]["attachTextTo"] = "Health"
    E.db["unitframe"]["units"]["boss"]["customTexts"]["Namë"]["enable"] = true
    E.db["unitframe"]["units"]["boss"]["customTexts"]["Namë"]["font"] = "Accidental Presidency"
    E.db["unitframe"]["units"]["boss"]["customTexts"]["Namë"]["fontOutline"] = "OUTLINE"
    E.db["unitframe"]["units"]["boss"]["customTexts"]["Namë"]["justifyH"] = "LEFT"
    E.db["unitframe"]["units"]["boss"]["customTexts"]["Namë"]["size"] = 24
    E.db["unitframe"]["units"]["boss"]["customTexts"]["Namë"]["text_format"] = "[name:abbrev]"
    E.db["unitframe"]["units"]["boss"]["customTexts"]["Namë"]["xOffset"] = 10
    E.db["unitframe"]["units"]["boss"]["customTexts"]["Namë"]["yOffset"] = 16
    E.db["unitframe"]["units"]["boss"]["customTexts"]["PowerValue"]["attachTextTo"] = "Power"
    E.db["unitframe"]["units"]["boss"]["customTexts"]["PowerValue"]["enable"] = true
    E.db["unitframe"]["units"]["boss"]["customTexts"]["PowerValue"]["font"] = "Accidental Presidency"
    E.db["unitframe"]["units"]["boss"]["customTexts"]["PowerValue"]["fontOutline"] = "OUTLINE"
    E.db["unitframe"]["units"]["boss"]["customTexts"]["PowerValue"]["justifyH"] = "CENTER"
    E.db["unitframe"]["units"]["boss"]["customTexts"]["PowerValue"]["size"] = 20
    E.db["unitframe"]["units"]["boss"]["customTexts"]["PowerValue"]["text_format"] = "[power:current:shortvalue]"
    E.db["unitframe"]["units"]["boss"]["customTexts"]["PowerValue"]["xOffset"] = 0
    E.db["unitframe"]["units"]["boss"]["customTexts"]["PowerValue"]["yOffset"] = 0
    E.db["unitframe"]["units"]["boss"]["debuffs"]["anchorPoint"] = "RIGHT"
    E.db["unitframe"]["units"]["boss"]["debuffs"]["countFont"] = "Accidental Presidency"
    E.db["unitframe"]["units"]["boss"]["debuffs"]["countFontSize"] = 14
    E.db["unitframe"]["units"]["boss"]["debuffs"]["maxDuration"] = 300
    E.db["unitframe"]["units"]["boss"]["debuffs"]["perrow"] = 4
    E.db["unitframe"]["units"]["boss"]["debuffs"]["sizeOverride"] = 35
    E.db["unitframe"]["units"]["boss"]["debuffs"]["yOffset"] = -1
    E.db["unitframe"]["units"]["boss"]["healPrediction"]["absorbStyle"] = "REVERSED"
    E.db["unitframe"]["units"]["boss"]["health"]["text_format"] = ""
    E.db["unitframe"]["units"]["boss"]["height"] = 35
    E.db["unitframe"]["units"]["boss"]["infoPanel"]["height"] = 17
    E.db["unitframe"]["units"]["boss"]["name"]["text_format"] = ""
    E.db["unitframe"]["units"]["boss"]["power"]["height"] = 6
    E.db["unitframe"]["units"]["boss"]["power"]["text_format"] = "[powercolor]"
    E.db["unitframe"]["units"]["boss"]["raidicon"]["size"] = 20
    E.db["unitframe"]["units"]["boss"]["spacing"] = 38
    E.db["unitframe"]["units"]["boss"]["width"] = 220

    --Focus Frames--
    --Custom Texts --

    
    E.db["unitframe"]["units"]["focus"]["customTexts"] = E.db["unitframe"]["units"]["focus"]["customTexts"] or {}
    E.db["unitframe"]["units"]["focus"]["customTexts"]["Namë"] = {}
    E.db["unitframe"]["units"]["focus"]["customTexts"]["HPValue"] = {}

    E.db["unitframe"]["units"]["focus"]["CombatIcon"]["size"] = 25
    E.db["unitframe"]["units"]["focus"]["aurabar"]["detachedWidth"] = 270
    E.db["unitframe"]["units"]["focus"]["aurabar"]["maxBars"] = 6
    E.db["unitframe"]["units"]["focus"]["buffs"]["anchorPoint"] = "TOPLEFT"
    E.db["unitframe"]["units"]["focus"]["buffs"]["countFont"] = "Accidental Presidency"
    E.db["unitframe"]["units"]["focus"]["buffs"]["maxDuration"] = 0
    E.db["unitframe"]["units"]["focus"]["buffs"]["perrow"] = 8
    E.db["unitframe"]["units"]["focus"]["buffs"]["priority"] = "Blacklist,Personal,PlayerBuffs,Whitelist,blockNoDuration,nonPersonal"
    E.db["unitframe"]["units"]["focus"]["castbar"]["customTextFont"]["enable"] = true
    E.db["unitframe"]["units"]["focus"]["castbar"]["customTextFont"]["font"] = "Accidental Presidency"
    E.db["unitframe"]["units"]["focus"]["castbar"]["customTextFont"]["fontSize"] = 18
    E.db["unitframe"]["units"]["focus"]["castbar"]["customTimeFont"]["enable"] = true
    E.db["unitframe"]["units"]["focus"]["castbar"]["customTimeFont"]["font"] = "Accidental Presidency"
    E.db["unitframe"]["units"]["focus"]["castbar"]["customTimeFont"]["fontSize"] = 18
    E.db["unitframe"]["units"]["focus"]["castbar"]["height"] = 20
    E.db["unitframe"]["units"]["focus"]["castbar"]["insideInfoPanel"] = false
    E.db["unitframe"]["units"]["focus"]["castbar"]["width"] = 300
    E.db["unitframe"]["units"]["focus"]["customTexts"]["HPValue"]["attachTextTo"] = "Health"
    E.db["unitframe"]["units"]["focus"]["customTexts"]["HPValue"]["enable"] = false
    E.db["unitframe"]["units"]["focus"]["customTexts"]["HPValue"]["font"] = "Accidental Presidency"
    E.db["unitframe"]["units"]["focus"]["customTexts"]["HPValue"]["fontOutline"] = "OUTLINE"
    E.db["unitframe"]["units"]["focus"]["customTexts"]["HPValue"]["justifyH"] = "RIGHT"
    E.db["unitframe"]["units"]["focus"]["customTexts"]["HPValue"]["size"] = 26
    E.db["unitframe"]["units"]["focus"]["customTexts"]["HPValue"]["text_format"] = "[health:current:shortvalue]"
    E.db["unitframe"]["units"]["focus"]["customTexts"]["HPValue"]["xOffset"] = 0
    E.db["unitframe"]["units"]["focus"]["customTexts"]["HPValue"]["yOffset"] = -30
    E.db["unitframe"]["units"]["focus"]["customTexts"]["Namë"]["attachTextTo"] = "Health"
    E.db["unitframe"]["units"]["focus"]["customTexts"]["Namë"]["enable"] = true
    E.db["unitframe"]["units"]["focus"]["customTexts"]["Namë"]["font"] = "Accidental Presidency"
    E.db["unitframe"]["units"]["focus"]["customTexts"]["Namë"]["fontOutline"] = "OUTLINE"
    E.db["unitframe"]["units"]["focus"]["customTexts"]["Namë"]["justifyH"] = "LEFT"
    E.db["unitframe"]["units"]["focus"]["customTexts"]["Namë"]["size"] = 26
    E.db["unitframe"]["units"]["focus"]["customTexts"]["Namë"]["text_format"] = "[classcolor][name]"
    E.db["unitframe"]["units"]["focus"]["customTexts"]["Namë"]["xOffset"] = 10
    E.db["unitframe"]["units"]["focus"]["customTexts"]["Namë"]["yOffset"] = 22
    E.db["unitframe"]["units"]["focus"]["debuffs"]["attachTo"] = "BUFFS"
    E.db["unitframe"]["units"]["focus"]["debuffs"]["countFont"] = "Accidental Presidency"
    E.db["unitframe"]["units"]["focus"]["debuffs"]["maxDuration"] = 0
    E.db["unitframe"]["units"]["focus"]["debuffs"]["perrow"] = 8
    E.db["unitframe"]["units"]["focus"]["debuffs"]["priority"] = "Blacklist,Personal,nonPersonal"
    E.db["unitframe"]["units"]["focus"]["debuffs"]["sizeOverride"] = 24
    E.db["unitframe"]["units"]["focus"]["disableMouseoverGlow"] = true
    E.db["unitframe"]["units"]["focus"]["disableTargetGlow"] = true
    E.db["unitframe"]["units"]["focus"]["healPrediction"]["absorbStyle"] = "NORMAL"
    E.db["unitframe"]["units"]["focus"]["health"]["position"] = "LEFT"
    E.db["unitframe"]["units"]["focus"]["health"]["xOffset"] = 2
    E.db["unitframe"]["units"]["focus"]["height"] = 30
    E.db["unitframe"]["units"]["focus"]["infoPanel"]["height"] = 20
    E.db["unitframe"]["units"]["focus"]["name"]["text_format"] = ""
    E.db["unitframe"]["units"]["focus"]["orientation"] = "LEFT"
    E.db["unitframe"]["units"]["focus"]["power"]["detachedWidth"] = 150
    E.db["unitframe"]["units"]["focus"]["power"]["enable"] = false
    E.db["unitframe"]["units"]["focus"]["power"]["position"] = "RIGHT"
    E.db["unitframe"]["units"]["focus"]["power"]["xOffset"] = -2
    E.db["unitframe"]["units"]["focus"]["width"] = 300


    --Party Frames--
    --Custom Texts --
    E.db["unitframe"]["units"]["party"]["customTexts"] = E.db["unitframe"]["units"]["party"]["customTexts"] or {}
    E.db["unitframe"]["units"]["party"]["customTexts"]["NamË"] = {}
    E.db["unitframe"]["units"]["party"]["customTexts"]["HPVal"] = {}

    E.db["unitframe"]["units"]["party"]["buffs"]["perrow"] = 3
    E.db["unitframe"]["units"]["party"]["classbar"]["altPowerColor"]["b"] = 0.67450980392157
    E.db["unitframe"]["units"]["party"]["classbar"]["altPowerColor"]["g"] = 0.43921568627451
    E.db["unitframe"]["units"]["party"]["classbar"]["altPowerColor"]["r"] = 0.19607843137255
    E.db["unitframe"]["units"]["party"]["classbar"]["altPowerTextFormat"] = ""
    E.db["unitframe"]["units"]["party"]["classbar"]["height"] = 5
    E.db["unitframe"]["units"]["party"]["customTexts"]["HPVal"]["attachTextTo"] = "Health"
    E.db["unitframe"]["units"]["party"]["customTexts"]["HPVal"]["enable"] = true
    E.db["unitframe"]["units"]["party"]["customTexts"]["HPVal"]["font"] = "Accidental Presidency"
    E.db["unitframe"]["units"]["party"]["customTexts"]["HPVal"]["fontOutline"] = "OUTLINE"
    E.db["unitframe"]["units"]["party"]["customTexts"]["HPVal"]["justifyH"] = "RIGHT"
    E.db["unitframe"]["units"]["party"]["customTexts"]["HPVal"]["size"] = 20
    E.db["unitframe"]["units"]["party"]["customTexts"]["HPVal"]["text_format"] = "[classcolor][health:current:shortvalue]"
    E.db["unitframe"]["units"]["party"]["customTexts"]["HPVal"]["xOffset"] = 0
    E.db["unitframe"]["units"]["party"]["customTexts"]["HPVal"]["yOffset"] = 0
    E.db["unitframe"]["units"]["party"]["customTexts"]["NamË"]["attachTextTo"] = "Health"
    E.db["unitframe"]["units"]["party"]["customTexts"]["NamË"]["enable"] = true
    E.db["unitframe"]["units"]["party"]["customTexts"]["NamË"]["font"] = "Accidental Presidency"
    E.db["unitframe"]["units"]["party"]["customTexts"]["NamË"]["fontOutline"] = "OUTLINE"
    E.db["unitframe"]["units"]["party"]["customTexts"]["NamË"]["justifyH"] = "LEFT"
    E.db["unitframe"]["units"]["party"]["customTexts"]["NamË"]["size"] = 24
    E.db["unitframe"]["units"]["party"]["customTexts"]["NamË"]["text_format"] = "[classcolor][name:abbrev]"
    E.db["unitframe"]["units"]["party"]["customTexts"]["NamË"]["xOffset"] = 5
    E.db["unitframe"]["units"]["party"]["customTexts"]["NamË"]["yOffset"] = 22
    E.db["unitframe"]["units"]["party"]["debuffs"]["countFont"] = "Accidental Presidency"
    E.db["unitframe"]["units"]["party"]["debuffs"]["perrow"] = 3
    E.db["unitframe"]["units"]["party"]["debuffs"]["sizeOverride"] = 30
    E.db["unitframe"]["units"]["party"]["debuffs"]["xOffset"] = 5
    E.db["unitframe"]["units"]["party"]["groupBy"] = "ROLE"
    E.db["unitframe"]["units"]["party"]["growthDirection"] = "DOWN_RIGHT"
    E.db["unitframe"]["units"]["party"]["healPrediction"]["absorbStyle"] = "REVERSED"
    E.db["unitframe"]["units"]["party"]["health"]["position"] = "BOTTOM"
    E.db["unitframe"]["units"]["party"]["health"]["text_format"] = ""
    E.db["unitframe"]["units"]["party"]["health"]["yOffset"] = 2
    E.db["unitframe"]["units"]["party"]["height"] = 40
    E.db["unitframe"]["units"]["party"]["horizontalSpacing"] = 1
    E.db["unitframe"]["units"]["party"]["infoPanel"]["height"] = 12
    E.db["unitframe"]["units"]["party"]["name"]["position"] = "LEFT"
    E.db["unitframe"]["units"]["party"]["name"]["text_format"] = ""
    E.db["unitframe"]["units"]["party"]["name"]["xOffset"] = 2
    E.db["unitframe"]["units"]["party"]["power"]["displayAltPower"] = true
    E.db["unitframe"]["units"]["party"]["power"]["height"] = 5
    E.db["unitframe"]["units"]["party"]["power"]["position"] = "BOTTOMRIGHT"
    E.db["unitframe"]["units"]["party"]["power"]["text_format"] = ""
    E.db["unitframe"]["units"]["party"]["power"]["width"] = "spaced"
    E.db["unitframe"]["units"]["party"]["power"]["yOffset"] = 2
    E.db["unitframe"]["units"]["party"]["rdebuffs"]["font"] = "Accidental Presidency"
    E.db["unitframe"]["units"]["party"]["rdebuffs"]["fontOutline"] = "OUTLINE"
    E.db["unitframe"]["units"]["party"]["rdebuffs"]["fontSize"] = 18
    E.db["unitframe"]["units"]["party"]["rdebuffs"]["size"] = 30
    E.db["unitframe"]["units"]["party"]["rdebuffs"]["xOffset"] = 40
    E.db["unitframe"]["units"]["party"]["rdebuffs"]["yOffset"] = 4
    E.db["unitframe"]["units"]["party"]["readycheckIcon"]["position"] = "CENTER"
    E.db["unitframe"]["units"]["party"]["readycheckIcon"]["size"] = 20
    E.db["unitframe"]["units"]["party"]["resurrectIcon"]["attachToObject"] = "Health"
    E.db["unitframe"]["units"]["party"]["roleIcon"]["position"] = "TOPRIGHT"
    E.db["unitframe"]["units"]["party"]["roleIcon"]["size"] = 18
    E.db["unitframe"]["units"]["party"]["roleIcon"]["xOffset"] = 10
    E.db["unitframe"]["units"]["party"]["roleIcon"]["yOffset"] = 10
    E.db["unitframe"]["units"]["party"]["showPlayer"] = false
    E.db["unitframe"]["units"]["party"]["verticalSpacing"] = 15
    E.db["unitframe"]["units"]["party"]["width"] = 200

    --Pet Frames--
    --Custom Texts --
    E.db["unitframe"]["units"]["pet"]["customTexts"] = E.db["unitframe"]["units"]["pet"]["customTexts"] or {}
    E.db["unitframe"]["units"]["pet"]["customTexts"]["Namë"] = {}
    E.db["unitframe"]["units"]["pet"]["customTexts"]["HPValue"] = {}

    E.db["unitframe"]["units"]["pet"]["aurabar"]["attachTo"] = "DEBUFFS"
    E.db["unitframe"]["units"]["pet"]["aurabar"]["detachedWidth"] = 270
    E.db["unitframe"]["units"]["pet"]["aurabar"]["priority"] = "Blacklist,blockNoDuration,Personal,Boss,RaidDebuffs,PlayerBuffs"
    E.db["unitframe"]["units"]["pet"]["aurabar"]["spacing"] = 0
    E.db["unitframe"]["units"]["pet"]["aurabar"]["yOffset"] = 0
    E.db["unitframe"]["units"]["pet"]["buffs"]["anchorPoint"] = "TOPLEFT"
    E.db["unitframe"]["units"]["pet"]["buffs"]["countFont"] = "Accidental Presidency"
    E.db["unitframe"]["units"]["pet"]["buffs"]["maxDuration"] = 0
    E.db["unitframe"]["units"]["pet"]["buffs"]["perrow"] = 8
    E.db["unitframe"]["units"]["pet"]["buffs"]["priority"] = "Blacklist,Personal,PlayerBuffs,Whitelist,blockNoDuration,nonPersonal"
    E.db["unitframe"]["units"]["pet"]["castbar"]["enable"] = false
    E.db["unitframe"]["units"]["pet"]["castbar"]["height"] = 8
    E.db["unitframe"]["units"]["pet"]["castbar"]["insideInfoPanel"] = false
    E.db["unitframe"]["units"]["pet"]["castbar"]["width"] = 150
    E.db["unitframe"]["units"]["pet"]["colorOverride"] = "FORCE_OFF"
    E.db["unitframe"]["units"]["pet"]["customTexts"]["HPValue"]["attachTextTo"] = "Health"
    E.db["unitframe"]["units"]["pet"]["customTexts"]["HPValue"]["enable"] = false
    E.db["unitframe"]["units"]["pet"]["customTexts"]["HPValue"]["font"] = "Accidental Presidency"
    E.db["unitframe"]["units"]["pet"]["customTexts"]["HPValue"]["fontOutline"] = "OUTLINE"
    E.db["unitframe"]["units"]["pet"]["customTexts"]["HPValue"]["justifyH"] = "RIGHT"
    E.db["unitframe"]["units"]["pet"]["customTexts"]["HPValue"]["size"] = 26
    E.db["unitframe"]["units"]["pet"]["customTexts"]["HPValue"]["text_format"] = "[classcolor][health:current:shortvalue]"
    E.db["unitframe"]["units"]["pet"]["customTexts"]["HPValue"]["xOffset"] = 0
    E.db["unitframe"]["units"]["pet"]["customTexts"]["HPValue"]["yOffset"] = -30
    E.db["unitframe"]["units"]["pet"]["customTexts"]["Namë"]["attachTextTo"] = "Health"
    E.db["unitframe"]["units"]["pet"]["customTexts"]["Namë"]["enable"] = true
    E.db["unitframe"]["units"]["pet"]["customTexts"]["Namë"]["font"] = "Accidental Presidency"
    E.db["unitframe"]["units"]["pet"]["customTexts"]["Namë"]["fontOutline"] = "OUTLINE"
    E.db["unitframe"]["units"]["pet"]["customTexts"]["Namë"]["justifyH"] = "CENTER"
    E.db["unitframe"]["units"]["pet"]["customTexts"]["Namë"]["size"] = 20
    E.db["unitframe"]["units"]["pet"]["customTexts"]["Namë"]["text_format"] = "[classcolor][name]"
    E.db["unitframe"]["units"]["pet"]["customTexts"]["Namë"]["xOffset"] = 0
    E.db["unitframe"]["units"]["pet"]["customTexts"]["Namë"]["yOffset"] = 0
    E.db["unitframe"]["units"]["pet"]["debuffs"]["anchorPoint"] = "TOPRIGHT"
    E.db["unitframe"]["units"]["pet"]["debuffs"]["attachTo"] = "BUFFS"
    E.db["unitframe"]["units"]["pet"]["debuffs"]["countFont"] = "Accidental Presidency"
    E.db["unitframe"]["units"]["pet"]["debuffs"]["enable"] = true
    E.db["unitframe"]["units"]["pet"]["debuffs"]["maxDuration"] = 0
    E.db["unitframe"]["units"]["pet"]["debuffs"]["perrow"] = 8
    E.db["unitframe"]["units"]["pet"]["debuffs"]["priority"] = "Blacklist,Personal,nonPersonal"
    E.db["unitframe"]["units"]["pet"]["disableMouseoverGlow"] = true
    E.db["unitframe"]["units"]["pet"]["healPrediction"]["absorbStyle"] = "NORMAL"
    E.db["unitframe"]["units"]["pet"]["health"]["position"] = "LEFT"
    E.db["unitframe"]["units"]["pet"]["health"]["xOffset"] = 2
    E.db["unitframe"]["units"]["pet"]["height"] = 25
    E.db["unitframe"]["units"]["pet"]["infoPanel"]["height"] = 20
    E.db["unitframe"]["units"]["pet"]["name"]["text_format"] = ""
    E.db["unitframe"]["units"]["pet"]["orientation"] = "LEFT"
    E.db["unitframe"]["units"]["pet"]["power"]["detachedWidth"] = 150
    E.db["unitframe"]["units"]["pet"]["power"]["enable"] = false
    E.db["unitframe"]["units"]["pet"]["power"]["position"] = "RIGHT"
    E.db["unitframe"]["units"]["pet"]["power"]["xOffset"] = -2
    E.db["unitframe"]["units"]["pet"]["width"] = 150

    --Player Frames--
    --Custom Texts --
    E.db["unitframe"]["units"]["player"]["customTexts"] = E.db["unitframe"]["units"]["player"]["customTexts"] or {}
    E.db["unitframe"]["units"]["player"]["customTexts"]["Namë"] = {}
    E.db["unitframe"]["units"]["player"]["customTexts"]["HPValue"] = {}

    E.db["unitframe"]["units"]["player"]["CombatIcon"]["size"] = 25
    E.db["unitframe"]["units"]["player"]["aurabar"]["enable"] = false
    E.db["unitframe"]["units"]["player"]["buffs"]["attachTo"] = "FRAME"
    E.db["unitframe"]["units"]["player"]["buffs"]["countFont"] = "Accidental Presidency"
    E.db["unitframe"]["units"]["player"]["castbar"]["customTextFont"]["enable"] = true
    E.db["unitframe"]["units"]["player"]["castbar"]["customTextFont"]["font"] = "Accidental Presidency"
    E.db["unitframe"]["units"]["player"]["castbar"]["customTextFont"]["fontSize"] = 20
    E.db["unitframe"]["units"]["player"]["castbar"]["customTimeFont"]["enable"] = true
    E.db["unitframe"]["units"]["player"]["castbar"]["customTimeFont"]["font"] = "Accidental Presidency"
    E.db["unitframe"]["units"]["player"]["castbar"]["customTimeFont"]["fontSize"] = 20
    E.db["unitframe"]["units"]["player"]["castbar"]["format"] = "REMAININGMAX"
    E.db["unitframe"]["units"]["player"]["castbar"]["height"] = 30
    E.db["unitframe"]["units"]["player"]["castbar"]["icon"] = false
    E.db["unitframe"]["units"]["player"]["castbar"]["insideInfoPanel"] = false
    E.db["unitframe"]["units"]["player"]["castbar"]["textColor"]["b"] = 0.97254901960784
    E.db["unitframe"]["units"]["player"]["castbar"]["textColor"]["g"] = 0.97254901960784
    E.db["unitframe"]["units"]["player"]["castbar"]["textColor"]["r"] = 1
    E.db["unitframe"]["units"]["player"]["castbar"]["width"] = 400
    E.db["unitframe"]["units"]["player"]["classbar"]["enable"] = false
    E.db["unitframe"]["units"]["player"]["classbar"]["height"] = 14
    E.db["unitframe"]["units"]["player"]["customTexts"]["HPValue"]["attachTextTo"] = "Health"
    E.db["unitframe"]["units"]["player"]["customTexts"]["HPValue"]["enable"] = true
    E.db["unitframe"]["units"]["player"]["customTexts"]["HPValue"]["font"] = "Accidental Presidency"
    E.db["unitframe"]["units"]["player"]["customTexts"]["HPValue"]["fontOutline"] = "OUTLINE"
    E.db["unitframe"]["units"]["player"]["customTexts"]["HPValue"]["justifyH"] = "RIGHT"
    E.db["unitframe"]["units"]["player"]["customTexts"]["HPValue"]["size"] = 26
    E.db["unitframe"]["units"]["player"]["customTexts"]["HPValue"]["text_format"] = "[classcolor][health:current:shortvalue]"
    E.db["unitframe"]["units"]["player"]["customTexts"]["HPValue"]["xOffset"] = 0
    E.db["unitframe"]["units"]["player"]["customTexts"]["HPValue"]["yOffset"] = -30
    E.db["unitframe"]["units"]["player"]["customTexts"]["Namë"]["attachTextTo"] = "Health"
    E.db["unitframe"]["units"]["player"]["customTexts"]["Namë"]["enable"] = true
    E.db["unitframe"]["units"]["player"]["customTexts"]["Namë"]["font"] = "Accidental Presidency"
    E.db["unitframe"]["units"]["player"]["customTexts"]["Namë"]["fontOutline"] = "OUTLINE"
    E.db["unitframe"]["units"]["player"]["customTexts"]["Namë"]["justifyH"] = "LEFT"
    E.db["unitframe"]["units"]["player"]["customTexts"]["Namë"]["size"] = 26
    E.db["unitframe"]["units"]["player"]["customTexts"]["Namë"]["text_format"] = "[classcolor][name]"
    E.db["unitframe"]["units"]["player"]["customTexts"]["Namë"]["xOffset"] = 10
    E.db["unitframe"]["units"]["player"]["customTexts"]["Namë"]["yOffset"] = 22
    E.db["unitframe"]["units"]["player"]["debuffs"]["anchorPoint"] = "TOPRIGHT"
    E.db["unitframe"]["units"]["player"]["debuffs"]["attachTo"] = "BUFFS"
    E.db["unitframe"]["units"]["player"]["debuffs"]["countFont"] = "Accidental Presidency"
    E.db["unitframe"]["units"]["player"]["debuffs"]["growthX"] = "LEFT"
    E.db["unitframe"]["units"]["player"]["disableMouseoverGlow"] = true
    E.db["unitframe"]["units"]["player"]["healPrediction"]["absorbStyle"] = "NORMAL"
    E.db["unitframe"]["units"]["player"]["health"]["text_format"] = ""
    E.db["unitframe"]["units"]["player"]["height"] = 35
    E.db["unitframe"]["units"]["player"]["power"]["detachedWidth"] = 150
    E.db["unitframe"]["units"]["player"]["power"]["enable"] = false
    E.db["unitframe"]["units"]["player"]["power"]["text_format"] = ""
    E.db["unitframe"]["units"]["player"]["pvp"]["text_format"] = ""
    E.db["unitframe"]["units"]["player"]["width"] = 300

    --Raid Frames--
    --Custom Texts --
    E.db["unitframe"]["units"]["raid"]["customTexts"] = E.db["unitframe"]["units"]["raid"]["customTexts"] or {}
    E.db["unitframe"]["units"]["raid"]["customTexts"]["NamË"] = {}
    

    E.db["unitframe"]["units"]["raid"]["classbar"]["altPowerColor"]["b"] = 0.67450980392157
    E.db["unitframe"]["units"]["raid"]["classbar"]["altPowerColor"]["g"] = 0.43921568627451
    E.db["unitframe"]["units"]["raid"]["classbar"]["altPowerColor"]["r"] = 0.19607843137255
    E.db["unitframe"]["units"]["raid"]["classbar"]["altPowerTextFormat"] = ""
    E.db["unitframe"]["units"]["raid"]["classbar"]["height"] = 5
    E.db["unitframe"]["units"]["raid"]["customTexts"]["NamË"]["attachTextTo"] = "Health"
    E.db["unitframe"]["units"]["raid"]["customTexts"]["NamË"]["enable"] = true
    E.db["unitframe"]["units"]["raid"]["customTexts"]["NamË"]["font"] = "Accidental Presidency"
    E.db["unitframe"]["units"]["raid"]["customTexts"]["NamË"]["fontOutline"] = "OUTLINE"
    E.db["unitframe"]["units"]["raid"]["customTexts"]["NamË"]["justifyH"] = "LEFT"
    E.db["unitframe"]["units"]["raid"]["customTexts"]["NamË"]["size"] = 18
    E.db["unitframe"]["units"]["raid"]["customTexts"]["NamË"]["text_format"] = "[classcolor][name:abbrev]"
    E.db["unitframe"]["units"]["raid"]["customTexts"]["NamË"]["xOffset"] = 0
    E.db["unitframe"]["units"]["raid"]["customTexts"]["NamË"]["yOffset"] = 0
    E.db["unitframe"]["units"]["raid"]["growthDirection"] = "RIGHT_UP"
    E.db["unitframe"]["units"]["raid"]["healPrediction"]["absorbStyle"] = "REVERSED"
    E.db["unitframe"]["units"]["raid"]["health"]["text_format"] = ""
    E.db["unitframe"]["units"]["raid"]["height"] = 30
    E.db["unitframe"]["units"]["raid"]["horizontalSpacing"] = 1
    E.db["unitframe"]["units"]["raid"]["name"]["position"] = "LEFT"
    E.db["unitframe"]["units"]["raid"]["name"]["text_format"] = ""
    E.db["unitframe"]["units"]["raid"]["name"]["xOffset"] = 2
    E.db["unitframe"]["units"]["raid"]["numGroups"] = 8
    E.db["unitframe"]["units"]["raid"]["orientation"] = "LEFT"
    E.db["unitframe"]["units"]["raid"]["power"]["enable"] = false
    E.db["unitframe"]["units"]["raid"]["rdebuffs"]["font"] = "Accidental Presidency"
    E.db["unitframe"]["units"]["raid"]["rdebuffs"]["fontOutline"] = "OUTLINE"
    E.db["unitframe"]["units"]["raid"]["rdebuffs"]["fontSize"] = 18
    E.db["unitframe"]["units"]["raid"]["rdebuffs"]["size"] = 28
    E.db["unitframe"]["units"]["raid"]["rdebuffs"]["xOffset"] = 20
    E.db["unitframe"]["units"]["raid"]["rdebuffs"]["yOffset"] = 1
    E.db["unitframe"]["units"]["raid"]["readycheckIcon"]["position"] = "CENTER"
    E.db["unitframe"]["units"]["raid"]["readycheckIcon"]["size"] = 20
    E.db["unitframe"]["units"]["raid"]["resurrectIcon"]["attachToObject"] = "Health"
    E.db["unitframe"]["units"]["raid"]["roleIcon"]["size"] = 14
    E.db["unitframe"]["units"]["raid"]["roleIcon"]["xOffset"] = 0
    E.db["unitframe"]["units"]["raid"]["verticalSpacing"] = 1
    E.db["unitframe"]["units"]["raid"]["visibility"] = "[@raid6,noexists] hide;show"
    E.db["unitframe"]["units"]["raid"]["width"] = 110
    E.db["unitframe"]["units"]["raid40"]["enable"] = false
    E.db["unitframe"]["units"]["raid40"]["rdebuffs"]["font"] = "Accidental Presidency"
    E.db["unitframe"]["units"]["tank"]["enable"] = false

    --Target Frames--
    --Custom Texts --
    E.db["unitframe"]["units"]["target"]["customTexts"] = E.db["unitframe"]["units"]["target"]["customTexts"] or {}
    E.db["unitframe"]["units"]["target"]["customTexts"]["Namë"] = {}
    E.db["unitframe"]["units"]["target"]["customTexts"]["HPValue"] = {}

    E.db["unitframe"]["units"]["target"]["CombatIcon"]["size"] = 25
    E.db["unitframe"]["units"]["target"]["aurabar"]["enable"] = false
    E.db["unitframe"]["units"]["target"]["buffs"]["anchorPoint"] = "TOPLEFT"
    E.db["unitframe"]["units"]["target"]["buffs"]["countFont"] = "Accidental Presidency"
    E.db["unitframe"]["units"]["target"]["buffs"]["enable"] = false
    E.db["unitframe"]["units"]["target"]["buffs"]["growthX"] = "RIGHT"
    E.db["unitframe"]["units"]["target"]["buffs"]["priority"] = "Blacklist,Personal,PlayerBuffs,Whitelist,blockNoDuration,nonPersonal"
    E.db["unitframe"]["units"]["target"]["castbar"]["customTextFont"]["enable"] = true
    E.db["unitframe"]["units"]["target"]["castbar"]["customTextFont"]["font"] = "Accidental Presidency"
    E.db["unitframe"]["units"]["target"]["castbar"]["customTextFont"]["fontSize"] = 18
    E.db["unitframe"]["units"]["target"]["castbar"]["customTimeFont"]["enable"] = true
    E.db["unitframe"]["units"]["target"]["castbar"]["customTimeFont"]["font"] = "Accidental Presidency"
    E.db["unitframe"]["units"]["target"]["castbar"]["customTimeFont"]["fontSize"] = 18
    E.db["unitframe"]["units"]["target"]["castbar"]["format"] = "REMAININGMAX"
    E.db["unitframe"]["units"]["target"]["castbar"]["height"] = 20
    E.db["unitframe"]["units"]["target"]["castbar"]["icon"] = false
    E.db["unitframe"]["units"]["target"]["castbar"]["insideInfoPanel"] = false
    E.db["unitframe"]["units"]["target"]["castbar"]["textColor"]["b"] = 0.9843137254902
    E.db["unitframe"]["units"]["target"]["castbar"]["textColor"]["g"] = 1
    E.db["unitframe"]["units"]["target"]["castbar"]["textColor"]["r"] = 0.9843137254902
    E.db["unitframe"]["units"]["target"]["castbar"]["width"] = 300
    E.db["unitframe"]["units"]["target"]["customTexts"]["HPValue"]["attachTextTo"] = "Health"
    E.db["unitframe"]["units"]["target"]["customTexts"]["HPValue"]["enable"] = true
    E.db["unitframe"]["units"]["target"]["customTexts"]["HPValue"]["font"] = "Accidental Presidency"
    E.db["unitframe"]["units"]["target"]["customTexts"]["HPValue"]["fontOutline"] = "OUTLINE"
    E.db["unitframe"]["units"]["target"]["customTexts"]["HPValue"]["justifyH"] = "LEFT"
    E.db["unitframe"]["units"]["target"]["customTexts"]["HPValue"]["size"] = 26
    E.db["unitframe"]["units"]["target"]["customTexts"]["HPValue"]["text_format"] = "[classcolor][health:current:shortvalue]"
    E.db["unitframe"]["units"]["target"]["customTexts"]["HPValue"]["xOffset"] = 0
    E.db["unitframe"]["units"]["target"]["customTexts"]["HPValue"]["yOffset"] = -30
    E.db["unitframe"]["units"]["target"]["customTexts"]["Namë"]["attachTextTo"] = "Health"
    E.db["unitframe"]["units"]["target"]["customTexts"]["Namë"]["enable"] = true
    E.db["unitframe"]["units"]["target"]["customTexts"]["Namë"]["font"] = "Accidental Presidency"
    E.db["unitframe"]["units"]["target"]["customTexts"]["Namë"]["fontOutline"] = "OUTLINE"
    E.db["unitframe"]["units"]["target"]["customTexts"]["Namë"]["justifyH"] = "RIGHT"
    E.db["unitframe"]["units"]["target"]["customTexts"]["Namë"]["size"] = 26
    E.db["unitframe"]["units"]["target"]["customTexts"]["Namë"]["text_format"] = "[classcolor][name]"
    E.db["unitframe"]["units"]["target"]["customTexts"]["Namë"]["xOffset"] = -10
    E.db["unitframe"]["units"]["target"]["customTexts"]["Namë"]["yOffset"] = 22
    E.db["unitframe"]["units"]["target"]["debuffs"]["countFont"] = "Accidental Presidency"
    E.db["unitframe"]["units"]["target"]["debuffs"]["maxDuration"] = 0
    E.db["unitframe"]["units"]["target"]["debuffs"]["priority"] = "Blacklist,Personal,nonPersonal"
    E.db["unitframe"]["units"]["target"]["debuffs"]["sizeOverride"] = 26
    E.db["unitframe"]["units"]["target"]["disableMouseoverGlow"] = true
    E.db["unitframe"]["units"]["target"]["healPrediction"]["absorbStyle"] = "NORMAL"
    E.db["unitframe"]["units"]["target"]["health"]["position"] = "LEFT"
    E.db["unitframe"]["units"]["target"]["health"]["text_format"] = ""
    E.db["unitframe"]["units"]["target"]["health"]["xOffset"] = 2
    E.db["unitframe"]["units"]["target"]["height"] = 35
    E.db["unitframe"]["units"]["target"]["infoPanel"]["height"] = 30
    E.db["unitframe"]["units"]["target"]["name"]["text_format"] = ""
    E.db["unitframe"]["units"]["target"]["orientation"] = "LEFT"
    E.db["unitframe"]["units"]["target"]["power"]["detachedWidth"] = 150
    E.db["unitframe"]["units"]["target"]["power"]["enable"] = false
    E.db["unitframe"]["units"]["target"]["power"]["position"] = "RIGHT"
    E.db["unitframe"]["units"]["target"]["power"]["text_format"] = ""
    E.db["unitframe"]["units"]["target"]["power"]["xOffset"] = -2
    E.db["unitframe"]["units"]["target"]["width"] = 300


    --Target of Target Frames--
    --Custom Texts --
    E.db["unitframe"]["units"]["targettarget"]["customTexts"] = E.db["unitframe"]["units"]["targettarget"]["customTexts"] or {}
    E.db["unitframe"]["units"]["targettarget"]["customTexts"]["Namë"] = {}
    E.db["unitframe"]["units"]["targettarget"]["customTexts"]["HPValue"] = {}

    E.db["unitframe"]["units"]["targettarget"]["buffs"]["anchorPoint"] = "TOPLEFT"
    E.db["unitframe"]["units"]["targettarget"]["buffs"]["countFont"] = "Accidental Presidency"
    E.db["unitframe"]["units"]["targettarget"]["buffs"]["maxDuration"] = 0
    E.db["unitframe"]["units"]["targettarget"]["buffs"]["perrow"] = 8
    E.db["unitframe"]["units"]["targettarget"]["buffs"]["priority"] = "Blacklist,Personal,PlayerBuffs,Whitelist,blockNoDuration,nonPersonal"
    E.db["unitframe"]["units"]["targettarget"]["customTexts"]["HPValue"]["attachTextTo"] = "Health"
    E.db["unitframe"]["units"]["targettarget"]["customTexts"]["HPValue"]["enable"] = false
    E.db["unitframe"]["units"]["targettarget"]["customTexts"]["HPValue"]["font"] = "Accidental Presidency"
    E.db["unitframe"]["units"]["targettarget"]["customTexts"]["HPValue"]["fontOutline"] = "OUTLINE"
    E.db["unitframe"]["units"]["targettarget"]["customTexts"]["HPValue"]["justifyH"] = "RIGHT"
    E.db["unitframe"]["units"]["targettarget"]["customTexts"]["HPValue"]["size"] = 26
    E.db["unitframe"]["units"]["targettarget"]["customTexts"]["HPValue"]["text_format"] = "[health:current:shortvalue]"
    E.db["unitframe"]["units"]["targettarget"]["customTexts"]["HPValue"]["xOffset"] = 0
    E.db["unitframe"]["units"]["targettarget"]["customTexts"]["HPValue"]["yOffset"] = -30
    E.db["unitframe"]["units"]["targettarget"]["customTexts"]["Namë"]["attachTextTo"] = "Health"
    E.db["unitframe"]["units"]["targettarget"]["customTexts"]["Namë"]["enable"] = true
    E.db["unitframe"]["units"]["targettarget"]["customTexts"]["Namë"]["font"] = "Accidental Presidency"
    E.db["unitframe"]["units"]["targettarget"]["customTexts"]["Namë"]["fontOutline"] = "OUTLINE"
    E.db["unitframe"]["units"]["targettarget"]["customTexts"]["Namë"]["justifyH"] = "CENTER"
    E.db["unitframe"]["units"]["targettarget"]["customTexts"]["Namë"]["size"] = 20
    E.db["unitframe"]["units"]["targettarget"]["customTexts"]["Namë"]["text_format"] = "[classcolor][name]"
    E.db["unitframe"]["units"]["targettarget"]["customTexts"]["Namë"]["xOffset"] = 0
    E.db["unitframe"]["units"]["targettarget"]["customTexts"]["Namë"]["yOffset"] = 0
    E.db["unitframe"]["units"]["targettarget"]["debuffs"]["anchorPoint"] = "TOPRIGHT"
    E.db["unitframe"]["units"]["targettarget"]["debuffs"]["countFont"] = "Accidental Presidency"
    E.db["unitframe"]["units"]["targettarget"]["debuffs"]["maxDuration"] = 0
    E.db["unitframe"]["units"]["targettarget"]["debuffs"]["perrow"] = 8
    E.db["unitframe"]["units"]["targettarget"]["debuffs"]["priority"] = "Blacklist,Personal,nonPersonal"
    E.db["unitframe"]["units"]["targettarget"]["disableMouseoverGlow"] = true
    E.db["unitframe"]["units"]["targettarget"]["healPrediction"]["absorbStyle"] = "REVERSED"
    E.db["unitframe"]["units"]["targettarget"]["healPrediction"]["enable"] = true
    E.db["unitframe"]["units"]["targettarget"]["health"]["position"] = "LEFT"
    E.db["unitframe"]["units"]["targettarget"]["health"]["xOffset"] = 2
    E.db["unitframe"]["units"]["targettarget"]["height"] = 25
    E.db["unitframe"]["units"]["targettarget"]["infoPanel"]["height"] = 20
    E.db["unitframe"]["units"]["targettarget"]["name"]["text_format"] = ""
    E.db["unitframe"]["units"]["targettarget"]["orientation"] = "LEFT"
    E.db["unitframe"]["units"]["targettarget"]["power"]["detachedWidth"] = 150
    E.db["unitframe"]["units"]["targettarget"]["power"]["enable"] = false
    E.db["unitframe"]["units"]["targettarget"]["power"]["position"] = "RIGHT"
    E.db["unitframe"]["units"]["targettarget"]["power"]["xOffset"] = -2
    E.db["unitframe"]["units"]["targettarget"]["threatStyle"] = "GLOW"
    E.db["unitframe"]["units"]["targettarget"]["width"] = 150
    

    --  GLOBAL SETTINGS -- ========================================= --
    --  GLOBAL SETTINGS -- ========================================= --
    --  GLOBAL SETTINGS -- ========================================= --
    E.global["datatexts"]["customPanels"]["Right Panel Replacement"]["backdrop"] = true
    E.global["datatexts"]["customPanels"]["Right Panel Replacement"]["border"] = true
    E.global["datatexts"]["customPanels"]["Right Panel Replacement"]["fonts"]["enable"] = false
    E.global["datatexts"]["customPanels"]["Right Panel Replacement"]["fonts"]["font"] = "PT Sans Narrow"
    E.global["datatexts"]["customPanels"]["Right Panel Replacement"]["fonts"]["fontOutline"] = "OUTLINE"
    E.global["datatexts"]["customPanels"]["Right Panel Replacement"]["fonts"]["fontSize"] = 12
    E.global["datatexts"]["customPanels"]["Right Panel Replacement"]["frameLevel"] = 1
    E.global["datatexts"]["customPanels"]["Right Panel Replacement"]["frameStrata"] = "LOW"
    E.global["datatexts"]["customPanels"]["Right Panel Replacement"]["growth"] = "HORIZONTAL"
    E.global["datatexts"]["customPanels"]["Right Panel Replacement"]["height"] = 24
    E.global["datatexts"]["customPanels"]["Right Panel Replacement"]["mouseover"] = false
    E.global["datatexts"]["customPanels"]["Right Panel Replacement"]["name"] = "Right Panel Replacement"
    E.global["datatexts"]["customPanels"]["Right Panel Replacement"]["numPoints"] = 3
    E.global["datatexts"]["customPanels"]["Right Panel Replacement"]["panelTransparency"] = true
    E.global["datatexts"]["customPanels"]["Right Panel Replacement"]["textJustify"] = "CENTER"
    E.global["datatexts"]["customPanels"]["Right Panel Replacement"]["tooltipAnchor"] = "ANCHOR_TOPLEFT"
    E.global["datatexts"]["customPanels"]["Right Panel Replacement"]["tooltipXOffset"] = -17
    E.global["datatexts"]["customPanels"]["Right Panel Replacement"]["tooltipYOffset"] = 4
    E.global["datatexts"]["customPanels"]["Right Panel Replacement"]["visibility"] = "[petbattle] hide;show"
    E.global["datatexts"]["customPanels"]["Right Panel Replacement"]["width"] = 473
    E.global["datatexts"]["settings"]["Gold"]["goldCoins"] = false
    E.global["datatexts"]["settings"]["Gold"]["goldFormat"] = "FULL"
    E.global["datatexts"]["settings"]["System"]["ShowOthers"] = false
    E.global["general"]["commandBarSetting"] = "DISABLED"
    

    --  GLOBAL SETTINGS -- ========================================= --
    --  GLOBAL SETTINGS -- ========================================= --
    --  GLOBAL SETTINGS -- ========================================= --

    --  PRIVATE SETTINGS -- ========================================= --
    --  PRIVATE SETTINGS -- ========================================= --
    --  PRIVATE SETTINGS -- ========================================= --

    E.private["WT"]["maps"]["instanceDifficulty"]["enable"] = true
    E.private["WT"]["maps"]["instanceDifficulty"]["font"]["style"] = "NONE"
    E.private["WT"]["maps"]["minimapButtons"]["backdropSpacing"] = 2
    E.private["WT"]["maps"]["minimapButtons"]["buttonSize"] = 25
    E.private["WT"]["maps"]["minimapButtons"]["buttonsPerRow"] = 2
    E.private["WT"]["maps"]["minimapButtons"]["mouseOver"] = true
    E.private["WT"]["maps"]["minimapButtons"]["spacing"] = 5
    E.private["WT"]["maps"]["superTracker"]["enable"] = false
    E.private["WT"]["maps"]["worldMap"]["enable"] = false
    E.private["WT"]["maps"]["worldMap"]["scale"]["enable"] = false
    E.private["WT"]["quest"]["objectiveTracker"]["header"]["size"] = 22
    E.private["WT"]["quest"]["objectiveTracker"]["header"]["name"] = "Accidental Presidency"
    E.private["WT"]["quest"]["objectiveTracker"]["info"]["style"] = "NONE"
    E.private["WT"]["quest"]["objectiveTracker"]["title"]["style"] = "NONE"
    E.private["WT"]["quest"]["objectiveTracker"]["titleColor"]["customColorHighlight"]["b"] = 0.41960784313725
    E.private["WT"]["quest"]["objectiveTracker"]["titleColor"]["customColorHighlight"]["g"] = 0.82745098039216
    E.private["WT"]["quest"]["objectiveTracker"]["titleColor"]["customColorHighlight"]["r"] = 1
    E.private["WT"]["quest"]["objectiveTracker"]["titleColor"]["customColorNormal"]["b"] = 0.1921568627451
    E.private["WT"]["quest"]["objectiveTracker"]["titleColor"]["customColorNormal"]["g"] = 0.78039215686275
    E.private["WT"]["quest"]["objectiveTracker"]["titleColor"]["customColorNormal"]["r"] = 1
    E.private["WT"]["skins"]["addons"]["weakAuras"] = false
    E.private["WT"]["skins"]["blizzard"]["enable"] = false
    E.private["WT"]["skins"]["elvui"]["enable"] = false
    E.private["WT"]["skins"]["errorMessage"]["size"] = 20
    E.private["WT"]["skins"]["removeParchment"] = false
    E.private["WT"]["skins"]["shadow"] = false
    E.private["WT"]["unitFrames"]["roleIcon"]["enable"] = false
    E.private["bags"]["enable"] = false
    E.private["general"]["chatBubbleFont"] = "Accidental Presidency"
    E.private["general"]["chatBubbleFontSize"] = 18
    E.private["general"]["chatBubbles"] = "nobackdrop"
    E.private["general"]["dmgfont"] = "Accidental Presidency"
    E.private["general"]["glossTex"] = "Solid"
    E.private["general"]["namefont"] = "Accidental Presidency"
    E.private["general"]["nameplateFont"] = "Accidental Presidency"
    E.private["general"]["nameplateLargeFont"] = "Accidental Presidency"
    E.private["general"]["normTex"] = "Solid"
    E.private["general"]["totemBar"] = false
    E.private["install_complete"] = 12.79
    E.private["nameplates"]["enable"] = false
    E.private["skins"]["parchmentRemoverEnable"] = true
    
    
    
    --  PRIVATE SETTINGS -- ========================================= --
    --  PRIVATE SETTINGS -- ========================================= --
    --  PRIVATE SETTINGS -- ========================================= --


    
	--[[
		--If you want to modify the base layout according to
		-- certain conditions then this is how you could do it
		if layout == "tank" then
			--Make some changes to the layout posted above
		elseif layout == "dps" then
			--Make some other changes
		elseif layout == "healer" then
			--Make some different changes
		end
	--]]


	--[[
	--	This section at the bottom is just to update ElvUI and display a message
	--]]
	--Update ElvUI
	E:UpdateAll(true)
	--Show message about layout being set
	PluginInstallStepComplete.message = "Layout Set"
	PluginInstallStepComplete:Show()
end

--Function to create a new profile
local function ElvUINewProfile()
    E.PopupDialogs.ClaqUICreateProfileNameNew = {
        text = "Name for the new profile",
        hasEditBox = 1,
        whileDead = 1,
        hideOnEscape = 1,
        OnShow = function(frame)
            frame.editBox:SetAutoFocus(false)
            frame.editBox.width = frame.editBox:GetWidth()
            frame.editBox:Width(220)
            
            frame.editBox:HighlightText()
        end,
        OnHide = function(frame)
            frame.editBox:Width(frame.editBox.width or 50)
            frame.editBox.width = nil
        end,
        button1 = OKAY,
        button2 = CANCEL,
        OnAccept = function(frame)
            local text = frame.editBox:GetText()
            E.data:SetProfile(text)
            E:StaticPopup_Hide("INCOMPATIBLE_ADDON")
            
            
            
        end,
        EditBoxOnEnterPressed = function(frame)
            frame:GetParent():Hide()
        end,
        EditBoxOnEscapePressed = function(frame)
            frame:GetParent():Hide()
        end,
        EditBoxOnTextChanged = E.noop,
        OnEditFocusGained = function(frame)
            frame:HighlightText()
        end
    }

    E:StaticPopup_Show("ClaqUICreateProfileNameNew")
end    

--This function is executed when you press "Skip Process" or "Finished" in the installer.
local function InstallComplete()
	if GetCVarBool("Sound_EnableMusic") then
		StopMusic()
	end

	--Set a variable tracking the version of the addon when layout was installed
	E.db[MyPluginName].install_version = Version

	ReloadUI()
end

--This is the data we pass on to the ElvUI Plugin Installer.
--The Plugin Installer is reponsible for displaying the install guide for this layout.
local InstallerData = {
	Title = format("|c5c358584%s %s|r", MyPluginName, "Installation"),
	Name = MyPluginName,
	--tutorialImage = "Interface/AddOns/ElvUI_ClaqUI/FunkoSam.tga", --If you have a logo you want to use, otherwise it uses the one from ElvUI
	Pages = {
		[1] = function()
			PluginInstallFrame.SubTitle:SetFormattedText("Welcome to the installation for %s.", MyPluginName)
			PluginInstallFrame.Desc1:SetText("This installation process will guide you through a few steps and apply settings to your current ElvUI profile. If you want to be able to go back to your original settings then create a new profile before going through this installation process.")
			PluginInstallFrame.Desc2:SetText("Please press the continue button if you wish to go through the installation process, otherwise click the 'Skip Process' button.")
            PluginInstallFrame.Desc3:SetText("A few things like bags/nameplates are done with Bagnon/Plater so I recommend using them instead of the default ElvUI modules.")
			PluginInstallFrame.Option1:Show()
			PluginInstallFrame.Option1:SetScript("OnClick", InstallComplete)
			PluginInstallFrame.Option1:SetText("Skip Process")
		end,
        [2] = function()
            PluginInstallFrame.SubTitle:SetText("Profile")
            PluginInstallFrame.Desc1:SetText("Please create a new profile to ensure no old configurations are kept")
            PluginInstallFrame.Desc2:SetText("Importance: |cff07D400High|r")
            PluginInstallFrame.Option1:Show()
			PluginInstallFrame.Option1:SetScript("OnClick", function() ElvUINewProfile() end)
			PluginInstallFrame.Option1:SetText("New Profile")
        end,
		[3] = function()
			PluginInstallFrame.SubTitle:SetText("Layouts")
			PluginInstallFrame.Desc1:SetText("These are the layouts that are available. Please click a button below to apply the layout of your choosing.")
			PluginInstallFrame.Desc2:SetText("Importance: |cff07D400High|r")
			PluginInstallFrame.Option1:Show()
			PluginInstallFrame.Option1:SetScript("OnClick", function() SetupLayout("Base") end)
			PluginInstallFrame.Option1:SetText("Install")
			
		end,
        
        [4] = function()
            PluginInstallFrame.SubTitle:SetText("Soon")
        end,
        [5] = function()
            PluginInstallFrame.SubTitle:SetText("Soon")
        end,
        [6] = function()
            PluginInstallFrame.SubTitle:SetText("Soon")
        end,
        [7] = function()
			PluginInstallFrame.SubTitle:SetText("Installation Complete")
			PluginInstallFrame.Desc1:SetText("You have completed the installation process.")
			PluginInstallFrame.Desc2:SetText("Please click the button below in order to finalize the process and automatically reload your UI.")
			PluginInstallFrame.Option1:Show()
			PluginInstallFrame.Option1:SetScript("OnClick", InstallComplete)
			PluginInstallFrame.Option1:SetText("Finished")
		end,
	},
	StepTitles = {
		[1] = "Welcome",
		[2] = "Layouts",
        [3] = "Plater",
        [4] = "Details",
        [5] = "Bigwigs",
        [6] = "Weakauras",
		[7] = "Installation Complete"
	},
	StepTitlesColor = {1, 1, 1,1,1,1,1},
	StepTitlesColorSelected = {0, 179/255, 1},
	StepTitleWidth = 200,
	StepTitleButtonWidth = 180,
	StepTitleTextJustification = "RIGHT",
}

--This function holds the options table which will be inserted into the ElvUI config
local function InsertOptions()
	E.Options.args.MyPluginName = {
		order = 100,
		type = "group",
		name = format("|c5c358584%s|r", MyPluginName),
		args = {
			header1 = {
				order = 1,
				type = "header",
				name = MyPluginName,
			},
			description1 = {
				order = 2,
				type = "description",
				name = format("%s is a layout for ElvUI.", MyPluginName),
			},
			spacer1 = {
				order = 3,
				type = "description",
				name = "\n\n\n",
			},
			header2 = {
				order = 4,
				type = "header",
				name = "Installation",
			},
			description2 = {
				order = 5,
				type = "description",
				name = "The installation guide should pop up automatically after you have completed the ElvUI installation. If you wish to re-run the installation process for this layout then please click the button below.",
			},
			spacer2 = {
				order = 6,
				type = "description",
				name = "",
			},
			install = {
				order = 7,
				type = "execute",
				name = "Install",
				desc = "Run the installation process.",
				func = function() E:GetModule("PluginInstaller"):Queue(InstallerData); E:ToggleOptionsUI(); end,
			},
		},
	}
end

--Create a unique table for our plugin
P[MyPluginName] = {}

--This function will handle initialization of the addon
function ClaqUI:Initialize()
	--Initiate installation process if ElvUI install is complete and our plugin install has not yet been run
	if E.private.install_complete and E.db[MyPluginName].install_version == nil then
		E:GetModule("PluginInstaller"):Queue(InstallerData)
	end

	--Insert our options table when ElvUI config is loaded
	EP:RegisterPlugin(addon, InsertOptions)
end

--Register module with callback so it gets initialized when ready
E:RegisterModule(ClaqUI:GetName())
