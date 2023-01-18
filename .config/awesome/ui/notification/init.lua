local awful = require("awful")
local ruled = require("ruled")

ruled.notification.connect_signal("request::rules", function()
	-- All notifications will match this rule.
	ruled.notification.append_rule({
		rule = {},
		properties = {
			icon_size = 50,
			screen = awful.screen.preferred,
			implicit_timeout = 5,
			position = "bottom_right",
		},
	})
end)
