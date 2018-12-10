-- INIT SVG Object
svg = {}
svg.__index = svg;

-- function to create a SVG drawing
--      width: number => width of the drawing
--      height: number => height of the drawing
--      stroke: string => lines color
--      fill: string => fill color
function svg:create(width, heigth, stroke, fill)
    local s = {}
    setmetatable(s,svg)
    s.width = width or 100
    s.height = height or 100
    s.stroke = stroke or "#000000"
    s.fill = fill or "transparent"
    s.elements = {}
    

    -- INIT svg.Element Object
    s.Element = {}
    s.Element.__index = svg.Element

    -- function to create svg.Element
    --      name: string => name of the element (standard svg element name)
    --      options: table => a table containing all the parameters of the element
    function s.Element:create(name, options, content)
        local e = {}
        setmetatable(e,s.Element)
        e.name = name
        e.strElement = "<" .. name .. " "
        for key, value in pairs(options) do
            e[key] = value
            e.strElement = e.strElement .. key .. "=\"" .. value .. "\" "
        end
        if content ~= nil then
            e.strElement = e.strElement .. ">" .. content .. "</" .. name .. ">"
        else
            e.strElement = e.strElement .. "/>"
        end
        return e;
    end

    return s
end

-- function to add an element to the svg drawing
--      element : svg.Element => the element to add to the drawing
function svg:add(element)
    table.insert(self.elements, element)
end

-- function to get the string formatted for the full svg drawing
function svg:draw()
    local svgStr = "<svg width=\"" .. self.width .. "\" height=\"" .. self.height .. "\" fill=\"" .. self.fill .. "\" stroke=\"" .. self.stroke .. "\" version=\"1.1\" xmlns=\"http://www.w3.org/2000/svg\">"
    for k,v in pairs(self.elements) do
        svgStr = svgStr .. v.strElement
    end
    svgStr = svgStr .. "</svg>"
    return svgStr
end

-- function to add text
--      text: string => the text to write
--      x: number => Horizontal position 
--      y: number => Vertical position
--      style: string => style of the text (css with svg params)
--      tranform: string => transformation options (eg: rotation)
function svg:Text(text, x, y, style, transform)
    return self.Element:create("text", {
        x = x or 10,
        y = y or 50,
        style = style or ("font-family: Verdana; font-size: 10; stroke: " .. self.stroke .. "; fill: " .. self.fill .. ";"),
        transform = transform or ""
    }, text)
end

-- function to create a rectangle
--      x: number => Position du rectangle sur l'axe horizontal par rapport au coin supérieur gauche
--      y: number => Position du rectangle sur l'axe vertical par rapport au coin supérieur gauche
--      width: number => Largeur du rectangle
--      height: number => Hauteur du rectangle.
--      stroke: string => lines color
--      strokeWidth: string => lines width
--      fill: string => fill color
--      rx: number => Rayon x des coins du rectangle
--      ry: number => Rayon y des coins du rectangle
--      tranform: string => transformation options (eg: rotation)
function svg:Rect(x, y, width, height, stroke, strokeWidth, fill, rx, ry, transform)
    return self.Element:create("rect", {
        x = x or 10,
        y = y or 10,
        width = width or 10,
        height = height or 10,
        stroke = stroke or self.stroke,
        fill = fill or self.fill,
        ["stroke-width"] = strokeWidth or 1,
        rx = rx or 0,
        ry = ry or 0,
        transform = transform or ""
    })
end

-- function to create a circle
--      r: number => circle radius
--      cx: number => Horizontal position of the center
--      cy: number => Vertical position of the center
--      stroke: string => lines color
--      strokeWidth: string => lines width
--      fill: string => fill color
--      tranform: string => transformation options (eg: rotation)
function svg:Circle(r, cx, cy, stroke, strokeWidth, fill, transform)
    return self.Element:create("circle", {
        r = r or 25,
        cx = cx or 30,
        cy = cy or 30,
        stroke = stroke or self.stroke,
        ["stroke-width"] = strokeWidth or 1,
        fill = fill or self.fill,
        transform = transform or ""
    })
end

-- function to create an ellipse
--      cx: number => Horizontal position of the center
--      cy: number => Vertical position of the center
--      rx: number => Horizontal radius of the ellipse
--      ry: number => Vertical radius of the ellipse
--      stroke: string => lines color
--      strokeWidth: string => lines width
--      fill: string => fill color
--      tranform: string => transformation options (eg: rotation)
function svg:Ellipse(cx, cy, rx, ry, stroke, strokeWidth, fill, transform)
    return self.Element:create("ellipse", {
        rx = r or 25,
        ry = r or 15,
        cx = cx or 30,
        cy = cy or 30,
        stroke = stroke or self.stroke,
        ["stroke-width"] = strokeWidth or 1,
        fill = fill or self.fill,
        transform = transform or ""
    })
end

-- function ro create a line
--      c1: number => Horizontal postion for point 1
--      y1: number => Vertical position for point 1
--      x2: number => Horizontal position for point 2
--      y2: number => Vertical position for point 2
--      stroke: string => lines color
--      strokeWidth: string => lines width
--      fill: string => fill color
function svg:Line(x1, y1, x2, y2, stroke, strokeWidth, fill)
    return self.Element:create("line", {
        x1 = r or 15,
        y1 = r or 15,
        x2 = cx or 50,
        y2 = cy or 45,
        stroke = stroke or self.stroke,
        ["stroke-width"] = strokeWidth or 1,
        fill = fill or self.fill
    })
end