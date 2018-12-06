# svg-lua
svg lua library

# usage
```lua
mon_dessin = svg:create()
mon_dessin:add(mon_dessin:Rect())
mon_dessin:draw()
```

result for `print(mon_dessin:draw)` :
```html
<svg width="100" height="100" fill="transparent" stroke="#000000" version="1.1" xmlns="http://www.w3.org/2000/svg">
    <rect y="10" x="10" stroke-width="1" height="10" width="10" rx="0" ry="0" />
</svg>
```

can be tested [here](https://www.lua.org/cgi-bin/demo)

`svg.min.lua` generated with [Lua Minifier from Mothereff.in](https://mothereff.in/lua-minifier)

# Documentation
**svg:create(width, height, stroke, fill)** *create the svg object*

- width: number => width of the drawing, default to 100
- height: number => height of the drawing, default to 100
- stroke: string => lines color, default to '#000000'
- fill: string => fill color, default to 'transparent'

**svg:add(element)** *add an element to the drawing*

- element: svg.Element => see farther for element list

**svg:draw()** *return the svg formated string*