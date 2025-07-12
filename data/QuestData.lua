local TQG = TheQuestingGuide or {}
local strfmt, zStrFmt = string.format, zo_strformat

TQG.Categories = {
    [GetString(TQG_TAB_OVERVIEW)] = {
        [1] = {
            name = GetString(TQG_TAB_OVERVIEW),
            down = "/esoui/art/progression/progression_indexicon_world_down.dds",
            up = "/esoui/art/progression/progression_indexicon_world_up.dds",
            over = "/esoui/art/progression/progression_indexicon_world_over.dds"
        }
    },
    [GetString(TQG_TAB_CLASSIC)] = {
        [1] = {
            name = GetString(TQG_ARC_PLANEMELD),
            down = "/esoui/art/campaign/campaignbrowser_indexicon_specialevents_down.dds",
            up = "/esoui/art/campaign/campaignbrowser_indexicon_specialevents_up.dds",
            over = "/esoui/art/campaign/campaignbrowser_indexicon_specialevents_over.dds"
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
        },
        [5] = {
            name = GetString(TQG_ARC_FIGHTERS_GUILD),
            down = "/esoui/art/icons/progression_tabicon_fightersguild_down.dds",
            up = "/esoui/art/icons/progression_tabicon_fightersguild_up.dds",
            over = "/esoui/art/icons/progression_tabicon_fightersguild_over.dds"
        },
        [6] = {
            name = GetString(TQG_ARC_MAGES_GUILD),
            down = "/esoui/art/icons/progression_tabicon_magesguild_down.dds",
            up = "/esoui/art/icons/progression_tabicon_magesguild_up.dds",
            over = "/esoui/art/icons/progression_tabicon_magesguild_over.dds"
        },
        [7] = {
            name = GetZoneNameById(347), -- Coldharbour
            down = "/esoui/art/treeicons/antiquities_tabicon_coldharbour_down.dds",
            up = "/esoui/art/treeicons/antiquities_tabicon_coldharbour_up.dds",
            over = "/esoui/art/treeicons/antiquities_tabicon_coldharbour_over.dds"
        },
        [8] = {
            name = GetZoneNameById(888), -- "Craglorn"
            down = "/esoui/art/treeicons/antiquities_tabicon_craglorn_down.dds",
            up = "/esoui/art/treeicons/antiquities_tabicon_craglorn_up.dds",
            over = "/esoui/art/treeicons/antiquities_tabicon_craglorn_over.dds"
        },
        [9] = {
            name = GetZoneNameById(181), -- "Cyrodiil"
            down = "/esoui/Art/Campaign/campaign_tabIcon_browser_down.dds",
            up = "/esoui/Art/Campaign/campaign_tabIcon_browser_up.dds",
            over = "/esoui/Art/Campaign/campaign_tabIcon_browser_over.dds"
        }
    },
    [GetString(TQG_TAB_DLC)] = {
        [1] = {
            name = GetString(TQG_GUILDS_AND_GLORY),
            down = "/esoui/art/treeicons/store_indexicon_dlc_down.dds",
            up = "/esoui/art/treeicons/store_indexicon_dlc_up.dds",
            over = "/esoui/art/treeicons/store_indexicon_dlc_over.dds"
        },
        [2] = {
            name = GetString(TQG_DAEDRIC_WAR),
            down = "/esoui/art/icons/progression_tabicon_daedricconjuration_down.dds",
            up = "/esoui/art/icons/progression_tabicon_daedricconjuration_up.dds",
            over = "/esoui/art/icons/progression_tabicon_daedricconjuration_over.dds"
        },
        [3] = {
            name = GetZoneNameById(726), -- Murkmire
            down = "/esoui/art/treeicons/tutorial_idexicon_murkmire_down.dds",
            up = "/esoui/art/treeicons/tutorial_idexicon_murkmire_up.dds",
            over = "/esoui/art/treeicons/tutorial_idexicon_murkmire_over.dds"
        },
        [4] = {
            name = GetString(TQG_CHAPTER_ELSWEYR),
            down = "/esoui/art/treeicons/tutorial_idexicon_elsweyr_down.dds",
            up = "/esoui/art/treeicons/tutorial_idexicon_elsweyr_up.dds",
            over = "/esoui/art/treeicons/tutorial_idexicon_elsweyr_over.dds"
        },
        [5] = {
            name = GetString(TQG_CHAPTER_SKYRIM),
            down = "/esoui/art/treeicons/tutorial_indexicon_greymoor_down.dds",
            up = "/esoui/art/treeicons/tutorial_indexicon_greymoor_up.dds",
            over = "/esoui/art/treeicons/tutorial_indexicon_greymoor_over.dds"
        },
        [6] = {
            name = GetString(TQG_CHAPTER_BLACKWOOD),
            down = "/esoui/art/treeicons/tutorial_idexicon_deadlands_down.dds",
            up = "/esoui/art/treeicons/tutorial_idexicon_deadlands_up.dds",
            over = "/esoui/art/treeicons/tutorial_idexicon_deadlands_over.dds"
        },
        [7] = {
            name = GetString(TQG_CHAPTER_HIGH_ISLE),
            down = "/esoui/art/charactercreate/charactercreate_bretonicon_down.dds",
            up = "/esoui/art/charactercreate/charactercreate_bretonicon_up.dds",
            over = "/esoui/art/charactercreate/charactercreate_bretonicon_over.dds"
        },
        [8] = {
            name = GetString(TQG_CHAPTER_SHADOW_MORROWIND),
            down = "/esoui/art/charactercreate/charactercreate_arcanisticon_down.dds",
            up = "/esoui/art/charactercreate/charactercreate_arcanisticon_up.dds",
            over = "/esoui/art/charactercreate/charactercreate_arcanisticon_over.dds"
        },
        [9] = {
            name = GetString(TQG_CHAPTER_RECOLLECTION_ITHELIA),
            down = "/esoui/art/charactercreate/charactercreate_arcanisticon_down.dds",
            up = "/esoui/art/charactercreate/charactercreate_arcanisticon_up.dds",
            over = "/esoui/art/charactercreate/charactercreate_arcanisticon_over.dds"
        },
        [10] = {
            name = GetString(TQG_CHAPTER_SEASON_WORM_CULT),
            down = "/esoui/art/help/u46_helpcategory_update46_down.dds",
            up = "/esoui/art/help/u46_helpcategory_update46_up.dds",
            over = "/esoui/art/help/u46_helpcategory_update46_over.dds"
        }
    },
    [GetString(TQG_TAB_GROUP)] = {
        [01] = {
            name = GetAllianceName(ALLIANCE_ALDMERI_DOMINION),
            down = "/esoui/art/charactercreate/charactercreate_aldmeriicon_down.dds",
            up = "/esoui/art/charactercreate/charactercreate_aldmeriicon_up.dds",
            over = "/esoui/art/charactercreate/charactercreate_aldmeriicon_over.dds"
        },
        [02] = {
            name = GetAllianceName(ALLIANCE_DAGGERFALL_COVENANT),
            down = "/esoui/art/charactercreate/charactercreate_daggerfallicon_down.dds",
            up = "/esoui/art/charactercreate/charactercreate_daggerfallicon_up.dds",
            over = "/esoui/art/charactercreate/charactercreate_daggerfallicon_over.dds"
        },
        [03] = {
            name = GetAllianceName(ALLIANCE_EBONHEART_PACT),
            down = "/esoui/art/charactercreate/charactercreate_ebonhearticon_down.dds",
            up = "/esoui/art/charactercreate/charactercreate_ebonhearticon_up.dds",
            over = "/esoui/art/charactercreate/charactercreate_ebonhearticon_over.dds"
        },
        [04] = {
            name = GetZoneNameById(347), -- Coldharbour
            down = "/esoui/art/treeicons/antiquities_tabicon_coldharbour_down.dds",
            up = "/esoui/art/treeicons/antiquities_tabicon_coldharbour_up.dds",
            over = "/esoui/art/treeicons/antiquities_tabicon_coldharbour_over.dds"
        },
        [05] = {
            name = GetZoneNameById(888), -- "Craglorn"
            down = "/esoui/art/treeicons/antiquities_tabicon_craglorn_down.dds",
            up = "/esoui/art/treeicons/antiquities_tabicon_craglorn_up.dds",
            over = "/esoui/art/treeicons/antiquities_tabicon_craglorn_over.dds"
        },
        [06] = {
            name = GetString(TQG_GUILDS_AND_GLORY),
            down = "/esoui/art/treeicons/store_indexicon_dlc_down.dds",
            up = "/esoui/art/treeicons/store_indexicon_dlc_up.dds",
            over = "/esoui/art/treeicons/store_indexicon_dlc_over.dds"
        },
        [07] = {
            name = GetString(TQG_DAEDRIC_WAR),
            down = "/esoui/art/icons/progression_tabicon_daedricconjuration_down.dds",
            up = "/esoui/art/icons/progression_tabicon_daedricconjuration_up.dds",
            over = "/esoui/art/icons/progression_tabicon_daedricconjuration_over.dds"
        },
        [08] = {
            name = GetZoneNameById(726), -- Murkmire
            down = "/esoui/art/treeicons/tutorial_idexicon_murkmire_down.dds",
            up = "/esoui/art/treeicons/tutorial_idexicon_murkmire_up.dds",
            over = "/esoui/art/treeicons/tutorial_idexicon_murkmire_over.dds"
        },
        [09] = {
            name = GetString(TQG_CHAPTER_ELSWEYR),
            down = "/esoui/art/treeicons/tutorial_idexicon_elsweyr_down.dds",
            up = "/esoui/art/treeicons/tutorial_idexicon_elsweyr_up.dds",
            over = "/esoui/art/treeicons/tutorial_idexicon_elsweyr_over.dds"
        },
        [10] = {
            name = GetString(TQG_CHAPTER_SKYRIM),
            down = "/esoui/art/treeicons/tutorial_indexicon_greymoor_down.dds",
            up = "/esoui/art/treeicons/tutorial_indexicon_greymoor_up.dds",
            over = "/esoui/art/treeicons/tutorial_indexicon_greymoor_over.dds"
        },
        [11] = {
            name = GetString(TQG_CHAPTER_BLACKWOOD),
            down = "/esoui/art/treeicons/tutorial_idexicon_deadlands_down.dds",
            up = "/esoui/art/treeicons/tutorial_idexicon_deadlands_up.dds",
            over = "/esoui/art/treeicons/tutorial_idexicon_deadlands_over.dds"
        },
        [12] = {
            name = GetString(TQG_CHAPTER_HIGH_ISLE),
            down = "/esoui/art/charactercreate/charactercreate_bretonicon_down.dds",
            up = "/esoui/art/charactercreate/charactercreate_bretonicon_up.dds",
            over = "/esoui/art/charactercreate/charactercreate_bretonicon_over.dds"
        },
        [13] = {
            name = GetString(TQG_CHAPTER_SHADOW_MORROWIND),
            down = "/esoui/art/charactercreate/charactercreate_arcanisticon_down.dds",
            up = "/esoui/art/charactercreate/charactercreate_arcanisticon_up.dds",
            over = "/esoui/art/charactercreate/charactercreate_arcanisticon_over.dds"
        },
        [14] = {
            name = GetString(TQG_CHAPTER_RECOLLECTION_ITHELIA),
            down = "/esoui/art/charactercreate/charactercreate_arcanisticon_down.dds",
            up = "/esoui/art/charactercreate/charactercreate_arcanisticon_up.dds",
            over = "/esoui/art/charactercreate/charactercreate_arcanisticon_over.dds"
        }
    }
}

TQG.Categories[GetString(TQG_TAB_GROUP)][#TQG.Categories[GetString(TQG_TAB_GROUP)] +
    1] = {
    name = GetString(TQG_DUNGEON_DLC_OLD),
    down = "esoui/art/treeicons/reconstruction_tabicon_dungeon_down.dds",
    up = "esoui/art/treeicons/reconstruction_tabicon_dungeon_up.dds",
    over = "esoui/art/treeicons/reconstruction_tabicon_dungeon_over.dds"
}

TQG.Zones = {
    [GetString(TQG_TAB_OVERVIEW)] = {
        [1] = {
            [01] = {
                zoneId = 000,
                zoneName = GetString(TQG_TAB_CLASSIC),
                zoneDesc = GetString(TQG_OVERVIEW_DESC_CLASSIC)
            },
            [02] = {
                zoneId = 000,
                zoneName = GetString(TQG_TAB_DLC),
                zoneDesc = GetString(TQG_OVERVIEW_DESC_DLC)
            },
            [03] = {
                zoneId = 000,
                zoneName = GetString(TQG_TAB_GROUP),
                zoneDesc = GetString(TQG_OVERVIEW_DESC_GROUP)
            }
        }
    },
    [GetString(TQG_TAB_CLASSIC)] = {
        [1] = {
            [01] = {zoneId = 586},
            [02] = {zoneId = 1429},
            [03] = {zoneId = 200},
            [04] = {zoneId = 1429},
            [05] = {zoneId = 201},
            [06] = {zoneId = 1429},
            [07] = {zoneId = 217},
            [08] = {zoneId = 574},
            [09] = {zoneId = 527},
            [10] = {zoneId = 1429},
            [11] = {zoneId = 581}
        },
        [2] = {
            [1] = {zoneId = 537},
            [2] = {zoneId = 381},
            [3] = {zoneId = 383},
            [4] = {zoneId = 108},
            [5] = {zoneId = 058},
            [6] = {zoneId = 382}
        },
        [3] = {
            [1] = {zoneId = 534},
            [2] = {zoneId = 535},
            [3] = {zoneId = 003},
            [4] = {zoneId = 019},
            [5] = {zoneId = 020},
            [6] = {zoneId = 104},
            [7] = {zoneId = 092}
        },
        [4] = {
            [1] = {zoneId = 280},
            [2] = {zoneId = 281},
            [3] = {zoneId = 041},
            [4] = {zoneId = 057},
            [5] = {zoneId = 117},
            [6] = {zoneId = 101},
            [7] = {zoneId = 103}
        },
        [5] = {
            [1] = {zoneId = 000, zoneName = GetString(TQG_GUILD_INVITATION)},
            [2] = {zoneId = 542},
            [3] = {zoneId = 207},
            [4] = {zoneId = 595},
            [5] = {zoneId = 385},
            [6] = {zoneId = 209}
        },
        [6] = {
            [1] = {zoneId = 000, zoneName = GetString(TQG_GUILD_INVITATION)},
            [2] = {zoneId = 203},
            [3] = {zoneId = 541},
            [4] = {zoneId = 218},
            [5] = {zoneId = 219},
            [6] = {zoneId = 267}
        },
        [7] = {[1] = {zoneId = 347, hasPrologue = true, numPrologueQuests = 2}},
        [8] = {[1] = {zoneId = 888}},
        [9] = {[1] = {zoneId = 181}}
    },
    [GetString(TQG_TAB_DLC)] = {
        [1] = {
            [01] = {zoneId = 584},
            [02] = {zoneId = 684},
            [03] = {zoneId = 816},
            [04] = {zoneId = 823}
        },
        [2] = {
            [01] = {zoneId = 849, hasPrologue = true, numPrologueQuests = 1},
            [02] = {zoneId = 000, zoneName = GetString(TQG_BONUS_BALMORA)},
            [03] = {zoneId = 980, hasPrologue = true, numPrologueQuests = 1},
            [04] = {zoneId = 1011, hasPrologue = true, numPrologueQuests = 1},
            [05] = {zoneId = 1027}
        },
        [3] = {[01] = {zoneId = 726, hasPrologue = true, numPrologueQuests = 2}},
        [4] = {
            [01] = {zoneId = 1080},
            [02] = {zoneId = 1081},
            [03] = {zoneId = 1086, hasPrologue = true, numPrologueQuests = 2},
            [04] = {zoneId = 1122},
            [05] = {zoneId = 1123},
            [06] = {zoneId = 1133, hasPrologue = true, numPrologueQuests = 2},
            [07] = {zoneId = 1138, zoneName = GetString(TQG_EPILOGUE)}
        },
        [5] = {
            [01] = {zoneId = 1153, hasPrologue = true, numPrologueQuests = 1},
            [02] = {zoneId = 1152},
            [03] = {zoneId = 1160, hasPrologue = true, numPrologueQuests = 2},
            [04] = {zoneId = 1201},
            [05] = {zoneId = 1197},
            [06] = {zoneId = 1207, hasPrologue = true, numPrologueQuests = 2},
            [07] = {zoneId = 1221, zoneName = GetString(TQG_EPILOGUE)}
        },
        [6] = {
            [01] = {zoneId = 1228},
            [02] = {zoneId = 1229},
            [03] = {zoneId = 1261, hasPrologue = true, numPrologueQuests = 2},
            [04] = {zoneId = 1267},
            [05] = {zoneId = 1268},
            [06] = {zoneId = 1286, hasPrologue = true, numPrologueQuests = 2},
            [07] = {zoneId = 1295, zoneName = GetString(TQG_EPILOGUE)}
        },
        [7] = {
            [01] = {zoneId = 1301},
            [02] = {zoneId = 1302},
            [03] = {zoneId = 1318, hasPrologue = true, numPrologueQuests = 2},
            [04] = {zoneId = 1360},
            [05] = {zoneId = 1361},
            [06] = {zoneId = 1383, hasPrologue = true, numPrologueQuests = 2},
            [07] = {zoneId = 1373, zoneName = GetString(TQG_EPILOGUE)}
        },
        [8] = {
            [01] = {zoneId = 1389},
            [02] = {zoneId = 1390},
            [03] = {zoneId = 1414, hasPrologue = true, numPrologueQuests = 1},
            [04] = {zoneId = 1436}
        },
        [9] = {
            [01] = {zoneId = 1471},
            [02] = {zoneId = 1470},
            [03] = {zoneId = 1443, hasPrologue = true, numPrologueQuests = 1},
            [04] = {zoneId = 1325, zoneName = GetString(TQG_EPILOGUE)}
        },
        [10] = {
            [01] = {zoneId = 1497},
            [02] = {zoneId = 1496},
            [03] = {zoneId = 1502, hasPrologue = true, numPrologueQuests = 2}
        }
    },
    [GetString(TQG_TAB_GROUP)] = {
        [01] = {
            [01] = {zoneId = 380, zoneName = GetZoneNameById(381)},
            [02] = {zoneId = 126, zoneName = GetZoneNameById(383)},
            [03] = {zoneId = 176, zoneName = GetZoneNameById(108)},
            [04] = {zoneId = 131, zoneName = GetZoneNameById(058)},
            [05] = {zoneId = 031, zoneName = GetZoneNameById(382)}
        },
        [02] = {
            [01] = {zoneId = 144, zoneName = GetZoneNameById(003)},
            [02] = {zoneId = 146, zoneName = GetZoneNameById(019)},
            [03] = {zoneId = 130, zoneName = GetZoneNameById(020)},
            [04] = {zoneId = 022, zoneName = GetZoneNameById(104)},
            [05] = {zoneId = 038, zoneName = GetZoneNameById(092)}
        },
        [03] = {
            [01] = {zoneId = 283, zoneName = GetZoneNameById(041)},
            [02] = {zoneId = 063, zoneName = GetZoneNameById(057)},
            [03] = {zoneId = 148, zoneName = GetZoneNameById(117)},
            [04] = {zoneId = 449, zoneName = GetZoneNameById(101)},
            [05] = {zoneId = 064, zoneName = GetZoneNameById(103)}
        },
        [04] = {[01] = {zoneId = 011, zoneName = GetZoneNameById(347)}},
        [05] = {
            [01] = {zoneId = 638, zoneName = GetZoneNameById(888)},
            [02] = {zoneId = 636, zoneName = GetZoneNameById(888)},
            [03] = {zoneId = 639, zoneName = GetZoneNameById(888)}
        },
        [06] = {
            [01] = {zoneId = 678, zoneName = GetZoneNameById(584)},
            [02] = {zoneId = 688, zoneName = GetZoneNameById(584)},
            [03] = {zoneId = 677, zoneName = GetZoneNameById(684)},
            [04] = {zoneId = 725, zoneName = GetZoneNameById(816)}
        },
        [07] = {
            [01] = {zoneId = 975, zoneName = GetZoneNameById(849)},
            [02] = {zoneId = 1000, zoneName = GetZoneNameById(980)},
            [03] = {zoneId = 1051, zoneName = GetZoneNameById(1011)}
        },
        [08] = {[01] = {zoneId = 1082, zoneName = GetZoneNameById(726)}},
        [09] = {[01] = {zoneId = 1121, zoneName = GetZoneNameById(1086)}},
        [10] = {
            [01] = {zoneId = 1196, zoneName = GetZoneNameById(1160)},
            [02] = {zoneId = 1227, zoneName = GetZoneNameById(1207)}
        },
        [11] = {[01] = {zoneId = 1263, zoneName = GetZoneNameById(1261)}},
        [12] = {[01] = {zoneId = 1344, zoneName = GetZoneNameById(1318)}},
        [13] = {[01] = {zoneId = 1427, zoneName = GetZoneNameById(1414)}},
        [14] = {[01] = {zoneId = 1478, zoneName = GetZoneNameById(1443)}}
    }
}

TQG.Zones[GetString(TQG_TAB_GROUP)][#TQG.Zones[GetString(TQG_TAB_GROUP)] + 1] =
    {
        [01] = {zoneId = 0843},
        [02] = {zoneId = 0848},
        [03] = {zoneId = 0974},
        [04] = {zoneId = 0973},
        [05] = {zoneId = 1010},
        [06] = {zoneId = 1009},
        [07] = {zoneId = 1052},
        [08] = {zoneId = 1055}
    }

TQG.Objectives = {
    [GetString(TQG_TAB_CLASSIC)] = {
        [1] = {
            [01] = {[1] = {questId = 4296}},
            [02] = {[1] = {questId = 4831}},
            [03] = {[1] = {questId = 4474}},
            [04] = {[1] = {questId = 4552}},
            [05] = {[1] = {questId = 4607}},
            [06] = {[1] = {questId = 4764}},
            [07] = {[1] = {questId = 4836}},
            [08] = {[1] = {questId = 4837}},
            [09] = {[1] = {questId = 4867}},
            [10] = {[1] = {questId = 4832}},
            [11] = {[1] = {questId = 4847}}
        },
        [2] = {
            [1] = {[1] = {questId = 0}},
            [2] = {[1] = {questId = 0}},
            [3] = {[1] = {questId = 0}},
            [4] = {[1] = {questId = 0}},
            [5] = {[1] = {questId = 0}},
            [6] = {[1] = {questId = 0}}
        },
        [3] = {
            [1] = {[1] = {questId = 0}},
            [2] = {[1] = {questId = 0}},
            [3] = {[1] = {questId = 0}},
            [4] = {[1] = {questId = 0}},
            [5] = {[1] = {questId = 0}},
            [6] = {[1] = {questId = 0}},
            [7] = {[1] = {questId = 0}}
        },
        [4] = {
            [1] = {[1] = {questId = 0}},
            [2] = {[1] = {questId = 0}},
            [3] = {[1] = {questId = 0}},
            [4] = {[1] = {questId = 0}},
            [5] = {[1] = {questId = 0}},
            [6] = {[1] = {questId = 0}},
            [7] = {[1] = {questId = 0}}
        },
        [5] = {
            [1] = {
                [1] = {questId = 5073, optional = true},
                [2] = {questId = 5077, optional = true},
                [3] = {questId = 5075, optional = true}
            },
            [2] = {[1] = {questId = 3856}},
            [3] = {[1] = {questId = 3858}},
            [4] = {[1] = {questId = 3885}},
            [5] = {[1] = {questId = 3898}},
            [6] = {[1] = {questId = 3973}}
        },
        [6] = {
            [1] = {
                [1] = {questId = 5071, optional = true},
                [2] = {questId = 5076, optional = true},
                [3] = {questId = 5074, optional = true}
            },
            [2] = {[1] = {questId = 3916}},
            [3] = {[1] = {questId = 4435}},
            [4] = {[1] = {questId = 3918}},
            [5] = {[1] = {questId = 3953}},
            [6] = {[1] = {questId = 3997}, [2] = {questId = 4971}}
        },
        [7] = {
            [1] = {
                [1] = {
                    questId = 4780,
                    prologue = true,
                    openingText = GetString(TQG_PROLOGUE)
                },
                [2] = {
                    questId = 4783,
                    prologue = true,
                    openingText = GetString(TQG_PROLOGUE)
                }
            }
        },
        [8] = {[1] = {[1] = {questId = 0}}},
        [9] = {[1] = {[1] = {questId = 4704}}}
    },
    [GetString(TQG_TAB_DLC)] = {
        [1] = {
            [1] = {[1] = {questId = 0}},
            [2] = {[1] = {questId = 0}},
            [3] = {[1] = {questId = 0}},
            [4] = {[1] = {questId = 0}}
        },
        [2] = {
            [1] = {
                [1] = {
                    questId = 5935,
                    prologue = true,
                    openingText = GetString(TQG_PROLOGUE)
                }
            },
            [2] = {
                [1] = {questId = 5887},
                [2] = {questId = 5919},
                [3] = {questId = 5933},
                [4] = {questId = 5948}
            },
            [3] = {
                [1] = {
                    questId = 6023,
                    prologue = true,
                    openingText = GetString(TQG_PROLOGUE)
                }
            },
            [4] = {
                [1] = {
                    questId = 6097,
                    prologue = true,
                    openingText = GetString(TQG_PROLOGUE)
                }
            },
            [5] = {
                [01] = {questId = 6096},
                [02] = {questId = 6172},
                [03] = {questId = 6181},
                [04] = {questId = 6185},
                [05] = {questId = 6197},
                [06] = {questId = 6194},
                [07] = {questId = 6190},
                [08] = {questId = 6198},
                [09] = {questId = 6195},
                [10] = {questId = 6196},
                [11] = {questId = 6199}
            }
        },
        [3] = {
            [1] = {
                [1] = {
                    questId = 6226,
                    prologue = true,
                    openingText = GetString(TQG_PROLOGUE)
                },
                [2] = {
                    questId = 6242,
                    prologue = true,
                    openingText = GetString(TQG_PROLOGUE)
                }
            }
        },
        [4] = {
            [1] = {[1] = {questId = 4432}, [2] = {questId = 6249}},
            [2] = {[1] = {questId = 4432}, [2] = {questId = 6251}},
            [3] = {
                [1] = {
                    questId = 6299,
                    prologue = true,
                    openingText = GetString(TQG_PROLOGUE)
                },
                [2] = {
                    questId = 6306,
                    prologue = true,
                    openingText = GetString(TQG_PROLOGUE)
                }
            },
            [4] = {[1] = {questId = 6349}},
            [5] = {[1] = {questId = 4733}, [2] = {questId = 6351}},
            [6] = {
                [1] = {
                    questId = 6395,
                    prologue = true,
                    openingText = GetString(TQG_PROLOGUE)
                },
                [2] = {
                    questId = 6398,
                    prologue = true,
                    openingText = GetString(TQG_PROLOGUE)
                }
            },
            [7] = {
                [1] = {questId = 6393},
                [2] = {questId = 6397},
                [3] = {questId = 6402}
            }
        },
        [5] = {
            [1] = {[1] = {questId = 6416}},
            [2] = {[1] = {questId = 6414}},
            [3] = {
                [1] = {
                    questId = 6454,
                    prologue = true,
                    openingText = GetString(TQG_PROLOGUE)
                },
                [2] = {
                    questId = 6463,
                    prologue = true,
                    openingText = GetString(TQG_PROLOGUE)
                }
            },
            [4] = {[1] = {questId = 6507}},
            [5] = {[1] = {questId = 6505}},
            [6] = {
                [1] = {
                    questId = 6549,
                    prologue = true,
                    openingText = GetString(TQG_PROLOGUE)
                },
                [2] = {
                    questId = 6555,
                    prologue = true,
                    openingText = GetString(TQG_PROLOGUE)
                }
            },
            [7] = {
                [1] = {questId = 6552},
                [2] = {questId = 6560},
                [3] = {questId = 6570}
            }
        },
        [6] = {
            [1] = {[1] = {questId = 6576}},
            [2] = {[1] = {questId = 6578}},
            [3] = {
                [1] = {
                    questId = 6612,
                    prologue = true,
                    openingText = GetString(TQG_PROLOGUE)
                },
                [2] = {
                    questId = 6627,
                    prologue = true,
                    openingText = GetString(TQG_PROLOGUE)
                }
            },
            [4] = {[1] = {questId = 6683}},
            [5] = {[1] = {questId = 6685}},
            [6] = {
                [1] = {
                    questId = 6701,
                    prologue = true,
                    openingText = GetString(TQG_PROLOGUE)
                },
                [2] = {
                    questId = 6703,
                    prologue = true,
                    openingText = GetString(TQG_PROLOGUE)
                }
            },
            [7] = {
                [1] = {questId = 6696},
                [2] = {questId = 6697},
                [3] = {questId = 6693}
            }
        },
        [7] = {
            [1] = {[1] = {questId = 6740}},
            [2] = {[1] = {questId = 6742}},
            [3] = {
                [1] = {
                    questId = 6751,
                    prologue = true,
                    openingText = GetString(TQG_PROLOGUE)
                },
                [2] = {
                    questId = 6761,
                    prologue = true,
                    openingText = GetString(TQG_PROLOGUE)
                }
            },
            [4] = {[1] = {questId = 6835}},
            [5] = {[1] = {questId = 6837}},
            [6] = {
                [1] = {
                    questId = 6843,
                    prologue = true,
                    openingText = GetString(TQG_PROLOGUE)
                },
                [2] = {
                    questId = 6859,
                    prologue = true,
                    openingText = GetString(TQG_PROLOGUE)
                }
            },
            [7] = {
                [1] = {questId = 6847},
                [2] = {questId = 6848},
                [3] = {questId = 6894}
            }
        },
        [8] = {
            [1] = {[1] = {questId = 6896}},
            [2] = {[1] = {questId = 7027}},
            [3] = {
                [1] = {
                    questId = 6967,
                    prologue = true,
                    openingText = GetString(TQG_PROLOGUE)
                }
            },
            [4] = {[1] = {questId = 7061}}
        },
        [9] = {
            [1] = {[1] = {questId = 7155}},
            [2] = {[1] = {questId = 7105}},
            [3] = {
                [1] = {
                    questId = 7079,
                    prologue = true,
                    openingText = GetString(TQG_PROLOGUE)
                }
            },
            [4] = {
                [1] = {questId = 7076},
                [2] = {questId = 7077},
                [3] = {questId = 7078}
            }
        },
        [10] = {
            [1] = {[1] = {questId = 7155}},
            [2] = {[1] = {questId = 7105}},
            [3] = {
                [1] = {
                    questId = 7290,
                    prologue = true,
                    openingText = GetString(TQG_PROLOGUE)
                },
                [2] = {
                    questId = 7310,
                    prologue = true,
                    openingText = GetString(TQG_PROLOGUE)
                }
            }
        }
    },
    [GetString(TQG_TAB_GROUP)] = {
        [01] = {
            [1] = {[1] = {questId = 4107}, [2] = {questId = 4597}},
            [2] = {[1] = {questId = 4336}, [2] = {questId = 4675}},
            [3] = {[1] = {questId = 4778}, [2] = {questId = 5120}},
            [4] = {[1] = {questId = 4538}},
            [5] = {[1] = {questId = 4733}}
        },
        [02] = {
            [1] = {[1] = {questId = 4054}, [2] = {questId = 4555}},
            [2] = {[1] = {questId = 4246}, [2] = {questId = 4813}},
            [3] = {[1] = {questId = 4379}, [2] = {questId = 5113}},
            [4] = {[1] = {questId = 4432}},
            [5] = {[1] = {questId = 4589}}
        },
        [03] = {
            [1] = {[1] = {questId = 3993}, [2] = {questId = 4303}},
            [2] = {[1] = {questId = 4145}, [2] = {questId = 4641}},
            [3] = {[1] = {questId = 4202}},
            [4] = {[1] = {questId = 4346}},
            [5] = {[1] = {questId = 4469}}
        },
        [04] = {[1] = {[1] = {questId = 4822}}},
        [05] = {
            [1] = {[1] = {questId = 5102}},
            [2] = {[1] = {questId = 5087}},
            [3] = {[1] = {questId = 5171}}
        },
        [06] = {
            [1] = {[1] = {questId = 5136}},
            [2] = {[1] = {questId = 5342}},
            [3] = {[1] = {questId = 5448}},
            [4] = {[1] = {questId = 5554}, [2] = {questId = 5352}}
        },
        [07] = {
            [1] = {[1] = {questId = 6000}, [2] = {questId = 5894}},
            [2] = {[1] = {questId = 6090}},
            [3] = {[1] = {questId = 6193}, [2] = {questId = 6192}}
        },
        [08] = {[1] = {[1] = {questId = 6269}}},
        [09] = {[1] = {[1] = {questId = 6354}, [2] = {questId = 6353}}},
        [10] = {
            [1] = {[1] = {questId = 6504}, [2] = {questId = 6503}},
            [2] = {[1] = {questId = 6597}, [2] = {questId = 6610}}
        },
        [11] = {[1] = {[1] = {questId = 6655}, [2] = {questId = 6654}}},
        [12] = {[1] = {[1] = {questId = 6784}, [2] = {questId = 6783}}},
        [13] = {[1] = {[1] = {questId = 7032}, [2] = {questId = 7031}}},
        [14] = {[1] = {[1] = {questId = 7213}, [2] = {questId = 7212}}}
    }
}

TQG.Objectives[GetString(TQG_TAB_GROUP)][#TQG.Objectives[GetString(TQG_TAB_GROUP)] +
    1] = {
    [1] = {[1] = {questId = 5403}},
    [2] = {[1] = {questId = 5702}},
    [3] = {[1] = {questId = 5891}},
    [4] = {[1] = {questId = 5889}},
    [5] = {[1] = {questId = 6065}},
    [6] = {[1] = {questId = 6064}},
    [7] = {[1] = {questId = 6186}},
    [8] = {[1] = {questId = 6188}}
}
