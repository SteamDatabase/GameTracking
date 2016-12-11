--[[
Turrets
]]

print( "Turrets!" )

function PlayerSpawned( eventInfo )
    print("Player Spawned!");
end

function Activate()
    print("Activate!");
	ListenToGameEvent( "player_spawn", PlayerSpawned, nil )
end

--Unlock Cake
function MarkerVisitedSong(trigger)
	print("Unlocking Cake!")
	local player = trigger.activator
	GameRules:GetGameModeEntity():UnlockItem(player, "portal_cake")
end
