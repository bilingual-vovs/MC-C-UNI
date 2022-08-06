select = require("/modules/select")
digUp = require("/modules/digUpUntilClear")
fd = require("/modules/advancedForward")

function buildWall(x, y, material)
    if (x-1)*2*math.ceil(y/3)+y > turtle.getFuelLevel() then
        error("Not enought fuel: fuel level is " .. turtle.getFuelLevel() .. ",but " .. (x-1)*2*math.ceil(y/3)+y*2 .. " is required, add " .. (x-1)*2*math.ceil(y/3)+y*2 - turtle.getFuelLevel() .. " more!!")
    end
    function up()
        digUp()
        turtle.up()
    end
    function gPlace(up, down)
        if up then
            digUp()
            select(material)
            turtle.placeUp()
        end
        
        if down then
            turtle.digDown()
            select(material)
            turtle.placeDown()
        end
        
        turtle.back()
        turtle.place()
    end

    function buildLayer(up, down)
        for i = 2, x do
            fd()
        end
        for i = 2, x do
            gPlace(up, down)
        end
    end

    layers = y

    
    if layers == 1 then
        buildLayer()
        layers = layers - 1
    elseif layers == 2 then
        buildLayer(true)
        layers = layers - 2
    elseif layers == 3 then
        up()
        buildLayer(true, true)
        layers = layers - 3
        turtle.down()
    else
    
        while layers > 0 do
            if layers == 1 then
                up()
                buildLayer()
                layers = layers - 1
            elseif layers == 2 then
                up()
                buildLayer(true)
                layers = layers - 2
                up()
            else
                if y ~= layers then
                    up()
                end
                up()
                buildLayer(true, true)
                layers = layers - 3
                up()
            end
        end  
        
    end

end

return buildWall