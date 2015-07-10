--[[ Item tables ]]

--------------------------------------------------------------------------------
-- Camp lists for each roamer group type
--------------------------------------------------------------------------------

local tTIER_01_ITEMS_ALL = {
	"item_flask", "item_tango", "item_quelling_blade", "item_broadsword_tier1"
}

local tTIER_02_ITEMS_ALL = {
	"item_javelin", "item_broadsword_tier2", "item_ring_of_health"
}

local tTIER_03_ITEMS_ALL = {
	"item_invis_sword", "item_phase_boots", "item_broadsword_tier3", "item_bfury"
}

local tKEY_GATE01 = {
	"item_orb_of_passage"
}

--------------------------------------------------------------------------------
-- All roamer lists
--------------------------------------------------------------------------------
local tITEMS_ALL = {
	worlditems_tier01 = tTIER_01_ITEMS_ALL,
	worlditems_tier02 = tTIER_02_ITEMS_ALL,
	worlditems_tier03 = tTIER_03_ITEMS_ALL,
	worlditems_gate01_key = tKEY_GATE01
}

return tITEMS_ALL