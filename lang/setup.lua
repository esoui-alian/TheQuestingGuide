TQG.OverviewTabName = GetString(TQG_OVERVIEW_TAB)
TQG.ClassicTabName = GetString(TQG_CLASSIC_TAB)
TQG.DLCTabName = GetString(TQG_DLC_TAB)
TQG.GroupTabName = GetString(TQG_GROUP_TAB)

TQG.BtnQuestMap = GetString(TQG_QUEST_BTN)
TQG.BtnCraglorn = GetString(TQG_CRAGLORN_BTN)
TQG.BtnImperialCity = GetString(TQG_IC_BTN)
TQG.BtnOrsinium = GetString(TQG_ORSINIUM_BTN)

TQG.MultiQuestIds = {
	--Cyrodiil Intro.
	[1] = {4704, 4722, 4725},
	--IC Intro.
	[2] = {5487, 5493, 5496, 5602},
	--Craglorn 1-8
	[3] = {5033, 5747},
	[4] = {5069, 5748},
	[5] = {5116, 5761},
	[6] = {5115, 5760},
	[7] = {5194, 5768},
	[8] = {5203, 5769},
	[9] = {5239, 5771},
	[10] = {5258, 5776},
	--Craglorn Trials: Sanctum Ophidia
	[11] = {5171, 5743},
}

local strfmt = string.format

local playerAlliance = GetUnitAlliance("player")
local nameToAbbrev = {
	[1] = "Dominion",
	[2] = "Pact",
	[3] = "Covenant",
}
local allianceAbbrev = nameToAbbrev[playerAlliance]

local groupTooltipFmt = "<<1>>: (<<2>> <<3>>)"
local function SetupGroupTooltip(str1, str2, zoneIdOrName)
	if type(zoneIdOrName) == "number" then zoneIdOrName = GetZoneNameById(zoneIdOrName) end

	return zo_strformat(groupTooltipFmt, str1, str2, zoneIdOrName)
end

do
	TQG.GroupQuestIdToTooltip[4107] = SetupGroupTooltip(GetString(TQG_DUNGEON), GetString(TQG_ENTER), 380)
	TQG.GroupQuestIdToTooltip[4597] = SetupGroupTooltip(GetString(TQG_DUNGEON), GetString(TQG_ENTER), 935)
	TQG.GroupQuestIdToTooltip[4336] = SetupGroupTooltip(GetString(TQG_DUNGEON), GetString(TQG_ENTER), 126)
	TQG.GroupQuestIdToTooltip[4675] = SetupGroupTooltip(GetString(TQG_DUNGEON), GetString(TQG_ENTER), 931)
	TQG.GroupQuestIdToTooltip[4778] = SetupGroupTooltip(GetString(TQG_DUNGEON), GetString(TQG_ENTER), 176)
	TQG.GroupQuestIdToTooltip[5120] = SetupGroupTooltip(GetString(TQG_DUNGEON), GetString(TQG_ENTER), 681)
	TQG.GroupQuestIdToTooltip[4538] = SetupGroupTooltip(GetString(TQG_DUNGEON), GetString(TQG_ENTER), 131)
	TQG.GroupQuestIdToTooltip[4733] = SetupGroupTooltip(GetString(TQG_DUNGEON), GetString(TQG_ENTER), 31)

	TQG.GroupQuestIdToTooltip[4054] = SetupGroupTooltip(GetString(TQG_DUNGEON), GetString(TQG_ENTER), 144)
	TQG.GroupQuestIdToTooltip[4555] = SetupGroupTooltip(GetString(TQG_DUNGEON), GetString(TQG_ENTER), 936)
	TQG.GroupQuestIdToTooltip[4246] = SetupGroupTooltip(GetString(TQG_DUNGEON), GetString(TQG_ENTER), 146)
	TQG.GroupQuestIdToTooltip[4813] = SetupGroupTooltip(GetString(TQG_DUNGEON), GetString(TQG_ENTER), 933)
	TQG.GroupQuestIdToTooltip[4379] = SetupGroupTooltip(GetString(TQG_DUNGEON), GetString(TQG_ENTER), 130)
	TQG.GroupQuestIdToTooltip[5113] = SetupGroupTooltip(GetString(TQG_DUNGEON), GetString(TQG_ENTER), 932)
	TQG.GroupQuestIdToTooltip[4432] = SetupGroupTooltip(GetString(TQG_DUNGEON), GetString(TQG_ENTER), 22)
	TQG.GroupQuestIdToTooltip[4589] = SetupGroupTooltip(GetString(TQG_DUNGEON), GetString(TQG_ENTER), 38)

	TQG.GroupQuestIdToTooltip[3993] = SetupGroupTooltip(GetString(TQG_DUNGEON), GetString(TQG_ENTER), 283)
	TQG.GroupQuestIdToTooltip[4303] = SetupGroupTooltip(GetString(TQG_DUNGEON), GetString(TQG_ENTER), 934)
	TQG.GroupQuestIdToTooltip[4145] = SetupGroupTooltip(GetString(TQG_DUNGEON), GetString(TQG_ENTER), 63)
	TQG.GroupQuestIdToTooltip[4641] = SetupGroupTooltip(GetString(TQG_DUNGEON), GetString(TQG_ENTER), 930)
	TQG.GroupQuestIdToTooltip[4202] = SetupGroupTooltip(GetString(TQG_DUNGEON), GetString(TQG_ENTER), 148)
	TQG.GroupQuestIdToTooltip[4346] = SetupGroupTooltip(GetString(TQG_DUNGEON), GetString(TQG_ENTER), 449)
	TQG.GroupQuestIdToTooltip[4469] = SetupGroupTooltip(GetString(TQG_DUNGEON), GetString(TQG_ENTER), 64)

	TQG.GroupQuestIdToTooltip[4822] = SetupGroupTooltip(GetString(TQG_DUNGEON), GetString(TQG_ENTER), 11)

	TQG.GroupQuestIdToTooltip[5102] = SetupGroupTooltip(GetString(TQG_TRIAL), GetString(TQG_ENTER), 638)
	TQG.GroupQuestIdToTooltip[5087] = SetupGroupTooltip(GetString(TQG_TRIAL), GetString(TQG_ENTER), 636)
	TQG.GroupQuestIdToTooltip[5171] = SetupGroupTooltip(GetString(TQG_TRIAL), GetString(TQG_ENTER), 639)

	TQG.GroupQuestIdToTooltip[5136] = SetupGroupTooltip(GetString(TQG_DUNGEON), GetString(TQG_ENTER), 678)
	TQG.GroupQuestIdToTooltip[5342] = SetupGroupTooltip(GetString(TQG_DUNGEON), GetString(TQG_ENTER), 688)

	--Wrothgar – Maelstrom Arena
	TQG.GroupQuestIdToTooltip[5448] = SetupGroupTooltip(GetString(TQG_ARENA), GetString(TQG_ENTER), 677)
	TQG.GroupQuestIdToTooltip[5352] = SetupGroupTooltip(GetString(TQG_TRIAL), GetString(TQG_ENTER), 725)

	TQG.GroupQuestIdToTooltip[5894] = SetupGroupTooltip(GetString(TQG_TRIAL), GetString(TQG_ENTER), 975)
	TQG.GroupQuestIdToTooltip[6090] = SetupGroupTooltip(GetString(TQG_TRIAL), GetString(TQG_ENTER), 1000)
	TQG.GroupQuestIdToTooltip[6192] = SetupGroupTooltip(GetString(TQG_TRIAL), GetString(TQG_ENTER), 1051)

	TQG.GroupQuestIdToTooltip[6269] = SetupGroupTooltip(GetString(TQG_ARENA), GetString(TQG_ENTER), 1082)

	TQG.GroupQuestIdToTooltip[6353] = SetupGroupTooltip(GetString(TQG_TRIAL), GetString(TQG_ENTER), 1121)

	TQG.GroupQuestIdToTooltip[6503] = SetupGroupTooltip(GetString(TQG_TRIAL), GetString(TQG_ENTER), 1196)

	TQG.GroupQuestIdToTooltip[6610] = SetupGroupTooltip(GetString(TQG_ARENA), GetString(TQG_ENTER), 1227)

	TQG.GroupQuestIdToTooltip[6654] = SetupGroupTooltip(GetString(TQG_TRIAL), GetString(TQG_ENTER), 1263)

	TQG.GroupQuestIdToTooltip[5403] = SetupGroupTooltip(GetString(TQG_DUNGEON), GetString(TQG_ENTER), 843)
	TQG.GroupQuestIdToTooltip[5702] = SetupGroupTooltip(GetString(TQG_DUNGEON), GetString(TQG_ENTER), 848)

	TQG.GroupQuestIdToTooltip[5891] = SetupGroupTooltip(GetString(TQG_DUNGEON), GetString(TQG_ENTER), 974)
	TQG.GroupQuestIdToTooltip[5889] = SetupGroupTooltip(GetString(TQG_DUNGEON), GetString(TQG_ENTER), 973)

	TQG.GroupQuestIdToTooltip[6065] = SetupGroupTooltip(GetString(TQG_DUNGEON), GetString(TQG_ENTER), 1010)
	TQG.GroupQuestIdToTooltip[6064] = SetupGroupTooltip(GetString(TQG_DUNGEON), GetString(TQG_ENTER), 1009)

	TQG.GroupQuestIdToTooltip[6186] = SetupGroupTooltip(GetString(TQG_DUNGEON), GetString(TQG_ENTER), 1052)
	TQG.GroupQuestIdToTooltip[6188] = SetupGroupTooltip(GetString(TQG_DUNGEON), GetString(TQG_ENTER), 1055)
end

TQG.TopLevelOverview = {
	[1] = GetString(TQG_OVERVIEW_TAB),
}

TQG.ZoneLevelOverview = {
	[1] = {
		[1] = {name = strfmt("ESO: %s", GetString(TQG_CLASSIC_TAB)), id = GetString(TQG_OVERVIEW_CLASSIC_DESC)},
		[2] = {name = strfmt("ESO: %s", GetString(TQG_OVERVIEW_DLC_TITLE)), id = GetString(TQG_OVERVIEW_DLC_DESC)},
		[3] = {name = strfmt("ESO: %s", GetString(TQG_OVERVIEW_GROUP_TITLE)), id = GetString(TQG_OVERVIEW_GROUP_DESC)},
	},
}

TQG.ObjectiveLevelOverview = {}
TQG.ObjectiveLevelOverview[1] = {}
	TQG.ObjectiveLevelOverview[1][1] = {
		[1] = {name = GetString(TQG_OVERVIEW_LINKS_TITLE), description = GetString(TQG_OVERVIEW_LINKS_TEXT)},
	}
	TQG.ObjectiveLevelOverview[1][2] = {
		[1] = {name = GetString(TQG_OVERVIEW_LINKS_TITLE), description = GetString(TQG_OVERVIEW_LINKS_TEXT)},
	}
	TQG.ObjectiveLevelOverview[1][3] = { --Add note about Story I/II dungeons?
		[1] = {name = GetString(TQG_OVERVIEW_OBJECTIVE_TITLE), description = GetString(TQG_OVERVIEW_OBJECTIVE_TEXT)},
	}

TQG.TopLevelClassic = {
	[1] = zo_strformat("0-2: <<1>>", GetString(TQG_PLANEMELD)),
	[2] = zo_strformat("1: <<1>>", GetAllianceName(1)),
	[3] = zo_strformat("1: <<1>>", GetAllianceName(3)),
	[4] = zo_strformat("1: <<1>>", GetAllianceName(2)),
	[5] = zo_strformat("1: <<1>>", GetString(TQG_FIGHTERS_NAME)),
	[6] = zo_strformat("1: <<1>>", GetString(TQG_MAGES_NAME)),
	[7] = zo_strformat("2: <<1>>", GetZoneNameById(347)),
	[8] = zo_strformat("3: <<1>>", GetZoneNameById(888)),
	[9] = zo_strformat("x: <<1>>", GetZoneNameById(181)),
}

TQG.ZoneLevelClassic = {
	--MainQuest
	[1] = {
		[1] = {name = 0, id = 586},
		[2] = {name = 1.0, id = 199},
		[3] = {name = 1.1, id = 200},
		[4] = {name = 1.11, id = 199},
		[5] = {name = 1.21, id = 201},
		[6] = {name = 1.31, id = 199},
		[7] = {name = 1.4, id = 217},
		[8] = {name = 1.41, id = 574},
		[9] = {name = 1.5, id = 527},
		[10] = {name = 1.51, id = 199},
		[11] = {name = 2.99, id = 581}
	},
	--Aldmeri Dominion
	[2] = {
		[1] = {name = 1, id = 537},
		[2] = {name = 1.1, id = 381},
		[3] = {name = 1.2, id = 383},
		[4] = {name = 1.3, id = 108},
		[5] = {name = 1.4, id = 58},
		[6] = {name = 1.5, id = 382},
	},
	--Daggerfall Covenant
	[3] = {
		[1] = {name = 1, id = 534},
		[2] = {name = 1.01, id = 535},
		[3] = {name = 1.1, id = 3},
		[4] = {name = 1.2, id = 19},
		[5] = {name = 1.3, id = 20},
		[6] = {name = 1.4, id = 104},
		[7] = {name = 1.5, id = 92},
	},
	--Ebonheart Pact
	[4] = {
		[1] = {name = 1, id = 280},
		[2] = {name = 1.01, id = 281},
		[3] = {name = 1.1, id = 41},
		[4] = {name = 1.2, id = 57},
		[5] = {name = 1.3, id = 117},
		[6] = {name = 1.4, id = 101},
		[7] = {name = 1.5, id = 103},
	},
	--Fighters Guild
	[5] = {
		[1] = {name = strfmt("(1.00) %s", GetString(TQG_INVITATION)), id = GetString(TQG_FIGHTERS_DESC)},
		[2] = {name = strfmt("(1.10) %s", GetString(TQG_DOSHIA_LAIR)), id = 542},
		[3] = {name = 1.2, id = 207},
		[4] = {name = 1.3, id = 595},
		[5] = {name = 1.4, id = 385},
		[6] = {name = 1.5, id = 209},
	},
	--Mages Guild
	[6] = {
		[1] = {name = strfmt("(1.00) %s", GetString(TQG_INVITATION)), id = GetString(TQG_MAGES_DESC)},
		[2] = {name = 1.1, id = 203},
		[3] = {name = 1.2, id = 541},
		[4] = {name = 1.3, id = 218}, --"(1.30) Circus of Cheerful [...]"
		[5] = {name = 1.4, id = 219}, --"(1.40) Chateau of the Rav [...]"
		[6] = {name = 1.5, id = 267},
	},
	--Coldharbour
	[7] = {
		[1] = {name = 2, id = 347, SideQuestCheck = true, PreEndSideQuestCheck = 2},
	},
	--Craglorn
	[8] = {
		[1] = {name = 3, id = 888},
	},
	--Cyrodiil
	[9] = {
		[1] = {name = zo_strformat("(X.XX) <<1>>", GetZoneNameById(181)), id = 181},
	},
}


TQG.ObjectiveLevelClassic = {}
TQG.ObjectiveLevelClassic[1] = {}
	TQG.ObjectiveLevelClassic[1][1] = {
		[1] = {internalId = 4296, overrideDetails = true},
	}
	TQG.ObjectiveLevelClassic[1][2] = {
		[1] = {internalId = 4831, overrideDetails = true},
	}
	TQG.ObjectiveLevelClassic[1][3] = {
		[1] = {internalId = 4474, overrideDetails = true},
	}
	TQG.ObjectiveLevelClassic[1][4] = {
		[1] = {internalId = 4552, overrideDetails = true},
	}
	TQG.ObjectiveLevelClassic[1][5] = {
		[1] = {internalId = 4607, overrideDetails = true},
	}
	TQG.ObjectiveLevelClassic[1][6] = {
		[1] = {internalId = 4764, overrideDetails = true},
	}
	TQG.ObjectiveLevelClassic[1][7] = {
		[1] = {internalId = 4836, overrideDetails = true},
	}
	TQG.ObjectiveLevelClassic[1][8] = {
		[1] = {internalId = 4837, overrideDetails = true},
	}
	TQG.ObjectiveLevelClassic[1][9] = {
		[1] = {internalId = 4867, overrideDetails = true},
	}
	TQG.ObjectiveLevelClassic[1][10] = {
		[1] = {internalId = 4832, overrideDetails = true},
	}
	TQG.ObjectiveLevelClassic[1][11] = {
		[1] = {internalId = 4847, overrideDetails = true},
	}

TQG.ObjectiveLevelClassic[2] = {}
	TQG.ObjectiveLevelClassic[2][1] = {
		[1] = {internalId = 4680},
		[2] = {internalId = 4620},
		[3] = {internalId = 4625},
		[4] = {internalId = 4624},
		[5] = {internalId = 4621},
		[6] = {internalId = 4818},
	}
	TQG.ObjectiveLevelClassic[2][2] = {
		[01] = {internalId = 4255},
		[02] = {internalId = 4256},
		[03] = {internalId = 4211},
		[04] = {internalId = 4217},
		[05] = {internalId = 4222},
		[06] = {internalId = 4366},
		[07] = {internalId = 4293},
		[08] = {internalId = 4294},
		[09] = {internalId = 4368},
		[10] = {internalId = 4330},
		[11] = {internalId = 4331},
		[12] = {internalId = 4345},
		[13] = {internalId = 4365},
		[14] = {internalId = 4355},
		[15] = {internalId = 4357},
		[16] = {internalId = 4260},
	}
	TQG.ObjectiveLevelClassic[2][3] = {
		[01] = {internalId = 0},
		[02] = {internalId = 0},
		[03] = {internalId = 0},
		[04] = {internalId = 0},
		[05] = {internalId = 0},
		[06] = {internalId = 0},
		[07] = {internalId = 0},
		[08] = {internalId = 0},
		[09] = {internalId = 0},
		[10] = {internalId = 0},
		[11] = {internalId = 0},
		[12] = {internalId = 0},
		[13] = {internalId = 0},
		[14] = {internalId = 0},
		[15] = {internalId = 0},
		[16] = {internalId = 0},
		[17] = {internalId = 0},
	}
	TQG.ObjectiveLevelClassic[2][4] = {
		[01] = {internalId = 0},
		[02] = {internalId = 0},
		[03] = {internalId = 0},
		[04] = {internalId = 0},
		[05] = {internalId = 0},
		[06] = {internalId = 0},
		[07] = {internalId = 0},
		[08] = {internalId = 0},
		[09] = {internalId = 0},
		[10] = {internalId = 0},
		[11] = {internalId = 0},
		[12] = {internalId = 0},
		[13] = {internalId = 0},
		[14] = {internalId = 0},
		[15] = {internalId = 0},
		[16] = {internalId = 0},
		[17] = {internalId = 0},
	}
	TQG.ObjectiveLevelClassic[2][5] = {
		[01] = {internalId = 0},
		[02] = {internalId = 0},
		[03] = {internalId = 0},
		[04] = {internalId = 0},
		[05] = {internalId = 0},
		[06] = {internalId = 0},
		[07] = {internalId = 0},
		[08] = {internalId = 0},
		[09] = {internalId = 0},
		[10] = {internalId = 0},
		[11] = {internalId = 0},
		[12] = {internalId = 0},
		[13] = {internalId = 0},
		[14] = {internalId = 0},
		[15] = {internalId = 0},
		[16] = {internalId = 0},
		[17] = {internalId = 0},
	}
	TQG.ObjectiveLevelClassic[2][6] = {
		[01] = {internalId = 0},
		[02] = {internalId = 0},
		[03] = {internalId = 0},
		[04] = {internalId = 0},
		[05] = {internalId = 0},
		[06] = {internalId = 0},
		[07] = {internalId = 0},
		[08] = {internalId = 0},
		[09] = {internalId = 0},
		[10] = {internalId = 0},
		[11] = {internalId = 0},
		[12] = {internalId = 0},
		[13] = {internalId = 0},
		[14] = {internalId = 0},
		[15] = {internalId = 0},
		[16] = {internalId = 0},
		[17] = {internalId = 0},
	}

TQG.ObjectiveLevelClassic[3] = {}
	TQG.ObjectiveLevelClassic[3][1] = {
		[01] = {internalId = 4466, optional = true},
		[02] = {internalId = 4431},
		[03] = {internalId = 4454},
		[04] = {internalId = 4344},
		[05] = {internalId = 4510, optional = true},
		[06] = {internalId = 4514, optional = true},
		[07] = {internalId = 4476},
	}
	TQG.ObjectiveLevelClassic[3][2] = {
		[01] = {internalId = 4523},
		[02] = {internalId = 4478},
		[03] = {internalId = 4525},
		[04] = {internalId = 4468},
		[05] = {internalId = 4449},
		[06] = {internalId = 4566},
	}
	TQG.ObjectiveLevelClassic[3][3] = {
		[01] = {internalId = 0},
		[02] = {internalId = 0},
		[03] = {internalId = 0},
		[04] = {internalId = 0},
		[05] = {internalId = 0},
		[06] = {internalId = 0},
		[07] = {internalId = 0},
		[08] = {internalId = 0},
		[09] = {internalId = 0},
		[10] = {internalId = 0},
		[11] = {internalId = 0},
		[12] = {internalId = 0},
		[13] = {internalId = 0},
		[14] = {internalId = 0},
		[15] = {internalId = 0},
		[16] = {internalId = 0},
		[17] = {internalId = 0},
		[18] = {internalId = 0},
		[19] = {internalId = 0},
		[20] = {internalId = 0},
		[21] = {internalId = 0},
		[22] = {internalId = 0},
		[23] = {internalId = 0},
		[24] = {internalId = 0},
		[25] = {internalId = 0},
	}
	TQG.ObjectiveLevelClassic[3][4] = {
		[01] = {internalId = 0},
		[02] = {internalId = 0},
		[03] = {internalId = 0},
		[04] = {internalId = 0},
		[05] = {internalId = 0},
		[06] = {internalId = 0},
		[07] = {internalId = 0},
		[08] = {internalId = 0},
		[09] = {internalId = 0},
		[10] = {internalId = 0},
		[11] = {internalId = 0},
		[12] = {internalId = 0},
		[13] = {internalId = 0},
		[14] = {internalId = 0},
		[15] = {internalId = 0},
		[16] = {internalId = 0},
		[17] = {internalId = 0},
		[18] = {internalId = 0},
		[19] = {internalId = 0},
		[20] = {internalId = 0},
		[21] = {internalId = 0},
		[22] = {internalId = 0},
		[23] = {internalId = 0},
		[24] = {internalId = 0},
		[25] = {internalId = 0},
	}
	TQG.ObjectiveLevelClassic[3][5] = {
		[01] = {internalId = 0},
		[02] = {internalId = 0},
		[03] = {internalId = 0},
		[04] = {internalId = 0},
		[05] = {internalId = 0},
		[06] = {internalId = 0},
		[07] = {internalId = 0},
		[08] = {internalId = 0},
		[09] = {internalId = 0},
		[10] = {internalId = 0},
		[11] = {internalId = 0},
		[12] = {internalId = 0},
		[13] = {internalId = 0},
		[14] = {internalId = 0},
		[15] = {internalId = 0},
		[16] = {internalId = 0},
		[17] = {internalId = 0},
		[18] = {internalId = 0},
		[19] = {internalId = 0},
		[20] = {internalId = 0},
		[21] = {internalId = 0},
		[22] = {internalId = 0},
		[23] = {internalId = 0},
		[24] = {internalId = 0},
		[25] = {internalId = 0},
	}
	TQG.ObjectiveLevelClassic[3][6] = {
		[01] = {internalId = 0},
		[02] = {internalId = 0},
		[03] = {internalId = 0},
		[04] = {internalId = 0},
		[05] = {internalId = 0},
		[06] = {internalId = 0},
		[07] = {internalId = 0},
		[08] = {internalId = 0},
		[09] = {internalId = 0},
		[10] = {internalId = 0},
		[11] = {internalId = 0},
		[12] = {internalId = 0},
		[13] = {internalId = 0},
		[14] = {internalId = 0},
		[15] = {internalId = 0},
		[16] = {internalId = 0},
		[17] = {internalId = 0},
		[18] = {internalId = 0},
		[19] = {internalId = 0},
		[20] = {internalId = 0},
		[21] = {internalId = 0},
		[22] = {internalId = 0},
		[23] = {internalId = 0},
		[24] = {internalId = 0},
		[25] = {internalId = 0},
	}
	TQG.ObjectiveLevelClassic[3][7] = {
		[01] = {internalId = 0},
		[02] = {internalId = 0},
		[03] = {internalId = 0},
		[04] = {internalId = 0},
		[05] = {internalId = 0},
		[06] = {internalId = 0},
		[07] = {internalId = 0},
		[08] = {internalId = 0},
		[09] = {internalId = 0},
		[10] = {internalId = 0},
		[11] = {internalId = 0},
		[12] = {internalId = 0},
		[13] = {internalId = 0},
		[14] = {internalId = 0},
		[15] = {internalId = 0},
		[16] = {internalId = 0},
		[17] = {internalId = 0},
		[18] = {internalId = 0},
		[19] = {internalId = 0},
		[20] = {internalId = 0},
		[21] = {internalId = 0},
		[22] = {internalId = 0},
		[23] = {internalId = 0},
		[24] = {internalId = 0},
		[25] = {internalId = 0},
	}


TQG.ObjectiveLevelClassic[4] = {}
	TQG.ObjectiveLevelClassic[4][1] = {
		[01] = {internalId = 3990},
		[02] = {internalId = 3987},
		[03] = {internalId = 3995},
		[04] = {internalId = 3992},
		[05] = {internalId = 4016},
		[06] = {internalId = 4002},
		[07] = {internalId = 3991},
	}
	TQG.ObjectiveLevelClassic[4][2] = {
		[01] = {internalId = 4023},
		[02] = {internalId = 4041},
		[03] = {internalId = 4028, optional = true},
		[04] = {internalId = 4026, optional = true},
		[05] = {internalId = 4051},
	}
	TQG.ObjectiveLevelClassic[4][3] = {
		[01] = {internalId = 0},
		[02] = {internalId = 0},
		[03] = {internalId = 0},
		[04] = {internalId = 0},
		[05] = {internalId = 0},
		[06] = {internalId = 0},
		[07] = {internalId = 0},
		[08] = {internalId = 0},
		[09] = {internalId = 0},
		[10] = {internalId = 0},
		[11] = {internalId = 0},
		[12] = {internalId = 0},
		[13] = {internalId = 0},
		[14] = {internalId = 0},
		[15] = {internalId = 0},
		[16] = {internalId = 0},
		[17] = {internalId = 0},
		[18] = {internalId = 0},
		[19] = {internalId = 0},
		[20] = {internalId = 0},
		[21] = {internalId = 0},
		[22] = {internalId = 0},
		[23] = {internalId = 0},
		[24] = {internalId = 0},
		[25] = {internalId = 0},
	}
	TQG.ObjectiveLevelClassic[4][4] = {
		[01] = {internalId = 0},
		[02] = {internalId = 0},
		[03] = {internalId = 0},
		[04] = {internalId = 0},
		[05] = {internalId = 0},
		[06] = {internalId = 0},
		[07] = {internalId = 0},
		[08] = {internalId = 0},
		[09] = {internalId = 0},
		[10] = {internalId = 0},
		[11] = {internalId = 0},
		[12] = {internalId = 0},
		[13] = {internalId = 0},
		[14] = {internalId = 0},
		[15] = {internalId = 0},
		[16] = {internalId = 0},
		[17] = {internalId = 0},
		[18] = {internalId = 0},
		[19] = {internalId = 0},
		[20] = {internalId = 0},
		[21] = {internalId = 0},
		[22] = {internalId = 0},
		[23] = {internalId = 0},
		[24] = {internalId = 0},
		[25] = {internalId = 0},
	}
	TQG.ObjectiveLevelClassic[4][5] = {
		[01] = {internalId = 0},
		[02] = {internalId = 0},
		[03] = {internalId = 0},
		[04] = {internalId = 0},
		[05] = {internalId = 0},
		[06] = {internalId = 0},
		[07] = {internalId = 0},
		[08] = {internalId = 0},
		[09] = {internalId = 0},
		[10] = {internalId = 0},
		[11] = {internalId = 0},
		[12] = {internalId = 0},
		[13] = {internalId = 0},
		[14] = {internalId = 0},
		[15] = {internalId = 0},
		[16] = {internalId = 0},
		[17] = {internalId = 0},
		[18] = {internalId = 0},
		[19] = {internalId = 0},
		[20] = {internalId = 0},
		[21] = {internalId = 0},
		[22] = {internalId = 0},
		[23] = {internalId = 0},
		[24] = {internalId = 0},
		[25] = {internalId = 0},
	}
	TQG.ObjectiveLevelClassic[4][6] = {
		[01] = {internalId = 0},
		[02] = {internalId = 0},
		[03] = {internalId = 0},
		[04] = {internalId = 0},
		[05] = {internalId = 0},
		[06] = {internalId = 0},
		[07] = {internalId = 0},
		[08] = {internalId = 0},
		[09] = {internalId = 0},
		[10] = {internalId = 0},
		[11] = {internalId = 0},
		[12] = {internalId = 0},
		[13] = {internalId = 0},
		[14] = {internalId = 0},
		[15] = {internalId = 0},
		[16] = {internalId = 0},
		[17] = {internalId = 0},
		[18] = {internalId = 0},
		[19] = {internalId = 0},
		[20] = {internalId = 0},
		[21] = {internalId = 0},
		[22] = {internalId = 0},
		[23] = {internalId = 0},
		[24] = {internalId = 0},
		[25] = {internalId = 0},
	}
	TQG.ObjectiveLevelClassic[4][7] = {
		[01] = {internalId = 0},
		[02] = {internalId = 0},
		[03] = {internalId = 0},
		[04] = {internalId = 0},
		[05] = {internalId = 0},
		[06] = {internalId = 0},
		[07] = {internalId = 0},
		[08] = {internalId = 0},
		[09] = {internalId = 0},
		[10] = {internalId = 0},
		[11] = {internalId = 0},
		[12] = {internalId = 0},
		[13] = {internalId = 0},
		[14] = {internalId = 0},
		[15] = {internalId = 0},
		[16] = {internalId = 0},
		[17] = {internalId = 0},
		[18] = {internalId = 0},
		[19] = {internalId = 0},
		[20] = {internalId = 0},
		[21] = {internalId = 0},
		[22] = {internalId = 0},
		[23] = {internalId = 0},
		[24] = {internalId = 0},
		[25] = {internalId = 0},
	}

TQG.ObjectiveLevelClassic[5] = {}
	TQG.ObjectiveLevelClassic[5][1] = {
		[01] = {internalId = 5073, optional = true, overrideDetails = true, overrideZone = GetMapNameById(243)},
		[02] = {internalId = 5077, optional = true, overrideDetails = true, overrideZone = GetMapNameById(63)},
		[03] = {internalId = 5075, optional = true, overrideDetails = true, overrideZone = GetMapNameById(24)},
	}
	TQG.ObjectiveLevelClassic[5][2] = {
		[01] = {internalId = 3856, overrideDetails = true, overrideZone = GetString(TQG_DOSHIA_LAIR)},
	}
	TQG.ObjectiveLevelClassic[5][3] = {
		[01] = {internalId = 3858, overrideDetails = true},
	}
	TQG.ObjectiveLevelClassic[5][4] = {
		[01] = {internalId = 3885, overrideDetails = true},
	}
	TQG.ObjectiveLevelClassic[5][5] = {
		[01] = {internalId = 3898, overrideDetails = true},
	}
	TQG.ObjectiveLevelClassic[5][6] = {
		[01] = {internalId = 3973, overrideDetails = true},
	}

TQG.ObjectiveLevelClassic[6] = {}
	TQG.ObjectiveLevelClassic[6][1] = {
		[01] = {internalId = 5071, optional = true, overrideDetails = true, overrideZone = GetMapNameById(243)},
		[02] = {internalId = 5076, optional = true, overrideDetails = true, overrideZone = GetMapNameById(63)},
		[03] = {internalId = 5074, optional = true, overrideDetails = true, overrideZone = GetMapNameById(24)},
	}
	TQG.ObjectiveLevelClassic[6][2] = {
		[01] = {internalId = 3916, overrideDetails = true},
	}
	TQG.ObjectiveLevelClassic[6][3] = {
		[01] = {internalId = 4435, overrideDetails = true},
	}
	TQG.ObjectiveLevelClassic[6][4] = {
		[01] = {internalId = 3918, overrideDetails = true},
	}
	TQG.ObjectiveLevelClassic[6][5] = {
		[01] = {internalId = 3953, overrideDetails = true},
	}
	TQG.ObjectiveLevelClassic[6][6] = {
		[01] = {internalId = 3997, overrideDetails = true},
		[02] = {internalId = 4971, overrideDetails = true},
	}

TQG.ObjectiveLevelClassic[7] = {}
	TQG.ObjectiveLevelClassic[7][1] = {
		[00] = {prologueQIds = 2, internalId = 4780, overrideDetails = true},
		[01] = {prologueQIds = 2, internalId = 4783, overrideDetails = true},
		[02] = {internalId = 0},
		[03] = {internalId = 0},
		[04] = {internalId = 0},
		[05] = {internalId = 0},
		[06] = {internalId = 0},
		[07] = {internalId = 0},
		[08] = {internalId = 0},
		[09] = {internalId = 0},
		[10] = {internalId = 0},
		[11] = {internalId = 0},
		[12] = {internalId = 0},
		[13] = {internalId = 0},
		[14] = {internalId = 0},
		[15] = {internalId = 0},
		[16] = {internalId = 0},
		[17] = {internalId = 0},
	}

TQG.ObjectiveLevelClassic[8] = {}
	TQG.ObjectiveLevelClassic[8][1] = {
		[01] = {internalId = 5747},
		[02] = {internalId = 5748},
		[03] = {internalId = 5116},
		[04] = {internalId = 5115},
		[05] = {internalId = 5194},
		[06] = {internalId = 5769},
		[07] = {internalId = 5771},
		[08] = {internalId = 5258},
		[09] = {internalId = 0},
		[10] = {internalId = 0},
	}

TQG.ObjectiveLevelClassic[9] = {}
	TQG.ObjectiveLevelClassic[9][1] = {
		[01] = {internalId = 4704, overrideDescription = "I've entered Cyrodiil, eager to help the "..allianceAbbrev.." win the war."},
	}

TQG.TopLevelDLC = {
	[1] = strfmt("4: %s", GetString(TQG_GUILDS_AND_GLORY)),
	[2] = strfmt("5: %s", GetString(TQG_DAEDRIC_WAR)),
	[3] = strfmt("6: %s", GetString(TQG_MURKMIRE)),
	[4] = strfmt("7: %s", GetString(TQG_CHAPTER_ELSWEYR)),
	[5] = strfmt("8: %s", GetString(TQG_CHAPTER_SKYRIM)),
	[6] = strfmt("9: %s", GetString(TQG_CHAPTER_BLACKWOOD)),
	[7] = strfmt("10: %s", GetString(TQG_CHAPTER_HIGH_ISLE)),
	[8] = strfmt("11: %s", GetString(TQG_CHAPTER_SHADOW_MORROWIND)),
	[9] = strfmt("12: %s", GetString(TQG_CHAPTER_RECOLLECTION_ITHELIA)),
}

TQG.ZoneLevelDLC = {
	--Guilds and Glory
	[1] = {
		[1] = {name = 4, id = 584},
		[2] = {name = 4.1, id = 684},
		[3] = {name = 4.2, id = 816},
		[4] = {name = 4.3, id = 823 },
	},
	--Daedric War
	[2] = {
		[1] = {name = 5, id = 849},
		[2] = {name = strfmt("(5.00) %s", GetString(TQG_BONUS_BALMORA)), id = GetString(TQG_BONUS_BALMORA_DESC)},--"As far as the construction of the towns of Suran and Balmora, aside from the garish use of Hlaalu architecture when the contract clearly called for the utilization of a more dignified Redoran design, they did complete the work on time and on budget. However, we inadvertently provided them with a foothold beyond Seyda Neen. This, in turn, has enabled them to establish business relations with all sources of raw materials and provisions throughout Vvardenfell, giving House Hlaalu a near-monopoly in these areas. Much of House Redoran now buys all of its local goods through Hlaalu aggregators!"},
		[3] = {name = 5.1, id = 980},
		[4] = {name = 5.2, id = 1011},
		[5] = {name = 5.21, id = 1027},
	},
	--Murkmire
	[3] = {
		[1] = {name = 6, id = 726},
	},
	--Season of the Dragon
	[4] = {
		[1] = {name = 7, id = 1080, isDungeonDLC = true},
		[2] = {name = 7, id = 1081, isDungeonDLC = true},
		[3] = {name = 7.1, id = 1086},
		[4] = {name = 7.2, id = 1122, isDungeonDLC = true},
		[5] = {name = 7.2, id = 1123, isDungeonDLC = true},
		[6] = {name = 7.3, id = 1133},
		[7] = {name = strfmt("(7.40) %s", GetString(TQG_EPILOGUE)), id = 1138},
	},
	--Dark Heart of Skyrim
	[5] = {
		[1] = {name = 8, id = 1153, isDungeonDLC = true},
		[2] = {name = 8, id = 1152, isDungeonDLC = true},
		[3] = {name = 8.1, id = 1160},
		[4] = {name = 8.2, id = 1201, isDungeonDLC = true},
		[5] = {name = 8.2, id = 1197, isDungeonDLC = true},
		[6] = {name = 8.3, id = 1207},
		[7] = {name = strfmt("(8.40) %s", GetString(TQG_EPILOGUE)), id = 1221},
	},
	--Gates of Oblivion
	[6] = {
		[1] = {name = 9, id = 1228, isDungeonDLC = true},
		[2] = {name = 9, id = 1229, isDungeonDLC = true},
		[3] = {name = 9.1, id = 1261},
		[4] = {name = 9.2, id = 1267, isDungeonDLC = true},
		[5] = {name = 9.2, id = 1268, isDungeonDLC = true},
		[6] = {name = 9.3, id = 1286},
		[7] = {name = strfmt("(9.40) %s", GetString(TQG_EPILOGUE)), id = 1295}
	},
	--Legacy of the Bretons
	[7] = {
		[1] = {name = 10, id = 1301, isDungeonDLC = true},
		[2] = {name = 10, id = 1302, isDungeonDLC = true},
		[3] = {name = 10.1, id = 1318},
		[4] = {name = 10.2, id = 1360, isDungeonDLC = true},
		[5] = {name = 10.2, id = 1361, isDungeonDLC = true},
		[6] = {name = 10.3, id = 1383},
		[7] = {name = strfmt("(10.40) %s", GetString(TQG_EPILOGUE)), id = 1373}
	},
	--Shadow Over Morrowind
	[8] = {
		[1] = {name = 11, id = 1389, isDungeonDLC = true},
		[2] = {name = 11, id = 1390, isDungeonDLC = true},
		[3] = {name = 11.1, id = 1413},
		[4] = {name = 11.2, id = 1436, isDungeonDLC = true},
	},
	--Recollection of Ithelia
	[9] = {
		[1] = {name = 12, id = 1471, isDungeonDLC = true},
		[2] = {name = 12, id = 1470, isDungeonDLC = true},
	},
}

if GetAPIVersion()>=101042 then
	--
	TQG.ZoneLevelDLC[9][3] = {name = 12.1, id = 1443}
end

local QuestIdToMapIndex = {
	[6023] = {15, 11, 2},
	[6097] = {15, 11, 2},
	[6226] = {7, 11, 4},
	[6299] = {15, 11, 2},
	[6395] = {15, 11, 2},
	[6398] = {15, 11, 2},
}

TQG.ObjectiveLevelDLC = {}
TQG.ObjectiveLevelDLC[1] = {}
	TQG.ObjectiveLevelDLC[1][1] = {
		[01] = {internalId = 0,
				overrideDescription = "The "..GetAllianceName(playerAlliance).." is locked in an epic struggle for control of the Imperial City. The forces of Molag Bal hold the city in an iron grip, but enemy bannermen also vie for power. The "..allianceAbbrev.." needs my help."},
		[02] = {internalId = 0},
		[03] = {internalId = 0},
		[04] = {internalId = 0},
		[05] = {internalId = 0},
		[06] = {internalId = 0},
		[07] = {internalId = 0},
		[08] = {internalId = 0},
		[09] = {internalId = 0},
		[10] = {internalId = 0},
		[11] = {internalId = 0},
		[12] = {internalId = 0},
		[13] = {internalId = 0},
		[14] = {internalId = 0},
		[15] = {internalId = 0},
		[16] = {internalId = 0},
		[17] = {internalId = 0},
	}
	TQG.ObjectiveLevelDLC[1][2] = {
		[01] = {internalId = 0},
		[02] = {internalId = 0},
		[03] = {internalId = 0},
		[04] = {internalId = 0},
		[05] = {internalId = 0},
		[06] = {internalId = 0},
		[07] = {internalId = 0},
		[08] = {internalId = 0},
		[09] = {internalId = 0},
		[10] = {internalId = 0},
		[11] = {internalId = 0},
		[12] = {internalId = 0},
		[13] = {internalId = 0},
		[14] = {internalId = 0},
		[15] = {internalId = 0},
		[16] = {internalId = 0},
		[17] = {internalId = 0},
	}
	TQG.ObjectiveLevelDLC[1][3] = {
		[01] = {internalId = 0},
		[02] = {internalId = 0},
		[03] = {internalId = 0},
		[04] = {internalId = 0},
		[05] = {internalId = 0},
		[06] = {internalId = 0},
		[07] = {internalId = 0},
		[08] = {internalId = 0},
		[09] = {internalId = 0},
		[10] = {internalId = 0},
		[11] = {internalId = 0},
		[12] = {internalId = 0},
		[13] = {internalId = 0},
		[14] = {internalId = 0},
		[15] = {internalId = 0},
		[16] = {internalId = 0},
		[17] = {internalId = 0},
	}
	TQG.ObjectiveLevelDLC[1][4] = {
		[01] = {internalId = 0},
		[02] = {internalId = 0},
		[03] = {internalId = 0},
		[04] = {internalId = 0},
		[05] = {internalId = 0},
		[06] = {internalId = 0},
		[07] = {internalId = 0},
		[08] = {internalId = 0},
		[09] = {internalId = 0},
		[10] = {internalId = 0},
		[11] = {internalId = 0},
		[12] = {internalId = 5664, overrideDetails = true, overrideZone = GetString(TQG_EPILOGUE)},
	}
TQG.ObjectiveLevelDLC[2] = {}
	TQG.ObjectiveLevelDLC[2][1] = {
		[00] = {prologueQIds = 1, internalId = 5935, overrideDetails = true, overrideZone = GetString(TQG_PROLOGUE), mapIndex = 4},
		[01] = {internalId = 0},
		[02] = {internalId = 0},
		[03] = {internalId = 0},
		[04] = {internalId = 0},
		[05] = {internalId = 0},
		[06] = {internalId = 0},
		[07] = {internalId = 0},
		[08] = {internalId = 0},
		[09] = {internalId = 0},
		[10] = {internalId = 0},
		[11] = {internalId = 0},
		[12] = {internalId = 0},
		[13] = {internalId = 0},
		[14] = {internalId = 0},
		[15] = {internalId = 0},
		[16] = {internalId = 0},
		[17] = {internalId = 0},
	}
	TQG.ObjectiveLevelDLC[2][2] = {
		[01] = {internalId = 5887, overrideDetails = true},
		[02] = {internalId = 5919, overrideDetails = true},
		[03] = {internalId = 5933, overrideDetails = true},
		[04] = {internalId = 5948, overrideDetails = true},
	}
	TQG.ObjectiveLevelDLC[2][3] = {
		[00] = {prologueQIds = 1, internalId = 6023, overrideDetails = true, overrideZone = GetString(TQG_PROLOGUE), mapIndex = QuestIdToMapIndex[6023][playerAlliance]},
		[01] = {internalId = 0},
		[02] = {internalId = 0},
		[03] = {internalId = 0},
		[04] = {internalId = 0},
		[05] = {internalId = 0},
		[06] = {internalId = 0},
		[07] = {internalId = 0},
		[08] = {internalId = 0},
		[09] = {internalId = 0},
		[10] = {internalId = 0},
		[11] = {internalId = 0},
		[12] = {internalId = 0},
		[13] = {internalId = 0},
		[14] = {internalId = 0},
		[15] = {internalId = 0},
		[16] = {internalId = 0},
		[17] = {internalId = 0},
	}
	TQG.ObjectiveLevelDLC[2][4] = {
		[00] = {prologueQIds = 1, internalId = 6097, overrideDetails = true, overrideZone = GetString(TQG_PROLOGUE), mapIndex = QuestIdToMapIndex[6097][playerAlliance]},
		[01] = {internalId = 0},
		[02] = {internalId = 0},
		[03] = {internalId = 0},
		[04] = {internalId = 0},
		[05] = {internalId = 0},
		[06] = {internalId = 0},
		[07] = {internalId = 0},
		[08] = {internalId = 0},
		[09] = {internalId = 0},
		[10] = {internalId = 0},
		[11] = {internalId = 0},
		[12] = {internalId = 0},
		[13] = {internalId = 0},
		[14] = {internalId = 0},
		[15] = {internalId = 0},
		[16] = {internalId = 0},
		[17] = {internalId = 0},
	}
	TQG.ObjectiveLevelDLC[2][5] = {
		[01] = {internalId = 6096, overrideDetails = true, overrideZone = GetString(TQG_PREREQ)},
		[02] = {internalId = 6172, overrideDetails = true},
		[03] = {internalId = 6181, overrideDetails = true},
		[04] = {internalId = 6185, overrideDetails = true},
		[05] = {internalId = 6197, overrideDetails = true},
		[06] = {internalId = 6194, overrideDetails = true},
		[07] = {internalId = 6190, overrideDetails = true},
		[08] = {internalId = 6198, overrideDetails = true},
		[09] = {internalId = 6195, overrideDetails = true},
		[10] = {internalId = 6196, overrideDetails = true},
		[11] = {internalId = 6199, overrideDetails = true},
	}
TQG.ObjectiveLevelDLC[3] = {}
	TQG.ObjectiveLevelDLC[3][1] = {
		[00] = {prologueQIds = 2, internalId = 6226, overrideDetails = true, overrideZone = GetString(TQG_PROLOGUE), mapIndex = QuestIdToMapIndex[6226][playerAlliance]},
		[01] = {prologueQIds = 2, internalId = 6242, overrideDetails = true, overrideZone = GetString(TQG_PROLOGUE), mapIndex = 9},
		[02] = {internalId = 0},
		[03] = {internalId = 0},
		[04] = {internalId = 0},
		[05] = {internalId = 0},
		[06] = {internalId = 0},
		[07] = {internalId = 0},
		[08] = {internalId = 0},
		[09] = {internalId = 0},
		[10] = {internalId = 0},
		[11] = {internalId = 0},
		[12] = {internalId = 0},
		[13] = {internalId = 0},
		[14] = {internalId = 0},
		[15] = {internalId = 0},
		[16] = {internalId = 0},
		[17] = {internalId = 0},
	}
TQG.ObjectiveLevelDLC[4] = {}
	TQG.ObjectiveLevelDLC[4][1] = {
		[01] = {internalId = 4432, overrideDetails = true},
		[02] = {internalId = 6249, overrideDetails = true},
	}
	TQG.ObjectiveLevelDLC[4][2] = {
		[01] = {internalId = 4432, overrideDetails = true},
		[02] = {internalId = 6251, overrideDetails = true},
	}
	TQG.ObjectiveLevelDLC[4][3] = {
		[00] = {prologueQIds = 2, internalId = 6299, overrideDetails = true, overrideZone = GetString(TQG_PROLOGUE), mapIndex = QuestIdToMapIndex[6299][playerAlliance]},
		[01] = {prologueQIds = 2, internalId = 6306, overrideDetails = true, overrideZone = GetString(TQG_PROLOGUE), mapIndex = 7},
		[02] = {internalId = 0},
		[03] = {internalId = 0},
		[04] = {internalId = 0},
		[05] = {internalId = 0},
		[06] = {internalId = 0},
		[07] = {internalId = 0},
		[08] = {internalId = 0},
		[09] = {internalId = 0},
		[10] = {internalId = 0},
		[11] = {internalId = 0},
		[12] = {internalId = 0},
		[13] = {internalId = 0},
		[14] = {internalId = 0},
		[15] = {internalId = 0},
		[16] = {internalId = 0},
		[17] = {internalId = 0},
	}
	TQG.ObjectiveLevelDLC[4][4] = {
		[01] = {internalId = 6349, overrideDetails = true},
	}
	TQG.ObjectiveLevelDLC[4][5] = {
		[01] = {internalId = 4733, overrideDetails = true},
		[02] = {internalId = 6351, overrideDetails = true},
	}
	TQG.ObjectiveLevelDLC[4][6] = {
		[00] = {prologueQIds = 2, internalId = 6395, overrideDetails = true, overrideZone = GetString(TQG_PROLOGUE), mapIndex = QuestIdToMapIndex[6395][playerAlliance]},
		[01] = {prologueQIds = 2, internalId = 6398, overrideDetails = true, overrideZone = GetString(TQG_PROLOGUE), mapIndex = QuestIdToMapIndex[6398][playerAlliance]},
		[02] = {internalId = 0},
		[03] = {internalId = 0},
		[04] = {internalId = 0},
		[05] = {internalId = 0},
		[06] = {internalId = 0},
		[07] = {internalId = 0},
		[08] = {internalId = 0},
		[09] = {internalId = 0},
		[10] = {internalId = 0},
		[11] = {internalId = 0},
		[12] = {internalId = 0},
		[13] = {internalId = 0},
		[14] = {internalId = 0},
		[15] = {internalId = 0},
		[16] = {internalId = 0},
		[17] = {internalId = 0},
	}
	TQG.ObjectiveLevelDLC[4][7] = {
		[01] = {internalId = 6393, overrideDetails = true, overrideZone = GetString(TQG_EPILOGUE)},
		[02] = {internalId = 6397, overrideDetails = true, overrideZone = GetString(TQG_EPILOGUE)},
		[03] = {internalId = 6402, overrideDetails = true, overrideZone = GetString(TQG_EPILOGUE)},
	}
TQG.ObjectiveLevelDLC[5] = {}
	TQG.ObjectiveLevelDLC[5][1] = {
		[01] = {internalId = 6416, overrideDetails = true},
	}
	TQG.ObjectiveLevelDLC[5][2] = {
		[01] = {internalId = 6414, overrideDetails = true},
	}
	TQG.ObjectiveLevelDLC[5][3] = {
		[00] = {prologueQIds = 2, internalId = 6454, overrideDetails = true, overrideZone = GetString(TQG_PROLOGUE)},
		[01] = {prologueQIds = 2, internalId = 6463, overrideDetails = true, overrideZone = GetString(TQG_PROLOGUE)},
		[02] = {internalId = 0},
		[03] = {internalId = 0},
		[04] = {internalId = 0},
		[05] = {internalId = 0},
		[06] = {internalId = 0},
		[07] = {internalId = 0},
		[08] = {internalId = 0},
		[09] = {internalId = 0},
		[10] = {internalId = 0},
		[11] = {internalId = 0},
		[12] = {internalId = 0},
		[13] = {internalId = 0},
		[14] = {internalId = 0},
		[15] = {internalId = 0},
		[16] = {internalId = 0},
		[17] = {internalId = 0},
	}
	TQG.ObjectiveLevelDLC[5][4] = {
		[01] = {internalId = 6507, overrideDetails = true},
	}
	TQG.ObjectiveLevelDLC[5][5] = {
		[01] = {internalId = 6505, overrideDetails = true},
	}
	TQG.ObjectiveLevelDLC[5][6] = {
		[00] = {prologueQIds = 2, internalId = 6549, overrideDetails = true, overrideZone = GetString(TQG_PROLOGUE)},
		[01] = {prologueQIds = 2, internalId = 6555, overrideDetails = true, overrideZone = GetString(TQG_PROLOGUE)},
		[02] = {internalId = 0},
		[03] = {internalId = 0},
		[04] = {internalId = 0},
		[05] = {internalId = 0},
		[06] = {internalId = 0},
		[07] = {internalId = 0},
		[08] = {internalId = 0},
		[09] = {internalId = 0},
		[10] = {internalId = 0},
		[11] = {internalId = 0},
		[12] = {internalId = 0},
		[13] = {internalId = 0},
		[14] = {internalId = 0},
		[15] = {internalId = 0},
		[16] = {internalId = 0},
		[17] = {internalId = 0},
	}
	TQG.ObjectiveLevelDLC[5][7] = {
		[01] = {internalId = 6552, overrideDetails = true, overrideZone = GetString(TQG_EPILOGUE)},
		[02] = {internalId = 6560, overrideDetails = true, overrideZone = GetString(TQG_EPILOGUE)},
		[03] = {internalId = 6570, overrideDetails = true, overrideZone = GetString(TQG_EPILOGUE)},
	}
TQG.ObjectiveLevelDLC[6] = {}
	TQG.ObjectiveLevelDLC[6][1] = {
		[01] = {internalId = 6576, overrideDetails = true},
	}
	TQG.ObjectiveLevelDLC[6][2] = {
		[01] = {internalId = 6578, overrideDetails = true},
	}

	TQG.ObjectiveLevelDLC[6][3] = {
		[00] = {prologueQIds= 2, internalId = 6612, overrideDetails = true, overrideZone = GetString(TQG_PROLOGUE)},
		[01] = {prologueQIds= 2, internalId = 6627, overrideDetails = true, overrideZone = GetString(TQG_PROLOGUE)},
		[02] = {internalId = 0},
		[03] = {internalId = 0},
		[04] = {internalId = 0},
		[05] = {internalId = 0},
		[06] = {internalId = 0},
		[07] = {internalId = 0},
		[08] = {internalId = 0},
		[09] = {internalId = 0},
		[10] = {internalId = 0},
		[11] = {internalId = 0},
		[12] = {internalId = 0},
		[13] = {internalId = 0},
		[14] = {internalId = 0},
		[15] = {internalId = 0},
		[16] = {internalId = 0},
		[17] = {internalId = 0},
	}

	TQG.ObjectiveLevelDLC[6][4] = {
		[01] = {internalId = 6683, overrideDetails = true},
	}
	TQG.ObjectiveLevelDLC[6][5] = {
		[01] = {internalId = 6685, overrideDetails = true},
	}

	TQG.ObjectiveLevelDLC[6][6] = {
		[00] = {prologueQIds= 2, internalId = 6701, overrideDetails = true, overrideZone = GetString(TQG_PROLOGUE)},
		[01] = {prologueQIds= 2, internalId = 6703, overrideDetails = true, overrideZone = GetString(TQG_PROLOGUE)},
		[02] = {internalId = 0},
		[03] = {internalId = 0},
		[04] = {internalId = 0},
		[05] = {internalId = 0},
		[06] = {internalId = 0},
		[07] = {internalId = 0},
		[08] = {internalId = 0},
		[09] = {internalId = 0},
		[10] = {internalId = 0},
		[11] = {internalId = 0},
		[12] = {internalId = 0},
		[13] = {internalId = 0},
		[14] = {internalId = 0},
		[15] = {internalId = 0},
		[16] = {internalId = 0},
		[17] = {internalId = 0},
	}

	TQG.ObjectiveLevelDLC[6][7] = {
		[01] = {internalId = 6696, overrideDetails = true, overrideZone = GetString(TQG_EPILOGUE)},
		[02] = {internalId = 6697, overrideDetails = true, overrideZone = GetString(TQG_EPILOGUE)},
		[03] = {internalId = 6693, overrideDetails = true, overrideZone = GetString(TQG_EPILOGUE)},
	}

TQG.ObjectiveLevelDLC[7] = {}
	TQG.ObjectiveLevelDLC[7][1] = {
		[01] = {internalId = 6740, overrideDetails = true},
	}
	TQG.ObjectiveLevelDLC[7][2] = {
		[01] = {internalId = 6742, overrideDetails = true},
	}

	TQG.ObjectiveLevelDLC[7][3] = {
		[00] = {prologueQIds= 2, internalId = 6751, overrideDetails = true, overrideZone = GetString(TQG_PROLOGUE)},
		[01] = {prologueQIds= 2, internalId = 6761, overrideDetails = true, overrideZone = GetString(TQG_PROLOGUE)},
		[02] = {internalId = 0},
		[03] = {internalId = 0},
		[04] = {internalId = 0},
		[05] = {internalId = 0},
		[06] = {internalId = 0},
		[07] = {internalId = 0},
		[08] = {internalId = 0},
		[09] = {internalId = 0},
		[10] = {internalId = 0},
		[11] = {internalId = 0},
		[12] = {internalId = 0},
		[13] = {internalId = 0},
		[14] = {internalId = 0},
		[15] = {internalId = 0},
		[16] = {internalId = 0},
		[17] = {internalId = 0},
	}

	TQG.ObjectiveLevelDLC[7][4] = {
		[01] = {internalId = 6835, overrideDetails = true},
	}
	TQG.ObjectiveLevelDLC[7][5] = {
		[01] = {internalId = 6837, overrideDetails = true},
	}

	TQG.ObjectiveLevelDLC[7][6] = {
		[00] = {prologueQIds= 1, internalId = 6843, overrideDetails = true, overrideZone = GetString(TQG_PROLOGUE)},
		[01] = {internalId = 0},
		[02] = {internalId = 0},
		[03] = {internalId = 0},
		[04] = {internalId = 6859, overrideDetails = true, overrideZone = GetZoneNameById(1383)},
		[05] = {internalId = 0},
		[06] = {internalId = 0},
		[07] = {internalId = 0},
		[08] = {internalId = 0},
		[09] = {internalId = 0},
		[10] = {internalId = 0},
		[11] = {internalId = 0},
		[12] = {internalId = 0},
		[13] = {internalId = 0},
		[14] = {internalId = 0},
		[15] = {internalId = 0},
		[16] = {internalId = 0},
		[17] = {internalId = 0},
	}

	TQG.ObjectiveLevelDLC[7][7] = {
		[01] = {internalId = 6847, overrideDetails = true, overrideZone = GetString(TQG_EPILOGUE)},
		[02] = {internalId = 6848, overrideDetails = true, overrideZone = GetString(TQG_EPILOGUE)},
		[03] = {internalId = 6894, overrideDetails = true, overrideZone = GetString(TQG_EPILOGUE)},
	}

TQG.ObjectiveLevelDLC[8] = {}
	TQG.ObjectiveLevelDLC[8][1] = {
		[01] = {internalId = 6896, overrideDetails = true},
	}
	TQG.ObjectiveLevelDLC[8][2] = {
		[01] = {internalId = 7027, overrideDetails = true},
	}

	TQG.ObjectiveLevelDLC[8][3] = {
		[00] = {prologueQIds= 1, internalId = 6967, overrideDetails = true, overrideZone = GetString(TQG_PROLOGUE)},
		[01] = {internalId = 0},
		[02] = {internalId = 0},
		[03] = {internalId = 0},
		[04] = {internalId = 0},
		[05] = {internalId = 0},
		[06] = {internalId = 0},
		[07] = {internalId = 0},
		[08] = {internalId = 0},
		[09] = {internalId = 0},
		[10] = {internalId = 0},
		[11] = {internalId = 0},
		[12] = {internalId = 0},
		[13] = {internalId = 0},
		[14] = {internalId = 0},
		[15] = {internalId = 0},
		[16] = {internalId = 0},
		[17] = {internalId = 0},
	}

	TQG.ObjectiveLevelDLC[8][4] = {
		[01] = {internalId = 7061, overrideDetails = true},
	}

TQG.ObjectiveLevelDLC[9] = {}
	TQG.ObjectiveLevelDLC[9][1] = {
		[01] = {internalId = 7155, overrideDetails = true},
	}
	TQG.ObjectiveLevelDLC[9][2] = {
		[01] = {internalId = 7105, overrideDetails = true},
	}

if GetAPIVersion()>=101042 then
	--
	TQG.ObjectiveLevelDLC[9][3] = {
		[00] = {prologueQIds= 1, internalId = 7079, overrideDetails = true, overrideZone = GetString(TQG_PROLOGUE)},
		[01] = {internalId = 0},
		[02] = {internalId = 0},
		[03] = {internalId = 0},
		[04] = {internalId = 0},
		[05] = {internalId = 0},
		[06] = {internalId = 0},
		[07] = {internalId = 0},
		[08] = {internalId = 0},
		[09] = {internalId = 0},
		[10] = {internalId = 0},
		[11] = {internalId = 0},
		[12] = {internalId = 0},
		[13] = {internalId = 0},
		[14] = {internalId = 0},
		[15] = {internalId = 0},
		[16] = {internalId = 0},
		[17] = {internalId = 0},
	}
end

TQG.TopLevelGroup = {
	[01] = strfmt("1: %s", GetString(TQG_DOMINION)),
	[02] = strfmt("1: %s", GetString(TQG_COVENANT)),
	[03] = strfmt("1: %s", GetString(TQG_PACT)),
	[04] = strfmt("2: %s", GetString(TQG_COLDHARBOUR)),
	[05] = strfmt("3: %s", GetString(TQG_CRAGLORN)),
	[06] = strfmt("4: %s", GetString(TQG_GUILDS_AND_GLORY)),
	[07] = strfmt("5: %s", GetString(TQG_DAEDRIC_WAR)),
	[08] = strfmt("6: %s", GetString(TQG_MURKMIRE)),
	[09] = strfmt("7: %s", GetString(TQG_CHAPTER_ELSWEYR)),
	[10] = strfmt("8: %s", GetString(TQG_CHAPTER_SKYRIM)),
	[11] = strfmt("9: %s", GetString(TQG_CHAPTER_BLACKWOOD)),
	[12] = strfmt("10: %s", GetString(TQG_CHAPTER_HIGH_ISLE)),
	[13] = strfmt("11: %s", GetString(TQG_CHAPTER_SHADOW_MORROWIND)),
}
TQG.TopLevelGroup[#TQG.TopLevelGroup + 1] = strfmt("X: %s", GetString(TQG_DUNGEON_DLC_OLD))

if GetAPIVersion()>101039 then
	--
end

local function GetDungeonNameWithoutVersion(zoneId)
	local fullDungeonName = GetZoneNameById(zoneId)
	local dungeonName = fullDungeonName
	local formattedDungeonName = ""

	for word in fullDungeonName:gmatch("%S+") do
		if word == "I" or word == "II" then
			dungeonName = dungeonName:gsub(word, "")
			dungeonName = dungeonName:sub(1, #dungeonName-1)
		end
	end

	formattedDungeonName = zo_strformat("<<Z:1>>: <<2>>", dungeonName, GetZoneDescriptionById(zoneId))

	return formattedDungeonName
end

TQG.ZoneLevelGroup = {
	--Aldmeri Dominion
	[1] = {
		[1] = {name = 1.19, id = GetDungeonNameWithoutVersion(380), zoneName = GetZoneNameById(381), type = "Dungeon"},
		[2] = {name = 1.29, id = GetDungeonNameWithoutVersion(126), zoneName = GetZoneNameById(383), type = "Dungeon"},
		[3] = {name = 1.39, id = GetDungeonNameWithoutVersion(176), zoneName = GetZoneNameById(108), type = "Dungeon"},
		[4] = {name = 1.49, id = GetDungeonNameWithoutVersion(131), zoneName = GetZoneNameById(58), type = "Dungeon"},
		[5] = {name = 1.59, id = GetDungeonNameWithoutVersion(31), zoneName = GetZoneNameById(382), type = "Dungeon"},
	},
	--Daggerfall Covenant
	[2] = {
		[1] = {name = 1.19, id = GetDungeonNameWithoutVersion(144), zoneName = GetZoneNameById(3), type = "Dungeon"},
		[2] = {name = 1.29, id = GetDungeonNameWithoutVersion(146), zoneName = GetZoneNameById(19), type = "Dungeon"},
		[3] = {name = 1.39, id = GetDungeonNameWithoutVersion(130), zoneName = GetZoneNameById(20), type = "Dungeon"},
		[4] = {name = 1.49, id = GetDungeonNameWithoutVersion(22), zoneName = GetZoneNameById(104), type = "Dungeon"},
		[5] = {name = 1.59, id = GetDungeonNameWithoutVersion(38), zoneName = GetZoneNameById(92), type = "Dungeon"},
	},
	--Ebonheart Pact
	[3] = {
		[1] = {name = 1.19, id = GetDungeonNameWithoutVersion(283), zoneName = GetZoneNameById(41), type = "Dungeon"},
		[2] = {name = 1.29, id = GetDungeonNameWithoutVersion(63), zoneName = GetZoneNameById(57), type = "Dungeon"},
		[3] = {name = 1.39, id = GetDungeonNameWithoutVersion(148), zoneName = GetZoneNameById(117), type = "Dungeon"},
		[4] = {name = 1.49, id = GetDungeonNameWithoutVersion(449), zoneName = GetZoneNameById(101), type = "Dungeon"},
		[5] = {name = 1.59, id = GetDungeonNameWithoutVersion(64), zoneName = GetZoneNameById(103), type = "Dungeon"},
	},
	--Coldharbour
	[4] = {
		[1] = {name = 2.10, id = GetDungeonNameWithoutVersion(11), zoneName = GetZoneNameById(347), type = "Dungeon"},
	},
	--Craglorn
	[5] = {
		[1] = {name = 3.10, id = GetDungeonNameWithoutVersion(638), zoneName = GetZoneNameById(888), type = "Trial"},
		[2] = {name = 3.10, id = GetDungeonNameWithoutVersion(636), zoneName = GetZoneNameById(888), type = "Trial"},
		[3] = {name = 3.20, id = GetDungeonNameWithoutVersion(639), zoneName = GetZoneNameById(888), type = "Trial"},
	},
	--Guilds and Glory
	[6] = {
		[1] = {name = 4.09, id = GetDungeonNameWithoutVersion(678), zoneName = GetZoneNameById(584), type = "Dungeon"},
		[2] = {name = 4.09, id = GetDungeonNameWithoutVersion(688), zoneName = GetZoneNameById(584), type = "Dungeon"},
		[3] = {name = 4.19, id = GetDungeonNameWithoutVersion(677), zoneName = GetZoneNameById(684), type = "Maelstrom Arena"},
		[4] = {name = 4.29, id = GetDungeonNameWithoutVersion(725), zoneName = GetZoneNameById(816), type = "Trial"},
	},
	--Daedric War
	[7] = {
		[1] = {name = 5.09, id = GetDungeonNameWithoutVersion(975), zoneName = GetZoneNameById(849), type = "Trial"},
		[2] = {name = 5.19, id = GetDungeonNameWithoutVersion(1000), zoneName = GetZoneNameById(980), type = "Trial"},
		[3] = {name = 5.29, id = GetDungeonNameWithoutVersion(1051), zoneName = GetZoneNameById(1011), type = "Trial"},
	},
	--Murkmire: Interlude
	[8] = {
		[1] = {name = 6.09, id = GetDungeonNameWithoutVersion(1082), zoneName = GetZoneNameById(726), type = "Arena"},
	},
	--Season of the Dragon
	[9] = {
		[1] = {name = 7.19, id = GetDungeonNameWithoutVersion(1121), zoneName = GetZoneNameById(1086), type = "Trial"},
	},
	--Dark Heart of Skyrim
	[10] = {
		[1] = {name = 8.19, id = GetDungeonNameWithoutVersion(1196), zoneName = GetZoneNameById(1160), type = "Trial"},
		[2] = {name = 8.39, id = GetDungeonNameWithoutVersion(1227), zoneName = GetZoneNameById(1207), type = "Arena"},
	},
	--Gates of Oblivion
	[11] = {
		[1] = {name = 9.19, id = GetDungeonNameWithoutVersion(1263), zoneName = GetZoneNameById(1261), type = "Trial"},
	},
	--Legacy of the Bretons
	[12] = {
		[1] = {name = 10.19, id = GetDungeonNameWithoutVersion(1344), zoneName = GetZoneNameById(1344), type = "Trial"},
	},
	--Shadow Over Morrowind
	[13] = {
		[1] = {name = 11.19, id = GetDungeonNameWithoutVersion(1427), zoneName = GetZoneNameById(1427), type = "Trial"},
	},
}

--Independent DLC Dungeons
TQG.ZoneLevelGroup[#TQG.ZoneLevelGroup + 1] = {
		[1] = {name = 4.39, id = GetDungeonNameWithoutVersion(843), zoneName = GetZoneNameById(843), type = "Dungeon"},
		[2] = {name = 4.39, id = GetDungeonNameWithoutVersion(848), zoneName = GetZoneNameById(848), type = "Dungeon"},
		[3] = {name = 5.09, id = GetDungeonNameWithoutVersion(974), zoneName = GetZoneNameById(974), type = "Dungeon"},
		[4] = {name = 5.09, id = GetDungeonNameWithoutVersion(973), zoneName = GetZoneNameById(973), type = "Dungeon"},
		[5] = {name = 5.19, id = GetDungeonNameWithoutVersion(1010), zoneName = GetZoneNameById(1010), type = "Dungeon"},
		[6] = {name = 5.19, id = GetDungeonNameWithoutVersion(1009), zoneName = GetZoneNameById(1009), type = "Dungeon"},
		[7] = {name = 5.29, id = GetDungeonNameWithoutVersion(1052), zoneName = GetZoneNameById(1052), type = "Dungeon"},
		[8] = {name = 5.29, id = GetDungeonNameWithoutVersion(1055), zoneName = GetZoneNameById(1055), type = "Dungeon"},
}

if GetAPIVersion()>101041 then
	--
end

TQG.ObjectiveLevelGroup = {}
TQG.ObjectiveLevelGroup[1] = {}
	TQG.ObjectiveLevelGroup[1][1] = {
		[01] = {internalId = 4107, mapIndex = 15},
		[02] = {internalId = 4597, mapIndex = 15},
	}
	TQG.ObjectiveLevelGroup[1][2] = {
		[01] = {internalId = 4336, mapIndex = 7},
		[02] = {internalId = 4675, mapIndex = 7},
	}
	TQG.ObjectiveLevelGroup[1][3] = {
		[01] = {internalId = 4778, mapIndex = 16},
		[02] = {internalId = 5120, mapIndex = 16},
	}
	TQG.ObjectiveLevelGroup[1][4] = {
		[01] = {internalId = 4538, mapIndex = 8},
	}
	TQG.ObjectiveLevelGroup[1][5] = {
		[01] = {internalId = 4733, mapIndex = 17},
	}

TQG.ObjectiveLevelGroup[2] = {}
	TQG.ObjectiveLevelGroup[2][1] = {
		[01] = {internalId = 4054, mapIndex = 2},
		[02] = {internalId = 4555, mapIndex = 2},
	}
	TQG.ObjectiveLevelGroup[2][2] = {
		[01] = {internalId = 4246, mapIndex = 4},
		[02] = {internalId = 4813, mapIndex = 4},
	}
	TQG.ObjectiveLevelGroup[2][3] = {
		[01] = {internalId = 4379, mapIndex = 3},
		[02] = {internalId = 5113, mapIndex = 3},
	}
	TQG.ObjectiveLevelGroup[2][4] = {
		[01] = {internalId = 4432, mapIndex = 5},
	}
	TQG.ObjectiveLevelGroup[2][5] = {
		[01] = {internalId = 4589, mapIndex = 6},
	}

TQG.ObjectiveLevelGroup[3] = {}
	TQG.ObjectiveLevelGroup[3][1] = {
		[01] = {internalId = 3993, mapIndex = 11},
		[02] = {internalId = 4303, mapIndex = 11},
	}
	TQG.ObjectiveLevelGroup[3][2] = {
		[01] = {internalId = 4145, mapIndex = 10},
		[02] = {internalId = 4641, mapIndex = 10},
	}
	TQG.ObjectiveLevelGroup[3][3] = {
		[01] = {internalId = 4202, mapIndex = 9},
	}
	TQG.ObjectiveLevelGroup[3][4] = {
		[01] = {internalId = 4346, mapIndex = 13},
	}
	TQG.ObjectiveLevelGroup[3][5] = {
		[01] = {internalId = 4469, mapIndex = 12},
	}

TQG.ObjectiveLevelGroup[4] = {}
	TQG.ObjectiveLevelGroup[4][1] = {
		[01] = {internalId = 4822, mapIndex = 23},
	}

TQG.ObjectiveLevelGroup[5] = {}
	TQG.ObjectiveLevelGroup[5][1] = {
		[01] = {internalId = 5102, mapIndex = 25},
	}
	TQG.ObjectiveLevelGroup[5][2] = {
		[01] = {internalId = 5087, mapIndex = 25},
	}
	TQG.ObjectiveLevelGroup[5][3] = {
		[01] = {internalId = 5171, mapIndex = 25},
	}

TQG.ObjectiveLevelGroup[6] = {}
	TQG.ObjectiveLevelGroup[6][1] = {
		[01] = {internalId = 5136, mapIndex = 14},
	}
	TQG.ObjectiveLevelGroup[6][2] = {
		[01] = {internalId = 5342, mapIndex = 14},
	}
	--Wrothgar – Maelstrom Arena
	TQG.ObjectiveLevelGroup[6][3] = {
		[01] = {internalId = 5448, mapIndex = 27},
	}
	TQG.ObjectiveLevelGroup[6][4] = {
		[01] = {internalId = 5554, mapIndex = 28},
		[02] = {internalId = 5352, mapIndex = 17},
	}

TQG.ObjectiveLevelGroup[7] = {}
	TQG.ObjectiveLevelGroup[7][1] = {
		[01] = {internalId = 6000, mapIndex = 30},
		[02] = {internalId = 5894, mapIndex = 30},
	}
	TQG.ObjectiveLevelGroup[7][2] = {
		[01] = {internalId = 6090, mapIndex = 31},
	}
	TQG.ObjectiveLevelGroup[7][3] = {
		[01] = {internalId = 6193, mapIndex = 32},
		[02] = {internalId = 6192, mapIndex = 32},
	}

TQG.ObjectiveLevelGroup[8] = {}
	TQG.ObjectiveLevelGroup[8][1] = {
		[01] = {internalId = 6269, mapIndex = 34},
	}

TQG.ObjectiveLevelGroup[9] = {}
	TQG.ObjectiveLevelGroup[9][1] = {
		[01] = {internalId = 6354, mapIndex = 36},
		[02] = {internalId = 6353, mapIndex = 36},
	}

TQG.ObjectiveLevelGroup[10] = {}
	TQG.ObjectiveLevelGroup[10][1] = {
		[01] = {internalId = 6504, mapIndex = 38},
		[02] = {internalId = 6503, mapIndex = 38},
	}
	TQG.ObjectiveLevelGroup[10][2] = {
		[01] = {internalId = 6597, mapIndex = 42},
		[02] = {internalId = 6610, mapIndex = 42},
	}

TQG.ObjectiveLevelGroup[11] = {}
	TQG.ObjectiveLevelGroup[11][1] = {
		[01] = {internalId = 6655, mapIndex = 43},
		[02] = {internalId = 6654, mapIndex = 43},
	}

TQG.ObjectiveLevelGroup[12] = {}
	TQG.ObjectiveLevelGroup[12][1] = {
		[01] = {internalId = 6784, mapIndex = 46},
		[02] = {internalId = 6783, mapIndex = 46},
	}

TQG.ObjectiveLevelGroup[13] = {}
	TQG.ObjectiveLevelGroup[13][1] = {
		[01] = {internalId = 7032, mapIndex = 49},
		[02] = {internalId = 7031, mapIndex = 49},
	}

TQG.ObjectiveLevelGroup[#TQG.ObjectiveLevelGroup + 1] = {
	[1] = {
		[01] = {internalId = 5403, mapIndex = 9},
	},
	[2] = {
		[01] = {internalId = 5702, mapIndex = 9},
	},
	[3] = {
		[01] = {internalId = 5891, mapIndex = 25},
	},
	[4] = {
		[01] = {internalId = 5889, mapIndex = 25},
	},
	[5] = {
		[01] = {internalId = 6065, mapIndex = 4},
	},
	[6] = {
		[01] = {internalId = 6064, mapIndex = 6},
	},
	[7] = {
		[01] = {internalId = 6186, mapIndex = 17},
	},
	[8] = {
		[01] = {internalId = 6188, mapIndex = 16},
	},
}