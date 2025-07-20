local TQG = TheQuestingGuide or {}

------------------------------------
--LibConsoleDialog Setup
------------------------------------

local LCD = LibConsoleDialogs
local tqgMenuGamepad = LCD:Create(TQG.name)

local buttonOverview = {
    type = LibHarvensAddonSettings.ST_BUTTON,
    label = "Example Button",
    tooltip = "This is an example button",
    buttonText = "Click me!",
    clickHandler = function(control, button) SCENE_MANAGER:Push("TheQuestingGuideOverview_gp") end,
    disable = function() return end
}
local buttonClassic = {
    type = LibHarvensAddonSettings.ST_BUTTON,
    label = "Example Button",
    tooltip = "This is an example button",
    buttonText = "Click me!",
    clickHandler = function(control, button) SCENE_MANAGER:Push("TheQuestingGuideClassic_gp") end,
    disable = function() return end
}
local buttonDLC = {
    type = LibHarvensAddonSettings.ST_BUTTON,
    label = "Example Button",
    tooltip = "This is an example button",
    buttonText = "Click me!",
    clickHandler = function(control, button) SCENE_MANAGER:Push("TheQuestingGuideDLC_gp") end,
    disable = function() return end
}
local buttonGroup = {
    type = LibHarvensAddonSettings.ST_BUTTON,
    label = "Example Button",
    tooltip = "This is an example button",
    buttonText = "Click me!",
    clickHandler = function(control, button) SCENE_MANAGER:Push("TheQuestingGuideGroup_gp") end,
    disable = function() return end
}

tqgMenuGamepad:AddSetting(buttonOverview)
tqgMenuGamepad:AddSetting(buttonClassic)
tqgMenuGamepad:AddSetting(buttonDLC)
tqgMenuGamepad:AddSetting(buttonGroup)

QUESTINGGUIDE_MENU_GAMEPAD = tqgMenuGamepad

-- Adding the dialog to the journal.
LCD:RegisterKeybind(GAMEPAD_QUEST_JOURNAL_ROOT_SCENE, {
    name = GetString(TQG_MENU_TITLE),
    tooltip = "Brief description of option 1", -- optional
    alignment = KEYBIND_STRIP_ALIGN_CENTER,
    callback = function(buttonInfo)
        -- Do your stuff here, eg.
        QUESTINGGUIDE_MENU_GAMEPAD:Show()
    end,
    visible = true,
    order = 100
})

------------------------------------
--Addon Load
------------------------------------

local function addonLoaded(event, addonName)
    if addonName ~= TQG.name then return end

    EVENT_MANAGER:UnregisterForEvent("TheQuestingGuide_GP", EVENT_ADD_ON_LOADED)
end
EVENT_MANAGER:RegisterForEvent("TheQuestingGuide_GP", EVENT_ADD_ON_LOADED,
                               addonLoaded)

function TQG.ToggleMenu_Gamepad()
    SCENE_MANAGER:Push("TheQuestingGuideDLC_gp")
end

------------------------------------
--Create Scenes
------------------------------------

do
    TQG_OVERVIEW_GAMEPAD_SCENE = ZO_Scene:New("TheQuestingGuideOverview_gp",
                                             SCENE_MANAGER)
    TQG_OVERVIEW_GAMEPAD_SCENE:AddFragmentGroup(
        FRAGMENT_GROUP.GAMEPAD_DRIVEN_UI_WINDOW)
    TQG_OVERVIEW_GAMEPAD_SCENE:AddFragmentGroup(
        FRAGMENT_GROUP.FRAME_TARGET_GAMEPAD)
    TQG_OVERVIEW_GAMEPAD_SCENE:AddFragment(FRAME_EMOTE_FRAGMENT_JOURNAL)
    TQG_OVERVIEW_GAMEPAD_SCENE:AddFragment(
        GAMEPAD_NAV_QUADRANT_1_BACKGROUND_FRAGMENT)
    TQG_OVERVIEW_GAMEPAD_SCENE:AddFragment(
        GAMEPAD_NAV_QUADRANT_2_3_BACKGROUND_FRAGMENT)
    TQG_OVERVIEW_GAMEPAD_SCENE:AddFragment(MINIMIZE_CHAT_FRAGMENT)
    TQG_OVERVIEW_GAMEPAD_SCENE:AddFragment(GAMEPAD_MENU_SOUND_FRAGMENT)
end

do
    TQG_CLASSIC_GAMEPAD_SCENE = ZO_Scene:New("TheQuestingGuideClassic_gp",
                                             SCENE_MANAGER)
    TQG_CLASSIC_GAMEPAD_SCENE:AddFragmentGroup(
        FRAGMENT_GROUP.GAMEPAD_DRIVEN_UI_WINDOW)
    TQG_CLASSIC_GAMEPAD_SCENE:AddFragmentGroup(
        FRAGMENT_GROUP.FRAME_TARGET_GAMEPAD)
    TQG_CLASSIC_GAMEPAD_SCENE:AddFragment(FRAME_EMOTE_FRAGMENT_JOURNAL)
    TQG_CLASSIC_GAMEPAD_SCENE:AddFragment(
        GAMEPAD_NAV_QUADRANT_1_BACKGROUND_FRAGMENT)
    TQG_CLASSIC_GAMEPAD_SCENE:AddFragment(
        GAMEPAD_NAV_QUADRANT_2_3_BACKGROUND_FRAGMENT)
    TQG_CLASSIC_GAMEPAD_SCENE:AddFragment(MINIMIZE_CHAT_FRAGMENT)
    TQG_CLASSIC_GAMEPAD_SCENE:AddFragment(GAMEPAD_MENU_SOUND_FRAGMENT)
end

do
    TQG_DLC_GAMEPAD_SCENE = ZO_Scene:New("TheQuestingGuideDLC_gp",
                                             SCENE_MANAGER)
    TQG_DLC_GAMEPAD_SCENE:AddFragmentGroup(
        FRAGMENT_GROUP.GAMEPAD_DRIVEN_UI_WINDOW)
    TQG_DLC_GAMEPAD_SCENE:AddFragmentGroup(
        FRAGMENT_GROUP.FRAME_TARGET_GAMEPAD)
    TQG_DLC_GAMEPAD_SCENE:AddFragment(FRAME_EMOTE_FRAGMENT_JOURNAL)
    TQG_DLC_GAMEPAD_SCENE:AddFragment(
        GAMEPAD_NAV_QUADRANT_1_BACKGROUND_FRAGMENT)
    TQG_DLC_GAMEPAD_SCENE:AddFragment(
        GAMEPAD_NAV_QUADRANT_2_3_BACKGROUND_FRAGMENT)
    TQG_DLC_GAMEPAD_SCENE:AddFragment(MINIMIZE_CHAT_FRAGMENT)
    TQG_DLC_GAMEPAD_SCENE:AddFragment(GAMEPAD_MENU_SOUND_FRAGMENT)
end

do
    TQG_GROUP_GAMEPAD_SCENE = ZO_Scene:New("TheQuestingGuideGroup_gp",
                                             SCENE_MANAGER)
    TQG_GROUP_GAMEPAD_SCENE:AddFragmentGroup(
        FRAGMENT_GROUP.GAMEPAD_DRIVEN_UI_WINDOW)
    TQG_GROUP_GAMEPAD_SCENE:AddFragmentGroup(
        FRAGMENT_GROUP.FRAME_TARGET_GAMEPAD)
    TQG_GROUP_GAMEPAD_SCENE:AddFragment(FRAME_EMOTE_FRAGMENT_JOURNAL)
    TQG_GROUP_GAMEPAD_SCENE:AddFragment(
        GAMEPAD_NAV_QUADRANT_1_BACKGROUND_FRAGMENT)
    TQG_GROUP_GAMEPAD_SCENE:AddFragment(
        GAMEPAD_NAV_QUADRANT_2_3_BACKGROUND_FRAGMENT)
    TQG_GROUP_GAMEPAD_SCENE:AddFragment(MINIMIZE_CHAT_FRAGMENT)
    TQG_GROUP_GAMEPAD_SCENE:AddFragment(GAMEPAD_MENU_SOUND_FRAGMENT)
end

------------------------------------
--Create Custom Tooltip Function
------------------------------------

local CHECKED_ICON =
    "EsoUI/Art/Inventory/Gamepad/gp_inventory_icon_equipped.dds"
local UNCHECKED_ICON = "EsoUI/Art/Miscellaneous/Gamepad/gp_bullet_ochre.dds"

function ZO_Tooltip:LayoutTheQuestingGuide(category, zoneIndex, tab)
    local mainSection = self:AcquireSection(self:GetStyle("cadwellSection"),
                                            self:GetStyle("tooltip"))

    local titleSection = self:AcquireSection(self:GetStyle(
                                                 "cadwellObjectiveTitleSection"))
    titleSection:AddLine(GetString(SI_CADWELL_OBJECTIVES),
                         self:GetStyle("cadwellObjectiveTitle"))
    mainSection:AddSection(titleSection)

    objectives = {}
    local function AddObjective(name, openingText, closingText, objectiveOrder,
                                discovered, completed, optional)
        table.insert(objectives, {
            name = name,
            openingText = openingText,
            closingText = closingText,
            order = objectiveOrder,
            discovered = discovered,
            completed = completed
        })
    end

    local hasPrologue, numPrologueQuests =
        TQG.DoesZoneHavePrologue(tab, category, zoneIndex)

    local hasZoneStoryQuests, numZoneStoryQuests =
        TQG.DoesZoneHaveStoryQuests(tab, category, zoneIndex)

    if hasZoneStoryQuests then
        if hasPrologue then
            local prologueIndex = 0
            repeat
                prologueIndex = prologueIndex + 1

                local name, openingText, closingText, objectiveOrder,
                      discovered, completed, optional, prologue =
                    TQG.GetObjectiveInfoForCategoryAndZone(tab, category,
                                                           zoneIndex,
                                                           prologueIndex)

                if not prologue then break end

                AddObjective(name, openingText, closingText, objectiveOrder,
                             discovered, completed, optional)
            until not prologue
        end
        for objectiveIndex = 1, numZoneStoryQuests do
            local name, openingText, closingText, objectiveOrder, discovered,
                  completed, optional, hasBlockingText =
                TQG.GetZoneStoryQuestInfoForCategoryAndZone(tab, category,
                                                            zoneIndex,
                                                            objectiveIndex)

            local objectiveOrder = objectiveIndex + numPrologueQuests

            AddObjective(name, openingText, closingText, objectiveOrder,
                         discovered, completed, optional)

            if hasBlockingText then break end
        end
    else
        local numObjectives = TQG.GetNumObjectivesForCategoryAndZone(tab,
                                                                     category,
                                                                     zoneIndex)

        for objectiveIndex = 1, numObjectives do
            local name, openingText, closingText, objectiveOrder, discovered,
                  completed, optional = TQG.GetObjectiveInfoForCategoryAndZone(
                                            tab, category, zoneIndex,
                                            objectiveIndex)
            local objectiveOrder = objectiveOrder

            AddObjective(name, openingText, closingText, objectiveOrder,
                         discovered, completed, optional)
        end
    end

    for objectiveIndex = 1, TQG.GetNumObjectivesForCategoryAndZone(tab,
                                                                   category,
                                                                   zoneIndex) do
        local name, openingText, closingText, objectiveOrder, discovered,
              completed = TQG.GetObjectiveInfoForCategoryAndZone(tab, category,
                                                                 zoneIndex,
                                                                 objectiveIndex)
    end

    table.sort(objectives, ZO_CadwellSort)

    local objectivesSection = mainSection:AcquireSection(self:GetStyle(
                                                             "cadwellObjectivesSection"))

    for i = 1, #objectives do
        local objectiveInfo = objectives[i]
        local name = objectiveInfo.name
        local openingText = objectiveInfo.openingText
        local closingText = objectiveInfo.closingText
        local discovered = objectiveInfo.discovered
        local completed = objectiveInfo.completed

        -- Extract the actual information we want to display based on the state of the objective.
        local icon
        local text
        local style
        if discovered and completed then
            icon = CHECKED_ICON
            text = closingText
            style = "cadwellObjectiveComplete"
        elseif discovered and (not completed) then
            icon = UNCHECKED_ICON
            text = openingText
            style = "cadwellObjectiveActive"
        else
            icon = UNCHECKED_ICON
            text = openingText
            style = "cadwellObjectiveInactive"
        end

        local objectiveContainerSection =
            objectivesSection:AcquireSection(self:GetStyle(
                                                 "cadwellObjectiveContainerSection"))

        -- Add the bullet icon to the tooltip.
        local textureContainerSection =
            objectiveContainerSection:AcquireSection(self:GetStyle(
                                                         "cadwellTextureContainer"))
        textureContainerSection:AddTexture(icon, self:GetStyle(
                                               "achievementCriteriaCheckComplete"))
        objectiveContainerSection:AddSection(textureContainerSection)

        -- Add the information to the tooltip.
        objectiveContainerSection:AddLine(zo_strformat(
                                              SI_CADWELL_OBJECTIVE_FORMAT, name,
                                              text), self:GetStyle(style),
                                          self:GetStyle("cadwellObjectiveText"))

        objectivesSection:AddSection(objectiveContainerSection)
    end

    mainSection:AddSection(objectivesSection)
    self:AddSection(mainSection)
end

function TheQuestingGuide_GamepadTooltip_OnInitialized(control, dialogControl)
    QUESTINGGUIDE_GAMEPAD_TOOLTIPS = ZO_GamepadTooltip:New(control,
                                                           dialogControl)
end
