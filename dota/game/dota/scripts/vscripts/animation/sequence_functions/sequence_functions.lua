--============ Copyright (c) Valve Corporation, All rights reserved. ==========
--
-- This script is executed once every time the animation group to which it is
-- attached is loaded into a model
--
--=============================================================================

require "animationsystem.sequences"
require "animationsystem.utilities" 

-- to import to another script add this
-- DoIncludeScript( "animation/sequence_functions/sequence_functions", getfenv(1) )

--[[
EightWaySequence
Traditional 3x3 run/walk matrix
Output is a pose parameter driven sequence
]]--
function EightWaySequence( options )
	local model = options.model or nil
	local name = options.name or nil
	local pose_x = options.pose_x or "move_x"
	local pose_y = options.pose_y or "move_y"
	local source = options.source or nil
	local animevents = options.animevents or nil
	local weightlist = options.weightlist or nil
	local looping = options.looping or 1
	
	-- error checking
	if not model then
		Log_Error( "model not specified" )
		return
	end
	
	if not name then
		Log_Error( "sequence name not specified" )
		return
	end
	
	if not source then
		Log_Error( "source animation not specified" )
		return
	end
	
	-- sequence arguments
	local args = {}
	args["name"] = name
	args["poseParamX"] = pose_x
	args["poseParamY"] = pose_y
	args["looping"] = looping
	args["sequences"] = source

	if weightlist then
		args["weightlist"] = weightlist
	end

	if animevents then
		args["animevents"] = animevents
	end

	model:CreateSequence( args )

end
	
	
--[[
PoseMatrixFromSequence
take a sequence of frames and map it to pose paramaters
default to a 3x3 matrix
]]--
function PoseMatrixFromSequence( options )
	-- options
	local weightlist = options.weightlist or nil
	local model = options.model or nil
	local name = options.name or nil
	local pose_x = options.pose_x or -1
	local pose_y = options.pose_y or -1
	local source = options.source or nil
	local subtract = options.subtract or nil
	local bLooping = options.looping or true
	local numRows = options.numrows or 3
	local numColumns = options.numcolumns or 3
	
	-- error checking
	if not model then
		Log_Error( "model not specified" )
		return
	end
	
	if not name then
		Log_Error( "sequence name not specified" )
		return
	end
	
	if not source then
		Log_Error( "source animation not specified" )
		return
	end
	
	bDelta = false
	-- if subtract animation is specified, make this a delta
	if subtract then
		bDelta = true
	end
	
	-- table for storing the poses
	local animList = {}
	
	-- make all the individual anims from the sequence
	-- assumed order is left to right for columns
	-- and down to up for rows
	local frameNum = 0
	for i = 0, ( numRows -1 ) do
		rowList = {}
		for j = 0, ( numColumns -1 ) do
			animName = name .. "_" .. i .. "_" .. j 
			-- table for storing the arguments
			args = {}
			args["name"] = animName
			args["delta"] = bDelta
			args["hidden"] = true
						
			-- table for storing sequence commands
			sequenceCmds = {}
			cmdFetchFrame = { cmd = "fetchframe", sequence = source, frame = frameNum, dst = 1 } 
			cmdFetchCycle = { cmd = "fetchcycle", sequence = subtract, cycle = 0, dst = 2 }
			cmdSubtract = { cmd = "subtract", dst = 1, src = 2, weightlist = weightlist }
			cmdSlerp = { cmd = "slerp", dst = 0, src = 1 }
			
			-- insert the commands	
			table.insert( sequenceCmds, cmdFetchFrame )
			if bDelta then
				table.insert( sequenceCmds, cmdFetchCycle )
				table.insert( sequenceCmds, cmdSubtract )
			end
			table.insert( sequenceCmds, cmdSlerp )
		
			args[ "cmds" ] = sequenceCmds
			model:CreateSequence( args )
			table.insert( rowList, animName )
			frameNum = frameNum + 1
		end
		table.insert( animList, rowList )
	end	
		
	-- create the final sequence that drives the pose params
	local finalArgs = {}
	finalArgs["name"] = name
	finalArgs["delta"] = bDelta
	finalArgs["looping"] = bLooping
	
	if weightlist then
		finalArgs["weightlist"] = weightlist
	end
	
	if pose_x ~= -1 then
		finalArgs["poseParamX"] = pose_x
	end
	
	if pose_y ~= -1 then
		finalArgs["poseParamY"] = pose_y
	end
	
	finalArgs["sequences"] = animList

	model:CreateSequence( finalArgs )
end


--[[
LayerSequenceOverSequence
Layers a sequence on top of another seqeunce using the given weightlist
Output is a new full body sequence
]]--

function LayerSequenceOverSequence( options )
	local weightlist = options.weightlist or nil
	local model = options.model or nil
	local name = options.name or nil
	local source = options.source or nil
	local target = options.target or nil
	local framerangefromsource = options.framerangefromsource or false
		
	local worldspace = options.worldspace
	
	framerangesequence = target
	if framerangefromsource then
		framerangesequence = source
	end

	-- if worldspace is not defined make it true
	if worldspace == nil then
		bWorldSpace = true
	else
		bWorldSpace = options.worldspace
	end
	
	-- error checking
	if not model then
		Log_Error( "model not specified" )
		return
	end
	
	if not name then
		Log_Error( "sequence name not specified" )
		return
	end
	
	if not source then
		Log_Error( "source animation not specified" )
		return
	end
	
	-- sequence arguments
	local args = {}
	args["name"] = name
	args["framerangesequence"] = framerangesequence
	
	-- sequence commands
	local cmds = {}
	local cmdTarget = { cmd = "sequence", sequence = target, dst = 1 }
	local cmdSequence = { cmd = "sequence", sequence = source, dst = 2 }
	local cmdWorldspace = { cmd = "worldspace", dst = 1, src = 2 }
	local cmdSlerp = { cmd = "slerp", dst = 1, src = 2 }
	if weightlist then
		cmdWorldspace["weightlist"] = weightlist
		cmdSlerp["weightlist"] = weightlist
	end
	local cmdFinalSlerp = { cmd = "slerp", dst = 0, src = 1 }

	table.insert( cmds, cmdTarget )
	table.insert( cmds, cmdSequence )
	if bWorldSpace then
		table.insert( cmds, cmdWorldspace )
	else
		table.insert( cmds, cmdSlerp )
	end
	table.insert( cmds, cmdFinalSlerp )
	
	args["cmds"] = cmds
	model:CreateSequence( args )
end

--[[
DeltaSequence
Subtract one animation from another
Output is a delta sequence
]]--
function DeltaSequence( options )
	local model = options.model or nil
	local name = options.name or nil
	local source = options.source or nil
	local subtract = options.subtract or nil
	local weightlist = options.weightlist or nil

	-- error checking
	if not model then
		Log_Error( "model not specified" )
		return
	end
	
	if not name then
		Log_Error( "sequence name not specified" )
		return
	end
	
	if not source then
		Log_Error( "source animation not specified" )
		return
	end
	
	if not subtract then
		Log_Error( "subtract animation not specified" )
		return
	end
	
	-- sequence arguments
	local args = {}
	args["name"] = name
	args["delta"] = true
	args["framerangesequence"] = source
	
	-- sequence commands
	local cmds = {}
	local cmdSeqeunce = { cmd = "sequence", sequence = source, dst = 1 }
	local cmdFrame = { cmd = "fetchframe", sequence = subtract, frame = 0, dst = 2 }
	local cmdSubtract = { cmd = "subtract", dst = 1, src = 2 }
	local cmdAdd = 	{ cmd = "add", dst = 0, src = 1 }
	if weightlist then
		cmdAdd["weightlist"] = weightlist
	end

	table.insert( cmds, cmdSeqeunce )
	table.insert( cmds, cmdFrame )
	table.insert( cmds, cmdSubtract )
	table.insert( cmds, cmdAdd )
	
	args["cmds"] = cmds
	
	model:CreateSequence( args )

end


--[[
WeightlistSequence
Blend the sequence using the given weightlist
Output is a sequence that can be layered 
]]--
function WeightlistSequence( options )
	local model = options.model or nil
	local name = options.name or nil
	local weightlist = options.weightlist or nil
	local source = options.source or nil
	local bWorldSpace = options.worldspace or true
	
	-- error checking
	if not model then
		Log_Error( "model not specified" )
		return
	end
	
	if not source then
		Log_Error( "source animation not specified" )
		return
	end
	
	if not name then
		Log_Error( "sequence name not specified" )
		return
	end
	
	if not weightlist then
		Log_Error( "weightlist not specified" )
		return
	end
	
	-- sequence arguments
	local args = {}
	args["name"] = name
	args["framerangesequence"] = source
	
	-- sequence commands
	local cmds = {}
	local cmdSeqeunce = { cmd = "sequence", sequence = source, dst = 1 }
	local cmdWorldspace = { cmd = "worldspace", dst = 0, src = 1, weightlist = weightlist }
	local cmdSlerp = { cmd = "slerp", dst = 0, src = 1, weightlist = weightlist }

	table.insert( cmds, cmdSeqeunce )
	if bWorldSpace then
		table.insert( cmds, cmdWorldspace )
	else
		table.insert( cmds, cmdSlerp )
	end

	args["cmds"] = cmds
	
	model:CreateSequence( args )
	
end

--[[
SequenceFromFrame
Grab the specified frame from the animation and make it a unique sequence
If no frame is defined then use frame 0
--]]

function SequenceFromFrame( options )
	local model = options.model or nil
	local name = options.name or nil
	local source = options.source or nil
	local nFrame = options.frame or 0
	local bHidden = options.hidden or true
	
	-- error checking
	if not model then
		Log_Error( "model not specified" )
		return
	end
	
	if not source then
		Log_Error( "source animation not specified" )
		return
	end
	
	if not name then
		Log_Error( "sequence name not specified" )
		return
	end
	
	-- sequence arguments
	local args = {}
	args["name"] = name
	if bHidden then
		args["hidden"] = bHidden
	end
	
	-- sequence commands
	local cmds = {}
	local cmdFetch = { cmd = "fetchframe", sequence = source, frame = nFrame,  dst = 1 }
	local cmdSlerp = { cmd = "worldspace", dst = 0, src = 1, weightlist = weightlist }

	table.insert( cmds, cmdFetch )
	table.insert( cmds, cmdSlerp )

	args["cmds"] = cmds
	
	model:CreateSequence( args )
	
end

--[[
SequenceFromSequence
Take a sequence and make a new named sequence from it
--]]

function SequenceFromSequence( options )
	local model = options.model or nil
	local name = options.name or nil
	local source = options.source or nil
	
	-- error checking
	if not model then
		Log_Error( "model not specified" )
		return
	end
	
	if not source then
		Log_Error( "source animation not specified" )
		return
	end
	
	if not name then
		Log_Error( "sequence name not specified" )
		return
	end
	
	-- sequence arguments
	local args = {}
	args["name"] = name
	
	-- sequence commands
	local cmds = {}
	local cmdSequence = { cmd = "sequence", sequence = source, dst = 1 }
	local cmdSlerp =	{ cmd = "slerp", src = 1, dst = 0 }

	table.insert( cmds, cmdSequence )
	table.insert( cmds, cmdSlerp )

	args["cmds"] = cmds
	
	model:CreateSequence( args )
	
end


