--[[ Events ]]

--------------------------------------------------------------------------------
-- GameEvent:OnGameRulesStateChange
--------------------------------------------------------------------------------
function CRPGExample:OnGameRulesStateChange()
	local nNewState = GameRules:State_Get()

	if nNewState == DOTA_GAMERULES_STATE_CUSTOM_GAME_SETUP then
		print( "OnGameRulesStateChange: Custom Game Setup" )

	elseif nNewState == DOTA_GAMERULES_STATE_HERO_SELECTION then
		print( "OnGameRulesStateChange: Hero Selection" )
		self:SpawnCreatures()
		self:SpawnItems()

	elseif nNewState == DOTA_GAMERULES_STATE_PRE_GAME then
		print( "OnGameRulesStateChange: Pre Game Selection" )

	elseif nNewState == DOTA_GAMERULES_STATE_GAME_IN_PROGRESS then
		print( "OnGameRulesStateChange: Game In Progress" )

	end
end

--------------------------------------------------------------------------------
-- GameEvent: OnNPCSpawned
--------------------------------------------------------------------------------
function CRPGExample:OnNPCSpawned( event )
	hSpawnedUnit = EntIndexToHScript( event.entindex )

	if hSpawnedUnit:IsOwnedByAnyPlayer() and hSpawnedUnit:IsRealHero() then
		local hPlayerHero = hSpawnedUnit
		self._GameMode:SetContextThink( "self:Think_InitializePlayerHero( hPlayerHero )", function() return self:Think_InitializePlayerHero( hPlayerHero ) end, 0 )
	end
end

--------------------------------------------------------------------------------
-- GameEvent: OnEntityKilled
--------------------------------------------------------------------------------
function CRPGExample:OnEntityKilled( event )
	hDeadUnit = EntIndexToHScript( event.entindex_killed )
	hAttackerUnit = EntIndexToHScript( event.entindex_attacker )

	if hDeadUnit:IsCreature() then
		self:PlayDeathSound( hDeadUnit )
		self:GrantItemDrop( hDeadUnit )

		if hAttackerUnit.PlayKillEffect ~= nil then
			hAttackerUnit:PlayKillEffect( hDeadUnit )
		end
	end
end


--------------------------------------------------------------------------------
-- GrantItemDrop
--------------------------------------------------------------------------------
function CRPGExample:GrantItemDrop( hDeadUnit )
	if hDeadUnit.itemTable == nil then
		return
	end

	if RandomFloat( 0, 1 ) > 0.75 then
		local sItemName = GetRandomElement( hDeadUnit.itemTable )
		self:CreateWorldItemOnPosition( sItemName, hDeadUnit:GetAbsOrigin() )
	end
end

--------------------------------------------------------------------------------
-- PlayDeathSound
--------------------------------------------------------------------------------
function CRPGExample:PlayDeathSound( hDeadUnit )
	if hDeadUnit:GetUnitName() == "npc_dota_creature_zombie" or hDeadUnit:GetUnitName() == "npc_dota_creature_zombie_crawler" then
		EmitSoundOn( "Zombie.Death", hDeadUnit )

	elseif hDeadUnit:GetUnitName() == "npc_dota_creature_bear" then
		EmitSoundOn( "Bear.Death", hDeadUnit )

	elseif hDeadUnit:GetUnitName() == "npc_dota_creature_bear_large" then
		EmitSoundOn( "BearLarge.Death", hDeadUnit )

	end
end

--------------------------------------------------------------------------------
-- Think_InitializePlayerHero
--------------------------------------------------------------------------------
function CRPGExample:Think_InitializePlayerHero( hPlayerHero )
	if not hPlayerHero then
		return 0.1
	end

	local nPlayerID = hPlayerHero:GetPlayerID()

	if self._tPlayerHeroInitStatus[ nPlayerID ] == false then
		hPlayerHero.PlayKillEffect = Juggernaut_PlayKillEffect
		PlayerResource:SetCameraTarget( nPlayerID, hPlayerHero )
		PlayerResource:SetOverrideSelectionEntity( nPlayerID, hPlayerHero )
		PlayerResource:SetGold( nPlayerID, 0, true )
		PlayerResource:SetGold( nPlayerID, 0, false )
		hPlayerHero:UpgradeAbility( hPlayerHero:GetAbilityByIndex( 0 ) )
		hPlayerHero:SetIdleAcquire( false )

		if GetMapName() == "rpg_example" then
			local nLightParticleID = ParticleManager:CreateParticle( "particles/addons_gameplay/player_deferred_light.vpcf", PATTACH_ABSORIGIN, hPlayerHero )
			ParticleManager:SetParticleControlEnt( nLightParticleID, PATTACH_ABSORIGIN, hPlayerHero, PATTACH_ABSORIGIN, "attach_origin", hPlayerHero:GetAbsOrigin(), true )
		end

		self._tPlayerHeroInitStatus[ nPlayerID ] = true
	end
end

--------------------------------------------------------------------------------
-- GameEvent: OnPlayerGainedLevel
--------------------------------------------------------------------------------
function CRPGExample:OnPlayerGainedLevel( event )
	local hPlayer = EntIndexToHScript( event.player )
	local hPlayerHero = hPlayer:GetAssignedHero()

	hPlayerHero:SetHealth( hPlayerHero:GetMaxHealth() )
	hPlayerHero:SetMana( hPlayerHero:GetMaxMana() )
end


function PlayPACrit( hAttacker, hVictim )
	local bloodEffect = "particles/units/heroes/hero_phantom_assassin/phantom_assassin_crit_impact.vpcf"
	if hVictim:IsMechanical() then
		bloodEffect = "particles/units/heroes/hero_phantom_assassin/phantom_assassin_crit_impact_mechanical.vpcf"
	end
	local nFXIndex = ParticleManager:CreateParticle( bloodEffect, PATTACH_CUSTOMORIGIN, nil )
	ParticleManager:SetParticleControlEnt( nFXIndex, 0, hVictim, PATTACH_POINT_FOLLOW, "attach_hitloc", hVictim:GetAbsOrigin(), true )
	ParticleManager:SetParticleControl( nFXIndex, 1, hVictim:GetAbsOrigin() )
	local flHPRatio = math.min( 1.0, hVictim:GetMaxHealth() / 200 )
	ParticleManager:SetParticleControlForward( nFXIndex, 1, RandomFloat( 0.5, 1.0 ) * flHPRatio * ( hAttacker:GetAbsOrigin() - hVictim:GetAbsOrigin() ):Normalized() )
	ParticleManager:SetParticleControlEnt( nFXIndex, 10, hVictim, PATTACH_ABSORIGIN_FOLLOW, "", hVictim:GetAbsOrigin(), true )
	ParticleManager:ReleaseParticleIndex( nFXIndex )
end

function PlayLifeStealerEmerge( hAttacker, hVictim )
	ParticleManager:ReleaseParticleIndex( ParticleManager:CreateParticle( "particles/units/heroes/hero_life_stealer/life_stealer_infest_emerge_bloody.vpcf", PATTACH_ABSORIGIN_FOLLOW, hVictim ) )
end

function Juggernaut_PlayKillEffect( self, hVictim )
	if hVictim:GetMaxHealth() > 150 and RandomFloat( 0, 1 ) > 0.75 then
		PlayLifeStealerEmerge( self, hVictim )
	else
		PlayPACrit( self, hVictim )
	end
end