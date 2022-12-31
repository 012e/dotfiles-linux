local gears = require("gears")
local mytheme = require("global").theme

client.connect_signal("manage", function (c)
    if not c.maximized then
       c.shape = function(cr, w, h)
           gears.shape.rounded_rect(cr, w, h, mytheme.corner_radius)
       end
   end
end)

client.connect_signal("property::maximized", function (c)
   if c.maximized then
       c.shape = gears.shape.rectangle
   else
       c.shape = function(cr, w, h)
           gears.shape.rounded_rect(cr, w, h, mytheme.corner_radius)
       end
   end
end)
