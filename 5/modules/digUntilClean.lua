function digUntilClean()
    while turtle.inspect() do
        local lt, data = turtle.inspect()
        if data.name == 'minecraft:water' or data.name == 'minecraft:lava'then
            
            break
        end
        turtle.dig()
    end
end

return digUntilClean