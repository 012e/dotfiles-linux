local gears = require('gears')
local awful = require('awful')

local function awesome_dir(file)
   return gears.filesystem.get_xdg_config_home() .. "awesome/" .. file
end

local tiling_layouts = {
    awful.layout.suit.tile,
    awful.layout.suit.floating,
    awful.layout.suit.spiral,
    awful.layout.suit.spiral.dwindle,
    awful.layout.suit.max,
    awful.layout.suit.max.fullscreen,
}

return {
   modkey         = "Mod4",
   term           = "sttmux ~",
   editor         = "nvim",
   theme          = "themes/xresources/theme",
   themes_path    = awesome_dir("themes/xresources/theme.lua"),
   startup_script = awesome_dir("autostart"),
   tiling_layouts = tiling_layouts
}
