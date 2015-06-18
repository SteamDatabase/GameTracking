la_spawn_enemy_at_target = class({})

LinkLuaModifier( "lm_spawn_enemy_at_target", LUA_MODIFIER_MOTION_NONE )

function la_spawn_enemy_at_target:OnSpellStart()
	Msg( "la_spawn_enemy_at_target:OnSpellStart\n")

	local hPlayerHero = PlayerResource:GetSelectedHeroEntity( 0 )
	GameRules.herodemo.m_nEnemiesCount = GameRules.herodemo.m_nEnemiesCount + 1
	print( "Enemy team count is now: " .. GameRules.herodemo.m_nEnemiesCount )

	local vTargetPos = hPlayerHero:GetAbsOrigin()
	vTargetPos.z = 0
	Msg( tostring( vTargetPos ) )

	GameRules.herodemo.m_tEnemiesList[ GameRules.herodemo.m_nEnemiesCount ] = CreateUnitByName( "npc_dota_hero_axe", vTargetPos, true, nil, nil, GameRules.herodemo.m_nENEMIES_TEAM )
	-- can do it this way instead of keeping track of self.m_nEnemiesCount, and use # when you need to get length of the list:
	--table.append(self.m_tEnemiesList, CreateUnitByName( "npc_dota_hero_axe", hPlayerHero:GetAbsOrigin(), true, nil, nil, self.m_nENEMIES_TEAM ) )
	local hUnit = GameRules.herodemo.m_tEnemiesList[ GameRules.herodemo.m_nEnemiesCount ]
	hUnit:SetControllableByPlayer( GameRules.herodemo.m_nPlayerID, false )
	FindClearSpaceForUnit( hUnit, vTargetPos, false )
	hUnit:Hold()
	hUnit:SetIdleAcquire( false )
	hUnit:SetAcquisitionRange( 0 )
end

function la_spawn_enemy_at_target:GetCastRange( vLocation, hTarget )
	Msg( "la_spawn_enemy_at_target:GetCastRange\n" )
	return 5000
end