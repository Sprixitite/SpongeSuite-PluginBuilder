return {
	Attributes={
	
	},
	Name="SpongeSuite",
	Rules={
	{
		Children={
		
		},
		Name="Frame",
		Priority=2,
		Props={
			BackgroundTransparency=1
		},
		Selector="Frame"
	},
	{
		Children={
		
		},
		Name=".Solid",
		Priority=4,
		Props={
			BackgroundColor3="$BackgroundColor",
			BackgroundTransparency=0
		},
		Selector=".Solid"
	},
	{
		Children={
		{
			Children={
			
			},
			Name="::UITextSizeConstraint",
			Priority=2,
			Props={
				MaxTextSize=18,
				MinTextSize=14
			},
			Selector="::UITextSizeConstraint"
		}
		},
		Name="TextLabel",
		Priority=0,
		Props={
			BackgroundTransparency=1,
			FontFace=Font.new("rbxasset://fonts/families/Zekton.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal),
			TextColor3="$TextColor",
			TextSize=16
		},
		Selector="TextLabel"
	},
	{
		Children={
		{
			Children={
			
			},
			Name="::UICorner",
			Priority=1,
			Props={
				CornerRadius=UDim.new(0, 4)
			},
			Selector="::UICorner"
		},
		{
			Children={
			
			},
			Name="::UITextSizeConstraint",
			Priority=2,
			Props={
				MaxTextSize=18,
				MinTextSize=14
			},
			Selector="::UITextSizeConstraint"
		}
		},
		Name="TextButton",
		Priority=1,
		Props={
			BackgroundColor3="$BackgroundAltColor",
			FontFace=Font.new("rbxasset://fonts/families/Zekton.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal),
			TextColor3="$TextColor"
		},
		Selector="TextButton"
	},
	{
		Children={
		
		},
		Name=".Pos",
		Priority=6,
		Props={
			BackgroundColor3=Color3.new(0.016260147094726562, 1, 0.5429089069366455),
			TextColor3=Color3.new(0.125490203499794, 0.125490203499794, 0.125490203499794)
		},
		Selector=".Pos"
	},
	{
		Children={
		
		},
		Name=".Neg",
		Priority=8,
		Props={
			BackgroundColor3=Color3.new(1, 0, 0.4343433380126953),
			TextColor3=Color3.new(0.125490203499794, 0.125490203499794, 0.125490203499794)
		},
		Selector=".Neg"
	},
	{
		Children={
		{
			Children={
			
			},
			Name="::UITextSizeConstraint",
			Priority=1,
			Props={
				MaxTextSize=22,
				MinTextSize=18
			},
			Selector="::UITextSizeConstraint"
		}
		},
		Name=".H1",
		Priority=10,
		Props={
			FontFace=Font.new("rbxasset://fonts/families/Zekton.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal),
			TextScaled=true
		},
		Selector=".H1"
	},
	{
		Children={
		{
			Children={
			
			},
			Name="::UITextSizeConstraint",
			Priority=1,
			Props={
				MaxTextSize=20,
				MinTextSize=16
			},
			Selector="::UITextSizeConstraint"
		}
		},
		Name=".H2",
		Priority=9,
		Props={
			TextScaled=true
		},
		Selector=".H2"
	},
	{
		Children={
		{
			Children={
			
			},
			Name="::UIPadding",
			Priority=1,
			Props={
				PaddingBottom=UDim.new(0, 4),
				PaddingLeft=UDim.new(0, 4),
				PaddingRight=UDim.new(0, 4),
				PaddingTop=UDim.new(0, 4)
			},
			Selector="::UIPadding"
		}
		},
		Name=".Pad",
		Priority=7,
		Props={
		
		},
		Selector=".Pad"
	},
	{
		Children={
		{
			Children={
			
			},
			Name="::UICorner",
			Priority=1,
			Props={
				CornerRadius=UDim.new(0, 4)
			},
			Selector="::UICorner"
		}
		},
		Name=".Round",
		Priority=5,
		Props={
		
		},
		Selector=".Round"
	},
	{
		Children={
		{
			Children={
			
			},
			Name="::UITextSizeConstraint",
			Priority=2,
			Props={
				MaxTextSize=18,
				MinTextSize=14
			},
			Selector="::UITextSizeConstraint"
		},
		{
			Children={
			
			},
			Name="::UICorner",
			Priority=1,
			Props={
				CornerRadius=UDim.new(0, 4)
			},
			Selector="::UICorner"
		},
		{
			Children={
			{
				Children={
				
				},
				Name="::UICorner",
				Priority=1,
				Props={
					CornerRadius=UDim.new(0, 4)
				},
				Selector="::UICorner"
			},
			{
				Children={
				
				},
				Name=".Solid",
				Priority=2,
				Props={
				
				},
				Selector=".Solid"
			}
			},
			Name=">Frame",
			Priority=3,
			Props={
				AnchorPoint=Vector2.new(0.5, nil),
				BackgroundColor3="$AccentColor",
				BackgroundTransparency=0,
				Position=UDim2.new(0.5, 0, 1, -4),
				Size=UDim2.new(1, -8, 0, 2)
			},
			Selector=">Frame"
		}
		},
		Name="TextBox",
		Priority=3,
		Props={
			BackgroundColor3="$BackgroundAltColor",
			FontFace=Font.new("rbxasset://fonts/families/Zekton.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal),
			PlaceholderColor3=Color3.new(0.8745098114013672, 0.8745098114013672, 0.8745098114013672),
			TextColor3="$TextColor",
			TextTruncate=Enum.TextTruncate.AtEnd
		},
		Selector="TextBox"
	}
	}
}