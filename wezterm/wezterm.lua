local wezterm = require("wezterm")
local k = require("keys")
-- local b = require("background")

-- The filled in variant of the < symbol
local SOLID_LEFT_ARROW = wezterm.nerdfonts.pl_right_hard_divider
-- The filled in variant of the > symbol
local SOLID_RIGHT_ARROW = wezterm.nerdfonts.pl_left_hard_divider

-- local wezterm = require 'wezterm'

-- The filled in variant of the < symbol
-- local SOLID_LEFT_ARROW = utf8.char(0xe0b2)

-- The filled in variant of the > symbol
-- local SOLID_RIGHT_ARROW = utf8.char(0xe0b0)

wezterm.on(
  'format-tab-title',
  function(tab, tabs, panes, config, hover, max_width)
    local edge_background = '#2b2042'
    local background = '#24273a'
    local foreground = '#808080'

    if tab.is_active then
      background = '#3b3052'
      foreground = '#c0c0c0'
    elseif hover then
      background = '#3b3052'
      foreground = '#909090'
    end

    local edge_foreground = background

    -- ensure that the titles fit in the available space,
    -- and that we have room for the edges.
    local title = wezterm.truncate_right(tab.active_pane.title, max_width - 2)

    return {
      { Background = { Color = edge_background } },
      { Foreground = { Color = edge_foreground } },
      { Text = SOLID_LEFT_ARROW },
      { Background = { Color = background } },
      { Foreground = { Color = foreground } },
      { Text = title },
      { Background = { Color = edge_background } },
      { Foreground = { Color = edge_foreground } },
      { Text = SOLID_RIGHT_ARROW },
    }
  end
)

-- display lag when using multiplexing functionality
wezterm.on('update-status', function(window, pane)
  local meta = pane:get_metadata() or {}
  if meta.is_tardy then
    local secs = meta.since_last_response_ms / 1000.0
    window:set_right_status(string.format('tardy: %5.1fs⏳', secs))
  end
end)

return {
	term = "xterm-kitty",
	font = wezterm.font_with_fallback {
    -- "DejaVu Sans Mono",
    "Input Mono Condensed",
    { family = "Symbols Nerd Font Mono", scale = 0.8},
    "Noto Color Emoji"
  },
	-- font = wezterm.font("VictorMono Nerd Font Mono"),
	-- font = wezterm.font("FiraCode Nerd Font Mono"),
	-- font = wezterm.font("Iosevka Term SS09"),
	-- font = wezterm.font("JetBrains Mono"),
	-- font = wezterm.font("DinaRemasterII"),
	-- font = wezterm.font("Terminus (TTF)"),
	-- font = wezterm.font("Terminus"),
	font_size = 10.5,
	hide_tab_bar_if_only_one_tab = true,
	-- use_fancy_tab_bar = false,
	tab_bar_at_bottom = true,
	enable_scroll_bar = true,
	scrollback_lines = 50000,
	color_scheme = "Catppuccin Macchiato", -- or Macchiato, Frappe, Latte
	colors = {
		scrollbar_thumb = "gray",
	},
	window_padding = {
    	left = "0cell",
    	right = "0cell",
    	top = "0cell",
    	bottom = "0cell",
  	},
	-- background = b.background,
	keys = k.keys,
	ssh_domains = {
		{
			name = 'huff',
	    remote_address = 'huff_remote',
	    username = 'root',
	  },
		{
			name = 'sly',
	    remote_address = 'sly_remote',
	    username = 'root',
	  },
	},
	window_frame = {
		-- font = wezterm.font("DejaVu Sans Mono"),
    font = wezterm.font("Input Mono Condensed"),
		font_size = 9,
		inactive_titlebar_bg = "#2b2042",
		active_titlebar_bg = "#2b2042",
	},
	-- tab_bar_style = {
	--   active_tab_left = wezterm.format {
	--     { Background = { Color = '#0b0022' } },
	--     { Foreground = { Color = '#2b2042' } },
	--     { Text = SOLID_LEFT_ARROW },
	--   },
	--   active_tab_right = wezterm.format {
	--     { Background = { Color = '#0b0022' } },
	--     { Foreground = { Color = '#2b2042' } },
	--     { Text = SOLID_RIGHT_ARROW },
	--   },
	--   inactive_tab_left = wezterm.format {
	--     { Background = { Color = '#0b0022' } },
	--     { Foreground = { Color = '#1b1032' } },
	--     { Text = SOLID_LEFT_ARROW },
	--   },
	--   inactive_tab_right = wezterm.format {
	--     { Background = { Color = '#0b0022' } },
	--     { Foreground = { Color = '#1b1032' } },
	--     { Text = SOLID_RIGHT_ARROW },
	-- 		},
	-- 	},
	}
