"Resource/UI/MatchMakingDashboard.res"
{
	"MMDashboard"
	{
		"fieldName"				"MMDashboard"
		"visible"				"1"
		"enabled"				"1"
		"xpos"					"cs-0.5"
		"ypos"					"-5"
		"zpos"					"10001"
		"wide"					"f0"
		"tall"					"25"
		"proportionaltoparent"	"1"
		"keyboardinputenabled"	"0"

		"collapsed_height"	"0"
		"expanded_height"	"25"
		"resize_time"		"0.2"
	}

	"TopBar"
	{
		"ControlName"	"EditablePanel"
		"fieldName"		"TopBar"
		"xpos"			"cs-0.5"
		"ypos"			"0"
		"zpos"			"1"
		"wide"			"f0"
		"tall"			"25"
		"visible"		"1"
		"proportionaltoparent"	"1"

		"pinCorner"		"2"
		"autoResize"	"1"

		"BGPanel"
		{
			"ControlName"	"EditablePanel"
			"fieldName"		"BGPanel"
			"xpos"			"cs-0.5"
			"ypos"			"0"
			"zpos"			"-1"
			"wide"			"p1.1"
			"tall"			"f5"
			"visible"		"1"
			"PaintBackgroundType"	"2"
			"border"		"ReplayDefaultBorder"
			"proportionaltoparent"	"1"
		}

		"OuterShadow"
		{
			"ControlName"	"EditablePanel"
			"fieldName"		"OuterShadow"
			"xpos"			"cs-0.5"
			"ypos"			"cs-0.5"
			"zpos"			"-2"
			"wide"			"p1.1"
			"tall"			"p1"
			"visible"		"1"
			"PaintBackgroundType"	"2"
			"border"		"OuterShadowBorder"
			"proportionaltoparent"	"1"
		}

		"DisconnectContainer"
		{
			"ControlName"	"EditablePanel"
			"fieldName"		"DisconnectContainer"
			"xpos"			"rs1-20"
			"ypos"			"0"
			"zpos"			"0"
			"wide"			"250"
			"tall"			"f0"
			"visible"		"1"
			"proportionaltoparent"	"1"

			"MatchSafeToLeaveState"
			{
				"ControlName"	"Label"
				"fieldName"		"MatchSafeToLeaveState"
				"xpos"			"rs1-87"
				"ypos"			"0"
				"wide"			"f0"
				"zpos"			"100"
				"tall"			"f0"
				"visible"		"1"
				"enabled"		"1"
				"font"			"HudFontSmallest"
				"fgcolor_override"	"TanLight"
				"textAlignment"	"east"
				"labelText"		"#TF_Matchmaking_SafeToLeave"
				"proportionaltoparent"	"1"
			}

			"DisconnectButton"
			{
				"ControlName"	"CExButton"
				"fieldName"		"DisconnectButton"
				"xpos"			"rs1"
				"ypos"			"cs-0.5"
				"zpos"			"100"
				"wide"			"80"
				"tall"			"11"
				"autoResize"	"0"
				"pinCorner"		"3"
				"visible"		"1"
				"enabled"		"1"
				"tabPosition"	"0"
				"font"			"HudFontSmallestBold"
				"textAlignment"	"center"
				"dulltext"		"0"
				"brighttext"	"0"
				"Command"		"disconnect"
				"proportionaltoparent"	"1"
				"labeltext"		"#GameUI_GameMenu_Disconnect"
				"mouseinputenabled"	"1"
				"keyboardinputenabled"	"0"
				"actionsignallevel"	"3"

				"sound_depressed"	"UI/buttonclick.wav"
				"sound_released"	"UI/buttonclickrelease.wav"

				"armedBgColor_override"		"LightRed"
				"defaultBgColor_override"	"HUDRedTeamSolid"
			}
		}
	}
}
