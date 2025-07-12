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
    TQG_OVERVIEW_DESC_CLASSIC = "The Planemeld Arc: this is the original ESO story in the Aurbis, and the tale will interweave amongst Main Story, Alliance, and Guild Storylines as you progress.\n\nThe Alliance Stories (these happen in parallel):\nStart with the beginner island(s), then Auridon/Glenumbra/Stonefalls, etc. You should not feel like you have to complete every Alliance's story before reaching Coldharbour, however.\n\nThe original Alliance Story pathway was;\n - Player's Alliance\n - Coldharbour\n - Cadwell's Silver (next Alliance in clockwise order)\n - Cadwell's Gold (last Alliance in clockwise order)",
    TQG_OVERVIEW_DESC_DLC = "The DLC section covers off every major storyline since the introduction of the DLC dungeons, zones, and Chapters.\n\nThe order presented defaults to the order of release...\n\nMajor Events include:\n - The Sublime Plot & Reforging Orsinium\n - Thieves Guild & Dark Brotherhood\n - Daedric War\n - A Lost Legacy\n - Chapter Stories\n - Ongoing Seasonal Content",
    TQG_OVERVIEW_DESC_GROUP = strfmt(overviewGroupTabDescFmt,
                                     "The Group section includes the majority of instanced Group Content to-date.",
                                     "Dungeons: ", overviewGroupTabDungIcon,
                                     "Trials: ", overviewGroupTabTrialIcon,
                                     "Arenas: ", overviewGroupTabArenaIconOne,
                                     overviewGroupTabArenaIconTwo,
                                     "There are normal, veteran, and occasionally hard-mode versions of the content, but with the exception of Maelstrom Arena (which only requires the normal-mode quest), the Guide does not care on which difficulty you complete the quest.",
                                     "The quests are still tied to the content with which they released. E.G., Maw of Lorkhaj is in Reaper's March, but released with Thieves Guild, so it will be listed under the latter."),

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
