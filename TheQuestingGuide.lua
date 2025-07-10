local TQG = TheQuestingGuide or {}

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

    -- cadwellsAlmanacScene:AddFragment(ZO_TutorialTriggerFragment:New(
    --                                    TUTORIAL_TRIGGER_CADWELLS_ALMANAC_OPENED))

end

local function addonLoaded(event, addonName)
    if addonName ~= TQG.name then return end

    -- Initialize the scenes
    CreateClassicScene()

    EVENT_MANAGER:UnregisterForEvent("TheQuestingGuide", EVENT_ADD_ON_LOADED)
end
EVENT_MANAGER:RegisterForEvent("TheQuestingGuide", EVENT_ADD_ON_LOADED,
                               addonLoaded)

function TQG.ToggleMenu() SCENE_MANAGER:Show("TheQuestingGuideClassic") end
