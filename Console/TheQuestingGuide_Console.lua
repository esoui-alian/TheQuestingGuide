local TQG = TheQuestingGuide
local LCD = LibConsoleDialogs

local function addonLoaded(event, addonName)
    if addonName ~= TQG.name then return end

    EVENT_MANAGER:UnregisterForEvent("TheQuestingGuide", EVENT_ADD_ON_LOADED)
end
EVENT_MANAGER:RegisterForEvent("TheQuestingGuide", EVENT_ADD_ON_LOADED,
                               addonLoaded)
