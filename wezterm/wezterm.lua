local wezterm = require("wezterm")
local k = require("keys")

local config = {}
config.inactive_pane_hsb = {
  saturation = 0.7,
  brightness = 0.5,
}

config.webgpu_preferred_adapter = {
  backend = 'Vulkan',
  device = 8081,
  device_type = 'DiscreteGpu',
  driver = 'NVIDIA',
  driver_info = '535.183.01',
  name = 'NVIDIA GeForce GTX 1650',
  vendor = 4318,
}

config.colors = {
  tab_bar = {
    -- The color of the strip that goes along the top of the window
    -- (does not apply when fancy tab bar is in use)
    background = '#0b0022',
    inactive_tab_edge = '#575757',

    -- The active tab is the one that has focus in the window
    active_tab = {
      -- The color of the background area for the tab
      bg_color = '#2b2042',
      -- The color of the text for the tab
      fg_color = '#c0c0c0',

      -- Specify whether you want "Half", "Normal" or "Bold" intensity for the
      -- label shown for this tab.
      -- The default is "Normal"
      intensity = 'Normal',

      -- Specify whether you want "None", "Single" or "Double" underline for
      -- label shown for this tab.
      -- The default is "None"
      underline = 'None',

      -- Specify whether you want the text to be italic (true) or not (false)
      -- for this tab.  The default is false.
      italic = false,

      -- Specify whether you want the text to be rendered with strikethrough (true)
      -- or not for this tab.  The default is false.
      strikethrough = true,
    },

    -- Inactive tabs are the tabs that do not have focus
    inactive_tab = {
      bg_color = '#1b1032',
      fg_color = '#808080',
    },

    -- You can configure some alternate styling when the mouse pointer
    -- moves over inactive tabs
    inactive_tab_hover = {
      bg_color = '#3b3052',
      fg_color = '#909090',
      italic = true,
    },

    -- The new tab button that let you create new tabs
    new_tab = {
      bg_color = '#1b1032',
      fg_color = '#808080',
    },

    -- You can configure some alternate styling when the mouse pointer
    -- moves over the new tab button
    new_tab_hover = {
      bg_color = '#3b3052',
      fg_color = '#909090',
      italic = true,
    },
  },
}

return {
  front_end = "WebGpu",
  -- term = "wezterm",
  font = wezterm.font_with_fallback { "Fantasque Sans Mono", "Symbols Nerd Font Mono" },
  font_size = 17,
  hide_tab_bar_if_only_one_tab = false,
  use_fancy_tab_bar = false,
  tab_bar_at_bottom = false,
  show_new_tab_button_in_tab_bar = false,
  enable_scroll_bar = true,
  scrollback_lines = 50000,
  use_cap_height_to_scale_fallback_fonts = true,
  -- color_scheme = 'GruvboxDarkHard',
  color_scheme = 'Kanagawa (Gogh)',
  colors = config.colors,
  disable_default_key_bindings = true,
  inactive_pane_hsb = config.inactive_pane_hsb,
  force_reverse_video_cursor = true,
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
      name = 'ttkap',
      remote_address = '136.243.23.68:15050',
      username = 'ttkap',
      multiplexing = 'None',
    },
  },
  window_frame = {
    font = wezterm.font("Fantasque Sans Mono"),
    font_size = 18,
    inactive_titlebar_bg = "#2b2042",
    active_titlebar_bg = "#2b2042",
  },
  window_background_opacity = 0.8,
  -- window_background_image = '/home/guillaume/Pictures/wallpaper.jpg',
  --   window_background_image_hsb = {
  --   -- Darken the background image by reducing it to 1/3rd
  --   brightness = 0.2,

  --   -- You can adjust the hue by scaling its value.
  --   -- a multiplier of 1.0 leaves the value unchanged.
  --   hue = 0.1,

  --   -- You can adjust the saturation also.
  --   saturation = 0.3,
  --   }
  }
