--[[
Arcade Toss
]]

print( "ARCADE TOSS!" )

if CArcadeTossGameMode == nil then
	CArcadeTossGameMode = class({})
end

function Activate()
    print("Activate!\n");
	GameRules:GetGameModeEntity().CArcadeTossGameMode = CArcadeTossGameMode()
	GameRules:GetGameModeEntity().CArcadeTossGameMode:InitGameMode()

	ListenToGameEvent( "player_spawn", OnPlayerSpawned, nil )
end

function CArcadeTossGameMode:InitGameMode()
	GameRules:GetGameModeEntity():SetThink( "OnThink", self, 1 )
end

-- Global Variables
local red_total = 0 -- Red Score
local blue_total = 0 -- Blue Score
local red_team_counter = 0 -- Players behind the Red Team Line
local blue_team_counter = 0 -- Players behind the Blue Team Line
local red_team_ball_counter = 0 -- Total Red Balls
local blue_team_ball_counter = 0 -- Total Blue Balls
local bIsRedTeamBehindTheLine = true
local bIsBlueTeamBehindTheLine = true
local bGameInProgress = false -- Is the game in progress?
local nPreGameTimer = 6 -- Countdown for Ready, Set, Toss!
local bGameInitialized = false -- Has a player pressed the Start button yet?
local bInPreGame = false -- Is the game in the pre-game countdown?
local nRedBallLeftExists = 0 -- Number of balls currently in the left spawn position
local nRedBallRightExists = 0 -- Number of balls currently in the right spawn position
local nBlueBallLeftExists = 0 -- Number of balls currently in the left spawn position
local nBlueBallRightExists = 0 -- Number of balls currently in the right spawn position
local playerTable = {} -- List of players in the map


-- Team Scoring
_G.Scores = { red_score = 0, blue_score = 0 }
_G.Timer = 121

CustomNetTables:SetTableValue( "hoops_score", "scores", _G.Scores );

---------------------------------------------------------------------------
-- Precache
---------------------------------------------------------------------------
function Precache( context )
	--print("Precaching Resources")
	--Cache the models
	PrecacheModel( "models/props_gameplay/red_ball001.vmdl", context )
	PrecacheModel( "models/props_gameplay/blue_ball001.vmdl", context )

	--Cache the particles
	PrecacheParticle( "particles/star_trail.vpcf", context )
	PrecacheParticle( "particles/star_burst.vpcf", context )
	PrecacheParticle( "particles/arcade_physics_dust.vpcf", context )

	--Cache custom sounds
	PrecacheSoundFile( "soundevents/soundevents_addon.vsndevts", context )
end


--------------------------------------------------------------------------------
-- Events
--------------------------------------------------------------------------------
function OnPlayerSpawned( eventInfo )
    print("PlayerSpawned!")
	local player = GetPlayerFromUserID( eventInfo.userid )
	--Add player to the player list
	table.insert( playerTable, player )
end

--------------------------------------------------------------------------------
-- Thinker
--------------------------------------------------------------------------------
function CArcadeTossGameMode:OnThink()
    --print("I'm thinking!\n")
    if bGameInitialized == true then
    	CheckPhysicsObjects()
	    if bGameInProgress == true then
	    	CountdownTimer()
	    	BallReplenish()
	    else
	    	PreCountdownTimer()
	    end
	end
    if _G.Timer < 1 then
    	if bGameInProgress == true then
    		bGameInProgress = false
	    	if red_total > blue_total then
	    		--print("Red Team Wins!")
	    		DeclareWinner(1)
	    	elseif blue_total > red_total then
	    		--print("Blue Team Wins!")
	    		DeclareWinner(2)
	    	else
	    		--print("Teams Tie!")
	    		DeclareWinner(0)
	    	end
	    end
    end
    if red_team_counter > 0 then
    	print("Red Team is over the line!")
    	RedTeamOverTheLine()
    else
    	RedTeamBehindTheLine()
    end
    if blue_team_counter > 0 then
    	print("Blue Team is over the line!")
    	BlueTeamOverTheLine()
    else
    	BlueTeamBehindTheLine()
    end
	return 1
end

--------------------------------------------------------------------------------
-- Timer
--------------------------------------------------------------------------------
function CountdownTimer()
    if _G.Timer > 0 then
	    _G.Timer = _G.Timer - 1
	    if _G.Timer == 10 then
	    	EmitGlobalSound("timer_tick_10")
	    elseif _G.Timer == 5 then
	    	EmitGlobalSound("timer_tick_5")
	    end
	    local t = _G.Timer
	    --print( t )
	    local minutes = math.floor(t / 60)
	    local seconds = t - (minutes * 60)
	    local m10 = math.floor(minutes / 10)
	    local m01 = minutes - (m10 * 10)
	    local s10 = math.floor(seconds / 10)
	    local s01 = seconds - (s10 * 10)
	    local broadcast_gametimer = 
	        {
	            timer_minute_10 = m10,
	            timer_minute_01 = m01,
	            timer_second_10 = s10,
	            timer_second_01 = s01,
	        }
	    CustomGameEventManager:Send_ServerToAllClients( "countdown", broadcast_gametimer )
	end
end

function PreCountdownTimer()
	nPreGameTimer = nPreGameTimer - 1
	if nPreGameTimer == 5 or nPreGameTimer == 3 or nPreGameTimer == 1 then
		EmitGlobalSound("timer_bell")
	end
	local broadcast_pregametimer = 
	{
		pregame = nPreGameTimer
	}
	CustomGameEventManager:Send_ServerToAllClients( "pregame_countdown", broadcast_pregametimer )
	if nPreGameTimer < 1 then
		print("Starting the game!")
		EmitGlobalSound("timer_start")
		EmitGlobalSound("arcade_music")
		RedBallLeftSpawner()
		RedBallRightSpawner()
		BlueBallLeftSpawner()
		BlueBallRightSpawner()
		bGameInProgress = true
	end
end

--------------------------------------------------------------------------------
-- End Game
--------------------------------------------------------------------------------
function DeclareWinner(team)
	bGameInitialized = false
	EmitGlobalSound("timer_end")
	if team == 1 then
		--Red Team Wins
		DoEntFire( "red_team_trophy_model", "Enable", "0", 0, self, self  )
		if red_total >= 250 then
			DoEntFire( "red_team_star_model", "Enable", "0", 0, self, self  )
			DoEntFire( "red_team_star_particle", "Start", "0", 0, self, self  )
		end
		if red_total >= 500 then
			DoEntFire( "red_team_star2_model", "Enable", "0", 0, self, self  )
			DoEntFire( "red_team_star2_particle", "Start", "0", 0, self, self  )
		end
		if red_total >= 750 then
			DoEntFire( "red_team_star3_model", "Enable", "0", 0, self, self  )
			DoEntFire( "red_team_star3_particle", "Start", "0", 0, self, self  )
		end
		local broadcast_pregametimer = 
		{
			pregame = 10
		}
		CustomGameEventManager:Send_ServerToAllClients( "pregame_countdown", broadcast_pregametimer )
	elseif team == 2 then
		--Blue Team Wins
		DoEntFire( "blue_team_trophy_model", "Enable", "0", 0, self, self  )
		if blue_total >= 250 then
			DoEntFire( "blue_team_star_model", "Enable", "0", 0, self, self  )
			DoEntFire( "blue_team_star_particle", "Start", "0", 0, self, self  )
		end
		if blue_total >= 500 then
			DoEntFire( "blue_team_star2_model", "Enable", "0", 0, self, self  )
			DoEntFire( "blue_team_star2_particle", "Start", "0", 0, self, self  )
		end
		if blue_total >= 750 then
			DoEntFire( "blue_team_star3_model", "Enable", "0", 0, self, self  )
			DoEntFire( "blue_team_star3_particle", "Start", "0", 0, self, self  )
		end
		local broadcast_pregametimer = 
		{
			pregame = 20
		}
		CustomGameEventManager:Send_ServerToAllClients( "pregame_countdown", broadcast_pregametimer )
	else
		-- Teams have tied
		DoEntFire( "red_team_trophy_model", "Enable", "0", 0, self, self  )
		DoEntFire( "blue_team_trophy_model", "Enable", "0", 0, self, self  )
		if red_total >= 250 then
			DoEntFire( "red_team_star_model", "Enable", "0", 0, self, self  )
			DoEntFire( "red_team_star_particle", "Start", "0", 0, self, self  )
		end
		if red_total >= 500 then
			DoEntFire( "red_team_star2_model", "Enable", "0", 0, self, self  )
			DoEntFire( "red_team_star2_particle", "Start", "0", 0, self, self  )
		end
		if red_total >= 750 then
			DoEntFire( "red_team_star3_model", "Enable", "0", 0, self, self  )
			DoEntFire( "red_team_star3_particle", "Start", "0", 0, self, self  )
		end
		if blue_total >= 250 then
			DoEntFire( "blue_team_star_model", "Enable", "0", 0, self, self  )
			DoEntFire( "blue_team_star_particle", "Start", "0", 0, self, self  )
		end
		if blue_total >= 500 then
			DoEntFire( "blue_team_star2_model", "Enable", "0", 0, self, self  )
			DoEntFire( "blue_team_star2_particle", "Start", "0", 0, self, self  )
		end
		if blue_total >= 750 then
			DoEntFire( "blue_team_star3_model", "Enable", "0", 0, self, self  )
			DoEntFire( "blue_team_star3_particle", "Start", "0", 0, self, self  )
		end
		local broadcast_pregametimer = 
		{
			pregame = 30
		}
		CustomGameEventManager:Send_ServerToAllClients( "pregame_countdown", broadcast_pregametimer )
	end
	--Reward all players who have completed the game
	for _,player in ipairs(playerTable) do
		print("Unlocking Item")
		GameRules:GetGameModeEntity():UnlockItem( player, "balloonicorn" )
	end
end

--------------------------------------------------------------------------------
-- Start or Reset the game
--------------------------------------------------------------------------------
function ResetGame()
	--print("Resetting the game")
	StopGlobalSound("arcade_music")
	EmitGlobalSound("button_press")
	bGameInitialized = true
	--Resetting the game
	bGameInProgress = false
	--Reset the scores
	red_total = 0
	blue_total = 0
	_G.Scores = { red_score = red_total, blue_score = blue_total }
	CustomNetTables:SetTableValue( "hoops_score", "scores", _G.Scores );
	--Reset the timer
	nPreGameTimer = 6
	_G.Timer = 121
	local broadcast_gametimer = 
	        {
	            timer_minute_10 = 0,
	            timer_minute_01 = 2,
	            timer_second_10 = 0,
	            timer_second_01 = 0,
	        }
	CustomGameEventManager:Send_ServerToAllClients( "countdown", broadcast_gametimer )
	--Reset the balls
	local ballTable = Entities:FindAllByClassname("prop_physics_override")
	for _,physObject in ipairs(ballTable) do
		UTIL_Remove(physObject)
	end
	red_team_ball_counter = 0
	blue_team_ball_counter = 0
	--Reset the winner
	DoEntFire( "red_team_star_model", "Disable", "0", 0, self, self  )
	DoEntFire( "red_team_star_particle", "Stop", "0", 0, self, self  )
	DoEntFire( "blue_team_star_model", "Disable", "0", 0, self, self  )
	DoEntFire( "blue_team_star_particle", "Stop", "0", 0, self, self  )
	DoEntFire( "red_team_star2_model", "Disable", "0", 0, self, self  )
	DoEntFire( "red_team_star2_particle", "Stop", "0", 0, self, self  )
	DoEntFire( "blue_team_star2_model", "Disable", "0", 0, self, self  )
	DoEntFire( "blue_team_star2_particle", "Stop", "0", 0, self, self  )
	DoEntFire( "red_team_star3_model", "Disable", "0", 0, self, self  )
	DoEntFire( "red_team_star3_particle", "Stop", "0", 0, self, self  )
	DoEntFire( "blue_team_star3_model", "Disable", "0", 0, self, self  )
	DoEntFire( "blue_team_star3_particle", "Stop", "0", 0, self, self  )
	DoEntFire( "red_team_trophy_model", "Disable", "0", 0, self, self  )
	DoEntFire( "blue_team_trophy_model", "Disable", "0", 0, self, self  )
end

--------------------------------------------------------------------------------
-- Scoreboard
--------------------------------------------------------------------------------
function UpdateScoreboard(team, value)
	--Team (Red = 1, Blue = 2)
	if _G.Timer > 0 then
		if team == 1 then
			if bIsRedTeamBehindTheLine == true then
				if value == 5 then
					EmitGlobalSound("red_score_point_1")
				elseif value == 10 then
					EmitGlobalSound("red_score_point_2")
				elseif value == 15 then
					EmitGlobalSound("red_score_point_3")
				elseif value == 20 then
					EmitGlobalSound("red_score_point_4")
				end
				red_total = red_total + value
				_G.Scores = { red_score = red_total, blue_score = blue_total }
				CustomNetTables:SetTableValue( "hoops_score", "scores", _G.Scores );
			else
				EmitGlobalSound("score_error")
			end
		else
			if bIsBlueTeamBehindTheLine == true then
				if value == 5 then
					EmitGlobalSound("blue_score_point_1")
				elseif value == 10 then
					EmitGlobalSound("blue_score_point_2")
				elseif value == 15 then
					EmitGlobalSound("blue_score_point_3")
				elseif value == 20 then
					EmitGlobalSound("blue_score_point_4")
				end
				blue_total = blue_total + value
				_G.Scores = { red_score = red_total, blue_score = blue_total }
				CustomNetTables:SetTableValue( "hoops_score", "scores", _G.Scores );
			else
				EmitGlobalSound("score_error")
			end
		end
	end
end

--------------------------------------------------------------------------------
-- Invalid Physics Objects
--------------------------------------------------------------------------------
function CheckPhysicsObjects()
	red_team_ball_counter = 0
	blue_team_ball_counter = 0
	local ballTable = Entities:FindAllByClassname("prop_physics_override")
	local playerEntity = playerTable[1]
	for _,physObject in ipairs(ballTable) do
		local ID = physObject:Attribute_GetIntValue( "objectID", -1 )
		if ID == -1 then
			--print("Invalid Object Found")
			if playerEntity ~= nil then
				--Remove the physics object after a delay
				playerEntity:SetContextThink( "KillObject", function() return RemovePhysicsObject(physObject, playerEntity) end, 1 )
			end
		elseif ID == 1 then
			red_team_ball_counter = red_team_ball_counter + 1
		elseif ID == 2 then
			blue_team_ball_counter = blue_team_ball_counter + 1
		end
	end
end

function RemovePhysicsObject(physObject, playerEntity)
	--print("Removing Physics Object")
	if physObject ~= nil then
		local location = physObject:GetAbsOrigin()
		EmitSoundOn( "score_error", physObject )
		local effectsTable = 
		{
			origin = location,
			targetname = "invalid_object_fx",
			start_active = "1",
			effect_name = "particles/arcade_physics_dust.vpcf"
		}
		local objectFX = SpawnEntityFromTableSynchronous( "info_particle_system", effectsTable )
		objectFX:Attribute_SetIntValue("effectsID", 1)
		playerEntity:SetContextThink( "KillFX", function() return UTIL_Remove(objectFX) end, 1 )
		UTIL_Remove(physObject)
	end
end

--------------------------------------------------------------------------------
-- Ball Triggers
--------------------------------------------------------------------------------
function RedHoopRow1(trigger)
	UpdateScoreboard(1, 5)
	local hoop = "red_trigger_bot_particle"
	HoopEffects(hoop, 1)
end

function BlueHoopRow1(trigger)
	UpdateScoreboard(2, 5)
	local hoop = "blue_trigger_bot_particle"
	HoopEffects(hoop, 2)
end

function RedHoopRow2Left(trigger)
	UpdateScoreboard(1, 10)
	local hoop = "red_trigger_midleft_particle"
	HoopEffects(hoop, 1)
end

function RedHoopRow2Right(trigger)
	UpdateScoreboard(1, 10)
	local hoop = "red_trigger_midright_particle"
	HoopEffects(hoop, 1)
end

function BlueHoopRow2Left(trigger)
	UpdateScoreboard(2, 10)
	local hoop = "blue_trigger_midleft_particle"
	HoopEffects(hoop, 2)
end

function BlueHoopRow2Right(trigger)
	UpdateScoreboard(2, 10)
	local hoop = "blue_trigger_midright_particle"
	HoopEffects(hoop, 2)
end

function RedHoopRow3Left(trigger)
	UpdateScoreboard(1, 15)
	local hoop = "red_trigger_topleft_particle"
	HoopEffects(hoop, 1)
end

function RedHoopRow3Right(trigger)
	UpdateScoreboard(1, 15)
	local hoop = "red_trigger_topright_particle"
	HoopEffects(hoop, 1)
end

function BlueHoopRow3Left(trigger)
	UpdateScoreboard(2, 15)
	local hoop = "blue_trigger_topleft_particle"
	HoopEffects(hoop, 2)
end

function BlueHoopRow3Right(trigger)
	UpdateScoreboard(2, 15)
	local hoop = "blue_trigger_topright_particle"
	HoopEffects(hoop, 2)
end

function RedHoopRow4(trigger)
	UpdateScoreboard(1, 20)
	local hoop = "red_trigger_topmid_particle"
	HoopEffects(hoop, 1)
end

function BlueHoopRow4(trigger)
	UpdateScoreboard(2, 20)
	local hoop = "blue_trigger_topmid_particle"
	HoopEffects(hoop, 2)
end

function HoopEffects(hoop, team)
	--Team Red = 1, Team Blue = 2
	local validTeamPosition = nil
	if team == 1 then
		validTeamPosition = bIsRedTeamBehindTheLine
	else
		validTeamPosition = bIsBlueTeamBehindTheLine
	end
	if bGameInProgress == true and validTeamPosition == true then 
		DoEntFire( hoop, "Start", "0", 0, self, self  )
		DoEntFire( hoop, "Stop", "0", 0.1, self, self  )
	end
end

--------------------------------------------------------------------------------
-- Red Team
--------------------------------------------------------------------------------
function RedTeamCheckStartTouch()
	--A player is over the line on the Red Team side
	red_team_counter = red_team_counter + 1
end

function RedTeamCheckEndTouch()
	red_team_counter = red_team_counter - 1
end

function RedTeamOverTheLine()
	bIsRedTeamBehindTheLine = false
	--Panel popup for notification
	DoEntFire( "red_team_check_panel", "AddCSSClass", "Activated", 0, self, self  )
end

function RedTeamBehindTheLine()
	bIsRedTeamBehindTheLine = true
	DoEntFire( "red_team_check_panel", "RemoveCSSClass", "Activated", 0, self, self  )
end

--------------------------------------------------------------------------------
-- Blue Team
--------------------------------------------------------------------------------
function BlueTeamCheckStartTouch()
	--A player is over the line on the Red Team side
	blue_team_counter = blue_team_counter + 1
end

function BlueTeamCheckEndTouch()
	blue_team_counter = blue_team_counter - 1
end

function BlueTeamOverTheLine()
	bIsBlueTeamBehindTheLine = false
	--Panel popup for notification
	DoEntFire( "blue_team_check_panel", "AddCSSClass", "Activated", 0, self, self  )
end

function BlueTeamBehindTheLine()
	bIsBlueTeamBehindTheLine = true
	DoEntFire( "blue_team_check_panel", "RemoveCSSClass", "Activated", 0, self, self  )
end

--------------------------------------------------------------------------------
-- Ball Spawning
--------------------------------------------------------------------------------
function BallReplenish()
	--Spawn more balls if there are less than 4 and the spawn positions are empty
	local nRedBallsNeeded = 4 - red_team_ball_counter
	if nRedBallsNeeded > 1 then
    	--print("Replenishing Red Balls")
    	if nRedBallLeftExists == 0 then
    		RedBallLeftSpawner()
    	end
    	if nRedBallRightExists == 0 then
    		RedBallRightSpawner()
    	end
    elseif nRedBallsNeeded == 1 then
    	--Randomly select which side the single ball will spawn on
    	local randomSide = RandomInt(1,2)
    	if randomSide == 1 then
	    	if nRedBallLeftExists == 0 then
	    		RedBallLeftSpawner()
	    	elseif nRedBallRightExists == 0 then
	    		RedBallRightSpawner()
	    	end
	    else
	    	if nRedBallRightExists == 0 then
	    		RedBallRightSpawner()
	    	elseif nRedBallLeftExists == 0 then
	    		RedBallLeftSpawner()
	    	end
	    end
    end
    local nBlueBallsNeeded = 4 - blue_team_ball_counter
    if nBlueBallsNeeded > 1 then
    	--print("Replenishing Blue Balls")
    	if nBlueBallLeftExists == 0 then
    		BlueBallLeftSpawner()
    	end
    	if nBlueBallRightExists == 0 then
    		BlueBallRightSpawner()
    	end
    elseif nBlueBallsNeeded == 1 then
    	--Randomly select which side the single ball will spawn on
    	local randomSide = RandomInt(1,2)
    	if randomSide == 1 then
	    	if nBlueBallLeftExists == 0 then
	    		BlueBallLeftSpawner()
	    	elseif nBlueBallRightExists == 0 then
	    		BlueBallRightSpawner()
	    	end
	    else
	    	if nBlueBallRightExists == 0 then
	    		BlueBallRightSpawner()
	    	elseif nBlueBallLeftExists == 0 then
	    		BlueBallLeftSpawner()
	    	end
	    end
    end
end

function RedBallLeftStartTouch()
	nRedBallLeftExists = nRedBallLeftExists + 1
end

function RedBallLeftEndTouch()
	nRedBallLeftExists = nRedBallLeftExists - 1
end

function RedBallRightStartTouch()
	nRedBallRightExists = nRedBallRightExists + 1
end

function RedBallRightEndTouch()
	nRedBallRightExists = nRedBallRightExists - 1
end

function RedBallLeftSpawner()
	--print("Spawning a Red Ball")
	local ballTable = 
	{
		origin = "224 128 24",
		targetname = "red_ball",
		model = "models/props_gameplay/red_ball001.vmdl"
	}
	ballTable["spawnflags#6"] = "1"
	local redBall = SpawnEntityFromTableSynchronous( "prop_physics_override", ballTable )
	redBall:Attribute_SetIntValue( "objectID", 1 )
	EmitSoundOn( "ball_spawn", redBall )
end

function RedBallRightSpawner()
	--print("Spawning a Red Ball")
	local ballTable = 
	{
		origin = "224 64 24",
		targetname = "red_ball",
		model = "models/props_gameplay/red_ball001.vmdl"
	}
	ballTable["spawnflags#6"] = "1"
	local redBall = SpawnEntityFromTableSynchronous( "prop_physics_override", ballTable )
	redBall:Attribute_SetIntValue( "objectID", 1 )
	EmitSoundOn( "ball_spawn", redBall )
end

function BlueBallLeftStartTouch()
	nBlueBallLeftExists = nBlueBallLeftExists + 1
end

function BlueBallLeftEndTouch()
	nBlueBallLeftExists = nBlueBallLeftExists - 1
end

function BlueBallRightStartTouch()
	nBlueBallRightExists = nBlueBallRightExists + 1
end

function BlueBallRightEndTouch()
	nBlueBallRightExists = nBlueBallRightExists - 1
end

function BlueBallLeftSpawner()
	--print("Spawning a Blue Ball")
	local ballTable = 
	{
		origin = "224 -64 24",
		targetname = "blue_ball",
		model = "models/props_gameplay/blue_ball001.vmdl"
	}
	ballTable["spawnflags#6"] = "1"
	local blueBall = SpawnEntityFromTableSynchronous( "prop_physics_override", ballTable )
	blueBall:Attribute_SetIntValue( "objectID", 2 )
	EmitSoundOn( "ball_spawn", blueBall )
end

function BlueBallRightSpawner()
	--print("Spawning a Blue Ball")
	local ballTable = 
	{
		origin = "224 -128 24",
		targetname = "blue_ball",
		model = "models/props_gameplay/blue_ball001.vmdl"
	}
	ballTable["spawnflags#6"] = "1"
	local blueBall = SpawnEntityFromTableSynchronous( "prop_physics_override", ballTable )
	blueBall:Attribute_SetIntValue( "objectID", 2 )
	EmitSoundOn( "ball_spawn", blueBall )
end

--Remove Ball
function RemoveBall(trigger)
	local physObject = trigger.activator
	local playerEntity = playerTable[1]
	if playerEntity ~= nil then
		RemovePhysicsObject(physObject, playerEntity)
	end
end
