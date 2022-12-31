pcall(require, "luarocks.loader")
local gears         = require("gears")
local awful         = require("awful")
local beautiful     = require("beautiful")

-- Handle errors
require("extras/handle_errors")

-- Global variables setup
require("global")

-- Keyboard/Mouse setup {{{
root.buttons(require("mouse").bindings)    -- Setup mouse bindings
root.keys   (require("keyboard").bindings) -- Setup keyboard bindings
-- }}}

-- Auto focus when we change to new tags
require("awful.autofocus") 

-- Startup script
awful.util.spawn(startup_script)

-- Init theme {{{
-- Intentionally block `awesome` until `xrdb` is finished
os.execute("xrdb "..gears.filesystem.get_xdg_config_home().."Xresources") 
-- os.execute("awesome-client 'awesome.restart()' >/dev/null 2>&1")

beautiful.init(mytheme_path)
-- }}}

-- Table of layouts to cover with awful.layout.inc, order matters.
awful.layout.layouts = tiling_layouts

-- Rules to apply to new clients (through the "manage" signal).
awful.rules.rules = require("rules")

-- UI setup {{{
require("ui")
require("ui/mybar")
require("ui/notification")
require("ui/rounded_corner")
require("ui/no_border_for_maximized")

gears.wallpaper.set("#323233")
-- }}}


-- Extra features {{{
require("extras/sloppy_focus")
-- }}}


