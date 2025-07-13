local TQG = TheQuestingGuide or {}

------------------------------------
-- LibMainMenu Setup
------------------------------------

local LMM = LibMainMenu2

------------------------------------
-- Keybinds Setup
------------------------------------

local function GetPlayStoryButtonText(zoneId)
    if zoneId then
        if not ZONE_STORIES_KEYBOARD.IsZoneCollectibleUnlocked(zoneId) then
            return ZONE_STORIES_KEYBOARD.GetZoneCollectibleUnlockText(zoneId)
        elseif ZONE_STORIES_MANAGER.IsZoneComplete(zoneId) then
            return zo_strformat(SI_ZONE_STORY_ZONE_COMPLETE_ACTION)
        elseif ZONE_STORIES_MANAGER.IsZoneCompletionTypeComplete(zoneId,
                                                                 ZONE_COMPLETION_TYPE_PRIORITY_QUESTS) or
            not CanZoneStoryContinueTrackingActivitiesForCompletionType(zoneId,
                                                                        ZONE_COMPLETION_TYPE_PRIORITY_QUESTS) then
            return zo_strformat(SI_ZONE_STORY_EXPLORE_ZONE_ACTION)
        elseif not IsZoneStoryStarted(zoneId) then
            return zo_strformat(SI_ZONE_STORY_START_STORY_ACTION)
        else
            return zo_strformat(SI_ZONE_STORY_CONTINUE_STORY_ACTION)
        end
    end
    return "<EMPTY>"
end

local function UpdatePlayStoryButtonText(zoneId)
    local zoneId = 381
    local isZoneAvailable = ZONE_STORIES_MANAGER.GetZoneAvailability(zoneId)
    local canContinueZone = CanZoneStoryContinueTrackingActivities(zoneId)
    local playStoryButtonText = GetPlayStoryButtonText()
end

local function TrackNextActivity()
    local zoneId = 381
    if ZONE_STORIES_KEYBOARD.IsZoneCollectibleUnlocked(zoneId) then
        local SET_AUTO_MAP_NAVIGATION_TARGET = true
        local COMPLETION_TYPE_ALL = nil
        TrackNextActivityForZoneStory(zoneId, COMPLETION_TYPE_ALL,
                                      SET_AUTO_MAP_NAVIGATION_TARGET)
    else
        local lockedZoneCollectibleId = GetCollectibleIdForZone(GetZoneIndex(
                                                                    zoneId))
        local collectibleData =
            ZO_COLLECTIBLE_DATA_MANAGER:GetCollectibleDataById(
                lockedZoneCollectibleId)
        local categoryType = collectibleData:GetCategoryType()
        if categoryType == COLLECTIBLE_CATEGORY_TYPE_CHAPTER then
            ZO_ShowChapterUpgradePlatformScreen(
                MARKET_OPEN_OPERATION_ZONE_STORIES)
        else
            local searchTerm = zo_strformat(SI_CROWN_STORE_SEARCH_FORMAT_STRING,
                                            collectibleData:GetName())
            ShowMarketAndSearch(searchTerm, MARKET_OPEN_OPERATION_ZONE_STORIES)
        end
    end

end

local function GetSelectedDataForZone(object)
    local selectedData = object.navigationTree:GetSelectedData()
    if not selectedData then return end

    local tab = object.tab
    local zoneIndex = selectedData.order

    if selectedData and tab and zoneIndex then
        return selectedData, tab, zoneIndex
    end
end

local getZoneNameById = GetZoneNameById
local function GetSelectedZoneId(object)
    local selectedData, tab, zoneIndex = GetSelectedDataForZone(object)
    if not GetSelectedDataForZone(object) then return end

    local selectedData = object.navigationTree:GetSelectedData()
    local tab, zoneId = object.tab
    local zone = selectedData.order
    local zoneData = TQG.Zones

    for cat = 1, TQG.GetNumCategories(tab) do
        if zoneData[tab][cat][zone] then
            zoneId = zoneData[tab][cat][zone].zoneId
            local zoneName = getZoneNameById(zoneId)

            if zoneName == selectedData.name then return zoneId end
        end
    end

    return
end

local isZoneStoryZoneAvailable = IsZoneStoryZoneAvailable
local tqgClassicKeybindDescriptor = {
    {
        alignment = KEYBIND_STRIP_ALIGN_RIGHT,
        name = GetString(SI_ZONE_STORY_INFO_HEADER),
        keybind = "UI_SHORTCUT_PRIMARY",
        visible = function() return true end,
        callback = function()
            local zoneId = GetSelectedZoneId(QUESTINGGUIDE_CLASSIC)

            GROUP_MENU_KEYBOARD:ShowCategory(ZONE_STORIES_FRAGMENT)
            ZONE_STORIES_KEYBOARD:SetSelectedByZoneId(zoneId)
        end
    }
}

local tqgDLCKeybindDescriptor = {
    {
        alignment = KEYBIND_STRIP_ALIGN_RIGHT,
        name = GetString(SI_ZONE_STORY_INFO_HEADER),
        keybind = "UI_SHORTCUT_PRIMARY",
        visible = function() return true end,
        callback = function()
            local zoneId = GetSelectedZoneId(QUESTINGGUIDE_DLC)

            GROUP_MENU_KEYBOARD:ShowCategory(ZONE_STORIES_FRAGMENT)
            ZONE_STORIES_KEYBOARD:SetSelectedByZoneId(zoneId)
        end
    }
}

------------------------------------
-- Create Scenes
------------------------------------

local function CreateOverviewScene()

    TQG_OVERVIEW_SCENE = ZO_Scene:New("TheQuestingGuideOverview", SCENE_MANAGER)

    TQG_OVERVIEW_SCENE:AddFragmentGroup(FRAGMENT_GROUP.MOUSE_DRIVEN_UI_WINDOW)
    TQG_OVERVIEW_SCENE:AddFragmentGroup(
        FRAGMENT_GROUP.FRAME_TARGET_STANDARD_RIGHT_PANEL)
    TQG_OVERVIEW_SCENE:AddFragmentGroup(
        FRAGMENT_GROUP.PLAYER_PROGRESS_BAR_KEYBOARD_CURRENT)
    TQG_OVERVIEW_SCENE:AddFragment(TREE_UNDERLAY_FRAGMENT)
    TQG_OVERVIEW_SCENE:AddFragment(TITLE_FRAGMENT)
    TQG_OVERVIEW_SCENE:AddFragment(ZO_SetTitleFragment:New(TQG_MENU_TITLE))
    TQG_OVERVIEW_SCENE:AddFragment(CODEX_WINDOW_SOUNDS)
    TQG_OVERVIEW_SCENE:AddFragment(FRAME_EMOTE_FRAGMENT_JOURNAL)
    TQG_OVERVIEW_SCENE:AddFragment(RIGHT_BG_FRAGMENT)

    TQG_OVERVIEW_FRAGMENT = ZO_HUDFadeSceneFragment:New(
                                TheQuestingGuideOverview_Top)
    TQG_OVERVIEW_SCENE:AddFragment(TQG_OVERVIEW_FRAGMENT)

end

local function CreateClassicScene()

    TQG_CLASSIC_SCENE = ZO_Scene:New("TheQuestingGuideClassic", SCENE_MANAGER)

    TQG_CLASSIC_SCENE:AddFragmentGroup(FRAGMENT_GROUP.MOUSE_DRIVEN_UI_WINDOW)
    TQG_CLASSIC_SCENE:AddFragmentGroup(
        FRAGMENT_GROUP.FRAME_TARGET_STANDARD_RIGHT_PANEL)
    TQG_CLASSIC_SCENE:AddFragmentGroup(
        FRAGMENT_GROUP.PLAYER_PROGRESS_BAR_KEYBOARD_CURRENT)
    TQG_CLASSIC_SCENE:AddFragment(TREE_UNDERLAY_FRAGMENT)
    TQG_CLASSIC_SCENE:AddFragment(TITLE_FRAGMENT)
    TQG_CLASSIC_SCENE:AddFragment(ZO_SetTitleFragment:New(TQG_MENU_TITLE))
    TQG_CLASSIC_SCENE:AddFragment(CODEX_WINDOW_SOUNDS)
    TQG_CLASSIC_SCENE:AddFragment(FRAME_EMOTE_FRAGMENT_JOURNAL)
    TQG_CLASSIC_SCENE:AddFragment(RIGHT_BG_FRAGMENT)

    TQG_CLASSIC_FRAGMENT = ZO_HUDFadeSceneFragment:New(
                               TheQuestingGuideClassic_Top)
    TQG_CLASSIC_SCENE:AddFragment(TQG_CLASSIC_FRAGMENT)

    TQG_CLASSIC_SCENE:RegisterCallback("StateChange",
                                       function(oldState, newState)
        if newState == SCENE_SHOWING then
            KEYBIND_STRIP:AddKeybindButtonGroup(tqgClassicKeybindDescriptor)
        elseif newState == SCENE_HIDING then
            KEYBIND_STRIP:RemoveKeybindButtonGroup(tqgClassicKeybindDescriptor)
        end
    end)

end

local function CreateDLCScene()

    TQG_DLC_SCENE = ZO_Scene:New("TheQuestingGuideDLC", SCENE_MANAGER)

    TQG_DLC_SCENE:AddFragmentGroup(FRAGMENT_GROUP.MOUSE_DRIVEN_UI_WINDOW)
    TQG_DLC_SCENE:AddFragmentGroup(
        FRAGMENT_GROUP.FRAME_TARGET_STANDARD_RIGHT_PANEL)
    TQG_DLC_SCENE:AddFragmentGroup(
        FRAGMENT_GROUP.PLAYER_PROGRESS_BAR_KEYBOARD_CURRENT)
    TQG_DLC_SCENE:AddFragment(TREE_UNDERLAY_FRAGMENT)
    TQG_DLC_SCENE:AddFragment(TITLE_FRAGMENT)
    TQG_DLC_SCENE:AddFragment(ZO_SetTitleFragment:New(TQG_MENU_TITLE))
    TQG_DLC_SCENE:AddFragment(CODEX_WINDOW_SOUNDS)
    TQG_DLC_SCENE:AddFragment(FRAME_EMOTE_FRAGMENT_JOURNAL)
    TQG_DLC_SCENE:AddFragment(RIGHT_BG_FRAGMENT)

    TQG_DLC_FRAGMENT = ZO_HUDFadeSceneFragment:New(TheQuestingGuideDLC_Top)
    TQG_DLC_SCENE:AddFragment(TQG_DLC_FRAGMENT)

    TQG_DLC_SCENE:RegisterCallback("StateChange",
                                       function(oldState, newState)
        if newState == SCENE_SHOWING then
            KEYBIND_STRIP:AddKeybindButtonGroup(tqgDLCKeybindDescriptor)
        elseif newState == SCENE_HIDING then
            KEYBIND_STRIP:RemoveKeybindButtonGroup(tqgDLCKeybindDescriptor)
        end
    end)

end

local function CreateGroupScene()

    TQG_GROUP_SCENE = ZO_Scene:New("TheQuestingGuideGroup", SCENE_MANAGER)

    TQG_GROUP_SCENE:AddFragmentGroup(FRAGMENT_GROUP.MOUSE_DRIVEN_UI_WINDOW)
    TQG_GROUP_SCENE:AddFragmentGroup(
        FRAGMENT_GROUP.FRAME_TARGET_STANDARD_RIGHT_PANEL)
    TQG_GROUP_SCENE:AddFragmentGroup(
        FRAGMENT_GROUP.PLAYER_PROGRESS_BAR_KEYBOARD_CURRENT)
    TQG_GROUP_SCENE:AddFragment(TREE_UNDERLAY_FRAGMENT)
    TQG_GROUP_SCENE:AddFragment(TITLE_FRAGMENT)
    TQG_GROUP_SCENE:AddFragment(ZO_SetTitleFragment:New(TQG_MENU_TITLE))
    TQG_GROUP_SCENE:AddFragment(CODEX_WINDOW_SOUNDS)
    TQG_GROUP_SCENE:AddFragment(FRAME_EMOTE_FRAGMENT_JOURNAL)
    TQG_GROUP_SCENE:AddFragment(RIGHT_BG_FRAGMENT)

    TQG_GROUP_FRAGMENT = ZO_HUDFadeSceneFragment:New(TheQuestingGuideGroup_Top)
    TQG_GROUP_SCENE:AddFragment(TQG_GROUP_FRAGMENT)

end

local function SceneGroupSetup()

    TQG_MENU_CATEGORY_DATA = {
        -- binding = "",
        categoryName = TQG_MENU_TITLE,
        normal = "esoui/art/progression/progression_indexicon_world_up.dds",
        pressed = "esoui/art/progression/progression_indexicon_world_down.dds",
        highlight = "esoui/art/progression/progression_indexicon_world_over.dds"
    }

    local iconData = {
        {
            categoryName = TQG_TAB_OVERVIEW,
            -- visible = function() return true end,
            descriptor = "TheQuestingGuideOverview",
            normal = "esoui/art/progression/progression_indexicon_world_up.dds",
            pressed = "esoui/art/progression/progression_indexicon_world_down.dds",
            highlight = "esoui/art/progression/progression_indexicon_world_over.dds"
        }, {
            categoryName = TQG_TAB_CLASSIC,
            -- visible = function() return true end,
            descriptor = "TheQuestingGuideClassic",
            normal = "esoui/art/campaign/campaignbrowser_indexicon_specialevents_up.dds",
            pressed = "esoui/art/campaign/campaignbrowser_indexicon_specialevents_down.dds",
            highlight = "esoui/art/campaign/campaignbrowser_indexicon_specialevents_over.dds"
        }, {
            categoryName = TQG_TAB_DLC,
            -- visible = function() return true end,
            descriptor = "TheQuestingGuideDLC",
            normal = "esoui/art/treeicons/store_indexicon_dlc_up.dds",
            pressed = "esoui/art/treeicons/store_indexicon_dlc_down.dds",
            highlight = "esoui/art/treeicons/store_indexicon_dlc_over.dds"
        }, {
            categoryName = TQG_TAB_GROUP,
            -- visible = function() return true end,
            descriptor = "TheQuestingGuideGroup",
            normal = "esoui/art/icons/achievements_indexicon_dungeons_up.dds",
            pressed = "esoui/art/icons/achievements_indexicon_dungeons_down.dds",
            highlight = "esoui/art/icons/achievements_indexicon_dungeons_over.dds"
        }
    }

    SCENE_MANAGER:AddSceneGroup("TQGSceneGroup",
                                ZO_SceneGroup:New("TheQuestingGuideOverview",
                                                  "TheQuestingGuideClassic",
                                                  "TheQuestingGuideDLC",
                                                  "TheQuestingGuideGroup"))

    MENU_CATEGORY_TQG = LMM:AddCategory(TQG_MENU_CATEGORY_DATA)

    -- Register the group and add the buttons
    LMM:AddSceneGroup(MENU_CATEGORY_TQG, "TQGSceneGroup", iconData)

end

------------------------------------
-- Addon Load
------------------------------------

local function addonLoaded(event, addonName)
    if addonName ~= TQG.name then return end

    -- Initialize the scenes
    CreateOverviewScene()
    CreateClassicScene()
    CreateGroupScene()
    CreateDLCScene()

    SceneGroupSetup()

    EVENT_MANAGER:UnregisterForEvent("TheQuestingGuide", EVENT_ADD_ON_LOADED)
end
EVENT_MANAGER:RegisterForEvent("TheQuestingGuide", EVENT_ADD_ON_LOADED,
                               addonLoaded)

function TQG.ToggleMenu() LMM:ToggleCategory(MENU_CATEGORY_TQG) end
