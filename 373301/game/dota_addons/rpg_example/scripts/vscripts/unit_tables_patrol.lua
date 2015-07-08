--[[ Patrol types and their units ]]

--------------------------------------------------------------------------------
-- Individual patrol unit definitions
--------------------------------------------------------------------------------
-- Small patrols
local tSMALL_PATROL_UNITS_KOBOLDS = {}
tSMALL_PATROL_UNITS_KOBOLDS[1] = "npc_dota_creature_kobold"
tSMALL_PATROL_UNITS_KOBOLDS[2] = "npc_dota_creature_kobold_tunneler"
tSMALL_PATROL_UNITS_KOBOLDS[3] = "npc_dota_creature_kobold_taskmaster"

local tSMALL_PATROL_UNITS_GNOLLS = {}
tSMALL_PATROL_UNITS_GNOLLS[1] = "npc_dota_creature_gnoll_assassin"

local tSMALL_PATROL_UNITS_TROLLS = {}
tSMALL_PATROL_UNITS_TROLLS[1] = "npc_dota_creature_forest_troll_berserker"
tSMALL_PATROL_UNITS_TROLLS[2] = "npc_dota_creature_forest_troll_high_priest"

-- Medium patrols
local tMEDIUM_PATROL_UNITS_CENTAURS = {}
tMEDIUM_PATROL_UNITS_CENTAURS[1] = "npc_dota_creature_centaur_outrunner"
tMEDIUM_PATROL_UNITS_CENTAURS[2] = "npc_dota_creature_centaur_khan"

local tMEDIUM_PATROL_UNITS_WOLVES = {}
tMEDIUM_PATROL_UNITS_WOLVES[1] = "npc_dota_creature_giant_wolf"
tMEDIUM_PATROL_UNITS_WOLVES[2] = "npc_dota_creature_alpha_wolf"

-- Large patrols
local tLARGE_PATROL_UNITS_NIGHTCRAWLERS = {}
tLARGE_PATROL_UNITS_NIGHTCRAWLERS[1] = "npc_dota_creature_lesser_nightcrawler"

local tLARGE_PATROL_UNITS_TORMENTED_SOULS = {}
tLARGE_PATROL_UNITS_TORMENTED_SOULS[1] = "npc_dota_creature_tormented_soul"

--------------------------------------------------------------------------------
-- Camp lists for each patrol group type
--------------------------------------------------------------------------------
local tSMALL_PATROL_UNITS_ALL = {}
tSMALL_PATROL_UNITS_ALL[1] = tSMALL_PATROL_UNITS_KOBOLDS
tSMALL_PATROL_UNITS_ALL[2] = tSMALL_PATROL_UNITS_TROLLS
tSMALL_PATROL_UNITS_ALL[3] = tSMALL_PATROL_UNITS_GNOLLS

local tMEDIUM_PATROL_UNITS_ALL = {}
tMEDIUM_PATROL_UNITS_ALL[1] = tMEDIUM_PATROL_UNITS_CENTAURS
tMEDIUM_PATROL_UNITS_ALL[2] = tMEDIUM_PATROL_UNITS_WOLVES

local tLARGE_PATROL_UNITS_ALL = {}
tLARGE_PATROL_UNITS_ALL[1] = tLARGE_PATROL_UNITS_NIGHTCRAWLERS
tLARGE_PATROL_UNITS_ALL[2] = tLARGE_PATROL_UNITS_TORMENTED_SOULS

--------------------------------------------------------------------------------
-- All patrol unit lists
--------------------------------------------------------------------------------
local tPATROL_UNITS_ALL = {}
tPATROL_UNITS_ALL[1] = tSMALL_PATROL_UNITS_ALL
tPATROL_UNITS_ALL[2] = tMEDIUM_PATROL_UNITS_ALL
tPATROL_UNITS_ALL[3] = tLARGE_PATROL_UNITS_ALL

return tPATROL_UNITS_ALL

--------------------------------------------------------------------------------
-- List hierarchy example:
--------------------------------------------------------------------------------
-- tPATROL_UNITS_ALL
--    tSMALL_PATROL_UNITS_ALL
--      tSMALL_PATROL_UNITS_KOBOLDS
--        "npc_dota_creature_kobold"