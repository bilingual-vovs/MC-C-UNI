select = require("/modules/select")
digUp = require("/modules/digUpUntilClear")
fd = require("/modules/advancedForward")

function buildRectRoom(x, y, z, material)
    if (x+y-2)*4*math.ceil(z/3)+z > turtle.getFuelLevel() then
        error("Not enought fuel: fuel level is " .. turtle.getFuelLevel() .. ",but " .. (x-1)*2*math.ceil(y/3)+y*2 .. " is required, add " .. (x-1)*2*math.ceil(y/3)+y*2 - turtle.getFuelLevel() .. " more!!")
    end
    function up()
        digUp()
        turtle.up()
        select(material)
        turtle.placeDown()
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
        select(material)
        turtle.place()
    end

    function buildLayer(up, down)
        a = x
        for c = 1, 4 do
            for i = 2, a do
                fd()
            end
            turtle.turnRight()
            if c%2 == 0 then
                a = y
            else
                a = x
            end
        end

        turtle.turnLeft()
        turtle.turnLeft()

        for c = 1, 4 do
            for i = 2, a do
                if not (i == 2 and c ==1) then
                    gPlace(up, down)
                else
                    turtle.back()
                end
            end
            turtle.turnRight()
            if c%2 == 0 then
                a = y
            else
                a = x
            end
        end
        turtle.turnLeft()
        turtle.turnLeft()
        
    end



    layers = z

    
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
        up()
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
                if z ~= layers then
                    up()
                end
                up()
                buildLayer(true, true)
                layers = layers - 3
                up()
            end
        end  
       
    end
    up()

end



return buildRectRoom