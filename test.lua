-- INCLUDE THE CURRENT PATH FOR LUA AND REQUIRE THE LIB --
-- DO NOT CHANGE THAT PART --
package.path = package.path .. ";" .. "..\\?.lua"
require "svg-min"
-- END OF LIBRARY IMPORT --

-- TEST IS STARTING HERE -- YOU CAN MODIFY IT --

mon_dessin = svg:create()
mon_dessin:add(mon_dessin:Text("Hello World !!"))
mon_dessin:add(mon_dessin:Rect())
mon_dessin:add(mon_dessin:Circle())
mon_dessin:add(mon_dessin:Ellipse())
mon_dessin:add(mon_dessin:Line())
mon_dessin:add(mon_dessin:Polyline())
print(mon_dessin:draw())