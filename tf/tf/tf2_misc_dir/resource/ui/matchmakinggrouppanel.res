"Resource/UI/MatchmakingGroupPanel.res"
{
	"MatchmakingGroupPanel"
	{
		"fieldName"				"ScrollableImageListEntry"
		"xpos"					"0"
		"ypos"					"0"
		"wide"					"f0"
		"tall"					"35"
		"proportionaltoparent"	"1"
	}

	"BGPanel"
	{
		"fieldName"			"BGPanel"
		"ControlName"		"EditablePanel"
		"xpos"				"cs-0.5"
		"ypos"				"0"
		"wide"				"p1.3"
		"tall"				"f0"

		"proportionaltoparent"	"1"
		"border"		"MainMenuBGBorder"
	}

	"Checkbutton"
	{
		"ControlName"		"CExCheckButton"
		"fieldName"		"Checkbutton"
		"xpos"		"0"
		"ypos"		"0"
		"zpos"		"3"
		"wide"		"f0"
		"tall"		"20"
		"proportionaltoparent"	"1"
		"labeltext"		""
		"smallcheckimage"	"1"
		"fgcolor"	"TanLight"	
		"font"		"HudFontSmallBold"

		"sound_depressed"	"UI/buttonclickrelease.wav"	
	}

	"Excludes"
	{
		"ControlName"	"CExLabel"
		"fieldName"		"Excludes"
		"xpos"			"0"
		"ypos"			"19"
		"zpos"			"3"
		"wide"			"f0"
		"tall"			"15"
		"visible"		"1"
		"enabled"		"1"
		"labelText"		"%excludes_text%"
		"textinsetx"	"20"
		"use_proportional_insets" "1"
		"font"			"ReplayMediumSmall"
		"textAlignment"	"north-west"
		"dulltext"		"0"
		"brighttext"	"0"
		"default"		"1"
		"proportionaltoparent" "1"

		"fgcolor"		"Orange"
		"paintbackground"	"1"
	}	
}