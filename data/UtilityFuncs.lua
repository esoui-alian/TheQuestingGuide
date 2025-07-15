local TQG = TheQuestingGuide or {}

local CR = CHAT_ROUTER
local strfmt, zStrFmt = string.format, zo_strformat

local zoneData = TQG.Zones or {}
local catData = TQG.Categories or {}
local objData = TQG.Objectives or {}

local getZoneNameById = GetZoneNameById
local getZoneDescriptionById = GetZoneDescriptionById

local getQuestName = GetQuestName
local getNumJournalQuests = GetNumJournalQuests
local getCompletedQuestInfo = GetCompletedQuestInfo

local getZoneStoryActivityNameByActivityIndex =
    GetZoneStoryActivityNameByActivityIndex
local isZoneStoryActivityComplete = IsZoneStoryActivityComplete

function TQG.GetNumCategories(tab) return #catData[tab] end

function TQG.GetIconsForCategory(tab, category)
    if not (catData[tab] and catData[tab][category]) then
        -- CR:AddSystemMessage("no catData")
        return "", "", ""
    end

    local down, up, over = catData[tab][category].down,
                           catData[tab][category].up,
                           catData[tab][category].over
    return down, up, over
end

function TQG.GetZoneInfo(tab, category, zone)
    if not (zoneData[tab] and zoneData[tab][category] and
        zoneData[tab][category][zone]) then
        -- CR:AddSystemMessage("no zoneData")
        return "", "", 0
    end

    local zoneId = zoneData[tab][category][zone].zoneId
    local zoneCounter = zone
    local zoneName = zoneData[tab][category][zone].zoneName or
                         getZoneNameById(zoneId) or "Unknown Zone"

    local zoneDescription = zoneData[tab][category][zone].zoneDesc or
                                getZoneDescriptionById(zoneId) or
                                "No Description"

    if tab == GetString(TQG_TAB_GROUP) then
        local groupZoneName = getZoneNameById(zoneId)

        zoneDescription = zStrFmt("<<Z:1>>: <<2>>", groupZoneName,
                                  zoneDescription)
        zoneDescription = zoneDescription:gsub(" II:", ":"):gsub(" I:", ":")
    end

    return zoneName, zoneDescription, zoneCounter
end

function TQG.GetNumZonesForCategory(tab, category)
    if not (zoneData[tab] and zoneData[tab][category]) then
        -- CR:AddSystemMessage("no zoneData")
        return 0
    end
    return #zoneData[tab][category]
end

function TQG.GetNumObjectivesForCategoryAndZone(tab, category, zone)
    if not (objData[tab] and objData[tab][category] and
        objData[tab][category][zone]) then
        -- CR:AddSystemMessage("no objData")
        return 0
    end
    return #objData[tab][category][zone]
end

local function IsQuestinJournal(questName)
    if getNumJournalQuests() < 1 then return end

    for i = 1, getNumJournalQuests() do
        local journalQuestName = GetJournalQuestInfo(i)
        if journalQuestName == questName then return true end
    end
end

local function GetUESPLocationInfo(questId, questName, discovered,
                                   isOpeningText, isClosingText)
    if not LibUespQuestData then return end

    if questId then
        if isOpeningText then
            if discovered then
                return LibUespQuestData:GetUespQuestBackgroundText(questId)
            else
                local zoneName, objectiveName =
                    LibUespQuestData:GetUespQuestLocationInfo(questId)
                return (objectiveName ~= "" and objectiveName) or
                           (zoneName ~= "" and zoneName)
            end
        elseif isClosingText then
            return LibUespQuestData:GetUespQuestBackgroundText(questId)
        end
    end

    if questName then
        local zoneName, objectiveName

        for questId, questData in pairs(LibUespQuestData.quests) do
            if getQuestName(questId) == questName then
                if isOpeningText then
                    if discovered then
                        return LibUespQuestData:GetUespQuestBackgroundText(
                                   questId)
                    else
                        zoneName, objectiveName =
                            LibUespQuestData:GetUespQuestLocationInfo(questId)
                        return (objectiveName ~= "" and objectiveName) or
                                   zoneName
                    end
                elseif isClosingText then
                    return LibUespQuestData:GetUespQuestBackgroundText(questId)
                end

                break
            end
        end
    end
end

local function GetObjectiveInfo(questId, openingText, closingText)
    local questName = getQuestName(questId) ~= "" and getQuestName(questId) or
                          "Unknown Quest"
    local completed = getCompletedQuestInfo(questId) ~= "" or false
    local discovered = completed or IsQuestinJournal(questName)
    local zoneName = GetZoneNameById(GetQuestZoneId(questId))
    local _, objectiveName = GetCompletedQuestLocationInfo(questId)

    local openingUESP = GetUESPLocationInfo(questId, _, discovered, true)
    local openingText = openingText or openingUESP or ""

    local closingUESP = GetUESPLocationInfo(questId, _, discovered, false, true)
    local closingText = closingText or closingUESP or ""

    if openingText == "" then
        openingText = (zoneName ~= "" and zoneName) or "No Opening Text"
    end
    if closingText == "" then
        closingText = (objectiveName ~= "" and objectiveName) or
                          (zoneName ~= "" and zoneName) or "No Closing Text"
    end

    return questName, openingText, closingText, discovered, completed
end

function TQG.GetZoneStoryQuestInfoForCategoryAndZone(tab, category, zone,
                                                     objective)
    if not (zoneData[tab] and zoneData[tab][category]) then
        -- CR:AddSystemMessage("no zoneData")
        return
    end

    local zoneId = zoneData[tab][category][zone].zoneId
    local questName = getZoneStoryActivityNameByActivityIndex(zoneId,
                                                              ZONE_COMPLETION_TYPE_PRIORITY_QUESTS,
                                                              objective)
    local completed = isZoneStoryActivityComplete(zoneId,
                                                  ZONE_COMPLETION_TYPE_PRIORITY_QUESTS,
                                                  objective)
    local discovered = completed or IsQuestinJournal(questName)

    local openingText = GetUESPLocationInfo(_, questName, discovered, true) or
                            ""
    local closingText = GetUESPLocationInfo(_, questName, discovered, false,
                                            true) or ""

    if openingText == "" then openingText = "No Opening Text" end
    if closingText == "" then closingText = "No Closing Text" end
    local optional = false

    return questName, openingText, closingText, objective, discovered,
           completed, optional
end

function TQG.DoesZoneHavePrologue(tab, category, zone)
    if not (zoneData[tab] and zoneData[tab][category] and
        zoneData[tab][category][zone]) then
        -- CR:AddSystemMessage("no zoneData")
        return
    end

    return zoneData[tab][category][zone].hasPrologue,
           zoneData[tab][category][zone].numPrologueQuests or 0
end

function TQG.DoesZoneHaveStoryQuests(tab, category, zone)
    if not (zoneData[tab] and zoneData[tab][category] and
        zoneData[tab][category][zone]) then
        -- CR:AddSystemMessage("no zoneData")
        return
    end

    local zoneId = zoneData[tab][category][zone].zoneId
    local numZoneActivitiesForZoneCompletionType =
        GetNumZoneActivitiesForZoneCompletionType(zoneId,
                                                  ZONE_COMPLETION_TYPE_PRIORITY_QUESTS)
    if numZoneActivitiesForZoneCompletionType < 1 then
        -- CR:AddSystemMessage("no ZoneActivities")
        return
    end

    return true, numZoneActivitiesForZoneCompletionType
end

function TQG.GetObjectiveInfoForCategoryAndZone(tab, category, zone, objective)
    if not (objData[tab] and objData[tab][category] and
        objData[tab][category][zone] and objData[tab][category][zone][objective]) then
        -- CR:AddSystemMessage("no objData")
        return
    end

    local objectiveData = objData[tab][category][zone][objective]

    local questId = objectiveData.questId
    local openingText = objectiveData.openingText
    local closingText = objectiveData.closingText

    local questName, openingText, closingText, discovered, completed =
        GetObjectiveInfo(questId, openingText, closingText)

    local optional = objData[tab][category][zone][objective].optional
    local prologue = objData[tab][category][zone][objective].prologue

    return questName, openingText, closingText, objective, discovered,
           completed, optional, prologue
end

------------------------------------
-- Keybinds Setup: Shared
------------------------------------

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
function TQG.GetSelectedZoneId(object)
    local selectedData, tab, zoneIndex = GetSelectedDataForZone(object)
    if not selectedData then return end

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
