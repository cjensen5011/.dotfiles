local wezterm = require("wezterm")
local config = wezterm.config_builder()

-- configs

config.color_scheme = "catppuccin-mocha"

config.font = wezterm.font("JetBrainsMono Nerd Font")
config.font_size = 16

config.enable_tab_bar = false

config.window_decorations = "RESIZE"

config.window_background_opacity = 0.8
config.macos_window_background_blue = 10

return config
