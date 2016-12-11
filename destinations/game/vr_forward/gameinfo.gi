"GameInfo"
{
	game 		"vr_forward"
	title 		"VrForward shaders"
	type		singleplayer_only
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
	GameData	"vr_forward.fgd"
	DefaultToVr 1

	FileSystem
	{
		SteamAppId				344980		// This will mount all the GCFs we need (240=CS:S, 220=HL2).
		ToolsAppId				344980		// Tools will load this (ie: source SDK caches) to get things like materials\debug, materials\editor, etc.
		
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
			Game				vr_forward
			Game				core
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
		"URLName" "vr"
		"UsesPanorama" "1"
		"RenderingPipeline"
		{
			"SkipPostProcessing" "1"
			"SkipGameOverlay" "1"
		}
	}

	SceneSystem
	{
		"NoSunLightManager" "1"
		"VrLightBinner" "1"
	}

	ToolsEnvironment
	{
		"Engine"	"Source 2"
		"ToolsDir"	"../sdktools"	// NOTE: Default Tools path. This is relative to the mod path.
	}
	
	Hammer
	{
		"fgd"					"vr_forward.fgd"	// NOTE: This is relative to the 'game' path.
		"DefaultTextureScale"	"0.250000"
		"DefaultSolidEntity"	"trigger_multiple"
		"DefaultPointEntity"	"info_player_start"
		"NavMarkupEntity"		"func_nav_markup"
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
		"EnvironmentMapMipProcessor" "RGBM"
		"EnvironmentMapEntities" "1"
	}
}
