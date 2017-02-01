"GameInfo"
{
	game 		"Destinations"
	title 		"Destinations"
	type		multiplayer_only
	nomodels 1
	nohimodel 1
	l4dcrosshair 1
	hidden_maps
	{
		"test_speakers"			1
		"test_hardware"			1
	}
	nodegraph 0
	perfwizard 0
	SupportsXbox360 0
	SupportsDX8	0
	tonemapping 0 // Hide tonemapping ui in tools mode
	GameData	"steamtours.fgd"

	FileSystem
	{
		SteamAppId				453170
		ToolsAppId				469960
		
		//
		// The code that loads this file automatically does a few things here:
		//
		// 1. For each "Game" search path, it adds a "GameBin" path, in <dir>\bin
		// 2. For each "Game" search path, it adds another "Game" path in front of it with _<langage> at the end.
		//    For example: c:\hl2\cstrike on a french machine would get a c:\hl2\cstrike_french path added to it.
		// 3. If no "Mod" key, for the first "Game" search path, it adds a search path called "MOD".
		// 4. If no "Write" key, for the first "Game" search path, it adds a search path called "DEFAULT_WRITE_PATH".
		//

		//
		// Search paths are relative to the exe directory\..\
		//
		SearchPaths
		{
			Game				steamtours
			Game				vr_forward
			Game				core
			AddonRoot			steamtours_addons
		}
	}
	
	MaterialSystem2
	{
		RenderModes
		{
			"game" "Default"
			"game" "VrForward"
			"game" "Depth"

			"tools" "ToolsVis" // Visualization modes for all shaders (lighting only, normal maps only, etc.)
			"game" "ToolsWireframe" // This should use the ToolsVis mode above instead of being its own mode
			"tools" "ToolsUtil" // Meant to be used to render tools sceneobjects that are mod-independent, like the origin grid
		}
	}

	MaterialEditor
	{
		"DefaultShader" "vr_standard"
	}

	Engine2
	{
		"HasModAppSystems" "1"
		"Capable64Bit" "1"
		"URLName" "steamtours"
		"UsesPanorama" "1"
		"RenderingPipeline"
		{
			"SkipPostProcessing" "1"
		}
		"UsesVGui" "0"
	}

	SceneSystem
	{
		"SunLightMaxCascadeSize" "2"
		"SunLightMaxShadowBufferSize" "2048"
		"SunLightShadowRenderMode" "Depth"
		"VrLightBinner" "1"
		"Tonemapping" "0"
	}

	ToolsEnvironment
	{
		"Engine"	"Source 2"
		"ToolsDir"	"../sdktools"	// NOTE: Default Tools path. This is relative to the mod path.
		"ToolsProductName" "Destinations Workshop Tools"
		"ShowCoreMod"	"1"
	}
	
	Hammer
	{
		"fgd"					"steamtours.fgd"	// NOTE: This is relative to the 'game' path.
		"DefaultTextureScale"	"0.250000"
		"DefaultMinDrawVolumeSize"	"128.0"
		"DefaultSolidEntity"	"trigger_multiple"
		"DefaultPointEntity"	"info_player_start"
		"NavMarkupEntity"		"func_nav_markup"
		"AddonMapCommand"		"destinations_load_addon"
		"UseUncompressedVertices"	"1"
		"UsesBakedLighting"		"1"
	}

	RenderPipelineAliases
	{
		"Tools"			"VR"
		"EnvMapBake"	"VR"
	}

	ResourceCompiler
	{
		// Overrides of the default builders as specified in code, this controls which map builder steps
		// will be run when resource compiler is run for a map without specifiying any specific map builder
		// steps. Additionally this controls which builders are displayed in the hammer build dialog.
		DefaultMapBuilders
		{			
			"light"		"0"	// Using per-vertex indirect lighting baked from within hammer
			"envmap"	"0"	// Using env_cubemap entities
		}
	}

	WorldRenderer
	{
		"IrradianceVolumes"		"0"
		"EnvironmentMaps"		"1"
		"EnvironmentMapFaceSize" "1024"
		"EnvironmentMapRenderSize" "4096"
		"EnvironmentMapCacheSize" "16"
		"EnvironmentMapFormat" "DXT5"
		"EnvironmentMapColorSpace" "srgb"
		"EnvironmentMapMipProcessor" "GGXCubeMapBlur_RGBM"
		"EnvironmentMapEntities" "1"
		"PerVertexLightingTexturePageSize" "512"
		"PerVertexLightingTexturePageCountMax" "2048"
	}
	
	Source1Import
	{                              
		"importmod"			"steamtours"
		"importdir"			"..\steamtours"
		"synthesizeMeshNames"	"1"
	}
}
