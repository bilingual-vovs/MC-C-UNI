function digUpUntilClean()
    while turtle.inspectUp() do
        local lt, data = turtle.inspectUp()
        if data.name == 'minecraft:water' or data.name == 'minecraft:lava'then
            
            break
        end
        turtle.digUp()
    end
end

return digUpUntilClean