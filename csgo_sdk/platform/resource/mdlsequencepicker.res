"//PLATFORM/resource/mdlsequencepicker.res"
{
	"MDLSequencePicker"
	{
		"ControlName"	"CMDLSequencePicker"
		"fieldName"		"MDLSequencePicker"
		"xpos"			"147"
		"ypos"			"128"
		"wide"			"640"
		"tall"			"480"
		"AutoResize"	"0"
		"PinCorner"		"0"
		"visible"		"1"
		"enabled"		"1"
		"tabPosition"	"0"
		"settitlebarvisible"	"1"
		"title"		"#Frame_Untitled"
		
		"MDLSplitter"
		{
			"ControlName"	"Splitter"
			"fieldName"		"MDLSplitter"
			"visible"		"1"
			"enabled"		"1"
			
			"child0"
			{
				"FilterList"
				{
					"ControlName"	"ComboBox"
					"fieldName"		"FilterList"
					"xpos"			"11"
					"ypos"			"19"
					"wide"			"292"
					"tall"			"24"
					"AutoResize"	"1"
					"PinCorner"		"0"
					"UnpinnedCornerOffsetX" "-6"
					"visible"		"1"
					"enabled"		"1"
					"tabPosition"	"0"
					"textHidden"	"0"
					"editable"		"1"
					"maxchars"		"-1"
					"NumericInputOnly"		"0"
					"unicode"		"0"
				}
				"FileTree"
				{
					"ControlName"	"CFileTreeView"
					"fieldName"		"FileTree"
					"xpos"			"11"
					"ypos"			"53"
					"wide"			"292"
					"tall"			"542"
					"AutoResize"	"3"
					"PinCorner"		"0"
					"UnpinnedCornerOffsetX" "-6"
					"UnpinnedCornerOffsetY" "-6"
					"visible"		"1"
					"enabled"		"1"
					"tabPosition"		"0"
				}
			}
			
			"child1"
			{
				"SequenceSplitter"
				{
					"ControlName"	"Splitter"
					"fieldName"		"SequenceSplitter"
					"visible"		"1"
					"enabled"		"1"
					"AutoResize"	"3"
					"PinCorner"		"0"
					"xpos"			"0"
					"ypos"			"0"
					"UnpinnedCornerOffsetX" "0"
					"UnpinnedCornerOffsetY" "0"
					
					"child0"
					{
						"MDLPreview"
						{
							"ControlName"	"MDLPanel"
							"fieldName"		"MDLPreview"
							"xpos"			"6"
							"ypos"			"6"
							"wide"			"256"
							"tall"			"256"
							"AutoResize"	"3"
							"PinCorner"		"0"
							"UnpinnedCornerOffsetX" "-6"
							"UnpinnedCornerOffsetY" "-6"
							"visible"		"1"
							"enabled"		"1"
							"tabPosition"	"0"
						}
					}
					
					"child1"
					{
						"ViewsSheet"
						{
							"ControlName"	"PropertySheet"
							"fieldName"		"ViewsSheet"
							"xpos"			"6"
							"ypos"			"6"
							"wide"			"256"
							"tall"			"256"
							"AutoResize"	"3"
							"PinCorner"		"0"
							"UnpinnedCornerOffsetX" "-6"
							"UnpinnedCornerOffsetY" "-6"
							"visible"		"1"
							"enabled"		"1"
							"tabPosition"	"0"
						}
					}
				}
			}
		}
	}
}
