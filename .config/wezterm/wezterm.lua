local wezterm                       = require 'wezterm'
local config                        = wezterm.config_builder()

config.color_scheme                 = 'Catppuccin Mocha'
config.font                         = wezterm.font 'Iosevka Nerd Font'
config.font_size                    = 15
config.hide_tab_bar_if_only_one_tab = true
config.window_background_opacity    = 0.95

return config
