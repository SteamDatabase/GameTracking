"Resource/UI/econ/QuestEditorPanel.res"
{
	"QuestEditor"
	{
		"ControlName"	"Frame"
		"fieldName"		"QuestEditor"
		"xpos"			"0"
		"ypos"			"0"
		"zpos"			"2"
		"wide"			"p0.5"
		"tall"			"p0.8"
		"visible"		"1"
		"proportionaltoparent"	"1"

		"P4Warning"
		{
			"ControlName"	"Label"
			"fieldName"		"P4Warning"
			"labelText"		"P4 Unavailable.  Did you forget to run with -p4?"
			"fgcolor_override"	"255 0 0 255"
			"wide"			"f0"
			"tall"			"50"
			"textAlignment"	"center"
			"proportionaltoparent"	"1"
		}

		"SaveButton"
		{
			"ControlName"	"Button"
			"fieldName"		"SaveButton"
			"xpos"			"rs2"
			"ypos"			"5"
			"proportionaltoparent"	"1"
			"command"		"save"
			"labeltext"		"Save"
		}

		"NewQuestButton"
		{
			"ControlName"	"Button"
			"fieldName"		"NewQuestButton"
			"xpos"			"20"
			"ypos"			"r35"
			"wide"			"100"
			"proportionaltoparent"	"1"
			"command"		"newquest"
			"labeltext"		"New Quest"
		}

		"DeleteQuestButton"
		{
			"ControlName"	"Button"
			"fieldName"		"DeleteQuestButton"
			"xpos"			"140"
			"ypos"			"r35"
			"wide"			"100"
			"proportionaltoparent"	"1"
			"command"		"deletequest"
			"labeltext"		"Delete Quest"
		}

		"CopyQuestButton"
		{
			"ControlName"	"Button"
			"fieldName"		"CopyQuestButton"
			"xpos"			"260"
			"ypos"			"r35"
			"wide"			"100"
			"proportionaltoparent"	"1"
			"command"		"copyquest"
			"labeltext"		"Copy Quest"
		}

		"QuestListContainer"
		{
			"ControlName"	"CExScrollingEditablePanel"
			"fieldName"		"QuestListContainer"
			"xpos"			"20"
			"ypos"			"cs-0.5"
			"zpos"			"5"
			"wide"			"240"
			"tall"			"p0.9"
			"PaintBackgroundType"	"2"
			"fgcolor_override"	"118 107 94 255"	// Gets copied to the scrollbar fgcolor as part of ScrollableEditablePanel
			"bgcolor_override"	"51 47 46 255"
			"autohide_buttons" "1"
			"proportionaltoparent"	"1"

			"bgcolor_override"	"0 0 0 255"
			
			"ScrollBar"
			{
				"ControlName"	"ScrollBar"
				"FieldName"		"ScrollBar"
				"xpos"			"rs1.4"
				"ypos"			"0"
				"tall"			"f0"
				"wide"			"10"
				"zpos"			"1000"
				"nobuttons"		"1"
				"proportionaltoparent"	"1"

				"Slider"
				{
					"PaintBackgroundType"	"0"
				}
		
				"UpButton"
				{
					"ControlName"	"Button"
					"FieldName"		"UpButton"
					"visible"		"0"
				}
		
				"DownButton"
				{
					"ControlName"	"Button"
					"FieldName"		"DownButton"
					"visible"		"0"
				}
			}
		}

		"ObjectiveEditingPanel"
		{
			"ControlName"	"CExScrollingEditablePanel"
			"fieldName"		"ObjectiveEditingPanel"
			"xpos"			"rs1.025"
			"ypos"			"cs-0.5"
			"zpos"			"2"
			"wide"			"p0.7"
			"tall"			"p0.9"
			"visible"		"1"
			"proportionaltoparent"	"1"
			"PaintBackgroundType"	"2"
			"fgcolor_override"	"118 107 94 255"	// Gets copied to the scrollbar fgcolor as part of ScrollableEditablePanel
			"bgcolor_override"	"51 47 46 255"

			"Scrollbar"
			{
				"ControlName"	"ScrollBar"
				"FieldName"		"ScrollBar"
				"xpos"			"rs1.4"
				"ypos"			"0"
				"tall"			"f0"
				"wide"			"10"
				"zpos"			"1000"
				"nobuttons"		"1"
				"proportionaltoparent"	"1"
				
				"Slider"
				{
					"PaintBackgroundType"	"0"
				}
				
				"nobuttons"		"1"
				"UpButton"
				{
					"ControlName"	"Button"
					"FieldName"		"UpButton"
					"visible"		"0"
					"tall"			"0"
					"wide"			"0"
				}
				
				"DownButton"
				{
					"ControlName"	"Button"
					"FieldName"		"DownButton"
					"visible"		"0"
					"tall"			"0"
					"wide"			"0"
				}
			}
		}
	}	
}