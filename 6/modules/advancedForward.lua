digUntilClean = require("/modules/digUntilClean")

function advancedForward(amount)
    if not amount then
        amount = 1
    end
    for i = 1, math.floor(amount) do
        digUntilClean()
        turtle.attack()
        turtle.forward()
    end
end

return advancedForward