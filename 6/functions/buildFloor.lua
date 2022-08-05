layer = require("/modules/layer")
select = require("/modules/select")

function buildFloor(x, y, material)
    layer(x, y, function ()
        turtle.digDown()
        select(material)
        turtle.placeDown()    
    end)
end

return buildFloor