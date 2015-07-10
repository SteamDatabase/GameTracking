--[[ RPG checkpoints ]]

local checkpoint_name = thisEntity:GetName()

function Checkpoint01_OnStartTouch( trigger )
	local hUnit = trigger.activator

	print( "Checkpoint01_OnStartTouch: " .. checkpoint_name .. " activated by " .. hUnit:GetUnitName() )
	local hSpawner = Entities:FindByName( nil, checkpoint_name .. "_spawner" )
	print( "hSpawner:GetName() == " .. hSpawner:GetName() )
	hUnit:SetRespawnPosition( hSpawner:GetOrigin() )
end