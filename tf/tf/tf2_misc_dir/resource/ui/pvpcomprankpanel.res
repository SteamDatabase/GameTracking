#base "PvPRankPanel.res"

"Resource/UI/PvPRankPanel.res"
{
	"ModelContainer"
	{
		"RankModel"
		{
			"model"
			{
				"origin_x"		"50"
				"origin_z"		"6"

				"if_mini"
				{
					"origin_z"		"2"
				}

			}
		}

		"MedalButton"
		{
			"ypos"			"cs-0.5-10"
			"wide"			"75"
			"tall"			"85"
		}
	}

	"BGPanel"
	{
		"StatsContainer"
		{
			"XPBar"
			{
				"CurrentXPLabel"
				{
					"visible"		"0"
				}

				"NextLevelXPLabel"
				{
					"visible"		"0"
				}
			}
		}
	}
}