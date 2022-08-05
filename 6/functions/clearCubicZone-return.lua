forward = require("/modules/advancedForward")


function returnToStartPos(stx, sty, z)

    zIndex = math.ceil(math.abs(z)/3)
    if sty%2 == 0 then
        if stx%2 == 0 then
            pos = zIndex - math.floor((zIndex-1)/4)
        else
            pos = 1
            if (zIndex - 1)%2 == 1 then
                pos = 3
            end
        end
    else
        pos = 4 
        if zIndex%2 == 1 then
            pos = 2
        end
    end
    if pos == 2 then
        for i = 2, stx do
            forward()
        end
        turtle.turnRight()
        for i = 2, sty do
            forward()
        end
        turtle.turnRight()
    elseif pos == 3 then
        turtle.turnRight()
        for i = 2, stx do
            forward()
        end
        turtle.turnRight()
        turtle.turnRight()
    elseif pos == 1 then
        
        for i = 2, sty do
            forward()
        end
        turtle.turnRight()
    end

    if not( math.abs(z) == z) then
        for i = 3, math.abs(z) do
            turtle.digUp()
            turtle.up()
        end 
    elseif z > 1 then
        turtle.down()
    end
end

return returnToStartPos