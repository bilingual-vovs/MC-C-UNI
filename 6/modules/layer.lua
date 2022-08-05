polarTurn = require("/modules/polarTurn")
forward = require("/modules/advancedForward")

function layer(x, y, action)
    for b = 1, y-1 do
        for i = 1, x-1 do
            action({x = b, y = i})
            forward()
        end
        polarTurn(b%2)

        action({x = b, y = i})
        forward()
        polarTurn(b%2)
    end

    for i = 1, x-1 do
        action({x = b, y = i})
        forward()
    end

    turtle.turnRight()
    if y%2 == 1 then
        turtle.turnRight()
    end
    action({x = x, y = y})
end

return layer