#base "QuestItemTrackerPanel_Base.res"

"Resource/UI/HudAchievementTrackerItem.res"
{	
	"ItemTrackerPanel"
	{
		"xpos"					"0"
		"ypos"					"0"
		"wide"					"f0"
		"tall"					"100"
		"propotionaltoparent"	"1"

		"bar_gap"	"5"
		"attrib_y_step"	"5"
		"no_effects"	"1"

		"item_attribute_res_file"			"resource/UI/quests/QuestObjectivePanel_QuestLog_Base.res"
		"progress_bar_standard_loc_token"	"#QuestPoints_Standard"
		"progress_bar_advanced_loc_token"	"#QuestPoints_Bonus"
		"standard_glow_color"	"QuestStandardHighlight"
		"bonus_glow_color"		"QuestBonusHighlight"
	}

	"ItemName"
	{
		"visible"		"0"
	}
	
	"ProgressBarBG"
	{
		"wide"			"f0"	
		"proportionaltoparent" "1"

		"bgcolor_override"	"0 0 0 80"

		"PointsLabel"
		{
			"fgcolor_override"		"Black"
			"font"			"QuestFlavorText"
		}

		"ProgressBarStandard" // current completed
		{
			"ControlName"	"EditablePanel"
			"fieldName"		"ProgressBarStandard"

			"visible"		"1"
			"enabled"		"1"
			"proportionaltoparent" "1"

			"bgcolor_override"	"0 0 0 180"

			"PointsLabelInvert"
			{
				"font"			"QuestFlavorText"
				"fgcolor_override"	"White"
			}
		}

		"ProgressBarBonus"
		{
			"bgcolor_override"	"150 160 255 255"

			"PointsLabelInvert"
			{
				"font"			"QuestFlavorText"
				"fgcolor_override"	"White"
			}
		}
	}

	"CompletedContainer"
	{
		"visible"		"0"
	}
}