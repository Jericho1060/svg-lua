# svg-lua

svg lua library *(made for LUA 5.3.4)*

## Installation

You can install the minified version using NPM with NodeJS: `npm i svg-lua`

## usage

To use the installed minified version with `Require "svg-lua"`, you must add the reference for LUA to the file.

Check the `package.path` documentation for more information about it.

```lua
mon_dessin = svg:create()
mon_dessin:add(mon_dessin:Rect())
mon_dessin:draw()
```

result for `print(mon_dessin:draw())` :

```html
<svg width="100" height="100" fill="transparent" stroke="#000000" version="1.1" xmlns="http://www.w3.org/2000/svg">
    <rect y="10" x="10" stroke-width="1" height="10" width="10" rx="0" ry="0" />
</svg>
```

### testing

can be tested [here](https://www.jdoodle.com/execute-lua-online)

to test using the binaries included in the project:

- open a command prompt un the subdirectory `lua5.3.4-win64` *(Shift+Right Click on Windows)*
- type `lua53.exe ..\test.lua`

If you want to save the output in a file to see the result you can add `> result.svg` or `>> result.svg` following the previous command to save the result in an html file:

- `lua53.exe ..\test.lua > result.svg`: this will create a file `result.svg` in the directory with the resul, replacing the file if already exists this can be done using `test.bat`.
- `lua53.exe ..\test.lua >> result.svg`: this will create a file `result.svg` in the directory with the resul, appending result to the existing file if already exists.

If you are using a custom test file, replace `test.lua` by your file name.

### minified version

`svg-min.lua` generated with [luamin](https://github.com/mathiasbynens/luamin) *(Require NodeJS)*
If you installed luamin, you can use the script `minify.bat` included to minify the file `svg.lua` to `svg-min.lua`

## Documentation

### Main methods

**svg:create(width, height, stroke, fill)** *create the svg object*

    - width: number => width of the drawing, default to 100
    - height: number => height of the drawing, default to 100
    - stroke: string => lines color, default to "#000000"
    - fill: string => fill color, default to "transparent"

**svg:add(element)** *add an element to the drawing*

    - element: svg.Element => see farther for element list

**svg:draw()** *return the svg formated string*

### Elements for svg:add(element)

**svg:Text(text, x, y, style, transform)** *add text*

    - text: string => the text to write
    - x: number => Horizontal position, default to 10
    - y: number => Vertical position, default to 50
    - style: string => style of the text (css with svg params), default to:
        * `font-family: Verdana`
        * `font-size: 10`
        * `stroke: self.stroke` svg:create() parameter ("#000000" by default)
        * `fill: self.fill` svg:create() parameter ("transparent" by default)
    - tranform: string => transformation options (eg: rotation)

**svg:Rect(x, y, width, height, stroke, strokeWidth, fill, rx, ry, transform)** *add a rectangle*

    - x: number => Horizontal position from top left corner, default to 10
    - y: number => Vertical position from top left corner, default to 10
    - width: number => Width of the rectangle, default to 10
    - height: number => Height of the rectangle, default to 10
    - stroke: string => lines color, default to svg:create() parameter ("#000000" by default)
    - strokeWidth: string => lines width, default to 1
    - fill: string => fill color, default to svg:create() parameter ("transparent" by default)
    - rx: number => Horizontal raduis of the corners, default to 0
    - ry: number => Vertical radius of the corners, default to 0
    - tranform: string => transformation options (eg: rotation)

**svg:Circle(r, cx, cy, stroke, strokeWidth, fill, transform)** *add a circle*

    - r: number => circle radius, default to 25
    - cx: number => Horizontal position of the center, default to 30
    - cy: number => Vertical position of the center, default to 30
    - stroke: string => lines color, default to svg:create() parameter ("#000000" by default)
    - strokeWidth: string => lines width, default to 1
    - fill: string => fill color, default to svg:create() parameter ("transparent" by default)
    - tranform: string => transformation options (eg: rotation)

**svg:Ellipse(cx, cy, rx, ry, stroke, strokeWidth, fill, transform)** *add an ellipse*

    - cx: number => Horizontal position of the center, default to 30
    - cy: number => Vertical position of the center, default to 30
    - rx: number => Horizontal radius of the ellipse, default to 25
    - ry: number => Vertical radius of the ellipse, default to 15
    - stroke: string => lines color, default to svg:create() parameter ("#000000" by default)
    - strokeWidth: string => lines width, default to 1
    - fill: string => fill color, default to svg:create() parameter ("transparent" by default)
    - tranform: string => transformation options (eg: rotation)

**svg:Line(x1, y1, x2, y2, stroke, strokeWidth, fill)** *add a line*

    - x1: number => Horizontal position of the center, default to 30
    - y1: number => Vertical position of the center, default to 30
    - x2: number => Horizontal radius of the ellipse, default to 25
    - y2: number => Vertical radius of the ellipse, default to 15
    - stroke: string => lines color, default to svg:create() parameter ("#000000" by default)
    - strokeWidth: string => lines width, default to 1
    - fill: string => fill color, default to svg:create() parameter ("transparent" by default)

**svg:Polyline(points, stroke, strokeWidth, fill)** *add a polyline*

    - points: string => all the points of the polyline with the standard svg format  "x1,y1 x2,y2 x3,y3 ..."
    - stroke: string => lines color
    - strokeWidth: string => lines width
    - fill: string => fill color