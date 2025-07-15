local TQG = TheQuestingGuide or {}
local tabTable = {
    ["TheQuestingGuideOverview_Gamepad"] = {
        name = GetString(TQG_TAB_OVERVIEW),
        scene = TQG_OVERVIEW_GAMEPAD_SCENE,
        tab = GetString(TQG_TAB_OVERVIEW)
    },
    ["TheQuestingGuideClassic_Gamepad"] = {
        name = GetString(TQG_TAB_CLASSIC),
        scene = TQG_CLASSIC_GAMEPAD_SCENE,
        tab = GetString(TQG_TAB_CLASSIC)
    },
    ["TheQuestingGuideDLC_Gamepad"] = {
        name = GetString(TQG_TAB_DLC),
        scene = TQG_DLC_GAMEPAD_SCENE,
        tab = GetString(TQG_TAB_DLC)
    },
    ["TheQuestingGuideGroup_Gamepad"] = {
        name = GetString(TQG_TAB_GROUP),
        scene = TQG_GROUP_GAMEPAD_SCENE,
        tab = GetString(TQG_TAB_GROUP)
    }
}

local TheQuestingGuideManager_Gamepad =
    ZO_Gamepad_ParametricList_Screen:Subclass()

function TheQuestingGuideManager_Gamepad:New(...)
    return ZO_Gamepad_ParametricList_Screen.New(self, ...)
end

function TheQuestingGuideManager_Gamepad:Initialize(control)
    local controlName = control:GetName()
    local tabSceneGamepad = tabTable[controlName].scene

    TQG_GAMEPAD_FRAGMENT = ZO_SimpleSceneFragment:New(control)
    tabSceneGamepad:AddFragment(TQG_GAMEPAD_FRAGMENT)

    ZO_Gamepad_ParametricList_Screen.Initialize(self, control,
                                                ZO_GAMEPAD_HEADER_TABBAR_DONT_CREATE,
                                                nil, tabSceneGamepad)
    self.tab = tabTable[controlName].tab
    self.itemList = self:GetMainList()

    self.headerData = {titleText = tabTable[controlName].name}
    ZO_GamepadGenericHeader_Refresh(self.header, self.headerData)
end

function TheQuestingGuideManager_Gamepad:OnDeferredInitialize()
    ZO_Gamepad_ParametricList_Screen.OnDeferredInitialize(self)

    local middleSection = self.control:GetNamedChild("Middle")
    self.entryHeader = middleSection:GetNamedChild("HeaderContainer")
                           :GetNamedChild("Header")
    ZO_GamepadGenericHeader_Initialize(self.entryHeader,
                                       ZO_GAMEPAD_HEADER_TABBAR_DONT_CREATE)
    self.entryBody = middleSection:GetNamedChild("Body")

    self.entryHeaderData = {titleText = ""}

    --[[local function OnCadwellProgressionLevelChanged()
        self:Update()
    end]]

    --[[local function OnPOIUpdated()
        if GetCadwellProgressionLevel() > CADWELL_PROGRESSION_LEVEL_BRONZE then
            self:Update()
            -- NOTE: self:Update() will implicitly call self:RefreshEntryHeaderDescriptionAndObjectives() when it rebuilds the list,
            --  as such, there is no need to refresh the details directly here, which simplifies the logic.
        end
    end]]

    -- self.control:RegisterForEvent(EVENT_POI_UPDATED, OnPOIUpdated)
    -- self.control:RegisterForEvent(EVENT_CADWELL_PROGRESSION_LEVEL_CHANGED, OnCadwellProgressionLevelChanged)
end

function TheQuestingGuideManager_Gamepad:InitializeKeybindStripDescriptors()
    self.keybindStripDescriptor = {
        alignment = KEYBIND_STRIP_ALIGN_LEFT,

        -- Back
        -- KEYBIND_STRIP:GenerateGamepadBackButtonDescriptor(function() QUESTINGGUIDE_MENU_GAMEPAD:Show() end)
        KEYBIND_STRIP:GetDefaultGamepadBackButtonDescriptor()
    }
    ZO_Gamepad_AddListTriggerKeybindDescriptors(self.keybindStripDescriptor,
                                                self:GetMainList())
end

function TheQuestingGuideManager_Gamepad:OnShowing() self:PerformUpdate() end

function TheQuestingGuideManager_Gamepad:OnHide(...)
    ZO_Gamepad_ParametricList_Screen.OnHide(self, ...)
    QUESTINGGUIDE_GAMEPAD_TOOLTIPS:ClearTooltip(GAMEPAD_RIGHT_TOOLTIP)
    QUESTINGGUIDE_GAMEPAD_TOOLTIPS:Reset(GAMEPAD_RIGHT_TOOLTIP)
end

function TheQuestingGuideManager_Gamepad:PerformUpdate()
    self.itemList:Clear()

    local function GetEntryNarrationText(entryData, entryControl)
        local narrations = {}

        -- Get the default list entry narration
        ZO_AppendNarration(narrations,
                           ZO_GetSharedGamepadEntryDefaultNarrationText(
                               entryData, entryControl))

        -- Get the narration for the center panel header
        ZO_AppendNarration(narrations, ZO_GamepadGenericHeader_GetNarrationText(
                               self.entryHeader, self.entryHeaderData))

        -- Get the narration for the center panel body
        ZO_AppendNarration(narrations,
                           SCREEN_NARRATION_MANAGER:CreateNarratableObject(
                               self.entryBodyText))
        return narrations
    end

    for category = 1, TQG.GetNumCategories(self.tab) do
        if TQG.GetNumCategories(self.tab) < category then break end

        local zones = {}
        for zoneIndex = 1, TQG.GetNumZonesForCategory(self.tab, category) do
            local zoneName, zoneDescription, zoneOrder = TQG.GetZoneInfo(
                                                             self.tab, category,
                                                             zoneIndex)
            local numObjectives = TQG.GetNumObjectivesForCategoryAndZone(
                                      self.tab, category, zoneIndex)
            local numCompletedObjectives = 0

            for objectiveIndex = 1, numObjectives do
                local completed = select(6,
                                         TQG.GetObjectiveInfoForCategoryAndZone(
                                             self.tab, category, zoneIndex,
                                             objectiveIndex))
                if completed then
                    numCompletedObjectives = numCompletedObjectives + 1
                end
            end

            table.insert(zones, {
                category = category,
                name = zoneName,
                description = zoneDescription,
                order = zoneOrder,
                numObjectives = numObjectives,
                numCompletedObjectives = numCompletedObjectives,
                index = zoneIndex
            })
        end

        table.sort(zones, ZO_CadwellSort)

        for zoneIndex = 1, #zones do
            local zoneInfo = zones[zoneIndex]

            local entryData = ZO_GamepadEntryData:New(zo_strformat(
                                                          SI_CADWELL_ZONE_NAME_FORMAT,
                                                          zoneInfo.name))
            entryData.zoneInfo = zoneInfo
            entryData.narrationText = GetEntryNarrationText

            local template
            if zoneIndex == 1 then
                -- TODO: Do they want the icons in here somehow?
                -- local down, up, over = GetIconsForCadwellProgressionLevel(category)
                entryData:SetHeader(TQG.Categories[self.tab][category].name)
                template = "ZO_GamepadMenuEntryTemplateWithHeader"
            else
                template = "ZO_GamepadMenuEntryTemplate"
            end

            self.itemList:AddEntry(template, entryData)
        end
    end

    self.itemList:Commit()
end

function TheQuestingGuideManager_Gamepad:OnSelectionChanged(list, selectedData,
                                                            oldSelectedData)
    self:RefreshEntryHeaderDescriptionAndObjectives()
end

function TheQuestingGuideManager_Gamepad:RefreshEntryHeaderDescriptionAndObjectives()
    local targetData = self.itemList:GetTargetData()

    if not targetData then
        self.entryName:SetText("")
        return
    end

    local zoneInfo = targetData.zoneInfo

    local category = zoneInfo.category
    local zoneIndex = zoneInfo.index

    local zoneName, zoneDescription = TQG.GetZoneInfo(self.tab, category,
                                                      zoneIndex)
    self.entryBodyText = zo_strformat(SI_CADWELL_ZONE_DESC_FORMAT,
                                      zoneDescription)
    self.entryBody:SetText(self.entryBodyText)

    self.entryHeaderData.titleText = zo_strformat(SI_CADWELL_ZONE_NAME_FORMAT,
                                                  zoneName)

    ZO_GamepadGenericHeader_Refresh(self.entryHeader, self.entryHeaderData)

    QUESTINGGUIDE_GAMEPAD_TOOLTIPS:ClearTooltip(GAMEPAD_RIGHT_TOOLTIP)
    QUESTINGGUIDE_GAMEPAD_TOOLTIPS:LayoutTheQuestingGuide(GAMEPAD_RIGHT_TOOLTIP,
                                                          category, zoneIndex,
                                                          self.tab)
end

function TheQuestingGuideOverview_Gamepad_Initialize(control)
    QUESTINGGUIDE_OVERVIEW_GAMEPAD = TheQuestingGuideManager_Gamepad:New(control)
end
function TheQuestingGuideClassic_Gamepad_Initialize(control)
    QUESTINGGUIDE_CLASSIC_GAMEPAD = TheQuestingGuideManager_Gamepad:New(control)
end
function TheQuestingGuideDLC_Gamepad_Initialize(control)
    QUESTINGGUIDE_DLC_GAMEPAD = TheQuestingGuideManager_Gamepad:New(control)
end
function TheQuestingGuideGroup_Gamepad_Initialize(control)
    QUESTINGGUIDE_GROUP_GAMEPAD = TheQuestingGuideManager_Gamepad:New(control)
end