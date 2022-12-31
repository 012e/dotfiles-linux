pcall(require, "luarocks.loader")
local gears         = require("gears")
local awful         = require("awful")
local wibox         = require("wibox")
local beautiful     = require("beautiful")
local naughty       = require("naughty")
local menubar       = require("menubar")
local hotkeys_popup = require("awful.hotkeys_popup")
local ruled         = require("ruled")

-- Handle errors
require("extras/handle_errors")

-- Global variables setup {{{
global         = require("global")
startup_script = global.startup_script
modkey         = global.modkey
terminal       = global.term
editor         = global.editor
themes_path    = global.themes_path
editor_cmd     = terminal .. " -e " .. editor
-- }}}

-- Keyboard/Mouse setup {{{
mouse         = require("mouse")
keyboard      = require("keyboard")
clientbuttons = mouse.clientbuttons -- Mouse interraction with clients
clientkeys    = keyboard.clientkeys -- Keyboard interraction with clients
mytheme       = require(global.theme)
root.buttons(mouse.bindings)        -- Setup mousebindings
root.keys   (keyboard.bindings)     -- Setup keyboard bindings
-- }}}

-- Auto focus when we change to new tags
require("awful.autofocus") 

-- Startup script
awful.util.spawn(startup_script)

-- Init theme {{{
-- Intentionally block `awesome` until `xrdb` is finished
os.execute("xrdb "..gears.filesystem.get_xdg_config_home().."Xresources") 

beautiful.init(themes_path)
-- }}}

-- Table of layouts to cover with awful.layout.inc, order matters.
awful.layout.layouts = global.tiling_layouts

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


