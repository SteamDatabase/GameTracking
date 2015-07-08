--[[ Camp types and their units ]]

--------------------------------------------------------------------------------
-- Individual camp unit definitions
--------------------------------------------------------------------------------
-- Small camps
local tSMALL_CAMP_UNITS_KOBOLDS = {}
tSMALL_CAMP_UNITS_KOBOLDS[1] = "npc_dota_creature_kobold"
tSMALL_CAMP_UNITS_KOBOLDS[2] = "npc_dota_creature_kobold_tunneler"
tSMALL_CAMP_UNITS_KOBOLDS[3] = "npc_dota_creature_kobold_taskmaster"

local tSMALL_CAMP_UNITS_TROLLS = {}
tSMALL_CAMP_UNITS_TROLLS[1] = "npc_dota_creature_forest_troll_berserker"
tSMALL_CAMP_UNITS_TROLLS[2] = "npc_dota_creature_forest_troll_high_priest"

-- Medium camps
local tMEDIUM_CAMP_UNITS_CENTAURS = {}
tMEDIUM_CAMP_UNITS_CENTAURS[1] = "npc_dota_creature_centaur_outrunner"
tMEDIUM_CAMP_UNITS_CENTAURS[2] = "npc_dota_creature_centaur_khan"

local tMEDIUM_CAMP_UNITS_WOLVES = {}
tMEDIUM_CAMP_UNITS_WOLVES[1] = "npc_dota_creature_giant_wolf"
tMEDIUM_CAMP_UNITS_WOLVES[2] = "npc_dota_creature_alpha_wolf"

-- Large camps
local tLARGE_CAMP_UNITS_NIGHTCRAWLERS = {}
tLARGE_CAMP_UNITS_NIGHTCRAWLERS[1] = "npc_dota_creature_lesser_nightcrawler"

local tLARGE_CAMP_UNITS_TORMENTED_SOULS = {}
tLARGE_CAMP_UNITS_TORMENTED_SOULS[1] = "npc_dota_creature_tormented_soul"

-- Boss camps
local tBOSS_CAMP_UNITS_MINIROSHAN = {}
tBOSS_CAMP_UNITS_MINIROSHAN[1] = "npc_dota_creature_mini_roshan"

--------------------------------------------------------------------------------
-- Camp lists for each camp type
--------------------------------------------------------------------------------
local tSMALL_CAMP_UNITS_ALL = {}
tSMALL_CAMP_UNITS_ALL[1] = tSMALL_CAMP_UNITS_KOBOLDS
tSMALL_CAMP_UNITS_ALL[2] = tSMALL_CAMP_UNITS_TROLLS

local tMEDIUM_CAMP_UNITS_ALL = {}
tMEDIUM_CAMP_UNITS_ALL[1] = tMEDIUM_CAMP_UNITS_CENTAURS
tMEDIUM_CAMP_UNITS_ALL[2] = tMEDIUM_CAMP_UNITS_WOLVES

local tLARGE_CAMP_UNITS_ALL = {}
tLARGE_CAMP_UNITS_ALL[1] = tLARGE_CAMP_UNITS_NIGHTCRAWLERS
tLARGE_CAMP_UNITS_ALL[2] = tLARGE_CAMP_UNITS_TORMENTED_SOULS

local tBOSS_CAMP_UNITS_ALL = {}
tBOSS_CAMP_UNITS_ALL[1] = tBOSS_CAMP_UNITS_MINIROSHAN

--------------------------------------------------------------------------------
-- All camp lists
--------------------------------------------------------------------------------
local tCAMP_UNITS_ALL = {}
tCAMP_UNITS_ALL[1] = tSMALL_CAMP_UNITS_ALL
tCAMP_UNITS_ALL[2] = tMEDIUM_CAMP_UNITS_ALL
tCAMP_UNITS_ALL[3] = tLARGE_CAMP_UNITS_ALL
tCAMP_UNITS_ALL[4] = tBOSS_CAMP_UNITS_ALL

return tCAMP_UNITS_ALL

--------------------------------------------------------------------------------
-- List hierarchy example:
--------------------------------------------------------------------------------
-- tCAMP_UNITS_ALL
--    tSMALL_CAMP_UNITS_ALL
--      tSMALL_CAMP_UNITS_KOBOLDS
--        "npc_dota_creature_kobold"