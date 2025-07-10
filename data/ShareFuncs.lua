local TQG = TheQuestingGuide or {}

local zoneData = TQG.Zones or {}
local catData = TQG.Categories or {}
local objData = TQG.Objectives or {}

function TQG.GetCurrentCategory(tab) return 3 end

function TQG.GetNumCategories(tab) return #catData[tab] end

function TQG.GetIconsForCategory(tab, category)
    if catData[tab] and catData[tab][category] then
        local down, up, over = catData[tab][category].down,
                               catData[tab][category].up,
                               catData[tab][category].over
        return down, up, over
    end
    d("no value")
end

function TQG.GetZoneInfo(tab, category, zone)
    if zoneData[tab] and zoneData[tab][category] and
        zoneData[tab][category][zone] then

        local zoneCounter = zone
        return zoneData[tab][category][zone].name,
               zoneData[tab][category][zone].desc, zoneCounter
    end
    d("no value")
end

function TQG.GetNumZonesForCategory(tab, category)
    if zoneData[tab] and zoneData[tab][category] then
        return #zoneData[tab][category]
    end
    d("no value")
end

function TQG.GetNumObjectivesForCategoryAndZone(tab, category, zone)
    if objData[tab] and objData[tab][category] and objData[tab][category][zone] then
        return #objData[tab][category][zone]
    end
    d("no value")
end

local function IsQuestinJournal(questName)
    if GetNumJournalQuests() < 1 then return end

    for i = 1, GetNumJournalQuests() do
        local journalQuestName = GetJournalQuestInfo(i)
        if journalQuestName == questName then return true end
    end
end

function TQG.GetObjectiveInfoForCategoryAndZone(tab, category, zone, objective)
    local objectiveData = TQG.Objectives[tab][category][zone][objective]

    local objectiveCounter = objective
    local questId = objectiveData.questId
    local questName = GetQuestName(questId) or "Unknown Quest"
    local isCompleted = GetCompletedQuestInfo(questId) ~= "" or false
    local isDiscovered = isCompleted or IsQuestinJournal(questName)

    return questName, objectiveData.openingText, objectiveData.closingText,
           objectiveCounter, isDiscovered, isCompleted
end
