--============ Copyright (c) Valve Corporation, All rights reserved. ==========
--
-- source1import auto-generated animation script
-- local changes will be overwritten if source1import if run again on this asset
--
-- mdl: models\heroes\shadowshaman\shadowshaman.mdl
--
--=============================================================================


-- AsLookLayer
model:CreateSequence(
	{
		name = "@turn layer_lookFrame_0",
		snap = true,
		delta = true,
		hidden = true,
		cmds = {
			{ cmd = "fetchframe", sequence = "@turn layer", frame = 0, dst = 0 },
			{ cmd = "fetchframe", sequence = "@turn layer", frame = 1, dst = 1 },
			{ cmd = "subtract", dst = 0, src = 1 }
		}
	}
)

model:CreateSequence(
	{
		name = "@turn layer_lookFrame_1",
		snap = true,
		delta = true,
		hidden = true,
		cmds = {
			{ cmd = "fetchframe", sequence = "@turn layer", frame = 1, dst = 0 },
			{ cmd = "fetchframe", sequence = "@turn layer", frame = 1, dst = 1 },
			{ cmd = "subtract", dst = 0, src = 1 }
		}
	}
)

model:CreateSequence(
	{
		name = "@turn layer_lookFrame_2",
		snap = true,
		delta = true,
		hidden = true,
		cmds = {
			{ cmd = "fetchframe", sequence = "@turn layer", frame = 2, dst = 0 },
			{ cmd = "fetchframe", sequence = "@turn layer", frame = 1, dst = 1 },
			{ cmd = "subtract", dst = 0, src = 1 }
		}
	}
)

model:CreateSequence(
	{
		name = "turn layer",
		delta = true,
		poseParamX = model:CreatePoseParameter( "turn", -1, 1, 0, false ),
		sequences = {
			{ "@turn layer_lookFrame_0", "@turn layer_lookFrame_1", "@turn layer_lookFrame_2" }
		}
	}
)
