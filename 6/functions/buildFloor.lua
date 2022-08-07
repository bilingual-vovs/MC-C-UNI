layer = require("/modules/layer")
select = require("/modules/select")

function buildFloor(x, y, material)
    if (x*y-1) > turtle.getFuelLevel()then
        error("Needed fuel" .. (x*y-1))
    end
    layer(x, y, function ()
        turtle.digDown()
        select(material)
        turtle.placeDown()    
    end)
end

return buildFloor