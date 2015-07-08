--[[ Roam types and their units ]]

--------------------------------------------------------------------------------
-- Camp lists for each roamer group type
--------------------------------------------------------------------------------
local kMIN_CAMP_COUNT = 10
local kMAX_CAMP_COUNT = 10
local nROAMER_MAX_DIST_FROM_SPAWN = 2048
local tSMALL_ROAM_UNITS_ALL = {
	{
		unitNames = { "npc_dota_creature_zombie", "npc_dota_creature_zombie_crawler" },
		minCount = kMIN_CAMP_COUNT, maxCount = kMAX_CAMP_COUNT,
		maxDistanceFromSpawn = nROAMER_MAX_DIST_FROM_SPAWN
	},
	{
		unitNames = { "npc_dota_creature_bear", "npc_dota_creature_bear_large" },
		minCount = kMIN_CAMP_COUNT, maxCount = kMAX_CAMP_COUNT,
		maxDistanceFromSpawn = nROAMER_MAX_DIST_FROM_SPAWN
	}
}

local tBOSS_UNITS_BOSSES = {
	{
		unitNames = { "npc_dota_creature_mini_roshan" },
		minCount = 1, maxCount = 1,
		maxDistanceFromSpawn = 256
	}
}

--------------------------------------------------------------------------------
-- All roamer lists
--------------------------------------------------------------------------------
local tROAM_UNITS_ALL = {
	roam_small = tSMALL_ROAM_UNITS_ALL,
	camp_boss = tBOSS_UNITS_BOSSES
}

return tROAM_UNITS_ALL
