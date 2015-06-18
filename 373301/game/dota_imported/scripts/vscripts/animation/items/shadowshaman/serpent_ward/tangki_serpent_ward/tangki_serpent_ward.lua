--============ Copyright (c) Valve Corporation, All rights reserved. ==========
--
-- source1import auto-generated animation script
-- local changes will be overwritten if source1import if run again on this asset
--
-- qc:  models/items/shadowshaman/serpent_ward/tangki_serpent_ward/tangki_serpent_ward.qc
-- mdl: items/shadowshaman/serpent_ward/tangki_serpent_ward/tangki_serpent_ward.mdl
--
--=============================================================================

model:CreateSequence(
	{
		name = "serpent_ward_idle",
		looping = true,
		fadeInTime = 0.2,
		fadeOutTime = 0.2,
		poseParamX = model:CreatePoseParameter( "idle_aim", -1, 1, 0, false ),
		sequences = {
			{ "back_left_idle", "left_idle", "idle", "right_idle", "back_right_idle" }
		},
		activities = {
			{ name = "ACT_DOTA_IDLE", weight = 1 }
		}
	}
)


model:CreateSequence(
	{
		name = "serpent_ward_attack",
		fadeInTime = 0.2,
		fadeOutTime = 0.2,
		poseParamX = model:CreatePoseParameter( "attack_aim", -1, 1, 0, false ),
		sequences = {
			{ "back_left_attack", "left_attack", "attack", "right_attack", "back_right_attack" }
		},
		activities = {
			{ name = "ACT_DOTA_ATTACK", weight = 1 }
		}
	}
)

