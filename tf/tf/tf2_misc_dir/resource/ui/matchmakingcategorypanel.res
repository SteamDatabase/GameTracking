"Resource/UI/MatchmakingCategoryPanel.res"
{
	"MatchmakingCategoryPanel"
	{
		"fieldName"				"MatchmakingCategoryPanel"
		"xpos"					"0"
		"ypos"					"0"
		"wide"					"f0"
		"tall"					"50"
		"proportionaltoparent"	"1"
	}

	"BGImage"
	{
		"ControlName"	"ImagePanel"
		"fieldName"		"BGImage"
		"xpos"			"0"
		"ypos"			"0"
		"zpos"			"0"
		"wide"			"o4"
		"tall"			"p1.17"
		"visible"		"1"
		"enabled"		"1"
		"scaleImage"	"1"	
		"proportionaltoparent"	"1"
	}

	
	"Shade"
	{
		"fieldName"			"Shade"
		"ControlName"		"EditablePanel"
		"xpos"				"cs-0.5"
		"ypos"				"0"
		"zpos"				"0"
		"wide"				"f0"
		"tall"				"f0"

		"proportionaltoparent"	"1"
		"bgcolor_override"	"0 0 0 0"
	}

	"BGColor"
	{
		"ControlName"	"EditablePanel"
		"fieldName"		"BGColor"
		"xpos"			"0"
		"ypos"			"0"
		"zpos"			"-1"
		"wide"			"f0"
		"tall"			"f0"
		"visible"		"1"
		"enabled"		"1"
		
		"proportionaltoparent"	"1"
		"bgcolor_override"	"0 0 0 255"
	}

	"Checkbutton"
	{
		"ControlName"		"CExCheckButton"
		"fieldName"		"Checkbutton"
		"xpos"		"r27"
		"ypos"		"-1"
		"zpos"		"3"
		"wide"		"25"
		"tall"		"20"
		"proportionaltoparent"	"1"
		"labeltext"		""
		"smallcheckimage"	"1"

		"sound_depressed"	"UI/buttonclickrelease.wav"	
	}

	"Title"
	{
		"ControlName"	"CExLabel"
		"fieldName"		"Title"
		"xpos"			"rs1-24"
		"ypos"			"2"
		"zpos"			"3"
		"wide"			"120"
		"tall"			"15"
		"visible"		"1"
		"enabled"		"1"
		"labelText"		"%title_token%"
		"textinsetx"	"5"
		"use_proportional_insets" "1"
		"font"			"HudFontSmallestBold"
		"textAlignment"	"east"
		"dulltext"		"0"
		"brighttext"	"0"
		"default"		"1"
		"proportionaltoparent" "1"

		"fgcolor"		"TanLight"
		"paintbackground"	"1"
	}	

	"TitleShadow"
	{
		"ControlName"	"CExLabel"
		"fieldName"		"TitleShadow"
		"xpos"			"rs1-23"
		"ypos"			"3"
		"zpos"			"2"
		"wide"			"120"
		"tall"			"15"
		"visible"		"1"
		"enabled"		"1"
		"labelText"		"%title_token%"
		"textinsetx"	"5"
		"use_proportional_insets" "1"
		"font"			"HudFontSmallestBold"
		"textAlignment"	"east"
		"dulltext"		"0"
		"brighttext"	"0"
		"default"		"1"
		"proportionaltoparent" "1"

		"fgcolor_override"		"Black"
		"paintbackground"	"1"
	}

	"DescLabel"
	{
		"ControlName"	"CExLabel"
		"fieldName"		"DescLabel"
		"font"			"MMenuPlayListDesc"
		"labelText"		"%desc_token%"
		"textAlignment"	"north-west"
		"xpos"			"rs1-5"
		"ypos"			"18"
		"zpos"			"2"
		"wide"			"120"
		"tall"			"40"
		"autoResize"	"0"
		"pinCorner"		"0"
		"visible"		"1"
		"enabled"		"1"

		"wrap"			"1"
		"fgcolor_override" "TanLight"
		"proportionaltoparent" "1"
		"mouseinputenabled"	"0"
	}

	"DescLabelShadow"
	{
		"ControlName"	"CExLabel"
		"fieldName"		"DescLabelShadow"
		"font"			"MMenuPlayListDesc"
		"labelText"		"%desc_token%"
		"textAlignment"	"north-west"
		"xpos"			"rs1-4"
		"ypos"			"19"
		"zpos"			"1"
		"wide"			"120"
		"tall"			"40"
		"autoResize"	"0"
		"pinCorner"		"0"
		"visible"		"1"
		"enabled"		"1"

		"wrap"			"1"
		"fgcolor_override" "Black"
		"proportionaltoparent" "1"
		"mouseinputenabled"	"0"
	}
}