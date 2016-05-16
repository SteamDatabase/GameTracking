--============ Copyright (c) Valve Corporation, All rights reserved. ==========
--
-- source1import auto-generated animation script
-- local changes will be overwritten if source1import if run again on this asset
--
-- mdl: models\heroes\legion_commander\legion_commander.mdl
--
--=============================================================================



-- AsLookLayer
model:CreateSequence(
	{
		name = "@turns_lookFrame_0",
		snap = true,
		delta = true,
		hidden = true,
		cmds = {
			{ cmd = "fetchframe", sequence = "@turns", frame = 0, dst = 0 },
			{ cmd = "fetchframe", sequence = "@turns", frame = 1, dst = 1 },
			{ cmd = "subtract", dst = 0, src = 1 }
		}
	}
)

model:CreateSequence(
	{
		name = "@turns_lookFrame_1",
		snap = true,
		delta = true,
		hidden = true,
		cmds = {
			{ cmd = "fetchframe", sequence = "@turns", frame = 1, dst = 0 },
			{ cmd = "fetchframe", sequence = "@turns", frame = 1, dst = 1 },
			{ cmd = "subtract", dst = 0, src = 1 }
		}
	}
)

model:CreateSequence(
	{
		name = "@turns_lookFrame_2",
		snap = true,
		delta = true,
		hidden = true,
		cmds = {
			{ cmd = "fetchframe", sequence = "@turns", frame = 2, dst = 0 },
			{ cmd = "fetchframe", sequence = "@turns", frame = 1, dst = 1 },
			{ cmd = "subtract", dst = 0, src = 1 }
		}
	}
)

model:CreateSequence(
	{
		name = "turns",
		delta = true,
		poseParamX = model:CreatePoseParameter( "turn", -1, 1, 0, false ),
		sequences = {
			{ "@turns_lookFrame_0", "@turns_lookFrame_1", "@turns_lookFrame_2" }
		}
	}
)

-- AsTurningRun

model:CreateSequence(
	{
		name = "legion_commander_run_anim",
		sequences = {
			{ "@legion_commander_run" }
		},
		addlayer = {
			"turns"
		},
		activities = {
			{ name = "ACT_DOTA_RUN", weight = 1 }
		}
	}
)



-- AsLookLayer
model:CreateSequence(
	{
		name = "@run_haste_turns_lookFrame_0",
		snap = true,
		delta = true,
		hidden = true,
		cmds = {
			{ cmd = "fetchframe", sequence = "@run_haste_turns", frame = 0, dst = 0 },
			{ cmd = "fetchframe", sequence = "@run_haste_turns", frame = 1, dst = 1 },
			{ cmd = "subtract", dst = 0, src = 1 }
		}
	}
)

model:CreateSequence(
	{
		name = "@run_haste_turns_lookFrame_1",
		snap = true,
		delta = true,
		hidden = true,
		cmds = {
			{ cmd = "fetchframe", sequence = "@run_haste_turns", frame = 1, dst = 0 },
			{ cmd = "fetchframe", sequence = "@run_haste_turns", frame = 1, dst = 1 },
			{ cmd = "subtract", dst = 0, src = 1 }
		}
	}
)

model:CreateSequence(
	{
		name = "@run_haste_turns_lookFrame_2",
		snap = true,
		delta = true,
		hidden = true,
		cmds = {
			{ cmd = "fetchframe", sequence = "@run_haste_turns", frame = 2, dst = 0 },
			{ cmd = "fetchframe", sequence = "@run_haste_turns", frame = 1, dst = 1 },
			{ cmd = "subtract", dst = 0, src = 1 }
		}
	}
)

model:CreateSequence(
	{
		name = "run_haste_turns",
		delta = true,
		poseParamX = model:CreatePoseParameter( "turn", -1, 1, 0, false ),
		sequences = {
			{ "@run_haste_turns_lookFrame_0", "@run_haste_turns_lookFrame_1", "@run_haste_turns_lookFrame_2" }
		}
	}
)

-- AsTurningRun

model:CreateSequence(
	{
		name = "legion_commander_run_haste",
		sequences = {
			{ "@legion_commander_run_haste" }
		},
		addlayer = {
			"run_haste_turns"
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
		name = "legion_commander_run_overwhelmingodds_anim",
		sequences = {
			{ "@legion_commander_run_overwhelmingodds" }
		},
		addlayer = {
			"run_haste_turns"
		},
		activities = {
			{ name = "ACT_DOTA_RUN", weight = 1 },
			{ name = "overwhelmingodds", weight = 1 }
		}
	}
)



-- AsLookLayer
model:CreateSequence(
	{
		name = "@run_injured_turns_lookFrame_0",
		snap = true,
		delta = true,
		hidden = true,
		cmds = {
			{ cmd = "fetchframe", sequence = "@run_injured_turns", frame = 0, dst = 0 },
			{ cmd = "fetchframe", sequence = "@run_injured_turns", frame = 1, dst = 1 },
			{ cmd = "subtract", dst = 0, src = 1 }
		}
	}
)

model:CreateSequence(
	{
		name = "@run_injured_turns_lookFrame_1",
		snap = true,
		delta = true,
		hidden = true,
		cmds = {
			{ cmd = "fetchframe", sequence = "@run_injured_turns", frame = 1, dst = 0 },
			{ cmd = "fetchframe", sequence = "@run_injured_turns", frame = 1, dst = 1 },
			{ cmd = "subtract", dst = 0, src = 1 }
		}
	}
)

model:CreateSequence(
	{
		name = "@run_injured_turns_lookFrame_2",
		snap = true,
		delta = true,
		hidden = true,
		cmds = {
			{ cmd = "fetchframe", sequence = "@run_injured_turns", frame = 2, dst = 0 },
			{ cmd = "fetchframe", sequence = "@run_injured_turns", frame = 1, dst = 1 },
			{ cmd = "subtract", dst = 0, src = 1 }
		}
	}
)

model:CreateSequence(
	{
		name = "run_injured_turns",
		delta = true,
		poseParamX = model:CreatePoseParameter( "turn", -1, 1, 0, false ),
		sequences = {
			{ "@run_injured_turns_lookFrame_0", "@run_injured_turns_lookFrame_1", "@run_injured_turns_lookFrame_2" }
		}
	}
)

-- AsTurningRun

model:CreateSequence(
	{
		name = "legion_commander_run_injured",
		sequences = {
			{ "@legion_commander_run_injured" }
		},
		addlayer = {
			"run_injured_turns"
		},
		activities = {
			{ name = "ACT_DOTA_RUN", weight = 1 },
			{ name = "injured", weight = 1 }
		}
	}
)


-- AsTurningRun

model:CreateSequence(
	{
		name = "dualwield_legion_commander_run_anim",
		sequences = {
			{ "@dualwield_legion_commander_run" }
		},
		addlayer = {
			"turns"
		},
		activities = {
			{ name = "ACT_DOTA_RUN", weight = 1 },
			{ name = "dualwield", weight = 1 }
		}
	}
)



-- AsLookLayer
model:CreateSequence(
	{
		name = "@dualwield_run_haste_turns_lookFrame_0",
		snap = true,
		delta = true,
		hidden = true,
		cmds = {
			{ cmd = "fetchframe", sequence = "@dualwield_run_haste_turns", frame = 0, dst = 0 },
			{ cmd = "fetchframe", sequence = "@dualwield_run_haste_turns", frame = 1, dst = 1 },
			{ cmd = "subtract", dst = 0, src = 1 }
		}
	}
)

model:CreateSequence(
	{
		name = "@dualwield_run_haste_turns_lookFrame_1",
		snap = true,
		delta = true,
		hidden = true,
		cmds = {
			{ cmd = "fetchframe", sequence = "@dualwield_run_haste_turns", frame = 1, dst = 0 },
			{ cmd = "fetchframe", sequence = "@dualwield_run_haste_turns", frame = 1, dst = 1 },
			{ cmd = "subtract", dst = 0, src = 1 }
		}
	}
)

model:CreateSequence(
	{
		name = "@dualwield_run_haste_turns_lookFrame_2",
		snap = true,
		delta = true,
		hidden = true,
		cmds = {
			{ cmd = "fetchframe", sequence = "@dualwield_run_haste_turns", frame = 2, dst = 0 },
			{ cmd = "fetchframe", sequence = "@dualwield_run_haste_turns", frame = 1, dst = 1 },
			{ cmd = "subtract", dst = 0, src = 1 }
		}
	}
)

model:CreateSequence(
	{
		name = "dualwield_run_haste_turns",
		delta = true,
		poseParamX = model:CreatePoseParameter( "turn", -1, 1, 0, false ),
		sequences = {
			{ "@dualwield_run_haste_turns_lookFrame_0", "@dualwield_run_haste_turns_lookFrame_1", "@dualwield_run_haste_turns_lookFrame_2" }
		}
	}
)

-- AsTurningRun

model:CreateSequence(
	{
		name = "dualwield_legion_commander_run_haste_anim",
		sequences = {
			{ "@dualwield_legion_commander_run_haste" }
		},
		addlayer = {
			"dualwield_run_haste_turns"
		},
		activities = {
			{ name = "ACT_DOTA_RUN", weight = 1 },
			{ name = "dualwield", weight = 1 },
			{ name = "haste", weight = 1 }
		}
	}
)


-- AsTurningRun

model:CreateSequence(
	{
		name = "dualwield_legion_commander_run_overwhelmingodds",
		sequences = {
			{ "@dualwield_legion_commander_run_overwhelmingodds" }
		},
		addlayer = {
			"dualwield_run_haste_turns"
		},
		activities = {
			{ name = "ACT_DOTA_RUN", weight = 1 },
			{ name = "dualwield", weight = 1 },
			{ name = "overwhelmingodds", weight = 1 }
		}
	}
)



-- AsLookLayer
model:CreateSequence(
	{
		name = "@dualwield_run_injured_turns_lookFrame_0",
		snap = true,
		delta = true,
		hidden = true,
		cmds = {
			{ cmd = "fetchframe", sequence = "@dualwield_run_injured_turns", frame = 0, dst = 0 },
			{ cmd = "fetchframe", sequence = "@dualwield_run_injured_turns", frame = 1, dst = 1 },
			{ cmd = "subtract", dst = 0, src = 1 }
		}
	}
)

model:CreateSequence(
	{
		name = "@dualwield_run_injured_turns_lookFrame_1",
		snap = true,
		delta = true,
		hidden = true,
		cmds = {
			{ cmd = "fetchframe", sequence = "@dualwield_run_injured_turns", frame = 1, dst = 0 },
			{ cmd = "fetchframe", sequence = "@dualwield_run_injured_turns", frame = 1, dst = 1 },
			{ cmd = "subtract", dst = 0, src = 1 }
		}
	}
)

model:CreateSequence(
	{
		name = "@dualwield_run_injured_turns_lookFrame_2",
		snap = true,
		delta = true,
		hidden = true,
		cmds = {
			{ cmd = "fetchframe", sequence = "@dualwield_run_injured_turns", frame = 2, dst = 0 },
			{ cmd = "fetchframe", sequence = "@dualwield_run_injured_turns", frame = 1, dst = 1 },
			{ cmd = "subtract", dst = 0, src = 1 }
		}
	}
)

model:CreateSequence(
	{
		name = "dualwield_run_injured_turns",
		delta = true,
		poseParamX = model:CreatePoseParameter( "turn", -1, 1, 0, false ),
		sequences = {
			{ "@dualwield_run_injured_turns_lookFrame_0", "@dualwield_run_injured_turns_lookFrame_1", "@dualwield_run_injured_turns_lookFrame_2" }
		}
	}
)

-- AsTurningRun

model:CreateSequence(
	{
		name = "dualwield_legion_commander_run_injured_anim",
		sequences = {
			{ "@dualwield_legion_commander_run_injured" }
		},
		addlayer = {
			"dualwield_run_injured_turns"
		},
		activities = {
			{ name = "ACT_DOTA_RUN", weight = 1 },
			{ name = "dualwield", weight = 1 },
			{ name = "injured", weight = 1 }
		}
	}
)
