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
    function s.Element:create(name, options)
        local e = {}
        setmetatable(e,s.Element)
        e.name = name
        e.strElement = "<" .. name .. " "
        for key, value in pairs(options) do
            e[key] = value
            e.strElement = e.strElement .. key .. "=\"" .. value .. "\" "
        end
        e.strElement = e.strElement .. "/>"
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
function svg:Rect(x, y, width, height, stroke, strokeWidth, fill, rx, ry)
    return self.Element:create("rect", {
        x = x or 10,
        y = y or 10,
        width = width or 10,
        height = height or 10,
        stroke = stroke or self.stroke,
        fill = fill or self.fill,
        ["stroke-width"] = strokeWidth or 1,
        rx = rx or 0,
        ry = ry or 0
    })
end

-- function to create a circle
--      r: number => circle radius
--      cx: number => Horizontal position of the center
--      cy: number => Vertical position of the center
--      stroke: string => lines color
--      strokeWidth: string => lines width
--      fill: string => fill color
function svg:Circle(r, cx, cy, stroke, strokeWidth, fill)
    return self.Element:create("circle", {
        r = r or 25,
        cx = cx or 30,
        cy = cy or 30,
        stroke = stroke or self.stroke,
        ["stroke-width"] = strokeWidth or 1,
        fill = fill or self.fill
    })
end