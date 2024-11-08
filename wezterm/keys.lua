local wezterm = require("wezterm")
local act = wezterm.action
return {
  keys = {
    {
      key = "v",
      mods = "CTRL|ALT",
      action = act.SplitHorizontal({domain="CurrentPaneDomain"}),
    },
    {
      key = "s",
      mods = "CTRL|ALT",
      action = act.SplitVertical({domain="CurrentPaneDomain"}),
    },
    {
      key = "t",
      mods = "CTRL|SHIFT",
      action = act.SpawnTab("CurrentPaneDomain"),
    },
    -- CTRL-SHIFT-l activates the debug overlay
    { key = 'L', mods = 'CTRL', action = wezterm.action.ShowDebugOverlay },
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
      key = "h",
      mods = "CTRL|ALT",
      action = act.ActivatePaneDirection("Left"),
    },
    {
      key = "l",
      mods = "CTRL|ALT",
      action = act.ActivatePaneDirection("Right"),
    },
    {
      key = "k",
      mods = "CTRL|ALT",
      action = act.ActivatePaneDirection("Up"),
    },
    {
      key = "j",
      mods = "CTRL|ALT",
      action = act.ActivatePaneDirection("Down"),
    },
    {
      key = "h",
      mods = "CTRL|SHIFT",
      action = act.ActivateTabRelative( -1),
    },
    {
      key = "l",
      mods = "CTRL|SHIFT",
      action = act.ActivateTabRelative(1),
    },
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
    {
      key = '=',
      mods = 'CTRL',
      action = act.ResetFontSize,
    },
    {
      key = '-',
      mods = 'CTRL',
      action = act.DecreaseFontSize,
    },
    {
      key = '+',
      mods = 'CTRL|SHIFT',
      action = act.IncreaseFontSize,
    },
  },
}
