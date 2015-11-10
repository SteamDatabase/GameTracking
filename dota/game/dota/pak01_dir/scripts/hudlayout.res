"Resource/HudLayout.res"
{
	HudHealth
	{
		"fieldName"		"HudHealth"
		"xpos"	"16"
		"ypos"	"432"
		"wide"	"102"
		"tall"  "36"
		"visible" "1"
		"enabled" "1"

		"PaintBackgroundType"	"2"
		
		"text_xpos" "8"
		"text_ypos" "20"
		"digit_xpos" "50"
		"digit_ypos" "2"
	}
	
	HudSuit
	{
		"fieldName"		"HudSuit"
		"xpos"	"140"
		"ypos"	"432"
		"wide"	"108"
		"tall"  "36"
		"visible" "1"
		"enabled" "1"

		"PaintBackgroundType"	"2"

		
		"text_xpos" "8"
		"text_ypos" "20"
		"digit_xpos" "50"
		"digit_ypos" "2"
	}

	HudDamageIndicator
	{
		"fieldName" "HudDamageIndicator"
		"visible" "1"
		"enabled" "1"
		"DmgColorLeft" "255 0 0 0"
		"DmgColorRight" "255 0 0 0"
		
		"dmg_xpos" "30"
		"dmg_ypos" "100"
		"dmg_wide" "36"
		"dmg_tall1" "240"
		"dmg_tall2" "200"
	}

	HudDeathNotice
	{
		"fieldName" "HudDeathNotice"
		"visible" "1"
		"enabled" "1"
		"wide"	 "640"
		"tall"	 "480"
	}


	ScorePanel
	{
		"fieldName" "ScorePanel"
		"visible" "1"
		"enabled" "1"
		"wide"	 "640"
		"tall"	 "480"
	}

	HudMOTD
	{
		"fieldName" "HudMOTD"
		"visible" "1"
		"enabled" "1"
		"wide"	 "640"
		"tall"	 "480"
	}

	HudMessage
	{
		"fieldName" "HudMessage"
		"visible" "1"
		"enabled" "1"
		"wide"	 "640"
		"tall"	 "480"
	}

	HudMenu
	{
		"fieldName" "HudMenu"
		"visible" "1"
		"enabled" "1"
		"wide"	 "640"
		"tall"	 "480"
	}

	HudCloseCaption
	{
		"fieldName" "HudCloseCaption"
		"visible"	"1"
		"enabled"	"1"
		"xpos"		"c-300"
		"ypos"		"320"
		"wide"		"600"
		"tall"		"136"

		"BgAlpha"	"128"

		"GrowTime"		"0.25"
		"ItemHiddenTime"	"0.2"  // Nearly same as grow time so that the item doesn't start to show until growth is finished
		"ItemFadeInTime"	"0.15"	// Once ItemHiddenTime is finished, takes this much longer to fade in
		"ItemFadeOutTime"	"0.3"

	}

	HudChat
	{
		"fieldName" "HudChat"
		"visible" "1"
		"enabled" "1"
		"xpos"	"10"
		"ypos"	"300"
		"wide"	 "400"
		"tall"	 "100"
	}

	HudHistoryResource
	{
		"fieldName" "HudHistoryResource"
		"visible" "1"
		"enabled" "1"
		"xpos"	"r252"
		"ypos"	"40"
		"wide"	 "248"
		"tall"	 "320"

		"history_gap"	"56"
		"icon_inset"	"28"
		"text_inset"	"26"
		"NumberFont"	"HudNumbersSmall"
	}

	HUDQuickInfo
	{
		"fieldName" "HUDQuickInfo"
		"visible" "1"
		"enabled" "1"
		"wide"	 "640"
		"tall"	 "480"
	}

	HudWeapon
	{
		"fieldName" "HudWeapon"
		"visible" "1"
		"enabled" "1"
		"wide"	 "640"
		"tall"	 "480"
	}
	HudAnimationInfo
	{
		"fieldName" "HudAnimationInfo"
		"visible" "1"
		"enabled" "1"
		"wide"	 "640"
		"tall"	 "480"
	}

	HudPredictionDump
	{
		"fieldName" "HudPredictionDump"
		"visible" "1"
		"enabled" "1"
		"wide"	 "640"
		"tall"	 "480"
	}

	HudDOTABase
	{
		"fieldName"				"HudDOTABase"
		"visible"				"0"
		"enabled"				"1"
		"xpos"					"0"
		"ypos"					"0"
		"wide"					"640"
		"tall"					"480"
	}
	
	// draw chrome over top of hud elements
	HudDOTAOverlay
	{
		"fieldName"				"HudDOTAOverlay"
		"visible"				"1"
		"enabled"				"1"
		"xpos"					"0"
		"ypos"					"0"
		"zpos"					"20"
		"wide"					"f0"
		"tall"					"f0"
	}
	
	HudDOTACursorLayer
	{
		"fieldName"				"HudDOTACursorLayer"
		"visible"				"1"
		"enabled"				"1"
		"xpos"					"0"
		"ypos"					"0"
		"zpos"					"22"
		"wide"					"f0"
		"tall"					"f0"	
		
		"item_width"			"48"
		"item_height"			"36"
		
		"shop_item_width"			"44"
		"shop_item_height"			"33"
	}
	
	HudDOTAMenuBar
	{
		"fieldName"				"HudDOTAMenuBar"
		"visible"				"1"
		"enabled"				"1"
		"xpos"					"0"
		"ypos"					"0"
		"zpos"					"21"
		"wide"					"0"
		"tall"					"0"
	}

	HudKillCam
	{
		"fieldName"				"HudKillCam"
		"visible"				"0"
		"enabled"				"1"
		"xpos"					"0"
		"ypos"					"0"
		"wide"					"640"
		"tall"					"480"
	}

	HudMiniKillCam
	{
		"fieldName"				"HudMiniKillCam"
		"visible"				"0"
		"enabled"				"1"
		"xpos"					"0"
		"ypos"					"0"
		"wide"					"640"
		"tall"					"480"
	}

	HudTutorialTip
	{
		"fieldName"				"HudTutorialTip"
		"visible"				"0"
		"enabled"				"1"
		"xpos"					"0"
		"ypos"					"0"
		"wide"					"640"
		"tall"					"480"
	}

	CHUDImageTest
	{
		"fieldName"				"CHUDImageTest"
		"visible"				"1"
		"enabled"				"1"
		"xpos"					"0"
		"ypos"					"0"
		"wide"					"640"
		"tall"					"480"
	}

// 	HudUnitStatus
// 	{
// 		"fieldName"				"HudUnitStatus"
// 		"visible"				"0"
// 		"enabled"				"1"
// 		"xpos"					"c-188"
// 		"ypos"					"370"
// 		"wide"					"375"
// 		"tall"					"110"
// 		"zpos"					"1"
// 		"bgcolor_override"			"0 0 0 0"
// 		"fgcolor_override"			"0 0 0 0"
// 
// 		"PaintBackgroundType"			"2"
// 	}

// 	HudCornerPanel
// 	{
// 		"fieldName"				"HudCornerPanel"
// 		"visible"				"0"
// 		"enabled"				"1"
// 		"xpos"					"c-188"
// 		"ypos"					"370"
// 		"wide"					"375"
// 		"tall"					"110"
// 		"zpos"					"1"
// 		"bgcolor_override"			"0 0 0 0"
// 		"fgcolor_override"			"0 0 0 0"
// 
// 		"PaintBackgroundType"			"2"
// 	}

// 	HudUnitQueryStatus
// 	{
// 		"fieldName"				"HudUnitQueryStatus"
// 		"visible"				"0"
// 		"enabled"				"1"
// 		"xpos"					"c-188"
// 		"ypos"					"370"
// 		"wide"					"375"
// 		"tall"					"110"
// 		"zpos"					"1"
// 		"bgcolor_override"			"0 0 0 0"
// 		"fgcolor_override"			"0 0 0 0"
// 
// 		"PaintBackgroundType"			"2"
// 	}

	HudDOTAHeroActions
	{
		"fieldName"				"HudDOTAHeroActions"
		"visible"				"1"
		"enabled"				"1"
		"xpos"					"c-92"
		"ypos"					"393"
		"wide"					"188"
		"tall"					"38"
		"zpos"					"5"
		"bgcolor_override"			"0 0 0 0"
		"fgcolor_override"			"0 0 0 0"

		"PaintBackgroundType"			"2"
	}

	HudDOTAGoldPurse
	{
		"fieldName"				"HudDOTAGoldPurse"
		"visible"				"0"
		"enabled"				"1"
		"xpos"					"r105"
		"ypos"					"380"
		"wide"					"35"
		"tall"					"40"

		"bgcolor_override"			"0 0 0 0"
		"fgcolor_override"			"0 0 0 0"

		"PaintBackgroundType"			"2"
	}
	
	HudShopTipPanel
	{
		"fieldName"				"HudShopTipPanel"
		"visible"				"1"
		"enabled"				"1"
		"xpos"					"0"
		"ypos"					"0"
		"wide"					"f0"
		"tall"					"f0"

		"bgcolor_override"			"0 0 0 0"
		"fgcolor_override"			"0 0 0 0"

		"PaintBackgroundType"			"0"	
	}
	
	HudDOTATop
	{
		"xpos"				"c-282"
		"ypos"				"0"
		"zpos"				"4"
		"wide"				"564"
		"tall"				"64"
	}
	
	HudDOTAStash
	{
		"fieldName"				"HudDOTAStash"
		"visible"				"1"
		"enabled"				"1"
		"xpos"					"0"
		"ypos"					"0"
		"wide"					"300"
		"tall"					"100"

		"bgcolor_override"			"0 0 0 0"
		"fgcolor_override"			"0 0 0 0"

		"PaintBackgroundType"			"0"
	}
	
	HudDOTAQuickBuy
	{
		"fieldName"				"HudDOTAQuickBuy"
		"visible"				"1"
		"enabled"				"1"
		"xpos"					"r93"
		"ypos"					"r85"
		"wide"					"45"
		"tall"					"68"

		"bgcolor_override"			"0 0 0 0"
		"fgcolor_override"			"0 0 0 0"

		"PaintBackgroundType"			"2"
	}

	HudDOTAInventory
	{
		"fieldName"				"HudDOTAInventory"
		"visible"				"0"
		"enabled"				"1"
		"xpos"					"r93"
		"ypos"					"r85"
		"wide"					"45"
		"tall"					"68"

		"bgcolor_override"			"0 0 0 0"
		"fgcolor_override"			"0 0 0 0"

		"PaintBackgroundType"			"2"
	}

	HudUnitInfo
	{
		"fieldName"				"HudUnitInfo"
		"visible"				"0"
		"enabled"				"1"
		"xpos"					"0"
		"ypos"					"0"
		"wide"					"640"
		"tall"					"480"
		"zpos"					"-1000"
	}

	HudHealthBars
	{
		"fieldName"				"HudHealthBars"
		"visible"				"1"
		"enabled"				"1"
		"xpos"					"0"
		"ypos"					"0"
		"wide"					"640"
		"tall"					"480"
		"zpos"					"-1000"
	}

	TeamSelection
	{
		"fieldName"				"TeamSelection"
		"visible"				"0"
		"enabled"				"1"
		"xpos"					"0"
		"ypos"					"0"
		"wide"					"640"
		"tall"					"480"
	}

	HeroSelection
	{
		"fieldName"				"HeroSelection"
		"visible"				"0"
		"enabled"				"1"
		"xpos"					"c-270"
		"ypos"					"40"
		"wide"					"540"
		"tall"					"400"
		"zpos"					"500"
	}

	HudDOTATooltip
	{
		"fieldName"				"HudDOTATooltip"
		"visible"				"1"
		"enabled"				"1"
		"xpos"					"0"
		"ypos"					"0"
		"wide"					"640"
		"tall"					"480"
		"zpos"					"5"
	}

	HudVoiceSelfStatus
	{
		"fieldName" "HudVoiceSelfStatus"
		"visible" "1"
		"enabled" "1"
		"xpos" "r18" 	[$WIN32]
		"ypos" "350"	[$WIN32]
		"wide" "16"
		"tall" "16"
	}

	HudVoiceStatus
	{
		"fieldName" "HudVoiceStatus"
		"visible" "1"
		"enabled" "1"
		"xpos" "r130" [$WIN32]
		"ypos" "20" [$WIN32]
		"wide" "150"
		"tall" "325"

		"item_tall"	"16"
		"item_wide"	"120"

		"item_spacing" "2"

		"icon_ypos"	"0"
		"icon_xpos"	"0"
		"icon_tall"	"16"
		"icon_wide"	"16"

		"text_xpos"	"18"
		"bgcolor_override"			"0 0 0 0"
		"fgcolor_override"			"0 0 0 0"
	}
		
	overview
	{
		"fieldName" "overview"
		"visible" "1"
		"enabled" "1"
		"xpos" "0"
		"ypos" "576"
		"wide" "204.8"
		"tall" "192"
	}
		
	DOTAHudErrorMessage
	{
		"fieldName" "DOTAHudErrorMessage"
		"visible" "1"
		"enabled" "1"
		"wide"	 "f0"
		"tall"	 "768"
		
		"message_font"	"DefaultLarge"
		"message_color"	"0 0 0 0"
		"message_ypos"	"530"
		
		"bgcolor_override"	"0 0 0 0"
	}
}