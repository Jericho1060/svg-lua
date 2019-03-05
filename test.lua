-- INCLUDE THE CURRENT PATH FOR LUA AND REQUIRE THE LIB --
-- DO NOT CHANGE THAT PART --
package.path = package.path .. ";" .. "..\\?.lua"
require "svg-min"
-- END OF LIBRARY IMPORT --

-- TEST IS STARTING HERE -- YOU CAN MODIFY IT --

mon_dessin = svg:create()
mon_dessin:addText("Hello World !!")
mon_dessin:addRect()
mon_dessin:addCircle()
mon_dessin:addEllipse()
mon_dessin:addLine()
mon_dessin:addPolyline()
mon_dessin:addPath()
print(mon_dessin:draw())