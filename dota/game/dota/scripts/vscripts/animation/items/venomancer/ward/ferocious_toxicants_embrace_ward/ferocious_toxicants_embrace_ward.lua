-- Workshop Importer [veno_ward_idle]: Multiblend sequence
model:CreateSequence(
	{
		name = "ward_idle_multi",
		looping = true,
		poseParamX = model:CreatePoseParameter( "idle_aim", -1, 1, 0, false ),
		sequences = {
			{ "backleftidle", "leftidle", "idle", "rightidle", "backrightidle" }
		},
		activities = {
			{ name = "ACT_DOTA_IDLE", weight = 1 }
		}
	}
)
-- Workshop Importer [veno_ward_attack]: Multiblend sequence
model:CreateSequence(
	{
		name = "ward_attack_multi",
		poseParamX = model:CreatePoseParameter( "attack_aim", -1, 1, 0, false ),
		sequences = {
			{ "backleftattack", "leftattack", "attack", "rightattack", "backrightattack" }
		},
		activities = {
			{ name = "ACT_DOTA_ATTACK", weight = 1 }
		}
	}
)
