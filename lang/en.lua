TheQuestingGuide = {name = "TheQuestingGuide"}

local TQG = TheQuestingGuide
local strfmt, zStrFmt = string.format, zo_strformat

local stringsEN = {
    SI_BINDING_NAME_TQG_OPEN_KEY = "Toggle Questing Guide",

    TQG_MENU_TITLE = "The Questing Guide",

    TQG_OVERVIEW_TAB = GetString(SI_CUSTOMER_SERVICE_OVERVIEW), -- "Overview"
    TQG_TAB_CLASSIC = GetString(SI_HOUSECATEGORYTYPE2), -- "Classic"
    TQG_TAB_DLC = GetString(SI_COLLECTIBLECATEGORYTYPE1), -- "DLC"
    TQG_TAB_GROUP = GetString(SI_INSTANCETYPE2), -- "Group"

    TQG_PROLOGUE = "Prologue",
    TQG_EPILOGUE = "Epilogue",

    TQG_ARC_PLANEMELD = "The Planemeld",

    TQG_GUILD_INVITATION = "An Invitation",

    TQG_ARC_FIGHTERS_GUILD = "Fighters Guild",
    TQG_ARC_FIGHTERS_DESC = 'The Guild of Fighters was established under the section 4 of the "Guilds Act," and this charter was first confirmed under the Potentate Versidue-Shaie in the 321st year of the Second Era.',

    TQG_ARC_MAGES_GUILD = "Mages Guild",
    TQG_ARC_MAGES_DESC = 'The Guild of Mages was established on Summerset Isle in the year 230 of the Second Era by Vanus Galerion and Rilis XII. It was later confirmed by the "Guilds Act" of Potentate Versidue-Shaie.',

    TQG_GUILDS_AND_GLORY = "Guilds and Glory",
    TQG_DAEDRIC_WAR = "Daedric War",
    TQG_BONUS_BALMORA = "Bonus: Balmora",
    TQG_BONUS_BALMORA_DESC = 'The Morrowind government sanctioned the Morag Tong long ago during the First Era, and to this day they continue to perform tacitly legal assassinations, utilizing a system of contracts known as "honorable writs of execution."',

    TQG_CHAPTER_ELSWEYR = "Season of the Dragon",
    TQG_CHAPTER_SKYRIM = "Dark Heart of Skyrim",
    TQG_CHAPTER_BLACKWOOD = "Gates of Oblivion",
    TQG_CHAPTER_HIGH_ISLE = "Legacy of the Bretons",
    TQG_CHAPTER_SHADOW_MORROWIND = "Shadow Over Morrowind",
    TQG_CHAPTER_RECOLLECTION_ITHELIA = "Recollection of Ithelia",
    TQG_CHAPTER_SEASON_WORM_CULT = "Seasons of the Worm Cult",
    
    TQG_DUNGEON_DLC_OLD = zStrFmt("<<1>> <<2>>", GetString(SI_PLAYER_MENU_MISC), GetString(SI_COLLECTIBLECATEGORYTYPE1)),
}

for id, stringVar in pairs(stringsEN) do
    stringVar = zStrFmt("<<1>>", stringVar)
    ZO_CreateStringId(id, stringVar)
    SafeAddVersion(id, 1)
end
