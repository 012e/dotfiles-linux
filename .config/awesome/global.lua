gears = require('gears')
awful = require('awful')

function awesome_dir(file)
   return gears.filesystem.get_xdg_config_home() .. "awesome/" .. file
end

local startup_script = awesome_dir("autostart")
local themes_path    = awesome_dir("themes/xresources/theme.lua")

local tiling_layouts = {
    awful.layout.suit.tile,
    awful.layout.suit.floating,
    awful.layout.suit.spiral,
    awful.layout.suit.spiral.dwindle,
    awful.layout.suit.max,
    awful.layout.suit.max.fullscreen,
}

local global  = {
   modkey         = "Mod4",
   term           = "sttmux ~",
   editor         = "nvim",
   startup_script = startup_script,
   themes_path    = themes_path,
   tiling_layouts = tiling_layouts
}

return global
