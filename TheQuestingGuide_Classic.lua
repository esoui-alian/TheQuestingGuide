local TQG = TheQuestingGuide or {}
local tab = "CLASSIC"

---------------------
-- TQG Manager
---------------------
local TQG_Manager = ZO_Object:Subclass()

function TQG_Manager:New(control)
    local manager = ZO_Object.New(self)
    manager.control = control

    manager.zoneInfoContainer = control:GetNamedChild("ZoneInfoContainer")
    manager.zoneStepContainer = control:GetNamedChild("ZoneStepContainer")
    manager.titleText = control:GetNamedChild("TitleText")
    manager.descriptionText = control:GetNamedChild("DescriptionText")
    manager.objectivesText = control:GetNamedChild("ObjectivesText")
    manager.objectiveLinePool = ZO_ControlPool:New(
                                    "TheQuestingGuideClassic_ObjectiveLine",
                                    control, "Objective")

    manager.currentCadwellCategory = GetCadwellProgressionLevel() -- GetCurrentCategory(tab)

    manager:InitializeCategoryList(control)
    manager:RefreshList()

    local function OnCadwellCategoryChanged(event, cadwellProgression)
        MAIN_MENU_KEYBOARD:UpdateSceneGroupButtons("journalSceneGroup")
        manager.currentCadwellCategory = cadwellProgression
        manager:RefreshList()
    end

    local function OnPOIUpdated()
        if manager.currentCadwellCategory > CADWELL_PROGRESSION_LEVEL_BRONZE then
            manager:RefreshList()
        end
    end

    -- control:RegisterForEvent(EVENT_POI_UPDATED, OnPOIUpdated)
    -- control:RegisterForEvent(EVENT_CADWELL_PROGRESSION_LEVEL_CHANGED,
    --                         OnCadwellCategoryChanged)

    return manager
end

function TQG_Manager:InitializeCategoryList(control)
    self.navigationTree = ZO_Tree:New(control:GetNamedChild(
                                          "NavigationContainerScrollChild"), 60,
                                      -10, 300)

    local function GetIconsForQuestingGuideCategoryy(category)
        return TQG.GetIconsForCategory(tab, category)
    end

    local function TreeHeaderSetup(node, control, category, open)
        control.category = category
        control.text:SetModifyTextType(MODIFY_TEXT_TYPE_UPPERCASE)
        control.text:SetText(TQG.Categories[tab][category].name)
        local down, up, over = GetIconsForQuestingGuideCategoryy(category)

        control.icon:SetTexture(open and down or up)
        control.iconHighlight:SetTexture(over)

        ZO_IconHeader_Setup(control, open)
    end
    self.navigationTree:AddTemplate("ZO_IconHeader", TreeHeaderSetup, nil, nil,
                                    nil, 0)

    local function TreeEntrySetup(node, control, data, open)
        control:SetText(zo_strformat(SI_CADWELL_QUEST_NAME_FORMAT, data.name))
        GetControl(control, "CompletedIcon"):SetHidden(not data.completed)

        control:SetSelected(false)
    end
    local function TreeEntryOnSelected(control, data, selected,
                                       reselectingDuringRebuild)
        control:SetSelected(selected)
        if selected and not reselectingDuringRebuild then
            self:RefreshDetails()
        end
    end
    local function TreeEntryEquality(left, right)
        return left.name == right.name
    end
    self.navigationTree:AddTemplate("ZO_CadwellNavigationEntry", TreeEntrySetup,
                                    TreeEntryOnSelected, TreeEntryEquality)

    self.navigationTree:SetExclusive(true)
    self.navigationTree:SetOpenAnimation("ZO_TreeOpenAnimation")
end

function TQG_Manager:RefreshList()
    if self.control:IsHidden() then
        self.dirty = true
        return
    end

    self.navigationTree:Reset()

    local zones = {}

    for category = 1, TQG.GetNumCategories(tab) do
        local numZones = TQG.GetNumZonesForCategory(tab, category)
        if self.currentCadwellCategory < category then break end

        if numZones > 0 then
            local parent =
                self.navigationTree:AddNode("ZO_IconHeader", category)

            for zoneIndex = 1, numZones do
                local zoneName, zoneDescription, zoneOrder = TQG.GetZoneInfo(
                                                                 tab, category,
                                                                 zoneIndex)

                local zoneCompleted = true

                local objectives = {}

                local numObjectives = TQG.GetNumObjectivesForCategoryAndZone(
                                          tab, category, zoneIndex)
                for objectiveIndex = 1, numObjectives do
                    local name, openingText, closingText, objectiveOrder,
                          discovered, completed =
                        TQG.GetObjectiveInfoForCategoryAndZone(tab, category,
                                                               zoneIndex,
                                                               objectiveIndex)
                    zoneCompleted = zoneCompleted and completed
                    table.insert(objectives, {
                        name = name,
                        openingText = openingText,
                        closingText = closingText,
                        order = objectiveOrder,
                        discovered = discovered,
                        completed = completed
                    })
                end

                table.sort(objectives, ZO_CadwellSort)

                table.insert(zones, {
                    name = zoneName,
                    description = zoneDescription,
                    order = zoneOrder,
                    completed = zoneCompleted,
                    objectives = objectives,
                    parent = parent
                })
            end
        end
    end

    table.sort(zones, ZO_CadwellSort)

    for i = 1, #zones do
        local zoneInfo = zones[i]
        local parent = zoneInfo.parent
        self.navigationTree:AddNode("ZO_CadwellNavigationEntry", zoneInfo,
                                    parent)
    end

    self.navigationTree:Commit()

    self:RefreshDetails()
end

function TQG_Manager:RefreshDetails()
    self.objectiveLinePool:ReleaseAllObjects()

    local selectedData = self.navigationTree:GetSelectedData()
    if not selectedData or not selectedData.objectives then
        self.zoneInfoContainer:SetHidden(true)
        self.zoneStepContainer:SetHidden(true)
        return
    else
        self.zoneInfoContainer:SetHidden(false)
        self.zoneStepContainer:SetHidden(false)
    end

    self.titleText:SetText(zo_strformat(SI_CADWELL_ZONE_NAME_FORMAT,
                                        selectedData.name))
    self.descriptionText:SetText(zo_strformat(SI_CADWELL_ZONE_DESC_FORMAT,
                                              selectedData.description))

    local previous

    for i = 1, #selectedData.objectives do
        local objectiveInfo = selectedData.objectives[i]
        local objectiveLine = self.objectiveLinePool:AcquireObject()

        if objectiveInfo.discovered and not objectiveInfo.completed then
            objectiveLine:SetColor(ZO_SELECTED_TEXT:UnpackRGBA())
            GetControl(objectiveLine, "Check"):SetHidden(true)
            objectiveLine:SetText(zo_strformat(SI_CADWELL_OBJECTIVE_FORMAT,
                                               objectiveInfo.name,
                                               objectiveInfo.openingText))
        elseif not objectiveInfo.discovered then
            objectiveLine:SetColor(ZO_DISABLED_TEXT:UnpackRGBA())
            GetControl(objectiveLine, "Check"):SetHidden(true)
            objectiveLine:SetText(zo_strformat(SI_CADWELL_OBJECTIVE_FORMAT,
                                               objectiveInfo.name,
                                               objectiveInfo.openingText))
        else
            objectiveLine:SetColor(ZO_NORMAL_TEXT:UnpackRGBA())
            GetControl(objectiveLine, "Check"):SetHidden(false)
            objectiveLine:SetText(zo_strformat(SI_CADWELL_OBJECTIVE_FORMAT,
                                               objectiveInfo.name,
                                               objectiveInfo.closingText))
        end

        if not previous then
            objectiveLine:SetAnchor(TOPLEFT, self.objectivesText, BOTTOMLEFT,
                                    25, 15)
        else
            objectiveLine:SetAnchor(TOPLEFT, previous, BOTTOMLEFT, 0, 15)
        end

        previous = objectiveLine
    end
end

function TQG_Manager:OnShown()
    if self.dirty then
        self:RefreshList()
        self.dirty = false
    end
end

-- XML Handlers

function TheQuestingGuideClassic_OnShown() QUESTINGGUIDE_CLASSIC:OnShown() end

function TheQuestingGuideClassic_Initialize(control)
    QUESTINGGUIDE_CLASSIC = TQG_Manager:New(control)
end

local function RefreshQuestStates(event) QUESTINGGUIDE_CLASSIC:RefreshList() end

EVENT_MANAGER:RegisterForEvent("TheQuestingGuide_Classic", EVENT_QUEST_REMOVED,
                               RefreshQuestStates)
