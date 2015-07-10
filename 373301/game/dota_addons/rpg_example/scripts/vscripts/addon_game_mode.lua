--[[ rpg_example game mode ]]

print( "Entering rpg_example's addon_game_mode.lua file." )

--------------------------------------------------------------------------------
-- Integer constants
--------------------------------------------------------------------------------
_G.nNEUTRAL_TEAM = 4
_G.nDOTA_MAX_ABILITIES = 16
_G.nHERO_MAX_LEVEL = 25

_G.nROAMER_MAX_DIST_FROM_SPAWN = 2048
_G.nCAMPER_MAX_DIST_FROM_SPAWN = 256
_G.nPATROLLER_MAX_DIST_FROM_SPAWN = 128
_G.nBOSS_MAX_DIST_FROM_SPAWN = 0
_G.nCREATURE_RESPAWN_TIME = 60

--------------------------------------------------------------------------------
-- Lua abilities and modifiers declarations
--------------------------------------------------------------------------------
LinkLuaModifier( "lm_take_no_damage", LUA_MODIFIER_MOTION_NONE )

------------------------------------------------------------------------------------------------------------------------------------------------------
-- RPGExample class
------------------------------------------------------------------------------------------------------------------------------------------------------
if CRPGExample == nil then
	_G.CRPGExample = class({}) -- put CRPGExample in the global scope
	--refer to: http://stackoverflow.com/questions/6586145/lua-require-with-global-local
end

------------------------------------------------------------------------------------------------------------------------------------------------------
-- Required .lua files, which just exist to help organize functions contained in our addon.  Make sure to call these beneath the mode's class creation.
------------------------------------------------------------------------------------------------------------------------------------------------------
require( "utility_functions" ) -- require utility_functions first since some of the other required files may use its functions
require( "events" )
require( "rpg_example_spawning" )
require( "worlditem_spawning" )

------------------------------------------------------------------------------------------------------------------------------------------------------
-- Precache files and folders
------------------------------------------------------------------------------------------------------------------------------------------------------
function Precache( context )
    GameRules.rpg_example = CRPGExample()
    GameRules.rpg_example:PrecacheSpawners( context )
    GameRules.rpg_example:PrecacheItemSpawners( context )

    PrecacheResource( "particle", "particles/addons_gameplay/player_deferred_light.vpcf", context )
	-- Particle systems to precache for onKill effects.
	PrecacheResource( "particle", "particles/units/heroes/hero_phantom_assassin/phantom_assassin_crit_impact.vpcf", context )
	PrecacheResource( "particle", "particles/units/heroes/hero_phantom_assassin/phantom_assassin_crit_impact_mechanical.vpcf", context )
	PrecacheResource( "particle", "particles/units/heroes/hero_life_stealer/life_stealer_infest_emerge_bloody.vpcf", context )
end

--------------------------------------------------------------------------------
-- Activate RPGExample mode
--------------------------------------------------------------------------------
function Activate()
	-- When you don't have access to 'self', use 'GameRules.rpg_example' instead
		-- example Function call: GameRules.rpg_example:Function()
		-- example Var access: GameRules.rpg_example.m_Variable = 1
    GameRules.rpg_example:InitGameMode()
end

--------------------------------------------------------------------------------
-- Init
--------------------------------------------------------------------------------
function CRPGExample:InitGameMode()
	print( "Entering CRPGExample:InitGameMode" )
	self._GameMode = GameRules:GetGameModeEntity()

	self._GameMode:SetAnnouncerDisabled( true )
	self._GameMode:SetUnseenFogOfWarEnabled( true )
	self._GameMode:SetFixedRespawnTime( 4 )
	
	GameRules:SetGoldPerTick( 0 )
	GameRules:SetPreGameTime( 0 )
	GameRules:SetCustomGameSetupTimeout( 0 ) -- skip the custom team UI with 0, or do indefinite duration with -1

	ListenToGameEvent( "game_rules_state_change", Dynamic_Wrap( CRPGExample, 'OnGameRulesStateChange' ), self )
	ListenToGameEvent( "npc_spawned", Dynamic_Wrap( CRPGExample, "OnNPCSpawned" ), self )
	ListenToGameEvent( "entity_killed", Dynamic_Wrap( CRPGExample, "OnEntityKilled" ), self )
	ListenToGameEvent( "dota_player_gained_level", Dynamic_Wrap( CRPGExample, "OnPlayerGainedLevel" ), self )

	self._tPlayerHeroInitStatus = {}	

	for nPlayerID = 0, DOTA_MAX_PLAYERS do
		PlayerResource:SetCustomTeamAssignment( nPlayerID, 2 ) -- put each player on Radiant team
		self._tPlayerHeroInitStatus[ nPlayerID ] = false
	end

	self:SetupSpawners()
	self:SetupItemSpawners()

	self._GameMode:SetContextThink( "CRPGExample:GameThink", function() return self:GameThink() end, 0 )
end

--------------------------------------------------------------------------------
-- Main Think
--------------------------------------------------------------------------------
function CRPGExample:GameThink()
	local flThinkTick = 0.2

	return flThinkTick
end