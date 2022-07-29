forward = require("/modules/advancedForward")
polarTurn = require("/modules/polarTurn")

function clearSquere(x, y, z)
    -- Functions
    
    function clearLayer(dn, up)
        -- Funcs
        function gDig()
            if up then
                turtle.digUp()
            end
            if dn then
                turtle.digDown()
            end
        end
    
        -- Clear
        for b = 1, y-1 do
            for i = 1, x-1 do
                gDig()
                forward()
            end
            polarTurn(b%2)

            gDig()
            forward()
            polarTurn(b%2)
        end

        for i = 1, x-1 do
            gDig()
            forward()
        end

        turtle.turnRight()
        if y%2 == 1 then
            turtle.turnRight()
        end
        gDig()
    end

    -- Fuel calculating

    neededFuel = (x*y-1)*math.ceil(z/3)+z-1
    if neededFuel > turtle.getFuelLevel() then
        error("Not enought fuel: " .. neededFuel .. " is required, but fuel level is " .. turtle.getFuelLevel())
    end

    -- Cleaning
    layersToClean = z
    if layersToClean == 1 then
        clearLayer()
    else
        turtle.digDown()
        turtle.down()
        while layersToClean > 0 do
            if layersToClean > 2 then
                clearLayer(true, true)
                layersToClean = layersToClean - 3
                if layersToClean <= 3 then
                    for i = 1, layersToClean do
                        turtle.digDown()
                        turtle.down()
                    end
                else
                    for i = 1, 3 do
                        turtle.digDown()
                        turtle.down()
                    end
                end
            else
                clearLayer(true, true)
                layersToClean = layersToClean - 2
            end
        end
    end
end

return clearSquere