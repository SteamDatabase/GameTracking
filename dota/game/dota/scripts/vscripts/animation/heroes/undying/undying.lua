--============ Copyright (c) Valve Corporation, All rights reserved. ==========
--
-- source1import auto-generated animation script
-- local changes will be overwritten if source1import if run again on this asset
--
-- mdl: models\heroes\undying\undying.mdl
--
--=============================================================================



-- AsLookLayer
model:CreateSequence(
	{
		name = "@undying_turns_lookFrame_0",
		snap = true,
		delta = true,
		hidden = true,
		cmds = {
			{ cmd = "fetchframe", sequence = "@undying_turns", frame = 0, dst = 0 },
			{ cmd = "fetchframe", sequence = "@undying_turns", frame = 1, dst = 1 },
			{ cmd = "subtract", dst = 0, src = 1 }
		}
	}
)

model:CreateSequence(
	{
		name = "@undying_turns_lookFrame_1",
		snap = true,
		delta = true,
		hidden = true,
		cmds = {
			{ cmd = "fetchframe", sequence = "@undying_turns", frame = 1, dst = 0 },
			{ cmd = "fetchframe", sequence = "@undying_turns", frame = 1, dst = 1 },
			{ cmd = "subtract", dst = 0, src = 1 }
		}
	}
)

model:CreateSequence(
	{
		name = "@undying_turns_lookFrame_2",
		snap = true,
		delta = true,
		hidden = true,
		cmds = {
			{ cmd = "fetchframe", sequence = "@undying_turns", frame = 2, dst = 0 },
			{ cmd = "fetchframe", sequence = "@undying_turns", frame = 1, dst = 1 },
			{ cmd = "subtract", dst = 0, src = 1 }
		}
	}
)

model:CreateSequence(
	{
		name = "undying_turns",
		delta = true,
		poseParamX = model:CreatePoseParameter( "turn", -1, 1, 0, false ),
		sequences = {
			{ "@undying_turns_lookFrame_0", "@undying_turns_lookFrame_1", "@undying_turns_lookFrame_2" }
		}
	}
)

-- AsTurningRun

model:CreateSequence(
	{
		name = "undying_run_anim",
		sequences = {
			{ "@undying_run" }
		},
		addlayer = {
			"undying_turns"
		},
		activities = {
			{ name = "ACT_DOTA_RUN", weight = 1 }
		}
	}
)


-- AsTurningRun

model:CreateSequence(
	{
		name = "undying_run_haste_anim",
		sequences = {
			{ "@undying_run_haste" }
		},
		addlayer = {
			"undying_turns"
		},
		activities = {
			{ name = "ACT_DOTA_RUN", weight = 1 },
			{ name = "haste", weight = 1 }
		}
	}
)


-- AsTurningRun

model:CreateSequence(
	{
		name = "undying_run_injured_anim",
		sequences = {
			{ "@undying_run_injured" }
		},
		addlayer = {
			"undying_turns"
		},
		activities = {
			{ name = "ACT_DOTA_RUN", weight = 1 },
			{ name = "injured", weight = 1 }
		}
	}
)


model:CreateSequence(
	{
		name = "undying_cast1_decay",
		framerangesequence = "@undying_cast1_decay",
		cmds = {
			{ cmd = "sequence", sequence = "@undying_cast1_decay", dst = 1 },
			{ cmd = "fetchframe", sequence = "@undying_cast1_decay", frame = 0, dst = 2 },
			{ cmd = "subtract", dst = 1, src = 2 },
			{ cmd = "add", dst = 0, src = 1 }
		},
		activities = {
			{ name = "ACT_DOTA_UNDYING_DECAY", weight = 1 }
		}
	}
)


model:CreateSequence(
	{
		name = "undying_cast1_decay_injured",
		framerangesequence = "@undying_cast1_decay_injured",
		cmds = {
			{ cmd = "sequence", sequence = "@undying_cast1_decay_injured", dst = 1 },
			{ cmd = "fetchframe", sequence = "@undying_cast1_decay_injured", frame = 0, dst = 2 },
			{ cmd = "subtract", dst = 1, src = 2 },
			{ cmd = "add", dst = 0, src = 1 }
		},
		activities = {
			{ name = "ACT_DOTA_UNDYING_DECAY", weight = 1 },
			{ name = "injured", weight = 1 }
		}
	}
)


model:CreateSequence(
	{
		name = "undying_cast2_soul_rip",
		framerangesequence = "@undying_cast2_soul_rip",
		cmds = {
			{ cmd = "sequence", sequence = "@undying_cast2_soul_rip", dst = 1 },
			{ cmd = "fetchframe", sequence = "@undying_cast2_soul_rip", frame = 0, dst = 2 },
			{ cmd = "subtract", dst = 1, src = 2 },
			{ cmd = "add", dst = 0, src = 1 }
		},
		activities = {
			{ name = "ACT_DOTA_UNDYING_SOUL_RIP", weight = 1 }
		}
	}
)


model:CreateSequence(
	{
		name = "undying_cast2_soul_rip_injured",
		framerangesequence = "@undying_cast2_soul_rip_injured",
		cmds = {
			{ cmd = "sequence", sequence = "@undying_cast2_soul_rip_injured", dst = 1 },
			{ cmd = "fetchframe", sequence = "@undying_cast2_soul_rip_injured", frame = 0, dst = 2 },
			{ cmd = "subtract", dst = 1, src = 2 },
			{ cmd = "add", dst = 0, src = 1 }
		},
		activities = {
			{ name = "ACT_DOTA_UNDYING_SOUL_RIP", weight = 1 },
			{ name = "injured", weight = 1 }
		}
	}
)


model:CreateSequence(
	{
		name = "undying_cast3_tombstone",
		framerangesequence = "@undying_cast3_tombstone",
		cmds = {
			{ cmd = "sequence", sequence = "@undying_cast3_tombstone", dst = 1 },
			{ cmd = "fetchframe", sequence = "@undying_cast3_tombstone", frame = 0, dst = 2 },
			{ cmd = "subtract", dst = 1, src = 2 },
			{ cmd = "add", dst = 0, src = 1 }
		},
		activities = {
			{ name = "ACT_DOTA_UNDYING_TOMBSTONE", weight = 1 }
		}
	}
)


model:CreateSequence(
	{
		name = "undying_cast3_tombstone_injured",
		framerangesequence = "@undying_cast3_tombstone_injured",
		cmds = {
			{ cmd = "sequence", sequence = "@undying_cast3_tombstone_injured", dst = 1 },
			{ cmd = "fetchframe", sequence = "@undying_cast3_tombstone_injured", frame = 0, dst = 2 },
			{ cmd = "subtract", dst = 1, src = 2 },
			{ cmd = "add", dst = 0, src = 1 }
		},
		activities = {
			{ name = "ACT_DOTA_UNDYING_TOMBSTONE", weight = 1 },
			{ name = "injured", weight = 1 }
		}
	}
)
