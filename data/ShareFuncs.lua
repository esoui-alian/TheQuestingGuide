local TQG = TheQuestingGuide or {}

local CR = CHAT_ROUTER

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

function TQG.GetCurrentCategory(tab) return "CLASSIC" end

function TQG.GetNumCategories(tab) return #catData[tab] end

function TQG.GetIconsForCategory(tab, category)
    if not (catData[tab] and catData[tab][category]) then
        CR:AddSystemMessage("no icons")
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
        CR:AddSystemMessage("no zoneInfo")
        return "", "", 0
    end

    local zoneId = zoneData[tab][category][zone].zoneId
    local zoneCounter = zone
    local zoneName = getZoneNameById(zoneId) or "Unknown Zone"
    local zoneDeescription = getZoneDescriptionById(zoneId) or "No Description"
    return zoneName, zoneDeescription, zoneCounter
end

function TQG.GetNumZonesForCategory(tab, category)
    if not (zoneData[tab] and zoneData[tab][category]) then
        CR:AddSystemMessage("no numZones")
        return 0
    end
    return #zoneData[tab][category]
end

function TQG.GetNumObjectivesForCategoryAndZone(tab, category, zone)
    if not (objData[tab] and objData[tab][category] and
        objData[tab][category][zone]) then
        CR:AddSystemMessage("no numObjectives")
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

local function GetObjectiveInfo(questId)
    local questName = getQuestName(questId) ~= "" and getQuestName(questId) or
                          "Unknown Quest"
    local completed = getCompletedQuestInfo(questId) ~= "" or false
    local discovered = completed or IsQuestinJournal(questName)
    local openingText, closingText = "", ""

    return questName, openingText, closingText, completed,
           discovered
end

function TQG.GetZoneStoryQuestInfoForCategoryAndZone(tab, category, zone,
                                                     objective)
    if not (zoneData[tab] and zoneData[tab][category]) then
        CR:AddSystemMessage("no zoneInfo (Stories)")
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
    local openingText, closingText = "", ""

    if openingText == "" then openingText = "No Opening Text" end

    if closingText == "" then closingText = "No Closing Text" end

    return questName, openingText, closingText, objectiveOrder, discovered,
           completed
end

function TQG.DoesZoneHaveStoryQuests(tab, category, zone)
    if not (zoneData[tab] and zoneData[tab][category] and
        zoneData[tab][category][zone]) then
        CR:AddSystemMessage("no ZoneStories")
        return
    end

    local zoneId = zoneData[tab][category][zone].zoneId
    local numZoneActivitiesForZoneCompletionType =
        GetNumZoneActivitiesForZoneCompletionType(zoneId,
                                                  ZONE_COMPLETION_TYPE_PRIORITY_QUESTS)
    if numZoneActivitiesForZoneCompletionType < 1 then
        CR:AddSystemMessage("no ZoneActivities")
        return
    end

    return true, numZoneActivitiesForZoneCompletionType
end

function TQG.GetObjectiveInfoForCategoryAndZone(tab, category, zone, objective)
    if not (objData[tab] and objData[tab][category] and
        objData[tab][category][zone] and objData[tab][category][zone][objective]) then
        CR:AddSystemMessage("no objectiveInfo")
        return
    end

    local objectiveData = TQG.Objectives[tab][category][zone][objective]

    local objectiveCounter = objective
    local questId = objectiveData.questId
    local questName, openingText, closingText, discovered,
          completed = GetObjectiveInfo(questId)

    if openingText == "" then
        openingText = objectiveData.openingText ~= "" and
                          objectiveData.openingText or "No Opening Text"
    end

    if closingText == "" then
        closingText = objectiveData.closingText ~= "" and
                          objectiveData.closingText or "No Closing Text"
    end

    return questName, openingText, closingText, objectiveCounter, discovered,
           completed
end
