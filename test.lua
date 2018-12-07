package.path = package.path .. ";" .. "..\\?.lua"
require "svg"

mon_dessin = svg:create()
mon_dessin:add(mon_dessin:Text("Hello World !!"))
mon_dessin:add(mon_dessin:Rect())
mon_dessin:add(mon_dessin:Circle())
mon_dessin:add(mon_dessin:Ellipse())
print(mon_dessin:draw())