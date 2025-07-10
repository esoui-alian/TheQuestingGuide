TheQuestingGuide = {name = "TheQuestingGuide"}

local TQG = TheQuestingGuide
local strfmt, zStrFmt = string.format, zo_strformat

local stringsEN = {
    SI_BINDING_NAME_TQG_OPEN_KEY = "Toggle Questing Guide",

    TQG_MENU_TITLE = "The Questing Guide",

    TQG_OVERVIEW_TAB = GetString(SI_CUSTOMER_SERVICE_OVERVIEW), -- "Overview"
    TQG_CLASSIC_TAB = GetString(SI_HOUSECATEGORYTYPE2), -- "Classic"
    TQG_DLC_TAB = GetString(SI_COLLECTIBLECATEGORYTYPE1), -- "DLC"
    TQG_GROUP_TAB = GetString(SI_INSTANCETYPE2), -- "Group"

    TQG_ARC_PLANEMELD = "The Planemeld"
}

for id, stringVar in pairs(stringsEN) do
    stringVar = zStrFmt("<<1>>", stringVar)
    ZO_CreateStringId(id, stringVar)
    SafeAddVersion(id, 1)
end

TQG.Categories = {
    ["CLASSIC"] = {
        [1] = {
            name = GetString(TQG_ARC_PLANEMELD),
            down = "esoui/art/campaign/campaignbrowser_indexicon_specialevents_down.dds",
            up = "esoui/art/campaign/campaignbrowser_indexicon_specialevents_up.dds",
            over = "esoui/art/campaign/campaignbrowser_indexicon_specialevents_over.dds"
        },
        [2] = {
            name = GetAllianceName(ALLIANCE_ALDMERI_DOMINION),
            down = "/esoui/art/charactercreate/charactercreate_aldmeriicon_down.dds",
            up = "/esoui/art/charactercreate/charactercreate_aldmeriicon_up.dds",
            over = "/esoui/art/charactercreate/charactercreate_aldmeriicon_over.dds"
        },
        [3] = {
            name = GetAllianceName(ALLIANCE_DAGGERFALL_COVENANT),
            down = "/esoui/art/charactercreate/charactercreate_daggerfallicon_down.dds",
            up = "/esoui/art/charactercreate/charactercreate_daggerfallicon_up.dds",
            over = "/esoui/art/charactercreate/charactercreate_daggerfallicon_over.dds"
        },
        [4] = {
            name = GetAllianceName(ALLIANCE_EBONHEART_PACT),
            down = "/esoui/art/charactercreate/charactercreate_ebonhearticon_down.dds",
            up = "/esoui/art/charactercreate/charactercreate_ebonhearticon_up.dds",
            over = "/esoui/art/charactercreate/charactercreate_ebonhearticon_over.dds"
        }
    }
}

local getZoneNameById = GetZoneNameById
local getZoneDescriptionById = GetZoneDescriptionById

TQG.Zones = {
    ["CLASSIC"] = {
        [1] = {
            [1] = {
                name = getZoneNameById(586),
                desc = getZoneDescriptionById(586)
            },
            [2] = {
                name = getZoneNameById(1429),
                desc = getZoneDescriptionById(1429)
            },
            [3] = {
                name = getZoneNameById(200),
                desc = getZoneDescriptionById(200)
            }
        },
        [2] = {
            [1] = {
                name = getZoneNameById(537),
                desc = getZoneDescriptionById(537)
            },
            [2] = {
                name = getZoneNameById(381),
                desc = getZoneDescriptionById(381)
            }
        }
    }
}

local getQuestName = getQuestName

TQG.Objectives = {
    ["CLASSIC"] = {
        [1] = {
            [1] = {
                [1] = {
                    openingText = "Open Objective 1",
                    closingText = "Close Objective 1",
                    questId = 4296
                }
            },
            [2] = {
                [1] = {
                    openingText = "Open Objective 2",
                    closingText = "Close Objective 2",
                    questId = 4831
                }
            },
            [3] = {
                [1] = {
                    openingText = "Open Objective 3",
                    closingText = "Close Objective 3",
                    questId = 4474
                }
            }
        },
        [2] = {
            [1] = {
                [1] = {
                    openingText = "Open Objective A",
                    closingText = "Close Objective A",
                    questId = 0
                }
            },
            [2] = {
                [1] = {
                    openingText = "Open Objective B",
                    closingText = "Close Objective B",
                    questId = 0
                }
            }
        }
    }
}
