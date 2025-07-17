TheQuestingGuide = {name = "TheQuestingGuide"}

local TQG = TheQuestingGuide
local strfmt, zStrFmt = string.format, zo_strformat

local overviewGroupTabDescFmt =
    "%s %s|t26:26:%s|t %s|t26:26:%s|t %s|t26:26:%s|t / |t26:26:%s|t\n\n%s\n\n%s"
local overviewGroupTabDungIcon =
    "/esoui/art/icons/poi/poi_groupinstance_complete.dds"
local overviewGroupTabTrialIcon =
    "/esoui/art/icons/poi/poi_raiddungeon_complete.dds"
local overviewGroupTabArenaIconOne =
    "/esoui/art/icons/poi/poi_groupinstance_complete.dds"
local overviewGroupTabArenaIconTwo =
    "/esoui/art/icons/poi/poi_raiddungeon_complete.dds"

local stringsEN = {
    SI_BINDING_NAME_TQG_OPEN_KEY = "Toggle Questing Guide",
    SI_BINDING_NAME_TQG_OPEN_KEY_GAMEPAD = "Toggle Questing Guide: Gamepad",

    TQG_MENU_TITLE = "The Questing Guide",

    TQG_TAB_OVERVIEW = GetString(SI_CUSTOMER_SERVICE_OVERVIEW), -- "Overview"
    TQG_OVERVIEW_DESC_CLASSIC = "The Planemeld Arc: this is the original ESO story in the Aurbis.\n\nThe tale will interweave among Main Story, Alliance, and Guild storylines as you progress.\n\nThe original Alliance Story pathway was:\n - Player's Alliance\n - Coldharbour\n - Cadwell's Silver (next Alliance in clockwise order)\n - Cadwell's Gold (last Alliance in clockwise order)\n\nThe Alliance Stories occur in parallel; intro. islands, then Auridon, Glenumbra, Stonefalls, and so on.",
    TQG_OVERVIEW_DESC_DLC = "The DLC section covers off every major storyline since the introduction of the DLC dungeons, zones, and Chapters. The order presented defaults to the order of release.\n\nMajor Events include:\n - The Sublime Plot & Reforging Orsinium\n - Thieves Guild & Dark Brotherhood\n - Daedric War\n - A Lost Legacy\n - Chapter Stories\n - Ongoing Seasonal Content",
    TQG_OVERVIEW_DESC_GROUP = strfmt(overviewGroupTabDescFmt,
                                     "The Group section includes the majority of instanced Group Content to-date.",
                                     "Dungeons: ", overviewGroupTabDungIcon,
                                     "Trials: ", overviewGroupTabTrialIcon,
                                     "Arenas: ", overviewGroupTabArenaIconOne,
                                     overviewGroupTabArenaIconTwo,
                                     "There are normal, veteran, and occasionally hard-mode versions of the content, but with the exception of Maelstrom Arena (which only requires the normal-mode quest), the Guide does not care on which difficulty you complete the quest.",
                                     "The quests are still tied to the content with which they released. E.G., Maw of Lorkhaj is in Reaper's March, but released with Thieves Guild, so it will be listed under the latter."),
    TQG_OVERVIEW_OBJECTIVE_NOTE_TITLE = GetString(
        SI_GAMEPAD_CONTACTS_NOTES_TITLE), -- "Notes"
    TQG_OVERVIEW_CLASSIC_DESCRIPTION = "You should not feel like you have to complete every Alliance's story before Coldharbour.\n\nCraglorn was a Group zone exclusively for Veteran players, but it was redesigned later for a combination of solo and group play.",
    TQG_OVERVIEW_DLC_DESCRIPTION = "From Vvardenfell to Gold Road, we had the Chapter model which followed a general pattern: Dungeon Pack; Chapter Zone and Trial; Dungeon Pack; Story Zone\n\nWe have now moved to a Seasons model; groupings of content released under a certain theme.",
    TQG_OVERVIEW_GROUP_DESCRIPTION = "Required group size for the content will vary according to the individuals. However, Maelstrom and Vateshran are solo Arenas; you will face what lies within, alone.\n\nAs a general rule; Dungeon quests are not repeatable, while Trial quests are repeatable weekly. You will only need to complete them once to register them.",

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

    TQG_DUNGEON_DLC_OLD = zStrFmt("<<1>> <<2>>", GetString(SI_PLAYER_MENU_MISC),
                                  GetString(SI_COLLECTIBLECATEGORYTYPE1))
}

for id, stringVar in pairs(stringsEN) do
    stringVar = zStrFmt("<<1>>", stringVar)
    ZO_CreateStringId(id, stringVar)
    SafeAddVersion(id, 1)
end
