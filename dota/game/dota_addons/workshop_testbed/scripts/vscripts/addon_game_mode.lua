--[[ Workshop Testbed game mode ]]

print( "Workshop Testbed game mode loaded." )

-- "demo_hero_name" is a magic term, "default_value" means no string was passed, so we'd probably want to put them in hero selection
sHeroSelection = GameRules:GetGameSessionConfigValue( "demo_hero_name", "default_value" )
print( "sHeroSelection: " .. sHeroSelection )

------------------------------------------------------------------------------------------------------------------------------------------------------
-- WorkshopTestbed class
------------------------------------------------------------------------------------------------------------------------------------------------------
if CWorkshopTestbed == nil then
                _G.CWorkshopTestbed = class({}) -- put CWorkshopTestbed in the global scope
                --refer to: http://stackoverflow.com/questions/6586145/lua-require-with-global-local
end

------------------------------------------------------------------------------------------------------------------------------------------------------
-- Precache files and folders
------------------------------------------------------------------------------------------------------------------------------------------------------
function Precache( context )
                PrecacheUnitByNameSync( sHeroSelection, context )
end

--------------------------------------------------------------------------------
-- Activate WorkshopTestbed mode
--------------------------------------------------------------------------------
function Activate()
                -- When you don't have access to 'self', use 'GameRules.WorkshopTestbed' instead
                                -- example Function call: GameRules.WorkshopTestbed:Function()
                                -- example Var access: GameRules.WorkshopTestbed.m_Variable = 1
    GameRules.WorkshopTestbed = CWorkshopTestbed()
    GameRules.WorkshopTestbed:InitGameMode()
end

--------------------------------------------------------------------------------
-- Init
--------------------------------------------------------------------------------
function CWorkshopTestbed:InitGameMode()
                print( "Initializing Workshop Testbed mode" )
                local GameMode = GameRules:GetGameModeEntity()
                GameMode:SetCustomGameForceHero( sHeroSelection ) -- sHeroSelection string gets piped in by dashboard's demo button
                GameMode:SetFixedRespawnTime( 4 )
                GameRules:SetUseUniversalShopMode( true )
                GameRules:SetPreGameTime( 0 )
                GameRules:SetCustomGameSetupTimeout( 0 ) -- skip the custom team UI with 0, or do indefinite duration with -1

                SendToServerConsole( "sv_cheats 1" )
   
                PlayerResource:SetCustomTeamAssignment( 0, 2 ) -- put PlayerID 0 on Radiant team (== team 2)
end
