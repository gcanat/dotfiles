local wezterm = require("wezterm")
local act = wezterm.action
return {
	keys = {
		{
			key = "s",
			mods = "CTRL|ALT",
			action = act.SplitHorizontal({domain="CurrentPaneDomain"}),
		},
		{
			key = "v",
			mods = "CTRL|ALT",
			action = act.SplitVertical({domain="CurrentPaneDomain"}),
		},
		{
			key = "t",
			mods = "CTRL|SHIFT",
			action = act.SpawnTab("CurrentPaneDomain"),
		},
		{
			key = "w",
			mods = "CTRL|SHIFT",
			action = act.CloseCurrentTab({ confirm = false }),
		},
		{
			key = "c",
			mods = "CTRL|ALT",
			action = act.CloseCurrentPane({ confirm = false }),
		},
		{
			key = "LeftArrow",
			mods = "CTRL|ALT",
			action = act.ActivatePaneDirection("Left"),
		},
		{
			key = "RightArrow",
			mods = "CTRL|ALT",
			action = act.ActivatePaneDirection("Right"),
		},
		{
			key = "UpArrow",
			mods = "CTRL|ALT",
			action = act.ActivatePaneDirection("Up"),
		},
		{
			key = "DownArrow",
			mods = "CTRL|ALT",
			action = act.ActivatePaneDirection("Down"),
		},
		{
			key = "LeftArrow",
			mods = "CTRL|SHIFT",
			action = act.ActivateTabRelative( -1),
		},
		{
			key = "RightArrow",
			mods = "CTRL|SHIFT",
			action = act.ActivateTabRelative(1),
		},
		-- {
		-- 	key = "h",
		-- 	mods = "CTRL|ALT",
		-- 	action = act.AdjustPaneSize({ "Left", 1 }),
		-- },
		-- {
		-- 	key = "j",
		-- 	mods = "CTRL|ALT",
		-- 	action = act.AdjustPaneSize({ "Down", 1 }),
		-- },
		-- {
		-- 	key = "k",
		-- 	mods = "CTRL|ALT",
		-- 	action = act.AdjustPaneSize({ "Up", 1 }),
		-- },
		-- {
		-- 	key = "l",
		-- 	mods = "CTRL|ALT",
		-- 	action = act.AdjustPaneSize({ "Right", 1 }),
		-- },
		{
			key = "c",
			mods = "CTRL|SHIFT",
			action = act.CopyTo("Clipboard"),
		},
		{
			key = "v",
			mods = "CTRL|SHIFT",
			action = act.PasteFrom("Clipboard"),
		},
		{
			key = 'f',
			mods = 'CMD',
			action = act.ToggleFullScreen,
		},
	},
}
