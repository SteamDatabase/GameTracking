"Resource/UI/LobbyLeaderboard.res"
{
	"BookPage"
	{
		"ControlName"	"ImagePanel"
		"fieldName"		"BookPage"
		"xpos"			"s-0.1667"
		"ypos"			"0"
		"zpos"			"0"
		"wide"			"o1"
		"tall"			"f0"
		"visible"		"0"
		"enabled"		"1"
		"image"			""
		"scaleImage"	"1"
		"proportionaltoparent" "1"
	}

	"LocalLeaderboardButton"
	{
		"ControlName"	"Button"
		"fieldName"		"LocalLeaderboardButton"
		"xpos"			"p0.05"
		"ypos"			"2"
		"zpos"			"0"
		"wide"			"p0.44"
		"tall"			"15"
		"visible"		"1"
		"proportionaltoparent"	"1"

		"actionsignallevel"		"1"
		"command"		"local"
		"labeltext"		"#TF_Competitive_Friends"
		"font"			"HudFontSmallestBold"
		"fgcolor_override"	"TanLight"
		"textAlignment"	"center"

		"sound_depressed"	"UI/buttonclick.wav"
		"sound_released"	"UI/buttonclickrelease.wav"
	}

	"GlobalLeaderboardButton"
	{
		"ControlName"	"Button"
		"fieldName"		"GlobalLeaderboardButton"
		"xpos"			"rs1-p0.05"
		"ypos"			"2"
		"zpos"			"0"
		"wide"			"p0.44"
		"tall"			"15"
		"visible"		"1"
		"proportionaltoparent"	"1"

		"actionsignallevel"		"1"
		"command"		"global"
		"labeltext"		"#TF_Competitive_Global"
		"font"			"HudFontSmallestBold"
		"fgcolor_override"	"TanLight"
		"textAlignment"	"center"

		"sound_depressed"	"UI/buttonclick.wav"
		"sound_released"	"UI/buttonclickrelease.wav"
	}

	"Line"
	{
		"ControlName"		"EditablePanel"
		"fieldName"			"Line"
		"xpos"				"p0.05"
		"ypos"				"18"
		"wide"				"p0.9"
		"tall"				"2"
		"visible"			"1"
		"proportionaltoparent" "1"

		"bgcolor_override"	"89 81 71 255"
	}

	"ScoreListScroller"
	{
		"ControlName"		"ScrollableEditablePanel"
		"fieldName"			"ScoreListScroller"
		"xpos"				"p0.05"
		"ypos"				"p0.1"
		"wide"				"p0.95"
		"tall"				"p0.9"
		"visible"			"1"
		"proportionaltoparent" "1"
		"asynchandling"		"hide"
	}

	"LoadingImage"
	{
		"ControlName"		"ImagePanel"
		"fieldName"			"LoadingImage"
		"xpos"				"cs-0.5"
		"ypos"				"cs-0.5"
		"zpos"				"1"
		"wide"				"p0.75"
		"tall"				"w1"
		"visible"			"1"
		"enabled"			"1"
		"image"				"animated/tf2_logo_hourglass"
		"scaleImage"		"1"
		"proportionaltoparent" "1"
		"asynchandling"		"show"
	}

	"TooltipPanel"
	{
		"ControlName"	"EditablePanel"
		"fieldName"		"TooltipPanel"
		"xpos"			"0"
		"ypos"			"0"
		"zpos"			"100"
		"wide"			"150"
		"tall"			"50"
		"visible"		"0"
		"PaintBackgroundType"	"2"
		"border"		"MainMenuBGBorder"
		
		"TipLabel"
		{
			"ControlName"	"CExLabel"
			"fieldName"		"TipLabel"
			"font"			"HudFontSmallestBold"
			"labelText"		"%tiptext%"
			"textAlignment"	"center"
			"xpos"			"20"
			"ypos"			"10"
			"zpos"			"2"
			"wide"			"100"
			"tall"			"30"
			"autoResize"	"0"
			"pinCorner"		"0"
			"visible"		"1"
			"enabled"		"1"
			"fgcolor_override"	"235 226 202 255"
			"wrap"			"1"
			"centerwrap"	"1"
		}
	}
}
