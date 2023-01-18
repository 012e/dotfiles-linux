local beautiful = require("beautiful")

screen.connect_signal("arrange", function(s)
	for _, c in pairs(s.clients) do
		if c.maximized or #s.tiled_clients == 1 then
			c.border_width = 0
		else
			c.border_width = beautiful.border_width
		end
	end
end)
