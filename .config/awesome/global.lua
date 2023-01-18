local gears = require("gears")
local awful = require("awful")

local function awesome_dir(file)
	return gears.filesystem.get_xdg_config_home() .. "awesome/" .. file
end

tiling_layouts = {
	awful.layout.suit.max,
	awful.layout.suit.max.fullscreen,
	awful.layout.suit.tile,
	awful.layout.suit.floating,
	awful.layout.suit.spiral,
	awful.layout.suit.spiral.dwindle,
}

modkey = "Mod4"
terminal = "sttmux ~"
editor = "nvim"
mytheme = require("themes/default/theme")
mytheme_path = awesome_dir("themes/default/theme.lua")
startup_script = awesome_dir("autostart")
