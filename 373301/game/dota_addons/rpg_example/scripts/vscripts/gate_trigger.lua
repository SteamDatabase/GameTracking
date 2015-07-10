--[[ RPG checkpoints ]]

local sGateTriggerName = thisEntity:GetName()

function Gate01_OnStartTouch( trigger )
	local hHero = trigger.activator
	print( "Gate01_OnStartTouch: " .. sGateTriggerName .. " activated by " .. hHero:GetUnitName() )

	-- Look through the hero's inventory to see if it's holding the right key
	local bHasKey = false
	for i = 0, 5 do
		local hItem = hHero:GetItemInSlot( i )
		if hItem and hItem:GetName() == "item_key" then
			print( "Found desired item named " .. hItem:GetName() .. " on " .. hHero:GetUnitName() )
			bHasKey = true
		end
	end

	if bHasKey then
		local hRelay = Entities:FindByName( nil, sGateTriggerName .. "_relay" )
		hRelay:Trigger()
		print( "Triggered relay named " .. hRelay:GetName() )
	end
end