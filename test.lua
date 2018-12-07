svg={}svg.__index=svg;function svg:create(a,b,c,d)local e={}setmetatable(e,svg)e.width=a or 100;e.height=height or 100;e.stroke=c or"#000000"e.fill=d or"transparent"e.elements={}e.Element={}e.Element.__index=svg.Element;function e.Element:create(f,g,h)local i={}setmetatable(i,e.Element)i.name=f;i.strElement="<"..f.." "for j,k in pairs(g)do i[j]=k;i.strElement=i.strElement..j.."=\""..k.."\" "end;if h~=nil then i.strElement=i.strElement..">"..h.."</"..f..">"else i.strElement=i.strElement.."/>"end;return i end;return e end;function svg:add(l)table.insert(self.elements,l)end;function svg:draw()local m="<svg width=\""..self.width.."\" height=\""..self.height.."\" fill=\""..self.fill.."\" stroke=\""..self.stroke.."\" version=\"1.1\" xmlns=\"http://www.w3.org/2000/svg\">"for n,o in pairs(self.elements)do m=m..o.strElement end;m=m.."</svg>"return m end;function svg:Text(p,q,s,t,u)return self.Element:create("text",{x=q or 10,y=s or 50,style=t or"font-family: Verdana; font-size: 10; stroke: "..self.stroke.."; fill: "..self.fill..";",transform=u or""},p)end;function svg:Rect(q,s,a,height,c,v,d,w,x,u)return self.Element:create("rect",{x=q or 10,y=s or 10,width=a or 10,height=height or 10,stroke=c or self.stroke,fill=d or self.fill,["stroke-width"]=v or 1,rx=w or 0,ry=x or 0,transform=u or""})end;function svg:Circle(r,y,z,c,v,d,u)return self.Element:create("circle",{r=r or 25,cx=y or 30,cy=z or 30,stroke=c or self.stroke,["stroke-width"]=v or 1,fill=d or self.fill,transform=u or""})end;function svg:Ellipse(y,z,w,x,c,v,d,u)return self.Element:create("ellipse",{rx=r or 25,ry=r or 15,cx=y or 30,cy=z or 30,stroke=c or self.stroke,["stroke-width"]=v or 1,fill=d or self.fill,transform=u or""})end

mon_dessin = svg:create()
mon_dessin:add(mon_dessin:Text("Hello World !!"))
mon_dessin:add(mon_dessin:Rect())
mon_dessin:add(mon_dessin:Circle())
mon_dessin:add(mon_dessin:Ellipse())
print(mon_dessin:draw())