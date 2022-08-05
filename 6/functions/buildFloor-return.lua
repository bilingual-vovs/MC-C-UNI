forward = require("/modules/advancedForward")

function buildFloorReturn(x, y)
    
    if y%2 == 1 then    
        for i = 2, x do
            forward()
        end
    end

    if y%2 == 1 then    
        turtle.turnRight()
    end
    for i = 2, x do
        forward()
    end  
    turtle.turnRight()
end

return buildFloorReturn