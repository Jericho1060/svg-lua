-- INIT SVG Object
svg = {}
svg.__index = svg;

-- function to create a SVG drawing
--      width: number => width of the drawing
--      height: number => height of the drawing
--      stroke: string => lines color
--      fill: string => fill color
function svg:create(width, height, stroke, fill)
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

-- function to get the string formatted for the svg elements whithout the outer <svg>
function svg:innerdraw()
    local svgStr = ""
    for k,v in pairs(self.elements) do
        svgStr = svgStr .. v.strElement
    end
    return svgStr
end

-- function to add text
--      text: string => the text to write
--      x: number => Horizontal position 
--      y: number => Vertical position
--      anchor: string => the text-anchor attribute (start, middle or end)
--      style: string => style of the text (css with svg params)
--      tranform: string => transformation options (eg: rotation)
function svg:Text(text, x, y, anchor, style, transform)
    local options = {
        x = x or 0,
        y = y or 0
    }
    if not (anchor == nil) and not (anchor == "") then
        options["text-anchor"] = anchor
    end
    if not (style == nil) and not (style == "") then
        options.style = style
    end
    if not (transform == nil) and not (transform == "") then
        options.transform = transform
    end
    return self.Element:create("text", options, text)
end
function svg:addText(text, x, y, anchor, style, transform)
    self:add(self:Text(text, x, y, anchor, style, transform))
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
--      transform: string => transformation options (eg: rotation)
function svg:Rect(x, y, width, height, stroke, strokeWidth, fill, rx, ry, transform)
    local options = {
        x = x or 0,
        y = y or 0,
        width = width or 20,
        height = height or 10
    }
    if not (stroke == nil) and not (stroke == "") then
        options.stroke = stroke
    end
    if not (fill == nil) and not (fill == "") then
        options.fill = fill
    end
    if not (strokeWidth == nil) and not (strokeWidth == "") then
        options["stroke-width"] = strokeWidth
    end
    if not (rx == nil) and not (rx == "") then
        options.rx = rx
    end
    if not (ry == nil) and not (ry == "") then
        options.ry = ry
    end
    if not (transform == nil) and not (transform == "") then
        options.transform = transform
    end
    return self.Element:create("rect", options)
end
function svg:addRect(x, y, width, height, stroke, strokeWidth, fill, rx, ry, transform)
    self:add(self:Rect(x, y, width, height, stroke, strokeWidth, fill, rx, ry, transform))
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
    local options = {
        r = r or 25,
        cx = cx or 30,
        cy = cy or 30
    }
    
    if not (stroke == nil) and not (stroke == "") then
        options.stroke = stroke
    end
    if not (strokeWidth == nil) and not (strokeWidth == "") then
        options["stroke-width"] = strokeWidth
    end
    if not (fill == nil) and not (fill == "") then
        options.fill = fill
    end
    if not (transform == nil) and not (transform == "") then
        options.transform = transform
    end
    return self.Element:create("circle", options)
end
function svg:addCircle(r, cx, cy, stroke, strokeWidth, fill, transform)
    self:add(self:Circle(r, cx, cy, stroke, strokeWidth, fill, transform))
end

-- function to create an ellipse
--      cx: number => Horizontal position of the center
--      cy: number => Vertical position of the center
--      rx: number => Horizontal radius of the ellipse
--      ry: number => Vertical radius of the ellipse
--      stroke: string => lines color
--      strokeWidth: string => lines width
--      fill: string => fill color
--      transform: string => transformation options (eg: rotation)
function svg:Ellipse(cx, cy, rx, ry, stroke, strokeWidth, fill, transform)
    local options = {
        rx = rx or 25,
        ry = ry or 15,
        cx = cx or 30,
        cy = cy or 30
    }
    
    if not (stroke == nil) and not (stroke == "") then
        options.stroke = stroke
    end
    if not (strokeWidth == nil) and not (strokeWidth == "") then
        options["stroke-width"] = strokeWidth
    end
    if not (fill == nil) and not (fill == "") then
        options.fill = fill
    end
    if not (transform == nil) and not (transform == "") then
        options.transform = transform
    end
    return self.Element:create("ellipse", options)
end
function svg:addEllipse(cx, cy, rx, ry, stroke, strokeWidth, fill, transform)
    self:add(self:Ellipse(cx, cy, rx, ry, stroke, strokeWidth, fill, transform))
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
    local options = {
        x1 = x1 or 15,
        y1 = y1 or 15,
        x2 = x2 or 50,
        y2 = y2 or 45
    }
    if not (stroke == nil) and not (stroke == "") then
        options.stroke = stroke
    end
    if not (strokeWidth == nil) and not (strokeWidth == "") then
        options["stroke-width"] = strokeWidth
    end
    if not (fill == nil) and not (fill == "") then
        options.fill = fill
    end
    return self.Element:create("line", options)
end
function svg:addLine(x1, y1, x2, y2, stroke, strokeWidth, fill)
    self:add(self:Line(x1, y1, x2, y2, stroke, strokeWidth, fill))
end


-- function ro create a polyline
--      points: string => all the points of the polyline with the standard svg format  "x1,y1 x2,y2 x3,y3 ..."
--      stroke: string => lines color
--      strokeWidth: string => lines width
--      fill: string => fill color
function svg:Polyline(points, stroke, strokeWidth, fill, transform)
    local options = {
        points = points or "10,10 50,50 50,25 75,25"
    }
    
    if not (stroke == nil) and not (stroke == "") then
        options.stroke = stroke
    end
    if not (strokeWidth == nil) and not (strokeWidth == "") then
        options["stroke-width"] = strokeWidth
    end
    if not (fill == nil) and not (fill == "") then
        options.fill = fill
    end
    if not (transform == nil) and not (transform == "") then
        options.transform = transform
    end
    return self.Element:create("polyline", options)
end
function svg:addPolyline(points, stroke, strokeWidth, fill, transform)
    self:add(self:Polyline(points, stroke, strokeWidth, fill, transform))
end

-- function ro create a polyline
--      points: string => all the points of the polyline with the standard svg format  "x1,y1 x2,y2 x3,y3 ..."
--      stroke: string => lines color
--      strokeWidth: string => lines width
--      fill: string => fill color
function svg:Path(d, stroke, strokeWidth, fill, transform)
    local options = {
        d = d or "M50 0 L75 100 L25 100 Z"
    }
    
    if not (stroke == nil) and not (stroke == "") then
        options.stroke = stroke
    end
    if not (strokeWidth == nil) and not (strokeWidth == "") then
        options["stroke-width"] = strokeWidth
    end
    if not (fill == nil) and not (fill == "") then
        options.fill = fill
    end
    if not (transform == nil) and not (transform == "") then
        options.transform = transform
    end
    return self.Element:create("path", options)
end
function svg:addPath(d, stroke, strokeWidth, fill, transform)
    self:add(self:Path(d, stroke, strokeWidth, fill, transform))
end